package com.m2m.fo.bd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.m2m.fo.bd.model.BdListVO;
import com.m2m.fo.bd.service.BdMainService;
import com.m2m.fo.bo.service.BoBdPblnService;
import com.m2m.fo.login.model.LoginVO;

import io.swagger.models.Model;
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
        BdListVO bdCnt = bdMainService.bdMypageCount(bdListVO);
        model.addAttribute("bdCnt", bdCnt);
        model.addAttribute("bdList", list);
        model.addAttribute("member", member);
        return "bdTiles/bdMypage";
    }
	
	@RequestMapping(value = "/bdMypageAjax", method = RequestMethod.POST)
    public String mypageAjaxList(@RequestBody(required = false) BdListVO bdListVO , ModelMap model, HttpServletRequest request) throws Exception {
		List<BdListVO> list = bdMainService.mypageList(bdListVO);
        BdListVO bdCnt = bdMainService.bdMypageCount(bdListVO);
        log.info("탭탭탭"+bdListVO.getTabNo());
        model.addAttribute("tabNo", bdListVO.getTabNo());
        model.addAttribute("bdCnt", bdCnt);
		model.addAttribute("bdList", list);
        return "bdTiles/bdMypage";
    }
	
	@RequestMapping(value = "/bdMypageLikeList", method = RequestMethod.POST)
    public String mypageLikeList(@RequestBody(required = false) BdListVO bdListVO , ModelMap model, HttpServletRequest request) throws Exception {
		List<BdListVO> list = bdMainService.mypageLikeList(bdListVO);
        BdListVO favoritesCnt = bdMainService.bdMypageLikeCnt(bdListVO);
        //BdListVO bdCnt = bdMainService.bdMypageCount(bdListVO);
        model.addAttribute("tabNo", "5");
		model.addAttribute("favoritesCnt", favoritesCnt.getFavoritesCnt());
        log.info("favoritesCnt22222"+favoritesCnt.getFavoritesCnt());
		model.addAttribute("likeList", list);
        return "bdTiles/bdMypage";
    }
	
	@RequestMapping(value = "/bdMypageLikeListAjax", method = RequestMethod.POST)
    public String bdMypageLikeListAjax(@RequestBody(required = false) BdListVO bdListVO , ModelMap model, HttpServletRequest request) throws Exception {
		List<BdListVO> list = bdMainService.mypageList(bdListVO);
		List<BdListVO> list2 = bdMainService.mypageLikeList(bdListVO);
        BdListVO favoritesCnt = bdMainService.bdMypageLikeCnt(bdListVO);
      
		BdListVO bdCnt = bdMainService.bdMypageCount(bdListVO);
        log.info("탭탭탭"+bdListVO.getTabNo());
        log.info("favoritesCnt22222"+favoritesCnt.getFavoritesCnt());
        model.addAttribute("favoritesCnt", favoritesCnt.getFavoritesCnt());
        model.addAttribute("tabNo", bdListVO.getTabNo());
        model.addAttribute("bdCnt", bdCnt);
		model.addAttribute("bdList", list);
		model.addAttribute("likeList", list2);
        return "bdTiles/bdMypage";
    }
	
//	@RequestMapping(value = "/bdMypageLikeListAjax")
//    public  ResponseEntity<?> bdMypageLikeListAjax(@RequestBody(required = false) BdListVO bdListVO , ModelMap model) throws Exception {
//		Map<String, Object> map = new HashMap<String, Object>();
//		try {
//		List<BdListVO> list = bdMainService.mypageLikeList(bdListVO);
//			map.put("tabNo", "5");
//			map.put("likeList", list);
//	        BdListVO favoritesCnt = bdMainService.bdMypageLikeCnt(bdListVO);
//	        log.info("favoritesCnt1111"+favoritesCnt.getFavoritesCnt());
//			map.put("favoritesCnt", favoritesCnt.getFavoritesCnt());
//			return new ResponseEntity<>(map, HttpStatus.OK);
//	
//		} catch (Exception e) {
//			log.error(e.getMessage());
//			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
//		}
//	}

}
