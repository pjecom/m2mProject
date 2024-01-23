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
    <meta name="title" content="서린상사">
    <link rel="shortcut icon" href="/guide/images/favicon.ico">
    <meta name="keywords" content="서린상사, 서린상사(주), 비철금속전문기업, 아연, 황산">
    <meta name="description" content="세계를 선도하는 종합비철무역상사 - 서린상사">
    <title>구매입찰시스템 | SORIN e-Commerce</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="/guide/css/common.css">
    <link rel="stylesheet" href="/guide/css/sorin.css">
    <link rel="stylesheet" href="/guide/css/select2/select2.min.css">
    <!-- script core :: START -->
    <script src="/guide/js/jquery-3.6.0.min.js"></script>
	<script src="/guide/js/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="/guide/js/select2/select2.min.js"></script>
    <!-- script core :: END -->
</head>
<body>
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
				<div class="section prod-detail-wrap bid">
					<div class="inwrap">
			            <!-- ITEM TITLE :: START  -->
			            <h2 class="h2-new">공고 상세 정보</h2>
			            <!-- ITEM TITLE :: END  -->	            
			            <!-- ITEM DETAIL AREA :: START -->
						<ul class="list t2">
			                <!-- LIST ITEM DETAIL : 입찰예정 :: START -->
			                <li>
			                    <div class="cart-item-wrap type4">
			                        <figure class="figure figure1">	
			                            <img src="/images/my/al_sum.jpg" alt="알루미늄" class="w">
			                        </figure>
			                        <div class="figure-con">
			                            <div class="pd-brand-info">
			                            	<h3 class="pd-bid-no">${bdDetailVO.bidPblancId}</h3>
			                                <div class="pd-wrap">
			                                    <div class="pd-brand">
			                                        <div class="pd-label">${bdDetailVO.metalCodeEm}</div>
			                                        <div class="brand-nation">
			                                            <img src="${bdDetailVO.nationUrl}">
			                                        </div>
			                                        ${bdDetailVO.brandCode}
			                                    </div>
			                                    <div class="pd-like">
			                                        <ul class="company">
			                                            <li>
			                                                <span>참여기업</span>
			                                                <span>${bdDetailVO.partcptnEntrpsQy}</span>
			                                            </li>
			                                            <li>
			                                                <span>관심기업</span>
			                                                <span class="intrstEntrpsQy">${bdDetailVO.intrstEntrpsQy}</span>
			                                            </li>
			                                        </ul>
			                                        <a href="#" class="ico like active">
			                                            <span class="material-symbols-outlined">favorite</span>
			                                            <span>관심추가</span>
			                                        </a>
			                                    </div>
			                                </div>
			                                <div class="pd-name">
			                                    <span class="item">${bdDetailVO.dspyGoodsNm}</span>
			                                    <span class="wrhous">출고권역 - ${bdDetailVO.dstrctNm}</span>
			                                    <span class="brand-group">${bdDetailVO.brandGroupCodeNm}</span>
			                                </div>
			                                <div class="pd-period">
			                                    <span class="qty">수량 <span class="highlight"><fmt:formatNumber value="${bdDetailVO.bidWt}" pattern="#,###"/>MT</span></span>	
			                                    <span class="date">투찰기간 <span class="highlight">${bdDetailVO.bddrBeginDate} ~ ${bdDetailVO.bddrEndDate}</span></span> 
			                                	<span class="t-info">개찰결과 : 투찰 기한 마감과 동시에 발표함</span>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="btns bid-state">
										<!-- ###################### START 입찰상태코드(디폴트값:마감으로 셋팅) ######################-->
										<c:choose>
											<c:when test="${bdDetailVO.bidSttusCode eq '12'}">
												<div class="btn-bid-stroke">입찰예정</div>
											</c:when>
											<c:when test="${bdDetailVO.bidSttusCode eq '13'}">
												<div class="btn-bid-stroke">투찰중</div>
											</c:when>
											<c:when test="${bdDetailVO.bidSttusCode eq '21'}">
												<div class="btn-bid-stroke">개찰중</div>
											</c:when>
											<c:when test="${bdDetailVO.bidSttusCode eq '30'}">
												<div class="btn-bid-stroke">마감</div>
											</c:when>
											<c:when test="${(bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'Y')}">
												<div class="btn-bid-stroke">최종낙찰</div>
											</c:when>
											<c:when test="${bdDetailVO.bidSttusCode eq '32'}">
												<div class="btn-bid-stroke">유찰</div>
											</c:when>
											<c:when test="${(bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'N')}">
												<div class="btn-bid-stroke">페찰</div>
											</c:when>
											<c:otherwise>
												<div class="btn-bid-stroke">마감</div>
											</c:otherwise>
										</c:choose>
										<!-- ###################### END 입찰상태코드(디폴트값:마감으로 셋팅) ######################-->
 									</div>
		                        	<c:if test="${bdDetailVO.bidSttusCode eq '12'}">
										<p class="bid-d-day abs-info"> <!-- <p class="bid-d-day pre abs-info"> -->
											투찰 시작까지 <span class="time" id="timeDe${bdDetailVO.bidPblancId}"></span>
										</p>
									</c:if>
									<c:if test="${bdDetailVO.bidSttusCode eq '13'}">
										<p class="bid-d-day abs-info"> <!-- <p class="bid-d-day pre abs-info"> -->
											투찰 마감까지 <span class="time"  style="color: #1D5FD0;" id="timeDe${bdDetailVO.bidPblancId}"></span>
										</p>
									</c:if>
			                    </div>
			                </li>
			                <!-- item 1 입찰예정 :: END -->
			                <!-- 투찰 정보 입력 TABLE :: START -->
			                <div class="section bid-tbl-wrap">
			                    <div class="hgroup">
			                        <h2 class="h3">투찰 정보 입력</h2>
			                    </div>
			                    <table class="tbl-v bid th-left">
			                        <caption>투찰정보 - 메탈구분, 브랜드, 아이템 상품명, 권역, 수량, 중량허용공차 제공</caption>
			                        <colgroup>
			                            <col style="width:20rem;">
			                            <col>
			                            <col style="width:20rem;">
			                            <col>
			                        </colgroup>
			                        <tbody>
			                            <tr>
			                                <th scope="row">메탈구분</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.metalCodeNm}</div>
			                                </td>
			                                <th scope="row">아이템 상품명</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.dspyGoodsNm}</div>
			                                </td>	
			                            </tr>
			                            <tr>
			                                <th scope="row">권역</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.dstrctNm}</div>
			                                </td>
			                                <th scope="row">브랜드</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.brandGroupCodeNm}</div>
			                                </td>			                                
			                            </tr>
			                            <tr>
			                                <th scope="row">수량(개)</th>
			                                <td>	
			                                    <div class="read"><fmt:formatNumber value="${bdDetailVO.bidWt}" pattern="#,###"/></div>
			                                </td>
			                                <th scope="row">중량허용공차(±)</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.permWtRate}%</div>
			                                </td>
			                            </tr>
										<!-- ###################### START 입찰예정 ######################-->
										<c:if test="${bdDetailVO.bidSttusCode eq '12'}">
											<tr>
												<th scope="row">인도 조건</th>
												<td colspan="3"><span class="icon-info-txt">시작 전입니다.</span></td>
											</tr>
											<tr>
												<th scope="row">프리미엄 가격(USD/MT)</th>
												<td colspan="3"><span class="icon-info-txt">시작 전입니다.</span></td>
											</tr>
										</c:if>
										<!-- ###################### END 입찰예정 ######################-->
										<!-- ###################### START 마감(내가 참여하지 않은 마감건) ######################-->
										<c:if test="${bdDetailVO.bidSttusCode eq '30'}">
											<tr>
												<th scope="row">인도 조건</th>
												<td colspan="3"><span class="icon-info-txt">마감 된 공고입니다.</span></td>
											</tr>
											<tr>
												<th scope="row">프리미엄 가격(USD/MT)</th>
												<td colspan="3"><span class="icon-info-txt">마감 된 공고입니다.</span></td>
											</tr>
										</c:if>
										<!-- ###################### END 마감(내가 참여하지 않은 마감건) ######################-->
										<!-- ###################### START 투찰중(투찰 최종가격) ######################-->
										<c:if test="${bdDetailVO.bidSttusCode eq '13' || (bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'Y') || (bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'N') || bdDetailVO.bidSttusCode eq '32'}">
											<!-- ###################### START 입찰 후(Flag값 'Y') ######################-->
											<c:if test="${bdBddprVO.bddprFlag eq 'Y'}">
												<tr class="bid-condition">
													<th class="fc-red" rowspan="2" scope="row">인도 조건</th>
													<td colspan="2">
														<div class="tb-select readonly">
															<label for="shippingAddr">검색조건</label>
															<select name="shippingAddr" id="shippingAddr" disabled>
																<option>${bdBddprVO.delyCndCodeNm}</option>
															</select>
															<!--<div class="read">${bdBddprVO.delyCndCodeNm}</div>-->
														</div>
													</td>									
													<td colspan="1"><input class="input-lg readonly" type="text" name="" id="delyCndStdrPc" value="${bdBddprVO.delyCndStdrPc}" readonly></td>
												</tr>
												<tr class="bid-condition bid-condition2 read">
													<td class="right-narrow" colspan="2">
														<div class="input-btn-wrap">
															<div class="r-info">+전환 프리미엄가</div>
														</div>
													</td>
													<td colspan="1"><input class="input-lg readonly" type="text" name="" id="cnvrsPremiumAmount" value="${bdBddprVO.cnvrsPremiumAmount}" readonly></td>                                
												</tr>			                            
												<tr>
													<th class="fc-red" rowspan="2" scope="row">프리미엄 가격(USD/MT)</th>
													<td class="bg-orange1" colspan="2">투찰 프리미엄 가격</td>
													<td class="bg-orange2" colspan="1">투찰 최종 가격</td>
												</tr>		
												<tr>
													<td class="center read" colspan="2">
														<input class="input-md readonly" type="text" name="premium" id="bddprPremiumPc" value="${bdBddprVO.bddprPremiumPc}" readonly>/MT</td>
													<td class="center" colspan="1" id="result" ><span></span>${bdBddprVO.bddprTotalPc} 원</td>                                  
												</tr>
											</c:if>	
											<!-- ###################### END 입찰 후(Flag값 'Y') ######################-->
											<!-- ###################### START 입찰 전(Flag값 'N') ######################-->
											<c:if test="${bdBddprVO.bddprFlag ne 'Y'}">
												<tr class="bid-condition">
													<th class="fc-red" rowspan="2" scope="row">인도 조건</th>
													<td colspan="2">
														<div class="tb-select">
															<label for="shippingAddr">검색조건</label>
															<select name="shippingAddr" id="shippingAddr">
																<option>옵션</option>
																<c:forEach var="item" items="${bdDelyCndList}">
																	<option value="${item.codeDcone}">${item.codeDctwo}</option>
																</c:forEach>
															</select>
														</div>
													</td>
													<td colspan="1"><input class="input-lg" type="number" name="" id="delyCndStdrPc" onchange='Change()' value="100" placeholder=""></td>
												</tr>
												<tr class="bid-condition bid-condition2">
													<td class="right-narrow" colspan="2">
														<div class="input-btn-wrap">
															<div class="r-info">+전환 프리미엄가</div>
														</div>
													</td>
													<td colspan="1"><input class="input-lg" type="number" name="" id="cnvrsPremiumAmount" onchange='Change()' value="100" placeholder=""></td>                                
												</tr>			                            
												<tr>
													<th class="fc-red" rowspan="2" scope="row">프리미엄 가격(USD/MT)</th>
													<td class="bg-orange1" colspan="2">투찰 프리미엄 가격</td>
													<td class="bg-orange2" colspan="1">투찰 최종 가격</td>
												</tr>		
												<tr>
													<td class="center" colspan="2">
														<input class="input-md" type="number" name="premium" id="bddprPremiumPc" onchange='Change()' value="100" placeholder="">/MT</td>
													<td class="center" colspan="1" id="result" pattern="#,###,###"><span>300</span> 원</td>                                  
												</tr>
											</c:if>
											<!-- ###################### END 입찰 후(Flag값 'N') ######################-->
										</c:if>
										<!-- ###################### END 투찰중(투찰 최종가격) ######################-->
			                            <tr>
			                                <th class="multi" scope="row">인도 기한</th>
			                                <td class="multi" colspan="3">
												<fmt:parseDate value="${bdDetailVO.delyBeginDe}" var="delyBeginDe" pattern="yyyyMMdd"/>
												<fmt:parseDate value="${bdDetailVO.delyEndDe}" var="delyEndDe" pattern="yyyyMMdd"/>
												<fmt:formatDate value="${delyBeginDe}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${delyEndDe}" pattern="yyyy.MM.dd"/><br> 
			                                    <span class="t-info">인도조건에서 제출한 인도지에 화물이 최종 입고된 기준으로 적용함.</span>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th scope="row">가격지정기간</th>
			                                <td>
			                                    <div class="read">
													<fmt:parseDate value="${bdDetailVO.pcAppnBeginDe}" var="pcAppnBeginDe" pattern="yyyyMMdd"/>
													<fmt:parseDate value="${bdDetailVO.pcAppnEndDe}" var="pcAppnEndDe" pattern="yyyyMMdd"/>
													<fmt:formatDate value="${pcAppnBeginDe}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${pcAppnEndDe}" pattern="yyyy.MM.dd"/><br> 
												</div>
			                                </td>
			                                <th scope="row">가격지정방법</th>
			                                <td>
			                                    <div class="read">${bdDetailVO.pcAppnMthCodeNm}</div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th scope="row">결제 조건</th>
			                                <td colspan="3">${bdDetailVO.setleCrncyCodeNm} ${bdDetailVO.setleMthCodeNm} ${bdDetailVO.setlePdCodeNm}</td>
			                            </tr>
			                            <tr>
			                                <th scope="row">기타 코멘트</th>
			                                <td colspan="3">${bdDetailVO.etcCn}</td>
			                            </tr>
										<c:if test="${bdDetailVO.bidSttusCode ne '12'}">
											<tr>
												<th scope="row">입찰 참여 동의</th>
												<td colspan="3">
													<div class="checkbox-container">
														<!--입찰전-->
														<c:if test = "${bdBddprVO.bddprFlag ne 'Y'}">
															<label class="checkbox-label" for="agree_all">
																<input type="checkbox" name="agree_all" id="agree_all" value="">
																<span class="checkbox-custom rectangular"></span>
															</label>
														</c:if>
														<!--입찰후-->
														<c:if test = "${bdBddprVO.bddprFlag eq 'Y'}">
															<label class="checkbox-label" for="agree_all">
																<input type="checkbox" name="agree_all" id="agree_all" value="" checked disabled>
																<span class="checkbox-custom rectangular"></span>
															</label>
														</c:if>
														<div class="input-title">상기&nbsp;내용에&nbsp;입찰&nbsp;동의합니다.</div>
													</div>   
												</td>
											</tr>	
										</c:if>
			                        </tbody>
			                    </table>
								<!-- ###################### START 송신상태 ######################-->
								<c:if test="${bdDetailVO.bidSttusCode eq '13' && bdBddprVO.bddprFlag eq 'Y'}">
									<div class="hgroup">
										<h2 class="h3">송신 상태</h2>
									</div>
									<table class="tbl-v t3 th-left">
										<caption>송신 상태 정보 - 송신결과, 투찰접수일시 제공</caption>
										<colgroup>
											<col style="width:20rem;">
											<col>
											<col style="width:20rem;">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">송신결과</th>
												<td colspan="3">정상</td>
											</tr>
											<tr>
												<th scope="row">투찰접수일시</th>
												<td colspan="3">${bdBddprVO.dateString}</td>
											</tr>
											<tr>
												<th scope="row">투찰취소일시</th>
												<td colspan="3">${bdBddprVO.dateCancelString}</td>
											</tr>
										</tbody>
									</table>
								</c:if>
								<!-- ###################### END 송신상태 ######################--> 
								<!-- ###################### START 수정사항 ######################--> 
								<c:choose>
									<c:when test = "${bdDetailVO.bidSttusCode eq '12'}">
									</c:when>
									<c:otherwise>
										<div class="section fixes-wrap">
											<div class="tbl-list-summary">
												수정 사항
											</div>
											<c:choose>
												<c:when test="${fn:length(bdBidUpdtList) > 0}">
													<ul id="reviseUl" class="list t2">
														<c:forEach var="list" items="${bdBidUpdtList}">
															<li>
																<div class="balance-manage-result">
																	<div class="date" id="serverDate">${list.frstDateString}</div>
																	<div class="figure-con">
																		<p class="pd-name">${list.bidUpdtCn}</p>
																		<p class="pd-order"><span>${list.bidUpdtResn}</span></p>
																	</div>
																</div>
															</li>
														</c:forEach>
													</ul>
												</c:when>
												<c:otherwise>
													<ul id="reviseUl" class="list t2">
														<li>
															<div class="balance-manage-result">
																<div class="figure-con">
																	<p class="pd-order">
																		<span>수정된 내용이 없습니다.</span>
																	</p>
																</div>
															</div>
														</li>
													</ul>
												</c:otherwise>
											</c:choose>
										</div>
									</c:otherwise>
								</c:choose>
			                    <!-- ###################### END 수정사항 ######################--> 	
								<!-- ###################### START 투찰결과 ######################--> 	
								<c:if test = "${(bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'Y') || (bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'N')}">
									<div class="section bid-result">	    	                		                    
										<div class="hgroup">
											<h2 class="h3">투찰 결과</h2>
											<c:if test = "${(bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'Y')}">
												<span class="icon-info-txt">낙찰 되신 것을 축하드립니다.</span>
											</c:if>
										</div>
										<table class="tbl t3 bid">
											<caption>투찰 결과</caption>
											<colgroup>
												<col style="width:20%;">
												<col style="width:20%;">
												<col style="width:20%;">
												<col style="width:20%;">
												<col style="width:20%;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="rank">순위</th>
													<th scope="col" class="company">기업명</th>
													<th scope="col" class="date">접수일</th>
													<th scope="col" class="premium">프리미엄가</th>
													<th scope="col" class="result">결과</th>
												</tr>
											</thead>
											<tbody id="bdResult">
												<c:forEach items="${bdBidResultList}" var="vo">
													<tr>
														<td class="center">${vo.rank}</td>
														<td class="center">${vo.entrpsNm}</td>
														<td class="center">${vo.bddprDt}</td>
														<td class="center">${vo.maskedTotalCost}</td>
														<td class="center">${vo.scsbidResult}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div> 
								</c:if>
				                <!-- ###################### END 투찰결과 ######################-->
								<!-- ###################### START 유찰사유 ###################### -->
								<c:if test = "${bdDetailVO.bidSttusCode eq '32'}">
									<div class="section fixes-wrap">
										<div class="tbl-list-summary">
											유찰 사유
										</div>
										<ul class="list t2">
											<li>
												<div class="balance-manage-result">
													<div class="date">${failReason.rejectBidResnDt}</div>
													<div class="figure-con">
														<p class="pd-order">
															<span>
																${failReason.rejectBidResn}
															</span>
														</p>
													</div>
												</div>
											</li>                               
										</ul>
									</div>	
								</c:if>		                    
								<!-- ###################### END 유찰사유 ###################### -->	 	
			                    <div class="btn-wrap">
									<c:choose> 
										<c:when test="${bdBddprVO.bddprFlag eq 'Y' && bdBddprVO.dateCancelFlag ne 'Y' && !(bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'Y') && !(bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'N') && bdDetailVO.bidSttusCode ne '32'}">
											<button type="button" class="btn-gray-big btn-list" onclick="pageMove('/');">공고 목록가기</button>
											<button type="button" id="bidStr" class="btn-blue-big" onclick="moveMyPage()">마이페이지</button>
											<button type="button" id="bidStr" class="btn-blue-big" onclick="canclPopup()">투찰취소</button>
										</c:when>
										<c:when test="${bdBddprVO.dateCancelFlag eq 'Y'}">
											<button type="button" class="btn-gray-big btn-list" onclick="pageMove('/');">공고 목록가기</button>
											<button type="button" id="bidStr" class="btn-blue-big" onclick="moveMyPage()">마이페이지</button>
										</c:when>
										<c:when test="${bdDetailVO.bidSttusCode eq '12'}">
											<button type="button" class="btn-gray-big btn-list" onclick="pageMove('/');">공고 목록가기</button>
										</c:when>
										<c:when test="${(bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'Y') }">
											<button type="button" class="btn-gray-big btn-list" onclick="moveMyPage('/');">목록가기</button>
											<button type="button" class="btn-stroke-big blue">낙찰 확인서</button>
											<button type="button" class="btn-blue-big">서류접수하기</button>
										</c:when>
										<c:when test="${(bdDetailVO.bidSttusCode eq '31' && bdBddprVO.scsbidAt eq 'N') || bdDetailVO.bidSttusCode eq '32'}">
											<button type="button" class="btn-gray-big btn-list" onclick="moveMyPage('/');">목록가기</button>
										</c:when>										
										<c:otherwise>
											<button type="button" class="btn-gray-big btn-list" onclick="pageMove('/');">공고 목록가기</button>
											<button type="button" id="bidStr" class="btn-blue-big" onclick="confirmPopup()">투찰하기</button>
										</c:otherwise>
									</c:choose>
			                    </div>
								 <!-- 비밀번호 확인 팝업, 투찰접수건 확인 팝업 :: START -->
								<div class="popup modal confirm" id="bidCancelConfirm">
									<div class="modal-content w490px">
										<div id="modal1">
											<div class="modal-header">
												<h1>비밀번호 확인</h1>
												<div class="modal-close"><button type="button" class="modal-x" onclick="closePopup()"><span class="hidden" >Close Popup</span></button></div>
											</div>
											<div class="max-width">
												<div class="alert-con"><p>최종인증을 진행합니다.<br>가입 시 등록한 비밀번호를 입력해주세요.<br><br>
													<input class="full" type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요." autocomplete="new-password">
												</div><!--// .max-width -->
											</div>
											<div class="modal-btns">
												<button type="button" class="btn-blue-big" id="passwordCheck" onclick="checkPassword()">확인</button>
											</div>
										</div>
										<div id="modal2" style="display:none">
											<div class="max-width">
												<div class="alert-con">
													<p>정상접수되었습니다.<br>내가 참여한 입찰 내역은<br>[마이페이지]<br>확인 가능합니다. 감사합니다.<br>
												</div><!--// .max-width -->
											</div>
											<div class="modal-btns">
												<button type="button" class="btn-blue-big" onclick="reloadPage()">확인</button>
												<button type="button" class="btn-blue-big" id="" onclick="moveMyPage()">마이페이지</button>
											</div>
										</div>
										<div id="modal3" style="display:none">
											<div class="modal-header">
												<h1>알림</h1>
												<div class="modal-close"><button type="button" class="modal-x" onclick="closePopup()"><span class="hidden" >Close Popup</span></button></div>
											</div>
											<div class="max-width">
												<div class="alert-con">
													<p>해당공고는 투찰 접수 된 상태입니다.<br>취소 시, 입찰 정보가 사라지며<br>동일 입찰 건은 재 입찰이 불가능합니다.<br>취소하시겠습니까?<br>	
												</div><!--// .max-width -->
												<label class="checkbox-label" for="agree_cancl" style="font-size:12px; width:150px">
													<input type="checkbox" name="agree_cancl" id="agree_cancl" value="">
													<span class="checkbox-custom rectangular"></span>
													<div class="">rrr 확인 후 취소합니다.</div>
												</label>
											</div>
											<div class="modal-btns">
												<button type="button" class="btn-blue-big" onclick="closePopup()">닫기</button>
												<button type="button" class="btn-blue-big" onclick="nextPopup()">투찰 취소</button>
											</div>
										</div>
										<div id="modal4" style="display:none">
											<div class="modal-header">
												<h1>비밀번호 확인</h1>
												<div class="modal-close"><button type="button" class="modal-x" onclick="closePopup()"><span class="hidden" >Close Popup</span></button></div>
											</div>
											<div class="max-width">
												<div class="alert-con"><p>최종인증을 진행합니다.<br>가입 시 등록한 비밀번호를 입력해주세요.<br><br>
													<input class="full" type="password" name="checkPassword" id="checkPassword" placeholder="비밀번호를 입력해주세요." autocomplete="new-password">
												</div><!--// .max-width -->
											</div>
											<div class="modal-btns">
												<button type="button" class="btn-blue-big" id="checkCanclPassword" onclick="checkCanclPassword()">확인</button>
											</div>
										</div>	
									</div>								
								</div>
								 <!-- 비밀번호 확인 팝업, 투찰접수건 확인 팝업 :: END -->
								<div class="popup modal confirm" id="checkConfirm">
									<div class="modal-content w490px">
										
									</div>
								</div>
								 <!-- 비밀번호 확인 팝업 :: END -->
			                </div>
			                <!-- 투찰 정보 입력 TABLE :: END -->
			            </ul>			            
	            		<!-- ITEM DETAIL AREA :: END -->	            				
					</div>
				</div>
				<!-- section #1 구매입찰 공고 LIST :: END -->		    		
			</div>		
			<!-- container :: END -->
		</div>	
		<!-- body-main :: END -->

    </div>
    <!-- wrapper :: END -->

    <!-- script custom :: START -->
	<!-- <script src="/guide/js/common.js"></script>
	<script src="/guide/js/sorin.js"></script> -->
	<script src="/guide/js/sorin-ma.js"></script><!-- main js -->
	<!-- script custom :: END -->
	<script type="text/javascript"> 

	// =============== 관심목록 ==================
	$(function() {
        var isActive = "${bdDetailVO.conCheck}"

        // 만약 active 클래스가 있으면 제거, 없으면 추가
        if (isActive === 'N') {
            // 이미 활성화된 경우, 비활성화로 변경
			$(".ico.like").addClass("active");
			$(".ico.like").find('span:last-child').text("관심해제");
        } else {
            // 비활성화된 경우, 활성화로 변경
			$(".ico.like").removeClass("active");
			$(".ico.like").find('span:last-child').text("관심추가");
        }
    });

	    // '관심추가' 버튼에 대한 클릭 이벤트 처리
	$(".ico.like").click(function(e) {
		debugger;
        e.preventDefault(); // 기본 동작을 막음

        // 현재 버튼에 active 클래스가 있는지 확인
        var isActive = $(this).hasClass("active");
		var conCheck = '';
        var likeCnt = 1;
		var intrstEntrpsQyElement = $(this).closest('li').find('.intrstEntrpsQy');

        if (isActive) {
            $(this).removeClass("active");
			console.log("active 제거");
			conCheck = 'Y';

            var currentCount = parseInt(intrstEntrpsQyElement.text());
		    intrstEntrpsQyElement.text(currentCount - 1);

            likeCnt = -1;    

			// 관심 추가/제거 텍스트 변경
			$(this).find('span:last-child').text("관심추가");
        } else {
            $(this).addClass("active");
			console.log("active 추가");
			conCheck = 'N';

			var currentCount = parseInt(intrstEntrpsQyElement.text());
		    intrstEntrpsQyElement.text(currentCount + 1);
			// 관심 추가/제거 텍스트 변경
			$(this).find('span:last-child').text("관심해제");
        }
		console.log(conCheck); 

		var params = {
			"bidEntrpsNo" : "${bdDetailVO.bidEntrpsNo}",	// 업체번호(세션값)
			"bidPblancId" : "${bdDetailVO.bidPblancId}",	// 입찰 공고아이디 
            "likeYn" : conCheck,
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


	// =============== 페이지 이동 ==================
	$(function() {
    	var currentEntrpsNm = sessionStorage.getItem("entrpsNm");

		// 각 행을 순회하면서 순위 비교
		$("#bdResult tr").each(function() {
            var rowCompanyName = $(this).find("td:eq(1)").text().trim(); // 각 행의 회사 이름

            // 현재 업체와 일치하는 회사 이름의 행에 파란색 배경 적용
            if (rowCompanyName === currentEntrpsNm) {
                $(this).addClass("active");
            }
        });
    });
	// =============== 페이지 이동 ==================
	function moveMyPage() {
		var params = {
					"bidEntrpsNo" : sessionStorage.getItem("bidEntrpsNo"),
					"bidSttusCode" : "${bdDetailVO.bidSttusCode}"
			}
		pageMove( "/bdMypage", JSON.stringify(params), 'application/json');
	}

	// =============== 투찰 마감까지 타이머 ==================
	$(function() {
    	fmtDate(${bdDetailVO.bddprBeginDt}, ${bdDetailVO.bddprEndDt});
    });
    
    //날짜 format
	function datefmt(date){
		return date.substring(0,4) + '-' +date.substring(4,6)+ '-' +date.substring(6,8)+ ' ' +date.substring(8,10)+ ':' +date.substring(10,12)+ ':' +date.substring(12,14);
	}
	
	// 타이머
    function fmtDate(startDate,endDate){
		//debugger;
		startDate = startDate.toString();
		endDate = endDate.toString();
		
		setInterval(function(){
			
			//입찰 공고 시작일
			startFmtDate = new Date(datefmt(startDate));
			//입찰 공고 마감일
			endFmtDate = new Date(datefmt(endDate));
			//현재시간
			var nowDate = new Date();
			
			if(${bdDetailVO.bidSttusCode} =="12" && startFmtDate >= nowDate){
				$("#timeDe${bdDetailVO.bidPblancId}").html(" - " + Math.floor((startFmtDate-nowDate)/(1000*24*60*60)) 
						+"일 "+Math.floor(((startFmtDate-nowDate)% (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
						+"시 "+Math.floor(((startFmtDate-nowDate) % (1000 * 60 * 60)) / (1000 * 60))
						+"분 "+Math.floor(((startFmtDate-nowDate) % (1000 *60)) / 1000) + "초");
			}else if(${bdDetailVO.bidSttusCode} =="13" && endFmtDate >= nowDate){
				$("#timeDe${bdDetailVO.bidPblancId}").html(" - " + Math.floor((endFmtDate-nowDate)/(1000*24*60*60)) 
						+"일 "+Math.floor(((endFmtDate-nowDate)% (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
						+"시 "+Math.floor(((endFmtDate-nowDate) % (1000 * 60 * 60)) / (1000 * 60))
						+"분 "+Math.floor(((endFmtDate-nowDate) % (1000 *60)) / 1000) + "초");
			}else{
				$("#timeDe${bdDetailVO.bidPblancId}").html("");
			}
		},1000); //1초마다 
	}

	// =============== 모달오픈 ==================
	function modalOpenFocus() {
		const focusableElements = 'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])';
		const modal = document.querySelector('.modal.active');
		const firstFocusableElement = modal.querySelectorAll(focusableElements)[0];
		const focusableContent = modal.querySelectorAll(focusableElements);
		const lastFocusableElement = focusableContent[focusableContent.length - 1];

		document.addEventListener('keydown', function(e) {
			let isTabPressed = e.key === 'Tab' || e.keycode === 9;

			if (!isTabPressed) {
				return;
			}

			if (e.shiftKey) {
				if (document.activeElement === firstFocusableElement) {
					lastFocusableElement.focus();
					e.preventDefault();
				}
			} else {
				if (document.activeElement === lastFocusableElement) {
					firstFocusableElement.focus();
					e.preventDefault();
				}
			}
		});
		firstFocusableElement.focus();
	}

	function modalCloseFocus() {
    	const modalCount = $('.modal.active').length;
		if (modalCount !== 0) {
			modalOpenFocus();
		}
	}
	$(document).off('click', '.modal-x').on('click', '.modal-x', function(e) {
		//debugger;
    	e.preventDefault();
    	$(this).closest('.popup').removeClass('active');
		modalCloseFocus();

		$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
	});
	
	// =============== 투찰최종가격 ==================
	function Change()  { 
		 const nDelyCndStdrPc = document.getElementById('delyCndStdrPc').value;
		 const nCnvrsPremiumAmount = document.getElementById('cnvrsPremiumAmount').value;
		 const nBddprPremiumPc = document.getElementById('bddprPremiumPc').value;
		 /* 인트로 형변환*/
		 var iDelyCndStdrPc = parseInt(nDelyCndStdrPc);  
		 var iCnvrsPremiumAmount = parseInt(nCnvrsPremiumAmount);
		 var iBddprPremiumPc = parseInt(nBddprPremiumPc);
		 
		 // 값이 비어있을떄 디폴트값 0으로 처리
		 if (isNaN(iDelyCndStdrPc) || iDelyCndStdrPc === null || iDelyCndStdrPc === "") {
			iDelyCndStdrPc = 0;
		 }
		 if (isNaN(iCnvrsPremiumAmount) || iCnvrsPremiumAmount === null || iCnvrsPremiumAmount === "") {
			iCnvrsPremiumAmount = 0;
		 }
		 if (isNaN(iBddprPremiumPc) || iBddprPremiumPc === null || iBddprPremiumPc === "") {
			iBddprPremiumPc = 0;
		 }

		 // 쉼표를 포함한 문자열로 변환
  		 var formattedResult = (iDelyCndStdrPc + iCnvrsPremiumAmount + iBddprPremiumPc).toLocaleString();

		 document.getElementById("result").innerText = formattedResult + '원';
	}

	// =============== 팝업창 ==================
	
	// 비밀번호 확인 팝업 오픈
	function confirmPopup(){
		// 입찰 참여동의 여부 체크
		var agree = $('#agree_all').prop('checked');
		var value = agree ? 'Y' : 'N';

		// 인도조건 값 가져옴
		var cndCode = $('#shippingAddr').val();

		// 인도조건 validation 체크
		if(cndCode == '옵션'){
			alert("인도 조건을 설정해주세요.");
			return;
		}
		
		// 입찰 참여 동의 여부 validation 체크
		if(value == 'Y'){
			document.getElementById('bidCancelConfirm').style.display = 'block';
			// 비밀번호 초기화
			$("#password").val("");
			cmmPopup('bidCancelConfirm', 'confirm');
		}else{
			alert("입찰 참여 동의를 해주세요.");
		}
	}

	// 정상접수 팝업 오픈
	function reloadPage(){
		var params = {
			"bidPblancId" : "${bdDetailVO.bidPblancId}",	// 입찰 공고아이디 
			"bidEntrpsNo" : "${bdDetailVO.bidEntrpsNo}"
		}
		pageMove( "/detail/bdDetail", JSON.stringify(params), 'application/json');
	}

	// 모달 변경
	function changeModal(){
		$('#modal1').hide();
		$('#modal2').show();
		$('#modal3').hide();
		$('#modal4').hide();		
	}

	// 팝업 닫기
	function closePopup(){
		document.getElementById('bidCancelConfirm').style.display = 'none';
	}

	// 비밀번호 확인 팝업 오픈
	function canclPopup(){

		var canclPossAt = "${bdDetailVO.bddprCanclPossAt}";
	
		if(canclPossAt !== 'Y'){
			alert("취소불가능한 공고입니다.");
		}else{
			//현재시간
			var nowDate = new Date();
			var formattnowDt = formatDate(nowDate);
			//투찰취소 제한일자
			var canclDt = "${bdDetailVO.bddprCanclLmttDe}"

			if(formattnowDt < canclDt){
				console.log("취소가능한 공고입니다.");
				document.getElementById('bidCancelConfirm').style.display = 'block';
				$("#agree_cancl").prop("checked", false);  // 체크박스 초기화

				cmmPopup('bidCancelConfirm', 'confirm');
				$('#modal1').hide();
				$('#modal2').hide();
				$('#modal3').show();
				$('#modal4').hide();
			}else{
				alert("투찰취소 기한이 지났습니다.");
			}
		}
	}	

	// Date 객체를 "yyyyMMddHHmmss" 형식의 문자열로 변환하는 함수
	function formatDate(date) {
		var year = date.getFullYear();
		var month = ('0' + (date.getMonth() + 1)).slice(-2);
		var day = ('0' + date.getDate()).slice(-2);
		var hours = ('0' + date.getHours()).slice(-2);
		var minutes = ('0' + date.getMinutes()).slice(-2);
		var seconds = ('0' + date.getSeconds()).slice(-2);

		return year + month + day + hours + minutes + seconds;
	}

	// 투찰 취소 버튼 클릭시
	function nextPopup(){
		var agree = $('#agree_cancl').prop('checked');
		var value = agree ? 'Y' : 'N';

		// 입찰 참여 동의 여부 validation 체크
		if(value == 'Y'){
			$('#modal1').hide();
			$('#modal2').hide();
			$('#modal3').hide();
			$('#modal4').show();
		}else{
			alert("확인 후 취소합니다 체크박스를 체크해 주세요.");
		}
	}

	// =============== 비밀번호 가져오기 ==================
	function checkPassword(){
		var params = {
			"bidEntrpsNo" : "${bdDetailVO.bidEntrpsNo}", // 입찰 업체 번호
			"bidMberSecretNo" : $('#password').val() // 입찰 회원 비밀 번호
		}

		$.ajax({
			url: '/detail/passwordCheck',
			method: 'POST', 
			contentType: 'application/json', 
			data: JSON.stringify(params), 
			dataType: 'json', 
			success: function(data) {
				// 비밀번호가 맞을경우
				if(data.result == "Y"){
					var params = {
						"bidEntrpsNo" : "${bdDetailVO.bidEntrpsNo}",	// 업체번호(세션값)
						"bidPblancId" : "${bdDetailVO.bidPblancId}",	// 입찰 공고아이디 
						"delyCndCode" : $('#shippingAddr').val(),	// 인도조건코드
						"delyCndStdrPc" : $('#delyCndStdrPc').val(),	// 인도 조건 기준가격
						"cnvrsPremiumAmount" : $('#cnvrsPremiumAmount').val(),	// 인도 프리미엄 금액
						"bddprPremiumPc" : $('#bddprPremiumPc').val(),	// 인도 프리미엄 가격
						"bddprWt" : "${bdDetailVO.bidWt}",	// 투찰 중량
						"partcptnAgreAt" : $('#agree_all').prop('checked') ? 'Y' : 'N',	// 참여 동의 여부
						"bddprNrmltAt" : "Y",	// 투찰 정상여부
						"scsbidAt" : "N",	// 낙찰여부
						"canclAt" : "N",	// 취소여부
						"deleteAt" : "N",	// 삭제여부
						"pcAppnBeginDe" : "${bdDetailVO.pcAppnBeginDe}",	//가격지정시작일자
						"pcAppnEndDe" : "${bdDetailVO.pcAppnEndDe}",	//가격지정종료일자
						"bidMberId" : sessionStorage.getItem("bidMberId")
					}	

					$.ajax({
						url: '/detail/insertBdBddpr', 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'json', 
						success: function(data) {
							console.log('데이터 정상', data);
							changeModal();
							//cmmPopup('bidCancelConfirm', 'confirm');
							
							//location.href("/bdTiles/bdDetail");

						},
						error: function(error) {
							// 에러 발생 시의 처리
							console.error('서버 요청 중 에러 발생:', error);
						}
					});
					
				// 비밀번호가 틀릴경우	
				}else{
					alert("비밀번호를 다시 입력해주세요");
				}
			},
			error: function(error) {
				// 에러 발생 시의 처리
				console.error('서버 요청 중 에러 발생:', error);
			}
		});
	}

	// =============== 비밀번호 가져오기 >> 투찰취소 UPDATE ==================
	function checkCanclPassword (){
		var params = {
			"bidEntrpsNo" : "${bdDetailVO.bidEntrpsNo}", // 입찰 업체 번호
			"bidMberSecretNo" : $('#checkPassword').val() // 입찰 회원 비밀 번호
		}

		$.ajax({
			url: '/detail/passwordCheck',
			method: 'POST', 
			contentType: 'application/json', 
			data: JSON.stringify(params), 
			dataType: 'json', 
			success: function(data) {
				// 비밀번호가 맞을경우
				if(data.result == "Y"){
					var params = {
						"bidEntrpsNo" : "${bdDetailVO.bidEntrpsNo}",	// 업체번호(세션값)
						"bidPblancId" : "${bdDetailVO.bidPblancId}",	// 입찰 공고아이디 
						"bidMberId" : sessionStorage.getItem("bidMberId")
					}

					$.ajax({
						url: '/detail/updateBdBddpr', 
						method: 'POST', 
						contentType: 'application/json', 
						data: JSON.stringify(params), 
						dataType: 'json', 
						success: function(data) {
							console.log('데이터 정상', data);
							changeModal();
							//cmmPopup('bidCancelConfirm', 'confirm');
							
							//location.href("/bdTiles/bdDetail");

						},
						error: function(error) {
							// 에러 발생 시의 처리
							console.error('서버 요청 중 에러 발생:', error);
						}
					});
				// 비밀번호가 틀릴경우	
				}else{
					alert("비밀번호를 다시 입력해주세요");
				}
			},
			error: function(error) {
				// 에러 발생 시의 처리
				console.error('서버 요청 중 에러 발생:', error);
			}
		});
	}

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

	// =============== BTN.LIKE ==================
	// $('.ico.like').click(function(e){
	//     e.preventDefault();
	//     $(this).toggleClass('active');
	// })
	    
	// =============== DATEPICKER ==================
	</script>
</body>
</html>