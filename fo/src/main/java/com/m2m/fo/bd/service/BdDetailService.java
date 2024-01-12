package com.m2m.fo.bd.service;

import java.util.List;

import com.m2m.fo.bd.model.BdBddprVO;
import com.m2m.fo.bd.model.BdDetailVO;

public interface BdDetailService {
	public String getString();

	/*디테일조회*/
	public BdDetailVO selectDetail(BdDetailVO bdDetailVO);

	/*인도조건 리스트 조회*/
	public List<BdDetailVO> selectbdDelyCndList(BdDetailVO bdDetailVO);

	/*비밀번호 확인*/
	public String passwordCheck(BdDetailVO bdDetailVO);

	/*투찰상세 insert*/
	public void insertBdBddpr(BdBddprVO bdBddprVO);
}
