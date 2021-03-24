package com.ksm.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ksm.dto.SportProduct;

@Repository
public class SportProductDaoImpl implements SportProductDao {
  @Inject
  private SqlSession sql;
  
  private static String namespace = "com.board.mappers.sprotproduct";
  
  @Override
  public int insert(SportProduct sportproduct) throws Exception {
    return sql.insert(namespace + ".insert", sportproduct);
  }
  @Override
  public List<SportProduct> searchList(String selectbox, String searchtext) throws Exception {
    HashMap<String, Object> data = new HashMap<>();
    data.put("selectbox", selectbox);
    data.put("searchtext", searchtext);
    return sql.selectList(namespace + ".searchlist", data);
  }
  @Override
  public SportProduct select(SportProduct sportproduct) throws Exception {
    return sql.selectOne(namespace + ".select", sportproduct);
  }
}
