package com.team04.spring.premium;

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

import com.team04.spring.premium.dto.PremiumDto;
import com.team04.spring.premium.service.PremiumService;

@Controller
public class PremiumController {
   @Autowired
   private PremiumService service;
   
   @RequestMapping("/premium/list")
   public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
      service.getList(mView, request);
      mView.setViewName("premium/list");
      return mView;
   }
   @RequestMapping("/premium/ajax_page")
   public ModelAndView ajaxPage(ModelAndView mView, HttpServletRequest request) {
      service.getList(mView, request);
      mView.setViewName("premium/ajax_page");
      return mView;
   }
   //premium post delete 요청 
   @RequestMapping("/premium/private/delete")
   public String delete(@RequestParam int num) {
      service.deleteContent(num);
      return "premium/private/delete";
   }
   //premium ajax 이미지 업로드 폼 요청
   @RequestMapping("/premium/private/ajax_form")
   public String ajaxForm() {
      
      return "premium/private/ajax_form";
   }
   @RequestMapping(value = "/premium/private/ajax_upload", method=RequestMethod.POST)
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
   @RequestMapping(value = "/premium/private/insert", method=RequestMethod.POST)
   public String insert(PremiumDto dto, HttpSession session) {
      service.addContent(dto, session);
      return "redirect:/premium/list.do";
   }
   @RequestMapping("/premium/detail")
   public ModelAndView detail(@RequestParam int num, ModelAndView mView) {
      service.getDetail(num, mView);
      mView.setViewName("premium/detail");
      return mView;
   }
   @RequestMapping("premium/private/update")
	public String update(@ModelAttribute("dto") PremiumDto dto) {
		service.updateContent(dto);
		return "premium/private/update";
   }
   @RequestMapping("premium/private/updateform")
   public ModelAndView updateform(@RequestParam int num, ModelAndView mView) {
	   service.getDetail(num, mView);
	   mView.setViewName("premium/private/updateform");
	   return mView;
   }
}