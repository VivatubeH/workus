<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-11-07
  Time: 오후 4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tags.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="../common/common.jsp" %>
    <title>Meeting</title>
    <style>
        /* body 스타일 */
        #content {
            margin: 0;               /* 기본 여백 제거 */
            padding: 0;              /* 기본 패딩 제거 */
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif; /* 폰트 지정 */
            font-size: 14px;         /* 기본 폰트 크기 설정 */
        }

        /* #calendar2 스타일 */
        #calendar2 {
            max-width: 1100px;       /* 캘린더 최대 너비 설정 */
            margin: 40px auto;       /* 캘린더를 중앙에 위치시키고 위아래 여백 40px 추가 */
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
                        <a href="">text1</a>
                    </li>
                </ul>
            </div>
            <main>
                <h3 class="title1">회의실</h3>
                <div class="content">
                    <div id='calendar2'></div>
                </div>
            </main>
        </section>
    </div>
</div>
<script>
    (function(){
        $(function(){
            // calendar element 취득
            var calendarEl = $('#calendar2')[0];

            // full-calendar 생성하기
            var calendar = new FullCalendar.Calendar(calendarEl, {
                schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                timeZone: 'UTC',              // 타임존 설정
                initialView: 'resourceTimelineDay', // 초기 로드 될때 보이는 캘린더 화면 (일별 타임라인)
                aspectRatio: 1.5,             // 너비를 채우는 비율
                // 헤더에 표시할 툴바
                headerToolbar: {
                    left: 'prev,next',        // 이전, 다음 버튼
                    center: 'title',          // 제목 위치
                    right: 'resourceTimelineDay,resourceTimelineWeek,resourceTimelineMonth' // 보기 옵션
                },
                editable: true,               // 수정 가능 여부
                resourceAreaHeaderContent: 'Rooms',  // 리소스 헤더 이름
                initialDate: new Date().toISOString().slice(0, 10),    // 초기 날짜 설정
                height: '320px',              // 높이 설정
                locale: 'ko',                 // 한국어 설정

                // 리소스 설정
                resources: [
                    {"id": "a", "title": "Auditorium A"},
                    {"id": "b", "title": "Auditorium B", "eventColor": "green"},
                    {"id": "c", "title": "Auditorium C", "eventColor": "orange"},
                    {"id": "d", "title": "Auditorium D", "children": [
                            {"id": "d1", "title": "Room D1"},
                            {"id": "d2", "title": "Room D2"}
                        ]}
                ],

                // 이벤트 설정
                events: [
                    {"resourceId": "a", "title": "event 1", "start": "2021-07-14", "end": "2021-07-16"},
                    {"resourceId": "b", "title": "event 3", "start": "2021-07-15T12:00:00+00:00", "end": "2021-07-16T06:00:00+00:00"},
                    {"resourceId": "d1", "title": "event 4", "start": "2021-07-15T07:30:00+00:00", "end": "2021-07-15T09:30:00+00:00"}
                ]
            });

            // 캘린더 렌더링
            calendar.render();
        });
    })();
</script>
</body>
</html>
