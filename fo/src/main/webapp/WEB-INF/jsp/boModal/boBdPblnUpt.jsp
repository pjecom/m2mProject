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

    <link rel="stylesheet" type="text/css" href="/bo_guide/js/vakata-jstree-4a77e59/dist/themes/default/style.min.css"><!-- Folder tree -->
    <link rel="stylesheet" type="text/css" href="/bo_guide/js/bootstrap-timepicker-0.5.2/css/bootstrap-timepicker.css">
    <link rel="stylesheet" type="text/css" href="/bo_guide/js/fullcalendar-5.7.0/lib/main.css"><!-- Full calendar -->
    <link rel="stylesheet" type="text/css" href="/bo_guide/css/style.css" />
    
    <!-- realGrid -->
    <script type="text/javascript" src="/bo_guide/js/realgrid.2.3.2/realgrid-lic.js"></script>
    <!-- script type="text/javascript" src="/bo_guide/js/realgrid.2.3.2/realgrid-utils.js"></script -->
    <script type="text/javascript" src="/bo_guide/js/realgrid.2.3.2/realgrid.2.3.2.min.js"></script> 
    <script type="text/javascript" src="/bo_guide/js/realgrid.2.3.2/libs/jszip.min.js"></script>
    <!-- //realGrid -->
    <script type="text/javascript" src="/bo_guide/js/bootstrap-4.6.0/js/dist/util.js"></script>
    <script type="text/javascript" src="/bo_guide/js/bootstrap-4.6.0/js/dist/modal.js"></script>
	<script type="text/javascript" src="/bo_guide/js/bootstrap4-datepicker-master/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="/bo_guide/js/bootstrap4-datepicker-master/js/locales/bootstrap-datepicker.ko.js"></script>
	<script type="text/javascript" src="/bo_guide/js/bootstrap-timepicker-0.5.2/js/bootstrap-timepicker.js"></script>
    <script type="text/javascript" src="/bo_guide/js/vakata-jstree-4a77e59/dist/jstree.min.js"></script><!-- Folder tree -->
    <script type="text/javascript" src="/bo_guide/js/fullcalendar-5.7.0/lib/main.js"></script><!-- Full calendar -->
    <script type="text/javascript" src="/bo_guide/js/fullcalendar-5.7.0/lib/locales/ko.js"></script><!-- Full calendar(한글) -->
    <script type="text/javascript" src="/bo_guide/js/realgridCustom.js"></script><!-- 퍼블 작성 -->
    <script type="text/javascript" src="/bo_guide/js/common.js"></script><!-- 퍼블 작성 -->
    
</head>

