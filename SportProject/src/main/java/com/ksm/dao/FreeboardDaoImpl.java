package com.ksm.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ksm.dto.Fbreply;
import com.ksm.dto.FreeBoard;

@Repository
public class FreeboardDaoImpl implements FreeboardDao {
  @Inject
  private SqlSession sql;
  
  private static String namespace = "com.board.mappers.board";
  
  @Override
  public int insert(FreeBoard freeboard) throws Exception {
    return sql.insert(namespace + ".insert", freeboard);
  }
  @Override
  public List<FreeBoard> list(int displayPost, int postNum) throws Exception {
    HashMap<String, Integer> data = new HashMap<>();
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    return sql.selectList(namespace + ".FreeBoardList", data);
  }
  @Override
  public int count() throws Exception {
    return sql.selectOne(namespace + ".count");
  }
  @Override
  public FreeBoard detail(FreeBoard freeboard) throws Exception {
    return sql.selectOne(namespace + ".detail", freeboard);
  }
  @Override
  public void viewplus(FreeBoard freeboard) throws Exception {
    sql.update(namespace + ".viewplus", freeboard);
  }
  @Override
  public void delete(int qseq) throws Exception {
    sql.delete(namespace + ".delete", Integer.valueOf(qseq));
  }
  @Override
  public void update(FreeBoard freeboard) throws Exception {
    sql.update(namespace + ".update", freeboard);
  }
  @Override
  public List<FreeBoard> searchlist(int displayPost, int postNum, String selectbox, String searchtext) throws Exception {
    HashMap<String, Object> data = new HashMap<>();
    data.put("displayPost", displayPost);
    data.put("postNum", postNum);
    data.put("selectbox", selectbox);
    data.put("searchtext", searchtext);
    return sql.selectList(namespace + ".searchlist", data);
  }
  @Override
  public int searchcount(String selectbox, String searchtext) throws Exception {
    HashMap<String, Object> data = new HashMap<>();
    data.put("selectbox", selectbox);
    data.put("searchtext", searchtext);
    return sql.selectOne(namespace + ".searchcount", data);
  }
  @Override
  public int repinsert(Fbreply fbreply) throws Exception {
    return sql.insert(namespace + ".repinsert", fbreply);
  }
  
  public List<Fbreply> replist(Fbreply fbreply) throws Exception {
    return sql.selectList(namespace + ".replylist", fbreply);
  }
  
  public List<FreeBoard> popularList() throws Exception {
    return sql.selectList(namespace + ".popularList");
  }
}
