package com.ksm.service;

import java.util.List;

import com.ksm.dto.QnA;

public interface QnaService {
	  int insert(QnA qna) throws Exception;
	  
	  QnA detail(QnA qna) throws Exception;
	  
	  List<QnA> list(String id) throws Exception;
	  
	  List<QnA> allList() throws Exception;
	  
	  int qnareply(QnA qna) throws Exception;
	}