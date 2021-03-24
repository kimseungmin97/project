package com.ksm.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ksm.dto.SoccerGame;
import com.ksm.dto.Soccerteam;

@Repository
public class GameDaoImpl implements GameDao {
  @Inject
  private SqlSession sql;
  
  private static String namespace = "com.board.mappers.soccergame";
  
  public int soccerdate() throws Exception {
    ArrayList<SoccerGame> list = new ArrayList<>();
    for (int i = 1; i < 14; i++) {
      for (int j = 1; j < 14; j++) {
        if (i != j) {
          SoccerGame game = new SoccerGame();
          String a = Integer.toString(i);
          String b = Integer.toString(j);
          if (a.equals("1")) {
            a = "전북현대모터스";
          } else if (a.equals("2")) {
            a = "울산현대축구단";
          } else if (a.equals("3")) {
            a = "포항노틸러스";
          } else if (a.equals("4")) {
            a = "제주유나이티드";
          } else if (a.equals("5")) {
            a = "광주FC";
          } else if (a.equals("6")) {
            a = "수원삼성블루윙즈";
          } else if (a.equals("7")) {
            a = "대구FC";
          } else if (a.equals("8")) {
            a = "수원FC";
          } else if (a.equals("9")) {
            a = "강원FC";
          } else if (a.equals("10")) {
            a = "인천유나이티드";
          } else if (a.equals("11")) {
            a = "상주상무프로축구단";
          } else if (a.equals("12")) {
            a = "FC서울";
          } else if (a.equals("13")) {
            a = "성남FC";
          } 
          if (b.equals("1")) {
        	  b = "전북현대모터스";
          } else if (b.equals("2")) {
            b = "울산현대축구단";
          } else if (b.equals("3")) {
            b = "포항노틸러스";
          } else if (b.equals("4")) {
            b = "제주유나이티드";
          } else if (b.equals("5")) {
            b = "광주FC";
          } else if (b.equals("6")) {
            b = "수원삼성블루윙즈";
          } else if (b.equals("7")) {
            b = "대구FC";
          } else if (b.equals("8")) {
            b = "수원FC";
          } else if (b.equals("9")) {
            b = "강원FC";
          } else if (b.equals("10")) {
            b = "인천유나이티드";
          } else if (b.equals("11")) {
            b = "상주상무프로축구단";
          } else if (b.equals("12")) {
            b = "FC서울";
          } else if (b.equals("13")) {
            b = "성남FC";
          } 
          int[] maxDays = { 
              31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 
              30, 31 };
          int iMinMonth = 1;
          int iMaxMonth = 12;
          int iRandomMonth = (int)(Math.random() * iMaxMonth - iMinMonth + 1.0D) + iMinMonth;
          int iRandomDay = (int)(Math.random() * (maxDays[iRandomMonth - 1] - 2) + 1);
          game.setHome(a);
          game.setAway(b);
          String c = "2021-" + iRandomMonth + "-" + iRandomDay;
          java.sql.Date d = java.sql.Date.valueOf(c);
			game.setIndate(d);
          list.add(game);
        } 
      } 
    } 
    HashMap<String, Object> data = new HashMap<>();
    data.put("list", list);
    return sql.insert(namespace + ".insertgame", data);
  }
  
  public List<SoccerGame> monthlist(int month) throws Exception {
    String startdate = "2021-" + month + "-01";
    String enddate = null;
    if (month == 1 && month == 3 && month == 5 && month == 7 && month == 8 && month == 10 && month == 12) {
      enddate = "2021-" + month + "-31";
    } else if (month == 4 && month == 6 && month == 9 && month == 11) {
      enddate = "2021-" + month + "-30";
    } else {
      enddate = "2021-" + month + "-28";
    } 
    HashMap<String, Object> data = new HashMap<>();
    data.put("startdate", startdate);
    data.put("enddate", enddate);
    return sql.selectList(namespace + ".gamelist", data);
  }
  
  public int count(int month) throws Exception {
    String startdate = "2021-" + month + "-01";
    String enddate = null;
    if (month == 1 && month == 3 && month == 5 && month == 7 && month == 8 && month == 10 && month == 12) {
      enddate = "2021-" + month + "-31";
    } else if (month == 4 && month == 6 && month == 9 && month == 11) {
      enddate = "2021-" + month + "-30";
    } else {
      enddate = "2021-" + month + "-28";
    } 
    HashMap<String, Object> data = new HashMap<>();
    data.put("startdate", startdate);
    data.put("enddate", enddate);
    return sql.selectOne(namespace + ".count", data);
  }
  
  public void updatereuslt(SoccerGame soccerGame) throws Exception {
    HashMap<String, Object> data = new HashMap<>();
    data.put("qseq", soccerGame.getQseq());
    data.put("point", soccerGame.getPoint());
    data.put("losepoint", soccerGame.getLosepoint());
    if (soccerGame.getPoint() > soccerGame.getLosepoint()) {
      data.put("result", "승");
    } else if (soccerGame.getPoint() == soccerGame.getLosepoint()) {
      data.put("result", "무");
    } else if (soccerGame.getPoint() < soccerGame.getLosepoint()) {
      data.put("result", "패");
    } 
    sql.update(namespace + ".update", data);
  }
  
  public void homeupdate(SoccerGame soccerGame) throws Exception {
    sql.update(namespace + ".updatehometeam", soccerGame);
  }
  
  public void awayupdate(SoccerGame soccerGame) throws Exception {
    sql.update(namespace + ".updateawayteam", soccerGame);
  }
  
  public SoccerGame selectone(int qseq) throws Exception {
    return sql.selectOne(namespace + ".selectone", qseq);
  }
  
  public List<Soccerteam> teamlist() throws Exception {
    return sql.selectList(namespace + ".teamlist");
  }
  
  public List<SoccerGame> aftertoday(Date today) throws Exception {
    return sql.selectList(namespace + ".aftertoday", today);
  }
  
  public List<SoccerGame> beforetoday(Date today) throws Exception {
    return sql.selectList(namespace + ".beforetoday", today);
  }

}
