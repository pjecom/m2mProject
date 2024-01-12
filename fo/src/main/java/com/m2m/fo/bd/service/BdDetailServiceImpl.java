package com.m2m.fo.bd.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m2m.fo.bd.mapper.BdDetailMapper;
import com.m2m.fo.bd.model.BdBddprVO;
import com.m2m.fo.bd.model.BdDetailVO;
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
			log.info("dateString >>> ::: {}", dateString);	
			// 포맷날짜 셋팅
			bdBddprVO.setDateString(dateString);
			// flag값 설정(투찰상세 조회시 -> )
			bdBddprVO.setBddprFlag("Y");
		}

		return bdBddprVO;
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






