package com.ksm.dao;

import com.ksm.dao.UserDao;
import com.ksm.dao.UserDaoImpl;
import com.ksm.dto.User;
import java.util.HashMap;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
  @Inject
  private SqlSession sql;
  
  private static final String namespace = "com.board.mappers.user";
  
  @Override
  public User exist(User user) throws Exception {
    return sql.selectOne(namespace + ".login", user);
  }
  @Override
  public User searchid(User user) throws Exception {
    return sql.selectOne(namespace + ".searchid", user);
  }
  @Override
  public User searchpw(User user) throws Exception {
    return sql.selectOne(namespace + ".searchpw", user);
  }
  @Override
  public int insert(User user) throws Exception {
    return sql.insert(namespace + ".insert", user);
  }
  @Override
  public User updateuser(User user) throws Exception {
    sql.update(namespace + ".updateuser", user);
    return user;
  }
  @Override
  public User deleteuser(User user) throws Exception {
    sql.update(namespace + ".deleteuser", user);
    return user;
  }
  @Override
  public void pwupdate(String id, String pw2) throws Exception {
    HashMap<String, Object> data = new HashMap<>();
    data.put("id", id);
    data.put("pw2", pw2);
    sql.update(namespace + ".pwupdate", data);
  }
  @Override
  public int idcheck(String id) throws Exception {
    return sql.selectOne(namespace + ".idcheck", id);
  }
  @Override
  public User select(String id) throws Exception {
    return sql.selectOne(namespace + ".select", id);
  }
}
