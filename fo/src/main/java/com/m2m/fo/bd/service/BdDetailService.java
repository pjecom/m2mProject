package com.m2m.fo.bd.service;

import java.text.ParseException;
import java.util.List;

import com.m2m.fo.bd.model.BdBddprVO;
import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.model.bdUpdateVO;

public interface BdDetailService {
	public String getString();

	/*디테일조회*/
	public BdDetailVO selectDetail(BdDetailVO bdDetailVO) throws ParseException;

	/*인도조건 리스트 조회*/
	public List<BdDetailVO> selectbdDelyCndList(BdDetailVO bdDetailVO);
	
	/*투찰세부 조회*/
	public BdBddprVO selectBddpr(BdDetailVO bdDetailVO) throws ParseException;
	
	/*입찰 수정 내용조회*/
	public List<bdUpdateVO> selectBdUpdtList(BdDetailVO bdDetailVO);
	
	/*투찰에 참여한 기업 조회*/
	public List<BdBddprVO> bdBidResultList(BdDetailVO bdDetailVO) throws ParseException;
	
	/*유찰사유 select*/
	public BdDetailVO selectFailReason(BdDetailVO bdDetailVO) throws ParseException;
	
	/*관심목록 조회*/
	public BdDetailVO selectConList(BdDetailVO bdDetailVO);

	/*비밀번호 확인*/
	public String passwordCheck(BdDetailVO bdDetailVO);

	/*투찰상세 insert*/
	public void insertBdBddpr(BdBddprVO bdBddprVO);
	
	/*투찰취소 update*/
	public void updateBdBddpr(BdBddprVO bdBddprVO);

}
