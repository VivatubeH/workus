package com.example.workus.archive.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/archive")
public class ArchiveController {

    @GetMapping("/list")
    public String list(){

        return "archive/list";
    }
}
