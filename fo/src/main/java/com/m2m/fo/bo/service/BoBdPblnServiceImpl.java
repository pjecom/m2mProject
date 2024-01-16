package com.m2m.fo.bo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m2m.fo.bo.mapper.BoBdPblnMapper;
import com.m2m.fo.bo.model.BoBdBddprVO;
import com.m2m.fo.bo.model.BoBdPblnUpdtVO;
import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.comm.model.CoCommCdVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoBdPblnServiceImpl implements BoBdPblnService{
	
	@Autowired
	private BoBdPblnMapper boBdPblnMapper;

	@Override
	public List<BoBdPblnVO> getBoBdPblnDtl(BoBdPblnVO vo) throws Exception {
		return boBdPblnMapper.getBoBdPblnDtl(vo);
	}
	
	@Override
	public List<BoBdPblnUpdtVO> getBobdUpdateHistroy(BoBdPblnVO vo) throws Exception {
		return boBdPblnMapper.getBobdUpdateHistroy(vo);
	}
	
	@Override
	public List<BoBdBddprVO> getBdEntrpsList(BoBdPblnVO vo) throws Exception {
		return boBdPblnMapper.getBdEntrpsList(vo);
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

	@Override
	public List<CoCommCdVO> getbidSttusList(String mainCode) {
		List<CoCommCdVO> list = boBdPblnMapper.getbidSttusList(mainCode);
		return list;
	}
}

