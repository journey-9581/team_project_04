package com.team04.spring.filter;

import java.io.IOException;
import java.net.URLEncoder;

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

@WebFilter(urlPatterns = {"/user/private/*","/gallery/private/*","/freeboard/private/*","/withboard/private/*",
		"/review/place/private/*","/review/food/private/*","/review/secret/private/*","/review/month/private/*","/review/lantour/private/*"})
public class LoginFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		if(id != null) {
			chain.doFilter(request, response);
		}else {
			String url=req.getRequestURI();
			String query=req.getQueryString();
			String encodedUrl=null;
			if(query==null) {
				encodedUrl=URLEncoder.encode(url);
			}else {
				encodedUrl=URLEncoder.encode(url+"?"+query);
			}
			String cPath=req.getContextPath();
			HttpServletResponse res=(HttpServletResponse)response;
			res.sendRedirect(cPath+"/user/loginform.do?url="+encodedUrl);
		}
	}

	@Override
	public void destroy() {
		
	}
	
}
