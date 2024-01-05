<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<header class="web-header">
<div class="header">
    <ul class="alarm-list">
        <!-- [D] 에러 상태일 경우 .status-error 추가 빨간색 -->
        <!-- [D] 경고 상태일 경우 .status-warning 추가 노랑-->
        <!-- [D] 정상 상태일 경우 .status-normal 추가 초록-->
        <li class="alarm-set status-error" id="lme">
            <i class="icon icon-traffic"></i>
            <span class="desc">LME</span>
        </li>
        <li class="alarm-set status-error" id="exRg">
            <i class="icon icon-traffic"></i>
            <span class="desc">환율</span>
        </li>
        <li class="alarm-set status-error" id="fs">
            <i class="icon icon-traffic"></i>
            <span class="desc">FS</span>
        </li>
        <li class="alarm-set status-error" id="fx">
            <i class="icon icon-traffic"></i>
            <span class="desc">FX</span>
        </li>
        <li class="alarm-set status-error" id="eWallet">
            <i class="icon icon-traffic"></i>
            <span class="desc">E-Wallet</span>
        </li>
        <li class="alarm-set has-new tooltip" onclick="javascript:openCsList();">
            <i class="icon icon-comment"></i>
            <span class="badge">12</span>
            <div class="tooltip-wrap">
                <div class="tooltiptext list-tooltip" onclick="javascript:openCsList();">
                    <span class="title">상담문의 조회</span>
                    <ul>
                        <li>
                            <span class="label">문의 건수</span>
                            <a href="javascript:;" class="count" id="newInqry">20</a>
                        </li>
                        <li>
                            <span class="label">해결 건수</span>
                            <a href="javascript:;" class="count resolved" id="solvedInqry">8</a>
                        </li>
                        <li>
                            <span class="label">미해결 건수</span>
                            <a href="javascript:;" class="count unresolved" id="unsolvedInqry">12</a>
                        </li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="alarm-set tooltip">
            <i class="icon icon-user"></i>
            <div class="tooltip-wrap">
                <div class="tooltiptext user-tooltip">
                    <span class="title">박지민 과장</span>
                    <span class="date">2021-03-31 18:36:04</span>
                    <button type="button" class="btn btn-logout">로그아웃</button>
                </div>
            </div>
        </li>
        <li class="alarm-set">
            <i class="icon icon-dashboard"></i>
            <!-- 1920*1080   -->
            <a href="javascript:openAcmsltDashBoard()" title="실적분석 대시보드">서린닷컴 실적분석</a>
        </li>
        <li class="alarm-set">
            <i class="icon icon-dashboard"></i>
            <!-- 1920*1080   -->
            <a href="javascript:openOrderDashBoard()" title="대시보드">DASHBOARD</a>
        </li>
        <li class="alarm-set">
            <i class="icon icon-dashboard"></i>
            <!-- 1920*1080 -->
            <a href="javascript:openTrackDashBoard()" title="대시보드">TRCK_DASHBOARD</a>
        </li>
    </ul>
</div>
<div class="header-tab-group">
    <div class="header-tab-set">
	    <div class="scroll-x">
	       <!--  <span class="header-tab is-active">
	        	<a href="javascript:;" class="link-to-page">Dashboard</a>
	            <a href="javascript:;" class="link-to-page">MAIN</a> 2021-12-14 임시
	            <button class="icon icon-tab-close"></button>
	        </span> -->
	    </div>
    </div>
    <div class="header-btn-set">
        <button type="button" class="tab-prev"></button>
        <button type="button" class="tab-next"></button>
        <button type="button" class="tab-close" id="closeAll"></button>
    </div>
</div>
</header>

<script>
var subscriberURI = '/selectHeaderConnSttsSchedule';

$(function() {
    sorin.ajax.getJSON('/bo/ma/csStatus', '', false, function(data) {
        $('#newInqry').html(data.newInqry);
        $('#solvedInqry').html(data.solvedInqry);
        $('#unsolvedInqry').html(data.unsolvedInqry);
        $('.badge').html(data.unsolvedInqry);
        if(sorinAccount == "" || sorinAccount == null || sorinAccount === undefined) {
            $('.user-tooltip > .title').html('');
            $('.user-tooltip > .date').html('');
        }
        else {
            $('.user-tooltip > .title').html(sorinAccount.name + " " + sorinAccount.ofcps);
            $('.user-tooltip > .date').html(sorinAccount.recentLoginDt);
        }
    })

    selectHeaderConnStts();

    websocketOpenLoop();
})

