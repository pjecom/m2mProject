package com.m2m.fo.bo.controller;

import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.comm.model.CoCommCdVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/boMber")
public class BoMberMngController {

	@RequestMapping(value ="/mberMng")
    public String boDetail() throws Exception {
       
        return "boTab/bdMberMng";

    }
}
