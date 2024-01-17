<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <!-- <meta name="robots" content="ALL"> -->
    <meta name="title" content="서린상사">
    <link rel="shortcut icon" href="/guide/images/favicon.ico">
    <meta name="keywords" content="서린상사, 서린상사(주), 비철금속전문기업, 아연, 황산">
    <meta name="description" content="세계를 선도하는 종합비철무역상사 - 서린상사">
    <title>회원가입 STEP2 | SORIN e-Commerce</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />    
    <link rel="stylesheet" href="/guide/css/common.css">
    <link rel="stylesheet" href="/guide/css/sorin.css">
    <!-- script core :: START -->
    <script src="/guide/js/jquery-3.6.0.min.js"></script>
	<script src="/guide/js/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="/guide/js/select2/select2.min.js"></script>
    <!-- script core :: END -->
</head>
<body>
	<!-- wrapper :: START -->
	<div class="wrapper pt0">
	    <!-- container :: START -->
	    <div class="container">
	        <!-- 본문 -->
	        <div class="section us type2 bid">
	            <div class="inwrap">
	                <div class="hgroup">
	                    <div>
	                        <h2 class="h2">구매입찰 시스템 가입하기</h2>
	                    </div>
	                </div>
	
	                <!-- step 시작 -->
	                <div class="article step-area">
	                  <div class="step1 success">
	                      <span class="hidden">현재 페이지</span>
	                      <span class="step">1</span><span>약관동의</span>
	                  </div>
	                  <div class="step2 active">
	                      <span class="step">2</span><span>정보입력</span>
	                  </div>
	                  <div class="step3">
	                      <span class="step">3</span><span>가입승인</span>
	                  </div>
	              </div>
	              <!-- // step 끝 -->
					<div class="bid guide-txt">
						<p>구매입찰시스템 가입 후, 입찰 낙찰자의 경우<br>계약을 위한 추가 정보 입력을 요청할 수 있습니다.</p>
					</div>
					<div class="article mt60 box-agree-top">
	                    <div class="agree-title">
	                        <h3 class="signup-h3">회사 기본 정보입력</h3>
	                        <div class="form-chk">
	                            <input type="checkbox" id="frntnEntrpsAt">
	                            <label for="frntnEntrpsAt">외국 업체입니다.</label>
	                        </div>
	                    </div>
	                    <span class="icon-info-txt mb10">사업자등록증을 준비해주세요.</span>
	                </div>
	                <div class="article mt20 join-info-wrap">
	                    <div class="box-stroke no-box signup-box mb20">
	                        <div>
	                            <div class="tr">
	                                <label for="bidMberId">아이디</label>
	                                <span class="limit-width">
	                                    <input type="text" name="bidMberId" id="bidMberId" placeholder="아이디 (5~12자 이내의 영문 또는 영문+숫자 조합 )">
	                                </span>
	                                <span class="t-info" id="idMsg">아이디를 확인해주세요</span>
	                            </div> 
	                            <div class="tr">
	                                <label for="bidMberSecretNo">비밀번호</label>
	                                <span class="limit-width">
	                                    <input type="password" name="bidMberSecretNo" id="bidMberSecretNo" placeholder="비밀번호(영문 숫자 특수기호 조합 8~12자로 입력)">
	                                </span>
	                                <span class="t-info" id="pwMsg">영문자, 숫자, 특수문자 조합을 입력해야 합니다.</span>
	                            </div>
	                            <div class="tr">
	                                <label for="pwChk">비밀번호 확인</label>
	                                <span class="limit-width">
	                                    <input type="password" name="pwChk" id="pwChk" placeholder="비밀번호 확인">
	                                </span>
	                                <span class="t-info" id="pwChkMsg">암호를 확인해주세요.</span>
	                            </div>  
	                            <div class="tr">
	                                <label for="entrpsNm">회사 이름</label>
	                                <span class="limit-width">
	                                    <input type="text" name="entrpsNm" id="entrpsNm" placeholder="회사 이름 입력">
	                                </span>
	                            </div> 
	                              
	                            <!-- 23.10.12 | [참고] 상단 '외국 업체입니다.' 체크시: '회사 기본 정보입력 > 사업자등록번호 관련 영역' display: none 처리 {-->
	                            <div class="tr">
	                                <label for="bsnmRegistNo">사업자등록번호</label>
	                                <span class="limit-width">
	                                    <span class="limit-width">
	                                        <span class="input"><input type="tel" name="bsnmRegistNo" id="bsnmRegistNo" maxlength="12" placeholder="사업자등록번호 (000-00-00000)"></span>
	                                    </span>
	                                </span>
	                            </div>
	                            <div class="tr">
	                                <div class="file-upload">
	                                    <input type="text" class="upload-name" id="updFileNm" value="" placeholder="사업자등록증 첨부" disabled="disabled">
	                                    <span class="file-cancel"><img src="/guide/images/us/icon_file_cancel.png"></span>
										<span class="btn-up-file">
											<label for="updFile" class="">파일첨부</label>
											<input type="file" name="updFile" id="updFile" class="hidden-file" accept=".pdf, .jpg, .jpeg, .png">
										</span>
	                                </div>
	                            </div>	                            
	                            <div class="tr">
	                                <label for="bidMberEmail">이메일</label>
	                                <span class="limit-width">
	                                    <input type="text" name="bidMberEmail" id="bidMberEmail" placeholder="이메일">
	                                </span>
	                                <span class="t-info" id="emailMsg">이메일을 확인해주세요</span>
	                            </div>   
	                            <div class="tr">
	                                <label for="">휴대폰 번호</label>
	                               	<div class="input-complex">
									    <span class="limit-width">
		                                    <input type="text" name="moblphonNo2" id="moblphonNo2" maxlength="13" placeholder="휴대폰 번호">
		                                </span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>            
	                </div>
					<div class="article mt60 box-agree-top">
	                    <div class="agree-title">
	                        <h3 class="signup-h3">입찰 대리 정보</h3>
	                        <div class="form-chk">
	                            <input type="checkbox" id="agreeAll">
	                            <label for="agreeAll">위 정보와 동일 적용</label>
	                        </div>
	                    </div>
	                </div>
	                <div class="article mt5 join-info-wrap">
	                    <div class="box-stroke no-box signup-box mb20">
	                        <div>
								<div class="tr">
								    <label for="vrscEntrpsNm">회사 이름</label>
								    <span class="limit-width">
								        <input type="text" name="vrscEntrpsNm" id="vrscEntrpsNm" placeholder="회사 이름 입력">
								    </span>
								</div>    
								<div class="tr">
	                                <label for="vrscBsnmRegistNo">사업자등록번호</label>
	                                <span class="limit-width">
	                                    <span class="limit-width">
	                                        <span class="input"><input type="tel" name="vrscBsnmRegistNo" id="vrscBsnmRegistNo" maxlength="12" placeholder="사업자등록번호 (000-00-00000)"></span>
	                                    </span>
	                                </span>
	                            </div>
	                            <div class="tr">
	                                <div class="file-upload">
	                                    <input type="text" class="upload-name" value="" placeholder="사업자등록증 첨부" disabled="disabled">
	                                    <span class="file-cancel"><img src="/guide/images/us/icon_file_cancel.png"></span>
										<span class="btn-up-file">
											<label for="vrscUpdFile" class="">파일첨부</label>
											<input type="file" name="vrscUpdFile" id="vrscUpdFile" class="hidden-file" accept=".pdf, .jpg, .jpeg, .png">
										</span>
	                                </div>
	                            </div>  
	                            <div class="tr">
	                                <label for="vrscBidMberEmail">이메일</label>
	                                <span class="limit-width">
	                                    <input type="text" name=vrscBidMberEmail id="vrscBidMberEmail" placeholder="이메일">
	                                </span>
	                                <span class="t-info" id="vrscEmailMsg">이메일을 확인해주세요</span>
	                            </div>  
	                            <div class="tr">
	                                <label for=vrscMoblphonNo>휴대폰 번호</label>
	                               	<div class="input-complex">
									    <span class="limit-width">
		                                    <input type="text" name="vrscMoblphonNo" id="vrscMoblphonNo" maxlength="13" placeholder="휴대폰 번호">
		                                </span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>            
	                </div>                                               
	               	<div class="text-center">
						<p>입찰 관련 정보가 전달됩니다. 정확하게 입력해주세요.</p>	
					</div>
	                <div class="btn-wrap singup-btn-wrap mt40">
	                    <button type="button" class="btn-lgray-big" id="btnCancl" onclick="pageMove('/signup/signup');">이전</button>
	                    <button type="button" class="btn-blue-big" id="btnSubmit">가입승인 요청하기</button>
	                </div>
	            </div>            
	        </div>
	        <!--// 본문 -->
	    </div>
		<!-- container :: END -->
		
	</div>
    <!-- wrapper :: END -->
    
<script src="/guide/js/modernizr/2.8.3/modernizr.min.js"></script>
<script src="/guide/js/prefixfree/1.0.0/prefixfree.min.js"></script>
<!-- script custom -->
<script src="/guide/js/sorin.js"></script>
<!-- embedded -->
<script>
$(function() {
	//checkFlag
	var checkIdFlag = false;
	var checkPwFlag = false;
	var checkPwChkFlag = false;
	var frntnEntrpsAt = "N";
	var checkEmailFlag = false;
	
	$(".hidden-file").each(function(){
		$(this).on('change',function(){
			var fileName = $(this).val();
			console.log(fileName)
			$(this).parent().parents(".file-upload").find(".upload-name").val(fileName);
		});
	});

	// 외국 업체 체크
	$("#frntnEntrpsAt").change(function() {
        var isForeignCompany = $(this).prop('checked');
        if(isForeignCompany == true){
        	$("#bsnmRegistNo").val('');
        	$("#updFileNm").val('');
        	$("#bsnmRegistNo").attr("disabled",true); 
        	$("#updFile").attr("disabled",true); 
        	$("#bsnmRegistNo").prop("class","etr");
        	$("#updFileNm").prop("class","etr");
        }else {
        	$("#bsnmRegistNo").attr("disabled",false); 
        	$("#updFile").attr("disabled",false); 
        	$("#bsnmRegistNo").prop("class","");
        	$("#updFileNm").prop("class","upload-name");
        }
    });
	//아이디 확인
		//idMsg focus, hide
        $("#bidMberId").off().on("focus",function() {
            $("#idMsg").hide();
        });

     // 아이디 중복확인
        $("#bidMberId").on("focusout", function () {
            var bidMberId = $("#bidMberId").val();
            checkBidId(bidMberId);
        });

        // 아이디 정규식 체크 (영문, 영문 + 숫자 12자 이내)
        var checkBidId = (bidMberId) => {
            var regBidId = /^(?=.*[a-zA-Z])[a-zA-Z0-9]{5,12}$/;
            if (regBidId.test(bidMberId)) {
                $("#idMsg").hide();
                checkIdFlag = true; // 통과

                // Ajax로 중복 확인
                var id = $("#bidMberId").val();
                $.ajax({
                    url: './signup/ConfirmId',
                    data: {
                        id: id
                    },
                    type: 'POST',
                    dataType: 'json',
                    success: function (result) {
                        if (result == true) {
                            $("#idMsg").show();
                            $("#idMsg").text("사용 가능한 ID입니다.");
                        } else {
                            $("#bidMberId").val('');
                            $("#idMsg").show();
                            $("#idMsg").text("사용 불가능한 ID입니다.");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error("AJAX 오류: " + textStatus, errorThrown);
                    }
                });
            } else {
                $("#idMsg").show();
                $("#idMsg").text("아이디를 확인해주세요.");
                checkIdFlag = false; // 불가
            }
        };
        
	//암호확인
 		$("#bidMberSecretNo, #pwChk").off().on({
            //비밀번호 foucs 텍스트 hide
            focus: function() {
                if ($(this).attr("id") === "bidMberSecretNo") {
                    $("#pwMsg").hide();
                } else if ($(this).attr("id") === "pwChk") {
                    $("#pwChkMsg").hide();
                }
            },
            //비밀번호 validation 체크
            blur: function() {
                var pwRegexPattern = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,12}$/; // 영문+숫자+특수문자 8-12자
                var bidPw = $("#bidMberSecretNo").val();
                if (pwRegexPattern.test(bidPw)) {
                    $("#pwMsg").hide();
                    checkPwFlag = true;
                } else {
                    $("#pwMsg").show();
                    checkPwFlag = false;
                }
                var pwChk = $("#pwChk").val();
                if (bidPw === pwChk && pwChk !=="") {
                    $("#pwChkMsg").hide();
                    checkPwChkFlag = true;
                } else {
                    $("#pwChkMsg").show();
                    checkPwChkFlag = false;
                }
            },
            keyup: function(){
                if($(this).attr("id")==="bidMberSecretNo"){
                    var bidPw = $("#bidMberSecretNo").val();
                    var pwChk = $("#pwChk").val();
                    if (bidPw === pwChk && pwChk !=="") {
                        $("#pwChkMsg").hide();
                    } else {
                        $("#pwChkMsg").show();
                    }
                }
            }
        });
	//사업자등록번호
		$("#bsnmRegistNo, #vrscBsnmRegistNo").keyup(function(){
	        var value = this.value.replace(/\D/g, ''); // 숫자 이외의 문자 제거
	        if (value.length >= 4 && value.length <= 7) {
	            value = value.slice(0, 3) + '-' + value.slice(3);
	        } else if (value.length >= 8 && value.length <= 11) {
	            value = value.slice(0, 3) + '-' + value.slice(3, 5) + '-' + value.slice(5);
	        }
	        if (value.length > 12) {
	            value = value.slice(0, 12); // 최대 12자 제한
	        }
	        this.value = value;
	    });
	
	//이메일
		$("#bidMberEmail").off().on("focus",function() {
            $("#emailMsg").hide();
        });
		$("#bidMberEmail").on('blur', function() {
		    var email = $(this).val().trim();
		    
		    if (!email || !isValidEmail(email)) {
		        $("#emailMsg").show().text("이메일을 확인해주세요");
		        checkEmailFlag = false;
		    } else {
		        $("#emailMsg").hide();
		        checkEmailFlag = true;
		    }
		});
		$("#vrscBidMberEmail").on('blur', function() {
		    var email = $(this).val().trim();
		    
		    if (!email || !isValidEmail(email)) {
		        $("#vrscEmailMsg").show().text("이메일을 확인해주세요");
		        checkEmailFlag = false;
		    } else {
		        $("#vrscEmailMsg").hide();
		        checkEmailFlag = true;
		    }
		});
		
	//휴대폰번호
		$("#moblphonNo2, #vrscMoblphonNo").keyup(function(){
		    var value = this.value.replace(/\D/g, ''); // 숫자 이외의 문자 제거
		    if (value.length >= 4 && value.length <= 7) {
		        value = value.slice(0, 3) + '-' + value.slice(3);
		    } else if (value.length >= 8 && value.length <= 11) {
		        value = value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7);
		    }
		    if (value.length > 11) {
		        value = value.slice(0, 13); // 최대 11자 제한
		    }
		    this.value = value;
		});
	
	//위 정보와 동일 적용
    var isAgreeAll = false; 
    $("#agreeAll").change(function() {
    	if ($(this).is(":checked")) {
            $("#vrscEntrpsNm").val($("#entrpsNm").val());
            $("#vrscBsnmRegistNo").val($("#bsnmRegistNo").val());
            if(checkEmailFlag == true){
            	$("#vrscBidMberEmail").val($("#bidMberEmail").val());
            	$("#vrscEmailMsg").hide();
            }
            $("#vrscMoblphonNo").val($("#moblphonNo2").val());
            isAgreeAll = true; //체크 시작
        } else {
            $("#vrscEntrpsNm, #vrscBsnmRegistNo, #vrscBidMberEmail, #vrscMoblphonNo").val("");
            isAgreeAll = false; //체크 종료
        }
    });
    
  //가입승인요청
	$("#btnSubmit").click(function() {
	var frntnEntrpsAt = $("#frntnEntrpsAt").prop("checked") ? "Y" : "N";
		if(checkIdFlag == false){
			alert('아이디를 다시 입력해주세요');
			$("#bidMberId").focus();
			return false;
        }
		if(checkPwFlag == false){
        	alert('비밀번호를 다시 입력해주세요');
			$("#bidMberSecretNo").focus();
			return false;
        } 
		if(checkPwChkFlag == false){
        	alert('비밀번호 확인을 다시 입력해주세요');
			$("#pwChk").focus();
			return false;
        }
		if($("#entrpsNm").val() == null || $("#entrpsNm").val() == ''){
        	alert('회사이름을 입력해주세요');
			$("#entrpsNm").focus();
			return false;
        }
		if(frntnEntrpsAt == 'N'){	//외국기업이 아닐경우
			if($("#bsnmRegistNo").val() == null || $("#bsnmRegistNo").val() == ''){
	        	alert('사업자등록 번호를 다시 입력해주세요');
	    		$("#bsnmRegistNo").focus();
	    		return false;
	        }
			if(checkEmailFlag == false){
	            alert('이메일을 다시 입력해주세요');
	    		$("#bidMberEmail").focus();
	    		return false;
	        }
			if($("#moblphonNo2").val() == null || $("#moblphonNo2").val() == ''){
	            alert('휴대폰 번호를 다시 입력해주세요');
	    		$("#moblphonNo2").focus();
	    		return false;
	        }
		} else {	//외국기업일경우
			if($("#vrscEntrpsNm").val() == null || $("#vrscEntrpsNm").val() == ''){
	            alert('대리 회사이름을 입력해주세요');
	    		$("#vrscEntrpsNm").focus();
	    		return false;
	        }
			if($("#vrscBsnmRegistNo").val() == null || $("#vrscBsnmRegistNo").val() == ''){
	        	alert('대리 사업자등록 번호를 다시 입력해주세요');
	    		$("#vrscBsnmRegistNo").focus();
	    		return false;
	        }
			if($("#vrscBidMberEmail").val() == null || $("#vrscBidMberEmail").val() == ''){
	            alert('대리 이메일을 다시 입력해주세요');
	    		$("#vrscBidMberEmail").focus();
	    		return false;
	        }
			if($("#vrscMoblphonNo").val() == null || $("#vrscMoblphonNo").val() == ''){
	            alert('대리 휴대폰 번호를 다시 입력해주세요');
	    		$("#vrscMoblphonNo").focus();
	    		return false;
	        }
		}
		
       	//기본정보
    	if(checkIdFlag == true && checkEmailFlag == true && checkPwFlag == true){
    	    var bidMberId = $("#bidMberId").val();											//id
    	    var bidMberSecretNo = $("#bidMberSecretNo").val();								//pw
    	    var entrpsNm = $("#entrpsNm").val();											//회사명
    	    var bsnmRegistNo = $("#bsnmRegistNo").val().replace(/-/g, ''); 					//사업자번호
    	    var bidMberEmail = $("#bidMberEmail").val();									//이메일
    		var moblphonNo2 = $("#moblphonNo2").val().replace(/-/g, ''); 					//휴대폰번호
    		
    		var frntnEntrpsAt = frntnEntrpsAt;												//외국기업여부
    		
    		//대리정보
    	    var vrscEntrpsNm = $("#vrscEntrpsNm").val();									//대행 회사명
    	    var vrscBsnmRegistNo = $("#vrscBsnmRegistNo").val().replace(/-/g, '');			//대행사업자번호
    	    var vrscBidMberEmail = $("#vrscBidMberEmail").val();							//대행 이메일
    		var vrscMoblphonNo = $("#vrscMoblphonNo").val().replace(/-/g, ''); 				//대행 휴대폰번호
    		
    		var bidMberSttusCode = '03'														//입찰회원상태코드: 01정상 02차단 03승인대기
    		var bidConfmSttusCode = '01'													//입찰승인상태코드: 01요청 02거절 03승인정상	
    		var bidConfmDetailSttusCode = '01'												//입찰승인상세상태: 01가입 02변경
    	    
    	    var signupData = {
    	        "useStplatAgreAt": "${signupVO.useStplatAgreAt}",
    	        "indvdlInfoThreemanProvdAgreAt": "${signupVO.indvdlInfoThreemanProvdAgreAt}",
    	        "indvdlInfoProcessPolcyAgreAt": "${signupVO.indvdlInfoProcessPolcyAgreAt}",
    	        "mberChrctrRecptnAgreAt": "${signupVO.mberChrctrRecptnAgreAt}",
    	        "mberEmailRecptnAgreAt": "${signupVO.mberEmailRecptnAgreAt}",
    	        "mberPushRecptnAgreAt": "${signupVO.mberPushRecptnAgreAt}",
    	        
    	        "bidMberId": bidMberId,
    	        "bidMberSecretNo": bidMberSecretNo,
    	        "entrpsNm": entrpsNm,
    	        "bsnmRegistNo": bsnmRegistNo,
    	        "bidMberEmail": bidMberEmail,
    	        "moblphonNo2": moblphonNo2,
    	        
    	        "frntnEntrpsAt" : frntnEntrpsAt,
    	        
    	        "vrscEntrpsNm": vrscEntrpsNm,
    	        "vrscBsnmRegistNo": vrscBsnmRegistNo,
    	        "vrscBidMberEmail": vrscBidMberEmail,
    	        "vrscMoblphonNo": vrscMoblphonNo,
    	        
    	        "bidMberSttusCode": bidMberSttusCode,
    	        "bidConfmSttusCode": bidConfmSttusCode,
    	        "bidConfmDetailSttusCode": bidConfmDetailSttusCode,
    	    };
    		if (confirm('가입을 완료하시겠습니까?')) {
    			$.ajax({
        	        type: "POST",
        	        contentType: "application/json",
        	        url: "/signup/insertEntrps",
        	        data: JSON.stringify(signupData),
        	        success: function(data) {
    	    	        pageMove("/signup/signupCmp");
        	        },
        	        error: function(jqXHR, textStatus, errorThrown) {
        	            console.error("AJAX 오류: " + textStatus, errorThrown);
        	        }
        	    });
    		}
    	} else {
    		alertPopup('다시 입력해주세요', function () {
                return true;
            });
        }
	});
});
function isValidEmail(email) {
    // 이메일 정규식
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    // 이메일 정규식과 매칭되는지 확인
    return emailRegex.test(email);
}

</script>
</body>
</html>