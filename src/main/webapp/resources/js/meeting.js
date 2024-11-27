
    $(document).ready(function() {
        // "일정 추가하기" 버튼 클릭 시 모달 열기
        $("#addScheduleBtn").on("click", function () {

            $("#meetModalLabel").text("회의실 예약하기");

            $("#meetModal #startDate").val("");
            $("#meetModal #endDate").val("");
            $("#meetModal #room").val("1");
            $("#meetModal #content").val("");

            $("#calendarModal").data("eventId", null);

            $("#meetModal").modal("show");
        });
    });

    var calendarEl = $('#calendar')[0];

    // full-calendar 생성하기
    var calendar = new FullCalendar.Calendar(calendarEl, {
        schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
        timeZone: 'UTC',
        initialView: 'listMonth', // 초기 뷰 설정
        aspectRatio: 1.5,

        headerToolbar: {
            left: 'prev,next',
            center: 'title',
            right: 'today'
        },
        editable: true,
        resourceAreaHeaderContent: 'Rooms',
        initialDate: new Date().toISOString().slice(0, 10),
        height: '800px',
        locale: 'ko',

        // 시간 라벨 형식 설정
        slotLabelFormat: {
            hour: '2-digit',
            minute: '2-digit',
            hour12: false // 24시간 형식으로 표시
        },

        dateClick: function (info){
            let startDate = info.dateStr;
            console.log(info);

            let startDateParts = startDate.split("T");

            $("#meetModalLabel").text("회의실 예약하기");

            $("#meetModal #startDate").val(startDate);
            $("#meetModal #endDate").val("");
            $("#meetModal #room").val("1");
            $("#meetModal #content").val("");

            $("#meetModal").data("eventId", null);  // eventId 초기화

            $("#delete").hide();
            $("#save").text("추가");

            $("#meetModal").modal("show");
            calendar.unselect();

        },

        // 리소스 설정
        resources: [
            {"id": "a", "title": "회의실 A"},
            {"id": "b", "title": "회의실 B", "eventColor": "green"},
        ],

        // 이벤트 설정
        events: [
            {"resourceId": "a", "title": "event 1", "start": "2024-11-25", "end": "2024-11-26"},
            {"resourceId": "b", "title": "event 2", "start": "2024-11-25T12:00:00+00:00", "end": "2024-11-25T14:00:00+00:00"},
        ]

    });

    // 캘린더 렌더링
    calendar.render();

    // 내 예약 현황 클릭 이벤트
    $('#myReservation').on('click', function () {
        calendar.changeView('listMonth'); // 'listMonth' 뷰로 변경
        calendar.setOption('height', '800px');
        calendar.setOption('resourceAreaWidth', '30%');
    });

    // 회의실 클릭 이벤트
    $('#meetingRoom').on('click', function () {
        calendar.changeView('resourceTimeline'); // 'resourceTimeline' 뷰로 변경
        calendar.scrollToTime('00:00:00'); // 선택한 뷰로 스크롤 이동
        calendar.setOption('resources', [
            {"id": "a", "title": "회의실 A"},
            {"id": "b", "title": "회의실 B"}
        ]);
        calendar.setOption('height', 'auto'); // 캘린더 높이를 320px로 설정
        calendar.setOption('resourceAreaWidth', '7.5%');


    });

    // 회의실 A 클릭 이벤트
    $('#meetingRoomA').on('click', function () {
        calendar.changeView('resourceTimeGridWeek'); // 'resourceTimeGridDay' 뷰로 변경
        calendar.scrollToTime('00:00:00'); // 선택한 뷰로 스크롤 이동
        calendar.setOption('resources', [
            {"id": "a", "title": "회의실 A"} // 회의실 A만 표시
        ]);
        calendar.setOption('height', '800px');
        calendar.setOption('resourceAreaWidth', '30%');

    });

    // 회의실 B 클릭 이벤트
    $('#meetingRoomB').on('click', function () {
        calendar.changeView('resourceTimeGridWeek'); // 'resourceTimeGridDay' 뷰로 변경
        calendar.scrollToTime('00:00:00'); // 선택한 뷰로 스크롤 이동
        calendar.setOption('resources', [
            {"id": "b", "title": "회의실 B"} // 회의실 B만 표시
        ]);
        calendar.setOption('height', '800px');
        calendar.setOption('resourceAreaWidth', '30%');

    });
