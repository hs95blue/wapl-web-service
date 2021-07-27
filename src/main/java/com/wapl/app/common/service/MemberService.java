package com.wapl.app.common.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wapl.app.common.dao.MemberDAO;
import com.wapl.app.common.vo.Criteria;

@Service
public class MemberService {

  @Autowired
  MemberDAO dao;

  public List selectMemberList(Criteria cri) {
    return dao.selectMemberList(cri);
  }

  public int selectMemberListTotalCount(Criteria cri) {
    return dao.selectMemberListTotalCount(cri);
  }
}
