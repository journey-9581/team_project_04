package com.team04.spring.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		if(premium == "yes") {
			chain.doFilter(request, response);
		}else {
			HttpServletResponse res=(HttpServletResponse)response;
			String cPath=req.getContextPath();
			res.sendRedirect(cPath+"/");
			
			PrintWriter out=response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('유료 회원 결제 후 글 작성 및 편집이 가능합니다')");
			out.println("</script>");
			out.flush();
		}
	}

	@Override
	public void destroy() {
		
	}

}
