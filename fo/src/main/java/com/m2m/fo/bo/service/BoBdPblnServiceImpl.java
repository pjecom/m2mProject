package com.m2m.fo.bo.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m2m.fo.bo.mapper.BoBdPblnMapper;
import com.m2m.fo.bo.model.BoBdBddprVO;
import com.m2m.fo.bo.model.BoBdPblnUpdtVO;
import com.m2m.fo.bo.model.BoBdPblnVO;
import com.m2m.fo.bo.model.BoCoCommCdVO;
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
	public List<BoBdPblnUpdtVO> getBobdUptHist(BoBdPblnVO vo) throws Exception {
		
		List<BoBdPblnUpdtVO> BoBdPblnUpdtList = boBdPblnMapper.getBobdUptHist(vo); 
		
		// 날짜 포맷 수정
		for(BoBdPblnUpdtVO boBdPblnUpdtVO : BoBdPblnUpdtList) {
			Date lastChangeDt = boBdPblnUpdtVO.getLastChangeDt();
			
			SimpleDateFormat dateToString = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
            String lastChangeDtString = dateToString.format(lastChangeDt);
            
            boBdPblnUpdtVO.setLastChangeDtString(lastChangeDtString);
		}
		
		return BoBdPblnUpdtList;
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
	public List<CoCommCdVO> getbidSttusList(String mainCode) {
		List<CoCommCdVO> list = boBdPblnMapper.getbidSttusList(mainCode);
		return list;
	}

	@Override
	public int getCntByBidSttus(String subCode) {
		return boBdPblnMapper.getCntByBidSttus(subCode);
	}

	@Override
	public List<BoCoCommCdVO> getBoCommCdList() {
		return boBdPblnMapper.getBoCommCdList();
	}

	@Override
	public List<BoBdPblnVO> getBoBdBrandGrpList() {
		return boBdPblnMapper.getBoBdBrandGrpList();
	}


	@Override
	public List<BoBdPblnVO> getBoBdItemList() {
		return boBdPblnMapper.getBoBdItemList();
	}

	@Override
	public void updateBoBdPblnDtl(BoBdPblnVO boBdPblnVO) {
		boBdPblnMapper.updateBoBdPblnDtl(boBdPblnVO);
	}

	@Override
	public void istboBdPbln(BoBdPblnVO boBdPblnVO) {
		boBdPblnMapper.istboBdPbln(boBdPblnVO);
	}

	@Override
	public void cancelBoBdPbln(BoBdPblnVO boBdPblnVO) {
		boBdPblnMapper.cancelBoBdPbln(boBdPblnVO);
		
	}

	@Override
	public void failBoBdPbln(BoBdPblnVO boBdPblnVO) {
		boBdPblnMapper.failBoBdPbln(boBdPblnVO);
		
	}

	@Override
	public void insertBobdUptHist(BoBdPblnVO boBdPblnVO) {
		boBdPblnMapper.insertBobdUptHist(boBdPblnVO);	
	}

	@Override
	public void deleteBoBdPbln(BoBdPblnVO boBdPblnVO) {
		boBdPblnMapper.deleteBoBdPbln(boBdPblnVO);
		
	}
}
