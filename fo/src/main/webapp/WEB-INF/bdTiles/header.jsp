<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header" class="inwrap">
	<!-- logo :: START -->
	<h1 class="logo">
		<a href="/bid"> <span class="hidden">SORIN CORPORATION</span> <span
			class="mark">Online Tender System</span>
		</a>
	</h1>
	<!-- logo :: END -->
	<div class="util utility bid">
		<div class="util-list">
			<ul id="login-header">
				<li><a href="javascript:;"><p class="username topUserName" id="myInfo">서린상사님</p></a></li>
				<li><a href="javascript:;" class="mypage">My Page</a></li>
				<li><a class="fc-lgray header-logout bdLogout" href="javascript:;">Logout</a></li>
			</ul>
		</div>
	</div>
</header>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$('#login-header').hide();
var sorinBdAccount = sorin.bdAccount.getBdUserInfo();

	$(function() {
		switchHeaderType(); // 회원 유형, 권한 별 헤더


	});

	function switchHeaderType() {
		if (sorinBdAccount != '') {
			//$('#logout-header').hide();
			$('.username').html(sorinBdAccount.entrpsNm);
			$('#login-header').show();
		} else {
			$('#login-header').hide();
			//$('#logout-header').show();
		}
	}

	$(".bdLogout").click(function() {
		sorin.ajax.getSetDataType("/bid/bdLogin/bdLogout", "", "", true, function() {
			location.href="/bid";
		});
	});

	/* $("#logout-header .util-member").click(function() {
		pageMove('/account/login', '', '', '-1');
	}); */

	$(".mypage").click(function() {
		pageMove('/bid/bddpr/selectBddprList', '', '', '-1');
	});

	$("#myInfo").click(function() {
		pageMove('/bid/myPage/selectBdMyInfoMng', '', '', '-1');
	});
					
</script>