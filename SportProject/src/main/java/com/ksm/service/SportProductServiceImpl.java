package com.ksm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ksm.dao.SportProductDao;
import com.ksm.dto.SportProduct;

@Service
public class SportProductServiceImpl implements SportProductService {

	@Inject
	  private SportProductDao dao;
	
	@Override
	public int insert(SportProduct sportproduct) throws Exception {
		  return this.dao.insert(sportproduct);
	}

	@Override
	public List<SportProduct> searchList(String selectbox, String searchtext) throws Exception {
		 return this.dao.searchList(selectbox, searchtext);
	}

	@Override
	public SportProduct select(SportProduct sportproduct) throws Exception {
		  return this.dao.select(sportproduct);
	}

}
