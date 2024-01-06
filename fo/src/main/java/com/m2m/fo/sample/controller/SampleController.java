package com.m2m.fo.sample.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.m2m.fo.sample.model.SampleVO;
import com.m2m.fo.sample.service.SampleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/sample")
public class SampleController {
	@Autowired
	private SampleService sampleService;
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
    public String bidMain(ModelMap model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		SampleVO sampleVo = new SampleVO();
		sampleVo.setNoticeNo(1);
		SampleVO noticeSj = sampleService.getNoticeSj(sampleVo);
		
		model.addAttribute("noticeSj", noticeSj);
		
		
		
        return "sample/index";
    }
}
