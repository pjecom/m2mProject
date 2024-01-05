package com.m2m.fo.bd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BdMainController {
	@RequestMapping("/")
    public String bidMain() throws Exception {
        return "bdTiles/bdMain";

    }
}
