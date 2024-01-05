package com.m2m.bo.co.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.m2m.bo.co.service.MenuService;
import com.m2m.bo.login.model.Account;
import com.m2m.bo.co.comm.BoCoConstants;
import com.m2m.bo.co.model.MenuTreeVO;
import com.m2m.bo.co.model.MenuVO;

import ch.qos.logback.classic.Logger;
import lombok.extern.slf4j.Slf4j;

/**
 * MenuController.java
 * @version
 */
@Slf4j
@Controller
@RequestMapping("/bo/Menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	/**
	 * <pre>
	 * 처리내용: 메뉴 관리 페이지를 보여준다.
	 * </pre>
	 * @param menuVo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/viewMenu")
	public String viewMenu(MenuTreeVO menuVo, ModelMap model) {
		try {
			
			return "co/menuList";
		}catch (Exception e) {
			log.error(e.getMessage());
			
			return "error/503";
		}
	}
	
	
	/**
	 * <pre>
	 * 처리내용: sidebar 메뉴 리스트를 조회한다.
	 * </pre>
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/getSideBarMenu")
	public ResponseEntity<Object> getSideBarMenu(HttpServletRequest request) throws Exception {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		Account account = (Account) request.getSession().getAttribute("USER");
		
		/*
		 * 사용자 권한에 따른 사이드 메뉴 리스트 조회 
		 * Account account = (Account) request.getSession().getAttribute("USER");
		 * List<MenuVO> menuList = menuService.getAuthSideBarMenu(account);
		 */
		List<MenuVO> menuList;
		
		menuList = menuService.getSideBarMenu(account.getId()); //권한 없이 사이드 메뉴 모두 조회

		map.put("menuList", menuList);
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
}
