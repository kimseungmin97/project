package com.ksm.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ksm.dto.Order;
import com.ksm.dto.Product;
import com.ksm.dto.Productreview;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.product";

	@Override
	public int insert(Product product) throws Exception {
		return sql.insert(namespace + ".insert", product);
	}

	@Override
	public List<Product> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}

	@Override
	public Product detail(Product product) throws Exception {
		return sql.selectOne(namespace + ".detail", product);
	}

	@Override
	public List<Product> searchList(Product product) throws Exception {
		return sql.selectList(namespace + ".searchList", product);
	}

	@Override
	public void subtraction(Order order) throws Exception {
		sql.update(namespace + ".subtraction", order);
	}
	@Override
	public void addition(Order order) throws Exception {
		sql.update(namespace + ".addition", order);
	}

	@Override
	public int insertreview(Productreview review) throws Exception {
		System.out.println(review.getQseq());
		return sql.insert(namespace + ".insertreview", review);
	}

	@Override
	public List<Productreview> review(int qseq) throws Exception {
		return sql.selectList(namespace + ".reviewlist", qseq);
	}
	@Override
	public void deletereview(int seq) throws Exception {
		sql.delete(namespace + ".deletereview", seq);
	}
}
