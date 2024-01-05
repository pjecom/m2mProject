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
        
        <link rel="stylesheet" type="text/css" href="/js/vakata-jstree-4a77e59/dist/themes/default/style.min.css"><!-- Folder tree -->
        <link rel="stylesheet" type="text/css" href="/js/bootstrap-timepicker-0.5.2/css/bootstrap-timepicker.css">
        <link rel="stylesheet" type="text/css" href="/js/fullcalendar-5.7.0/lib/main.css"><!-- Full calendar -->
        <link rel="stylesheet" type="text/css" href="/css/style.css" />
        <link rel="stylesheet" type="text/css" href="/css/common.css" />
        
        <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
        <script type="text/javascript" src="/js/jquery.i18n.properties.js"></script>
        <script type="text/javascript" src="/js/jquery.blockUI.js"></script>
        
        <!-- realGrid -->
        <script type="text/javascript" src="/js/realgrid.2.3.2/realgrid-lic.js"></script>
        <script type="text/javascript" src="/js/realgrid.2.3.2/realgrid.2.3.2.min.js"></script> 
        <script type="text/javascript" src="/js/realgrid.2.3.2/libs/jszip.min.js"></script>
        <!-- //realGrid -->
        <script type="text/javascript" src="/js/bootstrap-4.6.0/js/dist/util.js"></script>
        <script type="text/javascript" src="/js/bootstrap-4.6.0/js/dist/modal.js"></script>
        <script type="text/javascript" src="/js/bootstrap4-datepicker-master/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="/js/bootstrap4-datepicker-master/js/locales/bootstrap-datepicker.ko.js"></script>
        <script type="text/javascript" src="/js/bootstrap-timepicker-0.5.2/js/bootstrap-timepicker.js"></script>
        <script type="text/javascript" src="/js/vakata-jstree-4a77e59/dist/jstree.min.js"></script><!-- Folder tree -->
        <script type="text/javascript" src="/js/fullcalendar-5.7.0/lib/main.js"></script><!-- Full calendar -->
        <script type="text/javascript" src="/js/fullcalendar-5.7.0/lib/locales/ko.js"></script><!-- Full calendar(한글) -->
        <script type="text/javascript" src="/js/common.js"></script><!-- 퍼블 작성 -->
        
        <script type="text/javascript" src="/js/sorinCommon.js"></script>     
        <script type="text/javascript" src="/js/sorinMessage-bo.js"></script>     
        <script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>
        <script type="text/javascript" src="/js/sockjs.min.js"></script>
        <script type="text/javascript" src="/js/stomp.min.js"></script>
		<script type="text/javascript" src="/js/socketCommon.js"></script>
		<script type="text/javascript" src="/js/stompSocketCommon.js"></script>
        
        <script type="text/javascript" src="/js/jquery.validationEngine.js"></script>
		<script type="text/javascript" src="/js/jquery.validationEngine-ko.js"></script>
		<script type="text/javascript" src="/js/jquery.mask.js"></script>
        
	</head>
	
	<body>
		<div class="web-wrapper">
	        <section class="web-container">
                <tiles:insertAttribute name="body"/>
	        </section>
	    </div>
	</body>
</html>