package com.m2m.fo.bo.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
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
import com.m2m.fo.bo.model.BoCoCommCdVO;
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

        String tempBeginDt = null;
        String tempEndDt = null;

        if (vo != null) {
            tempBeginDt = vo.getBddprBeginDt();
            tempEndDt = vo.getBddprEndDt();
            if (vo.getBddprBeginDt() != null && !vo.getBddprBeginDt().isEmpty()) {
                vo.setBddprBeginDt(vo.getBddprBeginDt().replaceAll("-", "") + "000000");
            }

            if (vo.getBddprEndDt() != null && !vo.getBddprEndDt().isEmpty()) {
                vo.setBddprEndDt(vo.getBddprEndDt().replaceAll("-", "") + "000000");
            }
        }

        if (vo == null) {
            vo = new BoBdPblnVO();
        }

        List<BoBdPblnVO> list = boBdPblnService.getBoBdPblnList(vo);
        List<CoCommCdVO> bidSttusList = boBdPblnService.getbidSttusList("BID_STTUS_CODE");
        Map<String, Object> cntByBidSttus = bidSttusList.stream()
                .collect(Collectors.toMap(
                        CoCommCdVO::getSubCode,
                        cdVO -> boBdPblnService.getCntByBidSttus(cdVO.getSubCode())
                ));
        bidSttusList = bidSttusList.stream()
                .filter(bslVo -> showBidSttusList.contains(bslVo.getSubCode()))
                .sorted(Comparator.comparing(bslVo -> bslVo.getSubCode().equals("11")))
                .collect(Collectors.toList());

        vo.getPagingVO().calPaging(list.size());
        System.out.println(vo.getPagingVO());

        for (BoBdPblnVO bbpVo : list) {
            String begin = bbpVo.getBddprBeginDt();
            String end = bbpVo.getBddprEndDt();

            // Define the original date format
            SimpleDateFormat originalFormat = new SimpleDateFormat("yyyyMMddHHmmss");

            // Define the target date format
            SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

            try {
                Date beginDate = originalFormat.parse(begin);
                bbpVo.setBddprBeginDt(targetFormat.format(beginDate));

                Date endDate = originalFormat.parse(end);
                bbpVo.setBddprEndDt(targetFormat.format(endDate));

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        vo.setBddprBeginDt(tempBeginDt);
        vo.setBddprEndDt(tempEndDt);

        System.out.println(vo);

        model.addAttribute("BdPblnVO", vo);
        model.addAttribute("bdList", list);
        model.addAttribute("bidSttusList", bidSttusList);
        model.addAttribute("cntByBidSttus", cntByBidSttus);

        return "boTab/bdNotice";

    }
    //입찰공고상세
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
            List<BoBdPblnUpdtVO> bobdUptHist = boBdPblnService.getBobdUptHist(boBdPblnVO);            
            model.addAttribute("bobdUptHist", bobdUptHist);
            
            //투찰기업리스트 
			 List<BoBdBddprVO> bdEntrpsList = boBdPblnService.getBdEntrpsList(boBdPblnVO);
			 model.addAttribute("bdEntrpsList", bdEntrpsList);

        } else {
            log.warn("Error");
        }

        return "boModal/boBdPblnDtl";
    }
    
    //입찰공고상세수정
    @RequestMapping(value = "/boBdPblnUpdateModal", method = RequestMethod.POST)
    public String boBdPblnUpdateModal(@RequestBody BoBdPblnVO boBdPblnVO, ModelMap model) throws Exception {
    	//상세리스트
    	List<BoBdPblnVO> boBdPblnDtls = boBdPblnService.getBoBdPblnDtl(boBdPblnVO);

        // 결과가 최소한 하나 이상인지 확인
        if (boBdPblnDtls != null && !boBdPblnDtls.isEmpty()) {
            //입찰상세
        	BoBdPblnVO boBdPblnDtl = boBdPblnDtls.get(0);
            model.addAttribute("boBdPblnDtl", boBdPblnDtl);
        } else {
            log.warn("Error");
        }
        //공통코드리스트
		List<BoCoCommCdVO> boCommCdList = boBdPblnService.getBoCommCdList();
		model.addAttribute("boCommCdList", boCommCdList);
		
		//브랜드코드 
		List<BoBdPblnVO> boBdBrandGrpList = boBdPblnService.getBoBdBrandGrpList();
		model.addAttribute("boBdBrandGrpList", boBdBrandGrpList);
		
		//아이템상품명
		List<BoBdPblnVO> boBdItemList = boBdPblnService.getBoBdItemList();
		model.addAttribute("boBdItemList", boBdItemList);
		
        return "boModal/boBdPblnUpt";
    }
}
