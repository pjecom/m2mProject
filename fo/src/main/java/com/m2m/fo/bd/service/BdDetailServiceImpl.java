package com.m2m.fo.bd.service;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.m2m.fo.bd.mapper.BdDetailMapper;
import com.m2m.fo.bd.model.BdBddprVO;
import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.model.bdUpdateVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BdDetailServiceImpl implements BdDetailService {
	
	@Autowired
	private BdDetailMapper bdDetailMapper;
	
	@Override
	public String getString() {
		// TODO Auto-generated method stub
		return null;
	}
	
    /**
     * <pre>
     * 처리내용: 디테일 조회(입찰기본 테이블)
     * </pre>
     *  @date 2024. 01. 10.
     * @author SH
     * @throws ParseException 
     * @history
     * ------------------------------------------------
     * 변경일					작성자				변경내용
     * ------------------------------------------------
     * 2024. 01. 10.		SH    			최초작성
     * ------------------------------------------------
     **/
	@Override
	public BdDetailVO selectDetail(BdDetailVO bdDetailVO) throws ParseException {
		
		BdDetailVO detailVO = bdDetailMapper.selectDetail(bdDetailVO);
		
		// 현재 문자열 형식
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");

        // 변환할 문자열 형식
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

        Date BeginDate = inputFormat.parse(detailVO.getBddprBeginDt());
        Date EndDate = inputFormat.parse(detailVO.getBddprEndDt());
        
        //투찰기간시작일
        String bddrBeginDate = outputFormat.format(BeginDate);
        //투찰기간종료일
        String bddrEndDate = outputFormat.format(EndDate);
        
        detailVO.setBddrBeginDate(bddrBeginDate);
        detailVO.setBddrEndDate(bddrEndDate);
        
		return detailVO;
	}
    /**
     * <pre>
     * 처리내용: 인도조건 리스트 조회(공통테이블)
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
	@Override
	public List<BdDetailVO> selectbdDelyCndList(BdDetailVO bdDetailVO) {

		return bdDetailMapper.selectbdDelyCndList(bdDetailVO);
	}

    /**
     * <pre>
     * 처리내용: 투찰세부 조회(투찰상세 테이블)
     * </pre>
     *  @date 2024. 01. 10.
     * @author SH
     * @throws ParseException 
     * @history
     * ------------------------------------------------
     * 변경일					작성자				변경내용
     * ------------------------------------------------
     * 2024. 01. 10.		SH    			최초작성
     * ------------------------------------------------
     **/
	@Override
	public BdBddprVO selectBddpr(BdDetailVO bdDetailVO) throws ParseException {
		// TODO Auto-generated method stub
		String dateCancelFlag = "N";
		BdBddprVO bdBddprVO = new BdBddprVO();
		bdBddprVO = bdDetailMapper.selectBddpr(bdDetailVO);
		
		if(bdBddprVO == null) {
			log.info("투찰전 입니다.");
		}else {
			// SimpleDateFormat을 사용하여 Date를 String으로 변환
			// 현재 문자열 형식
	        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");

	        // 변환할 문자열 형식
	        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

	        Date date = inputFormat.parse(bdBddprVO.getBddprDt());
	        
	        String formattedDate = outputFormat.format(date);
	        
	        log.info("bdBddprVO.getCanclDt() >>> ::: {}", bdBddprVO.getCanclDt());
	        
	        if("-".equals(bdBddprVO.getCanclDt())) {
	        	log.info("취소날짜가 없습니다. ");
	        	bdBddprVO.setDateCancelString(bdBddprVO.getCanclDt());
	        }else {
	        	//SimpleDateFormat dateCancleFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss"); // 날짜 형식을 지정
	        	
	        	SimpleDateFormat inputFormatCancle = new SimpleDateFormat("yyyyMMddHHmmss");
	            try {
	            	SimpleDateFormat outputFormatCancle = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	            	
	            	Date dateCancle = inputFormat.parse(bdBddprVO.getCanclDt());
	            	String formattedDateCancle = outputFormat.format(dateCancle);
	                 
	                log.info("dateCancleString >>> ::: {}", formattedDateCancle);
	                 
	     			// 포맷날짜 셋팅
	     			bdBddprVO.setDateCancelString(formattedDateCancle);
	     			// 플래그값 설정
	     			dateCancelFlag = "Y";
	     			log.info("dateCancelFlag >>> ::: {}", dateCancelFlag);
	     			bdBddprVO.setDateCancelFlag(dateCancelFlag);
	            } catch (ParseException e) {
	                System.err.println("Error parsing date: " + e.getMessage());
	            }

	        }
			log.info("dateString >>> ::: {}", formattedDate);
			
			int delyCndStdrPc = bdBddprVO.getDelyCndStdrPc();
			int cnvrsPremiumAmount = bdBddprVO.getCnvrsPremiumAmount();
			int bddprPremiumPc = bdBddprVO.getBddprPremiumPc();
			
			int bddprTotalPc = delyCndStdrPc + cnvrsPremiumAmount + bddprPremiumPc;
			
			// 숫자 포맷 지정
	        DecimalFormat decimalFormat = new DecimalFormat("#,###");	       
			String formattedBddprTotalPc = decimalFormat.format(bddprTotalPc);
			log.info("formattedBddprTotalPc >>> ::: {}", formattedBddprTotalPc);
			
			//투찰최종가격 셋팅
			bdBddprVO.setBddprTotalPc(formattedBddprTotalPc);
			// 포맷날짜 셋팅
			bdBddprVO.setDateString(formattedDate);
			// flag값 설정(투찰상세 조회시 -> )
			bdBddprVO.setBddprFlag("Y");

		}

		return bdBddprVO;
	}
	
    /**
     * <pre>
     * 처리내용: 입찰 수정 내용조회(입찰수정이력 테이블)
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
	@Override
	public List<bdUpdateVO> selectBdUpdtList(BdDetailVO bdDetailVO) {
		// TODO Auto-generated method stub
		List<bdUpdateVO> bdBidUpdtList = bdDetailMapper.selectBdUpdtList(bdDetailVO);
		
		if(bdBidUpdtList.size() <= 0 || bdBidUpdtList == null) {
			log.info("수정 이력이 존재하지 않습니다.");
		}else {	        
			for(bdUpdateVO bdUpdateVO : bdBidUpdtList) {

		        String date = bdUpdateVO.getFrstRegistDt();
	        	SimpleDateFormat stringToDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            try {
	            	Date frstDt = stringToDate.parse(date);
	            	SimpleDateFormat dateToString = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	                String frstDateString = dateToString.format(frstDt);
	                 
	                log.info("frstDateString >>> ::: {}", frstDateString);
	                 
	     			// 포맷날짜 셋팅
	                bdUpdateVO.setFrstDateString(frstDateString);
	            } catch (ParseException e) {
	                System.err.println("Error parsing date: " + e.getMessage());
	            }
				
			}
			
		}
		
		return bdBidUpdtList;
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
	@Override
	public String passwordCheck(BdDetailVO bdDetailVO) {
	    // 사용자가 입력한 비밀번호
	    String userEnteredPassword = bdDetailVO.getBidMberSecretNo();

	    // DB에 저장된 암호화된 비밀번호 가져오기
	    String hashedPasswordFromDB = bdDetailMapper.getHashedPasswordFromDB(bdDetailVO.getBidEntrpsNo());

	    if (hashedPasswordFromDB != null) {
	        // 입력된 비밀번호와 DB의 암호화된 비밀번호 비교
	        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	        if (passwordEncoder.matches(userEnteredPassword, hashedPasswordFromDB)) {
	            return "Y"; // 비밀번호 일치
	        }
	    }
	    return "N"; // 비밀번호 불일치
	}

    /**
     * <pre>
     * 처리내용: 투찰데이터 INSERT(투찰상세 테이블), 참여기업 +1(입찰기본 테이블)
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
	@Override
	public void insertBdBddpr(BdBddprVO bdBddprVO) {
		// TODO Auto-generated method stub
		bdDetailMapper.insertBdBddpr(bdBddprVO);
		
		// 참여기업 수 조회
		int partEntQy = bdDetailMapper.selectPartEntQy(bdBddprVO);
		log.info("partEntQy >>> ::: {}", partEntQy);
		
		partEntQy++;
		log.info("partEntQy >>> ::: {}", partEntQy);
		bdBddprVO.setPartEntQy(partEntQy);
		
		bdDetailMapper.updatePartEntQy(bdBddprVO);
		
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
	@Override
	public void updateBdBddpr(BdBddprVO bdBddprVO) {
		// TODO Auto-generated method stub
		bdDetailMapper.updateBdBddpr(bdBddprVO);
		
	}

    /**
     * <pre>
     * 처리내용: 투찰에 참여한 기업조회 update(투찰상세 테이블, 업체정보 기본테이블)
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
	@Override
	public List<BdBddprVO> bdBidResultList(BdDetailVO bdDetailVO) throws ParseException {
		// TODO Auto-generated method stub
		List<BdBddprVO> BdBddprList = bdDetailMapper.bdBidResultList(bdDetailVO);
		
		for(BdBddprVO bdBddprVO : BdBddprList) {
      
			//날짜 포맷형식 바꿈
	        String bddprDt = changeDate(bdBddprVO.getBddprDt());
	        
	        // vo에 주입
	        bdBddprVO.setBddprDt(bddprDt);
	        
	        //받은 가격을 뒷자리만 남기고 * 로 처리
	        long cost = bdBddprVO.getTotalCost();
	        
	        // 가격을 문자열로 변환
	        String costString = String.valueOf(cost);

	        // 맨 뒷자리만 남기고 나머지는 '*'로 채우기
	        String maskedTotalCost = maskString(costString);
	        
	        bdBddprVO.setMaskedTotalCost(maskedTotalCost);
		}
		return BdBddprList;
	}
	
	// 맨 뒷자리만 남기고 나머지는 '*'로 채우는 메소드
	private static String maskString(String input) {
	    if (input == null || input.isEmpty()) {
	        return input;
	    }

	    char lastChar = input.charAt(input.length() - 1);
	    StringBuilder maskedString = new StringBuilder();
	    for (int i = 0; i < input.length() - 1; i++) {
	        maskedString.append('*');
	    }
	    maskedString.append(lastChar);

	    return maskedString.toString();
	}
	
	// 날짜 형식 바꾸는 메소드
	private static String changeDate(String date) throws ParseException{
		// 현재 문자열 형식
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        // 변환할 문자열 형식
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

        Date ChangeDate = inputFormat.parse(date);

	    return outputFormat.format(ChangeDate);
	}


}






