package com.m2m.fo.scheduler;

import java.util.Date;

import lombok.Data;

@Data
public class BdSchedulerVO { 
	
	private String bidPblancId;	/*입찰공고 아이디*/
	private String bddprEndDt;	/*투찰종료일*/
	private long tatalCost;		/*투찰총금액*/
	private String bddprDt;		/*투찰일시*/
	private String bidEntrpsNo;	/*입찰업체번호*/
	private String frstRegisterId;  /*최초등록자ID*/
	private String lastChangerId;	/*최종변경자ID*/
	private String bddprBeginDt;	/*투찰종료일*/
}