<body>   
    <div class="web-wrapper">
    	<section class="web-container">
        	<div class="main-content">
            	<div class="inner">
                     <!-- Modal -->
                     <!-- [D]모달 위치는 변경 하셔도 됩니다! -->
                                 <div class="modal-header">
                                     <h5 class="modal-title" id="exampleModalLabel">입찰 공고 수정</h5>
                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="modalClose()" style="margin-top: 20px; margin-bottom: 10px;">
										<span aria-hidden="true">&times;</span>
									 </button>
                                 </div>
                                 <div class="modal-body">
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
                                              <th scope="row">메탈 구분<i class="icon icon-required"  ></i></th>
                                                 <td>
                                                   <select class="form-select select-sm" id="metalCode">
                                                       <c:forEach var="item" items="${boCommCdList}">
                                                            <c:if test="${item.mainCode eq 'METAL_CODE'}">
                                                            	<option value="${item.subCode}" ${item.subCode eq boBdPblnDtl.metalCode ? 'selected' : ''}>${item.codeDcone}</option>
                                                            </c:if>
                                                       </c:forEach>
                                                    </select>
                                                 </td>
                                              <th scope="row">브랜드<i class="icon icon-required" ></i></th>
                                                    <td>
                                                        <div class="form-set">
                                                            <select class="form-select select-sm" id="brandGroupCode">
                                                             <c:forEach var="item" items="${boCommCdList}">
                                                               <c:if test="${item.mainCode eq 'BRAND_GROUP_CODE'}">
                                                                 <option value="${item.subCode}"${item.subCode eq boBdPblnDtl.brandGroupCode ? 'selected' : ''}>${item.codeDctwo}</option>
                                                               </c:if>                                                   
                                                             </c:forEach>
                                                            </select>
                                                            <<select class="form-select select-sm" id="brandCode">
                                                             <c:forEach var="item" items="${boBdBrandGrpList}">
                                                               <option value="${item.brandCode}">${item.brandNm}</option>                                                    
                                                             </c:forEach>
                                                            </select> 
                                                        </div>
                                                    </td>
                                            </tr>
                                                <tr>
                                                    <th scope="row">아이템 상품명<i class="icon icon-required" ></i></th>
                                                    <td>
                                                         <select class="form-select" id="selectItem" >
                                                            <c:forEach var="item" items="${boBdItemList}">
                                                              <option value="${item.itmSn}">${item.goodsNm}</option>                                                    
                                                            </c:forEach>
                                                         </select>
                                                    </td>
                                                    <th scope="row">권역</th>
                                                    <td>
                                                         <select class="form-select select-sm" id="dstrctLclsfCode">
                                                            <c:forEach var="item" items="${boCommCdList}">
                                                              <c:if test="${item.mainCode eq 'DSTRCT_LCLSF_CODE'}">
                                                                <option value="${item.subCode}"${item.subCode eq boBdPblnDtl.dstrctLclsfCode ? 'selected' : ''}>${item.codeDctwo}</option>
                                                              </c:if>                                                    
                                                            </c:forEach>
                                                         </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">수량 (톤)<i class="icon icon-required" id="bidWt"></i></th>
                                                   	<td>
			                                            <select class="form-select select-sm" id="bid-wt-select">
			                                                <c:forEach var="count" begin="100" end="2000" step="100">
			                                                    <option value="${count}">${count}</option>
			                                                </c:forEach>
			                                            </select>
			                                        </td>
                                                    <th scope="row">중량허용공차(±)<i class="icon icon-required" id="permWtRate"></i></th>
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
	                                                            		<th scope="row" >선택</th>
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
				                                                                <select class="form-select select-sm premium-pc" id="optionDelyCnd01premiumPc">
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
				                                                                <select class="form-select select-sm premium-pc" id="optionDelyCnd02premiumPc">
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
				                                                                <select class="form-select select-sm premium-pc" id="optionDelyCnd03premiumPc">
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
																<div class="input-group date form-date" id="delyBeginDate">
																<!-- 인도시작일 -->
 																<fmt:parseDate value="${boBdPblnDtl.delyBeginDe}" var="delyBeginDe" pattern="yyyyMMdd"/>
																<fmt:formatDate value="${delyBeginDe}" var="formattedBeginDe" pattern="yyyy-MM-dd"/> 
																	<input type="text" class="input" id="delyBeginDe" value="${formattedBeginDe}"/>
																	<label for="delyBeginDate" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
																</div>
																<span>~</span>
																<!-- [D] 월 선택 경우 .form-month 추가 -->
																<!-- [D] 날짜 선택 경우 .form-date 추가 -->
																<div class="input-group date form-date" id="delyEndDeDate">
																<!-- 인도종료일 -->
																<fmt:parseDate value="${boBdPblnDtl.delyEndDe}" var="delyEndDe" pattern="yyyyMMdd"/>
																<fmt:formatDate value="${delyEndDe}" var="formattedBndDe" pattern="yyyy-MM-dd"/>
																	<input type="text" class="input" id="delyEndDe" value="${formattedBndDe}"/>
																	<label for="delyEndDeDate" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
																</div>
															</div>
														</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                    	<input type="text" class="input" value="" placeholder="코멘트를 입력해주세요.">
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
																<div class="input-group date form-date" id="pcAppnBegindate"> 
																<!-- 가격지정시작일 -->
																<fmt:parseDate value="${boBdPblnDtl.pcAppnBeginDe}" var="pcAppnBeginDe" pattern="yyyyMMdd"/>
																<fmt:formatDate value="${pcAppnBeginDe}" var="formattedBeginDe" pattern="yyyy-MM-dd"/>
																	<input type="text" class="input" id="pcAppnBeginDe"  value="${formattedBeginDe}"/>
																	<label for="pcAppnBegindate" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
																</div>
																<span>~</span>
																<!-- [D] 월 선택 경우 .form-month 추가 -->
																<!-- [D] 날짜 선택 경우 .form-date 추가 -->
																<div class="input-group date form-date" id="pcAppnEnddate">
																<!-- 가격지정종료일 -->
																<fmt:parseDate value="${boBdPblnDtl.pcAppnEndDe}" var="pcAppnEndDe" pattern="yyyyMMdd"/>
																<fmt:formatDate value="${pcAppnEndDe}" var="formattedBndDe" pattern="yyyy-MM-dd"/> 
																	<input type="text" class="input"  id="pcAppnEndDe" value="${formattedBndDe}"/>
																	<label for="pcAppnEnddate" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
																</div>
															</div>
														</div>
                                                    </td>
                                                    <th scope="row">가격지정방법<i class="icon icon-required"></i></th>
                                                    <td>
                                                        <select class="form-select" id="pcAppnMthCode">
                                                            <c:forEach var="item" items="${boCommCdList}">
                                                              <c:if test="${item.mainCode eq 'PC_APPN_MTH_CODE'}">
                                                                <option value="${item.subCode}" ${item.subCode eq boBdPblnDtl.pcAppnMthCode ? 'selected' : ''}>${item.codeDctwo}</option>
                                                              </c:if>
                                                            </c:forEach>
                                                         </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">결제 조건<i class="icon icon-required"></i></th>
                                                    <td colspan="3">
                                                        <div class="form-set">
                                                         <select class="form-select" id="setleCrncyCode">
                                                            <c:forEach var="item" items="${boCommCdList}">
                                                              <c:if test="${item.mainCode eq 'SETLE_CRNCY_CODE'}">
                                                                <option value="${item.subCode}" ${item.subCode eq boBdPblnDtl.setleCrncyCode ? 'selected' : ''}>${item.codeDctwo}</option>
                                                              </c:if>
                                                            </c:forEach>
                                                         </select>
                                                         <select class="form-select" id="setleMthCode">
                                                            <c:forEach var="item" items="${boCommCdList}">
                                                              <c:if test="${item.mainCode eq 'SETLE_MTH_CODE'}">
                                                                <option value="${item.subCode}" ${item.subCode eq boBdPblnDtl.setleMthCode ? 'selected' : ''}>${item.codeDctwo}</option>
                                                              </c:if>
                                                            </c:forEach>
                                                         </select>
                                                         <select class="form-select" id="setlePdCode">
                                                            <c:forEach var="item" items="${boCommCdList}">
                                                              <c:if test="${item.mainCode eq 'SETLE_PD_CODE'}">
                                                               <option value="${item.subCode}" ${item.subCode eq boBdPblnDtl.setlePdCode ? 'selected' : ''}>${item.codeDctwo}</option>
                                                              </c:if>
                                                            </c:forEach>
                                                         </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">기타 코멘트</th>
                                                    <td colspan="3" id="etcCn">
                                                    <input type="text" class="input" value="${boBdPblnDtl.etcCn}" seleted placeholder="코멘트를 입력해주세요.">
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
                                                        <div class="form-set">
															<div class="input-group date form-date" id="bddprBegindate">
																<fmt:parseDate value="${boBdPblnDtl.bddprBeginDt}" var="bddprBeginDt" pattern="yyyyMMddHHmmss"/>
																<fmt:formatDate value="${bddprBeginDt}" var="formattedBeginDe" pattern="yyyy-MM-dd"/>
																<input type="text" class="input" id="bddprBegindateInput" value="${formattedBeginDe}" />
																<label for="bddprBegindate" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
															</div>
                                                            <select class="form-select" style="width:80px;" id="bddprBegindateAmPm">
                                                                <option value="am">am</option>
                                                                <option value="pm">pm</option>
                                                            </select>
                                                            
                                                    		<input type="text" class="input" value="" id="bddprBeginH" style="width:50px;" >&nbsp;시
                                                    		<input type="text" class="input" value="" id="bddprBeginM" style="width:50px;">&nbsp;분
                                                    		<input type="text" class="input" value="" id="bddprBeginS" style="width:50px;">&nbsp;초
														</div>
                                                    </td>
                                                    <th scope="row">투찰 마감일<i class="icon icon-required"></i></th>
                                                    <td>
                                                        <div class="form-set">
															<div class="input-group date form-date" id="bddprEnddate" >
																<fmt:parseDate value="${boBdPblnDtl.bddprEndDt}" var="bddprEndDt" pattern="yyyyMMddHHmmss"/>
																<fmt:formatDate value="${bddprEndDt}" var="formattedEndDe" pattern="yyyy-MM-dd"/>
																<input type="text" class="input" id="bddprEnddateInput"  value="${formattedEndDe}" />
																<label for="bddprEnddate" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
															</div>
                                                            <select class="form-select" style="width:80px;" id="bddprEnddateAmPm">
                                                                <option value="am">am</option>
                                                                <option value="pm">pm</option>
                                                            </select>
                                                    		<input type="text" class="input" value="" id="bddprEndH" style="width:50px;">&nbsp;시
                                                    		<input type="text" class="input" value="" id="bddprEndM" style="width:50px;">&nbsp;분
                                                    		<input type="text" class="input" value="" id="bddprEndS" style="width:50px;">&nbsp;초
														</div>
													</td>
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
														<span style="font-weight: 500; font-size: 0.80rem;">투찰 취소 불가</span>&nbsp;<input type="checkbox" class ="" name="" value="N" id="" />
                                                        <div class="form-set" style="margin-top:5px;">
															<div class="input-group date form-date" id="bddprCancldate" >
																<fmt:parseDate value="${boBdPblnDtl.bddprCanclLmttDe}" var="bddprCanclLmttDe" pattern="yyyyMMddHHmmss"/>
																<fmt:formatDate value="${bddprCanclLmttDe}" var="formattedLmttDe" pattern="yyyy-MM-dd"/>
																<input type="text" class="input" id="bddprCancldateInput"  value="${formattedLmttDe}" /> 
																<label for="bddprCancldate" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
															</div>
                                                            <select class="form-select" style="width:80px;" id="bddprCancldateAmPm">
                                                                <option value="am">am</option>
                                                                <option value="pm">pm</option>
                                                            </select>
                                                    		<input type="text" class="input" value="" id="bddprCanclH" style="width:50px;">&nbsp;시
                                                    		<input type="text" class="input" value="" id="bddprCanclM" style="width:50px;">&nbsp;분
                                                    		<input type="text" class="input" value="" id="bddprCanclS" style="width:50px;">&nbsp;초 까지 투찰 취소 가능함.
														</div>
                                                    </textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                 </div>
                                 <div class="modal-footer">
                                     <div class="btn-box">
                                         <button type="button" class="btn" onclick="saveBdData()">저장</button>
                                         <button type="button" class="btn" data-dismiss="modal">취소</button>
                                     </div>
                                 </div>
