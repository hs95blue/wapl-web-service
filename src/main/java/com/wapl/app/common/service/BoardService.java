package com.wapl.app.common.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wapl.app.common.dao.BoardDAO;

@Service
public class BoardService {

  @Autowired
  BoardDAO dao;

  public List<String> selectBoardByBno(String type, int bno) {
    return dao.selectBoardByBno(type, bno);
  }

  public List<String> selectBoardList(String type) {
    return dao.selectBoardList(type);
  }

  public List<String> selectBoardListByNew(String type) {
    return dao.selectBoardListByNew(type);
  }

  public List<String> selectBoardListByRecruit(String type) {
    return dao.selectBoardListByRecruit(type);
  }
}
