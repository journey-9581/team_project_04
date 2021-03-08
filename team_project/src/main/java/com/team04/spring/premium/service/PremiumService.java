package com.team04.spring.premium.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.premium.dto.PremiumDto;

public interface PremiumService {

	//글 목록을 얻어오고 페이징처리 ModelAndView 객체에 담아주는 메소드
	public void getList(ModelAndView mView, HttpServletRequest request);
	//글 하나의 정보를 ModelAndView 객체에 담아주는 메소드
	public void getDetail(int num, ModelAndView mView);
	//글 수정
	public void updateContent(PremiumDto dto);
	//글 삭제 
	public void deleteContent(int num);
	
	public String saveImage(MultipartFile image, HttpServletRequest request);
	
	public void saveContent(PremiumDto dto);
}
