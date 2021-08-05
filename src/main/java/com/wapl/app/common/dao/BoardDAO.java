package com.wapl.app.common.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.wapl.app.common.vo.BoardVO;
import com.wapl.app.common.vo.Criteria;

@Mapper
public interface BoardDAO {
  public int updateJoinProj(BoardVO vo);

  public int deleteBoard(BoardVO vo);

  public int updateBoard(BoardVO vo);

  public int insertBoard(BoardVO vo);

  public BoardVO selectBoardByBno(@Param("bType") String bType, @Param("bno") int bno);

  public List<String> selectBoardList(@Param("cri") Criteria cri, @Param("bType") String bType);

  public List<String> selectBoardListByNew(@Param("cri") Criteria cri,
      @Param("bType") String bType);

  public int selectBoardListTotalCount(@Param("cri") Criteria cri, @Param("bType") String bType);


}
