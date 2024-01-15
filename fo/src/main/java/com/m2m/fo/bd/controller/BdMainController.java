package com.m2m.fo.bd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.model.BdListVO;
import com.m2m.fo.bd.service.BdMainService;
import com.m2m.fo.sample.model.SampleVO;
import com.m2m.fo.sample.service.SampleService;

import io.swagger.models.Model;
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
	
	@PostMapping("/selectBdMainInfoList")
    @ResponseBody
	public ResponseEntity<?> selectBdMainInfoList(@RequestBody BdListVO bdListVO, HttpServletRequest request) throws Exception {   	
        Map<String, Object> retVal = new HashMap<String, Object>();
		
        log.info("getBidMberSecretNo >>> ::: {}",bdListVO.getBidPblancId());
        try {
            
           List<BdListVO> list = bdMainService.getBdList(bdListVO); 
           log.info("checkFlag >>> ::: {}",list);
           request.setAttribute("list", list);
           return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>("에러에러!", HttpStatus.BAD_REQUEST); 
            }
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

			int totalCnt = 0;
			int expectCnt = 0;
			int bidingCnt = 0;
			int endCnt = 0;
			//입찰예정,투찰중,(마감,서류접수중,서류심사중,유찰)

			map.put("mainBdList", mainBdList);
			map.put("totalCnt", totalCnt);
			map.put("expectCnt", expectCnt);
			map.put("bidingCnt", bidingCnt);
			map.put("endCnt", endCnt);

			return new ResponseEntity<>(map, HttpStatus.OK);

		} catch (Exception e) {
			log.error(e.getMessage());
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}


}
