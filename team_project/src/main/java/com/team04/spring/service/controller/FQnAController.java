package com.team04.spring.service.controller;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.team04.spring.service.*;
import com.team04.spring.service.entity.*;


@Controller
@RequestMapping("/customer/service/")
public class FQnAController {

	@Autowired
	FQnAService fqnaService;
	
	

	@RequestMapping("list")
	String list() throws ClassNotFoundException, SQLException{
		
		return "customer/service/list";
	}
	
	//(4) 어떤 말머리 게시글 받아올 건지 정하기
	@RequestMapping("practice")
	String practice(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException, UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		int isQnA = Integer.parseInt(request.getParameter("isQnA")); //(3)에서 넘긴 a값
		
		//js로 null check 해줬으니 java에선 가져와 사용한다.
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); //(3)에서 넘긴 pageNum값
		
		//폼 전송하면 게시글 작성해야함.
		int count = fqnaService.getCount(isQnA);
				
		model.addAttribute("count", count);
		
		//(5) 페이지에 보여줄 게시글 리스트 데이터를 오라클에서 가져온다.
		List<FQnA> list = null;
		list = fqnaService.getList(pageNum,  isQnA);
		model.addAttribute("list", list);
		
		//(6) 아래 주소로 넘긴다.
		return "customer/service/bbsListUpdateForm";
	}
	
	//게시글 작성
	@RequestMapping("insert")
	String insert(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		request.setCharacterEncoding("UTF-8");
		int secrete = 0; //0 공개글, 1비밀글
		if (request.getParameter("secrete") != null)
			secrete=1;
		
		int bbsType = 0; //0 QnA, 1FnA .
		if (request.getParameter("bbsType") != null)
			bbsType=1;
		
		HttpSession session = request.getSession();
		
		String userID = null;
		if (session.getAttribute("id") != null){
			userID = (String) session.getAttribute("id");
		} else {
			return "redirect:list.do";
		}
		
		FQnA dto = new FQnA();
		dto.setTitle(request.getParameter("title"));
		dto.setWriterId(userID);
		dto.setContent(request.getParameter("content"));
		dto.setSecrete(secrete);
		dto.setBbsType(bbsType);
		fqnaService.insert(dto);

		return "redirect:list.do";
	}
	
	@RequestMapping("detail")
	String detail(@RequestParam int num, Model model, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		
		HttpSession session = request.getSession();
		String userID = "";
		if (session.getAttribute("id") != null){
			userID = (String) session.getAttribute("id");
		}
		String manage = "";
		if (session.getAttribute("manage") != null){
			manage = (String) session.getAttribute("manage");
			model.addAttribute("manage", manage);
		}
		
		
		
		FQnA dto = null;
		dto = fqnaService.detail(num);
		
		if (userID.equals(dto.getWriterId()) || dto.getSecrete() == 0 || manage.equals("yes")) {
			model.addAttribute("dto", dto);
			return "customer/service/detail";
		}
		else {
			return "customer/service/permission";
		}
	}
	
	//F&A insert
	@RequestMapping("insertf")
	String insertf() {
		return "customer/service/insertfna";
	}
	
	
	@RequestMapping("reply")
	String reply(HttpServletRequest request) throws SQLException, ClassNotFoundException {
		int num = Integer.parseInt(request.getParameter("num"));
		int secrete = 0; //0 공개글, 1비밀글
		if (request.getParameter("secrete") != null)
			secrete=1;
		
		FQnA dto = new FQnA();
		dto.setTitle(request.getParameter("title"));
		dto.setWriterId("관리자");
		dto.setContent(request.getParameter("content"));
		dto.setSecrete(secrete);
		
		fqnaService.reply(num, dto);
		
		return "redirect:list.do";
	}
	@RequestMapping("delete")
	String delete(@RequestParam int num) throws SQLException, ClassNotFoundException {
		fqnaService.delete(num);
		return "redirect:list.do";
	}

}
