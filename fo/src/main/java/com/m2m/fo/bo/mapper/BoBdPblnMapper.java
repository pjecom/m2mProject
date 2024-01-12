package com.m2m.fo.bo.mapper;

import java.util.List;

import com.m2m.fo.bd.model.BdListVO;
import com.m2m.fo.bo.model.BoBdPblnVO;

public interface BoBdPblnMapper {
	public List<BoBdPblnVO> boBdPblnDtl(BoBdPblnVO vo);

	List<BoBdPblnVO> getBoBdPblnList(BoBdPblnVO vo);

	BoBdPblnVO getBoBdPblnListTotalCnt(BoBdPblnVO vo);
}
