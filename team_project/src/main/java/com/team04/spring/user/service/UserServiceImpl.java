package com.team04.spring.user.service;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.user.dao.UserDao;
import com.team04.spring.user.dto.UserDto;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao dao;
	
	//회원 가입 처리 메소드
	@Override
	public void addUser(UserDto dto) {
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(dto.getPwd());
		dto.setPwd(encodedPwd);
		dao.insert(dto);
	}
	
	//아이디 존재 여부 리턴 메소드
	@Override
	public boolean isExistId(String inputId) {
		return dao.isExist(inputId);
	}
	
	//로그인폼 관련 처리 메소드
	@Override
	public void loginformLogic(HttpServletRequest request, ModelAndView mView) {
		String url=request.getParameter("url");
		if(url==null) {
			String cPath=request.getContextPath();
			url=cPath+"/home.do";
		}
		String savedId="";
		String savedPwd="";
		
		Cookie[] cookies=request.getCookies();
		if(cookies!=null);{
			for(Cookie tmp:cookies) {
				String key=tmp.getName();
				if(key.equals("savedId")) {
					savedId=tmp.getValue();
				}
				if(key.equals("savedPwd")) {
					savedPwd=tmp.getValue();
				}
			}
		}
		mView.addObject("url", url);
		mView.addObject("savedId", savedId);
		mView.addObject("savedPwd", savedPwd);
	}

	//로그인 관련 처리 메소드
	@Override
	public void loginLogic(HttpServletRequest request, HttpServletResponse response) {
		String url=request.getParameter("url");
		String encodedUrl=URLEncoder.encode(url);
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		boolean isValid=false;
		
		String savedPwd=dao.getPwd(id);
		if(savedPwd!=null) {
			isValid=BCrypt.checkpw(pwd, savedPwd);
		}
		
		if(isValid) {
			request.getSession().setAttribute("id", id);
		}
		
		String isSave=request.getParameter("isSave");
		
		if(isSave == null) {
			Cookie idCookie=new Cookie("savedId", id);
			idCookie.setMaxAge(0);
			response.addCookie(idCookie);
			
			Cookie pwdCookie=new Cookie("savedPwd", pwd);
			pwdCookie.setMaxAge(0);
			response.addCookie(pwdCookie);
		}else {
			Cookie idCookie=new Cookie("savedId", id);
			idCookie.setMaxAge(60*60*24);
			response.addCookie(idCookie);
			
			Cookie pwdCookie=new Cookie("savedPwd", pwd);
			pwdCookie.setMaxAge(60*60*24);
			response.addCookie(pwdCookie);
		}
		request.setAttribute("encodedUrl", encodedUrl);
		request.setAttribute("url", url);
		request.setAttribute("isValid", isValid);
	}

	//개인 정보를 ModelAndView 객체에 담아주는 메소드
	@Override
	public void getInfo(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		UserDto dto=dao.getData(id);
		mView.addObject("dto", dto);
	}

	//개인 정보를 삭제 하는 메소드
	@Override
	public void deleteUser(HttpSession session) {
		String id=(String)session.getAttribute("id");
		dao.delete(id);
		session.removeAttribute("id");
	}

	//비밀번호 수정 처리 후 성공 여부를 ModelAndView 객체에 담아주는 메소드
	@Override
	public void updateUserPwd(ModelAndView mView, UserDto dto, HttpSession session) {
		String id=(String)session.getAttribute("id");
		String savedPwd=dao.getPwd(id);
		boolean isValid=BCrypt.checkpw(dto.getPwd(), savedPwd);
		
		if(isValid) {
			String newPwd=new BCryptPasswordEncoder().encode(dto.getNewPwd());
			dto.setId(id);
			dto.setNewPwd(newPwd);
			dao.updatePwd(dto);
			session.removeAttribute("id");
		}
		mView.addObject("isSuccess", isValid);
	}

	//프로필 이미지를 upload 폴더에 저장하고 저장된 파일명을 DB에 저장하는 메소드
	@Override
	public void saveProfileImage(MultipartFile image, HttpServletRequest request) {
		String orgFileName=image.getOriginalFilename();
		String realPath=request.getServletContext().getRealPath("/upload");
		
		File f=new File(realPath);
		if(!f.exists()) {
			f.mkdir();
		}
		
		String saveFileName=System.currentTimeMillis()+orgFileName;
		String path=realPath+File.separator+saveFileName;
		try {
			image.transferTo(new File(path));
		}catch(Exception e) {
			e.printStackTrace();
		}
		String profile="/upload/"+saveFileName;
		String id=(String)request.getSession().getAttribute("id");
		UserDto dto=new UserDto();
		dto.setId(id);
		dto.setProfile(profile);
		dao.updateProfile(dto);
	}

	//개인 정보를 수정하는 메소드
	@Override
	public void updateUser(UserDto dto, HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		dao.update(dto);
	}
}
