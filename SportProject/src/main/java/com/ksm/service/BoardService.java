package com.ksm.service;


import com.ksm.dto.Fbreply;
import com.ksm.dto.FreeBoard;
import java.util.List;

public interface BoardService {
	  public int insert(FreeBoard Freeboard) throws Exception;
	  public List<FreeBoard> list(int displayPost, int postNum) throws Exception;
	  public int count() throws Exception;
	  public FreeBoard detail(FreeBoard Freeboard) throws Exception; 
	  public void viewplus(FreeBoard Freeboard) throws Exception; 
	  public void delete(int qseq) throws Exception;
	  public void update(FreeBoard Freeboard) throws Exception;
	  public int searchcount(String selectbox, String searchtext) throws Exception;
	  public List<FreeBoard> searchlist(int displayPost, int postNum, String selectbox, String searchtext) throws Exception;
	  public int repinsert(Fbreply fbreply) throws Exception;
	  public List<Fbreply> replist(Fbreply fbreply) throws Exception;
	  public List<FreeBoard> popularList() throws Exception;
}
