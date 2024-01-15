package com.m2m.fo.bd.model;

import java.util.Date;

import lombok.Data;

@Data
public class bdUpdateVO { 
	
private String bidUdptHstSn;
	
	private int bidUpdtHstSn;	//입찰 수정 이력 순번
	private String bidPblancId;	//입찰공고아이디
	private String bidUpdtCn;	//입찰 수정 내용
	private String bidUpdtResn;	//입찰 수정 사유
	private String frstRegisterId;	//최초 등록자 아이디
	private String frstRegistDt;	//최초 등록 일시
	private String lastChangerId;	//최종 변경자 아이디
	private String lastChangeDt;	//최종 변경 일시
	private String frstDateString;	//최초 등록 일시(포맷)
	
}
