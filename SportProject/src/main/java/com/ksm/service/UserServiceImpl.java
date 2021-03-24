package com.ksm.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ksm.dao.UserDao;
import com.ksm.dto.User;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	  private UserDao dao;
	
	@Override
	public int insert(User user) throws Exception {
		 return dao.insert(user);
	}

	@Override
	public User exist(User loginuser) throws Exception {
		return dao.exist(loginuser);
	}

	@Override
	public User searchid(User user) throws Exception {
		return dao.searchid(user);
	}

	@Override
	public User searchpw(User user) throws Exception {
		return dao.searchpw(user);
	}

	@Override
	public User UpdateUser(User user) throws Exception {
		  dao.updateuser(user);
		    return user;
	}

	@Override
	public User deleteuser(User user) throws Exception {
		dao.deleteuser(user);
	    return user;
	}

	@Override
	public void pwupdate(String id, String pw2) throws Exception {
		 dao.pwupdate(id, pw2);
	}

	@Override
	public int idcheck(String id) throws Exception {
		 return dao.idcheck(id);
	}

	@Override
	public User select(String id) throws Exception {
		 return dao.select(id);
	}

}
