<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 상단 고정영역 -->
<aside class="web-sidebar">
<div class="sidebar-head">
    <header>
        <a href="/" class="logo">
            <img src="/bo_images/logo.png" alt="logo" class="logo"/>
        </a>
        <button type="button" class="hamburger" data-class="closed-sidebar">
            <i class="icon icon-hamburger"></i>
        </button>
    </header>
</div>
<!-- 컨텐츠  -->
<div class="sidebar-body">
    <!-- 메뉴 -->
    <ul class="sidebar-menu">
        <!-- [D] 서브메뉴가 있을 때 .has-submenu 추가 -->
        <li class="has-submenu" id="sidebar_414">
        	<a class="sidebar-1depth" aria-label="">구매입찰관리</a>
        	<div class="sidebar-2depth has-submenu" id="sidebar_415">
        	<a class="has-submenu">입찰 공고 관리</a>
        	<ul class="sidebar-3depth">
        	<li id="sidebar_422" value="/bo/bd/selectBidList">입찰 공고 관리</li>
        	</ul>
        </div>
        <div class="sidebar-2depth has-submenu" id="sidebar_418">
        <a class="has-submenu">입찰 회원 관리</a><ul class="sidebar-3depth">
        <li id="sidebar_426" value="/bo/bd/selectBidMberList">입찰 회원 관리</li></ul>
        </div>
    </ul>
</div>
</aside>
<!-- 하단 고정영역 -->
<div class="sidebar-foot">
</div>

<style>  /* 사이드 탭 커서로 바꾸기 */
    .sidebar-3depth li {
        cursor: pointer;
    }
</style>

<script src="/bo_js/tabCommon.js"></script>
<script>

</script>