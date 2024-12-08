package com.example.workus.chat.controller;

import com.example.workus.chat.dto.ChatForm;
import com.example.workus.common.dto.ListDto;
import com.example.workus.common.dto.RestResponseDto;
import com.example.workus.chat.service.ChatService;
import com.example.workus.chat.vo.Chat;
import com.example.workus.chat.vo.Chatroom;
import com.example.workus.security.LoginUser;
import com.example.workus.user.vo.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/ajax")
public class RestChatController {

    private final ChatService chatService;

    @Autowired
    public RestChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    @GetMapping("/chat/{page}/{chatroomNo}")
    ResponseEntity<RestResponseDto<ListDto<Chat>>> getAllChats(
            @AuthenticationPrincipal LoginUser loginUser,
            @PathVariable("chatroomNo") Long chatroomNo,
            @PathVariable("page") int page) {
        return ResponseEntity.ok(RestResponseDto.success(chatService.getAllChatsByChatroomNo(loginUser.getNo(), chatroomNo, page)));
    }

    @PostMapping("/chat/{chatroomNo}")
    ResponseEntity<RestResponseDto<Chat>> insertChat(
            @AuthenticationPrincipal LoginUser loginUser,
            @PathVariable("chatroomNo") Long chatroomNo,
            @ModelAttribute ChatForm chatForm) {
        Chat chat = new Chat();
        Chatroom chatroom = new Chatroom();
        chatroom.setNo(chatroomNo);
        chat.setChatroom(chatroom);
        chat.setContent(chatForm.getContent());
        User user = new User();
        user.setNo(loginUser.getNo());
        chat.setUser(user);
        return ResponseEntity.ok(RestResponseDto.success(chatService.insertChat(chat)));
    }

    @PostMapping("/chat/upload")
    ResponseEntity<RestResponseDto<Chat>> uploadFile(@ModelAttribute ChatForm chatForm) {
        return ResponseEntity.ok(RestResponseDto.success(chatService.uploadFile(chatForm)));
    }
}
