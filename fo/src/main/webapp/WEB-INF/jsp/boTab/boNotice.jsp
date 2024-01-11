<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
                <button type="button" class="btn btn-green has-icon"><i class="icon icon-excel">엑셀</i></button>
            </div>
        </div>

        <!-- realGrid -->
        <div id="realgrid" class="realgrid-wrap mt-24">
            <div class="table table-list">
                <table>
                    <colgroup>
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

    </div>
</div>