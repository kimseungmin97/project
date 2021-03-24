package com.ksm.sport;

import com.ksm.dto.QnA;
import com.ksm.dto.User;
import com.ksm.service.QnaService;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = {"/qna"}, method = {RequestMethod.POST, RequestMethod.GET})
public class QnaController {
  @Inject
  QnaService service;
  
  @RequestMapping(value = {"qnainsertpage"}, method = {RequestMethod.POST})
  public String qnainsertpage(QnA qna) throws Exception {
    return "QnAInsert";
  }
  
  @RequestMapping(value = {"qnainsert"}, method = {RequestMethod.POST})
  public String qnainsert(QnA qna) throws Exception {
    this.service.insert(qna);
    return "redirect:/qna/qnalist";
  }
  
  @RequestMapping(value = {"/qnalist"}, method = {RequestMethod.POST})
  public String qnalist(QnA qna, HttpServletRequest req, Model model) throws Exception {
    HttpSession session = req.getSession();
    User user = (User)session.getAttribute("user");
    List<QnA> qnalist = null;
    qnalist = this.service.list(user.getId());
    model.addAttribute("qnalist", qnalist);
    return "QnAList";
  }
  
  @RequestMapping(value = {"/qnadetail"}, method = {RequestMethod.GET})
  public String qnadetail(QnA qna, Model model, @RequestParam("qseq") int qseq) throws Exception {
    QnA detail = this.service.detail(qna);
    model.addAttribute("qna", detail);
    return "QnADetail";
  }
  
  @RequestMapping(value = {"/qnalistall"}, method = {RequestMethod.POST})
  public String qnalistall(QnA qna, HttpServletRequest req, Model model) throws Exception {
    List<QnA> qnalist = null;
    qnalist = this.service.allList();
    model.addAttribute("qnalist", qnalist);
    return "QnAListAll";
  }
  
  @RequestMapping(value = {"/qnareply"}, method = {RequestMethod.POST})
  public String qnareply(QnA qna, Model model) throws Exception {
    this.service.qnareply(qna);
    return "redirect:/qna/qnadetail?qseq=" + qna.getQseq();
  }
}
