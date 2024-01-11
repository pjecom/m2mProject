package com.m2m.fo.bd.mapper;

import java.util.List;

import com.m2m.fo.bd.model.BdDetailVO;

public interface BdDetailMapper {

	public BdDetailVO selectDetail(BdDetailVO bdDetailVO);

	public List<BdDetailVO> selectbdDelyCndList(BdDetailVO bdDetailVO);
	
}
