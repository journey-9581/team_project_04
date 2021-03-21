package com.team04.spring.service;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.team04.spring.service.dto.*;
import com.team04.spring.service.service.*;


@Controller
@RequestMapping("/customer/service/")
public class FQnAController {

	@Autowired
	FQnAService fqnaService;
	
	

	@RequestMapping("list")
	String list(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException, UnsupportedEncodingException{
		fqnaService.getList(model, request);
		return "customer/service/list";
	}
	
	//게시글 작성
	@RequestMapping(value = "insert", method=RequestMethod.POST)
	String insert(HttpServletRequest request) throws ClassNotFoundException, SQLException, IOException {
		fqnaService.insert(request);
		return "redirect:list.do";
	}
	
	@RequestMapping("detail")
	String detail(@RequestParam int num, Model model, HttpServletRequest request) throws SQLException, IOException {
		HttpSession session = request.getSession();
		String userID = "";
		if (session.getAttribute("id") != null){
			userID = (String) session.getAttribute("id");
		}
		String manage = "";
		if (session.getAttribute("manage") != null){
			manage = (String) session.getAttribute("manage");
		}
		
		FQnADto dto = null;
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
	
	//F&A updatef
	@RequestMapping("updatef")
	String updatef(HttpServletRequest request, Model model) throws SQLException {
		int num = Integer.parseInt(request.getParameter("num"));
		FQnADto dto = null;
		fqnaService.detail(num);
		model.addAttribute("dto", dto);
		return "customer/service/update";
	}
	
	//F&A update
	@RequestMapping("update")
	String update(HttpServletRequest request, FQnADto dto) throws SQLException, ClassNotFoundException {
		fqnaService.update(dto, request);
		return "forward:detail.do";
	}
	
	//QnA reply
	@RequestMapping("reply")
	String reply(HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
		fqnaService.reply(request);
		return "redirect:list.do";
	}
	
	//delete
	@RequestMapping("delete")
	String delete(@RequestParam int num) throws SQLException, ClassNotFoundException {
		fqnaService.delete(num);
		return "redirect:list.do";
	}

}
