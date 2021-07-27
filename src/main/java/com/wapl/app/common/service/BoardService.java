package com.wapl.app.common.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wapl.app.common.dao.BoardDAO;
import com.wapl.app.common.vo.Criteria;

@Service
public class BoardService {

  @Autowired
  BoardDAO dao;

  public List<String> selectBoardByBno(String bType, int bno) {
    return dao.selectBoardByBno(bType, bno);
  }

  public List<String> selectBoardList(Criteria cri, String bType) {
    return dao.selectBoardList(cri, bType);
  }

  public List<String> selectBoardListByNew(Criteria cri, String bType) {
    return dao.selectBoardListByNew(cri, bType);
  }

  public List<String> selectBoardListByRecruit(Criteria cri, String bType) {
    return dao.selectBoardListByRecruit(cri, bType);
  }

  public int selectBoardListTotalCount(Criteria cri, String bType) {
    return dao.selectBoardListTotalCount(cri, bType);
  }

  public int selectBoardListByRecruitTotalCount(Criteria cri, String bType) {
    return dao.selectBoardListByRecruitTotalCount(cri, bType);
  }

}
