package com.wapl.app.common.service;

import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import com.wapl.app.common.dao.MemberDAO;
import com.wapl.app.common.vo.Criteria;
import com.wapl.app.common.vo.MemberVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberService {

  @Autowired
  MemberDAO dao;

  public MemberVO selectMember(MemberVO memberVO) {
    return dao.selectMember(memberVO);
  }

  public List<Criteria> selectMemberList(Criteria cri) {
    return dao.selectMemberList(cri);
  }

  public int selectMemberListTotalCount(Criteria cri) {
    return dao.selectMemberListTotalCount(cri);
  }

  public int insertMember(MemberVO memberVO) {
    return dao.insertMember(memberVO);
  }

  public int updateJoinProject(MemberVO memberVO) {
    return dao.updateJoinProject(memberVO);
  }

  public void insertFile(MultipartFile[] uploadFile) throws Exception {
    ServletRequestAttributes attr =
        (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    String contextPath = attr.getRequest().getContextPath();
    String uploadFolder = contextPath + "/resources/image/";
    log.info(uploadFolder);
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
