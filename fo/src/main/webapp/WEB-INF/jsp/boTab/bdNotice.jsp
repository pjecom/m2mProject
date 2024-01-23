<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script>
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
                    
                    var endDt = $("#bddprEndDt").val();
    				var formatEndDt = formatDate(endDt);
    				countDownTimer('allDday', formatEndDt);
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
</script>
<div class="main-content">
    <div class="inner">
        <div class="main-title">
            <h2>입찰 공고 관리</h2>
        </div>

        <!-- 대시 보드 -->
        <div class="dashboard2-column">
            <section class="dashboard2">
                <div class="main-title">
                    <h2 class="dashboard2-title"></h2>
                    <button type="button" class="btn" onclick="openBdCreateModal()">입찰 공고 등록</button>
                </div>
                <div class="amount-list row" id="bid-notice-amount">
                    <div class="amount-item">
                        <p class="title">전체 등록 공고 건</p>
                        <p class="desc"><span class="amount">${totalCntByBidSttus.get("10")}</span></p>
                    </div>
                    <div class="amount-item">
                        <p class="title">입찰 예정</p>
                        <p class="desc"><span class="amount">${totalCntByBidSttus.get("12")}</span></p>
                    </div>
                    <div class="amount-item">
                        <p class="title">입찰 중</p>
                        <p class="desc"><span class="amount">${totalCntByBidSttus.get("13")}</span></p>
                    </div>
                    <div class="amount-item">
                        <p class="title">입찰 마감</p>
                        <p class="desc"><span class="amount">${totalCntByBidSttus.get("30")}</span></p>
                    </div>
                </div>
            </section>
        </div>
        <!-- 대시 보드 -->

        <!-- 검색 구역 -->
        <div class="search-control mt-24" id="bid-notice-search-form">

            <div class="form-set">
                <span class="label">상태</span>
                <select class="form-select" id="bid-sub-code-select">
                    <option value="">전체</option>
                    <c:forEach var="vo" items="${bidSttusList}">
                        <option value="${vo.subCode}"
                            <c:if test="${vo.subCode eq BdPblnVO.bidSttusCode}">
                                selected
                            </c:if>
                        >${vo.codeDctwo}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-set">
                <span class="label">입찰 공고 번호</span>
                <input type="text" class="input" id="bid-pblanc-id" value="${BdPblnVO.bidPblancId}">
            </div>

            <div class="form-set form-expand">
                <span class="label">일시</span>
                <div class="form-period-set">
                    <div class="form-period-box">
                        <!-- [D] 월 선택 경우 .form-month 추가 -->
                        <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                        <div class="input-group date form-date">
                            <input type="text" class="input" id="list-bddpr-begin-dt" value="${BdPblnVO.bddprBeginDt}"/>
                            <label for="list-bddpr-begin-dt" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                        </div>
                        <span>~</span>
                        <!-- [D] 월 선택 경우 .form-month 추가 -->
                        <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                        <div class="input-group date form-date">
                            <input type="text" class="input" id="list-bddpr-end-dt" value="${BdPblnVO.bddprEndDt}"/>
                            <label for="list-bddpr-end-dt" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                        </div>
                    </div>
                    <div class="btn-box btn-period">
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
                <div class="btn-box">
                    <button type="button" class="btn btn-blue" onclick="searchFunc()">검색</button>
                    <button type="button" class="btn btn-blue" onclick="returnBeforeSearch()">검색이전</button>
                </div>
            </div>
        </div>
        <!-- 검색 구역 -->

        <!-- 상태 전환 탭 -->
        <div class="table-control">
            <div class="form-set">
                <div class="tab-button" id="bid-sttus-tab-div">
                    <a class="btn bid-sttus-tab active" id="bid-sttus-tab-" onclick="setBidSttus('')">전체(${cntByBidSttus["10"]})</a>
                    <c:forEach var="vo" items="${bidSttusList}">
                        <c:if test="${vo.subCode ne '10'}">
                            <a class="btn bid-sttus-tab" id="bid-sttus-tab-${vo.subCode}" onclick="setBidSttus(${vo.subCode})">${vo.codeDctwo}(${cntByBidSttus[vo.subCode]})</a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- 상태 전환 탭 -->

        <!-- 입찰 공고 목록 테이블 -->
        <div id="realgrid" class="realgrid-wrap mt-24">
            <div class="table table-list table-responsive">
                <table class="table">
                    <colgroup>
                        <col width="130">
                        <col width="110">
                        <col width="250">
                        <col width="90">
                        <col width="150">
                        <col width="80">
                        <col width="80">
                        <col width="80">
                        <col width="280">
                        <col width="90">
                        <col width="170">
                        <col width="150">
                        <col width="90">
                        <col width="150">
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
                                    <fmt:formatDate value="${vo.frstRegistDt}" pattern="yyyy-MM-dd HH:mm:ss" var="frstRegistDt"/>
                                    <td>${frstRegistDt}<br/>(${vo.frstRegisterId})</td>
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
        <!-- 입찰 공고 목록 테이블 -->

        <!-- paging -->
        <div class="paging-row">
            <div class="paging">
                <div id="paging">
                </div>
            </div>
        </div>
