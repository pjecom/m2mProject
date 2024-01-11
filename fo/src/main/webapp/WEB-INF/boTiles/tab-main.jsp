<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        
        <link rel="stylesheet" type="text/css" href="/bo_js/vakata-jstree-4a77e59/dist/themes/default/style.min.css"><!-- Folder tree -->
        <link rel="stylesheet" type="text/css" href="/bo_js/bootstrap-timepicker-0.5.2/css/bootstrap-timepicker.css">
        <link rel="stylesheet" type="text/css" href="/bo_js/fullcalendar-5.7.0/lib/main.css"><!-- Full calendar -->
        <link rel="stylesheet" type="text/css" href="/bo_css/style.css" />
        <link rel="stylesheet" type="text/css" href="/bo_css/common.css" />
        
        <script type="text/javascript" src="/bo_js/jquery-3.6.0.js"></script>
        <script type="text/javascript" src="/bo_js/jquery.i18n.properties.js"></script>
        <script type="text/javascript" src="/bo_js/jquery.blockUI.js"></script>
        
        <!-- realGrid -->
        <script type="text/javascript" src="/bo_js/realgrid.2.3.2/realgrid-lic.js"></script>
        <script type="text/javascript" src="/bo_js/realgrid.2.3.2/realgrid.2.3.2.min.js"></script> 
        <script type="text/javascript" src="/bo_js/realgrid.2.3.2/libs/jszip.min.js"></script>
        <!-- //realGrid -->
        <script type="text/javascript" src="/bo_js/bootstrap-4.6.0/js/dist/util.js"></script>
        <script type="text/javascript" src="/bo_js/bootstrap-4.6.0/js/dist/modal.js"></script>
        <script type="text/javascript" src="/bo_js/bootstrap4-datepicker-master/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="/bo_js/bootstrap4-datepicker-master/js/locales/bootstrap-datepicker.ko.js"></script>
        <script type="text/javascript" src="/bo_js/bootstrap-timepicker-0.5.2/js/bootstrap-timepicker.js"></script>
        <script type="text/javascript" src="/bo_js/vakata-jstree-4a77e59/dist/jstree.min.js"></script><!-- Folder tree -->
        <script type="text/javascript" src="/bo_js/fullcalendar-5.7.0/lib/main.js"></script><!-- Full calendar -->
        <script type="text/javascript" src="/bo_js/fullcalendar-5.7.0/lib/locales/ko.js"></script><!-- Full calendar(한글) -->
        <script type="text/javascript" src="/bo_js/common.js"></script><!-- 퍼블 작성 -->
        
        <script type="text/javascript" src="/bo_js/sorinCommon.js"></script>     
        <script type="text/javascript" src="/bo_js/sorinMessage-bo.js"></script>     
        <script type="text/javascript" src="/bo_js/ckeditor/ckeditor.js"></script>
        <script type="text/javascript" src="/bo_js/sockjs.min.js"></script>
        <script type="text/javascript" src="/bo_js/stomp.min.js"></script>
		<script type="text/javascript" src="/bo_js/socketCommon.js"></script>
		<script type="text/javascript" src="/bo_js/stompSocketCommon.js"></script>
        
        <script type="text/javascript" src="/bo_js/jquery.validationEngine.js"></script>
		<script type="text/javascript" src="/bo_js/jquery.validationEngine-ko.js"></script>
		<script type="text/javascript" src="/bo_js/jquery.mask.js"></script>
        
	</head>
	
	<body>
		<div class="web-wrapper">
	        <section class="web-container">
                <tiles:insertAttribute name="body"/>
	        </section>
	    </div>
	</body>
</html>