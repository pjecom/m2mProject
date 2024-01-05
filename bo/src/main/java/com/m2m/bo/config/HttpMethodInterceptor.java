package com.m2m.bo.config;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class HttpMethodInterceptor extends WebContentInterceptor {
	@Autowired
	MessageSource message;


	/*
	 * @param request
	 * @param response
	 * @param handler
	 * @return
	 * @throws ServletException
	 * @see org.springframework.web.servlet.mvc.WebContentInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException{
		try {
			StringBuilder errorStr = new StringBuilder(StringUtils.EMPTY);
			String forwardUrl = "/login/sessionExpired";
			if(request.getRequestURI().contains("/login/getToken") || request.getRequestURI().contains("/login/loginView") || request.getRequestURI().contains("/Common/getUserInfo")
					|| request.getRequestURI().contains("/bo/ma/dashboard/order") || request.getRequestURI().contains("/bo/ma/dashboard/limitOrder") || request.getRequestURI().contains("/bo/trckDashboard/viewTrckDashboard") 
					|| request.getRequestURI().contains("/bo/ma/callTest") || request.getRequestURI().contains("/bo/ma/foCallTest"))
				return true;
			if(request.getSession().getAttribute("USER") == null && !request.getRequestURI().contains("/login/sessionExpired") && request.getRequestURI().indexOf(".") == -1) {
				if(isAjaxRequest(request)) {
					//response.setStatus(HttpServletResponse.SC_FORBIDDEN);
					response.setStatus(999);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().write("서버와의 연결이 종료되어 time초 후 새로고침합니다.&" + request.getRequestURI().toString());
					response.getWriter().write(errorStr.toString());
					response.getWriter().flush();

					return false;
				}
 				response.addHeader("url", request.getRequestURI());
				request.getServletContext().getRequestDispatcher(forwardUrl).forward(request, response);

				return false;
			}
			return true;
		} catch (IOException e) {
			e.getMessage();
		}
		return true;
	}

	private boolean isAjaxRequest(HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		return "XMLHttpRequest".equals(header);
	}
}
