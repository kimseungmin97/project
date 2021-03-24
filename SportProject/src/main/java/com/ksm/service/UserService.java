package com.ksm.service;

import com.ksm.dto.User;

public interface UserService {
	public int insert(User user) throws Exception;
	public User exist (User loginuser) throws Exception;
	public User searchid(User user) throws Exception;
	public User searchpw(User user) throws Exception;
	public User UpdateUser(User user) throws Exception;
	public User deleteuser(User user) throws Exception;
	public void pwupdate(String id, String pw2) throws Exception;
	public int idcheck(String id) throws Exception;
	public User select(String id) throws Exception;
}
