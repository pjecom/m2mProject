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
                                <c:when test="${mberDtl.bidMberSttus eq '승인대기'}">${mberDtl.entrpsNm}</c:when>
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
                            <c:if test="${mberDtl.bidMberSttus ne '승인대기'}">
                                <div style="display: flex">
                                    <c:if test="${mberDtl.bidMberSttus eq '차단'}">
                                        <button type="button" class="btn" onclick="unlockMber()">해제하기</button>
                                    </c:if>
                                    <c:if test="${mberDtl.bidMberSttus eq '정상'}">
                                        <button type="button" class="btn" onclick="intrcpMber()">차단하기</button>
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
                                        <td>${mberDtl.bidMberId}</td>
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
                                        <td>${mberDtl.vrscEntrpsNm}</td>
                                        <th scope="row">사업자등록번호</th>
                                        <c:choose>
                                            <c:when test="${mberDtl.vrscBsnmRegistNo eq ''}"><td>-</td></c:when>
                                            <c:otherwise><td>${mberDtl.vrscBsnmRegistNo}</td></c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일</th>
                                        <td>${mberDtl.vrscBidMberEmail}</td>
                                        <th scope="row">휴대전화번호</th>
                                        <td>${mberDtl.vrscMoblphonNo}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="sub-title mt-3">
                            <h3 class="">* 가입 날짜</h3>
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
                                        <th scope="row">가입접수일</th>
                                        <td><fmt:formatDate value="${mberDtl.etrConfmRequstDt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <th scope="row">
                                            가입승인일
                                            <c:if test="${mberDtl.bidMberSttus eq '차단'}">
                                                <p class="ps-text">(차단일)</p>
                                            </c:if>
                                        </th>
                                        <td>
                                            <fmt:formatDate value="${mberDtl.etrConfmProcessDt}" pattern = "yyyy-MM-dd HH:mm:ss"/>
                                            <c:if test="${mberDtl.bidMberSttus eq '차단'}">
                                                <p class="ps-text">
                                                    (<fmt:formatDate value="${mberDtl.bidMberIntrcpDt}" pattern = "yyyy-MM-dd HH:mm:ss"/>)
                                                </p>
                                            </c:if>
                                        </td>
                                        <th scope="row">상태</th>
                                        <td>${mberDtl.bidMberSttus}</td>
                                    </tr>
                                    <c:if test="${mberDtl.bidMberSttus eq '차단'}">
                                        <tr>
                                            <th scope="row">비고</th>
                                            <td colspan="5">${mberDtl.bidMberIntrcpCn}</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <c:if test="${mberDtl.bidMberSttus eq '승인대기'}">
                            <div class="btn-box mt-20">
                                <button type="button" class="btn" onclick="createBdNotice()">가입 승인</button>
                                <button type="button" class="btn" data-dismiss="modal">가입 거절</button>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>

<script>
    function closeModal() {
        $('#bd-mber-detail-modal').modal('hide');
    }
    
    function unlockMber() {
        
    }
    
    function intrcpMber() {
        
    }
</script>

