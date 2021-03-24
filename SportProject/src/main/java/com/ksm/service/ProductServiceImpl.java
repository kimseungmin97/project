package com.ksm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ksm.dao.ProductDao;
import com.ksm.dto.Order;
import com.ksm.dto.Product;
import com.ksm.dto.Productreview;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDao dao;

	@Override
	public int insert(Product product) throws Exception {
		return dao.insert(product);
	}

	@Override
	public List<Product> list() throws Exception {
		return dao.list();
	}

	@Override
	public Product detail(Product product) throws Exception {
		return dao.detail(product);
	}

	@Override
	public List<Product> searchList(Product product) throws Exception {
		return dao.searchList(product);
	}

	@Override
	public void subtraction(Order order) throws Exception {
		dao.subtraction(order);

	}

	@Override
	public void addition(Order order) throws Exception {
		dao.addition(order);
	}

	@Override
	public int insertreview(Productreview review) throws Exception {
		return dao.insertreview(review);
	}

	@Override
	public List<Productreview> review(int qseq) throws Exception {
		return dao.review(qseq);
	}

	@Override
	public void deletereview(int seq) throws Exception {
		dao.deletereview(seq);
	}

}
