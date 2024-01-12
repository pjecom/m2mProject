package com.m2m.fo.bo.model;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Data
@ToString
@Getter
public class BoBdPblnVO {
	private String bidPblancId; // 입찰공고아이디
	private String bidSttusCode; // 입찰상태코드
	private String bidSttus;     // 입찰상태
	
	//공고정보
	private String metalCode; // 금속코드
	private String metalName;	//금속 이름
	private String metalCodeEm; // 메탈구분(영어)
	private String brandGroupCode; // 브랜드그룹코드
	private String brandGroupCodeNm; // 브랜드그룹이름
	private String brandCode; // 브랜드코드	
	private int itm; // 아이템순번
	private String	itmNm; //아이템명
	private String dspyGoodsNm; // 아이템상품명
	private String dstrctLclsfCode; // 권역대분류코드
	private String dstrctNm; // 권역이름
	private int bidWt; // 입찰중량
	private float permWtRate; // 허용중량비율
	
	private String delyCnd01ApplcAt; //인도조건 01 적용여부 
	private float delyCnd01StdrAt; //인도조건 01 기준가격 
	private float delyCnd01premiumPc; //인도조건 01프리미엄가격 
	private String delyCnd02ApplcAt; //인도조건 02 적용여부 
	private float delyCnd02StdrAt; //인도조건 02 기준가격 
	private float delyCnd02premiumPc; //인도조건 02프리미엄가격 
	private String delyCnd03ApplcAt; //인도조건 03 적용여부 
	private float delyCnd03StdrAt; //인도조건 03 기준가격 
	private float delyCnd03premiumPc; //인도조건 03프리미엄가격
	private String delyBeginDe; // 인도시작일자
	private String delyEndDe; // 인도종료일자
	private String delyPdCn; // 인도기간내용
	
	//가격지정
	private String pcAppnBeginDe; // 가격지정시작일자
	private String pcAppnEndDe; // 가격지정종료일자
	private String pcAppnMthCode; // 가격지정방법코드
	private String pcAppnMthCodeNm; // 가격지정방법
	private String setleCrncyCode; // 결제통화코드
	private String setleMthCode; // 결제방법코드
	private String setlePdCode; // 결제기간코드
	private String setleCndtn; // 결제조건
	private String etcCn; // 기타내용
	
	//투찰기간설정
	private String bddprBeginDt; // 투찰시작일시
	private String bddprEndDt; // 투찰종료일시
	private String bddprCanclPossAt; // 투찰취소가능여부
	private String bddprCanclLmttDe; // 투찰취소제한일자
	
	//공고수정이력
	private String bidUpdtCn; // 입찰수정내용
	private String bidUpdtResn; // 입찰수정사유
	
	private int partcptnEntrpsQy; // 참여업체수량
	private int intrstEntrpsQy; // 관심업체수량
	private String DspyAt; // 전시여부
	private String PblancCanclAt; // 공고취소여부
	private String opengDt; // 개찰일시
	private String deleteAt; // 삭제여부
	private Date deleteDt; // 삭제일시
	
	private String frstRegisterId; // 최초등록자ID
	private Date frstRegistDt; // 최초등록일시
	private String lastChangerId; // 최종변경자ID
	private Date lastChangeDt; // 최종변경일시
}