<!--                      <div class="btn-box btn-box-lg">
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

<script>
$("#delyBeginDate, #delyEndDeDate, #pcAppnBegindate, #pcAppnEnddate, #bddprBegindate, #bddprEnddate, #bddprCancldate").datepicker({
    format: "yyyy-mm-dd",
    keyboardNavigation: false,
    forceParse: false,
    autoclose: true,
    todayHighlight: true,
    language:"ko"
});

$(function(){
	//투찰 시작일
	var bddprBeginDt ="${boBdPblnDtl.bddprBeginDt}";
	var bddprBeginDay = bddprBeginDt.substring(0, 8);
	var bddprBeginHour = bddprBeginDt.substring(8, 10);
	var bddprBegindateAmPm = "am";
	
	if(bddprBeginHour == 12) {
		bddprBegindateAmPm = "pm";
	}
	if(bddprBeginHour > 12 ){
		bddprBegindateAmPm = "pm";
		bddprBeginHour = bddprBeginHour - 12;
	}
	var bddprBeginMinute = bddprBeginDt.substring(10, 12);	//분
	var bddprBeginSecond = bddprBeginDt.substring(12, 14);	//초
	
	$('#bddprBegindateAmPm').val(bddprBegindateAmPm);
	
	$('#bddprBeginH').val(bddprBeginHour);
	$('#bddprBeginM').val(bddprBeginMinute);
	$('#bddprBeginS').val(bddprBeginSecond);
	
	//투찰 마감일
	var bddprEndDt = "${boBdPblnDtl.bddprEndDt}";
	var bddprEndHour = bddprEndDt.substring(8, 10);
	var bddprEnddateAmPm = "am";
	
	if(bddprEndHour == 12) {
		bddprEnddateAmPm = "pm";
	}
	if(bddprEndHour > 12 ){
		bddprEnddateAmPm = "pm";
		bddprEndHour = bddprEndHour - 12;
	}
	var bddprEndMinute = bddprEndDt.substring(10, 12);	//분
	var bddprEndSecond = bddprEndDt.substring(12, 14);	//초
	
	$('#bddprEnddateAmPm').val(bddprEnddateAmPm);
	$('#bddprEndH').val(bddprEndHour);
	$('#bddprEndM').val(bddprEndMinute);
	$('#bddprEndS').val(bddprEndSecond);
	
	//투찰 취소기한
	var bddprCanclLmttDe = "${boBdPblnDtl.bddprCanclLmttDe}";
	var bddprCanclHour = bddprCanclLmttDe.substring(8, 10);
	var bddprCancldateAmPm = "am";
	
	if(bddprCanclHour == 12) {
		bddprCancldateAmPm = "pm";
	}
	if(bddprCanclHour > 12 ){
		bddprCancldateAmPm = "pm";
		bddprCanclHour = bddprCanclHour - 12;
	}
	var bddprCanclMinute = bddprCanclLmttDe.substring(10, 12);	//분
	var bddprCanclSecond = bddprCanclLmttDe.substring(12, 14);	//초
	
	$('#bddprCancldateAmPm').val(bddprCancldateAmPm);
	$('#bddprCanclH').val(bddprCanclHour);
	$('#bddprCanclM').val(bddprCanclMinute);
	$('#bddprCanclS').val(bddprCanclSecond);
});

