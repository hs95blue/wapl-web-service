package com.wapl.app.common.controller;

import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.wapl.app.common.dto.PageDTO;
import com.wapl.app.common.service.BoardService;
import com.wapl.app.common.service.MemberService;
import com.wapl.app.common.vo.Criteria;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  @Autowired
  private BoardService boardservice;
  @Autowired
  private MemberService memberservice;

  /**
   * Simply selects the home view to render by returning its name.
   */
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(Locale locale, Criteria cri, Model model) {
    logger.info("***********************home******************");
    List<String> newProjList = boardservice.selectBoardListByNew(cri, "p");// 뉴프로젝트는 최신순
    List<String> projList = boardservice.selectBoardList(cri, "p");// 모집중 프로젝트는 인원안찬것중에 오래된 순
    List<String> storyList = boardservice.selectBoardList(cri, "s");// 최신순
    List<String> board = boardservice.selectBoardByBno("p", 1);// 최신순
    List memberList = memberservice.selectMemberList(cri);// 최신순
    /*
     * Date date = new Date(); DateFormat dateFormat =
     * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
     * 
     * String formattedDate = dateFormat.format(date);
     */
    model.addAttribute("newProjList", newProjList);
    model.addAttribute("projList", projList);
    model.addAttribute("storyList", storyList);
    model.addAttribute("memberList", memberList);

    return "home";
  }

  @RequestMapping(value = "/memberList", method = RequestMethod.GET)
  public String memberList(Criteria cri, Model model) {
    int total = memberservice.selectMemberListTotalCount(cri);
    List memberList = memberservice.selectMemberList(cri);
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    model.addAttribute("memberList", memberList);
    return "memberList";
  }

  @RequestMapping(value = "/projectList", method = RequestMethod.GET)
  public String projList(Criteria cri, Model model) {
    int total = boardservice.selectBoardListTotalCount(cri, "p");
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    List<String> projList = boardservice.selectBoardList(cri, "p");
    model.addAttribute("projList", projList);
    return "projectList";
  }

  @RequestMapping(value = "/storyList", method = RequestMethod.GET)
  public String storyList(Criteria cri, Model model) {
    int total = boardservice.selectBoardListTotalCount(cri, "s");
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    List<String> storyList = boardservice.selectBoardList(cri, "s");
    model.addAttribute("storyList", storyList);
    return "storyList";
  }

  @RequestMapping(value = "/lounge", method = RequestMethod.GET)
  public String lounge(Criteria cri, Model model) {
    int total = boardservice.selectBoardListTotalCount(cri, "l");
    model.addAttribute("pageMaker", new PageDTO(cri, total));
    List<String> loungeList = boardservice.selectBoardList(cri, "l");
    model.addAttribute("loungeList", loungeList);
    return "lounge";
  }
}
