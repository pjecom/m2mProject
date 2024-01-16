package com.m2m.fo.bo.mapper;

import java.util.List;

import com.m2m.fo.bo.model.BoBdBddprVO;
import com.m2m.fo.bo.model.BoBdPblnUpdtVO;
import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.comm.model.CoCommCdVO;

public interface BoBdPblnMapper {
	List<BoBdPblnVO> getBoBdPblnDtl(BoBdPblnVO vo);
	
	List<BoBdPblnUpdtVO> getBobdUpdateHistroy (BoBdPblnVO vo);
	
	List<BoBdBddprVO> getBdEntrpsList (BoBdPblnVO vo);
	List<BoBdPblnVO> getBoBdPblnList(BoBdPblnVO vo);

	BoBdPblnVO getBoBdPblnListTotalCnt(BoBdPblnVO vo);

	List<CoCommCdVO> getbidSttusList(String mainCode);
}
