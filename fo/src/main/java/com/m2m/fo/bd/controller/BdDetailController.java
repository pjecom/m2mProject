package com.m2m.fo.bd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.m2m.fo.bd.model.BdBddprVO;
import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.model.bdUpdateVO;
import com.m2m.fo.bd.service.BdDetailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/detail")
public class BdDetailController {
	
	@Autowired
	private BdDetailService bdDetailService;
	
    /**
     * <pre>
     * 처리내용: 디테일 조회(입찰기본 테이블), 인도조건 리스트 조회(공통테이블), 투찰세부 조회(투찰상세 테이블), 입찰 수정 내용조회(입찰수정이력 테이블), 투찰결과()
     * </pre>
     *  @date 2024. 01. 10.
     * @author SH
     * @history
     * ------------------------------------------------
     * 변경일					작성자				변경내용
     * ------------------------------------------------
     * 2024. 01. 10.		SH    			최초작성
     * ------------------------------------------------
     **/
	@RequestMapping("/bdDetail")
    public String bdDetail(@RequestBody BdDetailVO bdDetailVO, Model model, HttpServletRequest request) throws Exception {
		BdDetailVO detailVO = new BdDetailVO(); 
        // vo에 업체번호 주입
        bdDetailVO.setBidEntrpsNo(bdDetailVO.getBidEntrpsNo());

		// 상세화면 리스트
		detailVO = bdDetailService.selectDetail(bdDetailVO);
		
		//vo에 업체번호 주입
		detailVO.setBidEntrpsNo(bdDetailVO.getBidEntrpsNo());
		
		// 관심목록조회
		BdDetailVO conList =  bdDetailService.selectConList(bdDetailVO);
		String conCheck = "N";
		
		// 관심목록 값이 없으면 Flag 값 N (켜진것) 있으면 Flag값 Y(꺼진것)
		if(conList == null){
			log.info("관심목록을 체크하지 않았습니다.");
			conCheck = "Y";
		}else {
			conCheck = "N";
		}
		detailVO.setConCheck(conCheck);
		
		model.addAttribute("bdDetailVO", detailVO);
		
		// 인도조건 리스트
		List<BdDetailVO> bdDelyCndList = bdDetailService.selectbdDelyCndList(detailVO);
		log.info("bdDelyCndList >>> ::: {}",bdDelyCndList.size());
		model.addAttribute("bdDelyCndList", bdDelyCndList);
		
		// 투찰세부 조회
		BdBddprVO bdBddprVO = new BdBddprVO();
		bdBddprVO = bdDetailService.selectBddpr(bdDetailVO);
		
		if(bdBddprVO == null) {
			log.info("값이 존재하지 않습니다.");
		}else {
			model.addAttribute("bdBddprVO", bdBddprVO);	
		}
		
		log.info("getBidSttusCode >>> ::: {}",detailVO.getBidSttusCode());	//상태코드
		
		//입찰 수정 내용조회
		List<bdUpdateVO> bdBidUpdtList = bdDetailService.selectBdUpdtList(bdDetailVO);
		
		if(bdBidUpdtList.size() <= 0 || bdBidUpdtList == null) {
			log.info("수정 이력이 존재하지 않습니다.");
		}else {	        
			model.addAttribute("bdBidUpdtList", bdBidUpdtList);
		}
		
		//투찰에 참여한 기업 조회, 낙찰,패찰일 경우만 조회
		if("31".equals(detailVO.getBidSttusCode()) || ("30".equals(detailVO.getBidSttusCode()) && "N".equals(bdBddprVO.getScsbidAt()))) {			
			List<BdBddprVO> bdBidResultList = bdDetailService.bdBidResultList(bdDetailVO);
			model.addAttribute("bdBidResultList", bdBidResultList);	
		}
		
		//유찰사유
		if("32".equals(detailVO.getBidSttusCode())) {
			BdDetailVO failReason  = new BdDetailVO();
			failReason = bdDetailService.selectFailReason(bdDetailVO);
			model.addAttribute("failReason", failReason);
		}
		
        return "bdTiles/bdDetail";

    }
	
