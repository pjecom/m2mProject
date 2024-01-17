<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.dashboard p {
    text-decoration: underline;
}
</style>
<!-- script core :: START -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/guide/js/select2/select2.min.js"></script>
<script type="text/javaScript">

</script>
<!-- main visual :: START -->
<div class="main-visual">
	<div class="inwrap">
		<!-- main visual > left :: START -->
		<div>
			<p class="banner_st">M2M Global's Member Exclusive</p>
			<h2 class="banner_tt">Online Tender System</h2>
			<p class="banner_ft">Explore the Wholesome Process from Bidding to Contracting at our Smart Platform.</p>
			<div class="btn_cont left">
				<a class="btn" href="javascript:;" onclick="pageMove('/bid/info');">Service Intro</a>
				<a class="btn" href="/Common/commonDownLoad?jobSeCode=op&amp;docFileRealCours=https://sorincorp.blob.core.windows.net/secs-pr-t/op/%5B구매입찰시스템%5D이용_메뉴얼_Ver1.1_231020_1698038980391.pptx">User Manual</a>
			</div>
		</div>
		<!-- main visual > left :: END -->
		<!-- main visual > right :: START -->
			<c:choose>                                                                                                                                                                 
                <c:when test="${member.entrpsNm != null}">
                    <div class="login_container log_on">
                        <a href="javascript:;"  class="btn_nav" onclick="moveMyPage()"><span class="bold">${member.entrpsNm}</span>님 입찰현황</a>
                        <div class="dashboard">
                                <div class="item mypage">
                                    <a href="javascript:;" onclick="pageMove('/bid/bddpr/selectBddprList');" >
                                        <h4>투찰건</h4>
                                        <p class="bid bddprCnt">00</p>						   	 	
                                    </a>
                                </div>
                                <div class="item mypage">
                                    <a href="javascript:;" onclick="pageMove('/bid/bddpr/selectBddprList?tab=2');" > 
                                        <h4>낙찰건</h4>
                                        <p class="lose defeatCnt">00</p>
                                </a> 	
                                </div>		
                                <div class="item mypage">
                                    <a href="javascript:;" onclick="pageMove('/bid/bddpr/selectBddprList?tab=3');" >						   	 
                                        <h4>패찰건</h4>
                                        <p class="lose defeatCnt">00</p>
                                </a> 								   	 	
                                </div>		
                                <div class="item">
                                    <a href="javascript:;" onclick="pageMove('/bid/intrst/selectIntrstPblanc');">
                                        <h4>관심건</h4>
                                        <p id="intrstBidCnt" class="keep intrstBidCnt">00</p>
                                    </a> 								   	 	
                                </div>							   	 						   	 					   	 
                        </div>
                    </div>	
                </c:when>
                <c:otherwise>
                <div class="login_container" id="formId1">
                    <p>Welcome to Sorin.com</p>
                    <input type="text" title="아이디" placeholder="Enter your ID" id="id" name="id" class="validate[required]" desc="아이디">
                    <input type="password" title="비밀번호" placeholder="Enter your password" id="password" name="password" class="validate[required]" desc="비밀번호">
                    <button type="button" class="btn primary_bg">Login</button>
                    <div class="sub_area">
                        <div class="checkbox-container" >
                            <label class="checkbox-label" for="save_id">
                                <input type="checkbox" name="save_id" id="save_id">
                                <span class="checkbox-custom rectangular"></span>
                            </label>
                            <div class="input-title">Remember ID</div>
                        </div>
                        <div>
                            <a href="javascript:;" onclick="pageMove('/bid/id');">Find ID</a>
                            <a href="javascript:;" onclick="pageMove('/bid/pw');">Find PW</a>
                        </div>
                    </div>
                    <!--                               <hr> -->
                    <a href="javascript:;" onclick="pageMove('/signup/signup');" class="btn text ico">
                        <span class="material-symbols-outlined">person</span>
                        <span>Become a member</span>
                    </a>
                </div>
                </c:otherwise>
            </c:choose>
    </div>
