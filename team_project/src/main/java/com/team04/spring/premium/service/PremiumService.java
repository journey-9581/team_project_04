package com.team04.spring.premium.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.premium.dto.PremiumDto;

public interface PremiumService {
	public void getList(ModelAndView mView, HttpServletRequest request);	
	public String saveImage(MultipartFile image, HttpServletRequest request);
	public void addContent(PremiumDto dto, HttpSession session);
	public void getDetail(int num, ModelAndView mView);
	public void deleteContent(int num);
	public void updateContent(PremiumDto dto);
}