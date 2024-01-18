<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" type="text/css" href="/bo_guide/js/vakata-jstree-4a77e59/dist/themes/default/style.min.css"><!-- Folder tree -->
    <link rel="stylesheet" type="text/css" href="/bo_guide/js/bootstrap-timepicker-0.5.2/css/bootstrap-timepicker.css">
    <link rel="stylesheet" type="text/css" href="/bo_guide/css/style.css" />

    <!-- realGrid -->
    <script type="text/javascript" src="/bo_guide/js/realgrid.2.3.2/realgrid-lic.js"></script>
    <script type="text/javascript" src="/bo_guide/js/realgrid.2.3.2/realgrid.2.3.2.min.js"></script>
    <script type="text/javascript" src="/bo_guide/js/realgrid.2.3.2/libs/jszip.min.js"></script>
    <!-- //realGrid -->
    <script type="text/javascript" src="/bo_guide/js/bootstrap-4.6.0/js/dist/util.js"></script>
    <script type="text/javascript" src="/bo_guide/js/bootstrap-4.6.0/js/dist/modal.js"></script>
    <script type="text/javascript" src="/bo_guide/js/bootstrap4-datepicker-master/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="/bo_guide/js/bootstrap4-datepicker-master/js/locales/bootstrap-datepicker.ko.js"></script>
    <script type="text/javascript" src="/bo_guide/js/bootstrap-timepicker-0.5.2/js/bootstrap-timepicker.js"></script>
    <script type="text/javascript" src="/bo_guide/js/vakata-jstree-4a77e59/dist/jstree.min.js"></script><!-- Folder tree -->
    <script type="text/javascript" src="/bo_guide/js/common.js"></script><!-- 퍼블 작성 -->

</head>

