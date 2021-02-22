package com.team04.spring.freeboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.freeboard.dto.FreeBoardDto;
import com.team04.spring.freeboard.service.FreeBoardService;



@Controller
public class FreeBoardController {
	//의존객체 DI
	@Autowired
	private FreeBoardService service;
	
	//freeboard 글 목록 요청처리
	@RequestMapping("/freeboard/list")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
		
		//mView.setViewName("freeboard/list");
		return mView;
	}
	
	//freeboard 새글 추가 폼 요청처리
	@RequestMapping("/freeboard/private/insertform")
	public String insertform() {
		return "freeboard/private/insertform";
	}
	
	//freeboard 새글 저장 요청처리
	@RequestMapping(value = "/freeboard/private/insert",method=RequestMethod.POST )
	public String insert(FreeBoardDto dto,HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		service.saveContent(dto);
		return "freeboard/private/insert";		
	}
	
	
	
	
	
	
}
