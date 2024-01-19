package com.m2m.fo.bo.model;

import lombok.Data;

@Data
public class BoCoCommCdVO {

    private String mainCode; // 메인코드
    private String subCode; // 서브코드
    private String codeNm; // 코드명
    private int codeLt; // 코드 길이
    private int codeOrdr; // 코드순서
    private String codeDcone; // 코드설명1
    private String codeDctwo; // 코드설명2
}
