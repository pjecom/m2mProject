package com.m2m.bo.co.mapper;

import java.util.List;
import java.util.Map;

import com.m2m.bo.co.model.MenuTreeVO;
import com.m2m.bo.co.model.MenuVO;

public interface MenuMapper {
	List<MenuTreeVO> getListMenu(MenuTreeVO menuVo) throws Exception;
	
	List<MenuVO> getSideBarMenu(Map map) throws Exception;
}
