package com.wapl.app.common.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class ReplyVO {
  // 시퀀스
  private int rno;
  // 참조 게시글 넘버
  private int bno;
  // 댓글내용
  private String reply;
  // 댓글작성자
  private String replyer;
  // 작성날짜
  private Date regDate;
  // 수정날짜
  private Date updateDate;
}
