package com.ksm.dto;

import java.sql.Timestamp;

public class Fbreply {
private int oseq;
private int qseq;
private String id;
private String content;
private Timestamp indate;
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
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Timestamp getIndate() {
	return indate;
}
public void setIndate(Timestamp indate) {
	this.indate = indate;
}
}
