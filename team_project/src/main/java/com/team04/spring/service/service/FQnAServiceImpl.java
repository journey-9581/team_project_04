package com.team04.spring.service.service;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;

import com.team04.spring.service.dao.*;
import com.team04.spring.service.dto.*;


@Service
public class FQnAServiceImpl implements FQnAService{
//	private String url = "jdbc:oracle:thin:@localhost:1521/xe";
//	private String uid = "C#scott";
//	private String pwd = "tiger";
//	private String driver = "oracle.jdbc.driver.OracleDriver";

	@Autowired
	private FQnAServiceDao serviceDao;
	
	public void getList(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException, UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		int isQnA = 0;
		if (request.getParameter("isQnA") != null) {
			isQnA = Integer.parseInt(request.getParameter("isQnA")); //(3)에서 넘긴 a값
		}
		model.addAttribute("isQnA", isQnA);
		
		//js로 null check 해줬으니 java에선 가져와 사용한다.
		int pageNum = 1;
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum")); //(3)에서 넘긴 pageNum값
		}
		model.addAttribute("pageNum", pageNum);
		
		//폼 전송하면 게시글 작성해야함.
		int count = serviceDao.getCount(isQnA);
		model.addAttribute("count", count);
		
		int startPage = pageNum*10-10+1;
		int endPage = pageNum*10;
		HashMap<String, Integer> map = new HashMap<>();
		map.put("isQnA", isQnA);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		//(5) 페이지에 보여줄 게시글 리스트 데이터를 오라클에서 가져온다.
		List<FQnADto> list = null;
		list = serviceDao.getList(map);
		model.addAttribute("list", list);
	}

	public void insert(HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String userID = null;
		if (session.getAttribute("id") != null){
			userID = (String) session.getAttribute("id");
		} else {
			return;
		}
		
		int secrete = 0; //0 공개글, 1비밀글
		if (request.getParameter("secrete") != null)
			secrete=1;
		
		int bbsType = 0; //0 QnA, 1FnA .
		if (request.getParameter("bbsType") != null) 
			bbsType=1;
		
		FQnADto dto = new FQnADto();
		dto.setWriterId(userID);
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setSecrete(secrete);
		dto.setBbsType(bbsType);
		
		serviceDao.insert(dto);
	}
	
	public FQnADto detail(int num) throws SQLException {
		FQnADto dto=serviceDao.detail(num);
		return dto;
	}
	
	public void reply(HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String userID = null;
		if (session.getAttribute("id") != null){
			userID = (String) session.getAttribute("id");
		} else {
			return;
		}
		
		int secrete = 0; //0 공개글, 1비밀글
		if (request.getParameter("secrete") != null)
			secrete=1;

		
		FQnADto dto = new FQnADto();
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setSecrete(secrete);
		
		
		serviceDao.reply(dto);
	}
	
	public void update(FQnADto dto, HttpServletRequest request) throws SQLException, ClassNotFoundException {
		serviceDao.update(dto);
		request.setAttribute("num", request.getParameter("num"));
			}
	
	public void delete(int num) throws ClassNotFoundException, SQLException {
		serviceDao.delete(num);
}
}