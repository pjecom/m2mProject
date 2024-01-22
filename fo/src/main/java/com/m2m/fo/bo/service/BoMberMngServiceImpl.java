package com.m2m.fo.bo.service;

import com.m2m.fo.bo.mapper.BoMberMngMapper;
import com.m2m.fo.bo.model.BoCoCommCdVO;
import com.m2m.fo.bo.model.BoMberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class BoMberMngServiceImpl implements BoMberMngService{
	
	@Autowired
	private BoMberMngMapper boMberMngMapper;

	@Override
	public List<BoCoCommCdVO> getBoCommCdList() {
		return boMberMngMapper.getBoCommCdList();
	}

	@Override
	public List<BoMberVO> getMberList(BoMberVO vo) {
		return boMberMngMapper.getMberList(vo);
	}

	@Override
	public BoMberVO getMberDtl(String bidEntrpsNo) {
		return boMberMngMapper.getMberDtl(bidEntrpsNo);
	}
}
