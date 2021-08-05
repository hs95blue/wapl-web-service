package com.wapl.app.common.service;

import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import com.wapl.app.common.dao.BoardDAO;
import com.wapl.app.common.vo.BoardVO;
import com.wapl.app.common.vo.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardService {

  @Autowired
  BoardDAO dao;

  public int updateJoinProj(BoardVO vo) {
    return dao.updateJoinProj(vo);
  }

  public int deleteBoard(BoardVO vo) {
    return dao.deleteBoard(vo);
  }

  public int updateBoard(BoardVO vo) {
    return dao.updateBoard(vo);
  }

  public int insertBoard(BoardVO vo) {
    return dao.insertBoard(vo);
  }


  public BoardVO selectBoardByBno(String bType, int bno) {
    return dao.selectBoardByBno(bType, bno);
  }

  public List<String> selectBoardList(Criteria cri, String bType) {
    return dao.selectBoardList(cri, bType);
  }

  public List<String> selectBoardListByNew(Criteria cri, String bType) {
    return dao.selectBoardListByNew(cri, bType);
  }


  public int selectBoardListTotalCount(Criteria cri, String bType) {
    return dao.selectBoardListTotalCount(cri, bType);
  }

  public void insertFile(MultipartFile[] uploadFile) throws Exception {
    ServletRequestAttributes attr =
        (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    String contextPath = attr.getRequest().getContextPath();
    String uploadFolder = contextPath + "/resources/image/";
    for (MultipartFile multipartFile : uploadFile) {
      log.info("------------------------------");
      log.info("uploadFileName:" + multipartFile.getOriginalFilename());
      log.info("uploadFileSize:" + multipartFile.getSize());
      if (multipartFile.isEmpty()) {
        break;
      }
      File folder = new File(uploadFolder);
      if (!folder.exists()) {
        try {
          folder.mkdir(); // 폴더 생성합니다.
          System.out.println("폴더가 생성되었습니다.");
        } catch (Exception e) {
          e.getStackTrace();
        }
      } else {
        System.out.println("이미 폴더가 생성되어 있습니다.");
      }

      File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

      try {
        multipartFile.transferTo(saveFile);
      } catch (Exception e) {
        log.error(e.getMessage());
      }
    }
  }

}
