<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script>
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

	$(function() {
	   $("#moveList").click(function() { // 목록가기 버튼 클릭 이벤트
		var params = {
		         "bidPblancId" : "TEST01-07",
		}
	      pageMove( "/boPbln/detail", JSON.stringify(params), 'application/json');
	   });
	});

	function bdNoticeDetailModalSearch(){
		var url = "/bo/boBdPblnDtlModal";
		var params = {

		};
		postSetDataTypeBo(url, JSON.stringify(params), "html", true, function(result) {
            if(!sorin.validation.isNull(result)) {
           	 $("#bdNoticeDetailModal .modal2").html('');
           	 $("#bdNoticeDetailModal .modal2").html(result);
           	 $('#bdNoticeDetailModal').modal('show');
            }
        });
	} 
    function redirectToDetailPage(bidPblancId, clickedElement) {
    	
        console.log("클릭한 행의 bidPblancId:", bidPblancId);
    	
        var detailPageUrl = "/bo/boBdPblnDtlModal";
        var params = {
            "bidPblancId": bidPblancId
        };

        $.ajax({
            type: "POST",
            url: detailPageUrl,
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
                // 클릭 이벤트 후에 언더라인 제거
            	$(clickedElement).find("td:first-child").css("text-decoration", "none");
            }
        });
	}

    // 입찰 공고 목록 axios 요청
    function getBidNoticeList() {
        const url = "/bo/bidNotice"

        postSetDataTypeBo(url, JSON.stringify(bdBidBas), "html", true, (res) => {
            updateTable($(res).find("#realgrid tbody").html())
        })
    }
	function bdNoticeDetailModalSearch() {
	    var url = "/bo/boBdPblnDtlModal";
	    var params = {}; // 필요한 경우 데이터를 추가

	    $.ajax({
	        type: "POST",
	        url: url,
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
	        }
	    });
	}

    // 입찰 공고 목록 테이블 데이터 변경
    function updateTable(htmlContent) {
        // Find the table body element
        const tbody = $("#realgrid tbody");

        // Replace the content of the table body with the new HTML
        tbody.html('');
        tbody.html(htmlContent);
    }
</script>

