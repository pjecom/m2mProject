package com.m2m.fo.bd.mapper;

import java.util.List;

import com.m2m.fo.bd.model.BdBddprVO;
import com.m2m.fo.bd.model.BdDetailVO;

public interface BdDetailMapper {

	public BdDetailVO selectDetail(BdDetailVO bdDetailVO);

	public List<BdDetailVO> selectbdDelyCndList(BdDetailVO bdDetailVO);

	public String passwordCheck(BdDetailVO bdDetailVO);

	public void insertBdBddpr(BdBddprVO bdBddprVO);
	
}
