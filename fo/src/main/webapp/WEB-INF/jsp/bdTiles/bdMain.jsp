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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		<div
			class="login_container <c:if test='${bdLoginStatusMap.loginYn == "Y"}'>log_on</c:if>"
			id="formId1">
			<%--$("#mypage").click(function() {

			});--%>
            
			<c:choose>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                <c:when test="${bdLoginStatusMap.loginYn =='Y'}">
                    <a href="javascript:;"  onclick="pageMove('/bid/bddpr/selectBddprList');">
                        <span class="bold userName">서린상사</span>'s Bid Status
                    </a>
                    <div class="dashboard">
                        <div class="item mypage" >
                            <a href="javascript:;" onclick="pageMove('/bid/bddpr/selectBddprList');" >
                                <h4>Bidding</h4>
                                <p class="bid bddprCnt">00</p>
                            </a>
                        </div>
                        <div class="item mypage">
                            <a href="javascript:;" onclick="pageMove('/bid/bddpr/selectBddprList?tab=2');" >
                                <h4>Approved</h4>
                                <p class="win scsbidCnt">00</p>
                            </a>
                        </div>
                        <div class="item mypage">
                            <a href="javascript:;" onclick="pageMove('/bid/bddpr/selectBddprList?tab=3');" >
                                <h4>Rejected</h4>
                                <p class="lose defeatCnt">00</p>
                            </a>
                        </div>
                        <div class="item">
                            <a href="javascript:;" onclick="pageMove('/bid/intrst/selectIntrstPblanc');">
                                <h4>Favorites</h4>
                                <p id="intrstBidCnt" class="keep intrstBidCnt">00</p>
                            </a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <p>Welcome to Sorin.com</p>
                    <input type="text" title="아이디" placeholder="Enter your ID" id="id" name="id" class="validate[required]" desc="아이디" onkeyup="enterkey(this)">
                    <input type="password" title="비밀번호" placeholder="Enter your password" id="password" name="password" class="validate[required]" desc="비밀번호" onkeyup="enterkey(this)">
                    <button type="button" class="btn primary_bg" onclick="authNumValidation()">Login</button>
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
                    <a href="javascript:;" onclick="pageMove('bid/bidEtr');" class="btn text ico">
                        <span class="material-symbols-outlined">person</span>
                        <span>Become a member</span>
                    </a>
                </c:otherwise>
            </c:choose>
		</div>
	</div>
</div>
<!-- main visual :: END -->
<script>

    //{"bidSttusCode": 12};
    function selectBdMainInfoList(data) {
        var param = {
            "bidSttusCode" :"param"
        }
        $.ajax({
            url: "/selectBdMainInfoList",
            type: "post",
            data: JSON.stringify(param),
            dataType : "json",
            contentType: "application/json",
            success: function(data) {
                alert(data);
            },
            error: function(errorThrown) {
                alert(errorThrown.statusText);
            }
        });
    }
</script>
<!-- section #1 구매입찰 공고 LIST :: START -->
<div class="section prod-list-wrap bid">
	<div class="inwrap">
		<!-- ITEM TITLE :: START  -->
		<h2 class="h2-new">일단이게메인?</h2>
		<!-- ITEM TITLE :: END  -->
		<!-- FILTER AREA :: START -->
		<div class="filter_area">
			<div class="opt">
				<label for="">Search Keyword</label> <select id="filter" name="filter" onchange="selectBdMainInfoList(-1);"
					class="filter">
					<option value="01">Post Date</option>
					<option value="02">Close Date</option>
				</select>
			</div>
			<div class="cal">
				<div class="datepicker-wrap">
					<input type="text"
						class="datepicker from center validate[required,custom[date]]"
						id="searchDateFrom" desc="날짜" placeholder="From"
						style="font-size: 1.4rem !important;" readonly>
				</div>
				<div class="tilde">~</div>
				<div class="datepicker-wrap">
					<input type="text"
						class="datepicker to center validate[required,custom[date]]"
						id="searchDateTo" desc="날짜" placeholder="To"
						style="font-size: 1.4rem !important;" readonly>
				</div>
			</div>
			<div class="input-button-wrap">
				<label class="radio-btn active" id="periodBtn1"> 
					<input type="radio" name="bdPeriod" value="0"><span>All</span>
				</label> 
				<label class="radio-btn" id="periodBtn2"> 
					<input type="radio" name="bdPeriod" value="1"><span>1M</span>
				</label> 
				<label class="radio-btn" id="periodBtn3"> 
					<input type="radio" name="bdPeriod" value="3"><span>3M</span>
				</label> 
				<label class="radio-btn" id="periodBtn4"> 
					<input type="radio" name="bdPeriod" value="6"><span>6M</span>
				</label>
			</div>
		</div>
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
			<li class="item" data-tab="tab-5" value="31"  onclick="selectBdMainInfoList(30);">
				<a href="javascript:;">마감이요~ (<span id="endCnt">${bdListCnt.endCnt}</span>) </a>
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
						<label for="">Brand</label> <select name="brand" id="brand" onchange="selectBdMainInfoList(-1);"
							class="brand">
							<option value="00">Brand(all)</option>
							<option value="01">Good-Western</option>
							<option value="02">Non-Western</option>
						</select>
					</div>
					<div class="opt_item">
						<label for="">권역</label> <select name="area" id="area" onchange="selectBdMainInfoList(-1);"
							class="area">
							<option value="00">District(all)</option>
							<option value="01">Incheon</option>
							<option value="02">Busan</option>
						</select>
					</div>
				</div>
			</div>
			<ul class="list t2" id="BdList">
                <c:if test="${empty bdList}">
                    <span>값이없는데요</span>
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
                                        <div class="pd-label">${vo.metalCode}</div>
                                        <div class="brand-nation">
                                            <c:if test="${empty vo.codeDctwo}">
                                                <img src="https://sorincorp.blob.core.windows.net/secs/odflag/flag_mcht_default.png">
                                            </c:if>
                                            <c:if test="${not empty vo.codeDctwo}">
                                                <img src="${vo.codeDctwo}">
                                            </c:if>
                                        </div>
                                        ${vo.brandGroupCode}
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
                                    <span class="item">${vo.itmSn}</span>
                                    <span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
                                    <span class="brand-group">${vo.brandNm}</span>
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
                        <div class="btns" value="${vo.bidSttusCode}" onclick="detailpagemove()">
                            <c:choose>
                                <c:when test="${vo.bidSttusCode == 13}">
                                    <div class="btn-bid-blue">투찰중</div>
                                    <span class="bid-d-day pre abs-info"> 
                                        투찰 마감까지 <span class="time">- 3일 3시간 20분 36초</span>
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
//------------------------------------- 공지사항 최근 게시글 제목 4개 조회-------------------------------------//


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
