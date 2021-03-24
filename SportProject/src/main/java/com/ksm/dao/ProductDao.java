package com.ksm.dao;

import java.util.List;

import com.ksm.dto.Order;
import com.ksm.dto.Product;
import com.ksm.dto.Productreview;

public interface ProductDao {
	/*
	 * 상품추가 상품 목록 상품 상세 상품 구분하기 상품 검색
	 */
	public int insert(Product product) throws Exception;
	public List<Product> list () throws Exception;
	public Product detail(Product product) throws Exception;
	public List<Product> searchList (Product product) throws Exception;
	public void subtraction(Order order) throws Exception;
	public void addition(Order order) throws Exception;
	public int insertreview(Productreview review) throws Exception;
	public List<Productreview> review(int qseq) throws Exception;
	public void deletereview(int seq) throws Exception;
}