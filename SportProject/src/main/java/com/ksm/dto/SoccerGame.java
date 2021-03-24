package com.ksm.dto;

import java.sql.Date;

public class SoccerGame {
private int qseq;
private String home;
private String away;
private Date indate;
private int point;
private int losepoint;
private String result;
public int getQseq() {
	return qseq;
}
public void setQseq(int qseq) {
	this.qseq = qseq;
}
public String getHome() {
	return home;
}
public void setHome(String home) {
	this.home = home;
}
public String getAway() {
	return away;
}
public void setAway(String away) {
	this.away = away;
}
public Date getIndate() {
	return indate;
}
public void setIndate(Date indate) {
	this.indate = indate;
}
public int getPoint() {
	return point;
}
public void setPoint(int point) {
	this.point = point;
}
public int getLosepoint() {
	return losepoint;
}
public void setLosepoint(int losepoint) {
	this.losepoint = losepoint;
}
public String getResult() {
	return result;
}
public void setResult(String result) {
	this.result = result;
}
}
