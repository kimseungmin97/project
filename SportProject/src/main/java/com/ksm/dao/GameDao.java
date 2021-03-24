package com.ksm.dao;



import java.util.Date;
import java.util.List;

import com.ksm.dto.SoccerGame;
import com.ksm.dto.Soccerteam;

public interface GameDao {
	public int soccerdate() throws Exception;
	public List<SoccerGame> monthlist(int paramInt) throws Exception;
	public int count(int paramInt) throws Exception;
	public void updatereuslt(SoccerGame paramSoccerGame) throws Exception;
	public void homeupdate(SoccerGame paramSoccerGame) throws Exception;
	public void awayupdate(SoccerGame paramSoccerGame) throws Exception;
	public SoccerGame selectone(int paramInt) throws Exception;
	public List<Soccerteam> teamlist() throws Exception;
	public List<SoccerGame> aftertoday(Date today) throws Exception;
	public List<SoccerGame> beforetoday(Date today) throws Exception;
}
