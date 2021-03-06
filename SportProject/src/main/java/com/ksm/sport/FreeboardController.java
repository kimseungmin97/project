package com.ksm.sport;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksm.dto.Fbreply;
import com.ksm.dto.FreeBoard;
import com.ksm.service.BoardService;

@Controller
@RequestMapping(value = {"/freeboard"}, method = {RequestMethod.POST, RequestMethod.GET})
public class FreeboardController {
  @Inject
  BoardService service;
  
  @RequestMapping(value = {"/FreeBoardInsertpage"}, method = {RequestMethod.POST})
  public String boardinsertpage() throws Exception {
    return "FreeBoardInsert";
  }
  
  @RequestMapping(value = {"/FreeBoardInsert"}, method = {RequestMethod.POST})
  public String boardinsert(FreeBoard freeboard) throws Exception {
    service.insert(freeboard);
    return "redirect:/freeboard/FreeBoardList?num=1";
  }
  
  @RequestMapping(value = {"/FreeBoardList"}, method = {RequestMethod.GET})
  public String freeboardlist(Model model, @RequestParam("num") int num) throws Exception {
    int count = service.count();
    int postNum = 10;
    int pageNum = (count / postNum) + 1;
    int displayPost = (num - 1) * postNum;
    List<FreeBoard> list = null;
    list = service.list(displayPost, postNum);
    model.addAttribute("list", list);
    model.addAttribute("pageNum", pageNum);
    return "FreeBoardList";
  }
  
  @RequestMapping(value = {"/FreeBoardDetail"}, method = {RequestMethod.GET})
  public String freeboardDetail(FreeBoard freeboard, Fbreply fbreply, Model model, @RequestParam("qseq") int qseq) throws Exception {
    service.viewplus(freeboard);
    FreeBoard detail = service.detail(freeboard);
    List<Fbreply> replylist = null;
    replylist = service.replist(fbreply);
    model.addAttribute("freeboard", detail);
    model.addAttribute("replyList", replylist);
    return "FreeBoardDetail";
  }
  
  @RequestMapping(value = {"/FreeBoardChangepage"}, method = {RequestMethod.POST})
  public String FreeBoardChangepage(FreeBoard freeboard, Model model, @RequestParam("qseq") int qseq) throws Exception {
    FreeBoard detail = service.detail(freeboard);
    model.addAttribute("freeboard", detail);
    return "FreeBoardUpdate";
  }
  
  @RequestMapping(value = {"/FreeBoardUpdate"}, method = {RequestMethod.GET})
  public String boardupdate(FreeBoard freeboard, @RequestParam("qseq") int qseq) throws Exception {
    service.update(freeboard);
    return "redirect:/freeboard/FreeBoardList?num=1";
  }
  
  @RequestMapping(value = {"/FreeBoardDelete"}, method = {RequestMethod.GET})
  public String boardDelete(@RequestParam("qseq") int qseq) throws Exception {
    service.delete(qseq);
    return "redirect:/freeboard/FreeBoardList?num=1";
  }
  
  @RequestMapping(value = {"/FreeBoardSearch"}, method = {RequestMethod.GET})
  public String boardsearch(Model model, @RequestParam("selectbox") String selectbox, @RequestParam("searchtext") String searchtext) throws Exception {
    int count = service.searchcount(selectbox, searchtext);
    int postNum = 10;
    int pageNum = count / postNum + 1;
    int displayPost = (pageNum - 1) * postNum;
    List<FreeBoard> searchlist = null;
    searchlist = service.searchlist(displayPost, postNum, selectbox, searchtext);
    model.addAttribute("searchlist", searchlist);
    model.addAttribute("pageNum", Integer.valueOf(pageNum));
    return "FreeBoardSearchList";
  }
  
  @RequestMapping(value = {"/fbreply"}, method = {RequestMethod.POST})
  public String fbreplyinsert(Fbreply fbreply) throws Exception {
    service.repinsert(fbreply);
    return "redirect:/freeboard/FreeBoardDetail?qseq=" + fbreply.getQseq();
  }
}
