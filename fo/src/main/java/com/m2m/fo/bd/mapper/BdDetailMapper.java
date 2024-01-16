package com.m2m.fo.bd.mapper;

import java.util.List;

import com.m2m.fo.bd.model.BdBddprVO;
import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.model.bdUpdateVO;

public interface BdDetailMapper {

	public BdDetailVO selectDetail(BdDetailVO bdDetailVO);

	public List<BdDetailVO> selectbdDelyCndList(BdDetailVO bdDetailVO);
	
	public BdBddprVO selectBddpr(BdDetailVO bdDetailVO);
	
	public List<bdUpdateVO> selectBdUpdtList(BdDetailVO bdDetailVO);

	public String passwordCheck(BdDetailVO bdDetailVO);

	public void insertBdBddpr(BdBddprVO bdBddprVO);

	public int selectPartEntQy(BdBddprVO bdBddprVO);

	public void updatePartEntQy(BdBddprVO bdBddprVO);

	public void updateBdBddpr(BdBddprVO bdBddprVO);
	
}