</div>
<!-- main visual :: END -->

<!-- section #1 구매입찰 공고 LIST :: START -->
<div class="section prod-list-wrap bid">
	<div class="inwrap">
		<!-- ITEM TITLE :: START  -->
		<h2 class="h2-new">알루미늄</h2>
		<!-- ITEM TITLE :: END  -->
		<!-- FILTER AREA :: START -->
        <form name="searchFrm">
		<div class="filter_area">
			<div class="opt">
				<label for="">Search Keyword</label> <select id="filter" name="filter" onchange="selectBdMainInfoList(-1);"
					class="filter">
					<option value="01">공고일</option>
					<option value="02">마감일</option>
				</select>
			</div>
			<div class="cal" onchange="selectBdMainInfoList(-1);">
				<div class="datepicker-wrap">
					<input type="text"
						class="datepicker from center validate[required,custom[date]]"
						id="searchDateFrom" desc="날짜" placeholder="시작 일자"
						style="font-size: 1.4rem !important;" readonly>
				</div>
				<div class="tilde">~</div>
				<div class="datepicker-wrap">
					<input type="text"
						class="datepicker to center validate[required,custom[date]]"
						id="searchDateTo" desc="날짜" placeholder="종료 일자"
						style="font-size: 1.4rem !important;" readonly>
				</div>
			</div>
            <div class="input-button-wrap btn-period">
                <label class="radio-btn active" id="all">
                    <input type="radio" name="bdPeriod" value="0"><span>전체</span>
                </label>
                <label class="radio-btn" id="oneMonth">
                    <input type="radio" name="bdPeriod" value="1" ><span>1개월</span>
                </label>
                <label class="radio-btn" id="threeMonth">
                    <input type="radio" name="bdPeriod" value="3" ><span>3개월</span>
                </label>
                <label class="radio-btn" id="sixMonth">
                    <input type="radio" name="bdPeriod" value="6"><span>6개월</span>
                </label>
            </div>
		</div>
        </form>
		<!-- main visual > right :: END -->
		<!-- FILTER AREA :: END -->
		<!-- TAB BUTTON :: START :: todo: 탭기능 example 추가 -->
		<ul class="tab_btn_group">
			<li class="item on" data-tab="tab-1" value="" onclick="selectBdMainInfoList();">
				<a href="javascript:;">전체 (<span class="totalCnt">${bdListCnt.totalCnt}</span>) </a>
			</li>
			<li class="item" data-tab="tab-2" value="12" onclick="selectBdMainInfoList(12);">
				<a href="javascript:;">입찰예정 (<span id="expectCnt">${bdListCnt.expectCnt}</span>)</a>
			</li>
			<li class="item" data-tab="tab-3"  value="13"  onclick="selectBdMainInfoList(13);">
				<a href="javascript:;">투찰중 (<span id="bidingCnt">${bdListCnt.bidingCnt}</span>)</a>
			</li>
			<li class="item" data-tab="tab-5" value="30"  onclick="selectBdMainInfoList(30,31,23,24);">
				<a href="javascript:;">마감 (<span id="endCnt">${bdListCnt.endCnt}</span>) </a>
			</li>
		</ul>
		<!-- TAB BUTTON :: END -->
		<div id="tab-1" class="tab-content on">
			<div class="tit_cont">
				<h2 class="h3-new" id="selectTotalCnt">
					Total (<span class="totalCnt"></span>)
				</h2>
				<div class="opt_group">
					<div class="opt_item">
						<label for="">브랜드</label> <select name="brand" id="brand" onchange="selectBdMainInfoList(-1);"
							class="brand">
							<option value="00">브랜드(전체)</option>
							<option value="01">서구산</option>
							<option value="02">비서구산</option>
						</select>
					</div>
					<div class="opt_item">
						<label for="">권역</label> <select name="area" id="area" onchange="selectBdMainInfoList(-1);"
							class="area">
							<option value="00">권역(전체)</option>
							<option value="01">인천</option>
							<option value="02">부산</option>
						</select>
					</div>
				</div>
			</div>
			<ul class="list t2" id="BdList">
                <c:if test="${empty bdList}">
                    <span>데이터가 존재하지 않습니다.</span>
                </c:if>
                <c:forEach items="${bdList}" var="vo">
                <!-- [case1] 입찰예정 -->
                <li>
                    <div class="cart-item-wrap type4">
                        <figure class="figure figure1">
                            <img src="/images/my/al_sum.jpg" alt="알루미늄" class="w">
                        </figure>
                        <div class="figure-con">
                            <div class="pd-brand-info">
                                <h3 class="pd-bid-no">${vo.bidPblancId}</h3>
                                <div class="pd-wrap">
                                    <div class="pd-brand">
                                        <div class="pd-label">${vo.metalCodeNma}</div>
                                        <div class="brand-nation">
                                            <c:if test="${empty vo.nationCode}">
                                                <img src="https://sorincorp.blob.core.windows.net/secs/odflag/flag_mcht_default.png">
                                            </c:if>
                                            <c:if test="${not empty vo.nationCode}">
                                                <img src="${vo.nationUrl}">
                                            </c:if>
                                        </div>
                                        <c:if test="${empty vo.brandCode}">
                                            브랜드 무관
                                        </c:if>
                                        <c:if test="${not empty vo.brandCode}">
                                            ${vo.brandCode}
                                        </c:if>
                                    </div>
                                    <div class="pd-like">
                                        <ul class="company">
                                            <li>
                                                <span>참여기업</span>
                                                <span>${vo.partcptnEntrpsQy}</span>
                                            </li>
                                            <li>
                                                <span>관심기업</span>
                                                <span>${vo.intrstEntrpsQy}</span>
                                            </li>
                                        </ul>
                                        <a href="#" class="ico like active">
                                            <span class="material-symbols-outlined">favorite</span>
                                            <span>관심추가</span>
                                        </a>
                                    </div>
                                </div>

                                <div class="pd-name">
                                    <span class="item">${vo.brandNm}</span>
                                    <span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
                                    <span class="brand-group">${vo.brandGroupCodeNm}</span>
                                </div>
                                <div class="pd-period">
                                    <span class="qty">수량 ${vo.totalCnt} <span class="highlight">100MT</span></span>	
                                    <span class="date">투찰기간 <span class="highlight">${vo.bddprBeginDt} ~ ${vo.bddprEndDt}</span></span> 
                                    <c:if test="${vo.bidSttusCode != 30}">
                                        <span class="t-info">개찰결과 : 투찰 기한 마감과 동시에 발표함</span>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="btns moveList" id="moveList" value="${vo.bidPblancId}">
                            <c:choose>
                                <c:when test="${vo.bidSttusCode == 13}">
                                    <div class="btn-bid-blue">투찰중</div>
                                    <span class="bid-d-day pre abs-info"> 
                                        투찰 마감까지 <span class="time" id=time${vo.bidPblancId}></span>
                                    </span>
                                </c:when>
                                <c:when test="${vo.bidSttusCode == 30}">
                                    <div class="btn-bid-black">마감</div>
                                    <span class="t-info abs-info">개찰완료</span>
                                </c:when>
                                <c:otherwise>
                                    <div class="btn-bid-stroke">입찰예정</div>
                                    <span class="bid-d-day abs-info"> 
                                        투찰 시작까지  <span class="time">- 3일 3시간 20분 36초</span>
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </li>
            </c:forEach>
			</ul>
		</div>
	</div>
