package com.example.workus.calendar.service;

import com.example.workus.calendar.dto.CalendarForm;
import com.example.workus.calendar.mapper.CalendarMapper;
import com.example.workus.calendar.vo.Calendar;
import com.example.workus.security.LoginUser;
import com.example.workus.user.mapper.UserMapper;
import com.example.workus.util.DateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class CalendarService {

    @Autowired
    private CalendarMapper calendarMapper;

    public Calendar addNewCalendar(CalendarForm form) {
        Calendar calendar = new Calendar();
        calendar.setName(form.getName());
        calendar.setLocation(form.getLocation());
        calendar.setStartDate(DateTimeUtil.getLocalDateTime(form.getStartDate()));
        calendar.setEndDate(DateTimeUtil.getLocalDateTime(form.getEndDate()));
        calendar.setDivision(form.getDivision());
        calendar.setContent(form.getContent());

        calendar.setNo(form.getNo());
        calendar.setDeptNo(form.getDeptNo());

        calendarMapper.insertCalendar(calendar);

        return calendar;
    }

    public List<Calendar> getEventsByDateRange(Date start, Date end, List<Integer> division, LoginUser loginUser) {
        LocalDateTime startDateTime = DateTimeUtil.toLocalDateTime(start);
        LocalDateTime endDateTime = DateTimeUtil.toLocalDateTime(end);

        return calendarMapper.selectEventsByDateRange(startDateTime, endDateTime, division, loginUser);
    }

    public Calendar getCalendarByNo(Long calendarNo) {
        return calendarMapper.selectCalendarByNo(calendarNo);
    }

    public void updateCalendar(Calendar calendar) {
        calendarMapper.updateCalendar(calendar);
    }

    public boolean deleteCalendar(Long eventId) {
        Calendar calendar = calendarMapper.selectCalendarByNo(eventId);
        if (calendar != null) {
            calendarMapper.deleteCalendar(eventId);
            return true;
        } else {
            return false;
        }
    }
}
