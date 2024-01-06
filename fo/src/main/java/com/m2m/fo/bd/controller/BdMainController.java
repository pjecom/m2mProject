package com.m2m.fo.bd.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.m2m.sample.model.SampleVO;
import com.m2m.sample.service.SampleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@ComponentScan(basePackages = {"com.m2m.sample.service"})
public class BdMainController {
	@Autowired
	private SampleService sampleService;
	
	@RequestMapping("/")
    public String bidMain(ModelMap model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		SampleVO sampleVo = new SampleVO();
		sampleVo.setNoticeNo(1);
		SampleVO noticeSj = sampleService.getNoticeSj(sampleVo);
		
		log.debug("parkjeongeun");
		
		model.addAttribute("noticeSj", noticeSj);
        return "bdTiles/bdMain";

    }
}
