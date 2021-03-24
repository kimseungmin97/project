package com.ksm.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ksm.dto.Post;

@Repository
public class PostDaoImpl implements PostDao {
  @Inject
  private SqlSession sql;
  
  private static String namespace = "com.board.mappers.post";
  
  public List<Post> list(Post post) throws Exception {
    return sql.selectList(namespace + ".list", post);
  }
}