</div>

<%--<!-- 입찰 공고 상세 모달 -->--%>
<div class="modal fade" id="bdNoticeDetailModal" tabindex="-1" role="dialog" data-keyboard="false" aria-labelledby="bdNoticeDetailModallLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full" role="document">
        <div class="modal-content modal2">
        </div>
    </div>
</div>

<%--<!-- 입찰 공고 등록 모달 -->--%>
<div class="modal fade" id="bdNoticeCreateModal" tabindex="-1" role="dialog" data-keyboard="false" aria-labelledby="bdNoticeCreateModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full" role="document">
        <div class="modal-content modal2">
        </div>
    </div>
</div>

<script>
    // 검색 이전 항목
    let tempBdBidBas = { }

    // 검색 항목
    let bdBidBas = {
        bidSttusCode: '',
        bidPblancId: '',
        bddprBeginDt: '',
        bddprEndDt: ''
    }

    // 입찰 공고 목록 axios 요청
    function getBidNoticeList() {
        const url = "/bo/bidNotice"

        postSetDataTypeBo(url, JSON.stringify(bdBidBas), "html", true, (res) => {
            eleRedendering("#bid-sttus-tab-div", res)
            eleRedendering("#bid-sub-code-select", res)
            eleRedendering("#bid-notice-amount", res)
            inputRedendering("#bid-pblanc-id", res)
            inputRedendering("#list-bddpr-begin-dt", res)
            inputRedendering("#list-bddpr-end-dt", res)
            eleRedendering("#realgrid", res)

            $(".bid-sttus-tab").removeClass("active")
            $("#bid-sttus-tab-" + bdBidBas.bidSttusCode).addClass("active")
        })
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
        $("#list-bddpr-begin-dt").val(dateFormat(beginDt));
        $("#list-bddpr-end-dt").val(dateFormat(endDt));
    }

    $("#list-bddpr-begin-dt, #list-bddpr-end-dt").datepicker({
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

    function setBidSttus(code) {
        bdBidBas.bidSttusCode = code

        getBidNoticeList()
    }

    function searchFunc() {
        tempBdBidBas = {...bdBidBas};

        $("#bid-notice-search-form").each(function() {
            bdBidBas.bidSttusCode = ($(this).find("#bid-sub-code-select").val())
            bdBidBas.bidPblancId = ($(this).find("#bid-pblanc-id").val())
            bdBidBas.bddprBeginDt = ($(this).find("#list-bddpr-begin-dt").val())
            bdBidBas.bddprEndDt = ($(this).find("#list-bddpr-end-dt").val())
        })

        getBidNoticeList()
    }

    function returnBeforeSearch() {
        bdBidBas = {...tempBdBidBas};

        getBidNoticeList()
    }

    let boBdPbln = {}

    function openBdCreateModal() {
        var url = "/bo/initBdCrtModal";
        var params = {};
        postSetDataTypeBo(url, JSON.stringify(params), "html", true, function(result) {
            if(!sorin.validation.isNull(result)) {
                boBdPbln = {}
                $("#bdNoticeCreateModal .modal2").html('');
                $("#bdNoticeCreateModal .modal2").html(result);
                $('#bdNoticeCreateModal').modal('show');
            }
        });
    }

</script>
