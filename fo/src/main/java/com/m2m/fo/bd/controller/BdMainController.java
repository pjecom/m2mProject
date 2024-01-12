package com.m2m.fo.bd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.m2m.fo.bd.model.BdListVO;
import com.m2m.fo.bd.service.BdMainService;
import com.m2m.fo.sample.model.SampleVO;
import com.m2m.fo.sample.service.SampleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BdMainController {
	@Autowired
	private BdMainService bdMainService;
	
	
	@RequestMapping("/")
    public String bidMain1(ModelMap model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		BdListVO bdListVO = new BdListVO();
		List<BdListVO> list = bdMainService.getBdList(bdListVO);
		BdListVO bdListCnt = bdMainService.getBdListTotalCnt(bdListVO);
		model.addAttribute("bdList", list);
		model.addAttribute("bdListCnt", bdListCnt);
        return "bdTiles/bdMain";

    }
	
	@RequestMapping("/bo")
    public String boMain(ModelMap model) throws Exception {
	
		
        return "boTiles/boMain";

    }


}
