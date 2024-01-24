<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header" class="inwrap">
	<!-- logo :: START -->
	<h1 class="logo">
		<a href="/"> 
		    <span class="hidden">SORIN CORPORATION</span>
    		<span class="mark">구매입찰 시스템</span>
		</a>
	</h1>
	<!-- logo :: END -->
	<div class="util utility bid">
		<div class="util-list">
            <c:if test="${member.entrpsNm != null}">
			<ul id="login-header">
				<li><a href="javascript:;"><p class="username topUserName" id="myInfo">${member.entrpsNm}님</p></a></li>
				<li><a href="javascript:;" class="mypage" onclick="moveMyPage()" >마이페이지</a></li>
				<li><a class="fc-lgray header-logout bdLogout" href="javascript:;" id="btnLogout" onclick="logout()">로그아웃</a></li>
			</ul>
            </c:if>
		</div>
	</div>
</header>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
    $.ajax({
        type: 'POST',
        url: '/loginCheck',
        success: function(response) {
            if (response.result === "success") {
                sessionStorage.setItem("bidEntrpsNo", response.member.bidEntrpsNo);
                sessionStorage.setItem("bidMberId", response.member.bidMberId);
                sessionStorage.setItem("entrpsNm", response.member.entrpsNm);
            }
        }
    });
});

function moveMyPage() {
    var params = {
		         "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
                 "bidSttusCode" : '13',
                 "tabNo" : '1'
		}
    pageMove( "/bdMypageLikeListAjax", JSON.stringify(params), 'application/json');
}

function logout() {
// 서버로 로그아웃을 요청하는 AJAX 요청
    $.ajax({
        type: 'POST',
        url: '/logout',  // 로그아웃을 처리하는 서버의 엔드포인트 주소
        success: function(response) {
            if (response.result === "success") {
            	sessionStorage.clear();
                // 성공적으로 로그아웃되었을 때 처리
                alert('로그아웃 되었습니다.');
                // 추가적인 로직이 필요하다면 여기에 작성
                location.href = "/";
            } else {
                // 로그아웃 실패 시 처리
                alert('로그아웃 실패');
            }
        },
        error: function(xhr, status, error) {
            console.log('로그아웃 요청이 실패했습니다.');
        }
    });
}

</script>