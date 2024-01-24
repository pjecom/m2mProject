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

<style>
    .ps-text {
        color: #aaa;
    }
    .ml-3 {
        margin-left: 3px;
    }
</style>

<body>
    <div class="web-wrapper">
        <section class="web-container">
            <div class="main-content">
                <div class="inner">
                    <div class="modal-header">
                        <h5 class="modal-title" id="bd-mber-detail-modal-label">
                            <c:choose>
                                <c:when test="${mberDtl.bidMberSttusCode eq '03'}">${mberDtl.entrpsNm} ( ${mberDtl.bidConfmSttus} )</c:when>
                                <c:otherwise>회원 관리 > ${mberDtl.entrpsNm}</c:otherwise>
                            </c:choose>
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 20px; margin-bottom: 10px;">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="sub-title mt-3">
                            <h3 class="">* 회사 기본 정보</h3>
                            <c:if test="${mberDtl.bidMberSttusCode ne '03'}">
                                <div style="display: flex">
                                    <c:if test="${mberDtl.bidMberSttusCode eq '02'}">
                                        <button type="button" class="btn" onclick="unlockMber('${mberDtl.bidEntrpsNo}')">해제하기</button>
                                    </c:if>
                                    <c:if test="${mberDtl.bidMberSttusCode eq '01'}">
                                        <button type="button" class="btn" onclick="intrcpMber('${mberDtl.bidEntrpsNo}')">차단하기</button>
                                    </c:if>
                                    <button type="button" class="btn ml-3" onclick="closeModal()">목록</button>
                                </div>
                            </c:if>
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
                                        <th scope="row">ID</th>
                                        <td>${mberDtl.bidEntrpsNo}</td>
                                        <th scope="row">PW</th>
                                        <td>*********</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기업명</th>
                                        <td>${mberDtl.entrpsNm}</td>
                                        <th scope="row">외국기업유무</th>
                                        <c:choose>
                                            <c:when test="${mberDtl.frntnEntrpsAt eq 'Y'}"><td>O</td></c:when>
                                            <c:when test="${mberDtl.frntnEntrpsAt eq 'N'}"><td>-</td></c:when>
                                            <c:otherwise><td></td></c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row">사업자등록번호</th>
                                        <c:choose>
                                            <c:when test="${mberDtl.bsnmRegistNo eq ''}"><td>-</td></c:when>
                                            <c:otherwise><td>${mberDtl.bsnmRegistNo}</td></c:otherwise>
                                        </c:choose>
                                        <th scope="row">아이디</th>
                                        <td>${mberDtl.bidMberId}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일</th>
                                        <td>${mberDtl.bidMberEmail}</td>
                                        <th scope="row">휴대전화번호</th>
                                        <td>${mberDtl.moblphonNo2}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="sub-title mt-3">
                            <h3 class="">* 입찰 대리 정보</h3>
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
                                        <th scope="row">기업명</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${mberDtl.vrscEntrpsNm eq ''}">-</c:when>
                                                <c:otherwise>${mberDtl.vrscEntrpsNm}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <th scope="row">사업자등록번호</th>
                                        <c:choose>
                                            <c:when test="${mberDtl.vrscBsnmRegistNo eq ''}"><td>-</td></c:when>
                                            <c:otherwise><td>${mberDtl.vrscBsnmRegistNo}</td></c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${mberDtl.vrscBidMberEmail eq ''}">-</c:when>
                                                <c:otherwise>${mberDtl.vrscBidMberEmail}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <th scope="row">휴대전화번호</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${mberDtl.vrscMoblphonNo eq ''}">-</c:when>
                                                <c:otherwise>${mberDtl.vrscMoblphonNo}</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="sub-title mt-3">
                            <h3 class="">
                                <c:choose>
                                    <c:when test="${mberDtl.bidMberSttusCode eq '03'}">* 가입 승인 요청</c:when>
                                    <c:otherwise>* 가입 날짜</c:otherwise>
                                </c:choose>
                            </h3>
                        </div>
                        <div class="table table-view">
                            <table>
                                <colgroup>
                                    <col class="col-md" />
                                    <col width="*" />
                                    <col class="col-md" />
                                    <col width="*" />
                                    <col class="col-md" />
                                    <col width="100" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">가입 접수일</th>
                                        <td><fmt:formatDate value="${mberDtl.etrConfmRequstDt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <th scope="row">
                                            <c:choose>
                                                <c:when test="${mberDtl.bidConfmSttusCode eq '02'}">
                                                    가입불가처리일
                                                </c:when>
                                                <c:otherwise>
                                                    가입 승인일
                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${mberDtl.bidMberSttusCode eq '02'}">
                                                <p class="ps-text">(차단일)</p>
                                            </c:if>
                                        </th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${mberDtl.etrConfmProcessDt eq ''}">-</c:when>
                                                <c:otherwise><fmt:formatDate value="${mberDtl.etrConfmProcessDt}" pattern = "yyyy-MM-dd HH:mm:ss"/></c:otherwise>
                                            </c:choose>
                                            <c:if test="${mberDtl.bidMberSttusCode eq '02'}">
                                                <p class="ps-text">
                                                    (<fmt:formatDate value="${mberDtl.bidMberIntrcpDt}" pattern = "yyyy-MM-dd HH:mm:ss"/>)
                                                </p>
                                            </c:if>
                                        </td>
                                        <th scope="row">상태</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${mberDtl.bidMberSttusCode eq '03'}">
                                                    ${mberDtl.bidConfmSttus}
                                                </c:when>
                                                <c:otherwise>
                                                    ${mberDtl.bidMberSttus}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <c:if test="${mberDtl.bidMberSttusCode eq '03'}">
                            <div class="btn-box mt-20">
                                <c:choose>
                                    <c:when test="${mberDtl.bidConfmSttusCode ne '02'}">
                                        <button type="button" class="btn" onclick="confmMber('${mberDtl.bidEntrpsNo}')">가입 승인</button>
                                        <button type="button" class="btn" onclick="rejectMber('${mberDtl.bidEntrpsNo}')">가입 거절</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" class="btn" onclick="closeModal()">확인</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>

    <%--    <div class="popup modal confirm" id="mber-func-confm" style="z-index:9998">--%>
    <%--        <div class="modal-content w490px">--%>
    <%--            <div class="modal-header">--%>
    <%--                <h1>알림메세지</h1>--%>
    <%--            </div>--%>
    <%--            <div class="max-width">--%>
    <%--                <div class="alert-con">confirm text</div>--%>
    <%--            </div>--%>
    <%--            <div class="modal-btns">--%>
    <%--                <button type="button" class="btn-gray-big modal-cancel">취소</button>--%>
    <%--                <button type="button" class="btn-blue-big modal-ok">차단</button>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    </div>
