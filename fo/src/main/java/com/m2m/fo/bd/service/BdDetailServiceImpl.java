package com.m2m.fo.bd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m2m.fo.bd.mapper.BdDetailMapper;
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
	
	@Override
	public BdDetailVO selectDetail(BdDetailVO bdDetailVO) {
		
		return bdDetailMapper.selectDetail(bdDetailVO);
	}

	@Override
	public List<BdDetailVO> selectbdDelyCndList(BdDetailVO bdDetailVO) {

		return bdDetailMapper.selectbdDelyCndList(bdDetailVO);
	}

}
