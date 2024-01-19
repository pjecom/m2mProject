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
			<div class="rt amount-list bid-amount">
				<dl class="amount-item">
					<dt class="title">정상 회원</dt>
					<dd class="desc">
						<span class="amount">6</span>
					</dd>
				</dl>
				<dl class="amount-item">
					<dt class="title">차단 회원</dt>
					<dd class="desc">
						<span class="amount">0</span>
					</dd>
				</dl>
				<dl class="amount-item">
					<dt class="title">가입승인대기</dt>
					<dd class="desc">
						<span class="amount amount-price">9</span>
					</dd>
				</dl>
			</div>
		</div>
		<!-- // 입찰 회원 대시보드 끝 -->
		<div class="tab-button templeteRegister tab-expand" id="menuList">
			<button type="button" class="btn active" id="list">입찰회원목록</button>
			<button type="button" class="btn" id="app">가입승인대기</button>
		</div>
		<script type="text/javascript">
		$(function() {
			//탭 기능
			tab(".templeteRegister", 0);
		});
		</script>
		<div class="search-control">
			<form id="searchForm" name="searchForm" action="/bo/bd/selectBidMberList" method="post" onsubmit="return false">
				<input type="hidden" id="excelYn" name="excelYn" value="N" />
				<input type="hidden" id="bidEntrpsNo2" name="bidEntrpsNo2" value="" />
				<div class="form-set">
					<span class="label">상태</span>
					<select class="form-select select-md" id="bid-mber-sttus-select">
						<option value="">전체</option>
						<c:forEach var="item" items="${boCommCdList}">
							<c:if test="${item.mainCode eq 'BID_MBER_STTUS_CODE'}">
								<option value="${item.subCode}">${item.codeDctwo}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="form-set" name="formset">
					<span class="label">검색구분</span> <select class="form-select select-md" id="srhGubun" name="srhGubun">
						<option value="">전체</option>
						<option value="entrpsNm">회사명</option>
						<option value="bsnmRegistNo">사업자번호</option>
						<option value="bidMberId">ID</option>
					</select>
				</div>
				<div class="form-set form-expand">
					<span class="label">일시</span>
					<div class="form-period-set">
						<div class="form-period-box">
							<div class="input-group date form-date">
								<input type="text" class="validate[dateRange] input" id="mber-etr-confm-requst-dt" maxlength="10"  oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');" />
								<label for="mber-etr-confm-requst-dt" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
							</div>
							<span>~</span>
							<div class="input-group date form-date">
								<input type="text" class="validate[dateRange] input" id="mber-etr-confm-process-dt" maxlength="10"  oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');" />
								<label for="mber-etr-confm-process-dt" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
							</div>
						</div>
						<div class="btn-box btn-period btnGrp2">
							<button type="button" class="btn active" id="btn_d">전체</button>
							<button type="button" class="btn " id="btn_d_0">오늘</button>
							<button type="button" class="btn" id="btn_d_7">일주일</button>
							<button type="button" class="btn " id="btn_d_30">1개월</button>
							<button type="button" class="btn" id="btn_d_180">6개월</button>
							<button type="button" class="btn" id="btn_d_365">1년</button>
							<button type="button" class="btn" id="btn_d_730">2년</button>
						</div>
					</div>
				</div>
				<div class="search-btn">
					<button type='button' id='searchBtn' class='btn btn-blue btn-search'>검색</button>
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
							<th scope="row">폰 번호</th>
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
<%--							<tr onclick="redirectToDetailPage('${vo.bidEntrpsNo}')">--%>
							<tr>
								<td align="center">${vo.rowNum}</td>
								<td>${vo.entrpsNm}</td>
								<td>${vo.bidMberId}</td>
								<td>${vo.bsnmRegistNo}</td>
								<td>${vo.bidMberEmail}</td>
								<td>${vo.moblphonNo2}</td>
								<c:choose>
									<c:when test="${vo.frntnEntrpsAt eq 'Y'}"><td align="center">O</td></c:when>
									<c:when test="${vo.frntnEntrpsAt eq 'N'}"><td align="center">-</td></c:when>
									<c:otherwise><td></td></c:otherwise>
								</c:choose>
								<td>${vo.etrConfmRequstDt}</td>
								<td>${vo.etrConfmProcessDt}</td>
								<td>${vo.bidMberIntrcpDt}</td>
								<td>${vo.bdScsCnt}</td>
								<td>${vo.bdfailCnt}</td>
								<td>${vo.bidMberSttus}</td>
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
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full" role="document">
		<div class="modal-content"></div>
	</div>
</div>

<script type="text/javascript" src="/js/jquery.validationEngine.js"></script>
<script type="text/javascript" src="/js/jquery.validationEngine-ko.js"></script>
