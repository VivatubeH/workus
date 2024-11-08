<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="../common/common.jsp" %>
  <title>workus template</title>
</head>
<body>
<div id="divWrapper">
  <div id="divContents">
    <%@ include file="../common/header.jsp" %>
    <section class="verticalLayoutFixedSection">
      <%@ include file="../common/nav.jsp" %>
      <div class="lnb">
        <ul class="list1 myAtdInfo">
          <li class=""><a href="">내 근태 현황</a></li>
        </ul>
        <p class="listTitle">근태 내역</p>
        <ul class="list2 myAtdList">
          <li><a href="">내 신청 내역</a></li>
          <li><a href="">내 결재 내역</a></li>
          <li><a href="">내 참조 내역</a></li>
        </ul>
      </div>
      <main>
        <h3 class="title1">내 근태 현황</h3>
        <div id="atdCheck" class="content">
          <div class="applyItem">
            <button type="button" class="applyBtn btn btn-lg border border-secondary" id="atdApplyBtnForModal">
              <span>휴가 신청</span>
                <span class="holiday">
                    <span class="usable">17</span>
                    <span class="slash">/</span>
                    <span class="total">20</span>
                </span>
                <i class="bi bi-airplane-fill"></i>
              </span>
            </button>
            <a href="/attendance/documents/my-payment/" class="applyWaitBtn btn btn-lg border border-secondary">
              결재 대기
                <span class="flex">
                  <span class="data">0</span>건
                </span>
              </span>
            </a>
          </div>
          <div class="calendarContent this-month">
            <div class="cal-month">
              <span id="titleMonth" class="cal-txt"></span>
            </div>
            <div class="btnWrap gap-1.5 my-2">
              <button id="goPrevMonth" type="button"></button>
              <button id="goToday" type="button"></button>
              <button id="goNextMonth" type="button"></button>
            </div>
          </div>
          <div id="full-calendar" class="fc fc-ltr fc-unthemed fullCalendarInAtd">
            풀캘린더 영역
          </div>
        </div>
      </main>
    </section>
  </div>
</div>
</body>
</html>