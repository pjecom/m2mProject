package com.m2m.fo.bd.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m2m.fo.bd.mapper.BdMainMapper;
import com.m2m.fo.bd.model.BdBddprVO;
import com.m2m.fo.bd.model.BdDetailVO;
import com.m2m.fo.bd.model.BdListVO;
import com.m2m.fo.sample.model.SampleVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BdMainServiceImpl implements BdMainService {
	
	@Autowired
	private BdMainMapper bdMainMapper;

	public String getString() {
		return "abc";
	}
	public List<BdListVO> getBdList(BdListVO vo) throws Exception {
		List<BdListVO> list = bdMainMapper.getBdList(vo);
		return list;
	}
	@Override
	public BdListVO getBdListTotalCnt(BdListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bdMainMapper.getBdListTotalCnt(vo);
	}

	public List<BdListVO> mypageList(BdListVO vo) throws Exception {
		List<BdListVO> list = bdMainMapper.bdMypageList(vo);
		for(BdListVO vo1 : list) {
			// 현재 문자열 형식
	        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");

	        // 변환할 문자열 형식
	        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

	        Date BeginDate = inputFormat.parse(vo1.getBddprBeginDt());
	        Date EndDate = inputFormat.parse(vo1.getBddprEndDt());
	        
	        //투찰기간시작일
	        String bddrBeginDate = outputFormat.format(BeginDate);
	        //투찰기간종료일
	        String bddrEndDate = outputFormat.format(EndDate);
	        
	        vo1.setBddprBeginDt(bddrBeginDate);
	        vo1.setBddprEndDt(bddrEndDate);
		}
		return list;
	}
	public BdListVO bdMypageCount(BdListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bdMainMapper.bdMypageCount(vo);
	}
	
	@Override
	public List<BdListVO> selectbdDelyCndList(BdListVO vo) {

		return bdMainMapper.selectbdDelyCndList(vo);
	}
	
	@Override
	public List<BdListVO> selectbdDelyList(BdListVO vo) {

		return bdMainMapper.selectbdDelyList(vo);
	}
	
	public void likeUpdate(BdListVO vo) throws Exception {
		bdMainMapper.likeUpdate(vo);
		bdMainMapper.likeUpdateCnt(vo);
		
		
	}
	public List<BdListVO> mypageLikeList(BdListVO vo) throws Exception {
		List<BdListVO> list = bdMainMapper.bdMypageLikeList(vo);
		for(BdListVO vo1 : list) {
			// 현재 문자열 형식
	        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");

	        // 변환할 문자열 형식
	        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

	        Date BeginDate = inputFormat.parse(vo1.getBddprBeginDt());
	        Date EndDate = inputFormat.parse(vo1.getBddprEndDt());
	        
	        //투찰기간시작일
	        String bddrBeginDate = outputFormat.format(BeginDate);
	        //투찰기간종료일
	        String bddrEndDate = outputFormat.format(EndDate);
	        
	        vo1.setBddprBeginDt(bddrBeginDate);
	        vo1.setBddprEndDt(bddrEndDate);
		}
		return list;
	}
	public BdListVO bdMypageLikeCnt(BdListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bdMainMapper.bdMypageLikeCnt(vo);
	}

	
	

}
