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
	
	int pageNum;
	

	@RequestMapping("list")
	String list(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException{
		//폼 전송하면 게시글 작성해야함.
		int count = fqnaService.getCount();
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String tPageNum=request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(tPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(tPageNum);
		}
		model.addAttribute("count", count);
		return "customer/service/list";
	}
	
	//어떤 말머리 게시글 받아올 건지 정하기
	@RequestMapping("practice")
	String practice(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException, UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		int isQnA = Integer.parseInt(request.getParameter("isQnA"));
		List<FQnA> list = null;
		list = fqnaService.getList(pageNum,  isQnA);
		model.addAttribute("list", list);
		
		return "customer/service/bbsListUpdateForm";
	}
	
	//게시글 작성
	@RequestMapping("insert")
	String insert(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		request.setCharacterEncoding("UTF-8");
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

}
