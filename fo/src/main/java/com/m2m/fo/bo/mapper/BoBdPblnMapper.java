package com.m2m.fo.bo.mapper;

import java.util.List;

import com.m2m.fo.bo.model.BoBdBddprVO;
import com.m2m.fo.bo.model.BoBdPblnUpdtVO;
import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.bo.model.BoCoCommCdVO;
import com.m2m.fo.comm.model.CoCommCdVO;

public interface BoBdPblnMapper {
	List<BoBdPblnVO> getBoBdPblnDtl(BoBdPblnVO vo);
	
	List<BoBdPblnUpdtVO> getBobdUptHist (BoBdPblnVO vo);
	
	List<BoBdBddprVO> getBdEntrpsList (BoBdPblnVO vo);
	
	List<BoBdPblnVO> getBoBdPblnList(BoBdPblnVO vo);

	List<CoCommCdVO> getbidSttusList(String mainCode);

	int getCntByBidSttus(BoBdPblnVO bdPblnVO);

	List<BoCoCommCdVO> getBoCommCdList();

	List<BoBdPblnVO> getBoBdBrandGrpList();
	
	List<BoBdPblnVO> getBoBdItemList();

	void updateBoBdPblnDtl(BoBdPblnVO boBdPblnVO);

	void istboBdPbln(BoBdPblnVO boBdPblnVO);

	void cancelBoBdPbln(BoBdPblnVO boBdPblnVO);
}
