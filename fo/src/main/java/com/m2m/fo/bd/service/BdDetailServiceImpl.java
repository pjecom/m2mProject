package com.m2m.fo.bd.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.DecimalFormat;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m2m.fo.bd.mapper.BdDetailMapper;
import com.m2m.fo.bd.model.BdBddprVO;
import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.model.bdUpdateVO;
import com.m2m.fo.sample.mapper.SampleMapper;

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
     * @history
     * ------------------------------------------------
     * 변경일					작성자				변경내용
     * ------------------------------------------------
     * 2024. 01. 10.		SH    			최초작성
     * ------------------------------------------------
     **/
	@Override
	public BdDetailVO selectDetail(BdDetailVO bdDetailVO) {
		
		return bdDetailMapper.selectDetail(bdDetailVO);
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
     * @history
     * ------------------------------------------------
     * 변경일					작성자				변경내용
     * ------------------------------------------------
     * 2024. 01. 10.		SH    			최초작성
     * ------------------------------------------------
     **/
	@Override
	public BdBddprVO selectBddpr(BdDetailVO bdDetailVO) {
		// TODO Auto-generated method stub
		BdBddprVO bdBddprVO = new BdBddprVO();
		bdBddprVO = bdDetailMapper.selectBddpr(bdDetailVO);
		
		if(bdBddprVO == null) {
			log.info("투찰전 입니다.");
		}else {
			// SimpleDateFormat을 사용하여 Date를 String으로 변환
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm"); // 날짜 형식을 지정
	        String dateString = dateFormat.format(bdBddprVO.getBddprDt());
	        
	        log.info("bdBddprVO.getCanclDt() >>> ::: {}", bdBddprVO.getCanclDt());
	        
	        if("-".equals(bdBddprVO.getCanclDt())) {
	        	log.info("취소날짜가 없습니다. ");
	        	bdBddprVO.setDateCancelString(bdBddprVO.getCanclDt());
	        }else {
	        	//SimpleDateFormat dateCancleFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss"); // 날짜 형식을 지정
	        	String date = bdBddprVO.getCanclDt();
	        	SimpleDateFormat stringToDate = new SimpleDateFormat("yyyy-MM-dd HH");
	            try {
	            	Date canclDt = stringToDate.parse(date);
	            	SimpleDateFormat dateToString = new SimpleDateFormat("yyyy.MM.dd HH");
	                String dateCancelString = dateToString.format(canclDt);
	                 
	                log.info("dateCancleString >>> ::: {}", dateCancelString);
	                 
	     			// 포맷날짜 셋팅
	     			bdBddprVO.setDateCancelString(dateCancelString);
	            } catch (ParseException e) {
	                System.err.println("Error parsing date: " + e.getMessage());
	            }

	        }
			log.info("dateString >>> ::: {}", dateString);
			
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
			bdBddprVO.setDateString(dateString);
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
	            	SimpleDateFormat dateToString = new SimpleDateFormat("yyyy.MM.dd HH:mm");
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
		// TODO Auto-generated method stub
		return bdDetailMapper.passwordCheck(bdDetailVO);
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

}






