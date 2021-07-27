package com.wapl.app.common.vo;

import lombok.Data;

@Data
public class ReplyVO {
  // 시퀀스
  private String rno;
  // 참조 게시글 넘버
  private String bno;
  // 댓글내용
  private String reply;
  // 댓글작성자
  private String replyer;
  // 작성날짜
  private String regDate;
  // 수정날짜
  private String updateDate;
}
