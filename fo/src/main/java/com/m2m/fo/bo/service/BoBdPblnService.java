package com.m2m.fo.bo.service;

import java.util.List;

import com.m2m.fo.bo.model.BoBdBddprVO;
import com.m2m.fo.bo.model.BoBdPblnUpdtVO;
import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.bo.model.BoCoCommCdVO;
import com.m2m.fo.comm.model.CoCommCdVO;

public interface BoBdPblnService {
	List<BoBdPblnVO> getBoBdPblnDtl(BoBdPblnVO vo) throws Exception;
	
	List<BoBdPblnUpdtVO> getBobdUptHist (BoBdPblnVO vo) throws Exception;

	List<BoBdBddprVO> getBdEntrpsList (BoBdPblnVO vo) throws Exception;
	
	List<BoBdPblnVO> getBoBdPblnList(BoBdPblnVO vo) throws Exception;

	BoBdPblnVO getBoBdPblnListTotalCnt(BoBdPblnVO vo) throws Exception;

    List<CoCommCdVO> getbidSttusList(String mainCode);
	
	List<BoCoCommCdVO> getBoCommCdList();
	
	List<BoBdPblnVO> getBoBdBrandGrpList();
	
	List<BoBdPblnVO> getBoBdItemList();

	


	
}
