package com.team04.spring.freeboard;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class FreeBoardController {
	//의존객체 DI
	//@Autowired
	//private FreeBoardService service;
	
	//freeboard 글 목록 요청처리
	@RequestMapping("/freeboard/list")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
		
		//mView.setViewName("freeboard/list");
		return mView;
	}
	
	@RequestMapping("/freeboard/private/insertform")
	public String insertform() {
		return "freeboard/private/insertform";
	}
	
	
}
