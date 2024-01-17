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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" type="text/css"
	href="/bo_guide/js/vakata-jstree-4a77e59/dist/themes/default/style.min.css">
<!-- Folder tree -->
<link rel="stylesheet" type="text/css"
	href="/bo_guide/js/bootstrap-timepicker-0.5.2/css/bootstrap-timepicker.css">
<link rel="stylesheet" type="text/css"
	href="/bo_guide/js/f ullcalendar-5.7.0/lib/main.css">
<!-- Full calendar -->
<link rel="stylesheet" type="text/css" href="/bo_guide/css/style.css" />

<script type="text/javascript" src="/bo_guide/js/jquery-3.6.0.js"></script>
<!-- realGrid -->
<script type="text/javascript"
	src="/bo_guide/js/realgrid.2.3.2/realgrid-lic.js"></script>
<!-- script type="text/javascript" src="/bo_guide/js/realgrid.2.3.2/realgrid-utils.js"></script -->
<script type="text/javascript"
	src="/bo_guide/js/realgrid.2.3.2/realgrid.2.3.2.min.js"></script>
<script type="text/javascript"
	src="/bo_guide/js/realgrid.2.3.2/libs/jszip.min.js"></script>
<!-- //realGrid -->
<script type="text/javascript"
	src="/bo_guide/js/bootstrap-4.6.0/js/dist/util.js"></script>
<script type="text/javascript"
	src="/bo_guide/js/bootstrap-4.6.0/js/dist/modal.js"></script>
<script type="text/javascript"
	src="/bo_guide/js/bootstrap4-datepicker-master/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="/bo_guide/js/bootstrap4-datepicker-master/js/locales/bootstrap-datepicker.ko.js"></script>
<script type="text/javascript"
	src="/bo_guide/js/bootstrap-timepicker-0.5.2/js/bootstrap-timepicker.js"></script>
<script type="text/javascript"
	src="/bo_guide/js/vakata-jstree-4a77e59/dist/jstree.min.js"></script>
<!-- Folder tree -->
<script type="text/javascript"
	src="/bo_guide/js/fullcalendar-5.7.0/lib/main.js"></script>
<!-- Full calendar -->
<script type="text/javascript"
	src="/bo_guide/js/fullcalendar-5.7.0/lib/locales/ko.js"></script>
