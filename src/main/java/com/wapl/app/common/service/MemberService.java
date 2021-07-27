package com.wapl.app.common.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wapl.app.common.dao.MemberDAO;

@Service
public class MemberService {

  @Autowired
  MemberDAO dao;

  public List selectMemberList() {
    return dao.selectMemberList();
  }
}
