package com.ksm.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ksm.dto.QnA;

@Repository
public class QnaDaoImpl implements QnaDao {
  @Inject
  private SqlSession sql;
  
  private static String namespace = "com.board.mappers.qna";
  
	@Override
	public int insert(QnA Qna) throws Exception {
		return sql.insert(namespace+ ".insert", Qna);
	}

	@Override
	public QnA detail(QnA Qna) throws Exception {
		return sql.selectOne(namespace + ".detail", Qna);
	}

	@Override
	public List<QnA> list(String id) throws Exception {
		  return sql.selectList(namespace + ".qnalist", id);
	}

	@Override
	public List<QnA> allList() throws Exception {
		return sql.selectList(namespace + ".allList");
	  }

	@Override
	public int qnareply(QnA Qna) throws Exception {
		 return sql.update(namespace + ".reply", Qna);
	}

}
