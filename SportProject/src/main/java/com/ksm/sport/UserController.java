package com.ksm.sport;


import com.ksm.dto.User;
import com.ksm.service.UserService;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = {"/user"}, method = {RequestMethod.POST, RequestMethod.GET})
public class UserController {
  @Inject
  UserService service;
  
  @RequestMapping(value = {"/Loginpage"}, method = {RequestMethod.POST, RequestMethod.GET})
  public String Loginpage() throws Exception {
    return "Login";
  }
  
  @RequestMapping(value = {"/Login"}, method = {RequestMethod.POST})
  public String Login(User user, Model model, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
    User Loginuser = this.service.exist(user);
    HttpSession session = req.getSession();
    if (Loginuser != null) {
      model.addAttribute("user", Loginuser);
      session.setAttribute("user", Loginuser);
    } else {
      return "LoginFail";
    } 
    return "redirect:/";
  }
  
  @RequestMapping(value = {"/Createpage"}, method = {RequestMethod.GET})
  public String Createpage() throws Exception {
    return "Create";
  }
  
  @RequestMapping(value = {"/idcheck"}, method = {RequestMethod.POST})
  @ResponseBody
  public int idcheck(@RequestBody String id) throws Exception {
    System.out.println(id);
    return this.service.idcheck(id);
  }
  
  @RequestMapping(value = {"/insert"}, method = {RequestMethod.POST})
  public String insert(User user) throws Exception {
    this.service.insert(user);
    return "redirect:/";
  }
  
  @RequestMapping(value = {"/SearchIdpage"}, method = {RequestMethod.GET})
  public String SearchIdpage() throws Exception {
    return "SearchId";
  }
  
  @RequestMapping(value = {"/SearchId"}, method = {RequestMethod.POST})
  public String SearchId(User user, Model model, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
    User searchiduser = this.service.searchid(user);
    if (searchiduser != null) {
      model.addAttribute("user", searchiduser);
    } else {
      return "SearchIdFail";
    } 
    return "ResultId";
  }
  
  @RequestMapping(value = {"/SearchPwpage"}, method = {RequestMethod.GET})
  public String SearchPwpage() throws Exception {
    return "SearchPw";
  }
  
  @RequestMapping(value = {"/SearchPw"}, method = {RequestMethod.POST})
  public String SearchPw(User user, Model model, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
    User searchpwuser = this.service.searchpw(user);
    if (searchpwuser != null) {
      model.addAttribute("user", searchpwuser);
    } else {
      return "SearchPwFail";
    } 
    return "ResultPw";
  }
  
  @RequestMapping(value = {"/UserUpdatepage"}, method = {RequestMethod.POST})
  public String UserUpdatepage(User user, HttpServletRequest req, Model model) throws Exception {
    HttpSession session = req.getSession();
    User updateuser = (User)session.getAttribute("user");
    model.addAttribute("user", updateuser);
    return "UserUpdate";
  }
  
  @RequestMapping(value = {"/UserUpdate"}, method = {RequestMethod.POST})
  public String UserUpdate(User user, HttpServletRequest req, Model model) throws Exception {
    HttpSession session = req.getSession();
    this.service.UpdateUser(user);
    User updateuser = this.service.select(user.getId());
    session.setAttribute("user", updateuser);
    return "redirect:/";
  }
  
  @RequestMapping(value = {"/ChangePwpage"}, method = {RequestMethod.GET})
  public String ChangePwpage(User user, HttpServletRequest req, Model model) throws Exception {
    return "ChangePw";
  }
  
  @RequestMapping(value = {"/ChangePw"}, method = {RequestMethod.GET})
  public String ChangePw(User user, String pw2, String nowpw, HttpServletRequest req, Model model) throws Exception {
    HttpSession session = req.getSession();
    User pwuser = (User)session.getAttribute("user");
    if (pwuser.getPw().equals(nowpw)) {
      String id = pwuser.getId();
      this.service.pwupdate(id, pw2);
      User upuser = this.service.select(id);
      session.setAttribute("user", upuser);
      return "redirect:/";
    } 
    return "ChangePwFail";
  }
  
  @RequestMapping(value = {"/UserDeletepage"}, method = {RequestMethod.POST})
  public String UserDeletepage(User user, HttpServletRequest req, Model model) throws Exception {
    HttpSession session = req.getSession();
    return "UserDelete";
  }
  
  @RequestMapping(value = {"/UserDelete"}, method = {RequestMethod.POST})
  public String UserDelete(HttpServletRequest req, Model model) throws Exception {
    HttpSession session = req.getSession();
    User deleteuser = (User)session.getAttribute("user");
    this.service.deleteuser(deleteuser);
    session.setAttribute("user", null);
    return "redirect:/";
  }
  
  @RequestMapping(value = {"/Logoutpage"}, method = {RequestMethod.GET})
  public String Logoutpage(HttpServletRequest req) throws Exception {
    HttpSession session = req.getSession();
    session.setAttribute("user", null);
    return "redirect:/";
  }
  
  @RequestMapping(value = {"/infoinsertpage"}, method = {RequestMethod.POST})
  public String infoinsertpage() throws Exception {
    return "infoinsert";
  }
}
