package com.m2m.bo.co.model;


import java.util.Map;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MenuTreeVO extends MenuVO{

	private static final long serialVersionUID = 6882956165304862133L;

	/** 아이디 */
	private String id;

	/** 이름 */
	private String text;

	/** 부모 아이디 */
	private String parent;

	/** 속성값 */
	private Map<String , Boolean> state;
	
	/** 메뉴 번호 현재값 */
	private int curMenuNo;
	
	/** 엑셀 json 데이터 */
	private String excelData;
	
	/** 엑셀 시스템 구분 */
	private String excelSysSeCode;

	public MenuTreeVO() {}
	
	public MenuTreeVO(String id, String text, String parent, Map<String, Boolean> state, String sysSeCode) {
		super();
//		super.setSysSeCode(sysSeCode);
		this.id = id;
		this.text = text;
		this.parent = parent;
		this.state = state;
	}
}