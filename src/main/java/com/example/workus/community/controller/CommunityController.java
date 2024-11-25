package com.example.workus.community.controller;

import com.example.workus.community.dto.CommentForm;
import com.example.workus.community.dto.FeedForm;
import com.example.workus.community.service.CommunityService;
import com.example.workus.community.vo.Feed;
import com.example.workus.community.vo.Reply;
import com.example.workus.security.LoginUser;
import com.example.workus.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/community")
public class CommunityController {

    @Autowired
    CommunityService communityService;

    @GetMapping("/list")
    public String list(){
        return "community/list";
    }

    @GetMapping("/items")
    @ResponseBody
    public List<Feed> getFeeds(@RequestParam(name ="page", required = false, defaultValue = "1") int page){
        List<Feed> feeds = communityService.getFeeds(page);
        return feeds;
    }

    @GetMapping("form")
    public String form(){
       return "community/form";
    }

    @PostMapping("/insertFeed")
    public String addFeed(FeedForm form ,@AuthenticationPrincipal LoginUser loginUser){
        Long userNo = loginUser.getNo();

        communityService.insertFeed(form, userNo);
        return "redirect:/community/list";
   }

   @PostMapping("/insertComment")
    public String insert(CommentForm commentForm, @AuthenticationPrincipal LoginUser loginUser){
       Long userNo = loginUser.getNo();
       commentForm.setUserNo(userNo);

       communityService.insertReply(commentForm, userNo);
       return "redirect:/community/list";
   }

}
