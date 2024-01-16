package com.m2m.fo.signup.model;

import java.util.Date;

import lombok.Data;

@Data
public class SignupVO {
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

		// 입찰 승인 상태 코드
		private String bidConfmSttusCode;

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

		// 이용 약관 동의 여부
		private String useStplatAgreAt;

		// 이용 약관 동의 일시
		private Date useStplatAgreDt;

		// 개인 정보 3자 제공 동의 여부
		private String indvdlInfoThreemanProvdAgreAt;

		// 개인 정보 3자 제공 동의 일시
		private Date indvdlInfoThreemanProvdAgreDt;

		// 개인 정보 처리 방침 동의 여부
		private String indvdlInfoProcessPolcyAgreAt;

		// 개인 정보 처리 방침 동의 일시
		private Date indvdlInfoProcessPolcyAgreDt;

		// 마케팅 수신 동의 여부
		private String marktRecptnAgreAt;

		// 마케팅 수신 동의 일시
		private Date marktRecptnAgreDt;

		// 회원 문자 수신 동의 여부
		private String mberChrctrRecptnAgreAt;

		// 회원 문자 수신 동의 일시
		private Date mberChrctrRecptnAgreDt;

		// 회원 메일 수신 동의 여부
		private String mberEmailRecptnAgreAt;

		// 회원 메일 수신 여부 일시
		private Date mberEmailRecptnAgreDt;

		// 회원 푸시 수신 동의 여부
		private String mberPushRecptnAgreAt;

		// 회원 푸시 수신 동의 일시
		private Date mberPushRecptnAgreDt;

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
