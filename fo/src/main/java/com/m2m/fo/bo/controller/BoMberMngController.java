package com.m2m.fo.bo.controller;

import com.m2m.fo.bo.model.BoCoCommCdVO;
import com.m2m.fo.bo.model.BoMberVO;
import com.m2m.fo.bo.service.BoMberMngService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/boMber")
public class BoMberMngController {

    @Autowired
    private BoMberMngService mberMngService;

	@RequestMapping(value ="/mberMng")
    public String mberMngList(@RequestBody(required = false) BoMberVO vo, ModelMap model) throws Exception {

        if (vo == null) {
            vo = new BoMberVO();
        } else if (vo.getEtrConfmRequstDt() != null){
            vo.getEtrConfmRequstDt().setHours(0);
        } else if (vo.getEtrConfmProcessDt() != null){
            vo.getEtrConfmProcessDt().setHours(0);
        }

        //공통코드리스트
        List<BoCoCommCdVO> boCommCdList = mberMngService.getBoCommCdList();

        // 회원 목록
        List<BoMberVO> mberList = mberMngService.getMberList(vo);

        mberList.forEach(mberVO -> {
            mberVO.setBsnmRegistNo(formatBsnmRegistNo(mberVO.getBsnmRegistNo()));
            mberVO.setMoblphonNo2(formatPhoneNumber(mberVO.getMoblphonNo2()));
        });

        model.addAttribute("mberVO", vo);
        model.addAttribute("mberList", mberList);
        model.addAttribute("boCommCdList", boCommCdList);

        return "boTab/bdMberMng";

    }

    @RequestMapping(value = "/mberDtlModal", method = RequestMethod.POST)
    public String mberDtlModal(@RequestBody BoMberVO mberVO, ModelMap model) throws Exception {

        BoMberVO mberDtl = mberMngService.getMberDtl(mberVO.getBidEntrpsNo());

        // 결과가 최소한 하나 이상인지 확인
        if (mberDtl != null) {

            mberDtl.setBsnmRegistNo(formatBsnmRegistNo(mberDtl.getBsnmRegistNo()));
            mberDtl.setMoblphonNo2(formatPhoneNumber(mberDtl.getMoblphonNo2()));
            mberDtl.setVrscBsnmRegistNo(formatBsnmRegistNo(mberDtl.getVrscBsnmRegistNo()));
            mberDtl.setVrscMoblphonNo(formatPhoneNumber(mberDtl.getVrscMoblphonNo()));

            // 회원 정보
            model.addAttribute("mberDtl", mberDtl);

        } else {
            log.warn("Error");
        }

        return "boModal/boBdMberDtl";
    }

    @RequestMapping(value = "/beforeIntrcpMber", method = RequestMethod.POST)
    public ResponseEntity<?> beforeIntrcpMber(@RequestBody BoMberVO mberVO, ModelMap model) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        int bddpringCnt = mberMngService.beforeIntrcpMber(mberVO.getBidEntrpsNo());

        if (bddpringCnt == 0) {
            return ResponseEntity.ok(true);  // ajax success 데이터 전달
        } else {
            return ResponseEntity.ok(false);  // ajax success 데이터 전달
        }
    }

    @RequestMapping(value = "/intrcpMber", method = RequestMethod.POST)
    public String intrcpMber(@RequestBody BoMberVO mberVO, ModelMap model) throws Exception {

        mberMngService.intrcpMber(mberVO.getBidEntrpsNo());

        BoMberVO mberDtl = mberMngService.getMberDtl(mberVO.getBidEntrpsNo());

        // 결과가 최소한 하나 이상인지 확인
        if (mberDtl != null) {

            mberDtl.setBsnmRegistNo(formatBsnmRegistNo(mberDtl.getBsnmRegistNo()));
            mberDtl.setMoblphonNo2(formatPhoneNumber(mberDtl.getMoblphonNo2()));
            mberDtl.setVrscBsnmRegistNo(formatBsnmRegistNo(mberDtl.getVrscBsnmRegistNo()));
            mberDtl.setVrscMoblphonNo(formatPhoneNumber(mberDtl.getVrscMoblphonNo()));

            // 회원 정보
            model.addAttribute("mberDtl", mberDtl);

        } else {
            log.warn("Error");
        }

        return "boModal/boBdMberDtl";
    }

    @RequestMapping(value = "/unlockMber", method = RequestMethod.POST)
    public String unlockMber(@RequestBody BoMberVO mberVO, ModelMap model) throws Exception {

        mberMngService.unlockMber(mberVO.getBidEntrpsNo());

        BoMberVO mberDtl = mberMngService.getMberDtl(mberVO.getBidEntrpsNo());

        // 결과가 최소한 하나 이상인지 확인
        if (mberDtl != null) {

            mberDtl.setBsnmRegistNo(formatBsnmRegistNo(mberDtl.getBsnmRegistNo()));
            mberDtl.setMoblphonNo2(formatPhoneNumber(mberDtl.getMoblphonNo2()));
            mberDtl.setVrscBsnmRegistNo(formatBsnmRegistNo(mberDtl.getVrscBsnmRegistNo()));
            mberDtl.setVrscMoblphonNo(formatPhoneNumber(mberDtl.getVrscMoblphonNo()));

            // 회원 정보
            model.addAttribute("mberDtl", mberDtl);

        } else {
            log.warn("Error");
        }

        return "boModal/boBdMberDtl";
    }

    private String formatPhoneNumber(String phonNo) {
        if (phonNo != null && !phonNo.isEmpty()) {
            phonNo = phonNo.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
        }

        return phonNo;
    }

    private String formatBsnmRegistNo(String bsnmRegistNo) {
        if (bsnmRegistNo != null && !bsnmRegistNo.isEmpty()) {
            bsnmRegistNo = bsnmRegistNo.replaceAll("(\\d{3})(\\d{2})(\\d{5})", "$1-$2-$3");
        }

        return bsnmRegistNo;
    }
}
