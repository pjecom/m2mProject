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
		    $(function(){
			    $.i18n.properties({
			           name:'message',
			           path:'/properties',
			           mode:'map',
			           callback: function () {
			        	   console.log("Load OK");
			           }
			    });
			    
		    	//익스플로러로 접속 시 alert 메시지 노출 후 Edge 브라우저로 전환 
		    	openInEdge();
		    	
		    	//최조 BO를 위한 websocket 접속 정보
		    	//필수요소 -> 삭제하지 않는다.
		    	stompClient = stompConnect('${stompConnectURI}');
		    	
		    	//stomp websoket 의 디버그 모드 false
		    	stompClient.debug = null;
		    	
		    	//websoket 정보로 접속하여 handshake 하고 성공 callBack 으로 구독을 등록한다.
		    	//alarmSubscriber는 알람을 위한 구독이며 필수요소 - >삭제하지 않는다.
		    	stompOpen(stompClient, function(data) {
		    		stompSubscribe(stompClient, '/subscriber/alarmSubscriber', function(receiveData) {
		    			console.log("receive from alarmSubscriber : " + receiveData.body);
		    		});
		    		
			    	stompSubscribe(stompClient, '${premiumUri}', function (receiveData) {
			    		getPremiumInfoMap();
			    	});
		    	});
		    	getPremiumInfoMap();
		    });
		    
		    function getPremiumInfoMap() {
		    	sorin.ajax.postSetDataType('/pr/pcMntrng/getPremiumInfoMap', '', '', false, function(res) {
		     		var resultMap = new Map();
		     		resultMap = res;

		     		if (resultMap.size != 0) {
		     			sorin.chart.premiumInfoMap = resultMap; 
		     		}
		     	});
		    }
		    
		    function getPremiumPrice(metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode) {
		    	var premiumPrice = '';
		    	let premiumInfoMap = sorin.chart.premiumInfoMap;
		    	
		    	if (sorin.validation.isEmpty(brandCode)) brandCode = '0000000000';
		    	let premiumKey = metalCode + "_" + itmSn + "_" + dstrctLclsfCode + "_" + brandGroupCode + "_" + brandCode;
		    	if (premiumInfoMap[premiumKey] !== null && premiumInfoMap[premiumKey] !== undefined) {
			    	for(let i = 0; i< premiumInfoMap[premiumKey].length; i++) {
			    		var nowDateTime = convertDateString(new Date());
			    		var validBeginDt = premiumInfoMap[premiumKey][i].validBeginDt;
			    		var validEndDt = premiumInfoMap[premiumKey][i].validEndDt;
			    		if(nowDateTime >= validBeginDt && nowDateTime <= validEndDt) {;
			    			premiumPrice = premiumInfoMap[premiumKey][i].slePremiumAmount;
			    		}
			    	}
		    	}
		    	return premiumPrice;
		    }
		    
		    function convertDateString(format) {
		        var year = format.getFullYear();

		        var month = format.getMonth() + 1;
		        if (month < 10) month = '0' + month;

		        var date = format.getDate();
		        if (date < 10) date = '0' + date;

		        var hour = format.getHours();
		        if (hour < 10) hour = '0' + hour;

		        var min = format.getMinutes();
		        if (min < 10) min = '0' + min;

		        var sec = format.getSeconds();
		        if (sec < 10) sec = '0' + sec;

		        return year + month + date + hour + min + sec;

		    }
			
		    // 브라우저 뒤로 가기 방지
		    history.pushState(null, document.title, location.href);  // push 
		    window.addEventListener('popstate', function(event) {    //  뒤로가기 이벤트 등록
		       history.pushState(null, document.title, location.href);  // 다시 push함으로 뒤로가기 Block
		       alert("뒤로가기는 금지되어 있습니다.");
		    });
		    
		    function openInEdge() {
		    	if(/MSIE\d|Trident.*rv:/.test(navigator.userAgent)) {
					
		    		var confirmYn = confirm("서린닷컴은 Microsoft Explorer를 지원하지 않습니다."
											+"\n확인버튼을 누르면 Edge 브라우저로 자동으로 이동됩니다.");
	    			
					if(confirmYn){
						window.location = 'microsoft-edge:'+window.location;
		    			window.close();
	    			}
					else{
	    				return;
	    			}
		    	}
		    }
		    function getRealTime(premiumPrice, premiumKey) {
		    	let resultRealTime = {};
		    	if (premiumInfoMap[premiumKey] !== null && premiumInfoMap[premiumKey] !== undefined) {
			    	for(let i = 0; i< sorin.chart.premiumInfoMap[premiumKey].length; i++) {
			    		let premiumInfo = sorin.chart.premiumInfoMap[premiumKey][i];
			    		
			    		var nowDateTime = convertDateString(new Date());
			    		var validBeginDt = premiumInfo.validBeginDt;
			    		var validEndDt = premiumInfo.validEndDt;
			    		if(nowDateTime >= validBeginDt && nowDateTime <= validEndDt) {
			    			realTime =premiumInfo.realTime;
			    			
			    			if(!sorin.validation.isEmpty(realTime)) {	//웹소켓 종가
			    				resultRealTime.chartSelTime = realTime.get('chartSelTime');
			    				resultRealTime.endPc = realTime.get('endPc');
			    				resultRealTime.versusRate = realTime.get('versusRate');
			    			}
			    		}
			    	}
		    	}
		    	return resultRealTime;
		    }
		    function checkPriceData(checkType, priceData, chartSelTime, chartType) {
		    	let premiumPrice = getPremiumPrice(sorin.chart.metalCode, sorin.chart.itmSn, sorin.chart.dstrctLclsfCode, sorin.chart.brandGroupCode, sorin.chart.brandCode);
		    	let premiumKey = sorin.chart.metalCode + "_" + sorin.chart.itmSn + "_" + sorin.chart.dstrctLclsfCode + "_" + sorin.chart.brandGroupCode + "_" + sorin.chart.brandCode;
		    	let realTime = getRealTime(premiumPrice, premiumKey);
		    	let resultCurrentData = getCurrentData(premiumPrice, premiumKey, priceData, checkType, chartSelTime, chartType);

		    	//실시간종가 데이터
		    	let rtSelTime = sorin.validation.isEmpty(realTime.chartSelTime) ? date_to_str_realTime(new Date()) : realTime.chartSelTime;
		    	let rtEndPc = sorin.validation.isEmpty(realTime.endPc) ? priceData.endPc : realTime.endPc;

//		     	console.debug('3. 현재틱 종가 ::: ',  rtEndPc);

		    	if(checkType == 'realTime') {
		    		if(!sorin.validation.isEmpty(realTime)) {
		    			chartSelTime = date_to_str_realTime(new Date(resultCurrentData.chartSelTime));
		    			
		    			let dataValue;
		    			if(rtSelTime == chartSelTime) {
		    				let resultBeginPc = resultCurrentData.endPc;
		    				let resultTopPc = Number(resultCurrentData.topPc) > Number(rtEndPc) ? resultCurrentData.topPc : rtEndPc;  
		    				let resultLwetPc = Number(resultCurrentData.lwetPc) < Number(rtEndPc) ? resultCurrentData.lwetPc : rtEndPc;
		    				let resultEndPc = rtEndPc;
		    			
//		     				console.debug("4. 최종 현재봉만들기시작 (시고저종) \t", chartSelTime + "\t" + resultBeginPc + "\t" + resultTopPc + "\t" + resultLwetPc + "\t" + resultEndPc + "\t" + 0);
//		     				console.debug("==========================================================================================================================================================================================================");
		    				
		    				dataValue = chartSelTime + "|" + resultBeginPc + "|" + resultTopPc + "|" + resultLwetPc + "|" + resultEndPc + "|" + 0;

		    				$("#" + sorin.chart.metalNm + sorin.chart.sleMthdCode + "-price").html(" " + rtEndPc.toLocaleString() + " " + '<span class="txt">KRW</span>');
		    				
		    				if(currentPage == '/pd/justBuySearchItem' || currentPage == '/my/order/limit') {
		    					$(".type-high dd").html(resultTopPc.toLocaleString());
		    					$(".type-low dd").html(resultLwetPc.toLocaleString());
		    				} else {
		    					$("#" + sorin.chart.metalNm + sorin.chart.sleMthdCode + "-hprice").html(resultTopPc.toLocaleString());
		    					$("#" + sorin.chart.metalNm + sorin.chart.sleMthdCode + "-lprice").html(resultLwetPc.toLocaleString());
		    				}
		    				
//		    				console.debug(realTime.versusRate);
		    				
		    				if(Number(realTime.versusRate) >= 0){
		    					$("#" + sorin.chart.metalNm + sorin.chart.sleMthdCode + "-price").removeClass("fc-blue");
		    					$("#" + sorin.chart.metalNm + sorin.chart.sleMthdCode + "-price").addClass("fc-red");
		    				} else {
		    					$("#" + sorin.chart.metalNm + sorin.chart.sleMthdCode + "-price").removeClass("fc-red");
		    					$("#" + sorin.chart.metalNm + sorin.chart.sleMthdCode + "-price").addClass("fc-blue");
		    				}
		    			} else {
//		     				console.debug("4. 최종 현재봉만들기시작 (종종종종) \t", rtSelTime + "\t" + rtEndPc + "\t" + rtEndPc + "\t" + rtEndPc + "\t" + rtEndPc + "\t" + 0);
//		     				console.debug("==========================================================================================================================================================================================================");
		    				
		    				dataValue = rtSelTime + "|" + rtEndPc + "|" + rtEndPc + "|" + rtEndPc + "|" + rtEndPc + "|" + 0;
		    			}
		    			
		    			let dataSource = []; 
		    			dataSource.push("" + dataValue + "");
		    			rMateStock.addDataAfter("chart1", dataSource);
		    		}
		    	}
		    }
	    </script>
	</body>
</html>

<style>
    .web-tabs { width:100%; height:100%;}
    .web-content { width:100%; height:100%;}
    .ifr {width:100%; height:100%;}
</style>