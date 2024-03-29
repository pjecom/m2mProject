package com.m2m.fo.bd.controller;

import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.m2m.fo.bd.model.BdListVO;
import com.m2m.fo.bd.service.BdMainService;
import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.bo.service.BoBdPblnService;
import com.m2m.fo.comm.model.CoCommCdVO;
import com.m2m.fo.login.model.LoginVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BdMypageController {
	@Autowired
	private BdMainService bdMainService;
    private BoBdPblnService boBdPblnService;

	
	@RequestMapping(value = "/bdMypage")
    public String mypageList(@RequestBody(required = false) BdListVO bdListVO , ModelMap model, HttpServletRequest request) throws Exception {
        List<BdListVO> list = bdMainService.mypageList(bdListVO);
        HttpSession session = request.getSession();
        LoginVO member = (LoginVO) session.getAttribute("member");
        BdListVO bdListCnt = bdMainService.getBdListTotalCnt(bdListVO);
        model.addAttribute("bdListCnt", bdListCnt);
        model.addAttribute("bdList", list);
        model.addAttribute("member", member);
        return "bdTiles/bdMypage";
    }
	
	@RequestMapping(value = "/bdMypageAjax", method = RequestMethod.POST)
    public String mypageAjaxList(@RequestBody(required = false) BdListVO bdListVO , ModelMap model, HttpServletRequest request) throws Exception {
		List<BdListVO> list = bdMainService.mypageList(bdListVO);
		model.addAttribute("bdList", list);
        return "bdTiles/bdMypage";
    }
    


}
