package com.m2m.bo.co.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m2m.bo.co.comm.BoCoConstants;
import com.m2m.bo.co.mapper.MenuMapper;
import com.m2m.bo.co.model.MenuTreeVO;
import com.m2m.bo.co.model.MenuVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuMapper menuMapper;

	
	/**
	 *	메뉴 리스트를 조회한다.
	 */
	@Override
	public List<MenuTreeVO> getListMenu(MenuTreeVO menuVo) throws Exception {
		log.debug("menuVo ===> " + menuVo);
		List<MenuTreeVO>  menuList = menuMapper.getListMenu(menuVo);

		if(StringUtils.equals(BoCoConstants.SYS_SE_CODE_BO, menuVo.getSysSeCode())) {
			MenuTreeVO rootMenu = new MenuTreeVO(BoCoConstants.MENU_ROOT_BO_ID, BoCoConstants.MENU_ROOT_BO_NAME, BoCoConstants.MENU_ROOT_PARENT_ID, null, BoCoConstants.SYS_SE_CODE_BO);
			menuList.add(0, rootMenu);
			MenuTreeVO rootMenuMbo = new MenuTreeVO(BoCoConstants.MENU_ROOT_MBO_ID, BoCoConstants.MENU_ROOT_MBO_NAME, BoCoConstants.MENU_ROOT_PARENT_ID, null, BoCoConstants.SYS_SE_CODE_MBO);
			menuList.add(1, rootMenuMbo);
		}else if(StringUtils.equals(BoCoConstants.SYS_SE_CODE_FO, menuVo.getSysSeCode())) {
			MenuTreeVO rootMenu = new MenuTreeVO(BoCoConstants.MENU_ROOT_FO_ID, BoCoConstants.MENU_ROOT_FO_NAME, BoCoConstants.MENU_ROOT_PARENT_ID, null, BoCoConstants.SYS_SE_CODE_FO);
			menuList.add(0, rootMenu);
			MenuTreeVO rootMenuMo = new MenuTreeVO(BoCoConstants.MENU_ROOT_MO_ID, BoCoConstants.MENU_ROOT_MO_NAME, BoCoConstants.MENU_ROOT_PARENT_ID, null, BoCoConstants.SYS_SE_CODE_MO);
			menuList.add(1, rootMenuMo);
		}

		return menuList;
	}
	
	@Override
	public List<MenuVO> getSideBarMenu(String userId) throws Exception {
		Map<String, String> map = new org.apache.commons.collections4.map.HashedMap<>();
		map.put("userId", userId);
		List<MenuVO> sideBarMenuList =  menuMapper.getSideBarMenu(map);
		return sideBarMenuList;
	}

}
