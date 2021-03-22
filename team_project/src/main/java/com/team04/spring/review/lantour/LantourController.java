package com.team04.spring.review.lantour;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.review.lantour.dto.LantourDto;
import com.team04.spring.review.lantour.service.LantourService;

@Controller
public class LantourController {
	//의존객체 DI
	@Autowired
	private LantourService service;
	

	//글 delete 요청 
	@RequestMapping("/review/lantour/private/delete")
	public String delete(@RequestParam int num) {
		service.deleteContent(num);
		return "review/lantour/private/delete";
	}
	//글 update 페이지 요청 처리
	@RequestMapping("review/lantour/private/update")
	public String update(@ModelAttribute("dto") LantourDto dto) {
		service.updateContent(dto);
		return "review/lantour/private/update";
	}
	
	//updateform 페이지 요청처리
	@RequestMapping("review/lantour/private/updateform")
	public ModelAndView updateform(@RequestParam int num, ModelAndView mView) {
		service.getDetail(num, mView);
		mView.setViewName("review/lantour/private/updateform");
		return mView;
	}
	
	
	//detail 페이지 요청 처리
	@RequestMapping("/review/lantour/detail")
	public ModelAndView detail(@RequestParam int num,ModelAndView mView) {
		service.getDetail(num, mView);
		mView.setViewName("review/lantour/detail");
		return mView;
	}
	
	//Lantour 글 목록 요청처리
	@RequestMapping("/review/lantour/list")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
		service.getList(mView, request);
		mView.setViewName("review/lantour/list");
		return mView;
	}
	
	//Lantour 새글 추가 폼 요청처리
	@RequestMapping("/review/lantour/private/insertform")
	public String insertform() {
		return "review/lantour/private/insertform";
	}
	
	//Lantour 새글 저장 요청처리
	@RequestMapping(value = "/review/lantour/private/insert",method=RequestMethod.POST )
	public String insert(LantourDto dto,HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		service.saveContent(dto, session);
		return "review/lantour/private/insert";	/*확인필요*/	
	}
	
	@RequestMapping("/review/lantour/ajax_page")
	public ModelAndView ajaxPage(ModelAndView mView, HttpServletRequest request) {
		service.getList(mView, request);
		mView.setViewName("review/lantour/ajax_page");
		return mView;
	}
	
	@RequestMapping(value = "/review/lantour/private/ajax_upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxUpload(MultipartFile image, HttpServletRequest request){
		//업로드된 이미지를 upload 폴더에 저장하고 경로를 리턴 받는다.
		String imagePath=service.saveImage(image, request);
		//저장된 경로를 JSON 문자열로 응답하기 위해 Map 에 담는다.
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", imagePath);
		//Map  을 리턴해서 JSON 문자열이 응답되도록 한다. {"imagePath":"/upload/xxx.jpg"} 형식
		return map;
	}
}
