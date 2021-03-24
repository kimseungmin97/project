package com.ksm.service;

import java.util.List;

import com.ksm.dto.Order;

public interface OrderService {
	public void insertorder(Order order) throws Exception;
	public List<Order> OrderList(String id) throws Exception;
	public int updateresult(Order order) throws Exception;
	public List<Order> AllList() throws Exception;
	public int deleteorder(Order order) throws Exception;
	public int reviewupdate(int oseq) throws Exception;
}
