package com.ksm.service;

import java.util.List;

import com.ksm.dto.SportProduct;

public interface SportProductService {
	  int insert(SportProduct sportproduct) throws Exception;
	  
	  List<SportProduct> searchList(String selectbox, String searchtext) throws Exception;
	  
	  SportProduct select(SportProduct sportproduct) throws Exception;
	}
