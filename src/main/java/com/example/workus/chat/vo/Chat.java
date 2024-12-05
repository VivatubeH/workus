package com.example.workus.chat.vo;

import com.example.workus.user.vo.User;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Alias("Chat")
public class Chat {
    private Long no;
    private String content;
    private String file;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime time;
    private Character isFirst;
    private User user;
    private Chatroom chatroom;
    private String type;
}
