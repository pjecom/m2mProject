package com.m2m.fo.bo.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoBdPblnUpdtVO {
	private int bidUpdtHstSn;                 //입찰수정이력순번 
	private String bidPblancId;               //입찰공고아이디
	private String bidUpdtCn;                 //입찰수정내용
	private String bidUpdtResn;               //입찰수정사유
	private String frstRegisterId;            //최초등록자ID
	private Date frstRegistDt;                //최초등록일시
	private String lastChangerId;             //최종변경자ID
	private Date lastChangeDt;                //최종변경일시
	private String lastChangeDtString;		  //최종변경일시(날짜포맷)
}
