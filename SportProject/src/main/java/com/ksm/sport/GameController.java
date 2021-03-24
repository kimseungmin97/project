package com.ksm.sport;


import com.ksm.dto.SoccerGame;
import com.ksm.service.GameService;
import java.util.Calendar;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = {"/game"}, method = {RequestMethod.POST, RequestMethod.GET})
public class GameController {
  @Inject
  GameService service;
  
  @RequestMapping(value = {"/soccergameinsert"}, method = {RequestMethod.POST})
  public String soccergameinsert() throws Exception {
    this.service.soccerdate();
    return "redirect:/";
  }
  
  @RequestMapping(value = {"/Sportmanage"}, method = {RequestMethod.POST})
  public String Sportmanage() throws Exception {
    return "Sportmanage";
  }
  
  @RequestMapping(value = {"/monthgamemanage"}, method = {RequestMethod.POST})
  public String monthgamemanage(@RequestParam("month") int month, Model model) throws Exception {
    int a = this.service.count(month);
    List<SoccerGame> list = null;
    list = this.service.monthlist(month);
    model.addAttribute("list", list);
    return "Sportmanage";
  }
  
  @RequestMapping(value = {"/soccerupdate"}, method = {RequestMethod.POST})
  public String soccerupdate(SoccerGame soccerGame, @RequestParam("qseq") int qseq, @RequestParam("point") int point, @RequestParam("losepoint") int losepoint) throws Exception {
    this.service.updatereuslt(soccerGame);
    SoccerGame selectone = this.service.selectone(qseq);
    this.service.awayupdate(selectone);
    this.service.homeupdate(selectone);
    return "Sportmanage";
  }
  
  @RequestMapping(value = {"/SportCalendar"}, method = {RequestMethod.POST})
  public String SportCalendar(Model model) throws Exception {
    Calendar cal = Calendar.getInstance();
    int month = cal.get(2) + 1;
    List<SoccerGame> list = null;
    list = this.service.monthlist(month);
    model.addAttribute("list", list);
    model.addAttribute("nowmonth", Integer.valueOf(month));
    return "SportCalendar";
  }
  
  @RequestMapping(value = {"/month"}, method = {RequestMethod.POST})
  public String monthgame(@RequestParam("month") int month, Model model) throws Exception {
    int a = this.service.count(month);
    List<SoccerGame> list = null;
    list = this.service.monthlist(month);
    model.addAttribute("list", list);
    model.addAttribute("nowmonth", Integer.valueOf(month));
    return "SportCalendar";
  }
}
