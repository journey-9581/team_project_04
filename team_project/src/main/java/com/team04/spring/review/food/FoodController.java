package com.team04.spring.review.food;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team04.spring.review.food.dto.FoodDto;
import com.team04.spring.review.food.service.FoodService;


@Controller
public class FoodController {
	//의존객체 DI
	@Autowired
	private FoodService service;
	

	//글 delete 요청 
	@RequestMapping("/review/food/private/delete")
	public String delete(@RequestParam int num) {
		service.deleteContent(num);
		return "review/food/private/delete";
	}
	//글 update 페이지 요청 처리
	@RequestMapping("review/food/private/update")
	public String update(@ModelAttribute("dto") FoodDto dto) {
		service.updateContent(dto);
		return "review/food/private/update";
	}
	
	//updateform 페이지 요청처리
	@RequestMapping("review/food/private/updateform")
	public ModelAndView updateform(@RequestParam int num, ModelAndView mView) {
		service.getDetail(num, mView);
		mView.setViewName("review/food/private/updateform");
		return mView;
	}
	
	
	//detail 페이지 요청 처리
	@RequestMapping("/review/food/detail")
	public ModelAndView detail(@RequestParam int num,ModelAndView mView) {
		service.getDetail(num, mView);
		mView.setViewName("review/food/detail");
		return mView;
	}
	
	//food 글 목록 요청처리
	@RequestMapping("/review/food/list")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
		service.getList(mView, request);
		mView.setViewName("review/food/list");
		return mView;
	}
	
	//food 새글 추가 폼 요청처리
	@RequestMapping("/review/food/private/insertform")
	public String insertform() {
		return "review/food/private/insertform";
	}
	
	//food 새글 저장 요청처리
	@RequestMapping(value = "/review/food/private/insert",method=RequestMethod.POST )
	public String insert(FoodDto dto,HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		service.saveContent(dto, session);
		return "review/food/private/insert";	/*확인필요*/	
	}
	
	@RequestMapping("/review/food/ajax_page")
	public ModelAndView ajaxPage(ModelAndView mView, HttpServletRequest request) {
		service.getList(mView, request);
		mView.setViewName("review/food/ajax_page");
		return mView;
	}
	
	@RequestMapping(value = "/review/food/private/ajax_upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxUpload(MultipartFile image, HttpServletRequest request){
		//업로드된 이미지를 upload 폴더에 저장하고 경로를 리턴 받는다.
		String imagePath=service.saveImage(image, request);
		//저장된 경로를 JSON 문자열로 응답하기 위해 Map 에 담는다.
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", imagePath);
		//Map  을 리턴해서 JSON 문자열이 응답되도록 한다. {"imagePath":"/upload/xxx.jpg"} 형식
		return map;
	}
}
