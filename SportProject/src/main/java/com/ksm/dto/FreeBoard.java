package com.ksm.dto;

import java.sql.Timestamp;

public class FreeBoard {
private int qseq;
private String value;
private String subject;
private String content;
private String id;
private int view;
private Timestamp indate;
public int getQseq() {
	return qseq;
}
public void setQseq(int qseq) {
	this.qseq = qseq;
}
public String getValue() {
	return value;
}
public void setValue(String value) {
	this.value = value;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getView() {
	return view;
}
public void setView(int view) {
	this.view = view;
}
public Timestamp getIndate() {
	return indate;
}
public void setIndate(Timestamp indate) {
	this.indate = indate;
}
}
