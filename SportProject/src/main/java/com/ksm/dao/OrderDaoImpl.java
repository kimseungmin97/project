package com.ksm.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ksm.dto.Order;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.order";
	
	@Override
	public void insertorder(Order order) throws Exception {
		 sql.insert(namespace + ".insert", order);
	}
	@Override
	public List<Order> OrderList(String id) throws Exception {
		return sql.selectList(namespace+ ".orderlist", id);
	}

	@Override
	public int updateresult(Order order) throws Exception {
		return sql.update(namespace + ".updateresult",order);
	}

	@Override
	public List<Order> AllList() throws Exception {
		return sql.selectList(namespace + ".allList");
	}

	@Override
	public int deleteorder(Order order) throws Exception {
		return sql.delete(namespace + ".delete",order);
	}
	@Override
	public int reviewupdate(int oseq) throws Exception {
		return sql.update(namespace + ".updatereview", oseq);
	}

}
