package com.team04.spring.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	@RequestMapping("/review/list")
	public String review() {
		return "review/list";
	}	
}
