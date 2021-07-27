package com.wapl.app.common.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardDAO {

  public List<String> selectBoardByBno(@Param("type") String type, @Param("bno") int bno);

  public List<String> selectBoardList(String type);

  public List<String> selectBoardListByNew(String type);

  public List<String> selectBoardListByRecruit(String type);
}
