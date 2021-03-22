package com.team04.spring.review.food.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.review.food.dto.FoodDto;

public interface FoodService {
	//새글을 저장하는 메소드
	public void saveContent(FoodDto dto, HttpSession session);
	//글 목록을 얻어오고 페이징처리 ModelAndView 객체에 담아주는 메소드
	public void getList(ModelAndView mView, HttpServletRequest request);
	//글 하나의 정보를 ModelAndView 객체에 담아주는 메소드
	public void getDetail(int num, ModelAndView mView);
	//글 수정
	public void updateContent(FoodDto dto);
	//글 삭제 
	public void deleteContent(int num);
	//썸네일 이미지 저장
	public String saveImage(MultipartFile image, HttpServletRequest request);
	
}	
