package com.m2m.fo.bo.controller;

import java.util.*;
import java.util.stream.Collectors;

import com.m2m.fo.bd.model.BdListVO;
import com.m2m.fo.comm.model.CoCommCdVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.bo.service.BoBdPblnService;

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
    public String bobdPblnMain(ModelMap model) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();


        BoBdPblnVO boBdPblnVO = new BoBdPblnVO();
		/* boBdPblnVO.setBidPblancId("TEST01-01"); */

        List<BoBdPblnVO> boBdPblnDtls = boBdPblnService.boBdPblnDtl(boBdPblnVO);

        // 결과가 최소한 하나 이상인지 확인
        if (boBdPblnDtls != null && !boBdPblnDtls.isEmpty()) {
            BoBdPblnVO boBdPblnDtl = boBdPblnDtls.get(0);
            model.addAttribute("boBdPblnDtl", boBdPblnDtl);
        } else {
            log.warn("Error");
        }

        return "boModal/boBdPblnDtl";
    }
}
