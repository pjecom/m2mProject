package com.m2m.fo.bd.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.model.BdListVO;

public interface BdMainService {
	public String getString();

	public List<BdListVO> getBdList(BdListVO vo) throws Exception;
	
	public List<BdListVO> mypageList(BdListVO vo) throws Exception;
	
	public BdListVO getBdListTotalCnt(BdListVO vo) throws Exception;
	
	public BdListVO bdMypageCount(BdListVO vo) throws Exception;
	
	/*인도조건 리스트 조회*/
	public List<BdListVO> selectbdDelyCndList(BdListVO vo);
	public List<BdListVO> selectbdDelyList(BdListVO vo);
	
	public BdListVO likeUpdate(BdListVO vo) throws Exception;
	
}
