package com.m2m.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m2m.sample.mapper.SampleMapper;
import com.m2m.sample.model.SampleVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SampleServiceImpl implements SampleService {
	
	@Autowired
	private SampleMapper sampleMapper;

	@Override
	public SampleVO getNoticeSj(SampleVO vo) throws Exception {
		log.info("dkssudgktpdy");
		return sampleMapper.getNoticeSj(vo);
	}

}
