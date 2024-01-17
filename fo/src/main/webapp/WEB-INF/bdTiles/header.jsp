<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header" class="inwrap">
	<!-- logo :: START -->
	<h1 class="logo">
		<a href="/"> <span class="hidden">SORIN CORPORATION</span> <span
			class="mark">Online Tender System</span>
		</a>
	</h1>
	<!-- logo :: END -->
	<div class="util utility bid">
		<div class="util-list">
			<ul id="login-header">
				<li><a href="javascript:;"><p class="username topUserName" id="myInfo">서린상사님</p></a></li>
				<li><a href="javascript:;" class="mypage">My Page</a></li>
				<li><a class="fc-lgray header-logout bdLogout" href="javascript:;" id="btnLogout">Logout</a></li>
			</ul>
		</div>
	</div>
</header>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$("#btnLogout").click(function(){
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
});
</script>