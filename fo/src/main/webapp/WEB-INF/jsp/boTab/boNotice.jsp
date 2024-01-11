<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
	$(function() {
	   $("#moveList").click(function() { // 목록가기 버튼 클릭 이벤트
		debugger;
		var params = {
		         "bidPblancId" : "TEST01-07",
		}
	      pageMove( "/boPbln/detail", JSON.stringify(params), 'application/json');
	   });
	});
	
	function bdNoticeDetailModalSearch(){
		debugger;
		var url = "/bo/boPbln/detail";
		var params = {
				
		};
		postSetDataTypeBo(url, JSON.stringify(params), "html", true, function(result) {
            if(!sorin.validation.isNull(result)) {
           	 $("#bdNoticeDetailModal .modal2").html('');
           	 $("#bdNoticeDetailModal .modal2").html(result);
            }
        });
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
                        <p class="desc">56</span></p>
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

        <div class="search-control mt-24">
            <div class="form-set">
                <span class="label">상태</span>
                <select class="form-select">
                    <option value="전체">전체</option>
                    <option value="공고대기">공고대기</option>
                    <option value="입찰예정">입찰예정</option>
                    <option value="투찰 중">투찰 중</option>
                    <option value="심사 중">심사 중</option>
                    <option value="낙찰">낙찰</option>
                    <option value="유찰">유찰</option>
                </select>
            </div>

            <div class="form-set">
                <span class="label">검색구분</span>
                <select class="form-select">
                    <option value="전체">전체</option>
                    <option value="입찰공고번호">입찰공고번호</option>
                    <option value="회사명">회사명</option>
                    <option value="사업자번호">사업자번호</option>
                    <option value="ID">ID</option>
                </select>
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
                        <button type="button" class="btn active">오늘</button>
                        <button type="button" class="btn">일주일</button>
                        <button type="button" class="btn">1개월</button>
                        <button type="button" class="btn">6개월</button>
                        <button type="button" class="btn">1년</button>
                        <button type="button" class="btn">2년</button>
                    </div>
                </div>
            </div>

            <div class="search-btn">
                <div class="btn-box">
                    <button type="button" class="btn btn-blue">검색</button>
                    <button type="button" class="btn btn-blue">검색이전</button>
                </div>
            </div>

        </div>

        <div class="table-control">
            <div class="form-set">
                <div class="tab-button">
                    <a href="?" class="btn active">전체</a>
                    <a href="?" class="btn">입찰예정</a>
                    <a href="?" class="btn">투찰 중</a>
                    <a href="?" class="btn">마감</a>
                    <a href="?" class="btn">공고취소</a>
                    <a href="?" class="btn">공고대기</a>
                </div>
            </div>
            <div class="btn-box">
                <button type="button" class="btn btn-green has-icon" onclick="bdNoticeDetailModalSearch()" data-toggle="modal" data-target="#exampleModal" ><i class="icon icon-excel">엑셀</i></button>
            </div>
        </div>

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
                            <th scope="row" rowspan="2">시작~마감</th>
                            <th scope="row" rowspan="2">활성여부</th>
                            <th scope="row" rowspan="2">등록일(등록자)</th>
                            <th scope="row" rowspan="2">상태</th>
                            <th scope="row" rowspan="2">단계</th>
                            <th scope="row" rowspan="2">투찰기업</th>
                            <th scope="row" rowspan="2">최저프리미엄가</th>
                        </tr>
                        <tr>
                            <th scope="col">구분</th>
                            <th scope="col">그룹</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${bidList.size() == 0 }">
                            <tr>
                                <td colspan="15" align="center">
                                    <img src="/bo_images/error/prohibit.png" alt="Nobids"/>
                                    <h5>등록 된 입찰 목록이 존재하지 않습니다.</h5>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${bidList.size() != 0}">
                            <c:forEach var="vo" items="${bidList}">
                                <tr onclick="location.href='?'">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
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

        <!-- 입찰 공고 등록 모달창 -->
        <!-- 입창 공고 상세 모달 -->
                     <div class="modal fade" id="bdNoticeDetailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                         <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full" role="document">
                             <div class="modal-content">
                                 <div class="modal-header">
                                     <h5 class="modal-title" id="exampleModalLabel">입찰 공고 상세&nbsp;&nbsp;&gt;&nbsp;PRIMARY AL INGOT P1020&nbsp;&nbsp;&nbsp;&nbsp;<span style="background-color: black; color: white; font-weight:normal;">&nbsp;&nbsp; 입찰공고번호 BID20221128-2 &nbsp;&nbsp;</span></h5>
                                     
                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                 </div>
                                 <div class="modal-body">
	                                 <div class="table table-view">
		                                 <table>
		                                     <colgroup>
		                                         <col class="col-sm" />
		                                         <col width="15%" />
		                                         <col class="col-sm" />
		                                         <col width="10%" />
		                                         <col class="col-sm" />
		                                         <col width="*" />
		                                         <col class="col-sm" />
		                                         <col width="10%" />
		                                     </colgroup>
		                                     <tbody>
		                                     	<tr>
		                                     		<td>상태</td>
		                                     		<td> ${boBdPblnDtl.bidSttus} </td>
		                                     		<th >시작 ~ 마감</th>
		                                     		<td colspan="3">${boBdPblnDtl.bddprBeginDt} ~ ${boBdPblnDtl.bddprEndDt}<br>(<span class="color-blue">3일 5시간 0분 0초</span> 남음)</td>
                                                    <th>활성여부</th>
                                                    <td>
                                                        <c:if test="${boBdPblnDtl.dspyAt eq 'Y'}">
                                                          활성
                                                        </c:if>
                                                        <c:if test="${boBdPblnDtl.dspyAt eq 'N'}">
                                                          비활성
                                                        </c:if>
                                                      </td>
		                                     	</tr>
		                                     </tbody>
		                                 </table>
		                             </div>                                                                           
                                    <div class="sub-title mt-12">
                                        <h3 class="">공고 정보(*필수)</h3>
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
                                                    <th scope="row">메탈 구분<i class="icon icon-required"></i>
                                                    <td> ${boBdPblnDtl.metalCodeEm} </td>
                                                    </th>
                                                    <th scope="row">브랜드<i class="icon icon-required"></i></th>
                                                    <td> ${boBdPblnDtl.brandGroupCodeNm} </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">아이템 상품명<i class="icon icon-required"></i></th>
                                                    <td> ${boBdPblnDtl.dspyGoodsNm} </td>
                                                    <th scope="row">권역</th>
                                                    <td> ${boBdPblnDtl.dstrctNm} </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">수량 (톤)<i class="icon icon-required"></i></th>
                                                    <td> ${boBdPblnDtl.bidWt} </td>
                                                    <th scope="row">중량허용공차(±)<i class="icon icon-required"></i></th>
                                                    <td> ${boBdPblnDtl.permWtRate} </td>
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
	                                                            		<th scope="row" ></th>
	                                                            		<th scope="row">인도조건</th>
	                                                            		<th scope="row">프리미엄 가격 설정</th>
	                                                            	</tr>
	                                                            </thead>
					                                            <tbody>
	                                                            	<tr>
	                                                            		<td class="text-center"><b>1</b></td>
	                                                            		<td>서린상사 지정 보세창고 도착도(FCA 서린상사 지정 보세창고)</td>
	                                                            		<td>
	                                                            			<input type="text" value="0" class="input" style="width:50%; background-color:#fafafa;" readonly="readonly">
	                                                            			&nbsp;&nbsp;
	                                                            			<span class="color-red">+USD 15.0</span>
					                                                    </td>
	                                                            	</tr>
	                                                            	<tr>
	                                                            		<td class="text-center"><b>2</b></td>
	                                                            		<td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
	                                                            		<td>
	                                                            			<input type="text" value="100" class="input" style="width:50%; background-color:#fafafa;" readonly="readonly">
	                                                            			&nbsp;&nbsp;
	                                                            			<span class="color-red">+USD 15.0</span>
					                                                    </td>
	                                                            	</tr>
	                                                            	<tr>
	                                                            		<td class="text-center"><b>3</b></td>
	                                                            		<td>CIF INCHEON / CIF BUSAN</td>
	                                                            		<td>
	                                                            			<input type="text" value="200" class="input" style="width:50%; background-color:#fafafa;" readonly="readonly">
	                                                            			&nbsp;&nbsp;
	                                                            			<span class="color-red">+USD 15.0</span>
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
														2022.08.01 ~ 2022.08.10
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                    	<b>ⓘ</b> 인도조건에서 제출한 인도지에 화물이 최종 입고된 기준으로 적용함
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
                                                    	${boBdPblnDtl.pcAppnBeginDe} ~ ${boBdPblnDtl.pcAppnEndDe}
                                                    </td>
                                                    <th scope="row">가격지정방법<i class="icon icon-required"></i></th>
                                                    <td> ${boBdPblnDtl.pcAppnMthCodeNm} </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">결제 조건<i class="icon icon-required"></i></th>
                                                    <td colspan="3">
                                                        ${boBdPblnDtl.setleCndtn}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">기타 코멘트</th>
                                                    <td colspan="3"> ${boBdPblnDtl.etcCn} </td>
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
                                                    <td> ${boBdPblnDtl.bddprBeginDt} </td>
                                                    
                                                    <th scope="row" >투찰 마감일<i class="icon icon-required"></i></th>
                                                    <td colspan="3" > ${boBdPblnDtl.bddprEndDt} </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">투찰 취소기한<i class="icon icon-required"></i>
                                                    	<div class="icon icon-title-tooltip tooltip" style="margin-left:1px;">
							                                <span class="tooltiptext">
							                                    회원사가 투찰 후, 취소를 할때<br/>
																설정 된 취소 기한에 따릅니다.
							                                </span>
							                            </div>
							                        </th>
							                        <td colspan="5"> ${boBdPblnDtl.bddprCanclLmttDe} </td>
                                                    <!-- <td colspan="3">													
                                                    </td> -->
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <div class="sub-title">
                                        <h3 class="">활성여부</h3>
                                    </div>
                                    <div class="table table-view">
                                        <table>
                                            <colgroup>
                                                <col class="col-md" />
                                                <col width="*" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">활성여부</th>
                                                    <td>
                                                        <c:if test="${boBdPblnDtl.dspyAt eq 'Y'}">
                                                          활성
                                                        </c:if>
                                                        <c:if test="${boBdPblnDtl.dspyAt eq 'N'}">
                                                          비활성
                                                        </c:if>
                                                      </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <div class="sub-title">
                                        <h3 class="">공고 수정 이력</h3>
                                    </div>
                                    <div class="table table-view">
                                        <table>
                                            <colgroup>
                                                <col width="20%" />
                                                <col width="*" />
                                                <col width="40%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">수정일시</th>
                                                    <th scope="row">수정 내용</th>
                                                    <th scope="row">수정 사유</th>
                                                </tr>
                                                <tr>
                                                    <td>2022.01.03.10:10:10</td>
                                                    <td> ${boBdPblnDtl.bidUpdtCn} </td>
                                                    <td> ${boBdPblnDtl.bidUpdtResn} </td>
                                                </tr>
                                                <tr>
                                                    <td>2022.01.04.10:10:00</td>
                                                    <td> ${boBdPblnDtl.bidUpdtCn} </td>
                                                    <td> ${boBdPblnDtl.bidUpdtResn} </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <div class="btn-box mt-12">
                                        <button type="button" class="btn">공고 수정</button>
                                        <button type="button" class="btn">공고 취소</button>
                                        <button type="button" class="btn">유찰 처리</button>
                                    </div>
                                    
                                    <div class="sub-title">
                                        <h3 class="">투찰 기업 목록</h3>
                                    </div>
                                    <div class="table table-view">
                                        <table>
                                            <colgroup>
                                                <col width="10%" />
                                                <col width="15%" />
                                                <col width="15%" />
                                                <col width="*" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row" class="text-center">순위</th>
                                                    <th scope="row" class="text-center">기업명</th>
                                                    <th scope="row" class="text-center">투찰 일시</th>
                                                    <th scope="row" class="text-center">인도조건</th>
                                                    <th scope="row" class="text-center">투찰 가격(USD)</th>
                                                    <th scope="row" class="text-center">상태</th>
                                                    <th scope="row" class="text-center">처리단계</th>
                                                </tr>
                                                <tr>
                                                    <td class="text-center"><b>1</b></td>
                                                    <td><a href="#" class="rg-link-renderer">엠투엠글로벌</a></td>
                                                    <td>2022.01.02. 10:10:10</td>
                                                    <td>서린상사 지정 보세창고 도착도(FCA서린상사 지정보세창고)</td>
                                                    <td class="text-center">11</td>
                                                    <td class="text-center">투찰 중</td>
                                                    <td class="text-center">-</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center"><b>2</b></td>
                                                    <td><a href="#" class="rg-link-renderer">반진메탈</a></td>
                                                    <td>2022.01.02. 10:11:25</td>
                                                    <td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
                                                    <td class="text-center">111</td>
                                                    <td class="text-center">투찰 중</td>
                                                    <td class="text-center">-</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center"><b>3</b></td>
                                                    <td><a href="#" class="rg-link-renderer">기업명칭</a></td>
                                                    <td>2022.01.03. 11:11:20</td>
                                                    <td>CIF INCHEON / CIF BUSAN</td>
                                                    <td class="text-center">112</td>
                                                    <td class="text-center">투찰 중</td>
                                                    <td class="text-center">-</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                 </div>
                                 <div class="modal-footer">
                                     <!-- <div class="btn-box">
                                         <button type="button" class="btn">입찰 공고 등록</button>
                                         <button type="button" class="btn" data-dismiss="modal">취소</button>
                                     </div> -->
                                 </div>
                             </div>
                         </div>
                     </div> 
    </div>
</div>

