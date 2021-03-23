package com.team04.spring.filter;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebFilter(urlPatterns = {"/premium/private/*"})
public class PremiumFilter implements Filter{

   @Override
   public void init(FilterConfig filterConfig) throws ServletException {
      
   }

   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
         throws IOException, ServletException {
      HttpServletRequest req=(HttpServletRequest)request;
      HttpSession session=req.getSession();
      String premium=session.getAttribute("premium").toString();
      
      if(premium.equals("yes")) {
         chain.doFilter(request, response);
      }else {
         response.setContentType("text/html; charset=euc-kr");
         PrintWriter out = response.getWriter();
         out.println("<script language='javascript'>");
         out.println("alert('유료 회원 결제 후 글 작성 및 편집이 가능합니다'); history.go(-1);");
         out.println("</script>");
         out.flush();
      }
   }

   @Override
   public void destroy() {
      
   }

}