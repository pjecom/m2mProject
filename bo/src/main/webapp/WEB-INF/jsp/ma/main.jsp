<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script type="text/javaScript">

	</script>
<div class="web-wrapper web-login">
		<div id="formContent" class="login-wrap">
			<!-- Logo -->
			<div class="logo">
				<img src="/images/login-logo.png" alt="sorin" />
			</div>
		
			<!-- Login Form -->
			<form class="login-form" id="loginForm">
				<input type="text" class="input" name="id" id="id" placeholder="아이디(트레이딩과 동일)">
				<input type="password" class="input" id="password" name="password" placeholder="비밀번호" onkeyup="enterkey()">
				<div class="form-checkbox">
					<input type="checkbox" id="idSave" name="idSave" />
					<label for="idSave"><span>아이디 저장</span></label>
				</div>
				<input type="button" class="btn btn-login" value="로그인" onClick="getToken();">
			</form>
		
			<!-- Remind Passowrd -->
			<p class="copyright">Copyright(c) SORIN CORPORATION., All rights reserved.</p>
		</div>
	</div>
</body>
<