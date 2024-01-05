<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="title" content="서린상사">
    <link rel="shortcut icon" href="/guide/images/favicon.ico">
    <meta name="keywords" content="서린상사, 서린상사(주), 비철금속전문기업, 아연, 황산">
    <meta name="description" content="세계를 선도하는 종합비철무역상사 - 서린상사">
    <title>OTS | SORIN e-Commerce</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="/guide/css/common.css">
    <link rel="stylesheet" href="/guide/css/sorin.css">
    <link rel="stylesheet" href="/guide/css/select2/select2.min.css">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
            //익스플로러로 접속 시 alert 메시지 노출 후 Edge 브라우저로 전환
            if(/MSIE\d|Trident.*rv:/.test(navigator.userAgent)) {

                alert("Sorin.com does not support Microsoft Explorer."
                    +"\nPress confirm to redirect with Edge"
                    +"\nand close the current window.");

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

            let currentPage = "bid"; // 현재 페이지 url, 초기값 main
//          let currentPage = "";       // 현재 페이지 url
//          let operateFlag = true;     //운영여부

//메인으로 갈 때 사용
function moveToBdMain() {
    referer = [];
    sorin.loading.start();
    pageMove("/bid/", /* JSON.stringify({"cnvrsCode" : "0902"}) */"");
}

var jsonChartList = {};
if('${jsonChartList}') {
    jsonChartList = JSON.parse('${jsonChartList}')
}
</script>

<!-- script core :: START -->
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="/js/ui/1.12.1/jquery-ui.min.js"></script>
    <script src="/js/select2/select2.min.js"></script>
    <!-- script core :: END -->
    <!-- script custom :: START -->
    <script src="/js/common.js"></script>
    <script src="/js/sorin.js"></script>
    <!-- script custom :: END -->

        <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="/js/sorin.js"></script>
        <script type="text/javascript" src="/js/jquery.blockUI.js"></script>
        <script type="text/javascript" src="/js/swiper/6.7.0/swiper.js"></script>
        <script type="text/javascript" src="/js/ui/1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/js/sorinCommon.js"></script>
        <script type="text/javascript" src="/js/common-function.js"></script>

<style>
    .pop2 {margin:0 auto; width:430px; height:550px;}
    .pop2 .layerBox {position:fixed; background:#fff; border-radius:6px; width: 45rem; right: 35rem; top: 24.1rem; width:430px; height:550px;}
    .pop2 .layerBox .btnClose {display:inline-block; position:absolute; right:15px; top:20px; padding:6px 12px; color:#444; font-size:20px; }
    .pop2 .layerBox img {display:block; width: 100%;box-shadow: 7px 10px 8px rgb(0 0 0 / 10%);}
    .pop2 .layerBox .chkbox2 {position: absolute; left: 30px; bottom: 30px; height: 2rem; line-height: 4rem; padding: 0 0.9rem; border: 1px #cdcdcd solid; border-radius: 0.3rem;}
    .pop2 .chkbox1 {position: absolute; left: 9px; bottom: 6px; height: 2rem; line-height: 4rem; padding: 0 0.9rem; border: 1px #cdcdcd solid; border-radius: 0.3rem;}
    .pop2 .layerBox .chkboxTxt{position: absolute; left: 43px; bottom: 12px;}
</style>
</head>
    <body>
    <!-- wrapper :: START -->
    <div class="wrapper pt0">
        <!-- header :: START -->
        <div class="header bid" >
            <tiles:insertAttribute name="header"  />
        </div>
        <!-- header :: END -->
        <!-- body-main :: START -->
        <div class="body-main">
            <!-- container :: START -->
            <div class="container">
                <tiles:insertAttribute name="body" />
            </div>
            <!-- container :: END -->
            <div class="popup modal alert" id="alertPopup" style="z-index:9999">
                <div class="modal-content w490px">
                    <div class="modal-header">
                        <h1>Alert</h1>
                        <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">Close Popup</span></button></div>
                    </div>
                    <div class="max-width">
                        <div class="alert-con">Invalid Access.</div>
                    </div>
                    <div class="modal-btns">
                        <button type="button" class="btn-blue-big modal-ok">Confirm</button>
                    </div>
                </div>
            </div>

            <div class="popup modal confirm" id="confirmPopup" style="z-index:9998">
                <div class="modal-content w490px">
                    <div class="modal-header">
                        <h1>Alert</h1>
                        <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">Close Popup</span></button></div>
                    </div>
                    <div class="max-width">
                        <div class="alert-con">Invalid Access.</div>
                    </div><!--// .max-width -->
                    <div class="modal-btns">
                        <button type="button" class="btn-gray-big modal-cancel">Cancel</button>
                        <button type="button" class="btn-blue-big modal-ok">Confirm</button>
                    </div>
                </div>
            </div>

            <div class="popup modal confirm confirm2" id="confirmPopup2" style="z-index:9997">
                <div class="modal-content w490px">
                    <div class="modal-header">
                        <h1>Alert</h1>
                        <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">Close Popup</span></button></div>
                    </div>
                    <div class="max-width">
                        <div class="alert-con">Invalid Access.</div>
                    </div><!--// .max-width -->
                    <div class="modal-btns">
                        <button type="button" class="btn-gray-big modal-cancel">Cancel</button>
                        <button type="button" class="btn-blue-big modal-ok">Confirm</button>
                    </div>
                </div>
            </div>

            <script type="text/javaScript">
             var poptoday = new Date();

                // html 에서 data-expired 가 설정된 팝업 div 들 찾기
                var popup = document.querySelectorAll('[data-expired]');
                for (var i = 0, size = popup.length; i < size; i++) {
                    // 문자열을 공백, -, : 으로 나눠서 배열로 저장
                    var d = popup[i].getAttribute('data-expired').split(/[\s,\-:]+/);
                    var expired_date = new Date(d[0], d[1] - 1, d[2], d[3] || 24, d[4] || 0);

                    // 오늘이 설정한 expired date 전이면 팝업창 보여지게
                    if (today < expired_date) {
                        popup[i].style.display = 'block';
                    }
                    // 아니면 html 에서 삭제 시킴
                    else {
                        popup[i].parentElement.removeChild(popup[i]);
                    }
                }
            </script>
            <div id="pop2" class="pop2" style="position: fixed;  z-index:3!important; display:none;">
                <div class="layerBox">
                    <img src="${noticeLargeImage.docImageUrl}">
                    <div class="form-chk" style="height: 0px;">
                    <input type="checkbox" value="checkbox" class="chkbox2" name="chkbox" id="todaycloseyn1" style="position: relative; left: 1rem; z-index:2!important;"/>
                    <label for="chkday" class="chkboxTxt" style="left: -1rem; bottom: 4rem;">Do not show for 24 hrs</label>
                    </div>
                   <span class="btnClose">
                    <a href="javascript:couponClose()">
                            <svg width="19" height="19" viewBox="0 0 19 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M1.30769 0L0.600586 0.707107L9.08594 9.19246L0.600651 17.6777L1.30776 18.3849L9.79304 9.89956L18.2783 18.3848L18.9854 17.6777L10.5002 9.19246L18.9854 0.707182L18.2783 7.55191e-05L9.79304 8.48535L1.30769 0Z" fill="black"></path>
                            </svg>
                        </a>
                    </span>
                </div>
            </div>

            <c:forEach items="${noticeImage}" var="popup" varStatus="status">
                <div class="popup main-popup pop-main" id="mainPop${popup.noticNo}" onload="draggeable(mainPop${popup.noticNo})">
                    <div class="pop-con" id="mainPopCon${popup.noticNo}">
                        <img src="<c:url value='${popup.docImageUrl}'/>" alt="공지사항">
                    </div>
                    <div class="form-chk">
                                <input type="checkbox" id="todaycloseyn${popup.noticNo}" <c:if test="${popup.emergencyAt == 'Y'}">style="display:none"</c:if>>
                                <label for="todaycloseyn${popup.noticNo}" <c:if test="${popup.emergencyAt == 'Y'}">style="display:none"</c:if>>Do not show for 24 hrs</label>
                    </div>
                    <div class="pop-btn">
                        <button type="button" class="btn-main-pop-x" onclick=''>Close</button>
                    </div>

                </div>
            </c:forEach>
        </div>
        <!-- body-main :: END -->
        <!-- footer :: START -->
        <div class="footer bid">
            <tiles:insertAttribute name="footer" />
        </div>
        <!-- footer :: END -->
    </div>
    <!-- wrapper :: END -->
    <div id="layoutscript" style="display: none">
        <%@include file="/WEB-INF/bdTiles/layoutscript.jsp"%>
    </div>
</body>
</html>