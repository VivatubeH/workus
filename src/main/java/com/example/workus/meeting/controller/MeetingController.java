package com.example.workus.meeting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/meeting")
public class MeetingController {

    @GetMapping("/list")
    public String list(){

        return "meeting/list";
    }
}
