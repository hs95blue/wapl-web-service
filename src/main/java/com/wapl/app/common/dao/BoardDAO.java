package com.wapl.app.common.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.wapl.app.common.vo.Criteria;

@Mapper
public interface BoardDAO {

  public List<String> selectBoardByBno(@Param("type") String type, @Param("bno") int bno);

  public List<String> selectBoardList(@Param("cri") Criteria cri, @Param("bType") String bType);

  public List<String> selectBoardListByNew(@Param("cri") Criteria cri,
      @Param("bType") String bType);

  public List<String> selectBoardListByRecruit(@Param("cri") Criteria cri,
      @Param("bType") String bType);

  public int selectBoardListTotalCount(@Param("cri") Criteria cri, @Param("bType") String bType);

  public int selectBoardListByRecruitTotalCount(@Param("cri") Criteria cri,
      @Param("bType") String bType);

}
