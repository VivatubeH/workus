<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-11-07
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tags.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="../common/common.jsp" %>
    <title>Calendar</title>

    <style>
        /* content 스타일 */
        #content {
            overflow: hidden;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }
        /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
        .fc-header-toolbar {
            padding-top: 1em;
            padding-left: 1em;
            padding-right: 1em;
        }
    </style>

</head>
<body>
<div id="divWrapper">
    <div id="divContents">
        <%@ include file="../common/header.jsp" %>
        <section class="verticalLayoutFixedSection">
            <%@ include file="../common/nav.jsp" %>
            <div class="lnb">
                <ul class="">
                    <li class="">
                        <a href="">일정추가하기</a>
                    </li>
                </ul>
            </div>
            <main>
                <h3 class="title1">일정</h3>
                <div class="content">
                    <!-- calendar 태그 -->
                    <div id='calendar-container'>
                        <div id='calendar'></div>
                    </div>
                </div>
            </main>
        </section>
    </div>
</div>
<script>
    (function() {
        $(function() {
            // 캘린더 엘리먼트 선택
            var calendarEl = $('#calendar')[0];

            // FullCalendar 생성
            var calendar = new FullCalendar.Calendar(calendarEl, {
                height: '700px',             // 캘린더 높이
                expandRows: true,            // 화면에 맞게 높이 조절
                slotMinTime: '08:00',        // Day 캘린더 시작 시간
                slotMaxTime: '20:00',        // Day 캘린더 종료 시간
                headerToolbar: {             // 헤더 툴바 설정
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                initialView: 'dayGridMonth', // 초기 보이는 화면
                initialDate: new Date().toISOString().slice(0, 10),   // 초기 날짜 설정
                navLinks: true,              // 날짜 선택 시 Day/Week 뷰로 이동 가능
                editable: true,              // 일정 수정 가능
                selectable: true,            // 드래그로 일정 생성 가능
                nowIndicator: true,          // 현재 시간 표시
                dayMaxEvents: true,          // 일정 초과 시 "+N개" 형식으로 표시
                locale: 'ko',                // 한국어 설정

                // 이벤트가 추가될 때
                eventAdd: function(obj) {
                    console.log('Event Added:', obj);
                },
                // 이벤트가 수정될 때
                eventChange: function(obj) {
                    console.log('Event Changed:', obj);
                },
                // 이벤트가 삭제될 때
                eventRemove: function(obj) {
                    console.log('Event Removed:', obj);
                },
                // 새로운 이벤트 생성
                select: function(arg) {
                    var title = prompt('Event Title:');
                    if (title) {
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay
                        });
                    }
                    calendar.unselect();
                },

                // 기본 이벤트 목록
                events: [
                    { title: 'All Day Event', start: '2021-07-01' },
                    { title: 'Long Event', start: '2021-07-07', end: '2021-07-10' },
                    { groupId: 999, title: 'Repeating Event', start: '2021-07-09T16:00:00' },
                    { groupId: 999, title: 'Repeating Event', start: '2021-07-16T16:00:00' },
                    { title: 'Conference', start: '2021-07-11', end: '2021-07-13' },
                    { title: 'Meeting', start: '2021-07-12T10:30:00', end: '2021-07-12T12:30:00' },
                    { title: 'Lunch', start: '2021-07-12T12:00:00' },
                    { title: 'Meeting', start: '2021-07-12T14:30:00' },
                    { title: 'Happy Hour', start: '2021-07-12T17:30:00' },
                    { title: 'Dinner', start: '2021-07-12T20:00:00' },
                    { title: 'Birthday Party', start: '2021-07-13T07:00:00' },
                    { title: 'Click for Google', url: 'http://google.com/', start: '2021-07-28' }
                ]
            });

            // 캘린더 랜더링
            calendar.render();
        });
    })();
</script>
</body>
</html>
