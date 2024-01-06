package com.m2m.fo.config;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.m2m.fo.util.DateUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
@Order(0)
public class HttpMethodFilter implements Filter {
    //private static final Logger logger = LoggerFactory.getLogger(MethodFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        log.debug("Start RequestFilter checking");
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        long startTime =  System.currentTimeMillis();
        HttpServletRequest req = (HttpServletRequest) request;
        String URI = req.getRequestURI();
        String Method = req.getMethod();
        
        log.debug("#### RequestURI Method execution : [{}][{}][{}] startTime #### ", URI, Method, DateUtil.getFormatCurrentTime(startTime, "yyyy-MM-dd HH:mm:ss.SSS"));
        chain.doFilter(request, response);
        long endTime =  System.currentTimeMillis();
        log.debug("#### RequestURI Method execution : [{}][{}][{}][{}ms] endTime #### ", URI, Method, DateUtil.getFormatCurrentTime(endTime, "YYYY-MM-dd HH:mm:ss.SSS") , endTime - startTime);
    }

    @Override
    public void destroy() {
        log.debug("End RequestFilter checking");
        Filter.super.destroy();
    }
}