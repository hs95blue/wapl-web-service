package com.wapl.app.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.wapl.app.common.service.BoardService;
import com.wapl.app.common.vo.BoardVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class BoardController {

  @Autowired
  BoardService boardService;

  @RequestMapping(value = "board/boardForm", method = RequestMethod.GET)
  public String boardForm(Model model, BoardVO boardVO) {
    model.addAttribute("flag", "p");
    model.addAttribute("boardVO", boardVO);
    model.addAttribute("formMode", "insert");
    return "boardForm";
  }

  @RequestMapping(value = "board/updateForm", method = RequestMethod.GET)
  public String boardUpdateForm(Model model, BoardVO boardVO) {
    boardVO = boardService.selectBoardByBno("p", boardVO.getBno());
    model.addAttribute("flag", "p");
    model.addAttribute("boardVO", boardVO);
    model.addAttribute("formMode", "update");
    return "boardForm";
  }

  @RequestMapping(value = "story/storyForm", method = RequestMethod.GET)
  public String storyForm(Model model, BoardVO boardVO) {
    model.addAttribute("flag", "s");
    model.addAttribute("boardVO", boardVO);
    model.addAttribute("formMode", "insert");
    return "boardForm";
  }

  @RequestMapping(value = "story/updateForm", method = RequestMethod.GET)
  public String storyUpdateForm(Model model, BoardVO boardVO) {
    boardVO = boardService.selectBoardByBno("s", boardVO.getBno());
    model.addAttribute("flag", "s");
    model.addAttribute("boardVO", boardVO);
    model.addAttribute("formMode", "update");
    return "boardForm";
  }

  @RequestMapping(value = "board/boardForm", method = RequestMethod.POST)
  public String boardFormPost(Model model, BoardVO boardVO, MultipartFile[] uploadFile) {
    String fileName = uploadFile[0].getOriginalFilename();
    boardVO.setThumnail(fileName);
    boardService.insertBoard(boardVO);
    try {
      boardService.insertFile(uploadFile);
    } catch (Exception e) {
      e.getStackTrace();
    }

    return "redirect:/projectList";
  }

  @RequestMapping(value = "story/storyForm", method = RequestMethod.POST)
  public String storyFormPost(Model model, BoardVO boardVO, MultipartFile[] uploadFile) {
    String fileName = uploadFile[0].getOriginalFilename();
    boardVO.setThumnail(fileName);
    boardService.insertBoard(boardVO);
    try {
      boardService.insertFile(uploadFile);
    } catch (Exception e) {
      e.getStackTrace();
    }

    return "redirect:/storyList";
  }

  @RequestMapping(value = "story/updateForm", method = RequestMethod.POST)
  public String storyUpdateFormPost(Model model, BoardVO boardVO, MultipartFile[] uploadFile) {
    String fileName = uploadFile[0].getOriginalFilename();
    boardVO.setThumnail(fileName);
    boardService.updateBoard(boardVO);
    try {
      boardService.insertFile(uploadFile);
    } catch (Exception e) {
      e.getStackTrace();
    }

    return "redirect:/storyList";
  }


  @RequestMapping(value = "board/updateForm", method = RequestMethod.POST)
  public String boardUpdateFormPost(Model model, BoardVO boardVO, MultipartFile[] uploadFile) {
    String fileName = uploadFile[0].getOriginalFilename();
    boardVO.setThumnail(fileName);
    boardService.updateBoard(boardVO);
    try {
      boardService.insertFile(uploadFile);
    } catch (Exception e) {
      e.getStackTrace();
    }

    return "redirect:/projectList";
  }


  @RequestMapping(value = "board/boardInfo", method = RequestMethod.GET)
  public String boardInfo(Model model, BoardVO boardVO) {
    boardVO = boardService.selectBoardByBno("p", boardVO.getBno());
    model.addAttribute("flag", "p");
    model.addAttribute("boardVO", boardVO);
    model.addAttribute("type", boardVO.getBType());
    return "boardInfo";
  }



  @RequestMapping(value = "story/storyInfo", method = RequestMethod.GET)
  public String storyInfo(Model model, BoardVO boardVO) {
    boardVO = boardService.selectBoardByBno("s", boardVO.getBno());
    model.addAttribute("boardVO", boardVO);
    model.addAttribute("type", boardVO.getBType());
    model.addAttribute("flag", "s");
    return "boardInfo";
  }
  /*
   * @PostMapping("/boardwrite") public ModelAndView boardWrite(@ModelAttribute BoardVO board,
   * MultipartHttpServletRequest multi) { ModelAndView mv = new ModelAndView(); String path =
   * multi.getServletContext().getRealPath("/uploadLecture/"); try { MultipartFile orgfile =
   * multi.getFile("upfile"); File destFile = new File(path + orgfile.getOriginalFilename());
   * board.setBOARD_FILE(orgfile.getOriginalFilename()); orgfile.transferTo(destFile);
   * boardService.regBoard(board); // db insert mv.setViewName("redirect:/board/boardlist"); } catch
   * (Exception e) { e.printStackTrace(); mv.addObject("err", "새 글 등록 실패");
   * 
   * mv.setViewName("/board/err"); } return mv; }
   */

  @RequestMapping(value = "board/deleteBoard", method = RequestMethod.POST)
  @ResponseBody
  public String deleteBoard(Model model, BoardVO boardVO, @RequestParam("bno") int bno) {
    boardVO.setBno(bno);
    int result = boardService.deleteBoard(boardVO);
    if (result == 1) {
      return "1";
    } else {
      return "0";
    }
  }


}
