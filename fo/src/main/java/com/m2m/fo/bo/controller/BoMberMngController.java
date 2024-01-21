package com.m2m.fo.bo.controller;

import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.bo.model.BoCoCommCdVO;
import com.m2m.fo.bo.model.BoMberVO;
import com.m2m.fo.bo.service.BoMberMngService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
            if (mberVO.getBsnmRegistNo() != null && !mberVO.getBsnmRegistNo().isEmpty()) {
                mberVO.setBsnmRegistNo(mberVO.getBsnmRegistNo().replaceAll("(\\d{3})(\\d{2})(\\d{5})", "$1-$2-$3"));
            }
            if (mberVO.getMoblphonNo2() != null && !mberVO.getMoblphonNo2().isEmpty()) {
                mberVO.setMoblphonNo2(mberVO.getMoblphonNo2().replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3"));
            }
        });

        model.addAttribute("mberVO", vo);
        model.addAttribute("mberList", mberList);
        model.addAttribute("boCommCdList", boCommCdList);

        return "boTab/bdMberMng";

    }
}
