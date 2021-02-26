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
	String list(Model model) throws ClassNotFoundException, SQLException{
		//폼 전송하면 게시글 작성해야함.
		return "customer/service/list";
	}
	@RequestMapping("practice")
	String practice(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException, UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		int isQnA = Integer.parseInt(request.getParameter("isQnA"));
		List<FQnA> list = null;
		
		if (isQnA == 0)
			list = fqnaService.getList(1, "TITLE", "", isQnA);
		else
			list = fqnaService.getList(1, "TITLE", "", isQnA);
		
		model.addAttribute("list", list);
		return "customer/service/bbsListUpdateForm";
	}
	
	@RequestMapping("detail")
	String detail() {
		
		return "customer/service/detail";
	}

}
