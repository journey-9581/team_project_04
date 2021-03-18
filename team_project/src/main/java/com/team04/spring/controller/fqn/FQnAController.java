package com.team04.spring.controller.fqn;

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
	String list(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException{
		//폼 전송하면 게시글 작성해야함.
		int count = fqnaService.getCount();
		
		model.addAttribute("count", count);
		return "customer/service/list";
	}
	
	//(4) 어떤 말머리 게시글 받아올 건지 정하기
	@RequestMapping("practice")
	String practice(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException, UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		int isQnA = Integer.parseInt(request.getParameter("isQnA")); //(3)에서 넘긴 a값
		
		//js로 null check 해줬으니 java에선 가져와 사용한다.
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); //(3)에서 넘긴 pageNum값
		
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
		System.out.println("ㅎㅇ");
		int secrete = 0; //0 공개글, 1비밀글
		if (request.getParameter("secrete") != null)
			secrete=1;
		
		FQnA dto = new FQnA();
		dto.setTitle(request.getParameter("title"));
		dto.setWriterId("wockd9600");
		dto.setContent(request.getParameter("content"));
		dto.setSecrete(secrete);
		fqnaService.insert(dto);

		return "redirect:list.do";
	}
	
	@RequestMapping("detail")
	String detail(@RequestParam int num, Model model) throws SQLException {
		FQnA dto = null;
		dto = fqnaService.detail(num);
		model.addAttribute("dto", dto);
		return "customer/service/detail";
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
		System.out.println("?");
		fqnaService.delete(num);
		return "redirect:list.do";
	}

}
