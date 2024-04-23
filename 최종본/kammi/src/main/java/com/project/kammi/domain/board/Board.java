package com.project.kammi.domain.board;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Board {                    // - BoardVO 역활
    private int id;
    private String title;               // 1. 상태
    private String content;             // 2. 내용
    private String author;              // 3. 작성자
    private String ready;               // 4. 요청
    private String run;                 // 5. 진행
    private String complete;            // 6. 완료
    private String notification;        // 7. 공지
}
