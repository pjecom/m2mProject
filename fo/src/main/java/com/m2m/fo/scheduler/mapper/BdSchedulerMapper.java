package com.m2m.fo.scheduler.mapper;

import java.util.List;

import com.m2m.fo.scheduler.BdSchedulerVO;

public interface BdSchedulerMapper {

	List<BdSchedulerVO> selectBidList();

	List<BdSchedulerVO> selectCmpList(BdSchedulerVO schedulerVO);

	void updateFirstCom(BdSchedulerVO cmpVO);

	void insetScsbidDtl(BdSchedulerVO cmpVO);

	void updateOtherCom(BdSchedulerVO cmpVO);

	void updateNoneCom(BdSchedulerVO cmpVO);

	List<BdSchedulerVO> selectPlanList();

	void updateBidPlan(BdSchedulerVO schedulerVO);
	
}
