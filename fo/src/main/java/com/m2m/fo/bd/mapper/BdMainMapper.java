package com.m2m.fo.bd.mapper;

import java.util.List;

import com.m2m.fo.bd.model.BdListVO;

public interface BdMainMapper {
	public List<BdListVO> getBdList(BdListVO vo) throws Exception;
	
	public BdListVO  getBdListTotalCnt(BdListVO vo) throws Exception;
	
	public List<BdListVO> bdMypageList(BdListVO vo) throws Exception;
}