    /**
     * <pre>
     * 처리내용: 비밀번호 확인(업체정보기본 테이블)
     * </pre>
     *  @date 2024. 01. 11.
     * @author SH
     * @history
     * ------------------------------------------------
     * 변경일					작성자				변경내용
     * ------------------------------------------------
     * 2024. 01. 11.		SH    			최초작성
     * ------------------------------------------------
     **/
	@PostMapping("/passwordCheck")
    @ResponseBody
	public ResponseEntity<?> passwordCheck(@RequestBody BdDetailVO bdDetailVO, HttpServletRequest request) throws Exception {   	
		Map<String, Object> retVal = new HashMap<String, Object>();
		
    	log.info("getBidMberSecretNo >>> ::: {}",bdDetailVO.getBidMberSecretNo());
		try {

	        //vo에 업체번호 주입
	        bdDetailVO.setBidEntrpsNo(bdDetailVO.getBidEntrpsNo());
	        
			String checkPw = "";
	    	// Flag 설정 -> 해당 비밀번호에 해당하는 회원이 있을경우 "Y" 아닐경우 "N"로 리턴
	    	String checkFlag = "N";
	    	
	    	checkPw = bdDetailService.passwordCheck(bdDetailVO); 
	    	if(checkPw == "N" || checkPw == null || checkPw == "") {
	    		checkFlag = "N";
	    	}else {
	    		checkFlag = "Y";
	    	}
	    	
	    	log.info("checkFlag >>> ::: {}",checkFlag);
	    	
	    	retVal.put("result", checkFlag);
			//투찰 취소 갯수
			return new ResponseEntity<>(retVal, HttpStatus.OK);
			
		} catch (Exception e) {
			log.error(e.getMessage());
			return new ResponseEntity<>("비밀번호가 틀렸습니다.다시 시도해주세요.", HttpStatus.BAD_REQUEST); 
		}
    }

    /**
     * <pre>
     * 처리내용: 투찰데이터 INSERT(투찰상세 테이블)
     * </pre>
     *  @date 2024. 01. 12.
     * @author SH
     * @history
     * ------------------------------------------------
     * 변경일					작성자				변경내용
     * ------------------------------------------------
     * 2024. 01. 12.		SH    			최초작성
     * ------------------------------------------------
     **/
    @RequestMapping("/insertBdBddpr")
    @ResponseBody
	public ResponseEntity<?> insertBdBddpr(@RequestBody BdBddprVO bdBddprVO) throws Exception {
    	Map<String, Object> retVal = new HashMap<String, Object>();

    	// 테스트데이터
    	bdBddprVO.setFrstRegisterId(bdBddprVO.getBidMberId());
    	bdBddprVO.setLastChangerId(bdBddprVO.getBidMberId());
    	
    	log.info("bdBddprVO >>> ::: {} ", bdBddprVO);

		try {
			//투찰 insert
			bdDetailService.insertBdBddpr(bdBddprVO);
			retVal.put("result", "success");
			
			//넣은데이터 조회
			//bdBddprVO = bdDetailService.selectBdBddpr(bdBddprVO);
			
			return new ResponseEntity<>(retVal, HttpStatus.OK); // ajax success 데이터 전달
		 
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage());
			return new ResponseEntity<>("insertBdBddpr 오류.", HttpStatus.BAD_REQUEST);
		}
	}
    
    /**
     * <pre>
     * 처리내용: 투찰취소 update(투찰상세 테이블)
     * </pre>
     *  @date 2024. 01. 12.
     * @author SH
     * @history
     * ------------------------------------------------
     * 변경일					작성자				변경내용
     * ------------------------------------------------
     * 2024. 01. 12.		SH    			최초작성
     * ------------------------------------------------
     **/
    @RequestMapping("/updateBdBddpr")
    @ResponseBody
	public ResponseEntity<?> updateBdBddpr(@RequestBody BdBddprVO bdBddprVO) throws Exception {
    	Map<String, Object> retVal = new HashMap<String, Object>();
    	// 테스트데이터
    	bdBddprVO.setLastChangerId(bdBddprVO.getBidMberId());
    	
    	log.info("bdBddprVO.getBidMberId() >>> ::: {} ", bdBddprVO.getBidMberId());

		try {
			//투찰취소
			bdDetailService.updateBdBddpr(bdBddprVO);
			retVal.put("result", "success");
			
			//넣은데이터 조회
			//bdBddprVO = bdDetailService.selectBdBddpr(bdBddprVO);
			
			return new ResponseEntity<>(retVal, HttpStatus.OK); // ajax success 데이터 전달
		 
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage());
			return new ResponseEntity<>("insertBdBddpr 오류.", HttpStatus.BAD_REQUEST);
		}
	}
}
