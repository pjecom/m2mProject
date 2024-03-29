<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">입찰 공고 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                            <th scope="row">메탈 구분<i class="icon icon-required"></i></th>
                            <td>
                                <select class="form-select select-sm">
                                    <option value="AL">AL</option>
                                    <option value="Zn">Zn</option>
                                </select>
                            </td>
                            <th scope="row">브랜드<i class="icon icon-required"></i></th>
                            <td>
                                <div class="form-set">
                                    <select class="form-select">
                                        <option value="선택">선택</option>
                                        <option value="선택">선택</option>
                                    </select>
                                    <select class="form-select">
                                        <option value="선택">선택</option>
                                        <option value="선택">선택</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">아이템 상품명<i class="icon icon-required"></i></th>
                            <td>
                                <select class="form-select select-sm">
                                    <option value="선택">선택</option>
                                    <option value="선택">선택</option>
                                </select>
                            </td>
                            <th scope="row">권역</th>
                            <td>
                                <select class="form-select select-sm">
                                    <option value="선택">선택</option>
                                    <option value="선택">선택</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">수량 (톤)<i class="icon icon-required"></i></th>
                            <td>
                                <select class="form-select select-sm">
                                    <c:forEach var="count" begin="100" end="2000" step="100">
                                        <option value="${count}">${count}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <th scope="row">중량허용공차(±)<i class="icon icon-required"></i></th>
                            <td>
                                <select class="form-select select-sm">
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
                                        <tr>
                                            <td class="text-center"><input type="checkbox" class="prmu-price" value="Y" checked /></td>
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
                                            <td class="text-center"><input type="checkbox" class="prmu-price" value="Y" checked /></td>
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
                                            <td class="text-center"><input type="checkbox" class="prmu-price" value="Y" checked /></td>
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
                                            <input type="text" class="input" id="datepicker5" />
                                            <label for="datepicker5" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                        </div>
                                        <span>~</span>
                                        <!-- [D] 월 선택 경우 .form-month 추가 -->
                                        <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                        <div class="input-group date form-date">
                                            <input type="text" class="input" id="datepicker6" />
                                            <label for="datepicker6" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <th scope="row">가격지정방법<i class="icon icon-required"></i></th>
                            <td>
                                <select class="form-select select-sm">
                                    <option value="선택">선택</option>
                                    <option value="선택">선택</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">결제 조건<i class="icon icon-required"></i></th>
                            <td colspan="3">
                                <div class="form-set">
                                    <select class="form-select">
                                        <option value="선택">선택</option>
                                        <option value="선택">선택</option>
                                    </select>
                                    <select class="form-select">
                                        <option value="선택">선택</option>
                                        <option value="선택">선택</option>
                                    </select>
                                    <select class="form-select">
                                        <option value="선택">선택</option>
                                        <option value="선택">선택</option>
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
                                            <input type="text" class="input" id="datepicker7" />
                                            <label for="datepicker7" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
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
                                            <input type="text" class="input" id="datepicker8" />
                                            <label for="datepicker8" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
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
                                    <span style="font-weight: 500; font-size: 0.80rem;">투찰 취소 불가</span>&nbsp;<input type="checkbox" name="bddpr-cancl-poss-at" id="bddpr-cancl-poss-at" />
                                    <div class="form-set" style="margin-top:5px;">
                                        <div class="input-group date form-date">
                                            <input type="text" class="input bddpr-cancl-dt" id="datepicker9" />
                                            <label for="datepicker9" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                        </div>
                                        <select class="form-select bddpr-cancl-dt" style="width:80px;">
                                            <option value="am">am</option>
                                            <option value="pm">pm</option>
                                        </select>
                                        <input type="text" class="input bddpr-cancl-dt" value="" style="width:50px;">&nbsp;시
                                        <input type="text" class="input bddpr-cancl-dt" value="" style="width:50px;">&nbsp;분
                                        <input type="text" class="input bddpr-cancl-dt" value="" style="width:50px;">&nbsp;초 까지 투찰 취소 가능함.
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
                                        <input type="radio" id="dspy-yn-01" name="dspyYn" checked="checked" />
                                        <label for="dspy-yn-01"><span>제출</span></label>
                                    </div>
                                    <div class="form-radio">
                                        <input type="radio" id="dspy-yn-02" name="dspyYn" />
                                        <label for="dspy-yn-02"><span>미제출</span></label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-box">
                    <button type="button" class="btn">입찰 공고 등록</button>
                    <button type="button" class="btn" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){

        bddprCanclDtCntr();

        $('#bddpr-cancl-poss-at').change(function(){
            bddprCanclDtCntr();
        });

        function bddprCanclDtCntr() {
            var isChecked = $('#bddpr-cancl-poss-at').is(':checked');

            $('.bddpr-cancl-dt').not('#bddpr-cancl-poss-at').prop('disabled', isChecked);
        }
    });
</script>