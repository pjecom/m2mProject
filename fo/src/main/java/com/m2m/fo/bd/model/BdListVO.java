package com.m2m.fo.bd.model;

import lombok.Data;

@Data
public class BdListVO {
	private String	bidPblancId; //입찰 공고 아이디
	private String	metalCode;	//금속 코드
	private String	brandGroupCode;	//브랜드 그룹 코드
	private String	brandCode;	//브랜드 코드
	private String	itmSn;	//아이템 순번
	private String	dstrctLclsfCode;	//권역 대분류 코드
	private String	bddprBeginDt;	//투찰 시작 일시
	private String	bddprEndDt;	//투찰 종료 일시
	private int	bidSttusCode;	//입찰 상태 코드
	private int	partcptnEntrpsQy;	//참여 업체 수량
	private int	intrstEntrpsQy;	//관심 업체 수량
	private String	dspyAt;	//전시 여부
	private String	pblancCanclAt;	//공고 취소 여부
	private String	opengDt;	//개찰 일시
	private String	deleteAt;	//삭제 여부
	private String	itmPrdlstKorean;	//아이템 품목 한글
	private String	itmPrdlstEng;	//아이템 품목 영문
	private String	goodsNm;	//상품 명
	private String	dspyGoodsNm;	//전시 상품 명
	private String	brandNm;	//브랜드 명
	private String	nationCode;	//국가 코드
	private int totalCnt;
	private int expectCnt;
	private int bidingCnt;
	private int endCnt;
	private String codeDctwo;
}
