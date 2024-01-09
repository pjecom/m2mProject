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

</script>