package com.ksm.service;


import com.ksm.dao.FreeboardDao;
import com.ksm.dto.Fbreply;
import com.ksm.dto.FreeBoard;
import com.ksm.service.BoardService;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
  @Inject
  private FreeboardDao dao;
  
  @Override
  public int insert(FreeBoard freeboard) throws Exception {
    return dao.insert(freeboard);
  }
  @Override
  public List<FreeBoard> list(int displayPost, int postNum) throws Exception {
    return dao.list(displayPost, postNum);
  }
  @Override
  public int count() throws Exception {
    return dao.count();
  }
  @Override
  public FreeBoard detail(FreeBoard freeboard) throws Exception {
    return dao.detail(freeboard);
  }
  @Override
  public void viewplus(FreeBoard freeboard) throws Exception {
   dao.viewplus(freeboard);
  }
  @Override
  public void delete(int qseq) throws Exception {
   dao.delete(qseq);
  }
  @Override
  public void update(FreeBoard freeboard) throws Exception {
   dao.update(freeboard);
  }
  @Override
  public List<FreeBoard> searchlist(int displayPost, int postNum, String selectbox, String searchtext) throws Exception {
    return dao.searchlist(displayPost, postNum, selectbox, searchtext);
  }
  @Override
  public int searchcount(String selectbox, String searchtext) throws Exception {
    return dao.searchcount(selectbox, searchtext);
  }
  @Override
  public int repinsert(Fbreply fbreply) throws Exception {
    return dao.repinsert(fbreply);
  }
  @Override
  public List<Fbreply> replist(Fbreply fbreply) throws Exception {
    return dao.replist(fbreply);
  }
  @Override
  public List<FreeBoard> popularList() throws Exception {
    return dao.popularList();
  }
}
