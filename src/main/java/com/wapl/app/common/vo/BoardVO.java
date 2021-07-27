package com.wapl.app.common.vo;

import lombok.Data;


@Data
public class BoardVO {

  // 기본키 시퀀스
  // 게시판타입 ex)p,l,s
  // 제목
  // 내용
  // 작성자
  // 조회수
  // 좋아요수
  // 작성날짜
  // 수정날짜


  private String bno;
  private String bType;
  private String title;
  private String content;
  private String writer;
  private int hits;

  // private int likeCnt;
  private int memCnt;
  private int totMemCnt;

  private String thumnail;
  private String status;
  private String regDate;
  private String updateDate;

}
