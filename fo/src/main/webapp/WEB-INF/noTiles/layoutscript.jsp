<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@environment.getProperty('spring.websocket.stompConnectURI')" var="stompConnectURI" />
<spring:eval expression="@environment.getProperty('redisPubsub.uri.wishAlram')" var="wishAlramUri" />

<spring:eval expression="@environment.getProperty('redisPubsub.uri.restTime')" var="restTime" />
<spring:eval expression="@environment.getProperty('redisPubsub.uri.startLmeData')" var="startLmeData" />
<spring:eval expression="@environment.getProperty('redisPubsub.uri.spread')" var="spreadUri" />

<!-- script extra -->

<script type="text/javascript" async src="<c:url value='/js/jquery.i18n.properties.js'/>"></script>
<script type="text/javascript" async src="<c:url value='/js/prefixfree/1.0.0/prefixfree.min.js'/>"></script>

<script type="text/javascript" async src="<c:url value='/js/modernizr/2.8.3/modernizr.min.js'/>"></script>
<script type="text/javascript" async src="<c:url value='/js/toastr/toastr.js'/>"></script>

<script type="text/javascript" async src="<c:url value='/js/select2/select2.min.js'/>"></script>
<script type="text/javascript" async src="<c:url value='/js/sorin.js'/>"></script>
<script type="text/javascript" async src="<c:url value='/js/sorinMassage-fo.js'/>"></script>

<script type="text/javascript" defer src="<c:url value='/js/sockjs.min.js'/>"></script>
<script type="text/javascript" defer src="<c:url value='/js/stomp.min.js'/>"></script>
<script type="text/javascript" defer src="<c:url value='/js/socketCommon.js'/>"></script>
<script type="text/javascript" defer src="<c:url value='/js/stompSocketCommon.js'/>"></script>

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js'/>"></script> -->
<script type="text/javascript" async src="<c:url value='/js/jquery-ui.js'/>"></script>
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->

<script type="text/javascript" async src="<c:url value='/js/sorin-header.js'/>"></script>
<script type="text/javascript" async src="<c:url value='/js/jquery.validationEngine.js'/>"></script>
<script type="text/javascript" async src="<c:url value='/js/jquery.validationEngine-ko.js'/>"></script>
<script type="text/javascript" defer src="<c:url value='/js/jquery.mask.js'/>"></script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<%-- <script type="text/javascript" async src="<c:url value='/js/channelTalkService.js'/>"></script> --%>
<!-- script extra -->

