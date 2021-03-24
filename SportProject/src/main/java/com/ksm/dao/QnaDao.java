package com.ksm.dao;

import java.util.List;

import com.ksm.dto.QnA;

public interface QnaDao {
	public int insert(QnA Qna) throws Exception;
	public QnA detail(QnA Qna) throws Exception;
	public List<QnA> list (String id) throws Exception;
	public List<QnA> allList() throws Exception;
	public int qnareply(QnA Qna) throws Exception;
}
