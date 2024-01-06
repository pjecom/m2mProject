package com.m2m.fo.bd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.m2m.fo.bd.service.BdMainService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BdMainController {
	@Autowired
	private BdMainService bdMainService;
	
	@RequestMapping("/")
    public String bidMain(ModelMap model) throws Exception {
        return "bdTiles/bdMain";

    }
}
