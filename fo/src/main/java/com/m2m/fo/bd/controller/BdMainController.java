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

import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.model.BdListVO;
import com.m2m.fo.bd.service.BdMainService;
import com.m2m.fo.login.model.LoginVO;

import io.swagger.models.Model;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BdMainController {
	@Autowired
	private BdMainService bdMainService;
	
	
	@RequestMapping("/")
    public String bidMain1(ModelMap model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        HttpSession session = request.getSession();
        LoginVO member = (LoginVO) session.getAttribute("member");
        
        BdListVO bdListVO = new BdListVO();
        List<BdListVO> list = bdMainService.getBdList(bdListVO);
        
		List<BdListVO> bdDelyCndList = bdMainService.selectbdDelyCndList(bdListVO);
		model.addAttribute("bdDelyCndList", bdDelyCndList);
		List<BdListVO> bdDelyList = bdMainService.selectbdDelyList(bdListVO);
		model.addAttribute("bdDelyList", bdDelyList);
		
        model.addAttribute("bdList", list);
        model.addAttribute("member", member);
        
        return "bdTiles/bdMain";

    }
	

	@RequestMapping("/bdMypageCount")
	public ResponseEntity<?> bdMypageCount(@RequestBody BdListVO bdBidVO, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
	        BdListVO bdCnt = bdMainService.bdMypageCount(bdBidVO);
			map.put("biddingCnt", bdCnt.getBiddingCnt());
			map.put("approvedCnt", bdCnt.getApprovedCnt());
			map.put("rejectedCnt", bdCnt.getRejectedCnt());
			return new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			log.error(e.getMessage());
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping("/loginCheck")
	public ResponseEntity<?> loginCheck(ModelMap model, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        LoginVO member = (LoginVO) session.getAttribute("member");
        model.addAttribute("member", member);
        return new ResponseEntity<>(HttpStatus.OK);
    }
	
	@RequestMapping("/bo")
    public String boMain(ModelMap model) throws Exception {
	
		
        return "boTiles/boMain";

    }
	
	@RequestMapping("/selectBdMainInfoAjaxList")
	public ResponseEntity<?> selectBdMainInfoAjaxList(@RequestBody BdListVO bdBidVO, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			List<BdListVO> mainBdList = bdMainService.getBdList(bdBidVO);
	        BdListVO bdListCnt = bdMainService.getBdListTotalCnt(bdBidVO);
	        BdListVO bdCnt = bdMainService.bdMypageCount(bdBidVO);
	        map.put("biddingCnt", bdCnt.getBiddingCnt());
			//입찰예정,투찰중,(마감,서류접수중,서류심사중,유찰)

			map.put("mainBdList", mainBdList);
			map.put("totalCnt", bdListCnt.getTotalCnt());
			map.put("expectCnt", bdListCnt.getExpectCnt());
			map.put("bidingCnt", bdListCnt.getBidingCnt());
			map.put("endCnt", bdListCnt.getEndCnt());

			return new ResponseEntity<>(map, HttpStatus.OK);

		} catch (Exception e) {
			log.error(e.getMessage());
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	
	@RequestMapping("/likeUpdate")
	public ResponseEntity<?> likeUpdate(@RequestBody BdListVO bdBidVO, Model model) throws Exception {
		try {
	        bdMainService.likeUpdate(bdBidVO);
	        return new ResponseEntity<>(HttpStatus.OK);

		} catch (Exception e) {
			log.error(e.getMessage());
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	


}
