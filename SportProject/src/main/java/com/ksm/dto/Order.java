package com.ksm.dto;

import java.sql.Timestamp;

public class Order {
private int oseq;
private int qseq;
private String id;
private String name;
private String phone;
private String address1;
private String address2;
private Timestamp indate;
private int result;
private int count;
private int allPrice;
public int getOseq() {
	return oseq;
}
public void setOseq(int oseq) {
	this.oseq = oseq;
}
public int getQseq() {
	return qseq;
}
public void setQseq(int qseq) {
	this.qseq = qseq;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getAddress1() {
	return address1;
}
public void setAddress1(String address1) {
	this.address1 = address1;
}
public String getAddress2() {
	return address2;
}
public void setAddress2(String address2) {
	this.address2 = address2;
}
public Timestamp getIndate() {
	return indate;
}
public void setIndate(Timestamp indate) {
	this.indate = indate;
}
public int getResult() {
	return result;
}
public void setResult(int result) {
	this.result = result;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public int getAllPrice() {
	return allPrice;
}
public void setAllPrice(int allPrice) {
	this.allPrice = allPrice;
}
public int getReviewresult() {
	return reviewresult;
}
public void setReviewresult(int reviewresult) {
	this.reviewresult = reviewresult;
}
private int reviewresult;
}