<script type="text/javascript">

	function pageMove(url, data, contentType, menuActiveIdenty) {
		if(!sorin.validation.isEmpty(menuActiveIdenty)) {
			$("#header").find('a').removeClass("active");
			$("#headerMenuOrder" + menuActiveIdenty).addClass("active");
		}

		currentPage = url; // 현재 페이지 url

		if(pageMoveParams.url != url || pageMoveParams.data != data){
			if(url == '/main/') {
				moveToMain();
			} else {
				referer.push(JSON.parse(JSON.stringify(pageMoveParams)));
			}

			pageMoveParams.url = url;
			pageMoveParams.data = data;
			pageMoveParams.contentType = contentType;
			pageMoveParams.menuActiveIdenty = menuActiveIdenty;
		} else {
			if(url == '/main/') {
				moveToMain();
			}
		}

		pageMoveAjaxProcess(url, data, contentType);
	}

    //메인으로 갈 때 사용
    function moveToMain() {
        referer = [];

		trackSorin("/main/", "0902");
        location.href = "/main/";
    }

    function pageMoveAjaxProcess(url, data, contentType) {
    	sorin.ajax.postSetAllTypeForPageMove(url, data, 'html', contentType, true, function (returnData) {

    		// 페이지 이동시 원래 페이지에 removeStompSubscriber 메소드가 있으면 웹소켓 구독을 삭제한다.
    		if (typeof removeStompSubscriber != "undefined") {
    			removeStompSubscriber();
    		}

    		$(".body-main").empty();
    		$(".body-main").append('<div class="container">' + returnData + '</div>');
    		$(".body-main").append(
    				`<div class="popup modal alert" id="alertPopup" style="z-index:9999">
    			    <div class="modal-content w490px">
    			        <div class="modal-header">
    			            <h1>알림메세지</h1>
    			            <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button></div>
    			        </div>
    			        <div class="max-width">
    			            <div class="alert-con">alert text</div>
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
    				        <div class="alert-con">confirm text</div>
    				    </div>
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
    			</div>`
    		);

    		$("#ui-datepicker-div").remove(); //layout-main 맨 마지막에 생기는 daterpicker 재시작

    		window.scrollTo(0, 0);
    	});
    }

    // 브라우저 뒤로 가기 방지;
    history.pushState(null, document.title, location.href);  // push
    window.addEventListener('popstate', function (event) {    //  뒤로가기 이벤트 등록
        if (referer.length > 0) {
            let refererObj = referer.pop();
            pageMoveParams = refererObj;
            if(refererObj.url = '/redirect'){
                moveToMain();
            }else{
                pageMove(refererObj.url, refererObj.data, refererObj.contentType, refererObj.menuActiveIdenty);
            }
        } else {
            //moveToMain();
            history.go(1);
        }

    });

    //헤더 부분의 버튼 acive를 위한 키값을 만들어 리턴
    function makeMenuActiveIdenty(url, parameter) {
        return (url + parameter).replace(/\/|\"|{|}|,|:/gi, '');
    }

    /* ======== 이모지 사용 못하게 막는 부분 시작 ======== */
    var oldInputVal = "";  //input박스 oldvalue
    $(document).off("focusin", ".body-main input").on("focusin", ".body-main input", function () {
        oldInputVal = $(this).val();
    });

    //input 값 변경 되었을때 수행할 이벤트 등록
    document.addEventListener("input", inputKeyupAndPasteEvent);

    function inputKeyupAndPasteEvent(e) {
        var newVal = e.srcElement.value; //input박스 newvalue
        //이모지 포함 여부 체크 후, 이모지 제거
        // paste : 붙어녛은 문자열에 이모지 포함시 붙여넣은 문자열 전체 제거
        // keyup : 입력한 문자열에서 이모지여부 체크 후 제거
        oldInputVal = sorin.validation.isEmoji(newVal, oldInputVal);

        //input타입이 파일이 아닌 경우 이모지 value처리
        if (e.srcElement.type != "file") {

            e.srcElement.value = oldInputVal;
        }

    }
    /* ======== 이모지 사용 못하게 막는 부분 끝 ======== */

    /* set cookie */
    function setCookie(name, value, expiredays) {

        var today = new Date();
        today.setDate(today.getDate() + expiredays); // 현재시간에 하루를 더함
        document.cookie = name + '=' + escape(value) + '; expires=' + today.toGMTString();
    }

    /* get cookie */
    function getCookie(name) {

        var cookie = document.cookie;
        if (document.cookie != "") {
            var cookie_array = cookie.split("; ");

            for (var index in cookie_array) {
                var cookie_name = cookie_array[index].split("=");
                if (cookie_name[0] == name) {
                    return cookie_name[1];
                }
            }
        }
        return;
    }


    var getCookie = function (cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1);
            if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
        }
        return "";
    }

    // 24시간 기준 쿠키 설정하기
    var setCookie = function (cname, cvalue, exdays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + (exdays*24*60*60*1000));
        var expires = "expires=" + todayDate.toUTCString();
        document.cookie = cname + "=" + cvalue + "; " + expires;
    }

    var chartStartStatus = false;
    var noticeImage = '${noticeImage}';
    var indexSave = new Map();

    $(function () {
    	
    	//헬스체크
    	function trackHealthCheck() {
    	    sorin.ajax.postSetDataType('/fo/tr/trackHealthCheck', '', '', false, function (res) {
    	        if (!sorin.validation.isNull(res)) {
    	            if (res.msg=="F") {
    	            	console.log("trackHealthCheck ERROR")
    	            }
    	        }
    	    });
    	}
    	setInterval(function() {
        trackHealthCheck(); // 10분 마다 헬스체크
	    }, 600000); 
        //최조 FO를 위한 websocket 접속 정보
        //필수요소 -> 삭제하지 않는다.
        stompClient = stompConnect('${stompConnectURI}');

        //stomp websoket 의 디버그 모드 false
        stompClient.debug = null;

        //websoket 정보로 접속하여 handshake 하고 성공 callBack 으로 구독을 등록한다.
        //alarmSubscriber는 알람을 위한 구독이며 필수요소 - >삭제하지 않는다.
        stompOpen(stompClient, function (data) {

            //stompSubscribe(stompClient, '/subscriber/alarmSubscriber', function(receiveData) { //samplCode
            //	console.log("receive from alarmSubscriber : " + receiveData.body);
            //});

            // 		    		if(typeof rMateStockInitCreate != "undefined"){
            // 		    			rMateStockInitCreate(metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
            // 		    		}

            var wishAlramUri = "${wishAlramUri}" + "/" + sorinAccount.mberNo;
            stompSubscribe(stompClient, wishAlramUri, function (receiveData) {
                showWishAlramAndReturnAck(receiveData);
            });

            sorin.ajax.postSetDataType("/op/alarm/selectInvntryNtcnSetupListByEntrpsNo", "", "", true, function (data) {
                if (typeof data != "undefined" && data != null) {
                    // /stockAlram/{금속코드}/{아이템순번}/{권역}/{브랜드그룹}/{브랜드}/{업체번호}
                    data.forEach(function (setup) {
                        var setUpAddr = "/stockAlram/" + setup.metalCode + "/" + setup.itmSn + "/" + setup.dstrctLclsfCode + "/" + setup.brandGroupCode + "/" + setup.brandCode + "/" + setup.entrpsNo;
                        if (!wsScriberList.includes(setUpAddr)) {
                            wsScriberList.push(setUpAddr);
                            addInvenAlarmSubscribe(setUpAddr);
                        }
                    });
                }
            });
        });



    });

    // 헤더용 스크립트
    sorinAccount.name += '님';

    var subscriberURI = '/selectHeaderTimeSet';
    var subscriberStartLmeURI = '${startLmeData}';
    var subscriberRestTimeURI = '${restTime}';
    var subscriberSpreadURI = '${spreadUri}';

    let headerRestDeFixed = "N";  // 고정가 운영 여부
    let headerRestDeLive = "N";   // 실시간가 운영 여부
    let headerRestdeAt = "N";       // 영업시간 여부
    let headerSideCarMetalCode = "7"; //사이드카 발동 금속 코드
    let headerMotnAt = "N";          //사이드카

    let headerRestWaitNm = "까지"; // 소켓 타이머 문구 초기값
    let headerRestWaitTerm = 0; // 소켓 시간차 초기값
    let headerOpenTimeCode = "00"; //개장시간 범위 코드
    let chartStTitleNm = ""; //차트 상단 시작문구
    let chartEdTitleNm = ""; //차트 상단 끝 문구

    var pageMetal = "7";
    var pageSleMthd = "01";

    let restDataList = [];

    var headerRestTimer = null;  // 영업 시간 타이머 interval
    var resultTime = ""; // 영업 시간 DD일 HH:mm:ss

    let frstPrcFlag = new Array(); //시초가 수신여부

    //마지막 연결 시간 저장
    var lastConnectedTime = new Date();

    function websocketSubscriber() {
        stompSubscribe(stompClient, subscriberURI, function (receiveData) {
            if (!sorin.validation.isNull(receiveData.body)) {
                lastConnectedTime = new Date();

                let restDeLive;
                let restDeFixed;
                const data = JSON.parse(receiveData.body);
                restDataList = data.restDtTime; // 금속별 문구 처리를 위한 전역변수 세팅

                for (var i = 0; i < restDataList.length; i++) {
                    if (restDataList[i].metalCode == pageMetal && restDataList[i].sleMthdCode == pageSleMthd) {
                        headerRestWaitTerm = restDataList[i].topWaitTerm; // 상단 시간차
                        headerRestWaitNm = restDataList[i].topWaitNm; // 소켓 타이머 문구
                        headerOpenTimeCode = restDataList[i].openTimeCode; //개장시간 범위 코드
                        chartStTitleNm = restDataList[i].chartStTitle;
                        chartEdTitleNm = restDataList[i].chartEdTitle;
                    }

                    if (restDataList[i].sleMthdCode == '01') {
                        restDeLive = restDataList[i].restDeLive;
                    } else {
                        restDeFixed = restDataList[i].restDeFixed;
                    }
                }

                headerRestDeLive = restDeLive;
                headerRestDeFixed = restDeFixed;

                if(!restDeLive && pageSleMthd == '01') {
                    //headerRestWaitNm = '운영시간이 아닙니다.'; // 소켓 타이머 문구
                    headerOpenTimeCode = '999'; //개장시간 범위 코드
                    //chartStTitleNm = '서린닷컴 운영시간이 아니므로';
                    //chartEdTitleNm = '';
                    $(".landing-timer .flex-ac .time").text('');
                }

                if(!restDeFixed && pageSleMthd == '02') {
                    //headerRestWaitNm = '운영시간이 아닙니다.'; // 소켓 타이머 문구
                    headerOpenTimeCode = '999'; //개장시간 범위 코드
                    //chartStTitleNm = '서린닷컴 운영시간이 아니므로';
                    //chartEdTitleNm = '';
                    $("#headerTimeset").text('');
                }

                if( restDeLive == 'Y' && restDeFixed == 'Y') {
                    headerRestdeAt = 'Y';
                } else {
                    headerRestdeAt = 'N';
                }

                setRestDtTime();    // 타이머 문구 세팅, interval 시작
            }
        });

        stompSubscribe(stompClient, subscriberStartLmeURI, function (receiveData) {
            if (!sorin.validation.isEmpty(receiveData.body) && receiveData.body.includes("startLmeData")) {
                if (currentPage == "steel" || currentPage == "landing") {
                    location.reload(true); //현재 페이지가 메인, 금속 메뉴일 경우 refresh
                } else {
                    getRestDtTimeSet(); // 영업 시간 타이머
                }
            }
        });

        stompSubscribe(stompClient, subscriberRestTimeURI, function (receiveData) {
            if (!sorin.validation.isEmpty(receiveData.body) && receiveData.body == "setRestTime") {
                if (currentPage == "steel" || currentPage == "landing") {
                    location.reload(true); //현재 페이지가 메인, 금속 메뉴일 경우 refresh
                } else {
                    getRestDtTimeSet(); // 영업 시간 타이머
                }
            }
        });

        stompSubscribe(stompClient, subscriberSpreadURI, function (receiveData) {
            if (!sorin.validation.isEmpty(receiveData.body) && receiveData.body == "notMatchedSpread") {
                if (currentPage == "steel" || currentPage == "landing") {
                    location.reload(true); //현재 페이지가 메인, 금속 메뉴일 경우 refresh
                } else {
                    getRestDtTimeSet(); // 영업 시간 타이머
                }
            }
        });
    }

    function websocketOpenLoop() {
        setTimeout(function () {
            if (stompClient.connected == true) {
                websocketSubscriber();
                webSocketSidcarOP();

                if(currentPage == "landing"){
                    fxInitCreate();						//환율 소켓 호출
                    realTimeLandingPriceSocket();	//실시간 가격 소켓 호출
                } else if(currentPage == "steel"){
                    realTimeSteelPriceSocket();			//실시간 가격 소켓 호출
                }

            } else {
                websocketOpenLoop();
            }
        }, 100);
    }

    function websocketChartOpenLoop() {
        setTimeout(function() {
            if(stompClient.connected == true) {
                $("#dataType li:first").trigger("click");
            } else {
                websocketChartOpenLoop();
            }
        }, 100);
    }

    function getRestDtTimeSet() { // 영업 시간 타이머 최초값
        sorin.ajax.postSetDataType('/main/restDtTimeSet', '', '', false, function (data) {
            if (!sorin.validation.isNull(data)) {
                let restDeLive;
                let restDeFixed;
                restDataList = data.restDtTime; // 금속별 문구 처리를 위한 전역변수 세팅
                for (var i = 0; i < restDataList.length; i++) {
                    if (restDataList[i].metalCode == pageMetal && restDataList[i].sleMthdCode == pageSleMthd) {
                        headerRestWaitTerm = restDataList[i].topWaitTerm;		// 상단 시간차
                        headerRestWaitNm = restDataList[i].topWaitNm;			// 소켓 타이머 문구
                        headerOpenTimeCode = restDataList[i].openTimeCode;		//개장시간 범위 코드
                        chartStTitleNm = restDataList[i].chartStTitle;
                        chartEdTitleNm = restDataList[i].chartEdTitle;
                    }

                    if (restDataList[i].sleMthdCode == '01') {
                        restDeLive = restDataList[i].restDeLive;
                    } else {
                        restDeFixed = restDataList[i].restDeFixed;
                    }
                }

                headerRestDeLive = restDeLive;
                headerRestDeFixed = restDeFixed;

                if(!restDeLive && pageSleMthd == '01') {
                    headerRestWaitNm = '운영시간이 아닙니다.'; // 소켓 타이머 문구
                    headerOpenTimeCode = '999'; //개장시간 범위 코드
                    chartStTitleNm = '서린닷컴 운영시간이 아니므로';
                    chartEdTitleNm = '';
                    $("#headerTimeset").text('');
                }

                if(!restDeFixed && pageSleMthd == '02') {
                    headerRestWaitNm = '운영시간이 아닙니다.'; // 소켓 타이머 문구
                    headerOpenTimeCode = '999'; //개장시간 범위 코드
                    chartStTitleNm = '서린닷컴 운영시간이 아니므로';
                    chartEdTitleNm = '';
                    $("#headerTimeset").text('');
                }

                if( restDeLive == 'N' && restDeFixed == 'N') {
                    headerRestdeAt = 'N';
                } else {
                    headerRestdeAt = 'Y';
                }

                setRestDtTime();    // 타이머 문구 세팅, interval 시작
            }
        });
    }


    function setRestDtTime() { 			// 타이머 문구 세팅, interval 시작
        $("#landing-timeset").text("서린닷컴 " + headerRestWaitNm); 	// 타이머 문구 변경
        startHeaderRestTimer(headerRestWaitTerm); 						// 영업 시간 타이머 interval
    }

    function startHeaderRestTimer(secondTerm) {							// 영업 시간 타이머 interval

        clearInterval(headerRestTimer);								// 타이머 clear
        headerRestTimer = setInterval(function () {
            resultTime = sorin.timer.timeFormat(secondTerm);			// 시간 DD일 HH:mm:ss format으로 변경

            //운영여부가 undefined로 조회되는 경우
            if((pageSleMthd == "01" && !headerRestDeLive)
                || (pageSleMthd == "02" && !headerRestDeFixed)) {
// 			$(".off-time:visible").addClass("hide");
                return;
            }

            for (var i = 0; i < restDataList.length; i++) {
                try {
                    if (pageMetal == restDataList[i].metalCode && restDataList[i].sleMthdCode == pageSleMthd) {
                        if (restDataList[i].openTimeCode == "00" || restDataList[i].openTimeCode == "10" || restDataList[i].openTimeCode == "30") { // 휴일
                            operateFlag = false;
                            if (secondTerm <= 0) {							// 시간차가 0이 들어왔을 때
                                stopRestTimer();							// interval clear

                                if (currentPage == "steel") {
                                    $("#steelTimer").empty();
                                    $("#titleOpen").text('');
                                    $("#titleOpen").html("시초가 수신 전");
                                    return;
                                } else {
                                    $("#landing-timer").text('');
                                    getRestDtTimeSet();						// 영업 시간 타이머
                                }
                                return;
                            } else {
                                if (currentPage == "steel") {
                                    $(".steelTimer").text("-"+ resultTime);
                                }
                            }
                        } else if (restDataList[i].openTimeCode == "20" || restDataList[i].openTimeCode == "21" || restDataList[i].openTimeCode == "23") {		// 운영중
                            if (secondTerm <= 0) {								// 시간차가 0이 들어왔을 때
                                stopRestTimer();								// interval clear

                                if (currentPage == "landing" || currentPage == "steel") {
                                    location.reload(true); 						//현재 페이지가 메인, 금속 메뉴일 경우 refresh
                                    return;
                                } else {
                                    getRestDtTimeSet();							// 영업 시간 타이머
                                }

                                return;
                            }

                        } else if (restDataList[i].openTimeCode == "22" || restDataList[i].openTimeCode == "24" || restDataList[i].openTimeCode == "25") {		// 일시휴장,사이드카
                            operateFlag = false;
                            if (restDataList[i].restWaitTerm <= 0) { 		// 시간차가 0이 들어왔을 때
                                stopRestTimer(); 							// interval clear

                                if (currentPage == "landing" || currentPage == "steel") {
                                    location.reload(true); 					//현재 페이지가 메인, 금속 메뉴일 경우 refresh
                                    return;
                                } else {
                                    getRestDtTimeSet();						// 영업 시간 타이머
                                }
                            } else {
                                if(currentPage == "steel"){
                                    $("#titleClose").html("임시휴장"+ " -" +resultTime);
                                }
                            }
                        } else if (restDataList[i].openTimeCode == "40" || restDataList[i].openTimeCode == "41") {		// 시초가 수신
                            operateFlag = false;
                            stopRestTimer();									// interval clear

                            if(currentPage == "steel"){
                                stopRestTimer();								// interval clear
                                $("#steelTimer").empty();
                                $("#openTimer").addClass("close");
                                $(".title close").html("시초가 수신 전");
                                $("#titleClose").html("시초가 수신 전");
                                return;
                            } else {
                                $("#headerTimeset").text('');
                                return;
                            }
                        } else {
                            if (secondTerm <= 0) {				// 시간차가 0이 들어왔을 때
                                stopRestTimer();				// interval clear
                                if (currentPage == "landing" || currentPage == "steel") {
                                    location.reload(true);		//현재 페이지가 메인, 금속 메뉴일 경우 refresh
                                    return;
                                } else {
                                    getRestDtTimeSet();			// 영업 시간 타이머
                                }
                                return;
                            }
                        }

                        if (currentPage == "landing") {
                            $("#landing-timer").text(resultTime);
                        }

                        restDataList[i].restWaitTerm = restDataList[i].restWaitTerm - 1;
                        secondTerm = secondTerm - 1;

                        if (headerRestdeAt == "Y" && currentPage == "landing") { 	//휴일일 때
                            //랜딩페이지 타이머
                            if ($("#landing-timer").is(":visible")) {
                                $("#landing-timer:visible").text("-" + resultTime);
                            }
                        }
                    } else {
                        restDataList[i].restWaitTerm = restDataList[i].restWaitTerm - 1;
                    }
                } catch (err) {
                    stopRestTimer();
                    alertPopup("타이머에 문제가 생겼습니다.\n확인을 누르면 메인화면으로 갑니다.", function () {
                        location.reload(true);
                        return true;
                    });
                }
            }
        }, 1000);
    }

    function stopRestTimer() { // 타이머 0일 때, 화면 refresh
        clearInterval(headerRestTimer); // 타이머 clear
        headerRestTimer = null;
    }


    var alRestdeStatus = "N"; // 알루미늄 휴무
    var znRestdeStatus = "N"; // 아연 휴무

    // 사이트카 웹소켓 (발동,발동 해제시에만 들어옴)
    function webSocketSidcarOP() {
        stompSubscribe(stompClient, "/sidecar", function (receiveData) {
            if (!sorin.validation.isNull(receiveData.body)) {
                if (!sorin.validation.isEmpty(sorinAccount)) { // 로그인 여부 체크
                    const data = JSON.parse(receiveData.body);
                    for (var i = 0; i < data.length; i++) {
                        var sidecarData = data[i];
                        if (pageMetal == '7') {
                            if (sidecarData.metalCode == '7' && sidecarData.motnAt == 'Y') {
                                // 알루미늄 사이드카 걸렸을 경우
                                alRestdeStatus = "Y";
                            } else {
                                alRestdeStatus = "N";
                            }
                            headerSideCarMetalCode = sidecarData.metalCode; // 사이드카 메탈코드
                            headerMotnAt = sidecarData.motnAt; // 사이드카 발동 여부

                            if (currentPage == "landing" || currentPage == "/pd/itemPriceSearch") {
                                location.reload(true);
                            }
                        }
                    }
                }
            }
        });
    }



    // authMetalMenu(state)
    // 	state = 1~4 :  임시회원, 계좌 상태별 팝업
    //  state = 5 :  간편회원, 메뉴 접근 불가 팝업

    function switchHeaderType() {

        switch (sorinAccount.type) {
            case '01':
                /*    if('01' != sorinAccount.mberSttusCode){
                       // 커뮤니티 메뉴, 마이페이지, 알림 설정, 배송 조회, 장바구니, ewallet 접근 불가
                       //마이페이지 접근시 정회원 전용 팝업알림 제거
                       //noAuthCmmntyMenu(); // 임시 회원
                       authMetalMenu();  // 임시 회원  (금속 메뉴 접근 불가)
                   } */

                if ('' == sorinAccount.secode || '04' == sorinAccount.secode) {
                    authMetalMenu('5'); // 04-자금담당 (금속 메뉴 접근 불가)
                }

                $('#simplelogin-header').hide();
                $('#logout-header').hide();
                $('#login-header .username').html(sorinAccount.name);
                //$('#login-header .useremail').html(sorinAccount.email);

                //신규로 변경예정
                /*
               if(sorinAccount.refndAcnutSttusCode == '02' || sorinAccount.refndAcnutSttusCode == '04') {
                  $('#login-header .refndSttus').html("시스템 오류입니다.<br>고객센터로 문의해 주세요.");
               } else if(sorinAccount.refndAcnutSttusCode == '03') {
                  $('#login-header .refndSttus').html("하나은행 에스크로 선불금 관리대행<br>서비스의 동의가 필요합니다. <a href='https://biz.kebhana.com/esc/escn/index.do?menuItemId=wcesc800_100i' target='_blank'>동의하러가기</a>");
                  //$('#login-header .refndSttus').html("<a href='https://biz.kebhana.com/esc/escn/index.do?menuItemId=wcesc800_100i' target='_blank'><button type='button' class='btn-header-agreAt'>동의하러가기</button></a>");
               } else if(sorinAccount.refndAcnutSttusCode == '') {
                  //관리자가 사용등록(7350)을 안한 상태
                  $('#login-header .refndSttus').html("관리자 승인 대기중입니다.");
               } else if(sorinAccount.mberSttusCode == '03' && sorinAccount.refndAcnutSttusCode == '05') {
                  //임시회원상태이고 환불계좌상태가 최종응답완료일 경우
                  $('#login-header .refndSttus').html("관리자 승인 대기중입니다.");
               } else {
                  $('#login-header .refndSttus').html("");
               }
                  */
                //CSS SHOW display 설정
                let mberSttusCode = sorinAccount.mberSttusCode;
                let refndAcnutSttusCode = sorinAccount.refndAcnutSttusCode;


                //아래 소스코드 개선작업
                mberPopupChange(mberSttusCode, refndAcnutSttusCode);

                //임시회원 계좌상태별 팝업
                if (mberSttusCode == '03' && refndAcnutSttusCode == '') {				//임시회원
                    authMetalMenu('1');			//하나은행 계좌 등록 중입니다.
                } else if (mberSttusCode == '03' && refndAcnutSttusCode == '01') {		//임시회원&환불계좌전송완료
                    authMetalMenu('2');			//고객 전용 가상 계좌 준비중입니다.
                } else if (mberSttusCode == '03' && refndAcnutSttusCode == '03') {		//임시회원&응답완료
                    authMetalMenu('3');			//선불금 관리대행 서비스 동의를 진행 중입니다.
                } else if (mberSttusCode == '03' && refndAcnutSttusCode == '05') {		//임시회원&최종응답완료
                    authMetalMenu('4');			//거래회원 승인 대기 중 입니다.
                } else {
                    //$('#login-header .refndSttus').html("");
                }

                /*
                if(mberSttusCode == '03' && refndAcnutSttusCode == '') {
                        //#1 기업 회원 (환불계좌 X ,가상계좌 X, 에스크로 X, 회원승인 X )

                         $('#memberState1').css('display', 'block');
                   $('#memberState2').css('display', 'none');
                   $('#memberState3').css('display', 'none');
                   $('#memberState4').css('display', 'none');
                   $('#memberState5').css('display', 'none');

                } else if(mberSttusCode == '03' && refndAcnutSttusCode == '01') {
                  //#2 기업 임시회원 (환불계좌 O ,가상계좌 X, 에스크로 X, 회원승인 X )

                     $('#memberState1').css('display', 'none');
                   $('#memberState2').css('display', 'block');
                   $('#memberState3').css('display', 'none');
                   $('#memberState4').css('display', 'none');
                   $('#memberState5').css('display', 'none');

                } else if(mberSttusCode == '03' && refndAcnutSttusCode == '03') {
                      //#3 기업 임시회원 (환불계좌 O ,가상계좌 O, 에스크로 X, 회원승인 X )

                     $('#memberState1').css('display', 'none');
                   $('#memberState2').css('display', 'none');
                   $('#memberState3').css('display', 'block');
                   $('#memberState4').css('display', 'none');
                   $('#memberState5').css('display', 'none');

                } else if(mberSttusCode == '03' && refndAcnutSttusCode == '05') {
                      //#4 기업 임시회원 (환불계좌 O ,가상계좌 O, 에스크로 O, 회원승인 X )

                     $('#memberState1').css('display', 'none');
                   $('#memberState2').css('display', 'none');
                   $('#memberState3').css('display', 'none');
                   $('#memberState4').css('display', 'block');
                   $('#memberState5').css('display', 'none');

                } else if(mberSttusCode == '01') {
                      //#5 기업 정회원 (환불계좌 O ,가상계좌 O, 에스크로 O, 회원승인 O )

                     $('#memberState1').css('display', 'none');
                   $('#memberState2').css('display', 'none');
                   $('#memberState3').css('display', 'none');
                   $('#memberState4').css('display', 'none');
                   $('#memberState5').css('display', 'block');

                   //최근접속일자 >= 최종승인일자 가입완료팝업 표기 X
                   var headUtil = $('.util-list > ul');
                   if(sorinAccount.currentDt > sorinAccount.mberConfmProcessDt){

                       headUtil.removeClass('member-pop-on');
                   } else {
                       headUtil.addClass('member-pop-on');
                   }

                } else {
                  $('#login-header .refndSttus').html("");
                }*/

                $('#login-header').show();
                break;
            case '02':
                authMetalMenu('5');  // 간편 회원 (금속 메뉴 접근 불가)
                noAuthCmmntyMenu(); // 간편 회원 (커뮤니티 조회, 마이페이지 x)
                $('#logout-header').hide();
                $('#login-header').hide();
                $('#simplelogin-header .username').html(sorinAccount.name);
                $('#simplelogin-header .useremail').html(sorinAccount.email);
                $('#simplelogin-header').show();
                break;
            default:
                $('#simplelogin-header').hide();
                $('#login-header').hide();
                $('#logout-header').show();
        }

        setHeaderMenu();    // 헤더 메뉴
    }


    //회원구분별 CSS 뿌려주기
    function mberPopupChange(mberSttusCode, refndAcnutSttusCode) {
        if (mberSttusCode == '03') {
            for (var i = 1; i < 6; i++) {
                let setDisplay = 'none';
                if (refndAcnutSttusCode == "" && i == 1) {
                    setDisplay = 'block';
                } else if (refndAcnutSttusCode == "01" && i == 2) {
                    setDisplay = 'block';
                } else if (refndAcnutSttusCode == "03" && i == 3) {
                    setDisplay = 'block';
                } else if (refndAcnutSttusCode == "05" && i == 4) {
                    setDisplay = 'block';
                } else {
                }
                $('#memberState' + i).css('display', setDisplay);
            }
        } else {
            if (mberSttusCode == '01') {
                for (var i = 1; i < 6; i++) {
                    let setDisplay = 'none';
                    if (refndAcnutSttusCode == "05" && i == 5) {
                        setDisplay = 'block';
                    } else {
                    }
                    $('#memberState' + i).css('display', setDisplay);
                }

                //최근접속일자 >= 최종승인일자 가입완료팝업 표기 X
                var headUtil = $('.util-list > ul');
                if (sorinAccount.currentDt > sorinAccount.mberConfmProcessDt) {
                    headUtil.removeClass('member-pop-on');
                } else {
                    headUtil.addClass('member-pop-on');
                }
            } else {
                $('#login-header .refndSttus').html("");
            }
        }
    }
	
	function trackSorin(url, cnvrsCodeParam, trackParam, detailParam, cnvrsParam){

		var trackVo = {};
		var trackDetailVo = {};
		var cnvrsCode = "0000";
		
		if(!sorin.validation.isEmpty(cnvrsCodeParam)) {
			cnvrsCode = cnvrsCodeParam;
		}

		if(!sorin.validation.isEmpty(trackParam)) {
			trackVo = trackParam;
		}

		//외부유입 경로 세팅
		var ref = document.referrer;
		if(!sorin.validation.isEmpty(ref) && ref.indexOf(window.url) < 0) {
			trackVo.inflowCours = ref;
		}
		if(ref.indexOf('/fo/extrlPcProvd/rltmPcInfo') != -1) { //철강신문 유입
			trackVo.inflowCours = 'https://www.snmnews.com/';
		}
	
		if(!sorin.validation.isEmpty(detailParam)) {
			trackDetailVo = detailParam;
		}
		trackDetailVo.cnvrsCode = cnvrsCode;
		trackDetailVo.nowScreen = url;
		trackDetailVo.beforeScrin = currentPage;
		trackVo.trackDetailVo = trackDetailVo;
		
		if(!sorin.validation.isEmpty(cnvrsParam)) {
			var trackCnvrsVo = cnvrsParam;
			switch(cnvrsCode.substring(0, 2)) {
				case "01" : 
					trackVo.trackMemberVo = trackCnvrsVo;
					break;
				case "02" :
					trackVo.trackOrderVo = trackCnvrsVo;
					break;
			}
		}
		
		//요런 방식으로 호출 
		// 보낼때 VO 값이 계속 달라 져야 함. 
		sorin.ajax.postJSON("/fo/tr/trackSorin", JSON.stringify(trackVo), true, function(data){
			if(!sorin.validation.isNull(data)){
			//	alertPopup(data, function(){
			//		return true;
			//	});
			}
		});
	}
	
    $(function () {
        websocketOpenLoop(); // 타이머 싱크를 위한 웹소켓

        getRestDtTimeSet(); // 영업 시간 타이머

        setRestDtTime();    // 타이머 문구 세팅, interval 시작

        document.addEventListener('visibilitychange', () => { //웹소켓 연결 끊긴 경우 리프레쉬
            if (document.visibilityState == "visible") {
                var currentTime = new Date();
                var elapsedMin = (currentTime.getTime() - lastConnectedTime.getTime()) / 1000 / 60;

                if (elapsedMin > 30) {

                    //타이머 소켓 연결
                    websocketOpenLoop();

                    getRestDtTimeSet(); // 영업 시간 타이머
                    setRestDtTime();    // 타이머 문구 세팅, interval 시작

                }
            }
        });
    });

    async function moveToMetalMenu(url, metalCode, sleMthdCode, metalClCode) {
    	var params = {"metalCode" : metalCode, "sleMthdCode" : sleMthdCode, "metalClCode" : metalClCode, srhGubunCode : "02", loadingFlag : "Y" };

    	if (currentPage == "landing") {
			redirectParam('metalCode,sleMthdCode,metalClCode,srhGubunCode');
			redirectParamData('"'+metalCode+','+sleMthdCode+','+metalClCode+','+'02"');
			loginChk(url);
		} else {
			let menuIdParams = makeMenuActiveIdenty(url, JSON.stringify(params));
			if(sorinAccount != '') {
                params.cnvrsCode = "0201";
                params.cnvrsParam = {"metalCode" : metalCode, "sleMthdCode" : sleMthdCode, "metalClCode" : metalClCode};	
            }
			pageMove(url, JSON.stringify(params), "application/json", menuIdParams);
		}
    	
    	/*
    	let promise = new Promise(function(resolve, reject) {
    		sorin.loading.start();
    		sorin.ajax.postJSON("/pd/selectIsecoStock", JSON.stringify(params), true, function(data) {
    			resolve(data);
    	   });
    	})

    	let stock = await promise;
        if(stock <= 0) {
    	   	alertPopup("현재 상품 준비중입니다.\r\n감사합니다.", function() {
    	   		return true;
    	   	})
        }else {
    		if (currentPage == "landing") {
    			redirectParam('metalCode,sleMthdCode,metalClCode,srhGubunCode');
    			redirectParamData('"'+metalCode+','+sleMthdCode+','+metalClCode+','+'02"');
    			loginChk(url);
    		} else {
    			let menuIdParams = makeMenuActiveIdenty(url, JSON.stringify(params));
    			pageMove(url, JSON.stringify(params), "application/json", menuIdParams);
    		}
        }
        */
    }

    async function moveToMetalMenuInLanding(url, metalCode, sleMthdCode, metalClCode) {
        var params = {"metalCode" : metalCode, "sleMthdCode" : sleMthdCode, "metalClCode" : metalClCode, srhGubunCode : "02", loadingFlag : "Y" };

        redirectParam('metalCode,sleMthdCode,metalClCode,srhGubunCode');
        redirectParamData('"'+metalCode+','+sleMthdCode+','+metalClCode+','+'02"');

        let menuIdParams = makeMenuActiveIdenty(url, JSON.stringify(params));
        loginChk(url);
        
        /*
        let promise = new Promise(function(resolve, reject) {
            sorin.loading.start();
            sorin.ajax.postJSON("/pd/selectIsecoStock", JSON.stringify(params), true, function(data) {
                resolve(data);
            });
        })

        let stock = await promise;
        if(stock <= 0) {
            alertPopup("현재 상품 준비중입니다.\r\n감사합니다.", function() {
                return true;
            })
        }else {
            let menuIdParams = makeMenuActiveIdenty(url, JSON.stringify(params));
            loginChk(url);
        }
        */
    }

    function insertAccnutNo() {
        let url = "/fo/Member/selectEntrpsAccntReg";
        pageMove(url, "", "");
    }
    function onNewTab(url) {
        let win = window.open(url);
        win.focus();
    }

    function chkLoginStatus(url) {
        var sorinAccount = sorin.account.getUserInfo();

        if (sorinAccount != '') {
            if (sorinAccount.type == '01' && sorinAccount.mberSttusCode == '01') {
                if (sorinAccount.secode == '01') {
                    pageMove(url);
                } else {
                    alertPopup("결제수단의 신청 및 관리는 마스터계정에서만 가능 합니다.", function () { return true; });
                }
            } else {
                alertPopup("결제수단의 신청 및 관리는 정회원만 가능 합니다.", function () { return true; });
            }
        } else {
            confirmPopup(sorin.message.geti18nMsg("fo.mb.validation.login.status"), function () {
                pageMove('/account/login'); //회원 전용 서비스입니다. 로그인 후 이용하시겠습니까?
                return true;
            });
        }

    }

    function isBuyPossible(btnGbn) {
        var sorinAccount = sorin.account.getUserInfo();

        if (sorinAccount != '') {
            //간편회원 구매불가능처리
            if (sorinAccount.type == '01') {
                //자금담당자 구매불가능처리
                if (sorinAccount.secode == '01' || sorinAccount.secode == '02' || sorinAccount.secode == '03') {
                    if (headerOpenTimeCode == "00") { // 휴일
                        if (btnGbn == "buy") {
                            alertPopup(chartStTitleNm + " (으)로 구매할 수 없습니다.\n(주말, 공휴일, LME휴장일은 서린닷컴 휴장일 입니다.)", function () { return true; });
                            return false;
                        } else if (btnGbn == "basket") {
                            alertPopup(chartStTitleNm + " (으)로 관심상품에 추가할 수 없습니다.\n(주말, 공휴일, LME휴장일은 서린닷컴 휴장일 입니다.)", function () { return true; });
                            return false;
                        } else if (btnGbn == "alarm") {
                            alertPopup(chartStTitleNm + " (으)로 알림을 설정할 수 없습니다.\n(주말, 공휴일, LME휴장일은 서린닷컴 휴장일 입니다.)", function () { return true; });
                            return false;
                        }
                    } else if (headerOpenTimeCode == "10" || headerOpenTimeCode == "30") { // 영업시작전
                        if (btnGbn == "buy") {
                            alertPopup("서린닷컴 운영시간이 아니므로 구매할 수 없습니다.\n- 운영시작까지 " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "basket") {
                            alertPopup("서린닷컴 운영시간이 아니므로 관심상품에 추가할 수 없습니다.\n- 운영시작까지 " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "alarm") {
                            alertPopup("서린닷컴 운영시간이 아니므로 알림을 설정할 수 없습니다.\n- 운영시작까지 " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.", function () { return true; });
                            return false;
                        }
                    } else if (headerOpenTimeCode == "22") { // 일시휴장
                        if (btnGbn == "buy") {
                            alertPopup(chartStTitleNm + " " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.\n지금은 구매할 수 없습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "basket") {
                            alertPopup(chartStTitleNm + " " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.\n지금은 관심상품에 추가할 수 없습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "alarm") {
                            alertPopup(chartStTitleNm + " " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.\n지금은 알림을 설정할 수 없습니다.", function () { return true; });
                            return false;
                        }
                    } else if (headerOpenTimeCode == "20" || headerOpenTimeCode == "21" || headerOpenTimeCode == "23") { // 운영중
                        return true;
                    } else if (headerOpenTimeCode == "24") { // LME 사이드카
                        if (btnGbn == "buy") {
                            alertPopup(chartStTitleNm + " " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.\n지금은 구매할 수 없습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "basket") {
                            alertPopup(chartStTitleNm + " " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.\n지금은 관심상품에 추가할 수 없습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "alarm") {
                            alertPopup(chartStTitleNm + " " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.\n지금은 알림을 설정할 수 없습니다.", function () { return true; });
                            return false;
                        }
                    } else if (headerOpenTimeCode == "25") { // 환율 사이드카
                        if (btnGbn == "buy") {
                            alertPopup(chartStTitleNm + " " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.\n지금은 구매할 수 없습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "basket") {
                            alertPopup(chartStTitleNm + " " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.\n지금은 관심상품에 추가할 수 없습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "alarm") {
                            alertPopup(chartStTitleNm + " " + sorin.timer.timeFormat(headerRestWaitTerm) + " 남았습니다.\n지금은 알림을 설정할 수 없습니다.", function () { return true; });
                            return false;
                        }
                    } else if (headerOpenTimeCode == "40" || headerOpenTimeCode == "41") {// 시초가 수신
                        if (btnGbn == "buy") {
                            alertPopup("서린닷컴 시초가 수신 전 상태로\n지금은 구매할 수 없습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "basket") {
                            alertPopup("서린닷컴 시초가 수신 전 상태로\n지금은 관심상품에 추가할 수 없습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "alarm") {
                            alertPopup("서린닷컴 시초가 수신 전 상태로\n지금은 알림을 설정할 수 없습니다.", function () { return true; });
                            return false;
                        }
                    } else if (headerOpenTimeCode == "999") {// 운영정보조회 데이터 없을때
                        if (btnGbn == "buy") {
                            alertPopup(chartStTitleNm + " 구매할 수 없습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "basket") {
                            alertPopup(chartStTitleNm + " 관심상품에 추가할 수 없습니다.", function () { return true; });
                            return false;
                        } else if (btnGbn == "alarm") {
                            alertPopup(chartStTitleNm + " 알림을 설정할 수 없습니다.", function () { return true; });
                            return false;
                        }
                    } else {
                        return true;
                    }
                } else {
                    alertPopup("메뉴 접근 권한을 확인해주세요.\n 마스터, 구매총괄, 구매담당자만 이용 가능합니다.", function () { return true; });
                    return false;
                }
            } else {
                confirmPopup("기업 회원 전용 서비스입니다.\n기업 회원으로 가입 후 이용해주세요.", function () {
                    pageMove('/fo/Member/selectEntrpsEtr');
                    return true;
                });
            }
        } else {
            confirmPopup("기업 회원 전용 서비스입니다.\n기업 회원으로 가입 후 이용해주세요.", function () {
                pageMove('/account/login');
                return true;
            });
        }
    }


    function isJsonString(str) {
        try {
            var json = JSON.parse(str);
            return (typeof json === 'object');
        } catch (e) {
            return false;
        }
    }
</script>

<!-- AceCounter Log Gathering Script V.8.0.AMZ2019080601 -->
<script language='javascript'>

    // 	운영, 개발
    var url = window.location.host;

    if(url.startsWith('www.metalsorin.com')){
        var _AceGID=(function(){var Inf=['gtc20.acecounter.com','8080','AS2A45547990099','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src ="https://"+ Inf[0] +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
        var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src='https:'+'//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();
    }else if(url.startsWith('st.metalsorin.com')){
        var _AceGID=(function(){var Inf=['gtp10.acecounter.com','8080','AH2A46281694649','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src ="https://"+ Inf[0] +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
        var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src='https:'+'//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();
    }else{

    }

</script>
<!-- AceCounter Log Gathering Script End -->

<script async src="https://www.googletagmanager.com/gtag/js?id=G-7H9TTS7R5W"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'G-7H9TTS7R5W');
</script>

<script type="text/javascript">
	if(!wcs_add) var wcs_add = {};
	wcs_add["wa"] = "s_2742d2178b9c";
	if (!_nasa) var _nasa={};
	wcs.inflow();
	wcs_do(_nasa);
</script>

<script defer id="kakao-jssdk"></script>
<script>
    /*
        // 카카오 SDK 초기화
        window.kakaoAsyncInit = function() {
            if (Kakao.Channel == null) {
                Kakao.init('01a80afb82ca42a58539cd6960846d74');
            }
        };

        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (id != 'kakao-jssdk') {
                return;
            }
            js = d.createElement(s);
            js.id = id;
            js.src = "https://developers.kakao.com/sdk/js/kakao.js";
            var done = false;
            js.onload = js.onreadystatechange = function() {
                if (!done
                        && (!this.readyState || this.readyState === "loaded" || this.readyState === "complete")) {
                    done = true;
                    if (typeof window.kakaoAsyncInit === 'function') {
                        window.kakaoAsyncInit();
                    }
                    // Handle memory leak in IE
                    js.onload = js.onreadystatechange = null;
                    if (fjs && js.parentNode) {
                        fjs.parentNode.removeChild(js);
                    }
                }
            }
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'kakao-jssdk'));
     */

    $(function() {
        $("#fsHealthCheck").dblclick(
            function(event) {
                event.preventDefault();

                sorin.ajax.customErrorCallback("POST", "/fsHttpHealthTest",
                    "", "", "", true, function(successMessage) {
                        console.log("fs 성공입니다.");
                        console.log(successMessage);
                    }, function(errorMessage) {
                        console.log("fs 실패.");
                        console.log(errorMessage);
                    })
            });

        $("#fxHealthCheck").dblclick(
            function(event) {
                event.preventDefault();

                sorin.ajax.customErrorCallback("POST", "/fxHttpHealthTest",
                    "", "", "", true, function(successMessage) {
                        console.log("fx 성공입니다.");
                        console.log(successMessage);
                    }, function(errorMessage) {
                        console.log("fx 실패.");
                        console.log(errorMessage);
                    })
            });

        $("#vaHealthCheck").dblclick(
            function(event) {
                event.preventDefault();
                console.log("HanaEwalletHealthCheckStart");

                sorin.ajax.customErrorCallback("POST", "/vaHttpHealthTest",
                    "", "", "", true, function(successMessage) {
                        console.log("va 성공입니다.");
                        console.log(successMessage);
                    }, function(errorMessage) {
                        console.log("va 실패.");
                        console.log(errorMessage);
                    })
            });

        $("#apiHealthCheck").dblclick(
            function(event) {
                event.preventDefault();
                console.log("ApiHealthCheckStart");

                sorin.ajax.customErrorCallback("POST",
                    "/apiHttpHealthTest", "", "", "", true, function(
                        successMessage) {
                        console.log("api 성공입니다.");
                        console.log(successMessage);
                    }, function(errorMessage) {
                        console.log("api 실패.");
                        console.log(errorMessage);
                    })
            });

        $('.main-side__top').click(function(){

            $('html, body').stop().animate({'scrollTop':'0'});
        });

    });

    // function chatChannel() {
    // 	Kakao.Channel.chat({
    // 		channelPublicId: '_ACxixfs',
    // 	})
    // }
</script>