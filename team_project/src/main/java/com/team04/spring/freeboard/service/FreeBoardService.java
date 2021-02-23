package com.team04.spring.freeboard.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.freeboard.dto.FreeBoardDto;

public interface FreeBoardService {
	//새글을 저장하는 메소드
	public void saveContent(FreeBoardDto dto);
	//글 목록을 얻어오고 페이징처리 ModelAndView 객체에 담아주는 메소드
	public void getList(ModelAndView mView, HttpServletRequest request);
	//글 하나의 정보를 ModelAndView 객체에 담아주는 메소드
	public void getDetail(int num, ModelAndView mView);
}
