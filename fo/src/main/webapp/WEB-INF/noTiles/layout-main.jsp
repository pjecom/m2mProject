<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<spring:eval expression="@environment.getProperty('spring.websocket.stompConnectURI')" var="stompConnectURI" />
<spring:eval expression="@environment.getProperty('redisPubsub.uri.wishAlram')" var="wishAlramUri" />
<spring:eval expression="@environment.getProperty('redisPubsub.uri.restTime')" var="restTime" />
<spring:eval expression="@environment.getProperty('redisPubsub.uri.startLmeData')" var="startLmeData" />
<spring:eval expression="@environment.getProperty('redisPubsub.uri.spread')" var="spreadUri" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta name="viewport" content="width=1300, user-scalable=no" />
<meta name="format-detection" content="telephone=no">
<meta name="naver-site-verification" content="3836dcf47b5d4a644a66d758030295c8a93f92a2" />
<meta name=”title” content="비철금속 실시간 거래 플랫폼" />
<meta name="keywords" content="알루미늄가격, 알루미늄실시간, 알루미늄시세, 알루미늄, 알루미늄최저가, 알루미늄실시간, 실시간알루미늄, 비철금속, 비철금속시세, 비철금속가격, LME시세, LME가격, LME실시간, 런던금속거래소, 서린, 서린닷컴, 서린상사"/>
<meta name="description" content="실시간 LME & 환율 가격에 연동한 비철금속 거래 서비스와 하나은행 에스크로 계좌를 통한 안전한 결제, 당일 배송 및 출고 실시간 배송추적 서비스를 제공합니다." />

<meta property="og:url" content=https://www.metalsorin.com />
<meta property="og:title" content="서린닷컴">
<meta property="og:type" content="website">
<meta property="og:image" content=https://www.metalsorin.com/images/img_share.png>
<meta property="og:description" content="서린닷컴 | 대한민국 비철금속 가격의 기준">

<title>서린닷컴 - 실시간 알루미늄 최저가 구매</title>
<script type="text/javascript">
			//익스플로러로 접속 시 alert 메시지 노출 후 Edge 브라우저로 전환
		   	if(/MSIE\d|Trident.*rv:/.test(navigator.userAgent)) {

		   		alert("서린닷컴은 Microsoft Explorer를 지원하지 않습니다."
					+"\n확인버튼을 누르면 Edge 브라우저로 자동으로 이동되며"
					+"\n현재창은 닫힙니다.");

		   		window.location = 'microsoft-edge:' + window.location.href;

		   		setTimeout(function() {
		   			window.open('about:blank', '_self').close();
		   		}, 1000);
			}

			// 페이지 정보
	    	var pageMoveParams = {
					url : "/main/",
					data : "",
					contentType : "",
					menuActiveIdenty : ""
				};

	    	var referer = [];
	    	var wsScriberList = [];

			let currentPage = "";		// 현재 페이지 url
			let operateFlag = true;		//운영여부
		</script>

<link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" href="<c:url value='/css/sorin.css'/>">

<!-- script core -->
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/ui/1.12.1/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/swiper/6.7.0/swiper.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.blockUI.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/sorinCommon.js'/>"></script>

</head>
<!-- 	<div id="layoutscript" style="display: none"> -->
<%-- 		<%@include file="/WEB-INF/tiles/layoutscript.jsp"%> --%>
<!-- 	</div>	 -->
	<body>
<!-- 	<div> -->
<!-- 		<div> -->
<!-- 			<div class="container"> -->
				<tiles:insertAttribute name="body" />
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<div class="popup modal alert" id="alertPopup" style="z-index:9999">
	    <div class="modal-content w490px">
	        <div class="modal-header">
	            <h1>알림메세지</h1>
	            <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button></div>
	        </div>
	        <div class="max-width">
	            <div class="alert-con">잘못된 접근 입니다.</div>
	        </div>
	        <div class="modal-btns">
	            <button type="button" class="btn-blue-big modal-ok">확인</button>
	        </div>
	    </div>
	</div>

	<div class="popup modal confirm" id="confirmPopup" style="z-index:9998">
		<div class="modal-content w490px">
		    <div class="modal-header">
		        <h1>알림메세지</h1>
		        <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button></div>
		    </div>
		    <div class="max-width">
		        <div class="alert-con">잘못된 접근 입니다.</div>
		    </div><!--// .max-width -->
	        <div class="modal-btns">
	            <button type="button" class="btn-gray-big modal-cancel">취소</button>
	            <button type="button" class="btn-blue-big modal-ok">확인</button>
	        </div>
	    </div>
	</div>

	<div class="popup modal confirm confirm2" id="confirmPopup2" style="z-index:9997">
		<div class="modal-content w490px">
		    <div class="modal-header">
		        <h1>알림메세지</h1>
		        <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button></div>
		    </div>
		    <div class="max-width">
		        <div class="alert-con">잘못된 접근 입니다.</div>
		    </div><!--// .max-width -->
	        <div class="modal-btns">
	            <button type="button" class="btn-gray-big modal-cancel">취소</button>
	            <button type="button" class="btn-blue-big modal-ok">확인</button>
	        </div>
	    </div>
	</div>

	<div id="layoutscript" style="display: none">
		<%@include file="/WEB-INF/noTiles/layoutscript.jsp"%>
	</div>
</body>
</html>