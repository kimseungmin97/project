package com.ksm.sport;

import com.ksm.dto.FreeBoard;
import com.ksm.dto.SoccerGame;
import com.ksm.dto.Soccerteam;
import com.ksm.service.BoardService;
import com.ksm.service.GameService;
import com.ksm.service.UserService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
  @Inject
  UserService userservice;
  
  @Inject
  BoardService boardservice;
  
  @Inject
  GameService gameservice;
  
  @RequestMapping(value = "/", method = {RequestMethod.GET})
  public String home(Model model) throws Exception {
    List<FreeBoard> boardList = null;
    boardList = this.boardservice.popularList();
    model.addAttribute("boardList", boardList);
    List<Soccerteam> teamlist = null;
    teamlist = this.gameservice.teamlist();
    model.addAttribute("teamList", teamlist);
    Date time = new Date();
    SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
    date.format(time);
    List<SoccerGame> afterlist = null;
    afterlist = this.gameservice.aftertoday(time);
    model.addAttribute("afterlist", afterlist);
    List<SoccerGame> beforelist = null;
    beforelist = this.gameservice.beforetoday(time);
    model.addAttribute("beforelist", beforelist);
    return "home";
  }
  
  @RequestMapping(value = {"home"}, method = {RequestMethod.GET})
  public String home() throws Exception {
    return "redirect:/";
  }
}
