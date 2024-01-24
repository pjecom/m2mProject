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
    	//var endDt = $("#bddprEndDt").val();
    	//var formatEndDt = formatDate(endDt);
    	//countDownTimer('allDday', formatEndDt);
	});
	
	function formatDate(inputDate) {
	    const year = inputDate.substring(0, 4);
	    const month = inputDate.substring(4, 6);
	    const day = inputDate.substring(6, 8);
	    const hour = inputDate.substring(8, 10);
	    const minute = inputDate.substring(10, 12);
	    const second = inputDate.substring(12, 14);
	
	    const formattedDate = year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
	    
	    return formattedDate;
	}
	
	const countDownTimer = function (id, date) {
		if(document.getElementById(id) == "" || document.getElementById(id) == null || document.getElementById(id) === undefined)
			return;
        var _vDate = new Date(date); // 전달 받은 일자
        var _second = 1000;
        var _minute = _second * 60;
        var _hour = _minute * 60;
        var _day = _hour * 24;

        function showRemaining() {
            var now = new Date();
            var distDt = _vDate - now;
//            console.log("distDt : "+distDt);
            var bidSttus = '${selectBidDetailData.bidSttusCode}';
            if (distDt < 0 && bidSttus != '33') {
                clearInterval(timer);
                document.getElementById(id).textContent = '투찰기간이 종료되었습니다.';
                return;
            } 
            if (bidSttus == '33') {
            	clearInterval(timer);
                document.getElementById(id).textContent = '취소된 공고입니다.';
                return;
            }

            var days = Math.floor(distDt / _day);
            var hours = Math.floor((distDt % _day) / _hour);
            var minutes = Math.floor((distDt % _hour) / _minute);
            var seconds = Math.floor((distDt % _minute) / _second);

            document.getElementById(id).textContent = days + '일 ';
            document.getElementById(id).textContent += hours + '시간 ';
            document.getElementById(id).textContent += minutes + '분 ';
            document.getElementById(id).textContent += seconds + '초 남음';
        }

        timer = setInterval(showRemaining, 1000);
    }
	//공고 수정 업데이트
	function updateBtnClick() {
		event.preventDefault();
			//$('#bdNoticeDetailModal').modal('hide');
			var url = "/bo/boBdPblnUpdateModal";
       		var params = {
            	"bidPblancId" : $("#bidPblancId").val(),
            	"popupSe"     : "update"
        	};

        	postSetDataTypeBo(url, JSON.stringify(params), "html", true, function(result) {
        		if(!sorin.validation.isNull(result)) {
        			$("#bdNoticeDetailModal .modal2").html('');
        			$("#bdNoticeDetailModal .modal2").html(result);
        			$('#bdNoticeDetailModal').modal();
        		}
    		});
	}
	// 공고취소 ajax
	function cancelBoBdPbln(params){
		setBidSttus('');
		$.ajax({
            url: '/bo/cancelBoBdPbln',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(params),
            dataType: 'json',
            success: function (data) {
                console.log('데이터 정상', data);
                // 삭제 처리 후 팝업 표시
                alert('공고 건이 취소되었습니다.');
                getBidNoticeList();
                modalClose();
                location.reload();
            },
            error: function (error) {
                // 에러 발생 시의 처리
                console.error('서버 요청 중 에러 발생:', error);
            }
        });
	}
	// 공고취소삭제 ajax
	function deleteBoBdPbln(params){
		setBidSttus('');
		$.ajax({
            url: '/bo/deleteBoBdPbln',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(params),
            dataType: 'json',
            success: function (data) {
                console.log('데이터 정상', data);
                // 삭제 처리 후 팝업 표시
                alert('공고 건이 삭제되었습니다.');
                getBidNoticeList();
                modalClose();
                location.reload();
            },
            error: function (error) {
                // 에러 발생 시의 처리
                console.error('서버 요청 중 에러 발생:', error);
            }
        });
	}
	// 공고취소삭제처리
	function cancleBtnClick() {
		var result;
	    var bidSttusCode = '${boBdPblnDtl.bidSttusCode}';
	    
	    var params = {
	            "bidPblancId": $("#bidPblancId").val(),     // 입찰 공고아이디 

	        }
	    // 입찰 상태에 따라 다른 메시지의 confirm 창을 표시
	    if (bidSttusCode === '12') {
	        result = confirm('해당 공고 건은 입찰 예정 건입니다.\n공고 취소 시 노출되지 않습니다.\n취소하시겠습니다.?');
	        if(result){
	        	deleteBoBdPbln(params);
	        }else {
	        	
	        }
	        
	    } else if (bidSttusCode === '13') {
	        result = confirm('해당 공고 건은 투찰 진행 중입니다.\n공고 취소 시 비활성 상태로 전환되며\n공고 취소 처리됩니다.\n공고 취소하시겠습니까?');
	        if(result){
		        cancelBoBdPbln(params);
	        }else{
	        	
	        }

	    }

	}

	// 공고유찰처리
	function failBdBtnClick() {
	    var reason = prompt('유찰할 경우, 유찰처리하기 클릭 시\n모든 과정이 무효처리됩니다. 정말로 유찰처리 하시겠습니까?.');
	    var bidSttusCode = '${boBdPblnDtl.bidSttusCode}';
	    
	    if (reason != null) {
	        var params = {
	            "bidPblancId": $("#bidPblancId").val(),        // 입찰 공고 아이디 
	            "rejectBidResn": reason                       // 유찰사유 
	        };
	        //console.log("params:>>>>>" + JSON.stringify(params));
	        console.log("params:", params);
	        $.ajax({
	            url: '/bo/failBoBdPbln',
	            method: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(params),
	            dataType: 'json',
	            success: function (data) {
	                console.log('데이터 정상', data);
	                alert('유찰 처리 되었습니다.');

	                getBidNoticeList();
	                modalClose();
	            },
	            error: function (error) {
	                // 에러 발생 시의 처리
	                console.error('서버 요청 중 에러 발생:', error);
	            }
	        });
	    } else {
	        // 사용자가 "취소"를 선택한 경우 아무 작업 없이 현재 페이지에 머무름
	    }
	}

	function modalClose() {
		clearInterval(timer);
		$('#bdNoticeDetailModal').modal('hide');
	}
	
	var bidPblancId = "${boBdPblnDtl.bidPblancId}"; // 여기에 현재 선택된 행의 bidPblancId 값을 가져오는 로직을 추가해야 합니다.
	
	function redirectToModifyPage(bidPblancId, clickedElement) {
    	
        console.log("redirectToModifyPage bidPblancId:", bidPblancId);
    	
        var modifyPageUrl = "/bo/boBdPblnDtlModify";
        var params = {
            "bidPblancId": bidPblancId
        };
        console.log("params:>>>>>" + JSON.stringify(params));
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
						<input type="hidden" value="${boBdPblnDtl.bidPblancId}" id="bidPblancId" />
						<input type="hidden" value="${boBdPblnDtl.bddprEndDt}" id="bddprEndDt" />
						<h5 class="modal-title" id="exampleModalLabel">
							입찰 공고 상세&nbsp;&nbsp;&gt;&nbsp;
							<span style="background-color: black; color: white; font-weight: normal;" class="bidPblancIdSpan">&nbsp;&nbsp;
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
										<td colspan="3">
											<!-- 입찰시작일 -->
											<fmt:parseDate value="${boBdPblnDtl.bddprBeginDt}" var="bddprBeginDt" pattern="yyyyMMddHHmmss"/>
											<fmt:formatDate value="${bddprBeginDt}" var="formattedBeginDt" pattern="yyyy.MM.dd HH:mm:ss"/>
											<!-- 입찰종료일 -->
											<fmt:parseDate value="${boBdPblnDtl.bddprEndDt}" var="bddprEndDt" pattern="yyyyMMddHHmmss"/>
											<fmt:formatDate value="${bddprEndDt}" var="formattedBndDt" pattern="yyyy.MM.dd HH:mm:ss"/>
											${formattedBeginDt}~ ${formattedBndDt}											
											<br>(
											<span class="color-blue" id="allDday">3일 5시간 0분 0초</span>)
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
													<c:if test="${boBdPblnDtl.delyCnd01ApplcAt eq 'Y'}">
														<tr>
															<td class="text-center"><b>1</b></td>
															<td>서린상사 지정 보세창고 도착도(FCA 서린상사 지정 보세창고)</td>
															<td>
																<input type="text" value="${boBdPblnDtl.delyCnd01premiumPc}" class="input" style="width: 50%; background-color: #fafafa;" readonly="readonly"> &nbsp;&nbsp; 
																<span>${boBdPblnDtl.delyCnd01StdrPc}</span>
															</td>
														</tr>
													</c:if>
													<c:if test="${boBdPblnDtl.delyCnd01ApplcAt eq 'Y'}">
														<tr>
															<td class="text-center"><b>2</b></td>
															<td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
															<td>
																<input type="text" value="${boBdPblnDtl.delyCnd02premiumPc}" class="input" style="width: 50%; background-color: #fafafa;" readonly="readonly"> &nbsp;&nbsp; 
																<span>${boBdPblnDtl.delyCnd02StdrPc}</span>
															</td>
														</tr>
													</c:if>
													<c:if test="${boBdPblnDtl.delyCnd01ApplcAt eq 'Y'}">
														<tr>
															<td class="text-center"><b>3</b></td>
															<td>CIF INCHEON / CIF BUSAN</td>
															<td>
																<input type="text" value="${boBdPblnDtl.delyCnd03premiumPc}" class="input" style="width: 50%; background-color: #fafafa;" readonly="readonly"> &nbsp;&nbsp; 
																<span>${boBdPblnDtl.delyCnd03StdrPc}</span>
															</td>
														</tr>
													</c:if>
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
										<td colspan="3">
											<!-- 인도시작일 -->
 											<fmt:parseDate value="${boBdPblnDtl.delyBeginDe}" var="delyBeginDe" pattern="yyyyMMdd"/>
											<fmt:formatDate value="${delyBeginDe}" var="formattedBeginDe" pattern="yyyy.MM.dd"/>
											<!-- 인도종료일 -->
											<fmt:parseDate value="${boBdPblnDtl.delyEndDe}" var="delyEndDe" pattern="yyyyMMdd"/>
											<fmt:formatDate value="${delyEndDe}" var="formattedBndDe" pattern="yyyy.MM.dd"/>
												${formattedBeginDe}~${formattedBndDe}
										</td>
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
											<!-- 가격지정시작일 -->
											<fmt:parseDate value="${boBdPblnDtl.pcAppnBeginDe}" var="pcAppnBeginDe" pattern="yyyyMMdd"/>
											<fmt:formatDate value="${pcAppnBeginDe}" var="formattedBeginDe" pattern="yyyy.MM.dd"/>
											<!-- 가격지정종료일 -->
											<fmt:parseDate value="${boBdPblnDtl.pcAppnEndDe}" var="pcAppnEndDe" pattern="yyyyMMdd"/>
											<fmt:formatDate value="${pcAppnEndDe}" var="formattedBndDe" pattern="yyyy.MM.dd"/>
												<td>${formattedBeginDe}~ ${formattedBndDe}</td>
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
										<td colspan="3">
											<fmt:parseDate value="${boBdPblnDtl.bddprBeginDt}" var="bddprBeginDt" pattern="yyyyMMddHHmmss"/>
											<fmt:formatDate value="${bddprBeginDt}" var="formattedBeginDe" pattern="yyyy.MM.dd. HH:mm:ss"/>
												${formattedBeginDe} 
										</td>
										<th scope="row">투찰 마감일<i class="icon icon-required"></i></th>
										<td colspan="3">
											<fmt:parseDate value="${boBdPblnDtl.bddprEndDt}" var="bddprEndDt" pattern="yyyyMMddHHmmss"/>
											<fmt:formatDate value="${bddprEndDt}" var="formattedEndDe" pattern="yyyy.MM.dd. HH:mm:ss"/>
											${formattedEndDe} 
										</td>
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
										<td colspan="7">
											<fmt:parseDate value="${boBdPblnDtl.bddprCanclLmttDe}" var="bddprCanclLmttDe" pattern="yyyyMMddHHmmss"/>
											<fmt:formatDate value="${bddprCanclLmttDe}" var="formattedLmttDe" pattern="yyyy.MM.dd HH:mm:ss"/>
											${formattedLmttDe}
										</td>
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
						<c:if test="${boBdPblnDtl.bidSttusCode ne '32'}">
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
												<td>${updateHistory.lastChangeDtString}</td>
												<td>${updateHistory.bidUpdtCn}</td>
												<td>${updateHistory.bidUpdtResn}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
						<c:if test="${boBdPblnDtl.bidSttusCode eq '32'}">
	 						<div class="sub-title">
								<h3 class="">유찰 사유 </h3>
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
											<th scope="row" colspan="1">유찰일시</th>
											<th scope="row" colspan="3">유찰 사유</th>
										</tr>
										<tr>
											<td>
												<fmt:parseDate value="${boBdPblnDtl.rejectBidResnDt}" var="rejectBidResnDt" pattern="yyyyMMddHHmmss"/>
												<fmt:formatDate value="${rejectBidResnDt}" var="formattedBidResnDt" pattern="yyyy.MM.dd HH:mm:ss"/>
												${formattedBidResnDt}
											</td>
											<%-- <td>${boBdPblnDtl.rejectBidResnDt}</td> --%>
											<td colspan="3">${boBdPblnDtl.rejectBidResn}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:if>
						<!-- 입찰 상태 코드에 따라 버튼 표시 Start -->
						<!-- 11.공고대기, 12.입찰예정,13.투찰중인 경우 -> 공구수정,취소 버튼 노출
                             20.심사중, 21.개찰중, 22.서류접수중, 23.서류심사중, 30.마감인 경우 -> 유찰 처리버튼  -->
						<div class="btn-box mt-12">
							<c:choose>
								<c:when
									test="${boBdPblnDtl.bidSttusCode eq '11' or boBdPblnDtl.bidSttusCode eq '12' or boBdPblnDtl.bidSttusCode eq '13'}">
									<button type="button" class="btn" id="updateBtn" onclick="updateBtnClick()">공고 수정</button>
									<button type="button" class="btn" id="deleteBtn" onclick="cancleBtnClick()">공고 취소</button>
								</c:when>
								<c:when
									test="${boBdPblnDtl.bidSttusCode eq '20' or boBdPblnDtl.bidSttusCode eq '21' or boBdPblnDtl.bidSttusCode eq '22' or boBdPblnDtl.bidSttusCode eq '23' or boBdPblnDtl.bidSttusCode eq '30'}">
									<button type="button" class="btn" id="failBdBtn" onclick="failBdBtnClick()"">유찰 처리</button>
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
											<td>${item.entrpsRank}</td>
											<td>${item.entrpsNm}</td>
												<fmt:parseDate value="${item.bddprDt}" var="bddprDt" pattern="yyyyMMddHHmmss"/>
												<fmt:formatDate value="${bddprDt}" var="formattedprDt" pattern="yyyy.MM.dd. HH:mm:ss"/>
											<td>${formattedprDt}</td>
											<td>${item.delyCndCnt}</td>
											<td>${item.bddprTotalPc}</td>
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