</div>
<!-- section #1 구매입찰 공고 LIST :: END -->


<!-- 공지사항 & FAQ :: START -->

<script> 
$(function() {

    // =============== DATEPICKER ==================
	$("#searchDateFrom").datepicker({
		dateFormat: 'yy-mm-dd' //달력 날짜 형태
		,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
		,changeYear: true //option값 년 선택 가능
		,changeMonth: true //option값  월 선택 가능
		,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
		,buttonImage: "/images/calendar.png" //버튼 이미지 경로
		,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
		,buttonText: "선택" //버튼 호버 텍스트
		,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
		,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
		,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
		,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
		,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
		,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
	});
	
	$("#searchDateTo").datepicker({
		dateFormat: 'yy-mm-dd' //달력 날짜 형태
		,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
		,changeYear: true //option값 년 선택 가능
		,changeMonth: true //option값  월 선택 가능
		,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
		,buttonImage: "/images/calendar.png" //버튼 이미지 경로
		,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
		,buttonText: "선택" //버튼 호버 텍스트
		,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
		,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
		,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
		,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
		,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
		,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
	});

	selectBdMainInfoList();
	
	
});

function moveMyPage() {
    var params = {
		         "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
                 "bidSttusCode" : '13'
		}
    pageMove( "/bdMypage", JSON.stringify(params), 'application/json');
}

