package com.m2m.fo.bd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m2m.fo.bd.mapper.BdMainMapper;
import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.model.BdListVO;
import com.m2m.fo.sample.model.SampleVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BdMainServiceImpl implements BdMainService {
	
	@Autowired
	private BdMainMapper bdMainMapper;

	public String getString() {
		return "abc";
	}
	public List<BdListVO> getBdList(BdListVO vo) throws Exception {
		List<BdListVO> list = bdMainMapper.getBdList(vo);
		return list;
	}
	@Override
	public BdListVO getBdListTotalCnt(BdListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bdMainMapper.getBdListTotalCnt(vo);
	}

	public List<BdListVO> mypageList(BdListVO vo) throws Exception {
		List<BdListVO> list = bdMainMapper.bdMypageList(vo);
		return list;
	}
	public BdListVO bdMypageCount(BdListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bdMainMapper.bdMypageCount(vo);
	}
	
	@Override
	public List<BdListVO> selectbdDelyCndList(BdListVO vo) {

		return bdMainMapper.selectbdDelyCndList(vo);
	}
	
	@Override
	public List<BdListVO> selectbdDelyList(BdListVO vo) {

		return bdMainMapper.selectbdDelyList(vo);
	}

}
