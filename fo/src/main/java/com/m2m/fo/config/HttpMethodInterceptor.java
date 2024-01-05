package com.m2m.fo.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class HttpMethodInterceptor implements HandlerInterceptor {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		if (null != modelAndView) {
			String viewName = modelAndView.getViewName();
			if ("GET".equals(request.getMethod())) {
				if (viewName.indexOf("noTiles") > -1) {
					modelAndView.setViewName(viewName + ".notiles");
				} else if (viewName.indexOf("bdTiles") > -1) {
					modelAndView.setViewName(viewName + ".bdtiles");
				} else if (viewName.indexOf("/bid") > -1) {
					modelAndView.setViewName(viewName);
				} else if (viewName.indexOf(".tiles") == -1) {
					modelAndView.setViewName(viewName + ".tiles");
				} 
			} else if ("POST".equals(request.getMethod())) {
				if (viewName.indexOf("redirect") > -1) {
					modelAndView.setViewName(viewName + ".tiles");
				} else if (viewName.indexOf("bdTiles") > -1) {
					modelAndView.setViewName(viewName + ".bdtiles");
				}
			}
		}

		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

}
