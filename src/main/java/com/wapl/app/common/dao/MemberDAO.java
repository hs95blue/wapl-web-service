package com.wapl.app.common.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.wapl.app.common.vo.Criteria;
import com.wapl.app.common.vo.MemberVO;

@Mapper
public interface MemberDAO {

  public int updateJoinProject(MemberVO memberVO);

  public int insertMember(MemberVO memberVO);

  public List<Criteria> selectMemberList(Criteria cri);

  public int selectMemberListTotalCount(Criteria cri);

  public MemberVO selectMember(MemberVO memberVO);
}
