package com.m2m.fo.bd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.service.BdDetailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/detail")
public class BdDetailController {
	
	@Autowired
	private BdDetailService bdDetailService;
	
	@RequestMapping("/bdDetail")
    public String bdDetail(@RequestBody BdDetailVO bdDetailVO, Model model, HttpServletRequest request) throws Exception {
		
		// 상세화면 리스트
		bdDetailVO = bdDetailService.selectDetail(bdDetailVO);

		log.info("bdDetailVO >>> ::: {}",bdDetailVO);
		model.addAttribute("bdDetailVO", bdDetailVO);
		
		// 인도조건 리스트
		List<BdDetailVO> bdDelyCndList = bdDetailService.selectbdDelyCndList(bdDetailVO);
		log.info("bdDelyCndList >>> ::: {}",bdDelyCndList.size());
		model.addAttribute("bdDelyCndList", bdDelyCndList);
		
		//log.info("bdDelyCndList >>> ::: {}",bdDelyCndList.size());
	
        return "bdTiles/bdDetail";

    }
	
    @RequestMapping("/insertBddpr")
	public ResponseEntity<?> insertBddpr(@RequestBody BdDetailVO bdDetailVO) throws Exception {
    	
    	log.info("HI");
    	return null;
    }
}