<body>
    <div class="web-wrapper">
        <section class="web-container">
            <div class="main-content">
                <div class="inner">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">입찰 공고 수정</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 20px; margin-bottom: 10px;">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="/bo/boBdPblnCreateCtrl">
                            <div class="sub-title mt-0">
                                <h3 class="">공고 정보 입력(*필수)</h3>
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
                                        <th scope="row">메탈 구분<i class="icon icon-required"></i></th>
                                        <td>
                                            <select class="form-select select-sm" id="metal-select">
                                                <c:forEach var="item" items="${metalList}">
                                                    <option value="${item.subCode}"}>${item.codeDcone}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <th scope="row">브랜드<i class="icon icon-required"></i></th>
                                        <td>
                                            <div class="form-set">
                                                <select class="form-select select-sm" id="brand-group-select">
                                                    <c:forEach var="item" items="${brandGroupList}">
                                                        <c:if test="${item.mainCode eq 'BRAND_GROUP_CODE'}">
                                                            <option value="${item.subCode}">${item.codeDctwo}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                <select class="form-select" id="brand-select">
                                                    <c:forEach var="item" items="${brandList}">
                                                        <option value="${item.brandCode}">${item.brandNm}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">아이템 상품명<i class="icon icon-required"></i></th>
                                        <td>
                                            <select class="form-select" id="item-select">
                                                <c:forEach var="item" items="${itemList}">
                                                    <option value="${item.itmSn}">${item.goodsNm}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <th scope="row">권역<i class="icon icon-required"></i></th>
                                        <td>
                                            <select class="form-select" id="dstrct-lclsf-select">
                                            <c:forEach var="item" items="${boCommCdList}">
                                                <c:if test="${item.mainCode eq 'DSTRCT_LCLSF_CODE'}">
                                                    <option value="${item.subCode}">${item.codeDctwo}</option>
                                                </c:if>
                                            </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">수량 (톤)<i class="icon icon-required"></i></th>
                                        <td>
                                            <select class="form-select select-sm" id="bid-wt-select">
                                                <c:forEach var="count" begin="100" end="2000" step="100">
                                                    <option value="${count}">${count}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <th scope="row">중량허용공차(±)<i class="icon icon-required"></i></th>
                                        <td>
                                            <select class="form-select select-sm" id="perm-wt-select">
                                                <c:forEach var="count" begin="1" end="10">
                                                    <option value="${count}">${count}%</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">프리미엄 가격(USD/MT)<i class="icon icon-required"></i></th>
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
                                                        <th scope="row">선택</th>
                                                        <th scope="row">인도조건</th>
                                                        <th scope="row">프리미엄 가격 설정</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr id="dely-cnd-01">
                                                        <td class="text-center">
                                                            <input type="checkbox" class="prmu-price" checked />
                                                        </td>
                                                        <td>서린상사 지정 보세창고 도착도(FCA 서린상사 지정 보세창고)</td>
                                                        <td>
                                                            <div class="form-set">
                                                                <input type="text" class="input stdr-pc" value="0" readonly="readonly">
                                                                <select class="form-select select-sm premium-pc">
                                                                    <c:forEach var="count" begin="1000" end="3000" step="1000">
                                                                        <option value="${count}">${count}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr id="dely-cnd-02">
                                                        <td class="text-center">
                                                            <input type="checkbox" class="prmu-price" checked />
                                                        </td>
                                                        <td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
                                                        <td>
                                                            <div class="form-set">
                                                                <input type="text" class="input stdr-pc" value="10000" readonly="readonly">
                                                                <select class="form-select select-sm premium-pc">
                                                                    <c:forEach var="count" begin="1000" end="3000" step="1000">
                                                                        <option value="${count}">${count}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr id="dely-cnd-03">
                                                        <td class="text-center">
                                                            <input type="checkbox" class="prmu-price" checked />
                                                        </td>
                                                        <td>CIF INCHEON / CIF BUSAN</td>
                                                        <td>
                                                            <div class="form-set">
                                                                <input type="text" class="input stdr-pc" value="20000" readonly="readonly">
                                                                <select class="form-select select-sm premium-pc">
                                                                    <c:forEach var="count" begin="1000" end="3000" step="1000">
                                                                        <option value="${count}">${count}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </td>
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
                                                <li>기타) 부산/인천 보세창고 상차도 조건일 경우 인천지역(+USD8/MT),부산지역(+USD10/MT)을 조정하여 <u>환산 프리미엄으로 입찰 가격 적용</u></li>
                                                <li>기타) 부산/인천 보세창고 낙찰될 경우 해당 운송에 대해서는 서린상사 지정 운송업체를 통해 운송시 서린상사가 해당 금액을 포함한 <u>환산 프리미엄 가격으로 낙찰자에게 지불함</u></li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" rowspan="2">인도기한<i class="icon icon-required"></i></th>
                                        <td colspan="3">
                                            <div class="form-period-set">
                                                <div class="form-period-box">
                                                    <!-- [D] 월 선택 경우 .form-month 추가 -->
                                                    <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                                    <div class="input-group date form-date">
                                                        <input type="text" class="input" id="create-dely-begin-de" />
                                                        <label for="create-dely-begin-de" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                                    </div>
                                                    <span>~</span>
                                                    <!-- [D] 월 선택 경우 .form-month 추가 -->
                                                    <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                                    <div class="input-group date form-date">
                                                        <input type="text" class="input" id="create-dely-end-de" />
                                                        <label for="create-dely-end-de" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <input type="text" class="input" id="create-dely-pd-cn" value="" placeholder="코멘트를 입력해주세요.">
                                        </td>
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
                                        <td>
                                            <div class="form-period-set">
                                                <div class="form-period-box">
                                                    <!-- [D] 월 선택 경우 .form-month 추가 -->
                                                    <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                                    <div class="input-group date form-date">
                                                        <input type="text" class="input" id="create-pc-appn-begin-de" />
                                                        <label for="create-pc-appn-begin-de" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                                    </div>
                                                    <span>~</span>
                                                    <!-- [D] 월 선택 경우 .form-month 추가 -->
                                                    <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                                    <div class="input-group date form-date">
                                                        <input type="text" class="input" id="create-pc-appn-end-de" />
                                                        <label for="create-pc-appn-end-de" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row">
                                            가격지정방법<i class="icon icon-required"></i>
                                        </th>
                                        <td>
                                            <select class="form-select" id="create-pc-appn-mth-code">
                                                <c:forEach var="item" items="${boCommCdList}">
                                                    <c:if test="${item.mainCode eq 'PC_APPN_MTH_CODE'}">
                                                        <option value="${item.subCode}">${item.codeDctwo}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">결제 조건<i class="icon icon-required"></i></th>
                                        <td colspan="3">
                                            <div class="form-set">
                                                <select class="form-select" id="create-setle-crncy-code">
                                                    <c:forEach var="item" items="${boCommCdList}">
                                                        <c:if test="${item.mainCode eq 'SETLE_CRNCY_CODE'}">
                                                            <option value="${item.subCode}">${item.codeDctwo}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                <select class="form-select" id="create-setle-mth-code">
                                                    <c:forEach var="item" items="${boCommCdList}">
                                                        <c:if test="${item.mainCode eq 'SETLE_MTH_CODE'}">
                                                            <option value="${item.subCode}">${item.codeDctwo}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                <select class="form-select" id="create-setle-pd-code">
                                                    <c:forEach var="item" items="${boCommCdList}">
                                                        <c:if test="${item.mainCode eq 'SETLE_PD_CODE'}">
                                                            <option value="${item.subCode}">${item.codeDctwo}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기타 코멘트</th>
                                        <td colspan="3">
                                            <input type="text" class="input" id="create-etc-cn" value="" placeholder="코멘트를 입력해주세요.">
                                        </td>
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
                                        <td>
                                            <div class="form-set create-bddpr-begin-dt">
                                                <div class="input-group date form-date">
                                                    <input type="text" class="input" id="create-bddpr-begin-dt" />
                                                    <label for="create-bddpr-begin-dt" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                                </div>
                                                <select class="form-select periodOfDay" style="width:80px;">
                                                    <option value="am">am</option>
                                                    <option value="pm">pm</option>
                                                </select>
                                                <input type="number" class="input hour" min="0" max="12" value="" style="width:50px;">&nbsp;시
                                                <input type="number" class="input min" min="0" max="59" style="width:50px;">&nbsp;분
                                                <input type="number" class="input sec" min="0" max="59" style="width:50px;">&nbsp;초
                                            </div>
                                        </td>
                                        <th scope="row">투찰 마감일<i class="icon icon-required"></i></th>
                                        <td>
                                            <div class="form-set create-bddpr-end-dt">
                                                <div class="input-group date form-date">
                                                    <input type="text" class="input" id="create-bddpr-end-dt" />
                                                    <label for="create-bddpr-end-dt" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                                </div>
                                                <select class="form-select periodOfDay" style="width:80px;">
                                                    <option value="am">am</option>
                                                    <option value="pm">pm</option>
                                                </select>
                                                <input type="number" class="input hour" min="0" max="12" value="" style="width:50px;">&nbsp;시
                                                <input type="number" class="input min" min="0" max="59" style="width:50px;">&nbsp;분
                                                <input type="number" class="input sec" min="0" max="59" style="width:50px;">&nbsp;초
                                            </div>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            투찰 취소기한<i class="icon icon-required"></i>
                                            <div class="icon icon-title-tooltip tooltip" style="margin-left:1px;">
                                                    <span class="tooltiptext">
                                                        회원사가 투찰 후, 취소를 할때<br/>
                                                        설정 된 취소 기한에 따릅니다.
                                                    </span>
                                            </div>
                                        </th>
                                        <td colspan="3">
                                            <span style="font-weight: 500; font-size: 0.80rem;">투찰 취소 불가</span>&nbsp;<input type="checkbox" id="create-bddpr-cancl-poss-at" />
                                            <div class="form-set create-bddpr-cancl-dt" style="margin-top:5px;">
                                                <div class="input-group date form-date">
                                                    <input type="text" class="input" id="create-bddpr-cancl-lmtt-de" />
                                                    <label for="create-bddpr-cancl-lmtt-de" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                                </div>
                                                <select class="form-select periodOfDay" style="width:80px;">
                                                    <option value="am">am</option>
                                                    <option value="pm">pm</option>
                                                </select>
                                                <input type="number" class="input hour" min="0" max="12" value="" style="width:50px;">&nbsp;시
                                                <input type="number" class="input min" min="0" max="59" style="width:50px;">&nbsp;분
                                                <input type="number" class="input sec" min="0" max="59" style="width:50px;">&nbsp;초 까지 투찰 취소 가능함.
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="sub-title">
                                <h3 class="">FO 전시 여부</h3>
                            </div>
                            <div class="table table-view mb-12">
                                <table>
                                    <colgroup>
                                        <col class="col-lg" />
                                        <col width="*" />
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row">전시여부<i class="icon icon-required"></i></th>
                                        <td>
                                            <div class="radio-group">
                                                <div class="form-radio">
                                                    <input type="radio" id="dspy-yn-01" name="dspyYn" value="Y" checked="checked" />
                                                    <label for="dspy-yn-01"><span>활성</span></label>
                                                </div>
                                                <div class="form-radio">
                                                    <input type="radio" id="dspy-yn-02" name="dspyYn" value="N"/>
                                                    <label for="dspy-yn-02"><span>비활성</span></label>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="btn-box">
                                <button type="button" class="btn" onclick="createBdNotice()">입찰 공고 등록</button>
                    <%--                        <button type="submit" class="btn">입찰 공고 등록</button>--%>
                                <button type="button" class="btn" data-dismiss="modal">취소</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>

