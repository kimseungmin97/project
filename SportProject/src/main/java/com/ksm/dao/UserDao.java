package com.ksm.dao;

import com.ksm.dto.User;

public interface UserDao {
	  int insert(User user) throws Exception;
	  
	  User exist(User user) throws Exception;
	  
	  User searchid(User user) throws Exception;
	  
	  User searchpw(User user) throws Exception;
	  
	  User updateuser(User user) throws Exception;
	  
	  User deleteuser(User user) throws Exception;
	  
	  void pwupdate(String id, String pw2) throws Exception;
	  
	  int idcheck(String id) throws Exception;
	  
	  User select(String id) throws Exception;
	}
