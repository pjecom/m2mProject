<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="title" content="서린상사">
    <link rel="shortcut icon" href="/guide/images/favicon.ico">
    <meta name="keywords" content="서린상사, 서린상사(주), 비철금속전문기업, 아연, 황산">
    <meta name="description" content="세계를 선도하는 종합비철무역상사 - 서린상사">
    <title>마이페이지 > 투찰내역 | SORIN e-Commerce</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="/guide/css/common.css">
    <link rel="stylesheet" href="/guide/css/sorin.css">
    <link rel="stylesheet" href="/guide/css/select2/select2.min.css">
    <!-- script core :: START -->
    <script src="/guide/js/jquery-3.6.0.min.js"></script>
	<script src="/guide/js/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="/guide/js/select2/select2.min.js"></script>
    <!-- script core :: END -->

	<!-- wrapper :: START -->
    <div class="wrapper pt0">
        <!-- 23.10.16 | header include -->
        <!-- <div class="header bid"></div>
        <script type="text/javascript"> $(".header.bid").load("/guide/html/bid/include/header.html");</script> -->
        <!-- // 23.10.16 | header include -->

		<!-- body-main :: START -->
		<div class="body-main">
			<!-- container :: START -->
			<div class="container">
				<!-- section #1 구매입찰 공고 LIST :: START -->
				<div class="section prod-list-wrap bid">
					<div class="inwrap bi">
			        	<!-- LEFT WING :: START -->
			        	<div class="left-wing">
			        		<ul>
			        			<li class="item active" data-tab="nav-1"><a href="#">투찰 목록</a></li>
			        			<li class="item" data-tab="nav-2"><a href="#">관심 공고</a></li>
			        			<li class="item" data-tab="nav-3"><a href="#">내정보관리</a></li>
			        		</ul>
			        	</div>
			        	<!-- LEFT WING :: END -->
			        	<!-- NAV-1 :: START -->
                        <div id="nav-1" class="right on">
			                <div class="hgroup">
			                    <div>
			                        <h2 class="h2">투찰 목록</h2>
			                    </div>
			                </div>
				            <!-- FILTER AREA :: START -->
				            <div class="filter_area">
				                <div class="opt">
									<label for="">Search Keyword</label> 
									<select id="filter" name="filter" onchange="selectBdMainInfoList(-1);" class="filter">
									<option value="01">공고일</option>
									<option value="02">마감일</option>
								</select>
				                </div>
				                <div class="cal">
				                    <div class="datepicker-wrap">
				                        <input type="text" onchange="selectBdMainInfoList(-1);" class="datepicker from validate[required,custom[date]]" id="startDate" desc="날짜" placeholder="시작 일자" style="font-size: 1.4rem !important;" readonly>
				                    </div>
				                    <div class="tilde">~</div>
				                    <div class="datepicker-wrap">
				                        <input type="text" onchange="selectBdMainInfoList(-1);" class="datepicker to validate[required,custom[date]]" id="endDate" desc="날짜" placeholder="종료 일자" style="font-size: 1.4rem !important;" readonly>
				                    </div>
				                </div>

				                <div class="input-button-wrap btn-period">
				                    <label class="radio-btn active" id="all"><input name="bdPeriod" type="radio" value="전체" checked="checked"><span>전체</span></label>
				                    <label class="radio-btn" id="oneMonth"><input name="bdPeriod" type="radio" value="1"><span>최근 1개월</span></label>
				                    <label class="radio-btn" id="threeMonth"><input name="bdPeriod" type="radio" value="3"><span>최근 3개월</span></label>
				                    <label class="radio-btn" id="sixMonth"><input name="bdPeriod" type="radio" value="6"><span>최근 6개월</span></label>
				                </div>
				                <button class="btn-blue">조회</button>
				            </div>
				            <!-- FILTER AREA :: END -->
							<!-- TAB BUTTON :: START -->
							<ul class="tab_btn_group">
								<li class="item on" data-tab="tab-1" value="1" onclick="getMyPageList1('13', '');">
									<a href="javascript:;">투찰 건 (<span class="totalCnt">${bdListCnt.totalCnt}</span>) </a>
								</li>
								<li class="item" data-tab="tab-2" value="2" onclick="getMyPageList2('31', 'Y');">
									<a href="javascript:;">낙찰 건 (<span id="expectCnt">${bdListCnt.expectCnt}</span>)</a>
								</li>
								<li class="item" data-tab="tab-3"  value="3"  onclick="getMyPageList3('31', 'N');">
									<a href="javascript:;">패찰 건 (<span id="bidingCnt">${bdListCnt.bidingCnt}</span>)</a>
								</li>
								<li class="item" data-tab="tab-4" value="4"  onclick="getMyPageList4('32', '');">
									<a href="javascript:;">유찰 건 (<span id="endCnt">${bdListCnt.endCnt}</span>) </a>
								</li>
							</ul>
                            <!-- TAB BUTTON :: END -->
				            <!-- TAB-1 :: START -->
				            <div id="tab-1" class="tab-content on">
				                <div class="custom_radio">
								  <input type="radio" id="featured-1" name="featuredGroup1" checked><label for="featured-1">전체</label>
								  <input type="radio" id="featured-2" name="featuredGroup1"><label for="featured-2">투찰 중건</label>
								  <input type="radio" id="featured-3" name="featuredGroup1"><label for="featured-3">투찰접수 취소건</label>
				                </div>
				                <ul class="list t2 myPageData">
									<c:if test="${empty bdList}">
										<span>데이터가 존재하지 않습니다.</span>
									</c:if>
									<c:forEach items="${bdList}" var="vo">
				                    <!-- item 1 투찰건 :: START -->
				                    <li>
				                        <div class="cart-item-wrap type3">
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
				                                    </div>
				                                    <div class="pd-name">
														<span class="item">${vo.brandNm}</span>
														<span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
														<span class="brand-group">${vo.brandGroupCodeNm}</span>
				                                    </div>
				                                    <p class="pd-unit-price">
								          				<span class="label-orange">투찰가</span>
						                                <span class="u-price realTimePrice up">3,428,000 (원/MT)</span>
						                            </p>
				                                    <div class="pd-period">
				                                        <span class="qty">수량 ${vo.totalCnt} <span class="highlight">100MT</span></span>	
														<span class="date">투찰기간 <span class="highlight">${vo.bddprBeginDt} ~ ${vo.bddprEndDt}</span></span> 
													</div>
				                                </div>
				                            </div>
				                            <div class="btns">
				                                <a href="/guide/html/bid/SOREC-SC-BID-006.html" class="btn-gray-md">상세보기</a>
				                            </div>
				                        </div>
				                    </li>
								</c:forEach>
								</ul>
							</div>

							<div id="tab-2" class="tab-content on">
				                <div class="custom_radio">
				                </div>
				                <ul class="list t2 myPageData">
									<c:if test="${empty bdList}">
										<span>데이터가 존재하지 않습니다.</span>
									</c:if>
									<c:forEach items="${bdList}" var="vo">
				                    <!-- item 1 투찰건 :: START -->
				                    <li>
				                        <div class="cart-item-wrap type3">
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
				                                    </div>
				                                    <div class="pd-name">
														<span class="item">${vo.brandNm}</span>
														<span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
														<span class="brand-group">${vo.brandGroupCodeNm}</span>
				                                    </div>
				                                    <p class="pd-unit-price">
								          				<span class="label-orange">투찰가</span>
						                                <span class="u-price realTimePrice up">3,428,000 (원/MT)</span>
						                            </p>
				                                    <div class="pd-period">
				                                        <span class="qty">수량 ${vo.totalCnt} <span class="highlight">100MT</span></span>	
														<span class="date">투찰기간 <span class="highlight">${vo.bddprBeginDt} ~ ${vo.bddprEndDt}</span></span> 
													</div>
				                                </div>
				                            </div>
				                            <div class="btns">
				                                <a href="/guide/html/bid/SOREC-SC-BID-006.html" class="btn-gray-md">상세보기</a>
				                            </div>
				                        </div>
				                    </li>
								</c:forEach>
								</ul>
							</div>
							<div id="tab-3" class="tab-content on">
				                <div class="custom_radio">
				                </div>
				                <ul class="list t2 myPageData">
									<c:if test="${empty bdList}">
										<span>데이터가 존재하지 않습니다.</span>
									</c:if>
									<c:forEach items="${bdList}" var="vo">
				                    <!-- item 1 투찰건 :: START -->
				                    <li>
				                        <div class="cart-item-wrap type3">
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
				                                    </div>
				                                    <div class="pd-name">
														<span class="item">${vo.brandNm}</span>
														<span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
														<span class="brand-group">${vo.brandGroupCodeNm}</span>
				                                    </div>
				                                    <p class="pd-unit-price">
								          				<span class="label-orange">투찰가</span>
						                                <span class="u-price realTimePrice up">3,428,000 (원/MT)</span>
						                            </p>
				                                    <div class="pd-period">
				                                        <span class="qty">수량 ${vo.totalCnt} <span class="highlight">100MT</span></span>	
														<span class="date">투찰기간 <span class="highlight">${vo.bddprBeginDt} ~ ${vo.bddprEndDt}</span></span> 
													</div>
				                                </div>
				                            </div>
				                            <div class="btns">
				                                <a href="/guide/html/bid/SOREC-SC-BID-006.html" class="btn-gray-md">상세보기</a>
				                            </div>
				                        </div>
				                    </li>
								</c:forEach>
								</ul>
							</div>
							<div id="tab-4" class="tab-content on">
				                <div class="custom_radio">
				                </div>
				                <ul class="list t2 myPageData">
									<c:if test="${empty bdList}">
										<span>데이터가 존재하지 않습니다.</span>
									</c:if>
									<c:forEach items="${bdList}" var="vo">
				                    <!-- item 1 투찰건 :: START -->
				                    <li>
				                        <div class="cart-item-wrap type3">
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
				                                    </div>
				                                    <div class="pd-name">
														<span class="item">${vo.brandNm}</span>
														<span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
														<span class="brand-group">${vo.brandGroupCodeNm}</span>
				                                    </div>
				                                    <p class="pd-unit-price">
								          				<span class="label-orange">투찰가</span>
						                                <span class="u-price realTimePrice up">3,428,000 (원/MT)</span>
						                            </p>
				                                    <div class="pd-period">
				                                        <span class="qty">수량 ${vo.totalCnt} <span class="highlight">100MT</span></span>	
														<span class="date">투찰기간 <span class="highlight">${vo.bddprBeginDt} ~ ${vo.bddprEndDt}</span></span> 
													</div>
				                                </div>
				                            </div>
				                            <div class="btns">
				                                <a href="/guide/html/bid/SOREC-SC-BID-006.html" class="btn-gray-md">상세보기</a>
				                            </div>
				                        </div>
				                    </li>
								</c:forEach>
								</ul>
							</div>
				            <!-- TAB-4 :: END -->
                        </div>
                        <!-- NAV-1 :: END -->
			        	<!-- NAV-2 :: START -->
                        <div id="nav-2" class="right">
			                <div class="hgroup">
			                    <div>
			                        <h2 class="h2">관심 공고</h2>
			                    </div>
			                </div>
				            <div class="tab-content type2">
				                <div class="cont-sub-tit">
									All <span class="fc-red">2</span>개
				                </div>
				                <ul class="list t2">
				                    <!-- item 1 관심공고 :: START -->
				                    <li>
				                        <div class="cart-item-wrap type3">
				                            <figure class="figure figure1">
				                                <img src="/images/my/al_sum.jpg" alt="알루미늄" class="w">
				                            </figure>
				                            <div class="figure-con">
				                                <div class="pd-brand-info">
				                                	<h3 class="pd-bid-no">BID20221020-6</h3>
				                                    <div class="pd-wrap">
				                                        <div class="pd-brand">
				                                            <div class="pd-label">AL</div>
				                                            <div class="brand-nation">
				                                                <img src="https://sorincorp.blob.core.windows.net/secs-t/odflag/flag_mcht_australia.png">
				                                            </div>
				                                            TOMAGO
				                                        </div>
				                                        <div class="pd-like">
				                                            <ul class="company">
				                                                <li>
				                                                    <span>참여기업</span>
				                                                    <span>16</span>
				                                                </li>
				                                                <li>
				                                                    <span>관심기업</span>
				                                                    <span>26</span>
				                                                </li>
				                                            </ul>
				                                            <a href="#" class="ico like active">
				                                                <span class="material-symbols-outlined">favorite</span>
				                                                <span class="tit">관심해제</span>
                                                				<span class="ico-txt">관심 해제합니다.</span>
				                                            </a>
			                                        	</div>
				                                    </div>
				                                    <div class="pd-name">
				                                        <span class="item">PRIMARY AL INGOT P1020</span>
				                                        <span class="brand-group">알루미늄(비서구산)</span>
				                                        <span class="wrhous">출고권역 - 인천</span>
				                                    </div>
				                                    <div class="pd-period">
				                                        <span class="qty">수량 <span class="highlight">100MT</span></span>
				                                        <span class="date">22.10.20 11:00:00 ~ 22.10.30 18:00:00</span>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="btns">
				                                <a href="#" class="btn-gray-md">상세보기</a>
				                            </div>
				                        </div>
				                    </li>
				                    <!-- item 1 관심공고 :: END -->
				                    <!-- item 2 관심공고 :: START -->
				                    <li>
				                        <div class="cart-item-wrap type3">
				                            <figure class="figure figure1">
				                                <img src="/images/my/al_sum.jpg" alt="알루미늄" class="w">
				                            </figure>
				                            <div class="figure-con">
				                                <div class="pd-brand-info">
				                                	<h3 class="pd-bid-no">BID20221020-6</h3>
				                                    <div class="pd-wrap">
				                                        <div class="pd-brand">
				                                            <div class="pd-label">AL</div>
				                                            <div class="brand-nation">
				                                                <img src="https://sorincorp.blob.core.windows.net/secs-t/odflag/flag_mcht_australia.png">
				                                            </div>
				                                            TOMAGO
				                                        </div>
				                                        <div class="pd-like">
				                                            <ul class="company">
				                                                <li>
				                                                    <span>참여기업</span>
				                                                    <span>16</span>
				                                                </li>
				                                                <li>
				                                                    <span>관심기업</span>
				                                                    <span>26</span>
				                                                </li>
				                                            </ul>
				                                            <a href="#" class="ico like active">
				                                                <span class="material-symbols-outlined">favorite</span>
				                                                <span class="tit">관심해제</span>
				                                                <span class="ico-txt">관심 해제합니다.</span>
				                                            </a>
			                                        	</div>
				                                    </div>
				                                    <div class="pd-name">
				                                        <span class="item">PRIMARY AL INGOT P1020</span>
				                                        <span class="brand-group">알루미늄(비서구산)</span>
				                                        <span class="wrhous">출고권역 - 인천</span>
				                                    </div>
				                                    <div class="pd-period">
				                                        <span class="qty">수량 <span class="highlight">100MT</span></span>
				                                        <span class="date">22.10.20 11:00:00 ~ 22.10.30 18:00:00</span>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="btns">
				                                <a href="#" class="btn-gray-md">상세보기</a>
				                            </div>
				                        </div>
				                    </li>
				                    <!-- item 2 관심공고 :: END -->
				                </ul>
				            </div>
				            <!-- TAB-1 :: END -->

                        </div>
                        <!-- NAV-2 :: END -->
                        <!-- NAV-3 :: START -->
						<div id="nav-3" class="right">
			                <div class="hgroup">
			                    <div>
			                        <h2 class="h2">내 정보 관리</h2>
			                    </div>
			                </div>
			                <div class="cont-sub-tit type2">
								비밀번호 확인
				            </div>
				            <div class="confirm-info-wrap">
				            	<div class="flex-center">
				            		<input type="password" placeholder="비밀번호를 입력해 주세요." />
				            		<button type="button" class="btn-blue">확인</button>
				            	</div>
				            	<div class="text-center mt20">
				     				<span class="icon-info-txt display-inline-block">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 확인합니다.</span>
				            	</div>
				            </div>
							<div class="btn-wrap">
		                        <button type="button" class="btn-gray-big btn-list" onclick="location.href='/guide/html/bid/SOREC-SC-BID-001.html'">목록가기</button>
		                    </div>
						</div>
						<!-- NAV-3 :: END -->
 					</div>
 				</div>
 			</div>
		</div>
		<!-- body-main :: END -->
		
		<!-- 23.10.16 | footer include :: START -->
		<!-- <div class="footer bid"></div>
        <script type="text/javascript"> $(".footer.bid").load("/guide/html/bid/include/footer.html");</script> -->
        <!-- // 23.10.16 | footer include :: END -->
        
    </div>
    <!-- wrapper :: END -->
    
    <!-- script custom :: START -->
	<script src="/guide/js/common.js"></script>
	<script src="/guide/js/sorin.js"></script>
	<script src="/guide/js/sorin-ma.js"></script><!-- main js -->
	<!-- script custom :: END -->
	<script type="text/javascript">
		function setBidSttus(code) {
			bdBidBas.bidSttusCode = code

		}

		function comAjaxMyPage(_type, _url, _data, _dataType, _contentType, _processData, _isAsync, callback) {
	if(!validationIsEmpty(_type) && !validationIsEmpty(_url)) {
		$.ajax({
				type : _type,
				url : _url,
				data : _data,
				dataType : _dataType,
				contentType : _contentType,
				processData : _processData,
				async: _isAsync,
				success : function(data) {
					callback(data);
				},
				error : function(request, status, error) {
					var url = "/bo";
					
				}
			});
	}
}

	// 입찰 공고 목록 axios 요청
	function getMyPageList1(bidSttusCode, scsbidAt) {
		debugger;
        const url = "/bdMypageAjax"

		var params = {
		         "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
                 "bidSttusCode" : bidSttusCode,
                 "scsbidAt" : scsbidAt
		}


		$.ajax({
						url: url, 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'html', 
						success: function(res) {
							//console.log('데이터 정상', data);
							updateTable("#tab-1", $(res).find("#tab-1 .myPageData").html());
						},
						error: function(error) {
							// 에러 발생 시의 처리
							console.log('에러');
						}
					});

        // comAjaxMyPage('POST', url, JSON.stringify(params), "html", true, (res) => {
		// 	debugger;
        //     updateTable($(res).find("#mypageData").html())
        // })
    }
	function getMyPageList2(bidSttusCode, scsbidAt) {
		debugger;
        const url = "/bdMypageAjax"

		var params = {
		         "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
                 "bidSttusCode" : bidSttusCode,
                 "scsbidAt" : scsbidAt
		}


		$.ajax({
						url: url, 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'html', 
						success: function(res) {
							//console.log('데이터 정상', data);
							updateTable("#tab-2", $(res).find("#tab-2 .myPageData").html());
						},
						error: function(error) {
							// 에러 발생 시의 처리
							console.log('에러');
						}
					});

        // comAjaxMyPage('POST', url, JSON.stringify(params), "html", true, (res) => {
		// 	debugger;
        //     updateTable($(res).find("#mypageData").html())
        // })
    }
	function getMyPageList3(bidSttusCode, scsbidAt) {
		debugger;
        const url = "/bdMypageAjax"

		var params = {
		         "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
                 "bidSttusCode" : bidSttusCode,
                 "scsbidAt" : scsbidAt
		}


		$.ajax({
						url: url, 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'html', 
						success: function(res) {
							//console.log('데이터 정상', data);
							updateTable("#tab-3", $(res).find("#tab-3 .myPageData").html());
						},
						error: function(error) {
							// 에러 발생 시의 처리
							console.log('에러');
						}
					});

        // comAjaxMyPage('POST', url, JSON.stringify(params), "html", true, (res) => {
		// 	debugger;
        //     updateTable($(res).find("#mypageData").html())
        // })
    }
	function getMyPageList4(bidSttusCode, scsbidAt) {
		debugger;
        const url = "/bdMypageAjax"

		var params = {
		         "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
                 "bidSttusCode" : bidSttusCode,
                 "scsbidAt" : scsbidAt
		}


		$.ajax({
						url: url, 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'html', 
						success: function(res) {
							//console.log('데이터 정상', data);
							updateTable("#tab-4", $(res).find("#tab-4 .myPageData").html());
						},
						error: function(error) {
							// 에러 발생 시의 처리
							console.log('에러');
						}
					});

        // comAjaxMyPage('POST', url, JSON.stringify(params), "html", true, (res) => {
		// 	debugger;
        //     updateTable($(res).find("#mypageData").html())
        // })
    }

	function updateTable(tabId, htmlContent) {
        // Find the table body element
        const tbody = $(tabId + " .myPageData");

        // Replace the content of the table body with the new HTML
        tbody.html('');
        tbody.html(htmlContent);
    }
	let tempBdBidBas = {}
    let bdBidBas = {
        bidSttusCode: '',
        bidPblancId: '',
        bddprBeginDt: '',
        bddprEndDt: ''
    }

    // bdBidBas.bidSttusCode 값 변경 감지
    Object.defineProperty(bdBidBas, 'bidSttusCode', {
        get: function() {
            return this._bidSttusCode;
        },
        set: function(newValue) {
            this._bidSttusCode = newValue;

            $(".bid-sttus-tab").removeClass("active")
            $("#bid-sttus-tab-" + newValue).addClass("active")
        }
    });
	// =============== SELECT BOX ==================
	$('.brand').select2({
	    width: 'element',
	    minimumResultsForSearch: Infinity,
	    placeholder: '브랜드',
	    selectOnClose: true
	});
	$('.area').select2({
	    width: 'element',
	    minimumResultsForSearch: Infinity,
	    placeholder: '권역',
	    selectOnClose: true
	});
	$('.filter').select2({
	    width: 'element',
	    placeholder: '공고일',
	    minimumResultsForSearch: Infinity,
	    selectOnClose: true
	});
	$('#shippingAddr').select2({
	    width: 'element',
	    minimumResultsForSearch: Infinity,
	    selectOnClose: true
	});

	// =============== TAB ==================
	$('.tab_btn_group li').click(function(e){
	    e.preventDefault();
	    let tab_id = $(this).attr('data-tab');
	    $('.tab_btn_group li').removeClass('on');
	    $('.tab-content').removeClass('on');
	    $(this).addClass('on');
	    $("#"+tab_id).addClass('on');
	})

	// =============== LEFT WING NAV ==================
	$('.left-wing li').click(function(e){
	    e.preventDefault();
	    let tab_id = $(this).attr('data-tab');
	    $('.left-wing ul li').removeClass('active');
	    $('.inwrap.bi .right').removeClass('on');
	    $(this).addClass('active');
	    $("#"+tab_id).addClass('on');
	})

	// =============== BTN.LIKE ==================
	$('.ico.like').click(function(e){
	    e.preventDefault();
	    $(this).toggleClass('active');
	})

	// =============== DATEPICKER ==================
	$('.datepicker.from, .datepicker.to').datepicker({
	    showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여줌
	    buttonImage: "/images/calendar.png", // 버튼 이미지
	    buttonImageOnly: true, // 버튼에 있는 이미지만 표시
	    changeMonth: false, // 월을 바꿀수 있는 셀렉트 박스를 표시
	    changeYear: false, // 년을 바꿀 수 있는 셀렉트 박스를 표시
	    //minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시
	    minDate: 0,
	    nextText: '다음 달', // next 아이콘의 툴팁
	    prevText: '이전 달', // prev 아이콘의 툴팁
	    numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시
	    stepMonths: 1, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가
	    yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가
	    showButtonPanel: false, // 캘린더 하단에 버튼 패널을 표시
	    // currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
	    // closeText: '닫기', // 닫기 버튼 패널
	    dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식
	    showAnim: "slideDown", //애니메이션을 적용
	    showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 변경
	    dayNamesMin: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'], // 요일의 한글 형식
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식. yearRange: "2010:2013" //연도 범위
	    weekHeader: "주",
	    yearSuffix: '년',
	    orientation: 'left',
        beforeShow: function(input) {
        	let i_offset = $(input).offset();
        	setTimeout(function(){
        		$('#ui-datepicker-div').css({
        			'top': i_offset.top + 40,
        			'left': i_offset.left - 96,
        			'bottom': ''
        		});
        	});
        }
	});
	</script>
</body>
