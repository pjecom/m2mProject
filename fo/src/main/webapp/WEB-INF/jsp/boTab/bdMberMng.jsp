<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<body>
	<div class="web-wrapper">
		<section class="web-container">
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
			<button type="button" class="btn active"  id = "list">입찰회원목록</button>
			<button type="button" class="btn" id = "app">가입승인대기</button>
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
					<select class="form-select select-md" id="bidMberSttusCode" name="bidMberSttusCode">
						<option value="">전체</option>
						
							<option value="01">OK
							</option>
						
							<option value="02">Blocked
							</option>
						
							<option value="03">Awaiting Approval
							</option>
						
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
								<input type="text" class="validate[dateRange] input" id="datepicker1" maxlength="10"  oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');" />
								<label for="datepicker1" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
							</div>
							<span>~</span>
							<div class="input-group date form-date">
								<input type="text" class="validate[dateRange] input" id="datepicker2" maxlength="10"  oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');" />
								<label for="datepicker2" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
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
		<div id="realgrid" class="realgrid-wrap"></div>
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
<script>

</script>

<!-- realgridCommon.js 선언 (필수) -->
		</section>
	</div>
</body>

