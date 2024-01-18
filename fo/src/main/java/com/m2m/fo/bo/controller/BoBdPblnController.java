package com.m2m.fo.bo.controller;

import com.m2m.fo.bo.model.BoBdBddprVO;
import com.m2m.fo.bo.model.BoBdPblnUpdtVO;
import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.bo.model.BoCoCommCdVO;
import com.m2m.fo.bo.service.BoBdPblnService;
import com.m2m.fo.comm.model.CoCommCdVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Controller
@RequestMapping("/bo")
public class BoBdPblnController {
    @Autowired
    private BoBdPblnService boBdPblnService;

    @RequestMapping(value ="/bidNotice")
    public String boDetail(@RequestBody(required = false) BoBdPblnVO vo, ModelMap model) throws Exception {
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
        BoBdPblnVO finalVo = new BoBdPblnVO();
        Map<String, Object> cntByBidSttus = bidSttusList.stream()
                .collect(Collectors.toMap(
                        CoCommCdVO::getSubCode,
                        cdVO -> {
                            finalVo.setSubCode(cdVO.getSubCode());
                            return boBdPblnService.getCntByBidSttus(finalVo);
                        }
                ));
        bidSttusList = bidSttusList.stream()
                .filter(bslVo -> showBidSttusList.contains(bslVo.getSubCode()))
                .sorted(Comparator.comparing(bslVo -> bslVo.getSubCode().equals("11")))
                .collect(Collectors.toList());

//        vo.getPagingVO().calPaging(list.size());
//        System.out.println(vo.getPagingVO());

        for (BoBdPblnVO bbpVo : list) {
            String begin = bbpVo.getBddprBeginDt();
            String end = bbpVo.getBddprEndDt();

            SimpleDateFormat originalFormat = new SimpleDateFormat("yyyyMMddHHmmss");
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

    @RequestMapping(value = "/initBdCrtModal", method = RequestMethod.POST)
    public String initBdCreateModal(@RequestBody(required = false) BoBdPblnVO bdPblnVO, ModelMap model) throws Exception {
        if(bdPblnVO == null) {
            bdPblnVO = new BoBdPblnVO();
        }

        //공통코드리스트
        List<BoCoCommCdVO> boCommCdList = boBdPblnService.getBoCommCdList();
        //브랜드코드
        List<BoBdPblnVO> brandList = boBdPblnService.getBoBdBrandGrpList();
        //아이템상품명
        List<BoBdPblnVO> itemList = boBdPblnService.getBoBdItemList();

        // 메탈 리스트 필터링
        List<BoCoCommCdVO> metalList = boCommCdList.stream()
                .filter(item -> "METAL_CODE".equals(item.getMainCode()))
                .collect(Collectors.toList());

        String metalCode;
        if (bdPblnVO.getMetalCode() != null && !bdPblnVO.getMetalCode().isEmpty()) {
            metalCode = bdPblnVO.getMetalCode();
        } else {
            metalCode = metalList.get(0).getSubCode();
        }

        // 브랜드 그룹 코드 필터링
        List<BoCoCommCdVO> brandGroupList = boCommCdList.stream()
                .filter(item -> "BRAND_GROUP_CODE".equals(item.getMainCode()) && metalCode.equals(item.getCodeDcone()))
                .collect(Collectors.toList());

        String brandGroupCode;
        if(bdPblnVO.getBrandGroupCode() != null && !bdPblnVO.getBrandGroupCode().isEmpty()) {
            brandGroupCode = bdPblnVO.getBrandGroupCode();
        } else {
            brandGroupCode = brandGroupList.get(0).getSubCode();
        }

        // 브랜드 코드 필터링
        brandList = brandList.stream()
                .filter(item -> brandGroupCode.equals(item.getBrandGroupCode()))
                .collect(Collectors.toList());

        // 아이템 필터링
        itemList = itemList.stream()
                .filter(item -> metalCode.equals(item.getMetalCode()))
                .collect(Collectors.toList());

        model.addAttribute("metalList", metalList);
        model.addAttribute("brandGroupList", brandGroupList);
        model.addAttribute("brandList", brandList);
        model.addAttribute("itemList", itemList);
        model.addAttribute("boCommCdList", boCommCdList);


        return "boModal/boBdCreate";
    }

    @RequestMapping(value = "/boBdPblnCreate", method = RequestMethod.POST)
    public String boBdPblnCreate(@RequestBody BoBdPblnVO bdPblnVO, ModelMap model) throws Exception {

        SimpleDateFormat dateTimeFm = new SimpleDateFormat("yyyyMMddhhmmss");
        String currentDateTimeStr = dateTimeFm.format(new Date());
        Date currentDateTime = dateTimeFm.parse(currentDateTimeStr);

        SimpleDateFormat dateFm = new SimpleDateFormat("yyMMdd");
        String currentDateStr = dateFm.format(new Date());

        Date bddprBeginDt = dateTimeFm.parse(bdPblnVO.getBddprBeginDt());

        if(bdPblnVO.getDspyAt().equals("N")) {
            bdPblnVO.setBidSttusCode("11");
        } else if (currentDateTime.before(bddprBeginDt)) {
            bdPblnVO.setBidSttusCode("12");
        } else {
            bdPblnVO.setBidSttusCode("13");
        }

        bdPblnVO.setBidPblancId("BID" + currentDateStr);
        bdPblnVO.setFrstRegisterId("admin");
        bdPblnVO.setFrstRegistDt(currentDateTime);

        boBdPblnService.istboBdPbln(bdPblnVO);

        return "boModal/boBdCreate";
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

    @RequestMapping("/updateBoBdPblnDtl")
    @ResponseBody
	public ResponseEntity<?> updateBoBdPblnDtl(@RequestBody BoBdPblnVO boBdPblnVO) throws Exception {
    	Map<String, Object> map = new HashMap<String, Object>();

		try {
			//공고수정내용업데이트
			boBdPblnService.updateBoBdPblnDtl(boBdPblnVO);
			map.put("result", "success");

			//넣은데이터 조회
			//boBdPblnVO = boBdPblnService.getBoBdPblnDtl(boBdPblnVO);

			return new ResponseEntity<>(map, HttpStatus.OK); // ajax success 데이터 전달

		} catch (Exception e) {

			log.error(e.getMessage());
			return new ResponseEntity<>("Error.", HttpStatus.BAD_REQUEST);
		}
	}
}
