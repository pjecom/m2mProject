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
        		<li id="sidebar_422" value="/bo/bidNoticeMng">입찰 공고 관리</li>
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

<script>
// 사이드바 클릭
$(document).on("click",".sidebar-3depth li",function(){
    $(".sidebar-3depth li").removeClass("active"); // 3depth 모두 활성화 초기화 20220112 추가
    $(this).addClass("active"); // 선택한 3depth 활성화 20220112 추가
    
    selectSidebar($(this).attr('value'), $(this).text(), $(this).attr('id').split("_")[1]);
});

/* 탭 이벤트 */
var dynamicMenuWidth = function(){
    let array = $('.header-tab');
    let sumElement = 0;
    for (let i = 0; i < array.length; i++) {
        sumElement += array[i].getBoundingClientRect().width;
    }
    $('.header-tab-set .scroll-x').css({
        'width': (sumElement) +'px'
    });
};

// 사이드바 선택
function selectSidebar(uri, html, id) {
    var pages = $(".link-to-page");
    for(var item of pages) {
        if($(item).html() == html) {
            $(".header-tab").removeClass('is-active');
            $(item).parent().addClass('is-active'); // 탭변경
            changePage(html); // 페이지변경
            scrollPosition();
            return;
        }
    }
    $(".header-tab").removeClass('is-active');
    addPage(uri, html, id); // 페이지추가
    $('.scroll-x').css('width', '9999px')
    $(".scroll-x").append('<span class="header-tab is-active"><a href="javascript:;" class="link-to-page">' + html + '</a><button class="icon icon-tab-close"</button><span>'); // 탭추가
    dynamicMenuWidth();
    $('.header-tab-set').scrollLeft(9999);
}

// 페이지 추가
function addPage(uri, html, id) {
    $(".web-content").hide();
    $(".web-tabs").append("<div class='web-content' value='" + html + "'><iframe src='" + uri + "' frameborder='0' class='ifr' id='iframe" + id + "'></iframe></div>");
}

// 페이지 변경
function changePage(html) {
    $(".web-content").hide();
    var content = $(".web-content");
    for(var item of content) {
        if($(item).attr('value') == html) {
            $(item).show();
            break;
        }
    }
}

// 페이지 삭제
function deletePage(html, isActive) {
    var content = $(".web-content");
    for(var item of content) {
        if($(item).attr('value') == html) {

			//닫는 page의 removeStompSubscriber를 불러온다. 필수요소 -> 삭제하지 않는다.
			let removeIframe = document.getElementById($(item).find("iframe").attr("id"));

			if(!sorin.validation.isEmpty(removeIframe)){
				let frameContent = removeIframe.contentWindow || removeIframe.contentDocument;

				if(typeof frameContent.removeStompSubscriber != "undefined"){
					frameContent.removeStompSubscriber();
				}
			}

            if(isActive){
                $(item).prev().length == 0 ? $(item).next().show() : $(item).prev().show();
            }

            $(item).remove();
            dynamicMenuWidth();
            return;
        }
    }
}

// 탭 닫기 (x 클릭)
$(document).on('click', ".icon-tab-close", function() {
    if($(this).parent().hasClass('is-active')) {
        if($(this).parent().prev().length == 0) {
            $(this).parent().next().addClass('is-active')
        }
        else {
            $(this).parent().prev().addClass('is-active')
        }
        $(this).parent().remove();
        deletePage($(this).prev().html(), true);
    }
    else {
        $(this).parent().remove();
        deletePage($(this).prev().html(), false);
    }
    dynamicMenuWidth();
    scrollPosition();
})

// 탭 닫기 (더블 클릭)
$(document).on('dblclick','.header-tab', function() {
    if($(this).hasClass('is-active')) {
        if($(this).prev().length == 0) {
            $(this).next().addClass('is-active')
        }
        else {
            $(this).prev().addClass('is-active')
        }
        deletePage($(this)[0].innerText, true);
        $(this).remove();
    }
    else {
        deletePage($(this)[0].innerText, false);
        $(this).remove();
    }
    dynamicMenuWidth();
    scrollPosition();
})

// 탭 이동
$(document).on('click', ".link-to-page", function() {
    $(".link-to-page").parent().removeClass('is-active');
    $(this).parent().addClass('is-active');
    changePage($(this).html());
    scrollPosition();
})

// 스크롤 위치조정
function scrollPosition() {
    var scrollTarget = 0;
    var tabs = $('.header-tab');
    for(var item of tabs) {
        if($(item).hasClass('is-active')) {
            break;
        }
        scrollTarget += item.getBoundingClientRect().width;
    }

    var leftEnd = $('.header-tab-set').scrollLeft();
    var rightEnd = $('.header-tab-set').scrollLeft() + $('.header-tab-set').width();
    if(scrollTarget < leftEnd) { // 탭이 현재시야의 좌측 외부에
        $('.header-tab-set').scrollLeft(scrollTarget);
    }

	//null 버그 수정
	if(!sorin.validation.isEmpty($('.header-tab.is-active')[0])) {
	    if(scrollTarget + $('.header-tab.is-active')[0].getBoundingClientRect().width > rightEnd) { // 탭이 현재시야의 우측 외부에
	        $('.header-tab-set').scrollLeft(scrollTarget - $('.header-tab-set')[0].getBoundingClientRect().width + $('.header-tab.is-active')[0].getBoundingClientRect().width);
	    }
	}
}

</script>