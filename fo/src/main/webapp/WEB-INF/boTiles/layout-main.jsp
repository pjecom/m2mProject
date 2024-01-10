<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@environment.getProperty('spring.websocket.stompConnectURI')" var="stompConnectURI" />
<spring:eval expression="@environment.getProperty('redisPubsub.uri.premium')" var="premiumUri" />

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        
        <link rel="stylesheet" type="text/css" href="<c:url value='/bo_js/vakata-jstree-4a77e59/dist/themes/default/style.min.css'/>"><!-- Folder tree -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/bo_js/bootstrap-timepicker-0.5.2/css/bootstrap-timepicker.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/bo_js/fullcalendar-5.7.0/lib/main.css'/>"><!-- Full calendar -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/bo_css/style.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/bo_css/common.css'/>">
	</head>
	
	<body>
		<script type="text/javascript" src="<c:url value='/bo_js/jquery-3.6.0.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/bo_js/jquery.i18n.properties.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/bo_js/jquery.blockUI.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/bo_js/sorinCommon.js'/>"></script>
        
	    <div class="web-wrapper">
	        <tiles:insertAttribute name="sidebar"/>
	        <section class="web-container">
	            <tiles:insertAttribute name="header"/>
	                <div class="web-tabs">
	                	<tiles:insertAttribute name="body"/>
	                </div>
	        </section>
	        
	        <button type="button" class="btn" data-toggle="modal" data-target="#alertPopup" id="modalClick" hidden="hidden">알림메세지</button>
			<div class="modal fade" id="alertPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-modal="true">
				<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xs alert-popup" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">알림메세지</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body text-center">
							<div class="alert-con">세션이 만료되었습니다.</div>
						</div>
						<div class="modal-footer">
							<div class="btn-box">
								<button type="button" class="btn modal-ok">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	    </div>
	    
        
        <!-- realGrid -->
        <script type="text/javascript" defer src="<c:url value='/bo_js/realgrid.2.3.2/realgrid-lic.js'/>"></script>
        <script type="text/javascript" defer src="<c:url value='/bo_js/realgrid.2.3.2/realgrid.2.3.2.min.js'/>"></script> 
        <script type="text/javascript" defer src="<c:url value='/bo_js/realgrid.2.3.2/libs/jszip.min.js'/>"></script>
        <!-- //realGrid -->
        <script type="text/javascript" defer src="<c:url value='/bo_js/bootstrap-4.6.0/js/dist/util.js'/>"></script>
        <script type="text/javascript" defer src="<c:url value='/bo_js/bootstrap-4.6.0/js/dist/modal.js'/>"></script>
        <script type="text/javascript" defer src="<c:url value='/bo_js/bootstrap4-datepicker-master/js/bootstrap-datepicker.js'/>"></script>
        <script type="text/javascript" defer src="<c:url value='/bo_js/bootstrap4-datepicker-master/js/locales/bootstrap-datepicker.ko.js'/>"></script>
        <script type="text/javascript" defer src="<c:url value='/bo_js/bootstrap-timepicker-0.5.2/js/bootstrap-timepicker.js'/>"></script>
        <script type="text/javascript" defer src="<c:url value='/bo_js/vakata-jstree-4a77e59/dist/jstree.min.js'/>"></script><!-- Folder tree -->
        <script type="text/javascript" defer src="<c:url value='/bo_js/fullcalendar-5.7.0/lib/main.js'/>"></script><!-- Full calendar -->
        <script type="text/javascript" defer src="<c:url value='/bo_js/fullcalendar-5.7.0/lib/locales/ko.js'/>"></script><!-- Full calendar(한글) -->
        <script type="text/javascript" defer src="<c:url value='/bo_js/common.js'/>"></script><!-- 퍼블 작성 -->
        
        
        <script type="text/javascript" defer src="<c:url value='/bo_js/sorinMessage-bo.js'/>"></script>     
        <script type="text/javascript" defer src="<c:url value='/bo_js/ckeditor/ckeditor.js'/>"></script>
        <script type="text/javascript" defer src="<c:url value='/bo_js/sockjs.min.js'/>"></script>
        <script type="text/javascript" defer src="<c:url value='/bo_js/stomp.min.js'/>"></script>
		<script type="text/javascript" defer src="<c:url value='/bo_js/socketCommon.js'/>"></script>
		<script type="text/javascript" defer src="<c:url value='/bo_js/stompSocketCommon.js'/>"></script>
        
        <script type="text/javascript" defer src="<c:url value='/bo_js/jquery.validationEngine.js'/>"></script>
		<script type="text/javascript" defer src="<c:url value='/bo_js/jquery.validationEngine-ko.js'/>"></script>
		<script type="text/javascript" defer src="<c:url value='/bo_js/jquery.mask.js'/>"></script>
	    <script type="text/javascript">
		   
	    </script>
	</body>
</html>

<style>
    .web-tabs { width:100%; height:100%;}
    .web-content { width:100%; height:100%;}
    .ifr {width:100%; height:100%;}
</style>