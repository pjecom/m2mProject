package com.m2m.fo.bd.model;

import java.util.Date;

import lombok.Data;

@Data
public class BdListVO {
	
	// 입찰 기본
	private String	bidPblancId;                  //입찰 공고 아이디
	private String	metalCode;                    //금속 코드
	private String	metalCodeNm;                  //금속 코드명
	private String	metalCodeNma;                 //금속 구분
	private String	brandGroupCode;               //브랜드 그룹 코드
	private String	brandGroupCodeNm;             //브랜드 그룹 코드명
	private String	brandCode;                    //브랜드 코드
	private String	brandNm;                      //브랜드 명
	private String	nationCode;                   //국가 코드
	private String	nationUrl;                    //국가 코드 이미지
	private String	itmSn;                        //아이템 순번
	private String	dstrctLclsfCode;              //권역 대분류 코드
	private String	bddprBeginDt;                 //투찰 시작 일시
	private String	bddprEndDt;                   //투찰 종료 일시
	private int	bidSttusCode;                     //입찰 상태 코드
	private String bidSttusCodeNm;                //입찰 상태명
	private int	partcptnEntrpsQy;                 //참여 업체 수량
	private int	intrstEntrpsQy;                   //관심 업체 수량
	private String	dspyAt;                       //전시 여부
	private String	pblancCanclAt;                //공고 취소 여부
	private String	opengDt;                      //개찰 일시
	private String	deleteAt;                     //삭제 여부
	private String	itmPrdlstKorean;              //아이템 품목 한글
	private String	itmPrdlstEng;                 //아이템 품목 영문
	private String	goodsNm;                      //상품 명
	private String	dspyGoodsNm;                  //전시 상품 명
	private int bidWt;                            //수량

	// 입찰 전체 수량 
	private int totalCnt;                         //입찰 전체 목록
	private int expectCnt;                        //입찰상태:입찰예정 
	private int bidingCnt ;                       //입찰상태:투찰중 
	private int endCnt;                           //입찰상태:마감 
	
	
	// 조회 조건
	private String startDt;                       //조회기준:시작날짜
	private String endDt;                         //조회기준:종료날짜
	private String brand;                         //정렬기준:브랜드   00전체 01서구산 02비서구산
	private String area;                          //정렬기준:권역    00전체 01인천 02부산
	private String filter;                        //조회기준:날짜기준 01공고일,02마감일 
	private String frstRegistDt;                  //날짜데이터:테스트데이터
	private String searchDateFrom;
	private String searchDateTo;
	
	// 업체 투찰 상세 
	private String bidEntrpsNo;                  //입찰업체번호
	private String delyCndCode;                  //인도조건코드	
	private String delyCndCodeNm;                //인도조건이름
	private int delyCndStdrPc;                   //인도조건 기준가격
	private int cnvrsPremiumAmount;              //전환 프리미엄 금액
	private int bddprPremiumPc;                  //투찰 프리미엄 가격
	private int bddprWt;                         //투찰중량
	private String partcptnAgreAt;               //참여동의여부
	private String bddprDt;                      //투찰일시
	private String dateString;                   //투찰일시(포맷값)
	private String bddprNrmltAt;                 //투찰정상여부
	private String scsbidAt;                     //낙찰여부
	private String canclAt;                      //취소여부
	private String canclDt;                      //취소날짜

	
	
	//paging test
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	private int bgno;
	
}
