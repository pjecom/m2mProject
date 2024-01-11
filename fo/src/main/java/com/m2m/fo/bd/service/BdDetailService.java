package com.m2m.fo.bd.service;

import java.util.List;

import com.m2m.fo.bd.model.BdDetailVO;

public interface BdDetailService {
	public String getString();

	/*디테일조회*/
	public BdDetailVO selectDetail(BdDetailVO bdDetailVO);

	public List<BdDetailVO> selectbdDelyCndList(BdDetailVO bdDetailVO);
}