<div class="main-content">
    <div class="inner">
        <div class="main-title">
            <h2>입찰 공고 관리</h2>
        </div>

        <div class="dashboard2-column">
            <section class="dashboard2">
                <div class="main-title">
                    <h2 class="dashboard2-title">※ 주문 접수 현황</h2>
                    <button type="button" class="btn" data-toggle="modal" data-target="#exampleModal">입찰 공고 등록</button>
                </div>
                <div class="amount-list row">
                    <div class="amount-item">
                        <p class="title">전체 등록 공고 건</p>
                        <p class="desc"><span class="amount">56</span></p>
                    </div>
                    <div class="amount-item">
                        <p class="title">입찰 예정</p>
                        <p class="desc"><span class="amount">56</span></p>
                    </div>
                    <div class="amount-item">
                        <p class="title">입찰 중</p>
                        <p class="desc"><span class="amount">100</span></p>
                    </div>
                    <div class="amount-item">
                        <p class="title">입찰 마감</p>
                        <p class="desc"><span class="amount">2456</span></p>
                    </div>
                </div>
            </section>
        </div>

        <div class="search-control mt-24 bid-notice-search-form">
            <div class="form-set">
                <span class="label">상태</span>
                <select class="form-select" id="bid-sub-code">
                    <option value="">전체</option>
                    <c:forEach var="vo" items="${bidSttusList}">
                        <option value="${vo.subCode}">${vo.codeDctwo}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-set">
                <span class="label">입찰 공고 번호</span>
                <input type="text" class="input" id="bid-pblanc-id">
            </div>

            <div class="form-set form-expand">
                <span class="label">일시</span>
                <div class="form-period-set">
                    <div class="form-period-box">
                        <!-- [D] 월 선택 경우 .form-month 추가 -->
                        <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                        <div class="input-group date form-date">
                            <input type="text" class="input" id="datepicker1" />
                            <label for="datepicker1" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                        </div>
                        <span>~</span>
                        <!-- [D] 월 선택 경우 .form-month 추가 -->
                        <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                        <div class="input-group date form-date">
                            <input type="text" class="input" id="datepicker2" />
                            <label for="datepicker2" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                        </div>
                    </div>
                    <div class="btn-box btn-period">
                        <button type="button" class="btn set-date-picker active" onclick="getFormerDate(0, 0, this)">오늘</button>
                        <button type="button" class="btn set-date-picker" onclick="getFormerDate(7, 0, this)">일주일</button>
                        <button type="button" class="btn set-date-picker" onclick="getFormerDate(30, 0, this)">1개월</button>
                        <button type="button" class="btn set-date-picker" onclick="getFormerDate(180, 0, this)">6개월</button>
                        <button type="button" class="btn set-date-picker" onclick="getFormerDate(365, 0, this)">1년</button>
                        <button type="button" class="btn set-date-picker" onclick="getFormerDate(730, 0, this)">2년</button>
                    </div>

                    <script>
                        // 날짜 자동 선택
                        function getFormerDate(num1, num2, button) {
                            $(".set-date-picker").removeClass("active")
                            $(button).addClass("active")

                            var today = new Date();
                            $("#datepicker1").datepicker("setDate", new Date(today.getFullYear(), today.getMonth(), today.getDate() - num1).toLocaleDateString());
                            $("#datepicker2").datepicker("setDate", new Date(today.getFullYear(), today.getMonth(), today.getDate() - num2).toLocaleDateString());
                        }

                        $("#datepicker1, #datepicker2").datepicker({
                            format: "yyyy-mm-dd",
                            keyboardNavigation: false,
                            forceParse: false,
                            autoclose: true,
                            todayHighlight: true,
                            language:"ko"
                        });
                    </script>
                </div>
            </div>

            <div class="search-btn">
                <div class="btn-box">
                    <button type="button" class="btn btn-blue" onclick="searchBidNotice()">검색</button>
                    <button type="button" class="btn btn-blue">검색이전</button>
                </div>
            </div>

            <script>
                function searchBidNotice() {
                    $(".bid-notice-search-form").each(function() {
                        console.log($(this).find("#bid-sub-code").val())
                        console.log($(this).find("#bid-pblanc-id").val())
                        console.log($(this).find("#bddpr-begin-dt").val())
                        console.log($(this).find("#bddpr-end-dt").val())

                    })
                }
            </script>

        </div>

        <div class="table-control">
            <div class="form-set">
                <div class="tab-button">
                    <a class="btn bid-sttus-tab active" id="bid-sttus-tab-" onclick="setBidSttus('')">전체</a>
                    <c:forEach var="vo" items="${bidSttusList}">
                        <a class="btn bid-sttus-tab" id="bid-sttus-tab-${vo.subCode}" onclick="setBidSttus(${vo.subCode})">${vo.codeDctwo}</a>
                    </c:forEach>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function setBidSttus(code) {
                bdBidBas.bidSttusCode = code

                getBidNoticeList()
            }
        </script>

        <!-- realGrid -->
        <div id="realgrid" class="realgrid-wrap mt-24">
            <div class="table table-list">
                <table>
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
                        <col width="*">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="row" rowspan="2">입찰공고번호</th>
                            <th scope="row" rowspan="2">메탈</th>
                            <th scope="row" rowspan="2">아이템상품명</th>
                            <th scope="col" colspan="2">브랜드</th>
                            <th scope="row" rowspan="2">권역</th>
                            <th scope="row" rowspan="2">수량</th>
                            <th scope="row" rowspan="2">중량</th>
                            <th scope="row" rowspan="2">시작 ~ 마감</th>
                            <th scope="row" rowspan="2">활성여부</th>
                            <th scope="row" rowspan="2">등록일(등록자)</th>
                            <th scope="row" rowspan="2">상태</th>
                            <th scope="row" rowspan="2">투찰기업</th>
                            <th scope="row" rowspan="2">최저프리미엄가</th>
                        </tr>
                        <tr>
                            <th scope="col">구분</th>
                            <th scope="col">그룹</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${bdList.size() == 0 }">
                            <tr>
                                <td colspan="15" align="center">
                                    <img class="mt-8" src="/bo_images/error/prohibit.png" alt="Nobids"/>
                                    <h5 class="mt-8 mb-4">등록 된 입찰 목록이 존재하지 않습니다.</h5>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${bdList.size() != 0}">
                            <c:forEach var="vo" items="${bdList}">
                                <tr onclick="redirectToDetailPage('${vo.bidPblancId}')">
                                    <td>${vo.bidPblancId}</td>
                                    <td>${vo.metalName}</td>
                                    <td>${vo.itmNm}</td>
                                    <td>${vo.brandCode}</td>
                                    <td>${vo.brandGroupCodeNm}</td>
                                    <td>${vo.dstrctLclsfCode}</td>
                                    <td>${vo.bidWt}</td>
                                    <td>${vo.permWtRate}</td>
                                    <td>${vo.bddprBeginDt} ~ ${vo.bddprEndDt}</td>
                                    <c:choose>
                                        <c:when test="${vo.dspyAt eq 'Y'}"><td>활성</td></c:when>
                                        <c:when test="${vo.dspyAt eq 'N'}"><td>비활성</td></c:when>
                                        <c:otherwise><td></td></c:otherwise>
                                    </c:choose>
                                    <fmt:formatDate value="${vo.frstRegistDt}" pattern = "yyyy-MM-dd hh:mm:ss" var = "frstRegistDt"/>
                                    <td>${frstRegistDt}(${vo.frstRegisterId})</td>
                                    <td>${vo.bidSttus}</td>
                                    <td>${vo.partcptnEntrpsQy}</td>
                                    <td>${vo.minPremiumPc}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- paging -->
        <div class="paging-row">
            <div class="paging">
                <div id="paging"></div>
            </div>
        </div>

        <!-- 입찰 공고 등록 모달 -->
        <!-- 입창 공고 상세 모달 -->

</div>

<div class="modal fade" id="bdNoticeDetailModal" tabindex="-1" role="dialog" data-keyboard="false"  aria-labelledby="bdNoticeDetailModallLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full"" role="document">
        <div class="modal-content modal2">
        </div>
    </div>
