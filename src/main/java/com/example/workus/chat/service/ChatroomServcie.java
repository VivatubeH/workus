package com.example.workus.chat.service;

import com.example.workus.chat.dto.ChatroomDto;
import com.example.workus.chat.mapper.ChatroomMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class ChatroomServcie {

    private final ChatroomMapper chatroomMapper;

    @Autowired
    public ChatroomServcie(ChatroomMapper chatroomMapper) {
        this.chatroomMapper = chatroomMapper;
    }

    /**
     * @return 로그인한 유저no가 참여중인 채팅방들
     */
    public List<ChatroomDto> getAllChatrooms(int userNo) {
        List<Integer> getAllChatroomNoByUserNo = chatroomMapper.getChatroomNoByUserNo(userNo);
        List<ChatroomDto> chatroomList = new ArrayList<>();
        for (int chatroomNo : getAllChatroomNoByUserNo) {
            chatroomList.add(chatroomMapper.getChatRoom(chatroomNo));
        }

        return chatroomList;
    }
}