function modalClose() {
	$('#bdNoticeDetailModal').modal('hide');
}


function saveBdData() {
	var bddprBeginH = $('#bddprBeginH').val();
	var bddprBegindateAmPm = $('#bddprBegindateAmPm').val();
	var bddprEndH = $('#bddprEndH').val();
	var bddprEnddateAmPm = $('#bddprEnddateAmPm').val();
	var bddprCanclH = $('#bddprCanclH').val();
	var bddprCancldateAmPm = $('#bddprCancldateAmPm').val();
	var optionDelyCnd01premiumPc = $('#optionDelyCnd01premiumPc').val();
	var optionDelyCnd02premiumPc = $('#optionDelyCnd02premiumPc').val();
	var optionDelyCnd03premiumPc = $('#optionDelyCnd03premiumPc').val();
	
	if (bddprBegindateAmPm === 'pm' && bddprBeginH < 12) {
	    bddprBeginH = String(Number(bddprBeginH) + 12); // pm이면 12시간을 더해줍니다.
	} else if (bddprBegindateAmPm === 'am' && bddprBeginH == 12) {
	    bddprBeginH = '00'; // am이면서 12시인 경우 00으로 변환합니다.
	}

	if (bddprEnddateAmPm === 'pm' && bddprEndH < 12) {
		bddprEndH = String(Number(bddprEndH) + 12); // pm이면 12시간을 더해줍니다.
	} else if (bddprEnddateAmPm === 'am' && bddprEndH == 12) {
		bddprEndH = '00'; // am이면서 12시인 경우 00으로 변환합니다.
	}

	if (bddprCancldateAmPm === 'pm' && bddprCanclH < 12) {
	    bddprCanclH = String(Number(bddprCanclH) + 12); // pm이면 12시간을 더해줍니다.
	} else if (bddprCancldateAmPm === 'am' && bddprCanclH == 12) {
	    bddprCanclH = '00'; // am이면서 12시인 경우 00으로 변환합니다.
	}
	
	var bddprBeginDt = $('#bddprBegindateInput').val().replace(/-/g, '') + bddprBeginH + $('#bddprBeginM').val() + $('#bddprBeginS').val();
	var bddprEndDt = $('#bddprEnddateInput').val().replace(/-/g, '') + bddprEndH + $('#bddprEndM').val() + $('#bddprEndS').val();
	var bddprCanclLmttDe = $('#bddprCancldateInput').val().replace(/-/g, '') + bddprCanclH + $('#bddprCanclM').val() + $('#bddprCanclS').val();
	var pcAppnBeginDe = $("#pcAppnBeginDe").val().replace(/-/g, '')
	var pcAppnEndDe = $("#pcAppnEndDe").val().replace(/-/g, '')
	var delyBeginDe = $("#delyBeginDe").val().replace(/-/g, '')
	var delyEndDe = $("#delyEndDe").val().replace(/-/g, '')
	debugger;
		var params = {
		"bidPblancId" : "${boBdPblnDtl.bidPblancId}",           // 입찰 공고아이디 
   		"metalCode" : $('#metalCode').val(),                    // 메탈구분 
   		"brandGroupCode" : $('#brandGroupCode').val(),          // 브랜드그룹
   		"brandCode" : $('#brandCode').val(),                    // 브랜드
   		"itmSn" : $('#selectItem').val(),                       // 아이템순번 
   		"dstrctLclsfCode" : $('#dstrctLclsfCode').val(),        // 권역
   		"bidWt" : $('#bid-wt-select').val(),                    // 수량(톤)
   		"permWtRate" : $('#perm-wt-select').val(),              // 중량허용공차
   		
   		"delyCnd01premiumPc" : optionDelyCnd01premiumPc,// 인도조건 01프리미엄가격 
   		"delyCnd02premiumPc" : optionDelyCnd02premiumPc,// 인도조건 01프리미엄가격 
   		"delyCnd03premiumPc" : optionDelyCnd03premiumPc,// 인도조건 01프리미엄가격 
   		
   		"delyBeginDe" :  delyBeginDe,           				// 인도기한시작
   		"delyEndDe" :  delyEndDe,           					// 인도기한종료
   		"pcAppnBeginDe" :  pcAppnBeginDe,           			// 가격지정시작
   		"pcAppnEndDe" :  pcAppnEndDe,           				// 가격지정종료
   		"pcAppnMthCode" :  $('#pcAppnMthCode').val(),           // 가격지정방법코드
   		"setleCrncyCode" :  $('#setleCrncyCode').val(),         // 결제통화코드
   		"setleMthCode" :  $('#setleMthCode').val(),             // 결제방법코드
   		"setlePdCode" :  $('#setlePdCode').val(),               // 결제기간코드
   		"etcCn" :  $('#etcCn').val(),                           // 기타코멘트 
   		"bddprBeginDt" :  bddprBeginDt,           				// 투찰시작일시
   		"bddprEndDt" :  bddprEndDt,               				// 투찰종료일시
   		"bddprCanclLmttDe" : bddprCanclLmttDe   				// 투찰취소제한일자 
		}
		console.log("goodsNm: ", $('#selectItem').val()); 
	$.ajax({
		url: '/bo/updateBoBdPblnDtl',
		method: 'POST', 
		contentType: 'application/json',
		data: JSON.stringify(params),
		dataType: 'json', 
		success: function(data) {
			console.log('데이터 정상', data);
			
			// 공고수정확인
            if (confirm('공고 건이 수정되었습니다.')) {
                // 사용자가 확인 버튼을 누른 경우 modalClose 함수 호출
                getBidNoticeList()
                modalClose();
            }
			
		},
		error: function(error) {
			// 에러 발생 시의 처리
			console.error('서버 요청 중 에러 발생:', error);
		}
	});
}
</script>
	

