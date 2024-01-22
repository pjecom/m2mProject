<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<style>
	.multiline-editor {
		white-space: pre;
	}

	.bid-amount {
		background-color: #fff;
	}

	.search-control {
		margin-top: 10px;
	}
</style>

<div class="main-content">
	<div class="inner">
		<!-- 입찰 회원 대시보드 시작 -->
		<div class="main-title">
			<h2 class="lt">입찰 회원 관리</h2>
			<div class="rt amount-list bid-amount" id="bid-mber-amount">
				<dl class="amount-item">
					<dt class="title">정상 회원</dt>
					<dd class="desc">
						<span class="amount">
							<c:out value="${
								boCommCdList.stream()
											.filter(item -> item.mainCode eq 'BID_MBER_STTUS_CODE' && item.subCode eq '01')
											.map(item -> item.codeLt).findFirst().orElse('')}"
							/>
						</span>
					</dd>
				</dl>
				<dl class="amount-item">
					<dt class="title">차단 회원</dt>
					<dd class="desc">
						<span class="amount">
							<c:out value="${
								boCommCdList.stream()
											.filter(item -> item.mainCode eq 'BID_MBER_STTUS_CODE' && item.subCode eq '02')
											.map(item -> item.codeLt).findFirst().orElse('')}"
							/>
						</span>
					</dd>
				</dl>
				<dl class="amount-item">
					<dt class="title">가입승인대기</dt>
					<dd class="desc">
						<span class="amount amount-price">
							<c:out value="${
								boCommCdList.stream()
											.filter(item -> item.mainCode eq 'BID_MBER_STTUS_CODE' && item.subCode eq '03')
											.map(item -> item.codeLt).findFirst().orElse('')}"
							/>
						</span>
					</dd>
				</dl>
			</div>
		</div>
		<!-- // 입찰 회원 대시보드 끝 -->
		<div class="tab-button templeteRegister tab-expand" id="menuList">
			<button type="button" class="btn active" id="m" onclick="setBidSttus('')">입찰회원목록</button>
			<button type="button" class="btn" onclick="setBidSttus('03')">가입승인대기</button>
		</div>
		<script type="text/javascript">
		$(function() {
			//탭 기능
			tab(".templeteRegister", 0);
		});
		</script>
		<div class="search-control" id="bid-mber-search-form">
			<form id="searchForm" name="searchForm" action="/bo/bd/selectBidMberList" method="post" onsubmit="return false">
				<div class="form-set">
					<span class="label">상태</span>
					<select class="form-select select-md" id="bid-mber-sttus-select">
						<option value="" selected>전체</option>
						<c:forEach var="item" items="${boCommCdList}">
							<c:if test="${item.mainCode eq 'BID_MBER_STTUS_CODE'}">
								<option value="${item.subCode}"
									<c:if test='${item.subCode eq mberVO.bidMberSttusCode}'>
										selected
									</c:if>
								>${item.codeDctwo}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="form-set" name="formset">
					<span class="label">검색구분</span>
					<select class="form-select select-md" id="bid-mber-sch-gubun">
						<option value="" selected>전체</option>
						<option value="entrpsNm"
							<c:if test='${"entrpsNm" eq mberVO.schGubun}'>
								selected
							</c:if>
						>회사명</option>
						<option value="bsnmRegistNo"
							<c:if test='${"bsnmRegistNo" eq mberVO.schGubun}'>
								selected
							</c:if>
						>사업자번호</option>
						<option value="bidMberId"
							<c:if test='${"bidMberId" eq mberVO.schGubun}'>
								selected
							</c:if>
						>ID</option>
					</select>
					<input type="text" class="input" id="bid-mber-sch-data" value="${mberVO.schData}">
				</div>
				<div class="form-set form-expand">
					<span class="label">일시</span>
					<div class="form-period-set">
						<div class="form-period-box">
							<div class="input-group date form-date">
								<input type="text" class="validate[dateRange] input" id="mber-etr-confm-requst-dt" value='<fmt:formatDate value="${mberVO.etrConfmRequstDt}" pattern="yyyy-MM-dd"/>' maxlength="10"  oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');" />
								<label for="mber-etr-confm-requst-dt" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
							</div>
							<span>~</span>
							<div class="input-group date form-date">
								<input type="text" class="validate[dateRange] input" id="mber-etr-confm-process-dt" value='<fmt:formatDate value="${mberVO.etrConfmProcessDt}" pattern="yyyy-MM-dd"/>' maxlength="10"  oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');" />
								<label for="mber-etr-confm-process-dt" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
							</div>
						</div>
						<div class="btn-box btn-period btnGrp2">
							<button type="button" class="btn set-date-picker" onclick="getFormerDate(0, 0, this)">오늘</button>
							<button type="button" class="btn set-date-picker" onclick="getFormerDate(7, 0, this)">일주일</button>
							<button type="button" class="btn set-date-picker" onclick="getFormerDate(30, 0, this)">1개월</button>
							<button type="button" class="btn set-date-picker" onclick="getFormerDate(180, 0, this)">6개월</button>
							<button type="button" class="btn set-date-picker" onclick="getFormerDate(365, 0, this)">1년</button>
							<button type="button" class="btn set-date-picker" onclick="getFormerDate(730, 0, this)">2년</button>
						</div>
					</div>
				</div>
				<div class="search-btn">
					<button type="button" class="btn btn-blue" onclick="searchFunc()">검색</button>
				</div>
			</form>
		</div>
		<div id="realgrid" class="realgrid-wrap">
			<div class="table table-list">
				<table>
					<colgroup>
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
						<col width="*">
					</colgroup>
					<thead>
						<tr>
							<th scope="row">순번</th>
							<th scope="row">기업명</th>
							<th scope="row">ID</th>
							<th scope="col">사업자번호</th>
							<th scope="row">이메일</th>
							<th scope="row">휴대전화번호</th>
							<th scope="row">외국기업유무</th>
							<th scope="row">승인요청일</th>
							<th scope="row">승인처리일</th>
							<th scope="row">차단일</th>
							<th scope="row">낙찰건수</th>
							<th scope="row">패찰건수</th>
							<th scope="row">상태</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${mberList.size() == 0 }">
						<tr>
							<td colspan="15" align="center">
								<img class="mt-8" src="/bo_images/error/prohibit.png" alt="noMber"/>
								<h5 class="mt-8 mb-4">입찰 회원이 존재하지 않습니다.</h5>
							</td>
						</tr>
					</c:if>
					<c:if test="${mberList.size() != 0}">
						<c:forEach var="vo" items="${mberList}">
							<tr onclick="redirectToDetailPage('${vo.bidEntrpsNo}')">
								<td align="center">${vo.rowNum}</td>
								<td>${vo.entrpsNm}</td>
								<td>${vo.bidMberId}</td>
								<c:choose>
									<c:when test="${vo.bsnmRegistNo eq ''}"><td align="center">-</td></c:when>
									<c:otherwise><td>${vo.bsnmRegistNo}</td></c:otherwise>
								</c:choose>
								<td>${vo.bidMberEmail}</td>
								<td>${vo.moblphonNo2}
								</td>
								<c:choose>
									<c:when test="${vo.frntnEntrpsAt eq 'Y'}"><td align="center">O</td></c:when>
									<c:when test="${vo.frntnEntrpsAt eq 'N'}"><td align="center">-</td></c:when>
									<c:otherwise><td></td></c:otherwise>
								</c:choose>
								<td><fmt:formatDate value="${vo.etrConfmRequstDt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${vo.etrConfmProcessDt}" pattern = "yyyy-MM-dd HH:mm:ss"/></td>
								<td><fmt:formatDate value="${vo.bidMberIntrcpDt}" pattern = "yyyy-MM-dd HH:mm:ss"/></td>
								<td>${vo.bdScsCnt}</td>
								<td>${vo.bdfailCnt}</td>
								<td>
									<c:choose>
										<c:when test="${vo.bidMberSttus eq '승인대기'}">${vo.bidConfmSttus}</c:when>
										<c:otherwise>${vo.bidMberSttus}</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="paging-row">
			<div class="paging">
				<div id="mberListPaging"></div>
			</div>
		</div>
		<div id="realgridForExcel" class="realgrid-wrap" style="display: none"></div>
	</div>