<script>
    function createBdNotice() {
        boBdPbln.metalCode = $('#metal-select').val();
        boBdPbln.brandGroupCode = $('#brand-group-select').val();
        boBdPbln.brandCode = $('#brand-select').val();
        boBdPbln.itm = $('#item-select').val();
        boBdPbln.dstrctLclsfCode = $('#dstrct-lclsf-select').val();
        boBdPbln.bidWt = $('#bid-wt-select').val();
        boBdPbln.permWtRate = $('#perm-wt-select').val();
        boBdPbln.delyCnd01ApplcAt = $('#dely-cnd-01 .prmu-price').is(':checked') ? 'Y' : 'N';
        boBdPbln.delyCnd01StdrPc = $('#dely-cnd-01 .stdr-pc').val();
        boBdPbln.delyCnd01premiumPc = $('#dely-cnd-01 .premium-pc').val();
        boBdPbln.delyCnd02ApplcAt = $('#dely-cnd-02 .prmu-price').is(':checked') ? 'Y' : 'N';
        boBdPbln.delyCnd02StdrPc = $('#dely-cnd-02 .stdr-pc').val();
        boBdPbln.delyCnd02premiumPc = $('#dely-cnd-02 .premium-pc').val();
        boBdPbln.delyCnd03ApplcAt = $('#dely-cnd-03 .prmu-price').is(':checked') ? 'Y' : 'N';
        boBdPbln.delyCnd03StdrPc = $('#dely-cnd-03 .stdr-pc').val();
        boBdPbln.delyCnd03premiumPc = $('#dely-cnd-03 .premium-pc').val();
        boBdPbln.delyBeginDe = $('#create-dely-begin-de').val().replaceAll('-','');
        boBdPbln.delyEndDe = $('#create-dely-end-de').val().replaceAll('-','');
        boBdPbln.delyPdCn = $('#create-dely-pd-cn').val();
        boBdPbln.pcAppnBeginDe = $('#create-pc-appn-begin-de').val().replaceAll('-','');
        boBdPbln.pcAppnEndDe = $('#create-pc-appn-end-de').val().replaceAll('-','');
        boBdPbln.pcAppnMthCode = $('#create-pc-appn-mth-code').val();
        boBdPbln.setleCrncyCode = $('#create-setle-crncy-code').val();
        boBdPbln.setleMthCode = $('#create-setle-mth-code').val();
        boBdPbln.setlePdCode = $('#create-setle-pd-code').val();
        boBdPbln.etcCn = $('#create-etc-cn').val();

        const bddprBeginDt = $('#create-bddpr-begin-dt').val();
        const bddprBeginPOD = $('.create-bddpr-begin-dt .periodOfDay').val();
        const bddprBeginH = $('.create-bddpr-begin-dt .hour').val();
        const bddprBeginM = $('.create-bddpr-begin-dt .min').val();
        const bddprBeginS = $('.create-bddpr-begin-dt .sec').val();
        boBdPbln.bddprBeginDt = formatDateTime(bddprBeginDt, bddprBeginPOD, bddprBeginH, bddprBeginM, bddprBeginS);

        const bddprEndDt = $('#create-bddpr-end-dt').val();
        const bddprEndPOD = $('.create-bddpr-end-dt .periodOfDay').val();
        const bddprEndH = $('.create-bddpr-end-dt .hour').val();
        const bddprEndM = $('.create-bddpr-end-dt .min').val();
        const bddprEndS = $('.create-bddpr-end-dt .sec').val();
        boBdPbln.bddprEndDt = formatDateTime(bddprEndDt, bddprEndPOD, bddprEndH, bddprEndM, bddprEndS);

        boBdPbln.bddprCanclPossAt = $('#create-bddpr-cancl-poss-at').is(':checked') ? 'N' : 'Y';

        const bddprCanclDt = $('#create-bddpr-cancl-lmtt-de').val();
        const bddprCanclPOD = $('.create-bddpr-cancl-dt .periodOfDay').val();
        const bddprCanclH = $('.create-bddpr-cancl-dt .hour').val();
        const bddprCanclM = $('.create-bddpr-cancl-dt .min').val();
        const bddprCanclS = $('.create-bddpr-cancl-dt .sec').val();
        boBdPbln.bddprCanclLmttDe = formatDateTime(bddprCanclDt, bddprCanclPOD, bddprCanclH, bddprCanclM, bddprCanclS);

        boBdPbln.dspyAt = $('input[name="dspyYn"]:checked').val();

        createBidNotice()
    }

    document.querySelectorAll('.create-bddpr-begin-dt input, .create-bddpr-end-dt input, .create-bddpr-cancl-dt input').forEach(function(input) {
        input.addEventListener('input', function() {
            var minValue = parseInt(this.min, 10);
            var maxValue = parseInt(this.max, 10);
            var currentValue = parseInt(this.value, 10);

            if (isNaN(currentValue) || currentValue < minValue) {
                this.value = minValue;
            } else if (currentValue > maxValue) {
                this.value = maxValue;
            }
        });
    });

    function formatDateTime(date, pod, hour, min, sec) {
        hour = pod === 'am' ? parseInt(hour) : parseInt(hour) + 12;

        hour = parseInt(hour).toString().padStart(2, '0');
        min = parseInt(min).toString().padStart(2, '0');
        sec = parseInt(sec).toString().padStart(2, '0');

        if(date === '') {
            return ''
        } else {
            return date.replaceAll('-', '') + hour + min + sec;
        }
    }

    // 입찰 공고 등록 axios 요청
    function createBidNotice() {
        const url = "/bo/boBdPblnCreate"

        postSetDataTypeBo(url, JSON.stringify(boBdPbln), "html", true, (res) => {
            alert('등록 완료되었습니다.')
            getBidNoticeList()
            modalClose()
        })
    }

    function modalClose() {
        $('#bdNoticeCreateModal').modal('hide');
    }

    $(document).ready(function(){

        bddprCanclDtCntr();

        $('#metal-select').on('change', () => {
            boBdPbln.metalCode = $('#metal-select').val()
            initModal()
        })

        $('#brand-group-select').on('change', () => {
            boBdPbln.brandGroupCode = $('#brand-group-select').val()
            initModal()
        })

        $('#create-bddpr-cancl-poss-at').change(function(){
            bddprCanclDtCntr();
        });

        function bddprCanclDtCntr() {
            var isChecked = $('#create-bddpr-cancl-poss-at').is(':checked');

            $('.create-bddpr-cancl-dt input, .create-bddpr-cancl-dt select').not('#create-bddpr-cancl-poss-at').prop('disabled', isChecked);
        }
    });

    function initModal() {
        var url = "/bo/initBdCrtModal";
        postSetDataTypeBo(url, JSON.stringify(boBdPbln), "html", true, function(result) {
            if(!sorin.validation.isNull(result)) {
                eleRedendering("#brand-group-select", result)
                eleRedendering("#brand-select", result)
                eleRedendering("#item-select", result)
            }
        });
    }

    $(
        "#create-dely-begin-de, " +
        "#create-dely-end-de, " +
        "#create-pc-appn-begin-de, " +
        "#create-pc-appn-end-de, " +
        "#create-bddpr-begin-dt, " +
        "#create-bddpr-end-dt, " +
        "#create-bddpr-cancl-lmtt-de"
    ).datepicker({
        format: "yyyy-mm-dd",
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        todayHighlight: true,
        language:"ko"
    });
</script>