function dateviewfmt(date){
	return date.substring(2,4) + '.' +date.substring(4,6)+ '.' +date.substring(6,8)+ ' ' +date.substring(8,10)+ ':' +date.substring(10,12)+ ':' +date.substring(12,14);
}

//날짜 format
function datefmt(date){
	return date.substring(0,4) + '.' +date.substring(4,6)+ '.' +date.substring(6,8)+ ' ' +date.substring(8,10)+ ':' +date.substring(10,12)+ ':' +date.substring(12,14);
}

function fmtDate(startDate,endDate,id,bidStatusCode){
	//초기 설정 
	setTimeout(function(){$("#"+id).html(" ");} , 0);
	
	setInterval(function(){
		//현재시간
		var nowDate = new Date();
		
		//입찰 공고 시작일
		startFmtDate = new Date(datefmt(startDate));
		//입찰 공고 마감일
		endFmtDate = new Date(datefmt(endDate));
		
		if(bidStatusCode =="12" && startFmtDate >= nowDate){
			$("#"+id).html(" - " + Math.floor((startFmtDate-nowDate)/(1000*24*60*60)) 
					+"일 "+Math.floor(((startFmtDate-nowDate)% (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
					+"시 "+Math.floor(((startFmtDate-nowDate) % (1000 * 60 * 60)) / (1000 * 60))
					+"분 "+Math.floor(((startFmtDate-nowDate) % (1000 *60)) / 1000) + "초");
		}else if(bidStatusCode =="13" && endFmtDate >= nowDate){
			$("#"+id).html(" - " + Math.floor((endFmtDate-nowDate)/(1000*24*60*60)) 
					+"일 "+Math.floor(((endFmtDate-nowDate)% (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
					+"시 "+Math.floor(((endFmtDate-nowDate) % (1000 * 60 * 60)) / (1000 * 60))
					+"분 "+Math.floor(((endFmtDate-nowDate) % (1000 *60)) / 1000) + "초");
		}
		else{
			$("#"+id).html("");    
		}
	},1000); //1초마다 
}
	
function selectBdMainInfoList(bidSttusCode) {
var params = {
			"bidSttusCode" : bidSttusCode,
			"filter" : $('#filter').val(),
			"brand" : $('#brand').val(),
			"area" : $('#area').val(),
			"searchDateFrom" : $('#searchDateFrom').val().replaceAll("-", ""),
			"searchDateTo" : $('#searchDateTo').val().replaceAll("-", ""),
			"bidEntrpsNo" : ""
		}

		postSetDataType( "/selectBdMainInfoAjaxList", JSON.stringify(params), "", true, function(result) {
			$('.totalCnt').html(result.totalCnt);
			$('#bidingCnt').html(result.bidingCnt);
			$('#expectCnt').html(result.expectCnt);
			$('#endCnt').html(result.endCnt);
	
			$("#BdList").empty();
			var html = '';
			for (let i = 0; i < result.mainBdList.length; i++) {
				html += '		<li>';
				if (result.mainBdList[i].bidSttusCode == "31" || result.mainBdList[i].bidSttusCode == "22" || result.mainBdList[i].bidSttusCode == "23" || result.mainBdList[i].bidSttusCode == "32" ) {
					html += '			<div class="cart-item-wrap type4 finish">';
				}else{
					html += '			<div class="cart-item-wrap type4">';
				}
				html += '				<figure class="figure figure1">';
				html += '					<img src="/images/my/al_sum.jpg" alt="알루미늄" class="w">';
				html += '				</figure>';
				html += '				<div class="figure-con">';
				html += '					<div class="pd-brand-info">';
				html += '	    				<h3 class="pd-bid-no">' + result.mainBdList[i].bidPblancId + '</h3>';
				html += '	    				<div class="pd-wrap">';
				html += '	        				<div class="pd-brand">';
				html += '	             				<div class="pd-label">' + result.mainBdList[i].metalCodeNma + '</div>';
				html += '	            				<div class="brand-nation">';
				html += '									<img src="'+result.mainBdList[i].nationUrl+'" alt="">';
				html += '	            				</div>';
				html += '	        					' + result.mainBdList[i].brandCode + '';
				html += '	    					</div>';
				html += '	    					<div class="pd-like">';
				html += '	            				<ul class="company">';
				html += '	             	   				<li> <span>' + result.mainBdList[i].partcptnEntrpsQy + '</span><span>참여기업</span></li>';
				html += '	                				<li> <span><span id="intrstEntrpsQy">' + result.mainBdList[i].intrstEntrpsQy + '</span><span>관심기업</span></li>';
				html += '	            				</ul>';
			
					html += '<a href="javascript:void(0);" class="ico like" data-bid-pblanc-id="' + result.mainBdList[i].bidPblancId + '"> ';
					html += '	<span class="material-symbols-outlined">favorite</span> <span>관심추가</span>';
					html += '</a>';
				html += '	    					</div>';
				html += '						</div>';
				
				html += '						<div class="pd-name" style="pointer-events : none;">';
				html += '	    					<span class="item">' + result.mainBdList[i].brandNm + '</span> ';
				html += '	     					<span class="wrhous">출고권역 - ' + result.mainBdList[i].dstrctLclsfCode + '</span>';
				html += '	    					<span class="brand-group">' + result.mainBdList[i].brandGroupCodeNm + '</span>';
				html += '	 					</div>';
				html += '	 					<div class="pd-period">';
				html += '	    					<span class="qty">수량 <span class="highlight">' + result.mainBdList[i].bidWt+ 'MT</span></span>';
				html += '	     					<span class="date">투찰기간<span class="highlight">';
				html += '	    						 ' + dateviewfmt(result.mainBdList[i].bddprBeginDt); + '';
				html += '								~';
				html += '								 ' + dateviewfmt(result.mainBdList[i].bddprEndDt) + '';
				html += '							</span></span>';
				if (result.mainBdList[i].bidSttusCode == "12" || result.mainBdList[i].bidSttusCode == "13" ) {
				html += '							<span class="t-info">개찰결과 : 투찰 기한 마감과 동시에 발표함</span>';
				}
				html += '						</div>';
				html += '					</div>';
				html += '				</div>';
				if (result.mainBdList[i].bidSttusCode == "12") {
				html += '				<div class="btns">';
					html += '				<a href="javascript:;"  name="selectBid" id ="'+result.mainBdList[i].bidPblancId+'"  class="btn-bid-stroke">입찰예정</a>';
					html += '			</div>';
					html += '	    	<span class="bid-d-day abs-info">투찰시작까지<span class="time" id=time'+result.mainBdList[i].bidPblancId+'>'+fmtDate(result.mainBdList[i].bddprBeginDt, result.mainBdList[i].bddprEndDt, "time"+result.mainBdList[i].bidPblancId, result.mainBdList[i].bidSttusCode);+'</span>';
					html += '			</span>';
				} else if (result.mainBdList[i].bidSttusCode == "13") {
				html += '				<div class="btns">';
					html += '				<a href="javascript:;" name="selectBid" id ="'+result.mainBdList[i].bidPblancId+'"  class="btn-blue-blue">투찰중</a>';
					html += '			</div>';
					html += '			<span class="bid-d-day pre abs-info">투찰마감까지<span class="time" style="color: #1D5FD0;" id=time'+result.mainBdList[i].bidPblancId+'>'+fmtDate(result.mainBdList[i].bddprBeginDt, result.mainBdList[i].bddprEndDt, "time"+result.mainBdList[i].bidPblancId, result.mainBdList[i].bidSttusCode);+'</span>';
					html += '			</span>';
				} else if (result.mainBdList[i].bidSttusCode == "31" || result.mainBdList[i].bidSttusCode == "22" || result.mainBdList[i].bidSttusCode == "23" || result.mainBdList[i].bidSttusCode == "32" ) {
				html += '				<div class="btns">';
					html += '				<a href="javascript:;" name="selectBid" id ="'+result.mainBdList[i].bidPblancId+'"  class="btn-bid-black">마감</a>';
					html += '			</div>';
					if(result.mainBdList[i].bidSttusCode == "32"){
						html += '		<span class="t-info abs-info">Aborted</span>';
					}else{
						html += '		<span class="t-info abs-info">Offers Opened</span>';
					}
				} else if (result.mainBdList[i].bidSttusCode == "21") {
	                html += '               <div class="btns">';
	                    html += '               <a href="javascript:alert(\'Opening of Offers.\');" id ="'+result.mainBdList[i].bidPblancId+'"  class="btn-blue-blue">Opening Offers</a>';
	                    html += '           </div>';
	                    html += '      <span class="t-info abs-info">Bid Closed</span>';
	                   // html += '           <span class="bid-d-day pre abs-info"> 투찰 마감까지<sapn class="time" style="color: #1D5FD0;" id=time'+result.mainBdList[i].bidPblancId+'>'+fmtDate(result.mainBdList[i].bddprBeginDt, result.mainBdList[i].bddprEndDt, "time"+result.mainBdList[i].bidPblancId, result.mainBdList[i].bidSttusCode);+'</span>';
	                    html += '           </span>';
	                }
				html += '			</div>';
				html += '		</li>';
	
		}
		$("#BdList").append(html);
		if(result.mainBdList.length==0){
			$("#BdList").append( '</div>'
											+'<div class="no-data empty-content">Could not find any matches.</div>'
										+'</div>');
			
		}
		$(".ico.like").click(intrstBtnClickHandler);
		
		//클릭된 공고 별 숫자가져오기		
		$("#selectTotalCnt").empty();
		$('#selectTotalCnt').append($('li[class^="item on"]')[0].children[0].innerHTML);
	});
        
    }
    $(document).on( 'click', "a[name='selectBid']", function(event) {
        var params = {
            "bidPblancId" : this.id,
            "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo")
        }
        pageMove( "/detail/bdDetail", JSON.stringify(params), 'application/json');
    });

    $(".btn-period > .radio-btn").click(function() {
            $('.btn-period > .radio-btn').removeClass('active');
            $(this).addClass('active');

            switch($(this).attr('id')) {
                case 'all':
                    $("#searchDateFrom").datepicker("setDate", '');
                    $("#searchDateTo").datepicker("setDate", '');
                    break;
                case 'oneMonth':
                	getFormerDate(30,0);
                    break;
                case 'threeMonth':
                    getFormerDate(90,0);
                    break;
                case 'sixMonth':
                    getFormerDate(180,0);
                    break;
            }
        });

    function getFormerDate(num1, num2) {
        var today = new Date();
        
        var searchDateFromDate = new Date(today.getFullYear(), today.getMonth(), today.getDate() - num1);
        var searchDateToDate = new Date(today.getFullYear(), today.getMonth(), today.getDate() - num2);
	
        $("#searchDateFrom").datepicker("setDate", searchDateFromDate);
        $("#searchDateTo").datepicker("setDate", searchDateToDate);
    }

    $(".item").click(function(){
        var bdPeriod = $(this).attr('value');
        //$(".item").val();
        $(".item").removeClass("on");
        $(this).addClass("on");
        console.log("입찰상태"+bdPeriod);
    });
    
//------------------------------------- 공지사항 최근 게시글 제목 4개 조회-------------------------------------//
/* 로그인 버튼 클릭 메서드 */
    $(function() {

    });    
    $(".primary_bg").click(function(){
        var userId = $("#id").val(); // 아이디 입력란의 값을 가져옴
        var userPassword = $("#password").val(); // 비밀번호 입력란의 값을 가져옴

        // 서버로 데이터를 전송하는 AJAX 요청
        $.ajax({
            type: 'POST',
            url: '/login',
            data: { 
                bidMberId: userId,
                bidMberSecretNo: userPassword
            },
            success: function(response) {
                if (response.result === "success") {
                    sessionStorage.setItem("bidEntrpsNo", response.member.bidEntrpsNo);
                    sessionStorage.setItem("bidMberId", response.member.bidMberId);
                    sessionStorage.setItem("entrpsNm", response.member.entrpsNm);
                    location.href = "/";
                } else if (response.result === "blocked") {
                	alert('투찰 취소 3회 초과로 로그인이 차단되었습니다.\n고객센터로 문의해주세요');
                } else if (response.result === "pending") {
                	alert('관리자 승인 대기상태입니다.\n승인 후 로그인 가능합니다.');
                } else if(response.result === "failed"){
                	alert('계정 정보를 확인해주세요');
                }
            },
            error: function(xhr, status, error) {
                console.log('로그인 요청이 실패했습니다.');
            }
        });
    });
    
</script>

<!-- 공지사항 & FAQ :: START -->
<div class="section notice-wrap type2 bid">
    <div class="inwrap">
        <!-- 공지사항 :: START -->
        <div class="notice-area type2">
            <div class="tit">
                <h5>Notices</h5>
                <div>
                    <a class="more" name="scftab02">More</a>
                </div>
            </div>
            <ul class="cont">
                <!-- 공지사항 제목 넣기 -->
            </ul>
        </div>
        <!-- 공지사항 :: END -->
        <!-- FAQ :: START -->
        <div class="faq">
            <div class="tit">
                <h5>Frequently Asked Questions</h5>
                <div>
                    <a class="more" name="scftab01">More</a>
                </div>
            </div>
            <ul class="cont">
                <!-- faq 제목 넣기 -->
            </ul>
        </div>
        <!-- FAQ :: END -->
    </div>
</div>
<!-- 공지사항 & FAQ :: END -->

<!-- 서비스 소개 :: START -->
<div class="section services-wrap type2">
    <div class="inwrap">
        <div class="intro">
            <a href="javascript:;" onclick="pageMove('/bid/info');" class="wrap">
                <div class="cont">
                    <h5>Service Introduction</h5>
                    <p>We present you our smart e-Bidding system.</p>
                </div>
                <div class="arrow next"></div>
            </a> <a href="/Common/commonDownLoad?jobSeCode=op&amp;docFileRealCours=https://sorincorp.blob.core.windows.net/secs-pr-t/op/%5B구매입찰시스템%5D이용_메뉴얼_Ver1.1_231020_1698038980391.pptx" class="wrap">
                <div class="cont">
                    <h5>User Manual</h5>
                    <p>Learn how to partake in bidding.</p>
                </div>
                <div class="arrow next"></div>
            </a>
        </div>
        <div class="estimate">
            <div class="services-con">
                <h2 class="h2">Inquiries & Customer Service</h2>
                <p class="cs-number">
                    <span>02</span><span>6952</span><span>5095</span>
                </p>
                <p class="cs-email">
                    <a href="mailto:webmasters@metalsorin.com">webmasters@metalsorin.com</a>
                </p>
                <p class="cs-p">
                    Mon - Fri : 09:00~17:00<br> Lunch Break : 12:30~13:30
                </p>
            </div>
        </div>
    </div>
</div>
<!-- 서비스 소개 :: END -->
