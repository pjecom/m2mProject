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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
			        			<li class="item active" data-tab="nav-1"><a href="javascript:;">투찰 목록</a></li>
			        			<li class="item" data-tab="nav-2" onclick="bdMypageLikeList();"><a href="javascript:;">관심 공고</a></li>
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
									<select id="filter" name="filter" class="filter">
									<option value="01">공고일</option>
									<option value="02">마감일</option>
								</select>
				                </div>
				                <div class="cal">
				                    <div class="datepicker-wrap">
				                        <input type="text" class="datepicker from validate[required,custom[date]]" id="searchDateFrom" desc="날짜" placeholder="시작 일자" style="font-size: 1.4rem !important;" readonly>
				                    </div>
				                    <div class="tilde">~</div>
				                    <div class="datepicker-wrap">
				                        <input type="text" class="datepicker to validate[required,custom[date]]" id="searchDateTo" desc="날짜" placeholder="종료 일자" style="font-size: 1.4rem !important;" readonly>
				                    </div>
				                </div>

				                <div class="input-button-wrap btn-period">
				                    <label class="radio-btn active" id="all"><input name="bdPeriod" type="radio" value="전체" checked="checked"><span>전체</span></label>
				                    <label class="radio-btn" id="oneMonth"><input name="bdPeriod" type="radio" value="1"><span>최근 1개월</span></label>
				                    <label class="radio-btn" id="threeMonth"><input name="bdPeriod" type="radio" value="3"><span>최근 3개월</span></label>
				                    <label class="radio-btn" id="sixMonth"><input name="bdPeriod" type="radio" value="6"><span>최근 6개월</span></label>
				                </div>
				                <button class="btn-blue" onclick=selectBdMainInfoList(); >조회</button>
				            </div>
				            <!-- FILTER AREA :: END -->
							<!-- TAB BUTTON :: START -->
							<ul class="tab_btn_group">
								<li class="item1 on" data-tab="tab-1" id="tab1" value="1" onclick="getMyPageList1('13', '');">
									<a href="javascript:;">투찰 건 (<span class="totalCnt">${bdCnt.biddingCnt}</span>) </a>
								</li>
								<li class="item2" data-tab="tab-2" id="tab2" value="2" onclick="getMyPageList2('31', 'Y');">
									<a href="javascript:;">낙찰 건 (<span id="expectCnt">${bdCnt.approvedCnt}</span>)</a>
								</li>
								<li class="item3" data-tab="tab-3"  id="tab3" value="3"  onclick="getMyPageList3('31', 'N');">
									<a href="javascript:;">패찰 건 (<span id="bidingCnt">${bdCnt.rejectedCnt}</span>)</a>
								</li>
								<li class="item4" data-tab="tab-4" id="tab4" value="4"  onclick="getMyPageList4('32', '');">
									<a href="javascript:;">유찰 건 (<span id="endCnt">${bdCnt.auctionCnt}</span>) </a>
								</li>
							</ul>
                            <!-- TAB BUTTON :: END -->
				            <!-- TAB-1 :: START -->
				            <div id="tab-1" class="tab-content on">
				                <div class="custom_radio">
								  <input type="radio" id="featured-1" value="" name="featuredGroup1" checked><label for="featured-1">전체</label>
								  <input type="radio" id="featured-2" value="N" name="featuredGroup1"><label for="featured-2">투찰 중건</label>
								  <input type="radio" id="featured-3" value="Y" name="featuredGroup1"><label for="featured-3">투찰접수 취소건</label>
				                </div>
				                <ul class="list t2 myPageData">
									<c:if test="${empty bdList}">
										<div class="no-data empty-content">Could not find any matches.</div>
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
														<span class="item">${vo.dspyGoodsNm}</span>
														<span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
														<span class="brand-group">${vo.brandGroupCodeNm}</span>
				                                    </div>
				                                    <p class="pd-unit-price">
								          				<span class="label-orange">투찰가</span>
						                                <span class="u-price realTimePrice up" >${vo.totalCost} (원/MT)</span>
						                            </p>
				                                    <div class="pd-period">
				                                        <span class="qty">수량<span class="highlight">${vo.bidWt}</span></span>	
														<span class="date">투찰기간 <span class="highlight">${vo.bddprBeginDt} ~ ${vo.bddprEndDt}</span></span> 
													</div>
				                                </div>
				                            </div>
				                            <div class="btns">
				                                <a href="javascript:;" name="selectBid" id="${vo.bidPblancId}" class="btn-gray-md">상세보기</a>
				                            </div>
				                        </div>
				                    </li>
								</c:forEach>
								</ul>
							</div>

							<div id="tab-2" class="tab-content">
				                <div class="custom_radio">
				                </div>
				                <ul class="list t2 myPageData">
									<c:if test="${empty bdList}">
										<div class="no-data empty-content">Could not find any matches.</div>
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
														<span class="item">${vo.dspyGoodsNm}</span>
														<span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
														<span class="brand-group">${vo.brandGroupCodeNm}</span>
				                                    </div>
				                                    <p class="pd-unit-price">
								          				<span class="label-orange">투찰가</span>
						                                <span class="u-price realTimePrice up">${vo.totalCost} (원/MT)</span>
						                            </p>
				                                    <div class="pd-period">
				                                        <span class="qty">수량<span class="highlight">${vo.bidWt}</span></span>	
														<span class="date">투찰기간 <span class="highlight">${vo.bddprBeginDt} ~ ${vo.bddprEndDt}</span></span> 
													</div>
				                                </div>
				                            </div>
				                            <div class="btns">
				                                <a href="javascript:;" name="selectBid" id="${vo.bidPblancId}" class="btn-gray-md">상세보기</a>
				                            </div>
				                        </div>
				                    </li>
								</c:forEach>
								</ul>
							</div>
							<div id="tab-3" class="tab-content">
				                <div class="custom_radio">
				                </div>
				                <ul class="list t2 myPageData">
									<c:if test="${empty bdList}">
										<div class="no-data empty-content">Could not find any matches.</div>
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
														<span class="item">${vo.dspyGoodsNm}</span>
														<span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
														<span class="brand-group">${vo.brandGroupCodeNm}</span>
				                                    </div>
				                                    <p class="pd-unit-price">
								          				<span class="label-orange">투찰가</span>
						                                <span class="u-price realTimePrice up">${vo.totalCost} (원/MT)</span>
						                            </p>
				                                    <div class="pd-period">
				                                        <span class="qty">수량<span class="highlight">${vo.bidWt}</span></span>	
														<span class="date">투찰기간 <span class="highlight">${vo.bddprBeginDt} ~ ${vo.bddprEndDt}</span></span> 
													</div>
				                                </div>
				                            </div>
				                            <div class="btns">
				                                <a href="javascript:;" name="selectBid" id="${vo.bidPblancId}"  class="btn-gray-md">상세보기</a>
				                            </div>
				                        </div>
				                    </li>
								</c:forEach>
								</ul>
							</div>
							<div id="tab-4" class="tab-content">
				                <div class="custom_radio">
				                </div>
				                <ul class="list t2 myPageData">
									<c:if test="${empty bdList}">
										<div class="no-data empty-content">Could not find any matches.</div>
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
														<span class="item">${vo.dspyGoodsNm}</span>
														<span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
														<span class="brand-group">${vo.brandGroupCodeNm}</span>
				                                    </div>
				                                    <p class="pd-unit-price">
								          				<span class="label-orange">투찰가</span>
						                                <span class="u-price realTimePrice up">${vo.totalCost} (원/MT)</span>
						                            </p>
				                                    <div class="pd-period">
				                                        <span class="qty">수량<span class="highlight">${vo.bidWt}</span></span>	
														<span class="date">투찰기간 <span class="highlight">${vo.bddprBeginDt} ~ ${vo.bddprEndDt}</span></span> 
													</div>
				                                </div>
				                            </div>
				                            <div class="btns">
				                                <a href="javascript:;" name="selectBid" id="${vo.bidPblancId}"  class="btn-gray-md">상세보기</a>
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
									All <span class="fc-red">${favoritesCnt}</span>개
				                </div>
				                <ul class="list t2 likeData">
									<c:if test="${empty likeList}">
										<div class="no-data empty-content">Could not find any matches. 왜비었어 </div>
									</c:if>
									<c:forEach items="${likeList}" var="vo">
				                    <!-- item 1 관심공고 :: START -->
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
				                                        <div class="pd-like">
															<ul class="company">
																<li>
																	<span>참여기업</span>
																	<span>${vo.partcptnEntrpsQy}</span>
																</li>
																<li>
																	<span>관심기업</span>
																	<span class="intrstEntrpsQy" value="${vo.intrstEntrpsQy}">${vo.intrstEntrpsQy}</span>
																</li>
															</ul>
															<a href="javascript:;" class="ico like active"  id="${vo.bidPblancId}">
																<span class="material-symbols-outlined">favorite</span>
																<span class="tit">관심해제</span>
																<span class="ico-txt">관심 해제합니다.</span>
															</a>
														</div>
				                                    </div>
													<div class="pd-name">
														<span class="item">${vo.dspyGoodsNm}</span>
														<span class="wrhous">출고권역 - ${vo.dstrctLclsfCode}</span>
														<span class="brand-group">${vo.brandGroupCodeNm}</span>
													</div>
													<div class="pd-period">
														<span class="qty">수량<span class="highlight">${vo.bidWt}</span></span>	
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
													</c:when>
													<c:when test="${vo.bidSttusCode == 30}">
														<div class="btn-bid-black">마감</div>
														<span class="t-info abs-info">개찰완료</span>
													</c:when>
													<c:otherwise>
														<div class="btn-bid-stroke">입찰예정</div>
													</c:otherwise>
												</c:choose>
											</div>
				                        </div>
				                    </li>
									</c:forEach>
				                    <!-- item 1 관심공고 :: END -->
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
		$(function() {
			var tab = "${tabNo}";
			
			switch(tab){
                case '1':
				getMyPageList1('13', '');
				break;
                case '2':
				getMyPageList2('31', 'Y');
                    break;
                case '3':
                getMyPageList3('31', 'N');
                    break;
				case '4':
                getMyPageList4('32', '');
                    break;
                case '':
				getMyPageList1('13', '');
                    break;
            }
		});

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
        const url = "/bdMypageAjax"

		var params = {
		         "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
                 "bidSttusCode" : bidSttusCode,
                 "pblancCanclAt" : scsbidAt,
				"filter" : $('#filter').val(),
				"searchDateFrom" : $('#searchDateFrom').val().replaceAll("-", ""),
				"searchDateTo" : $('#searchDateTo').val().replaceAll("-", ""),
				"bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo")
		}


		$.ajax({
						url: url, 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'html', 
						success: function(res) {
							//console.log('데이터 정상', data);
							$('.tab_btn_group li').removeClass('on');
                            $('.tab-content').removeClass('on');
                            $('.item1').addClass('on');
                            $('#tab-1').addClass('on');
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
        const url = "/bdMypageAjax"

		var params = {
		         "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
                 "bidSttusCode" : bidSttusCode,
                 "scsbidAt" : scsbidAt,
				"filter" : $('#filter').val(),
				"searchDateFrom" : $('#searchDateFrom').val().replaceAll("-", ""),
				"searchDateTo" : $('#searchDateTo').val().replaceAll("-", "")
		}


		$.ajax({
						url: url, 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'html', 
						success: function(res) {
							//console.log('데이터 정상', data);
							$('.tab_btn_group li').removeClass('on');
                            $('.tab-content').removeClass('on');
                            $('.item2').addClass('on');
                            $('#tab-2').addClass('on');
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
        const url = "/bdMypageAjax"

		var params = {
		         "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
                 "bidSttusCode" : bidSttusCode,
                 "scsbidAt" : scsbidAt,
				"filter" : $('#filter').val(),
				"searchDateFrom" : $('#searchDateFrom').val().replaceAll("-", ""),
				"searchDateTo" : $('#searchDateTo').val().replaceAll("-", "")
		}


		$.ajax({
						url: url, 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'html', 
						success: function(res) {
							//console.log('데이터 정상', data);
							$('.tab_btn_group li').removeClass('on');
                            $('.tab-content').removeClass('on');
                            $('.item3').addClass('on');
                            $('#tab-3').addClass('on');
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
        const url = "/bdMypageAjax"

		var params = {
		         "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
                 "bidSttusCode" : bidSttusCode,
                 "scsbidAt" : scsbidAt,
				"filter" : $('#filter').val(),
				"searchDateFrom" : $('#searchDateFrom').val().replaceAll("-", ""),
				"searchDateTo" : $('#searchDateTo').val().replaceAll("-", "")
		}


		$.ajax({
						url: url, 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'html', 
						success: function(res) {
							//console.log('데이터 정상', data);
							$('.tab_btn_group li').removeClass('on');
                            $('.tab-content').removeClass('on');
                            $('.item4').addClass('on');
                            $('#tab-4').addClass('on');
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

	function updateLikeTable(htmlContent) {
        // Find the table body element
        const tbody = $(".likeData");

        // Replace the content of the table body with the new HTML
        tbody.html('');
        tbody.html(htmlContent);
    }
	// let tempBdBidBas = {}
    // let bdBidBas = {
    //     bidSttusCode: '',
    //     bidPblancId: '',
    //     bddprBeginDt: '',
    //     bddprEndDt: ''
    // }

    // bdBidBas.bidSttusCode 값 변경 감지
    // Object.defineProperty(bdBidBas, 'bidSttusCode', {
    //     get: function() {
    //         return this._bidSttusCode;
    //     },
    //     set: function(newValue) {
    //         this._bidSttusCode = newValue;

    //         $(".bid-sttus-tab").removeClass("active")
    //         $("#bid-sttus-tab-" + newValue).addClass("active")
    //     }
    // });
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

	$(function() {

// =============== DATEPICKER ==================
$("#searchDateFrom").datepicker({
	dateFormat: 'yy-mm-dd' //달력 날짜 형태
	,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	,changeYear: false //option값 년 선택 가능
	,changeMonth: false //option값  월 선택 가능
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
	,changeYear: false //option값 년 선택 가능
	,changeMonth: false //option값  월 선택 가능
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


	function dateviewfmt(date){
	return date.substring(2,4) + '.' +date.substring(4,6)+ '.' +date.substring(6,8)+ ' ' +date.substring(8,10)+ ':' +date.substring(10,12)+ ':' +date.substring(12,14);
	}

	$(document).on( 'click', "a[name='selectBid']", function(event) {
            var params = {
            "bidPblancId" : this.id,
            "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo")
        }
            pageMove( "/detail/bdDetail", JSON.stringify(params), 'application/json');
	   		
    });

	function selectBdMainInfoList() {
		var bidSttusCode1 = $(".item1.on").val();
		var bidSttusCode2 = $(".item2.on").val();
		var bidSttusCode3 = $(".item3.on").val();
		var bidSttusCode4 = $(".item4.on").val();

		if(bidSttusCode1 !== undefined){
			getMyPageList1('13', '');
		}
		else if(bidSttusCode2 !== undefined) {
			getMyPageList2('31', 'Y');
		}
		else if(bidSttusCode3 !== undefined) {
			getMyPageList3('31', 'N');
		}
		else if(bidSttusCode4 !== undefined) {
			getMyPageList4('32', '');
		} else {
			getMyPageList1('13', '');
		}

		// switch(bidSttusCode){
        //         case '1':
		// 		getMyPageList1('13', '');
		// 		break;
        //         case '2':
		// 		getMyPageList2('31', 'Y');
        //             break;
        //         case '3':
        //         getMyPageList3('31', 'N');
        //             break;
		// 		case '4':
        //         getMyPageList4('32', '');
        //             break;
        //         case '':
		// 		getMyPageList1('13', '');
        //             break;
        //     }
	}
	$(document).on( 'click', ".ico.like", function(e) {
        // var interestCount = '';
        // var intrstEntrpsQy = $(".intrstEntrpsQy").val();

        // console.log("intrstEntrpsQy :::::::::"+intrstEntrpsQy)
        e.preventDefault(); // 기본 동작을 막음
        // 현재 버튼에 active 클래스가 있는지 확인
        var isActive = $(this).hasClass("active");
        var likeYn = '';
        var likeCnt = 1;
        var intrstEntrpsQyElement = $(this).closest('li').find('.intrstEntrpsQy');
        // 만약 active 클래스가 있으면 제거, 없으면 추가
        if (isActive) {
            // 이미 활성화된 경우, 비활성화로 변경
            $(this).removeClass("active");
            likeYn = 'Y';
             // 초기 관심 기업 수 증가
            var interestCount = parseInt("${vo.intrstEntrpsQy}");
            interestCount = Math.max(0, interestCount - 1);
            $("#interestCount").text(interestCount);
            console.log("몇개"+interestCount);
            likeCnt = -1;
            
            var currentCount = parseInt(intrstEntrpsQyElement.text());
		    intrstEntrpsQyElement.text(currentCount - 1);

        } else {
            // 비활성화된 경우, 활성화로 변경
            $(this).addClass("active");
            likeYn = 'N';
            // 초기 관심 기업 수 증가
            var interestCount = parseInt("${vo.intrstEntrpsQy}");
            interestCount ++;
            $("#interestCount").text(interestCount);
            console.log("몇개++"+interestCount);
            
            var currentCount = parseInt(intrstEntrpsQyElement.text());
		    intrstEntrpsQyElement.text(currentCount + 1);
        }

        var params = {
            "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
            "bidPblancId" : this.id,
            "likeYn" : likeYn,
            "likeCnt" : likeCnt
		}
        $.ajax({
                type: 'POST',
                url: '/likeUpdate',
                contentType: 'application/json', 
                data: JSON.stringify(params),
                success: function(data) {
                    
                }
        });
    });

	function bdMypageLikeList(){
		//$(".tabs > .item").removeClass("active");
		// let tabb =  $(this).attr('data-tab');
        // $('#'+tabb).addClass("active");
		var params = {
            "bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo")
		}
		
		$.ajax({
				type: 'POST',
                url: '/bdMypageLikeList',
                contentType: 'application/json', 
                data: JSON.stringify(params),
                success: function(res) {
					// $(".favoritesCnt").text(favoritesCnt); //관심
					updateLikeTable($(res).find(".likeData").html());
    	        },
    	});
	}

	$(document).on( 'click', "[name='featuredGroup1']", function(e) {
		var scsbidAt = $(this).attr('value');
		getMyPageList1('13',scsbidAt);
	});
	
	</script>
</body>