</body>

<script>
    function unlockMber(bidEntrpsNo) {
        var url = "/boMber/unlockMber";
        var params = {
            "bidEntrpsNo": bidEntrpsNo
        };

        postSetDataTypeBo(url, JSON.stringify(params), "html", true, (res) => {
            if(JSON.parse(res)) {
                alert('해제되었습니다.')
                redirectToDetailPage(bidEntrpsNo)
                reloadList();
            }
        })
    }

    function intrcpMber(bidEntrpsNo) {
        var url = "/boMber/beforeIntrcpMber";
        var params = {
            "bidEntrpsNo": bidEntrpsNo
        };

        postSetDataTypeBo(url, JSON.stringify(params), "html", true, (res) => {
            if (JSON.parse(res)) {
                var result = confirm('해당사를 차단하시겠습니까?\n차단 시 차단 시점부터\n입찰 참여가 불가능해집니다.');
                if (result) {
                    var url = "/boMber/intrcpMber";
                    var params = {
                        "bidEntrpsNo": bidEntrpsNo
                    };

                    postSetDataTypeBo(url, JSON.stringify(params), "html", true, (res) => {
                        if(JSON.parse(res)) {
                            alert('차단되었습니다.')
                            redirectToDetailPage(bidEntrpsNo)
                            reloadList();
                        }
                    });
                } else {
                    return
                }
            } else {
                alert('해당사는 입찰 진행 중 건이 있습니다.' +
                    '\n입찰 중이거나, 마감 후 심사중인 경우\n는 차단이 불가능합니다.')
            }
        })
    }

    function rejectMber(bidEntrpsNo) {
        var url = "/boMber/rejectMber";
        var params = {
            "bidEntrpsNo": bidEntrpsNo
        };

        postSetDataTypeBo(url, JSON.stringify(params), "html", true, (res) => {
            if(JSON.parse(res)) {
                alert('가입 거절 처리 되었습니다.')
                redirectToDetailPage(bidEntrpsNo)
                reloadList();
            }
        })
    }

    function confmMber(bidEntrpsNo) {
        var url = "/boMber/confmMber";
        var params = {
            "bidEntrpsNo": bidEntrpsNo
        };

        postSetDataTypeBo(url, JSON.stringify(params), "html", true, (res) => {
            if(JSON.parse(res)) {
                alert('승인 되었습니다.')
                bdMberVO = {
                    "bidMberSttusCode" : '01'
                }
                closeModal()
                getBidMberList()
            }
        })
    }

    function reloadList() {
        postSetDataTypeBo("/boMber/mberMng", JSON.stringify(bdMberVO), "html", true, (res) => {
            if (!sorin.validation.isNull(res)) {
                eleRedendering("#bid-mber-amount", res)
                eleRedendering("#realgrid", res)
            }
        })
    }
</script>

