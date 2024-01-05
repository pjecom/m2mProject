package com.m2m.bo.co.service;

import java.util.List;

import com.m2m.bo.co.model.MenuTreeVO;
import com.m2m.bo.co.model.MenuVO;

public interface MenuService {
	List<MenuTreeVO> getListMenu(MenuTreeVO menuVo) throws Exception;
	
	List<MenuVO> getSideBarMenu(String userId) throws Exception;
}
