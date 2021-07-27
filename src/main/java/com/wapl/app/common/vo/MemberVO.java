package com.wapl.app.common.vo;

import java.util.Arrays;
import lombok.Data;

@Data
public class MemberVO {

  // 시퀀스번호
  private String mno;
  private String currentPno;
  private int finishedProjCnt;
  private String finishedPno;
  // id
  private String id;
  // password
  private String pwd;
  // 나이
  private String age;
  // 성별
  private String sex;
  // email
  private String email;
  // mobile
  private String tel;
  // 가입일
  private String regDate;
  // 정보수정일
  private String updateDate;

  private int memLevel;

  private String nickname;
  private String position1;
  private String position2;
  private String position1Level;
  private String position2Level;
  private int size;

  public void setCurrentPno(String currentPno) {
    this.currentPno = currentPno;
    array = Arrays.stream(currentPno.split(",")).mapToInt(Integer::parseInt).toArray();
    size = array.length;
  }

  int[] array;
}
