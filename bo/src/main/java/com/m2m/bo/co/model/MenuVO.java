package com.m2m.bo.co.model;


import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MenuVO implements Serializable{
	
	private static final long serialVersionUID = 6882956165304862133L;
	
	/* 메뉴 번호 */
	private int menuNo;
	
	/* 시스템 구분 코드 */
	private String sysSeCode;
	
	/* 상위 메뉴 코드 */
	private int upperMenuNo;
	
	/* 메뉴 레벨 */
	private int menuLevel;
	
	/* 메뉴 명칭 */
//	@NotBlank(message = "소메뉴명을 입력해 주세요.")
	@Size(min=0, max=50, message = "소메뉴명은 50자 미만으로 입력해 주세요.")
	private String menuNm;
	
	/* 메뉴 설명 */
	@Size(min=0, max=500, message = "메뉴 설명은 500자 미만으로 입력해 주세요.")
	private String menuDc;
	
	/* 메뉴 URL */
//	@NotBlank(message = "메뉴 URL을 입력해 주세요.")
	@Size(min=0, max=1000, message = "메뉴 URL은 1000자 미만으로 입력해 주세요.")
	private String menuUrl;
	
	/* 메뉴 순서 */
//	@Max(value = 9999, message = "메뉴순서는 0 ~ 9999 범위의 숫자를 입력해 주세요.")
	private String menuOrdr;
	
	/* 사용 여부 */
	@NotBlank(message = "사용여부를 선택해 주세요.")
	private String useAt;
	
	/* 삭제 여부 */
	private String deleteAt;
	
	/*삭제 일시*/
	private String deleteDt;
	
	/*최초 등록자 아이디*/
	private String frstRegisterId;
	
	/*최초 등록 일시*/
	private String frstRegistDt;
	
	/*최종 변경자 아이디*/
	private String lastChangerId;
	
	/* 최종 변경 일시 */
	private String lastChangeDt;

	/* 메뉴 권한 */
	private String authorNoList;
	
}
