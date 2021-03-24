package com.ksm.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.ksm.dao.OrderDao;
import com.ksm.dto.Order;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDao dao;

	@Override
	public void insertorder(Order order) throws Exception {
		dao.insertorder(order);
	}

	@Override
	public List<Order> OrderList(String id) throws Exception {
		return dao.OrderList(id);
	}

	@Override
	public int updateresult(Order order) throws Exception {
		return dao.updateresult(order);
	}

	@Override
	public List<Order> AllList() throws Exception {
		return dao.AllList();
	}

	@Override
	public int deleteorder(Order order) throws Exception {

		return dao.deleteorder(order);
	}

	@Override
	public int reviewupdate(int oseq) throws Exception {
		return dao.reviewupdate(oseq);
	}

}
