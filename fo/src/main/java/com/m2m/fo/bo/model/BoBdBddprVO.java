package com.m2m.fo.bo.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoBdBddprVO { 
	
	private String bidEntrpsNo;                  //입찰업체번호
	private String entrpsNm;                     //참여업체명
	private String bidPblancId;                  //입찰공고아이디
	private String delyCndCode;                  //인도조건코드	
	private float delyCndStdrPc;                 //인도조건 기준가격
	private float cnvrsPremiumAmount;            //인도프리미엄 금액
	private float bddprPremiumPc;                //투찰프리미엄 가격
	private int bddprWt;                         //투찰중량
	private String partcptnAgreAt;               //참여동의여부
	private String bddprDt;                      //투찰일시
	private String bddprNrmltAt;                 //투찰정상여부
	private int opengRank;                       //개찰순위
	private String opengDt;                      //개찰일시
	private String scsbidAt;                     //낙찰여부
	private String scsbidDt;                     //낙찰일시
	private String canclAt;                      //취소여부
	private String canclDt;                      //취소일시
	private String deleteAt;                     //삭제여부
	private Date deleteDt;                       //삭제일시
	private String frstRegisterId;               //최초등록자아이디
	private Date frstRegistDt;                   //최초등록일시
	private String lastChangerId;                //최종변경자아이디
	private Date lastChangeDt;                   //최종변경일시
	
}