<!-- Full calendar(한글) -->
<script type="text/javascript" src="/bo_guide/js/realgridCustom.js"></script>
<!-- 퍼블 작성 -->
<script type="text/javascript" src="/bo_guide/js/common.js"></script>
<!-- 퍼블 작성 -->
<script>
	$(function() {
		//공고 업데이트
		$("#updateBtn").click(function(event){
			event.preventDefault();
			//$('#bdNoticeDetailModal').modal('hide');
			var url = "/bo/boBdPblnUpdateModal";
       		var params = {
            	"bidPblancId" : "${boBdPblnDtl.bidPblancId}",
            	"popupSe"     : "update"
        	};

        	postSetDataTypeBo(url, JSON.stringify(params), "html", true, function(result) {
        		if(!sorin.validation.isNull(result)) {
        			$("#bdNoticeDetailModal .modal2").html('');
        			$("#bdNoticeDetailModal .modal2").html(result);
        			$('#bdNoticeDetailModal').modal();
        		}
    		});
    	});
	});
	
	function showConfirmation() {
		var result = confirm('해당 공고 건은 입찰 예정 건입니다.\n 공고 취소 시 노출되지 않습니다.\n 취소하시겠습니다.?');

	    if (result) {
	      // 삭제 처리 후 팝업 표시
	      alert('글이 삭제되었습니다.');
	      // 여기에 실제 삭제 처리를 추가할 수 있습니다.
	    } else {
	      // 닫기를 선택한 경우 아무 작업 없이 현재 페이지에 머무름
	    }
    }
	
	$(function() {
      // 공고 업데이트
		$("#deleteBtn").click(function(event) {
          
        showConfirmation();
        // 여기에서 필요한 추가 로직을 수행할 수 있습니다.
      });
    });
		
	function modalClose() {
		$('#bdNoticeDetailModal').modal('hide');
	}
	
	var bidPblancId = "${boBdPblnDtl.bidPblancId}"; // 여기에 현재 선택된 행의 bidPblancId 값을 가져오는 로직을 추가해야 합니다.
	
	function redirectToModifyPage(bidPblancId, clickedElement) {
    	
        console.log("redirectToModifyPage bidPblancId:", bidPblancId);
    	
        var modifyPageUrl = "/bo/boBdPblnDtlModify";
        var params = {
            "bidPblancId": bidPblancId
        };

        $.ajax({
            type: "POST",
            url: modifyPageUrl,
            data: JSON.stringify(params),
            contentType: "application/json",
            dataType: "html",
            success: function(result) {
                if (!sorin.validation.isNull(result)) {
                    $("#bdNoticeDetailModal .modal2").html(result);
                    $('#bdNoticeDetailModal').modal('show');
                    
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error: " + textStatus, errorThrown);
            },
            complete: function() {
            }
        });
    }

</script>
</head>

<body>
	<div class="web-wrapper">
		<section class="web-container">
			<script type="text/javascript">
				$(".web-header").load("/bo_guide/html/include/header.html");
			</script>
			<div class="main-content">
				<div class="inner">
					<!-- Button trigger modal -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">
							입찰 공고 상세&nbsp;&nbsp;&gt;&nbsp;
							<span style="background-color: black; color: white; font-weight: normal;">&nbsp;&nbsp;
								입찰공고번호 ${boBdPblnDtl.bidPblancId} &nbsp;&nbsp;
							</span>
						</h5>
						<button type="button" class="btn"
							style="margin-top: 10px; margin-right: 40px;"
							onclick="modalClose()">목록</button>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close"
							onclick="modalClose()"style="margin-top: 20px; margin-bottom: 10px;">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="table table-view">
							<table>
								<colgroup>
									<col class="col-sm" />
									<col width="15%" />
									<col class="col-sm" />
									<col width="10%" />
									<col class="col-sm" />
									<col width="*" />
									<col class="col-sm" />
									<col width="10%" />
								</colgroup>
								<tbody>
									<tr>
										<td>상태</td>
										<td>${boBdPblnDtl.bidSttus}</td>
										<th>시작 ~ 마감</th>
										<td colspan="3">${boBdPblnDtl.bddprBeginDt}~
											${boBdPblnDtl.bddprEndDt}<br>(<span class="color-blue">3일 5시간 0분 0초</span> 남음)
										</td>
										<th>활성여부</th>
										<td>
										 <c:if test="${boBdPblnDtl.dspyAt eq 'Y'}">
                                           활성
                                         </c:if>
                                         <c:if test="${boBdPblnDtl.dspyAt eq 'N'}">
                                           비활성
                                         </c:if>
                                       </td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="sub-title mt-12">
							<h3 class="">공고 정보(*필수)</h3>
						</div>
						<div class="table table-view">
							<table>
								<colgroup>
									<col class="col-md" />
									<col width="*" />
									<col class="col-md" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">메탈 구분<i class="icon icon-required"></i>
										<td>${boBdPblnDtl.metalCodeEm}</td>
										</th>
										<th scope="row">브랜드<i class="icon icon-required"></i></th>
										<td>${boBdPblnDtl.brandGroupCodeNm} / ${boBdPblnDtl.brandCode}</td>
									</tr>
									<tr>
										<th scope="row">아이템 상품명<i class="icon icon-required"></i></th>
										<td>${boBdPblnDtl.dspyGoodsNm}</td>
										<th scope="row">권역</th>
										<td>${boBdPblnDtl.dstrctNm}</td>
									</tr>
									<tr>
										<th scope="row">수량 (톤)<i class="icon icon-required"></i></th>
										<td>${boBdPblnDtl.bidWt}</td>
										<th scope="row">중량허용공차(±)<i class="icon icon-required"></i></th>
										<td>${boBdPblnDtl.permWtRate}</td>
									</tr>
									<tr>
										<th scope="row">프리미엄 가격(USD/MT)<i
											class="icon icon-required"></i></th>
										<td colspan="3">
											<div class="table table-inner">
												<table>
													<colgroup>
														<col width="6%" />
														<col width="*" />
														<col width="40%" />
													</colgroup>
													<thead>
														<tr>
															<th scope="row"></th>
															<th scope="row">인도조건</th>
															<th scope="row">프리미엄 가격 설정</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="text-center"><b>1</b></td>
															<td>서린상사 지정 보세창고 도착도(FCA 서린상사 지정 보세창고)</td>
															<td><input type="text" value="0" class="input"
																style="width: 50%; background-color: #fafafa;"
																readonly="readonly"> &nbsp;&nbsp; <span
																class="color-red">+USD 15.0</span></td>
														</tr>
														<tr>
															<td class="text-center"><b>2</b></td>
															<td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
															<td><input type="text" value="100" class="input"
																style="width: 50%; background-color: #fafafa;"
																readonly="readonly"> &nbsp;&nbsp; <span
																class="color-red">+USD 15.0</span></td>
														</tr>
														<tr>
															<td class="text-center"><b>3</b></td>
															<td>CIF INCHEON / CIF BUSAN</td>
															<td><input type="text" value="200" class="input"
																style="width: 50%; background-color: #fafafa;"
																readonly="readonly"> &nbsp;&nbsp; <span
																class="color-red">+USD 15.0</span></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">인도조건 비고<i class="icon icon-required"></i></th>
										<td colspan="3">
											<ul class="color-red">
												<li>기타) 부산/인천 보세창고 상차도 조건일 경우
													인천지역(+USD8/MT),부산지역(+USD10/MT)을 조정하여 <u>환산 프리미엄으로 입찰 가격
														적용</u>
												</li>
												<li>기타) 부산/인천 보세창고 낙찰될 경우 해당 운송에 대해서는 서린상사 지정 운송업체를 통해
													운송시 서린상사가 해당 금액을 포함한 <u>환산 프리미엄 가격으로 낙찰자에게 지불함</u>
												</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row" rowspan="2">인도기한<i
											class="icon icon-required"></i></th>
										<td colspan="3">2022.08.01 ~ 2022.08.10</td>
									</tr>
									<tr>
										<td colspan="3"><b>ⓘ</b> 인도조건에서 제출한 인도지에 화물이 최종 입고된 기준으로
											적용함</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="table table-view">
							<table>
								<colgroup>
									<col class="col-md" />
									<col width="*" />
									<col class="col-md" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">가격지정기간<i class="icon icon-required"></i></th>
										<td>${boBdPblnDtl.pcAppnBeginDe}~
											${boBdPblnDtl.pcAppnEndDe}</td>
										<th scope="row">가격지정방법<i class="icon icon-required"></i></th>
										<td>${boBdPblnDtl.pcAppnMthCodeNm}</td>
									</tr>
									<tr>
										<th scope="row">결제 조건<i class="icon icon-required"></i></th>
										<td colspan="3">${boBdPblnDtl.setleCndtn}</td>
									</tr>
									<tr>
										<th scope="row">기타 코멘트</th>
										<td colspan="3">${boBdPblnDtl.etcCn}</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="sub-title">
							<h3 class="">투찰 기간 설정</h3>
						</div>
						<div class="table table-view">
							<table>
								<colgroup>
									<col class="col-md" />
									<col width="*" />
									<col class="col-md" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">투찰 시작일<i class="icon icon-required"></i></th>
										<td>${boBdPblnDtl.bddprBeginDt}</td>

										<th scope="row">투찰 마감일<i class="icon icon-required"></i></th>
										<td colspan="3">${boBdPblnDtl.bddprEndDt}</td>
									</tr>
									<tr>
										<th scope="row">투찰 취소기한<i class="icon icon-required"></i>
											<div class="icon icon-title-tooltip tooltip"
												style="margin-left: 1px;">
												<span class="tooltiptext"> 회원사가 투찰 후, 취소를 할때<br />
													설정 된 취소 기한에 따릅니다.
												</span>
											</div>
										</th>
										<td colspan="5">${boBdPblnDtl.bddprCanclLmttDe}</td>
										<!-- <td colspan="3">													
                                                    </td> -->
									</tr>
								</tbody>
							</table>
						</div>

						<div class="sub-title">
							<h3 class="">활성여부</h3>
						</div>
						<div class="table table-view">
							<table>
								<colgroup>
									<col class="col-md" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">활성여부</th>
										<td><c:if test="${boBdPblnDtl.dspyAt eq 'Y'}">
                                                          활성
                                                        </c:if> <c:if
												test="${boBdPblnDtl.dspyAt eq 'N'}">
                                                          비활성
                                                        </c:if></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="sub-title">
							<h3 class="">공고 수정 이력</h3>
						</div>
						<div class="table table-view">
							<table>
								<colgroup>
									<col width="20%" />
									<col width="*" />
									<col width="40%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">수정일시</th>
										<th scope="row">수정 내용</th>
										<th scope="row">수정 사유</th>
									</tr>
									<c:forEach var="updateHistory" items="${bobdUptHist}">
										<tr>
											<td>${updateHistory.lastChangeDt}</td>
											<td>${updateHistory.bidUpdtCn}</td>
											<td>${updateHistory.bidUpdtResn}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 입찰 상태 코드에 따라 버튼 표시 Start -->
						<!-- 11.공고대기, 12.입찰예정,13.투찰중인 경우 -> 공구수정,취소 버튼 노출
                             20.심사중, 21.개찰중, 22.서류접수중, 23.서류심사중, 30.마감인 경우 -> 유찰 처리버튼  -->
						<div class="btn-box mt-12">
							<c:choose>
								<c:when
									test="${boBdPblnDtl.bidSttusCode eq '11' or boBdPblnDtl.bidSttusCode eq '12' or boBdPblnDtl.bidSttusCode eq '13'}">
									<button type="button" class="btn" id="updateBtn">공고 수정</button>
									<button type="button" class="btn" id="deleteBtn">공고 취소</button>
								</c:when>
								<c:when
									test="${boBdPblnDtl.bidSttusCode eq '20' or boBdPblnDtl.bidSttusCode eq '21' or boBdPblnDtl.bidSttusCode eq '22' or boBdPblnDtl.bidSttusCode eq '23' or boBdPblnDtl.bidSttusCode eq '30'}">
									<button type="button" class="btn">유찰 처리</button>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 입찰 상태 코드에 따라 버튼 표시 End -->
						<div class="sub-title">
							<h3 class="">투찰 기업 목록</h3>
						</div>
						<div class="table table-view">
							<table>
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="15%" />
									<col width="*" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="text-center">순위</th>
										<th scope="row" class="text-center">기업명</th>
										<th scope="row" class="text-center">투찰 일시</th>
										<th scope="row" class="text-center">인도조건</th>
										<th scope="row" class="text-center">투찰 가격(USD)</th>
										<th scope="row" class="text-center">상태</th>
										<th scope="row" class="text-center">처리단계</th>
									</tr>
									<c:forEach var="item" items="${bdEntrpsList}">
										<tr>
											<td>${item.opengRank}</td>
											<td>${item.entrpsNm}</td>
											<td>${item.bddprDt}</td>
											<td>인도조건</td>
											<td>${item.bddprPremiumPc}</td>
											<td>${boBdPblnDtl.bidSttus}</td>
											<c:choose> 
											 <c:when test="${boBdPblnDtl.bidSttusCode eq '30'}">
											 <td>유찰</td>
											 </c:when>
											 <c:otherwise>
											 <td>-</td>
											 </c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
									<!-- <tr>
										<td class="text-center"><b>1</b></td>
										<td><a href="#" class="rg-link-renderer">엠투엠글로벌</a></td>
										<td>2022.01.02. 10:10:10</td>
										<td>서린상사 지정 보세창고 도착도(FCA서린상사 지정보세창고)</td>
										<td class="text-center">11</td>
										<td class="text-center">투찰 중</td>
										<td class="text-center">-</td>
									</tr>
									<tr>
										<td class="text-center"><b>2</b></td>
										<td><a href="#" class="rg-link-renderer">반진메탈</a></td>
										<td>2022.01.02. 10:11:25</td>
										<td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
										<td class="text-center">111</td>
										<td class="text-center">투찰 중</td>
										<td class="text-center">-</td>
									</tr>
									<tr>
										<td class="text-center"><b>3</b></td>
										<td><a href="#" class="rg-link-renderer">기업명칭</a></td>
										<td>2022.01.03. 11:11:20</td>
										<td>CIF INCHEON / CIF BUSAN</td>
										<td class="text-center">112</td>
										<td class="text-center">투찰 중</td>
										<td class="text-center">-</td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<!-- <div class="btn-box">
                                         <button type="button" class="btn">입찰 공고 등록</button>
                                         <button type="button" class="btn" data-dismiss="modal">취소</button>
                                     </div> -->
					</div>
					<!-- Modal -->
					<!-- [D]모달 위치는 변경 하셔도 됩니다! -->
					<div class="modal fade" id="bdNoticeDetailModal" tabindex="-1" role="dialog" data-keyboard="false"  aria-labelledby="bdNoticeDetailModallLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full"" role="document">
        <div class="modal-content modal2">
        </div>
</div>
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div
							class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full"
							role="document">
							<div class="modal-content"></div>
						</div>
					</div>
					<!-- <div class="btn-box btn-box-lg">
                        <button type="button" class="btn">저장</button>
                        <button type="button" class="btn">취소</button>
                    </div> -->
				</div>
			</div>
			<!-- //main-content -->
		</section>
	</div>
</body>

</html>