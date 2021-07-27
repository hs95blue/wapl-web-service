package com.wapl.app.common.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.wapl.app.common.vo.Criteria;

@Mapper
public interface MemberDAO {

  public List selectMemberList(Criteria cri);

  public int selectMemberListTotalCount(Criteria cri);
}
