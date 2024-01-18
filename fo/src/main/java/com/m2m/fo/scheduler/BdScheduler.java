package com.m2m.fo.scheduler;

public interface BdScheduler {
	//최저가 낙찰
	void lowDibSheduler();
	
	//투찰중 변환 스케쥴러
	void changeBid();
}
