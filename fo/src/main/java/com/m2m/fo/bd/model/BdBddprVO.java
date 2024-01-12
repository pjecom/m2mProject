package com.m2m.fo.bd.model;

import java.util.Date;

import lombok.Data;

@Data
public class BdBddprVO { 
	
	// 투찰 상세
	private String bidEntrpsNo;					 //입찰업체번호
	private String bidPblancId;                  //입찰공고아이디
	private String delyCndCode;					 //인도조건코드	
	private String delyCndCodeNm;				 //인도조건이름
	private int delyCndStdrPc;					 //인도조건 기준가격
	private int cnvrsPremiumAmount;				 //인도프리미엄 금액
	private int bddprPremiumPc;					 //인도프리미엄 가격
	private int bddprWt;						 //투찰중량
	private String partcptnAgreAt;				 //참여동의여부
	private Date bddprDt;						 //투찰일시
	private String dateString;					 //투찰일시(포맷값)
	private String bddprNrmltAt;				 //투찰정상여부
	private String scsbidAt;					 //낙찰여부
	private String canclAt;						 //취소여부
	private String deleteAt;					 //삭제여부
	private String frstRegisterId;				 //최초등록자아이디
	private Date frstRegistDt;					 //최초등록일시
	private String lastChangerId;				 //최종변경자아이디
	private Date lastChangeDt;					 //최종변경일시
	private String pcAppnBeginDe;				 //가격지정시작일자
	private String pcAppnEndDe;					 //가격지정종료일자
	private int partEntQy;						 //참여업체수량
	private String bddprFlag;					 //플래그값(투찰상세 조회시)
	
}
