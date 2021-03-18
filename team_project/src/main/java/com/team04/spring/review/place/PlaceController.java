package com.team04.spring.review.place;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.review.place.dto.PlaceDto;
import com.team04.spring.review.place.service.PlaceService;

@Controller
public class PlaceController {
	//의존객체 DI
	@Autowired
	private PlaceService service;
	

	//글 delete 요청 
	@RequestMapping("/review/place/private/delete")
	public String delete(@RequestParam int num) {
		service.deleteContent(num);
		return "review/place/private/delete";
	}
	//글 update 페이지 요청 처리
	@RequestMapping("review/place/private/update")
	public String update(@ModelAttribute("dto") PlaceDto dto) {
		service.updateContent(dto);
		return "review/place/private/update";
	}
	
	//updateform 페이지 요청처리
	@RequestMapping("review/place/private/updateform")
	public ModelAndView updateform(@RequestParam int num, ModelAndView mView) {
		service.getDetail(num, mView);
		mView.setViewName("review/place/private/updateform");
		return mView;
	}
	
	
	//detail 페이지 요청 처리
	@RequestMapping("/review/place/detail")
	public ModelAndView detail(@RequestParam int num,ModelAndView mView) {
		service.getDetail(num, mView);
		mView.setViewName("review/place/detail");
		return mView;
	}
	
	//Place 글 목록 요청처리
	@RequestMapping("/review/place/list")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
		service.getList(mView, request);
		mView.setViewName("review/place/list");
		return mView;
	}
	
	//Place 새글 추가 폼 요청처리
	@RequestMapping("/review/place/private/insertform")
	public String insertform() {
		return "review/place/private/insertform";
	}
	
	//Place 새글 저장 요청처리
	@RequestMapping(value = "/review/place/private/insert",method=RequestMethod.POST )
	public String insert(PlaceDto dto,HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		service.saveContent(dto);
		return "review/place/private/insert";		
	}
}
