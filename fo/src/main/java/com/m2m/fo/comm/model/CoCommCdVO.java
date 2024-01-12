package com.m2m.fo.comm.model;

import lombok.Data;

@Data
public class CoCommCdVO {

    private String mainCode; // 메인 코드
    private String subCode; // 서브 코드
    private String extrlSysMainCode; // 외부 시스템 메인 코드
    private String codeNm; // 코드 명
    private int codeLt; // 코드 길이
    private int codeOrdr; // 코드 순서
    private String codeDcone; // 코드 설명 1
    private String codeDctwo; // 코드 설명 2
    private String codeRefrnone; // 코드 참조 1
    private String codeRefrntwo; // 코드 참조 2
    private String codeRefrnthree; // 코드 참조 3
    private String codeChrctrRefrnone; // 코드 문자 참조 1
    private String codeChrctrRefrntwo; // 코드 문자 참조 2
    private String codeChrctrRefrnthree; // 코드 문자 참조 3
    private String codeChrctrRefrnfour; // 코드 문자 참조 4
    private String codeChrctrRefrnfive; // 코드 문자 참조 5
    private String codeChrctrRefrnsix; // 코드 문자 참조 6
    private int codeNumberRefrnone; // 코드 숫자 참조 1
    private int codeNumberRefrntwo; // 코드 숫자 참조 2
    private int codeNumberRefrnthree; // 코드 숫자 참조 3
    private int codeNumberRefrnfour; // 코드 숫자 참조 4
    private String sysAt; // 시스템 여부
    private String extrlSysUseAt; // 외부 시스템 사용 여부
    private String useAt; // 사용 여부
    private String extrlSysIntrlckAt; // 외부 시스템 연동 여부
    private String deleteAt; // 삭제 여부
    private String deleteDt; // 삭제 일시
    private String frstRegisterId; // 최초 등록자 아이디
    private String lastChangerId; // 최초 등록 일시
    private String lastchangeDt; // 최초 변경 일시
}
