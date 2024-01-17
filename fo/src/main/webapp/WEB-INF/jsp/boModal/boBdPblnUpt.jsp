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
                                                   <select class="form-select select-sm">
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
                                                            <select class="form-select select-sm">
                                                             <c:forEach var="item" items="${boCommCdList}">
                                                               <c:if test="${item.mainCode eq 'BRAND_GROUP_CODE'}">
                                                                 <option value="${item.subCode}"${item.subCode eq boBdPblnDtl.brandGroupCode ? 'selected' : ''}>${item.codeDctwo}</option>
                                                               </c:if>                                                   
                                                             </c:forEach>
                                                            </select>
                                                            <select class="form-select select-sm">
                                                             <c:forEach var="item" items="${boBdBrandGrpList}">
                                                               <option value="${item.brandCode}">${item.brandNm}</option>                                                    
                                                             </c:forEach>
                                                            </select>
                                                        </div>
                                                    </td>
                                            </tr>
                                                <tr>
                                                    <th scope="row">아이템 상품명<i class="icon icon-required"  id="boBdItemList" ></i></th>
                                                    <td>
                                                         <select class="form-select">
                                                            <c:forEach var="item" items="${boBdItemList}">
                                                              <option value="${item.itmSn}">${item.goodsNm}</option>                                                    
                                                            </c:forEach>
                                                         </select>
                                                    </td>
                                                    <th scope="row">권역</th>
                                                    <td>
                                                         <select class="form-select select-sm">
                                                            <c:forEach var="item" items="${boCommCdList}">
                                                              <c:if test="${item.mainCode eq 'DSTRCT_LCLSF_CODE'}">
                                                                <%-- <option value="${item.dstrctLclsfCode}">${item.dstrctNm}</option> --%>
                                                                <option value="${item.subCode}"${item.subCode eq boBdPblnDtl.dstrctLclsfCode ? 'selected' : ''}>${item.codeDctwo}</option>
                                                              </c:if>                                                    
                                                            </c:forEach>
                                                         </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">수량 (톤)<i class="icon icon-required"></i></th>
                                                    <td>
                                                        <select class="form-select select-sm">
                                                            <option value="100">100</option>
                                                            <option value="200">200</option>
                                                        </select>
                                                    </td>
                                                    <th scope="row">중량허용공차(±)<i class="icon icon-required"></i></th>
                                                    <td>
                                                        <select class="form-select select-sm">
                                                            <option value="1">1%</option>
                                                            <option value="10">10%</option>
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
	                                                            	<tr>
	                                                            		<td class="text-center"><input type="checkbox" class ="" name="" value="Y" id="" checked /></td>
	                                                            		<td>서린상사 지정 보세창고 도착도(FCA 서린상사 지정 보세창고)</td>
	                                                            		<td>
	                                                            			<div class="form-set">
		                                                            			<input type="text" class="input" value="0" readonly="readonly">
						                                                        <select class="form-select select-sm">
						                                                            <option value="선택">선택</option>
						                                                            <option value="선택">선택</option>
						                                                        </select>
						                                                     </div>
					                                                    </td>
	                                                            	</tr>
	                                                            	<tr>
	                                                            		<td class="text-center"><input type="checkbox" class ="" name="" value="Y" id="" checked /></td>
	                                                            		<td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
	                                                            		<td>
	                                                            			<div class="form-set">
		                                                            			<input type="text" class="input" value="100" readonly="readonly">
						                                                        <select class="form-select select-sm">
						                                                            <option value="선택">선택</option>
						                                                            <option value="선택">선택</option>
						                                                        </select>
						                                                     </div>
					                                                    </td>
	                                                            	</tr>
	                                                            	<tr>
	                                                            		<td class="text-center"><input type="checkbox" class ="" name="" value="Y" id="" checked /></td>
	                                                            		<td>CIF INCHEON / CIF BUSAN</td>
	                                                            		<td>
	                                                            			<div class="form-set">
		                                                            			<input type="text" class="input" value="200" readonly="readonly">
						                                                        <select class="form-select select-sm">
						                                                            <option value="선택">선택</option>
						                                                            <option value="선택">선택</option>
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
																	<input type="text" class="input" id="datepicker13" />
																	<label for="datepicker1" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
																</div>
																<span>~</span>
																<!-- [D] 월 선택 경우 .form-month 추가 -->
																<!-- [D] 날짜 선택 경우 .form-date 추가 -->
																<div class="input-group date form-date"> 
																	<input type="text" class="input" id="datepicker23" />
																	<label for="datepicker2" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
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
																<div class="input-group date form-date"> 
																	<input type="text" class="input" id="datepicker3" />
																	<label for="datepicker3" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
																</div>
																<span>~</span>
																<!-- [D] 월 선택 경우 .form-month 추가 -->
																<!-- [D] 날짜 선택 경우 .form-date 추가 -->
																<div class="input-group date form-date"> 
																	<input type="text" class="input" id="datepicker4" />
																	<label for="datepicker4" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
																</div>
															</div>
														</div>
                                                    </td>
                                                    <th scope="row">가격지정방법<i class="icon icon-required"></i></th>
                                                    <td>
                                                        <select class="form-select">
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
                                                         <select class="form-select">
                                                            <c:forEach var="item" items="${boCommCdList}">
                                                              <c:if test="${item.mainCode eq 'SETLE_CRNCY_CODE'}">
                                                                <option value="${item.subCode}" ${item.subCode eq boBdPblnDtl.setleCrncyCode ? 'selected' : ''}>${item.codeDctwo}</option>
                                                              </c:if>
                                                            </c:forEach>
                                                         </select>
                                                         <select class="form-select">
                                                            <c:forEach var="item" items="${boCommCdList}">
                                                              <c:if test="${item.mainCode eq 'SETLE_MTH_CODE'}">
                                                                <option value="${item.subCode}" ${item.subCode eq boBdPblnDtl.setleMthCode ? 'selected' : ''}>${item.codeDctwo}</option>
                                                              </c:if>
                                                            </c:forEach>
                                                         </select>
                                                         <select class="form-select">
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
                                                    <td colspan="3">
                                                    	<input type="text" class="input" value="" placeholder="코멘트를 입력해주세요.">
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
															<div class="input-group date form-date"> 
																<input type="text" class="input" id="datepicker5" />
																<label for="datepicker5" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
															</div>
                                                            <select class="form-select" style="width:80px;">
                                                                <option value="am">am</option>
                                                                <option value="pm">pm</option>
                                                            </select>
                                                    		<input type="text" class="input" value="" style="width:50px;">&nbsp;시
                                                    		<input type="text" class="input" value="" style="width:50px;">&nbsp;분
                                                    		<input type="text" class="input" value="" style="width:50px;">&nbsp;초
														</div>
                                                    </td>
                                                    <th scope="row">투찰 마감일<i class="icon icon-required"></i></th>
                                                    <td>
                                                        <div class="form-set">
															<div class="input-group date form-date"> 
																<input type="text" class="input" id="datepicker6" />
																<label for="datepicker6" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
															</div>
                                                            <select class="form-select" style="width:80px;">
                                                                <option value="am">am</option>
                                                                <option value="pm">pm</option>
                                                            </select>
                                                    		<input type="text" class="input" value="" style="width:50px;">&nbsp;시
                                                    		<input type="text" class="input" value="" style="width:50px;">&nbsp;분
                                                    		<input type="text" class="input" value="" style="width:50px;">&nbsp;초
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
														<span style="font-weight: 500; font-size: 0.80rem;">투찰 취소 불가</span>&nbsp;<input type="checkbox" class ="" name="" value="N" id="" />
                                                        <div class="form-set" style="margin-top:5px;">
															<div class="input-group date form-date"> 
																<input type="text" class="input" id="datepicker6" />
																<label for="datepicker6" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
															</div>
                                                            <select class="form-select" style="width:80px;">
                                                                <option value="am">am</option>
                                                                <option value="pm">pm</option>
                                                            </select>
                                                    		<input type="text" class="input" value="" style="width:50px;">&nbsp;시
                                                    		<input type="text" class="input" value="" style="width:50px;">&nbsp;분
                                                    		<input type="text" class="input" value="" style="width:50px;">&nbsp;초 까지 투찰 취소 가능함.
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
                                         <button type="button" class="btn">입찰 공고 수정 저장</button>
                                         <button type="button" class="btn" data-dismiss="modal">취소</button>
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

<script>
	$("#datepicker13").datepicker({
		dateFormat: 'yy-mm-dd' //달력 날짜 형태
		,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
		,changeYear: true //option값 년 선택 가능
		,changeMonth: true //option값  월 선택 가능
		,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
		,buttonImage: "/images/calendar.png" //버튼 이미지 경로
		,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
		,buttonText: "선택" //버튼 호버 텍스트
		,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
		,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
		,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
		,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
		,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
		,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
	});
	
	$("#datepicker23").datepicker({
		dateFormat: 'yy-mm-dd' //달력 날짜 형태
		,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
		,changeYear: true //option값 년 선택 가능
		,changeMonth: true //option값  월 선택 가능
		,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
		,buttonImage: "/images/calendar.png" //버튼 이미지 경로
		,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
		,buttonText: "선택" //버튼 호버 텍스트
		,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
		,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
		,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
		,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
		,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
		,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
	});
	function modalClose() {
		$('#bdNoticeDetailModal').modal('hide');
	}
</script>