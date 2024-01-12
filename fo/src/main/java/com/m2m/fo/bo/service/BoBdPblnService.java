package com.m2m.fo.bo.service;

import java.util.List;

import com.m2m.fo.bd.model.BdListVO;
import com.m2m.fo.bo.model.BoBdPblnVO;

public interface BoBdPblnService {
	public List<BoBdPblnVO> boBdPblnDtl(BoBdPblnVO vo) throws Exception;

	List<BoBdPblnVO> getBoBdPblnList(BoBdPblnVO vo) throws Exception;

	BoBdPblnVO getBoBdPblnListTotalCnt(BoBdPblnVO vo) throws Exception;
}
