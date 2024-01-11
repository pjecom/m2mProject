package com.m2m.fo.bo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.bo.service.BoBdPblnService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/boBdPbln")
public class BoBdPblnController {
    @Autowired
    private BoBdPblnService boBdPblnService;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
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

        return "boTab/boBdPblnDtl.modal";
    }
}
