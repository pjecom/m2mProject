package com.m2m.fo.bo.model;

import lombok.Data;

import java.util.Date;

@Data
public class BoMberVO {

    // 순번
    private int rowNum;

    // 검색 구분
    private String schGubun;

    // 검색 내용
    private String schData;

    // 입찰 업체 번호(PK)
    private String bidEntrpsNo;

    // 입찰 회원 아이디
    private String bidMberId;

    // 입찰 회원 비밀 번호
    private String bidMberSecretNo;

    // 업체 명
    private String entrpsNm;

    // 사업자 등록 번호
    private String bsnmRegistNo;

    // 입찰 회원 이메일
    private String bidMberEmail;

    // 휴대폰 번호
    private String moblphonNo2;

    // 추가 항목
    private String aditIem;

    // 외국 업체 여부
    private String frntnEntrpsAt;

    // 대행 업체 명
    private String vrscEntrpsNm;

    // 대행 사업자 등록 번호
    private String vrscBsnmRegistNo;

    // 대행 입찰 회원 이메일
    private String vrscBidMberEmail;

    // 대행 휴대폰 번호
    private String vrscMoblphonNo;

    // 추가 항목2
    private String aditIem2;

    // 입찰 회원 상태 코드
    private String bidMberSttusCode;

    // 입찰 회원 상태 명
    private String bidMberSttus;

    // 입찰 승인 상태 코드
    private String bidConfmSttusCode;

    // 입찰 승인 상태 명
    private String bidConfmSttus;

    // 입찰 승인 상세 상태 코드
    private String bidConfmDetailSttusCode;

    // 가입 승인 요청 일시
    private Date etrConfmRequstDt;

    // 가입 승인 처리 일시
    private Date etrConfmProcessDt;

    // 변경 승인 요청 일시
    private Date changeConfmRequstDt;

    // 변경 승인 처리 일시
    private Date changeConfmProcessDt;

    // 입찰 회원 가입 일시
    private Date bidMberEtrDt;

    // 입찰 회원 차단 일시
    private Date bidMberIntrcpDt;

    // 입찰 회원 차단 내용
    private String bidMberIntrcpCn;

    // 낙찰 건수
    private int bdScsCnt;

    // 패찰 건수
    private int bdfailCnt;

    // 투찰 취소 건수
    private int bddprCanclCo;

    // 변경 휴대폰 번호
    private String changeMoblphonNo2;

    // 변경 대행 휴대폰 번호
    private String changeVrscMoblphonNo;

    // 변경 입찰 회원 비밀 번호
    private String changeBidMberSecretNo;

    // 삭제 여부
    private String deleteAt;

    // 삭제 일시
    private Date deleteDt;

    // 최초 등록자 아이디
    private String frstRegisterId;

    // 최초 등록 일시
    private Date frstRegistDt;

    // 최종 변경자 아이디
    private String lastChangerId;

    // 최종 변경 일시
    private Date lastChangeDt;
}
