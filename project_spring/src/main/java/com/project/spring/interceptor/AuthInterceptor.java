package com.project.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.spring.vo.MemberVo;



public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVo memberVo=(MemberVo)session.getAttribute("loginMemberVo");
		
		if(memberVo == null) {
			String returnURI = request.getRequestURI();
			String queryString = request.getQueryString();
			if (queryString!=null) {
				returnURI = returnURI + "?" + queryString;
			}
			session.setAttribute("returnURI", returnURI);
			response.sendRedirect("/spring/member/login");			
			return false;
		}else {
			if(request.getRequestURI().contains("/admin")){
				if(memberVo.getMember_id().equals("admin")) {
					return true;
				}
				response.sendRedirect("/spring/member/login");
				return false;
			}
			return true;	
		}
	}
	
}
