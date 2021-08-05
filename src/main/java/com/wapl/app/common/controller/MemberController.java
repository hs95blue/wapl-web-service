package com.wapl.app.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.wapl.app.common.service.BoardService;
import com.wapl.app.common.service.MemberService;
import com.wapl.app.common.vo.BoardVO;
import com.wapl.app.common.vo.MemberVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired
  MemberService memberService;

  @Autowired
  BoardService boardService;

  // 회원가입
  @RequestMapping(value = "/join", method = RequestMethod.GET)
  public String join(Model model) {

    return "joinForm";
  }

  @RequestMapping(value = "/join", method = RequestMethod.POST)
  public String joinPost(Model model, MemberVO memberVO, MultipartFile[] uploadFile) {
    String fileName = uploadFile[0].getOriginalFilename();
    memberVO.setImage(fileName);
    memberService.insertMember(memberVO);
    try {
      memberService.insertFile(uploadFile);
    } catch (Exception e) {
      e.getStackTrace();
    }

    return "redirect:/home";
  }

  // 로그인
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String login(Model model) {

    return "loginForm";
  }

  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public String loginPost(Model model, HttpServletRequest request, MemberVO memberVO,
      RedirectAttributes rtts) {
    memberVO.setMemId(request.getParameter("memId"));
    log.info("------------------------------------------------------------------"
        + request.getParameter("memId"));
    memberVO.setPwd(request.getParameter("pwd"));
    if (memberVO.getMemId() != null && memberVO.getPwd() != null) {

      memberVO = memberService.selectMember(memberVO);
      if (memberVO == null) {
        rtts.addFlashAttribute("err_id", "id가 틀렸습니다");
        return "redirect:/member/login";
      }
      String reqPwd = request.getParameter("pwd");
      HttpSession session = request.getSession();
      if (memberVO.getPwd().equals(reqPwd)) {
        session.setAttribute("memId", memberVO.getMemId());
      } else {
        rtts.addFlashAttribute("err_pwd", "password가 틀렸습니다");
        return "redirect:/member/login";
      }
    }
    return "redirect:/home";
  }

  // id 중복 체크 컨트롤러
  @RequestMapping(value = "/idCheck", method = RequestMethod.GET)
  @ResponseBody
  public String idCheck(@RequestParam("userId") String user_id) {
    MemberVO vo = new MemberVO();
    vo.setMemId(user_id);
    vo = memberService.selectMember(vo);
    if (vo != null) {
      return "1";
    } else {
      return "0";
    }

  }

  // id 중복 체크 컨트롤러
  @RequestMapping(value = "/joinProject", method = RequestMethod.POST)
  @ResponseBody
  public String joinProject(@RequestParam("memId") String memId, @RequestParam("bno") int bno,
      MemberVO memberVO) {
    BoardVO boardVO = new BoardVO();
    memberVO.setMemId(memId);
    memberVO.setCurrentPno(bno + ",");
    int result = memberService.updateJoinProject(memberVO);
    boardService.updateJoinProj(boardVO);
    if (result != 0) {
      return "1";
    } else {
      return "0";
    }

  }

  // 로그아웃
  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(Model model, HttpServletRequest request) {
    HttpSession session = request.getSession();
    session.removeAttribute("memId");
    return "loginForm";
  }
  // 회원삭제

  // 회원수정

  // 회원상세
}
