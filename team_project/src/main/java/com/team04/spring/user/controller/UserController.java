package com.team04.spring.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.user.dto.UserDto;
import com.team04.spring.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	//회원 가입 선택
	@RequestMapping("/user/signupform_select")
	public String signupformSelect() {
		return "user/signupform_select";
	}
	
	//무료 회원 가입 폼 요청 처리
	@RequestMapping("/user/signupform_nonpay")
	public String signupformNonpay() {
		return "user/signupform_nonpay";
	}
	
	//유료 회원 가입 폼 요청 처리
	@RequestMapping("/user/signupform_pay")
	public String signupformPay() {
		return "user/signupform_pay";
	}
	
	//회원 가입 요청 처리
	@RequestMapping(value = "/user/signup", method = RequestMethod.POST)
	public String signup(@ModelAttribute("dto") UserDto dto) {
		service.addUser(dto);
		return "user/signup";
	}
	
	//ajax 요청 처리
	@RequestMapping("/user/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId, ModelAndView mView) {
		boolean isExist=service.isExistId(inputId);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isExist", isExist);
		return map;
	}
	
	//로그인 폼 요청 처리
	@RequestMapping("/user/loginform")
	public ModelAndView loginform(HttpServletRequest request, ModelAndView mView) {
		service.loginformLogic(request, mView);
		mView.setViewName("user/loginform");
		return mView;
	}
	
	//로그인 요청 처리
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		service.loginLogic(request, response);
		return "user/login";
	}
	
	//로그아웃 요청 처리
	@RequestMapping("/user/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "user/logout";
	}
	
	//개인정보 보기 요청처리
	@RequestMapping("/user/private/info")
	public ModelAndView info(ModelAndView mView, HttpSession session) {
		service.getInfo(mView, session);
		mView.setViewName("user/private/info");
		return mView;
	}
}
