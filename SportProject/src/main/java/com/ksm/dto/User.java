package com.ksm.dto;

import java.sql.Timestamp;

public class User {
private String id;
private String pw;
private String name;
private String phone;
private String email;
private String address1;
private String address2;
private Timestamp birth;
private Timestamp indate;
private int deletecondition;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
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
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
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
public Timestamp getBirth() {
	return birth;
}
public void setBirth(Timestamp birth) {
	this.birth = birth;
}
public Timestamp getIndate() {
	return indate;
}
public void setIndate(Timestamp indate) {
	this.indate = indate;
}
public int getDeletecondition() {
	return deletecondition;
}
public void setDeletecondition(int deletecondition) {
	this.deletecondition = deletecondition;
}
}
