package com.m2m.fo.bo.service;

import java.util.List;

import com.m2m.fo.bd.model.BdListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m2m.fo.bo.mapper.BoBdPblnMapper;
import com.m2m.fo.bo.model.BoBdPblnVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoBdPblnServiceImpl implements BoBdPblnService{
	
	@Autowired
	private BoBdPblnMapper boBdPblnMapper;

	@Override
	public List<BoBdPblnVO> boBdPblnDtl(BoBdPblnVO vo) throws Exception {
		return boBdPblnMapper.boBdPblnDtl(vo);
	}

	@Override
	public List<BoBdPblnVO> getBoBdPblnList(BoBdPblnVO vo) throws Exception {
		List<BoBdPblnVO> list = boBdPblnMapper.getBoBdPblnList(vo);
		return list;
	}

	@Override
	public BoBdPblnVO getBoBdPblnListTotalCnt(BoBdPblnVO vo) throws Exception {
		return boBdPblnMapper.getBoBdPblnListTotalCnt(vo);
	}

}

