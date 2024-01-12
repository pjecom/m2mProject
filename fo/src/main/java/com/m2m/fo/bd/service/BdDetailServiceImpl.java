package com.m2m.fo.bd.service;

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
	@Override
	public void insertBdBddpr(BdBddprVO bdBddprVO) {
		// TODO Auto-generated method stub
		bdDetailMapper.insertBdBddpr(bdBddprVO);
	}

}
