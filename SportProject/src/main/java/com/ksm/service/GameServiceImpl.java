package com.ksm.service;

import com.ksm.dao.GameDao;
import com.ksm.dto.SoccerGame;
import com.ksm.dto.Soccerteam;
import com.ksm.service.GameService;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service
public class GameServiceImpl implements GameService {
  @Inject
  private GameDao dao;
  
  @Override
  public int soccerdate() throws Exception {
    return dao.soccerdate();
  }
  @Override
  public List<SoccerGame> monthlist(int month) throws Exception {
    return dao.monthlist(month);
  }
  @Override
  public int count(int month) throws Exception {
    return dao.count(month);
  }
  @Override
  public void updatereuslt(SoccerGame soccerGame) throws Exception {
   dao.updatereuslt(soccerGame);
  }
  @Override
  public void homeupdate(SoccerGame soccerGame) throws Exception {
    dao.homeupdate(soccerGame);
  }
  @Override
  public void awayupdate(SoccerGame soccerGame) throws Exception {
    dao.awayupdate(soccerGame);
  }
  @Override
  public SoccerGame selectone(int qseq) throws Exception {
    return dao.selectone(qseq);
  }
  @Override
  public List<Soccerteam> teamlist() throws Exception {
    return dao.teamlist();
  }
  @Override
  public List<SoccerGame> aftertoday(Date today) throws Exception {
    return dao.aftertoday(today);
  }
  @Override
  public List<SoccerGame> beforetoday(Date today) throws Exception {
    return dao.beforetoday(today);
  }
}
