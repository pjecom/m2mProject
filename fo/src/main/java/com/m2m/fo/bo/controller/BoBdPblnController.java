package com.m2m.fo.bo.controller;

import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.m2m.fo.bo.model.BoBdBddprVO;
import com.m2m.fo.bo.model.BoBdPblnUpdtVO;
import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.bo.service.BoBdPblnService;
import com.m2m.fo.comm.model.CoCommCdVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/bo")
public class BoBdPblnController {
    @Autowired
    private BoBdPblnService boBdPblnService;

    @RequestMapping(value ="/bidNotice")
    public String boDetail(@RequestBody(required = false) BoBdPblnVO vo, ModelMap model) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        List<String> showBidSttusList = Arrays.asList("11", "12", "13", "30", "33");

        List<BoBdPblnVO> list = boBdPblnService.getBoBdPblnList(vo);
        List<CoCommCdVO> bidSttusList = boBdPblnService.getbidSttusList("BID_STTUS_CODE");
        // BoBdPblnVO bdListCnt = boBdPblnService.getBoBdPblnListTotalCnt(bdListVO);

        bidSttusList = bidSttusList.stream()
                .filter(bslVo -> showBidSttusList.contains(bslVo.getSubCode()))
                .sorted(Comparator.comparing(bslVo -> bslVo.getSubCode().equals("11")))
                .collect(Collectors.toList());

        model.addAttribute("bdList", list);
        model.addAttribute("bidSttusList", bidSttusList);
        // model.addAttribute("bdListCnt", bdListCnt);
        return "boTab/bdNotice";

    }
    
    @RequestMapping(value = "/boBdPblnDtlModal", method = RequestMethod.POST)
    public String bobdPblnMain(@RequestBody BoBdPblnVO boBdPblnVO, ModelMap model) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        List<BoBdPblnVO> boBdPblnDtls = boBdPblnService.getBoBdPblnDtl(boBdPblnVO);

        // 결과가 최소한 하나 이상인지 확인
        if (boBdPblnDtls != null && !boBdPblnDtls.isEmpty()) {
            //입찰상세
        	BoBdPblnVO boBdPblnDtl = boBdPblnDtls.get(0);
            model.addAttribute("boBdPblnDtl", boBdPblnDtl);
            
            //수정이력
            List<BoBdPblnUpdtVO> bobdUpdateHistroy = boBdPblnService.getBobdUpdateHistroy(boBdPblnVO);            
            model.addAttribute("bobdUpdateHistroy", bobdUpdateHistroy);
            
            //투찰기업리스트 
			 List<BoBdBddprVO> bdEntrpsList = boBdPblnService.getBdEntrpsList(boBdPblnVO);
			 model.addAttribute("bdEntrpsList", bdEntrpsList);

        } else {
            log.warn("Error");
        }

        return "boModal/boBdPblnDtl";
    }
    // 아래는 추가한 Class
    // Update History는 수정 사항이 아니기 때문에 넣지 않았음
    @RequestMapping(value = "/boBdPblnDtlModify", method = RequestMethod.POST)
    public String bobdPblnDtlModify(@RequestBody BoBdPblnVO boBdPblnVO, ModelMap model) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        List<BoBdPblnVO> boBdPblnDtls = boBdPblnService.getBoBdPblnDtl(boBdPblnVO);

        // 결과가 최소한 하나 이상인지 확인
        if (boBdPblnDtls != null && !boBdPblnDtls.isEmpty()) {
            BoBdPblnVO boBdPblnDtl = boBdPblnDtls.get(0);
            model.addAttribute("boBdPblnDtl", boBdPblnDtl);
        } else {
            log.warn("Error");
        }

        return "boModal/boBdModify";	// 이 부분 jsp 추가 후 수정해야 됨
    }
    
    @RequestMapping(value = "/boBdPblnUpdateModal", method = RequestMethod.POST)
    public String boBdPblnUpdateModal(@RequestBody BoBdPblnVO boBdPblnVO, ModelMap model) throws Exception {

        return "boModal/boBdPblnUpt";
    }
}