$(document).on('click', '.btn-logout', function() {
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "/login/logout");
    document.body.appendChild(form);
    form.submit();
})

function selectHeaderConnStts() {
	sorin.ajax.postJSON('/bo/connSttsMonitor/selectHeaderConnStts', '', true, function(data) {

		$.each(data.headerConnStts,function(index,obj){

    	   var cntcSttusCode = obj.cntcSttusCode; // 연동 상태 코드
    	   var intrfcSeCode = obj.intrfcSeCode; //인터페이스 구분 코드

    	   switch(intrfcSeCode){
    	   		case "10" :
    	   				setTraffic("lme",cntcSttusCode);
    	   				break;
    	   		case "20" :
    	   				setTraffic("exRg",cntcSttusCode);
   						break;
    	   		case "30" :
    	   				setTraffic("fs",cntcSttusCode);
   						break;
    	   		case "40" :
	   					setTraffic("fx",cntcSttusCode);
						break;
    	   		case "50" :
    	   				setTraffic("eWallet",cntcSttusCode);
						break;
    	   }
       });
    })
}

function setTraffic(intrfcSeCode,cntcSttusCode) {

    var status = cntcSttusCode == "1" ? "status-error" : cntcSttusCode == "2" ? "status-warning" : "status-normal";

  	$("#"+intrfcSeCode+"").addClass(status);
}

$("#lme, #exRg, #fs, #fx, #ewallet").on("click",function(){
	$("li[value='/bo/connSttsMonitor/showMonitorList']").trigger("click");// 연계 상태 모니터링 페이지로 이동
	//selectSidebar("/bo/connSttsMonitor/showMonitorList", "연계 상태 모니터링", "sidebar_252");
});

function openOrderDashBoard() { //dashboard 새 창으로 열기
	let dashBoardUrl="";

	sorin.ajax.postJSON('/bo/dashboard/domain', '', false, function(data) {
		//dashBoardUrl = "http://localhost:28083/bo/dashboard/viewDashboard";
		dashBoardUrl = data.dashBoardUrl+"/bo/orderDashboard/viewDashboard";
	});

	if(dashBoardUrl == "")
		return;

	var w = screen.width*0.8;
	var h = screen.width*0.8;
	var LeftPosition=(screen.width-w)/2;
	var TopPosition=(screen.width-h)/2;

	window.open(dashBoardUrl,'dashboard','top='+TopPosition+',left='+LeftPosition+'menubar=no,width='+w+',height='+h+' status=no, toolbar=no, titlebar=no, location=no, scrollbar=no');
}

function openTrackDashBoard() { //dashboard 새 창으로 열기
	let dashBoardUrl="";

	sorin.ajax.postJSON('/bo/dashboard/domain', '', false, function(data) {
		//dashBoardUrl = "http://localhost:28083/bo/dashboard/viewDashboard";
		dashBoardUrl = data.dashBoardUrl+"/bo/trckDashboard/viewTrckDashboard";
	});

	if(dashBoardUrl == "")
		return;

	var w = screen.width*0.8;
	var h = screen.width*0.8;
	var LeftPosition=(screen.width-w)/2;
	var TopPosition=(screen.width-h)/2;

	window.open(dashBoardUrl,'trckDashboard','top='+TopPosition+',left='+LeftPosition+'menubar=no,width='+w+',height='+h+' status=no, toolbar=no, titlebar=no, location=no, scrollbar=no');
}

function openAcmsltDashBoard() { //실적 dashboard 새 창으로 열기
    let dashBoardUrl="";

    sorin.ajax.postJSON('/bo/dashboard/domain', '', false, function(data) {
        //dashBoardUrl = "http://localhost:28083/bo/dashboard/viewAcmsltDashboard";
        dashBoardUrl = data.dashBoardUrl+"/bo/dashboard/viewAcmsltDashboard";
    });

    if(dashBoardUrl == "")
        return;

    var w = screen.width*0.8;
    var h = screen.width*0.8;
    var LeftPosition=(screen.width-w)/2;
    var TopPosition=(screen.width-h)/2;

    window.open(dashBoardUrl,'AcmsltDashboard','top='+TopPosition+',left='+LeftPosition+'menubar=no,width='+w+',height='+h+' status=no, toolbar=no, titlebar=no, location=no, scrollbar=no');
}

function openCsList() {
	$("li[value='/bo/cs/showCsList']").trigger("click");// VOC 통합관리 페이지로 이동
}
</script>