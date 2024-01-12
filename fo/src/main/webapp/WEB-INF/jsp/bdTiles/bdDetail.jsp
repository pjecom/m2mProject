<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="title" content="서린상사">
    <link rel="shortcut icon" href="/guide/images/favicon.ico">
    <meta name="keywords" content="서린상사, 서린상사(주), 비철금속전문기업, 아연, 황산">
    <meta name="description" content="세계를 선도하는 종합비철무역상사 - 서린상사">
    <title>구매입찰시스템 | SORIN e-Commerce</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="/guide/css/common.css">
    <link rel="stylesheet" href="/guide/css/sorin.css">
    <link rel="stylesheet" href="/guide/css/select2/select2.min.css">
    <!-- script core :: START -->
    <script src="/guide/js/jquery-3.6.0.min.js"></script>
	<script src="/guide/js/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="/guide/js/select2/select2.min.js"></script>
    <!-- script core :: END -->
</head>
<body>
	<!-- wrapper :: START -->
    <div class="wrapper pt0">

        <!-- 23.10.16 | header include -->
        <div class="header bid"></div>
        <script type="text/javascript"> $(".header.bid").load("/guide/html/bid/include/header.html");</script>
        <!-- // 23.10.16 | header include -->
        
		<!-- body-main :: START -->
		<div class="body-main">
			<!-- container :: START -->
			<div class="container">
				<!-- section #1 구매입찰 공고 LIST :: START -->
				<div class="section prod-detail-wrap bid">
					<div class="inwrap">
			            <!-- ITEM TITLE :: START  -->
			            <h2 class="h2-new">공고 상세 정보${bdBddprVO.dateString} ${bdBddprVO.bddprFlag} ${bdBddprVO.delyCndCodeNm}</h2>
			            <!-- ITEM TITLE :: END  -->	            
			            <!-- ITEM DETAIL AREA :: START -->
						<ul class="list t2">
			                <!-- LIST ITEM DETAIL : 입찰예정 :: START -->
			                <li>
			                    <div class="cart-item-wrap type4">
			                        <figure class="figure figure1">	
			                            <img src="/images/my/al_sum.jpg" alt="알루미늄" class="w">
			                        </figure>
			                        <div class="figure-con">
			                            <div class="pd-brand-info">
			                            	<h3 class="pd-bid-no">${bdDetailVO.bidPblancId}</h3>
			                                <div class="pd-wrap">
			                                    <div class="pd-brand">
			                                        <div class="pd-label">${bdDetailVO.metalCodeEm}</div>
			                                        <div class="brand-nation">
			                                            <img src="https://sorincorp.blob.core.windows.net/secs-t/odflag/flag_mcht_australia.png">
			                                        </div>
			                                        ${bdDetailVO.brandCode}
			                                    </div>
			                                    <div class="pd-like">
			                                        <ul class="company">
			                                            <li>
			                                                <span>참여기업</span>
			                                                <span>16</span>
			                                            </li>
			                                            <li>
			                                                <span>관심기업</span>
			                                                <span>26</span>
			                                            </li>
			                                        </ul>
			                                        <a href="#" class="ico like active">
			                                            <span class="material-symbols-outlined">favorite</span>
			                                            <span>관심추가</span>
			                                        </a>
			                                    </div>
			                                </div>
			                                <div class="pd-name">
			                                    <span class="item">${bdDetailVO.dspyGoodsNm}</span>
			                                    <span class="wrhous">출고권역 - ${bdDetailVO.dstrctNm}</span>
			                                    <span class="brand-group">${bdDetailVO.brandGroupCodeNm}</span>
			                                </div>
			                                <div class="pd-period">
			                                    <span class="qty">수량 <span class="highlight">100MT</span></span>	
			                                    <span class="date">투찰기간 <span class="highlight">22.10.20 11:00:00 ~ 22.10.30 18:00:00</span></span> 
			                                	<span class="t-info">개찰결과 : 투찰 기한 마감과 동시에 발표함</span>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="btns bid-state">
										<!-- ###################### START 입찰상태코드(디폴트값:마감으로 셋팅) ######################-->
										<c:choose>
											<c:when test="${bdDetailVO.bidSttusCode eq '12'}">
												<div class="btn-bid-stroke">입찰예정</div>
											</c:when>
											<c:when test="${bdDetailVO.bidSttusCode eq '13'}">
												<div class="btn-bid-stroke">투찰중</div>
											</c:when>
											<c:when test="${bdDetailVO.bidSttusCode eq '21'}">
												<div class="btn-bid-stroke">개찰중</div>
											</c:when>
											<c:when test="${bdDetailVO.bidSttusCode eq '30'}">
												<div class="btn-bid-stroke">마감(미투찰)</div>
											</c:when>
											<c:when test="${bdDetailVO.bidSttusCode eq '31'}">
												<div class="btn-bid-stroke">마감(최종낙찰)</div>
											</c:when>
											<c:when test="${bdDetailVO.bidSttusCode eq '32'}">
												<div class="btn-bid-stroke">마감(유찰)</div>
											</c:when>
											<c:when test="${bdDetailVO.bidSttusCode eq '34'}">
												<div class="btn-bid-stroke">마감(페찰)</div>
											</c:when>
											<c:otherwise>
												<div class="btn-bid-stroke">마감</div>
											</c:otherwise>
										</c:choose>
										<!-- ###################### END 입찰상태코드(디폴트값:마감으로 셋팅) ######################-->
 									</div>
		                        	<p class="bid-d-day abs-info"> <!-- <p class="bid-d-day pre abs-info"> -->
		                        		투찰 시작까지 <span class="time">- 3일 3시간 20분 36초</span>
		                        	</p>
			                    </div>
			                </li>
			                <!-- item 1 입찰예정 :: END -->
			                <!-- 투찰 정보 입력 TABLE :: START -->
			                <div class="section bid-tbl-wrap">
			                    <div class="hgroup">
			                        <h2 class="h3">투찰 정보 입력</h2>
			                    </div>
			                    <table class="tbl-v bid th-left">
			                        <caption>투찰정보 - 메탈구분, 브랜드, 아이템 상품명, 권역, 수량, 중량허용공차 제공</caption>
			                        <colgroup>
			                            <col style="width:20rem;">
			                            <col>
			                            <col style="width:20rem;">
			                            <col>
			                        </colgroup>
			                        <tbody>
			                            <tr>
			                                <th scope="row">메탈구분</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.metalCodeNm}</div>
			                                </td>
			                                <th scope="row">아이템 상품명</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.dspyGoodsNm}</div>
			                                </td>	
			                            </tr>
			                            <tr>
			                                <th scope="row">권역</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.dstrctNm}</div>
			                                </td>
			                                <th scope="row">브랜드</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.brandGroupCodeNm}</div>
			                                </td>			                                
			                            </tr>
			                            <tr>
			                                <th scope="row">수량(개)</th>
			                                <td>	
			                                    <div class="read"><fmt:formatNumber value="${bdDetailVO.bidWt}" pattern="#,###"/></div>
			                                </td>
			                                <th scope="row">중량허용공차(±)</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.permWtRate}%</div>
			                                </td>
			                            </tr>
										<!-- ###################### START 입찰예정 ######################-->
										<c:if test="${bdDetailVO.bidSttusCode eq '12'}">
											<tr>
												<th scope="row">인도 조건</th>
												<td colspan="3"><span class="icon-info-txt">시작 전입니다.</span></td>
											</tr>
											<tr>
												<th scope="row">프리미엄 가격(USD/MT)</th>
												<td colspan="3"><span class="icon-info-txt">시작 전입니다.</span></td>
											</tr>
										</c:if>
										<!-- ###################### END 입찰예정 ######################-->
										<!-- ###################### START 마감(내가 참여하지 않은 마감건) ######################-->
										<c:if test="${bdDetailVO.bidSttusCode eq '30'}">
											<tr>
												<th scope="row">인도 조건</th>
												<td colspan="3"><span class="icon-info-txt">마감 된 공고입니다.</span></td>
											</tr>
											<tr>
												<th scope="row">프리미엄 가격(USD/MT)</th>
												<td colspan="3"><span class="icon-info-txt">마감 된 공고입니다.</span></td>
											</tr>
										</c:if>
										<!-- ###################### END 마감(내가 참여하지 않은 마감건) ######################-->
										<!-- ###################### START 투찰중(투찰 최종가격) ######################-->
										<c:if test="${bdDetailVO.bidSttusCode eq '13'}">
											<!-- 입찰전과 입찰후의 값이 다름 -> flag 값을 이용해서 분기처리 -->
											<c:if test="${bdBddprVO.bddprFlag eq 'Y'}">
												<tr class="bid-condition">
													<th class="fc-red" rowspan="2" scope="row">인도 조건</th>
													<td colspan="2">
														<div class="tb-select">
															<div class="read">${bdBddprVO.delyCndCodeNm}</div>
														</div>
													</td>									
													<td colspan="1"><input class="input-lg" type="number" name="" id="delyCndStdrPc" value="${bdBddprVO.delyCndStdrPc}"></td>
												</tr>
												<tr class="bid-condition bid-condition2 read">
													<td class="right-narrow" colspan="2">
														<div class="input-btn-wrap">
															<div class="r-info">+전환 프리미엄가</div>
														</div>
													</td>
													<td colspan="1"><input class="input-lg" type="number" name="" id="cnvrsPremiumAmount" value="${bdBddprVO.cnvrsPremiumAmount}"></td>                                
												</tr>			                            
												<tr>
													<th class="fc-red" rowspan="2" scope="row">프리미엄 가격(USD/MT)</th>
													<td class="bg-orange1" colspan="2">투찰 프리미엄 가격</td>
													<td class="bg-orange2" colspan="1">투찰 최종 가격</td>
												</tr>		
												<tr>
													<td class="center read" colspan="2">
														<input class="input-md" type="number" name="premium" id="bddprPremiumPc" value="${bdBddprVO.bddprPremiumPc}">/MT</td>
													<td class="center" colspan="1" id="result"><span></span> 원</td>                                  
												</tr>
											</c:if>	
											<c:if test="${bdBddprVO.bddprFlag ne 'Y'}">
												<tr class="bid-condition">
													<th class="fc-red" rowspan="2" scope="row">인도 조건</th>
													<td colspan="2">
														<div class="tb-select">
															<label for="shippingAddr">검색조건</label>
															<select name="shippingAddr" id="shippingAddr">
																<option>옵션</option>
																<c:forEach var="item" items="${bdDelyCndList}">
																	<option value="${item.codeDcone}">${item.codeDctwo}</option>
																</c:forEach>
															</select>
														</div>
													</td>
													<td colspan="1"><input class="input-lg" type="number" name="" id="delyCndStdrPc" onchange='Change()' value="100" placeholder=""></td>
												</tr>
												<tr class="bid-condition bid-condition2">
													<td class="right-narrow" colspan="2">
														<div class="input-btn-wrap">
															<div class="r-info">+전환 프리미엄가</div>
														</div>
													</td>
													<td colspan="1"><input class="input-lg" type="number" name="" id="cnvrsPremiumAmount" onchange='Change()' value="100" placeholder=""></td>                                
												</tr>			                            
												<tr>
													<th class="fc-red" rowspan="2" scope="row">프리미엄 가격(USD/MT)</th>
													<td class="bg-orange1" colspan="2">투찰 프리미엄 가격</td>
													<td class="bg-orange2" colspan="1">투찰 최종 가격</td>
												</tr>		
												<tr>
													<td class="center" colspan="2">
														<input class="input-md" type="number" name="premium" id="bddprPremiumPc" onchange='Change()' value="100" placeholder="">/MT</td>
													<td class="center" colspan="1" id="result" pattern="#,###,###"><span>300</span> 원</td>                                  
												</tr>
											</c:if>
										</c:if>
										<!-- ###################### END 투찰중(투찰 최종가격) ######################-->
			                            <tr>
			                                <th class="multi" scope="row">인도 기한</th>
			                                <td class="multi" colspan="3">
												<fmt:parseDate value="${bdDetailVO.delyBeginDe}" var="delyBeginDe" pattern="yyyyMMdd"/>
												<fmt:parseDate value="${bdDetailVO.delyEndDe}" var="delyEndDe" pattern="yyyyMMdd"/>
												<fmt:formatDate value="${delyBeginDe}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${delyEndDe}" pattern="yyyy.MM.dd"/><br> 
			                                    <span class="t-info">인도조건에서 제출한 인도지에 화물이 최종 입고된 기준으로 적용함.</span>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th scope="row">가격지정기간</th>
			                                <td>
			                                    <div class="read">
													<fmt:parseDate value="${bdDetailVO.pcAppnBeginDe}" var="pcAppnBeginDe" pattern="yyyyMMdd"/>
													<fmt:parseDate value="${bdDetailVO.pcAppnEndDe}" var="pcAppnEndDe" pattern="yyyyMMdd"/>
													<fmt:formatDate value="${pcAppnBeginDe}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${pcAppnEndDe}" pattern="yyyy.MM.dd"/><br> 
												</div>
			                                </td>
			                                <th scope="row">가격지정방법</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.pcAppnMthCodeNm}</div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th scope="row">결제 조건</th>
			                                <td colspan="3">${bdDetailVO.setleCrncyCodeNm} ${bdDetailVO.setleMthCodeNm} ${bdDetailVO.setlePdCodeNm}</td>
			                            </tr>
			                            <tr>
			                                <th scope="row">기타 코멘트</th>
			                                <td colspan="3">${bdDetailVO.etcCn}</td>
			                            </tr>
										<tr>
			                                <th scope="row">입찰 참여 동의</th>
			                                <td colspan="3">
			                                    <div class="checkbox-container">
			                                        <label class="checkbox-label" for="agree_all">
			                                            <input type="checkbox" name="agree_all" id="agree_all" value="">
			                                            <span class="checkbox-custom rectangular"></span>
			                                        </label>
			                                        <div class="input-title">상기&nbsp;내용에&nbsp;입찰&nbsp;동의합니다.</div>
			                                    </div>   
			                                </td>
			                            </tr>	
			                        </tbody>
			                    </table>
			                    <div class="btn-wrap">
			                        <button type="button" class="btn-gray-big btn-list" onclick="pageMove('/');">공고 목록가기</button>
									<c:choose> 
										<c:when test="${bdBddprVO.bddprFlag eq 'Y'}">
											<button type="button" id="bidStr" class="btn-blue-big" onclick="confirmPopup()">마이페이지</button>
											<button type="button" id="bidStr" class="btn-blue-big" onclick="confirmPopup()">투찰취소</button>
										</c:when>
										<c:otherwise>
											<button type="button" id="bidStr" class="btn-blue-big" onclick="confirmPopup()">투찰하기</button>
										</c:otherwise>
									</c:choose>
			                    </div>
								 <!-- 비밀번호 확인 팝업, 투찰접수건 확인 팝업 :: START -->
								<div class="popup modal confirm" id="bidCancelConfirm">
									<div class="modal-content w490px">
										<div id="modal1">
											<div class="modal-header">
												<h1>비밀번호 확인</h1>
												<div class="modal-close"><button type="button" class="modal-x"><span class="hidden">Close Popup</span></button></div>
											</div>
											<div class="max-width">
												<div class="alert-con"><p>최종인증을 진행합니다.<br>가입 시 등록한 비밀번호를 입력해주세요.<br><br>
												<input class="full" type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요.">
											</div><!--// .max-width -->
											<div class="modal-btns">
												<button type="button" class="btn-blue-big" id="passwordCheck" onclick="checkPassword()">확인</button>
											</div>
										</div>
									</div>
									<div id="modal2" style="display:none">
										<div class="max-width">
											<div class="alert-con"><p>정상접수되었습니다.<br>내가 참여한 입찰 내역은<br>[마이페이지]<br>확인 가능합니다. 감사합니다.<br>
										</div><!--// .max-width -->
										<div class="modal-btns">
											<button type="button" class="btn-blue-big" onclick="reloadPage()">확인</button>
											<button type="button" class="btn-blue-big" id="" onclick="">마이페이지</button>
										</div>
									</div>
								</div>
								 <!-- 비밀번호 확인 팝업, 투찰접수건 확인 팝업 :: END -->
								<div class="popup modal confirm" id="checkConfirm">
									<div class="modal-content w490px">
										
									</div>
								</div>
								 <!-- 비밀번호 확인 팝업 :: END -->
			                </div>
			                <!-- 투찰 정보 입력 TABLE :: END -->
			            </ul>			            
	            		<!-- ITEM DETAIL AREA :: END -->	            				
					</div>
				</div>
				<!-- section #1 구매입찰 공고 LIST :: END -->		    		
			</div>		
			<!-- container :: END -->
		</div>	
		<!-- body-main :: END -->

    </div>
    <!-- wrapper :: END -->

    <!-- script custom :: START -->
	<!-- <script src="/guide/js/common.js"></script>
	<script src="/guide/js/sorin.js"></script> -->
	<script src="/guide/js/sorin-ma.js"></script><!-- main js -->
	<!-- script custom :: END -->
	<script type="text/javascript"> 

	// =============== 모달오픈 ==================
	function modalOpenFocus() {
		const focusableElements = 'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])';
		const modal = document.querySelector('.modal.active');
		const firstFocusableElement = modal.querySelectorAll(focusableElements)[0];
		const focusableContent = modal.querySelectorAll(focusableElements);
		const lastFocusableElement = focusableContent[focusableContent.length - 1];

		document.addEventListener('keydown', function(e) {
			let isTabPressed = e.key === 'Tab' || e.keycode === 9;

			if (!isTabPressed) {
				return;
			}

			if (e.shiftKey) {
				if (document.activeElement === firstFocusableElement) {
					lastFocusableElement.focus();
					e.preventDefault();
				}
			} else {
				if (document.activeElement === lastFocusableElement) {
					firstFocusableElement.focus();
					e.preventDefault();
				}
			}
		});
		firstFocusableElement.focus();
	}

	function modalCloseFocus() {
    	const modalCount = $('.modal.active').length;
		if (modalCount !== 0) {
			modalOpenFocus();
		}
	}
	$(document).off('click', '.modal-x').on('click', '.modal-x', function(e) {
		debugger;
    	e.preventDefault();
    	$(this).closest('.popup').removeClass('active');
		modalCloseFocus();

		$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
	});
	
	// =============== 투찰최종가격 ==================
	function Change()  { 
		 const nDelyCndStdrPc = document.getElementById('delyCndStdrPc').value;
		 const nCnvrsPremiumAmount = document.getElementById('cnvrsPremiumAmount').value;
		 const nBddprPremiumPc = document.getElementById('bddprPremiumPc').value;
		 /* 인트로 형변환*/
		 var iDelyCndStdrPc = parseInt(nDelyCndStdrPc);  
		 var iCnvrsPremiumAmount = parseInt(nCnvrsPremiumAmount);
		 var iBddprPremiumPc = parseInt(nBddprPremiumPc);
		 
		 // 값이 비어있을떄 디폴트값 0으로 처리
		 if (isNaN(iDelyCndStdrPc) || iDelyCndStdrPc === null || iDelyCndStdrPc === "") {
			iDelyCndStdrPc = 0;
		 }
		 if (isNaN(iCnvrsPremiumAmount) || iCnvrsPremiumAmount === null || iCnvrsPremiumAmount === "") {
			iCnvrsPremiumAmount = 0;
		 }
		 if (isNaN(iBddprPremiumPc) || iBddprPremiumPc === null || iBddprPremiumPc === "") {
			iBddprPremiumPc = 0;
		 }

		 // 쉼표를 포함한 문자열로 변환
  		 var formattedResult = (iDelyCndStdrPc + iCnvrsPremiumAmount + iBddprPremiumPc).toLocaleString();

		 document.getElementById("result").innerText = formattedResult + '원';
	}

	// =============== 팝업창 ==================
	
	// 비밀번호 확인 팝업 오픈
	function confirmPopup(){
		// 입찰 참여동의 여부 체크
		var agree = $('#agree_all').prop('checked');
		var value = agree ? 'Y' : 'N';

		// 인도조건 값 가져옴
		var cndCode = $('#shippingAddr').val();

		// 인도조건 validation 체크
		if(cndCode == '옵션'){
			alert("인도 조건을 설정해주세요.");
			return;
		}
		
		// 입찰 참여 동의 여부 validation 체크
		if(value == 'Y'){
			document.getElementById('bidCancelConfirm').style.display = 'block';
			// 비밀번호 초기화
			$("#password").val("");
			cmmPopup('bidCancelConfirm', 'confirm');
		}else{
			alert("입찰 참여 동의를 해주세요.");
		}
	}

	// 정상접수 팝업 오픈
	function reloadPage(){
		var params = {
			"bidPblancId" : "${bdDetailVO.bidPblancId}",	// 입찰 공고아이디 
			"bidEntrpsNo" : "C0055"
		}
		pageMove( "/detail/bdDetail", JSON.stringify(params), 'application/json');
	}

	// 모달 변경
	function changeModal(){
		// #modal1을 숨김
		$('#modal1').hide();

		// #modal2를 표시
		$('#modal2').show();
	}

	// =============== 비밀번호 가져오기 ==================
	function checkPassword(){
		var params = {
			"bidEntrpsNo" : "C0001", // 입찰 업체 번호
			"bidMberSecretNo" : $('#password').val() // 입찰 회원 비밀 번호
		}

		$.ajax({
			url: '/detail/passwordCheck',
			method: 'POST', 
			contentType: 'application/json', 
			data: JSON.stringify(params), 
			dataType: 'json', 
			success: function(data) {
				// 비밀번호가 맞을경우
				if(data.result == "Y"){
					var params = {
						"bidEntrpsNo" : "C0055",	// 업체번호(세션값)
						"bidPblancId" : "${bdDetailVO.bidPblancId}",	// 입찰 공고아이디 
						"delyCndCode" : $('#shippingAddr').val(),	// 인도조건코드
						"delyCndStdrPc" : $('#delyCndStdrPc').val(),	// 인도 조건 기준가격
						"cnvrsPremiumAmount" : $('#cnvrsPremiumAmount').val(),	// 인도 프리미엄 금액
						"bddprPremiumPc" : $('#bddprPremiumPc').val(),	// 인도 프리미엄 가격
						"bddprWt" : "${bdDetailVO.bidWt}",	// 투찰 중량
						"partcptnAgreAt" : $('#agree_all').prop('checked') ? 'Y' : 'N',	// 참여 동의 여부
						"bddprNrmltAt" : "Y",	// 투찰 정상여부
						"scsbidAt" : "N",	// 낙찰여부
						"canclAt" : "N",	// 취소여부
						"deleteAt" : "N",	// 삭제여부
						"pcAppnBeginDe" : "${bdDetailVO.pcAppnBeginDe}",	//가격지정시작일자
						"pcAppnEndDe" : "${bdDetailVO.pcAppnEndDe}"	//가격지정종료일자
					}	

					$.ajax({
						url: '/detail/insertBdBddpr', 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'json', 
						success: function(data) {
							console.log('데이터 정상', data);
							changeModal();
							//cmmPopup('bidCancelConfirm', 'confirm');
							
							//location.href("/bdTiles/bdDetail");

						},
						error: function(error) {
							// 에러 발생 시의 처리
							console.error('서버 요청 중 에러 발생:', error);
						}
					});
					
				// 비밀번호가 틀릴경우	
				}else{
					alert("비밀번호를 다시 입력해주세요");
				}
			},
			error: function(error) {
				// 에러 발생 시의 처리
				console.error('서버 요청 중 에러 발생:', error);
			}
		});
	}

	// =============== SELECT BOX ==================
	$('.brand').select2({
	    width: 'element',
	    minimumResultsForSearch: Infinity,
	    placeholder: '브랜드',
	    selectOnClose: true
	});
	$('.area').select2({
	    width: 'element',
	    minimumResultsForSearch: Infinity,
	    placeholder: '권역',
	    selectOnClose: true
	});
	$('.filter').select2({
	    width: 'element',
	    placeholder: '공고일',
	    minimumResultsForSearch: Infinity,
	    selectOnClose: true
	});
	$('#shippingAddr').select2({
	    width: 'element',
	    minimumResultsForSearch: Infinity,
	    selectOnClose: true
	});

	// =============== TAB ==================
	$('.tab_btn_group li').click(function(e){
	    e.preventDefault();
	    let tab_id = $(this).attr('data-tab');
	    $('.tab_btn_group li').removeClass('on');
	    $('.tab-content').removeClass('on');
	    $(this).addClass('on');
	    $("#"+tab_id).addClass('on');
	})

	// =============== BTN.LIKE ==================
	$('.ico.like').click(function(e){
	    e.preventDefault();
	    $(this).toggleClass('active');
	})
	    
	// =============== DATEPICKER ==================
	</script>
</body>
</html>