</div>
<%--<!-- 입찰 회원 상세 -->--%>
<div class="modal fade" id="bd-mber-detail-modal" tabindex="-1" role="dialog" data-keyboard="false" aria-labelledby="bd-mber-detail-modal-label" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full" role="document">
		<div class="modal-content modal2">
		</div>
	</div>
</div>

<script type="text/javascript" src="/js/jquery.validationEngine.js"></script>
<script type="text/javascript" src="/js/jquery.validationEngine-ko.js"></script>

<script>
	let bdMberVO = {
		bidMberSttusCode: null,
		schGubun: null,
		schData: null,
		etrConfmRequstDt: null,
		etrConfmProcessDt: null
	}

	function searchFunc() {
		$("#bid-mber-search-form").each(function() {
			bdMberVO = {
				"bidMberSttusCode" : ($(this).find("#bid-mber-sttus-select").val()),
				"schGubun": ($(this).find("#bid-mber-sch-gubun").val()),
				"schData": ($(this).find("#bid-mber-sch-data").val()),
				"etrConfmRequstDt" : ($(this).find("#mber-etr-confm-requst-dt").val()),
				"etrConfmProcessDt": ($(this).find("#mber-etr-confm-process-dt").val())
			}
		})

		getBidMberList()
	}
	
	function getBidMberList() {
		const url = "/boMber/mberMng"

		postSetDataTypeBo(url, JSON.stringify(bdMberVO), "html", true, (res) => {
			eleRedendering("#bid-mber-sttus-select", res)
			eleRedendering("#bid-mber-amount", res)
			eleRedendering("#bid-mber-sch-gubun", res)
			inputRedendering("#bid-mber-sch-data", res)
			inputRedendering("#mber-etr-confm-requst-dt", res)
			inputRedendering("#mber-etr-confm-process-dt", res)
			eleRedendering("#realgrid", res)

			if (bdMberVO.bidMberSttusCode === '03') {
				$('.templeteRegister button:eq(0)').removeClass("active");
				$('.templeteRegister button:eq(1)').addClass("active");
				$('#bid-mber-sttus-select').attr("disabled", true)
			} else {
				$('.templeteRegister button:eq(1)').removeClass("active");
				$('.templeteRegister button:eq(0)').addClass("active");
				$('#bid-mber-sttus-select').attr("disabled", false)
			}
		})
	}

	function setBidSttus(data) {
		bdMberVO = {
			"bidMberSttusCode" : data
		}

		getBidMberList()
	}

	// Data 변경 시 rerendering
	function inputRedendering(elementNm, res) {
		const element = $(elementNm)

		element.val('');
		element.val($(res).find(elementNm).val());
	}

	// Data 변경 시 rerendering
	function eleRedendering(elementNm, res) {
		const element = $(elementNm)

		element.html('');
		element.html($(res).find(elementNm).html());
	}

	// 날짜 자동 선택
	function getFormerDate(num1, num2, button) {
		$(".set-date-picker").removeClass("active")
		$(button).addClass("active")

		var today = new Date();

		const beginDt = new Date(today.getFullYear(), today.getMonth(), today.getDate() - num1)
		const endDt = new Date(today.getFullYear(), today.getMonth(), today.getDate() - num2)
		$("#mber-etr-confm-requst-dt").val(dateFormat(beginDt));
		$("#mber-etr-confm-process-dt").val(dateFormat(endDt));
	}

	$("#mber-etr-confm-requst-dt, #mber-etr-confm-process-dt").datepicker({
		format: "yyyy-mm-dd",
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		todayHighlight: true,
		language:"ko"
	});

	function dateFormat(date) {
		const year = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-based
		const day = String(date.getDate()).padStart(2, '0');

		return year + "-" + month + "-" + day
	}

    function redirectToDetailPage(bidEntrpsNo) {
        var url = "/boMber/mberDtlModal";
        var params = {
            "bidEntrpsNo": bidEntrpsNo
        };

		postSetDataTypeBo(url, JSON.stringify(params), "html", true, (res) => {
			if (!sorin.validation.isNull(res)) {
				$("#bd-mber-detail-modal .modal2").html(res);
				$('#bd-mber-detail-modal').modal('show');
			}
		})
    }

	function closeModal() {
		$('#bd-mber-detail-modal').modal('hide');
	}
</script>
