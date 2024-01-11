package com.m2m.fo.bd.model;

import java.util.Date;

import lombok.Data;

@Data
public class BdDetailVO {

	// 입찰 기본테이블
	private String bidSttusCode; 				 //입찰상태코드
	private String bidPblancId;                  //입찰공고아이디 
	private String metalCode;                    //금속코드 
	private String metalCodeNm;					 //금속이름
	private String metalCodeEm;					 //금속이름(영어)
	private String brandCode;                    //브랜드그룹코드 
	private String brandGroupCodeNm;			 //브랜드크룹이름
	private int itm ;                            //아이템순번
	private String dspyGoodsNm;					 //아이템상품명
	private String pcImageOneNm;				 //이미지
	private String dstrctLclsfCode;              //권역대분류코드
	private String dstrctNm;					 //권역이름
	private int bidWt;                           //수량
	private float permWtRate;                    //허용중량비율
	private String delyCnd01ApplcAt;             //인도조건 01 적용여부
	private float delyCnd01StdrAt;               //인도조건 01 기준가격
	private float delyCnd01premiumPc;            //인도조건 01 프리미엄가격
	private String delyCnd02ApplcAt;             //인도조건 02 적용여부
	private float delyCnd02StdrAt;               //인도조건 02 기준가격
	private float delyCnd02premiumPc;            //인도조건 02 프리미엄가격
	private String delyCnd03ApplcAt;             //인도조건 03 적용여부
	private float delyCnd03StdrAt;               //인도조건 03 기준가격
	private float delyCnd03premiumPc;            //인도조건 03 프리미엄가격
	private String delyBeginDe;                  //인도시작일자
	private String delyEndDe;                    //인도종료일자
	private String delyPdCn;                     //인도기간내용
	private String pcAppnBeginDe;                //가격지정시작일자
	private String pcAppnEndDe;                  //가격지정종료일자
	private String pcAppnMthCode;                //가격지정방법코드
	private String pcAppnMthCodeNm;				 //가격지정방법이름
	private String setleCrncyCode;               //결제통화코드
	private String setleCrncyCodeNm;             //결제통화이름
	private String setleMthCode;                 //결제방법코드
	private String setleMthCodeNm;				 //결제방법이름
	private String setlePdCode;                  //결제기간코드
	private String setlePdCodeNm;                //결제기간이름
	private String etcCn;                        //기타내용
	private String bddprBeginDt;                 //투찰시작일시
	private String bddprEndDt;                   //투찰종료일시
	private String bddprCanclPossAt;             //투찰취소가능여부
	private String bddprCanclLmttDe;             //투찰취소제한일자
	private int PartcptnEntrpsQy;                //참여업체수량
	private int intrstEntrpsQy;                  //관심업체수량 
	private String DspyAt;                       //전시여부
	private String PblancCanclAt;                //공고취소여부 
	private String opengDt;                      //개찰일시
	private String deleteAt;                     //삭제여부 
	private Date deleteDt;                       //삭제일시
	private String frstRegisterId;               //최초등록자ID
	private Date frstRegistDt;                   //최초등록일시
	private String lastChangerId;                //최종변경자ID
	private Date lastChangeDt;                   //최종변경일시
	private String codeDctwo;					 //공통코드(코드2) 
	
	// 투찰 상세
	private String bidEntrpsNo;					 // 입찰업체번호
	private String bidMberSecretNo;				 // 입찰회원비밀번호
	
}
