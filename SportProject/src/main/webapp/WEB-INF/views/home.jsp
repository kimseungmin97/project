<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<style>
table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: 20px 10px;
}
table.type11 th {
  width: 155px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #ce4869 ;
}
table.type11 td {
  width: 155px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}
table.type12 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: 20px 10px;
}
table.type12 th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #ce4869 ;
}
table.type12 td {
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}
</style>
<meta charset="UTF-8">
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="headermenu.jsp"/>
<h3 style="margin-left: 10px">인기 게시물</h3>
<table class="type11">
<thead>
<tr>
	<th scope="cols">분류</th>
	<th scope="cols">제목</th>
	<th scope="cols">작성자</th>
</tr>
</thead>
<tbody>
<c:forEach items="${boardList}" var="boardList">
<input type="hidden" value="${boardList.qseq}" id="qseq" name="qseq">
<tr onclick="location.href='/freeboard/FreeBoardDetail?qseq=${boardList.qseq}'">
<td>${boardList.value}</td>
<td>${boardList.subject}</td>
<td>${boardList.id}</td>
</tr>
</c:forEach>
</tbody>
</table>
<div style="float: left; margin-left: 20px">
<h3 style="margin-left: 10px">지난 경기</h3>
<table class="type11">
<thead>
<tr>
	<th scope="cols">home</th>
	<th scope="cols">점수</th>
	<th scope="cols">away</th>
	<th scope="col">날짜</th>
</tr>
</thead>
<tbody>
<c:forEach items="${beforelist}" var="beforelist">
<tr>
<td>${beforelist.home}</td>
<td>${beforelist.point} : ${beforelist.losepoint}</td>
<td>${beforelist.away}</td>
<td>${beforelist.indate}</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<div style="float: right; margin-right: 20px">
<h3 style="margin-left: 10px">경기 일정</h3>
<table class="type11">
<thead>
<tr>
	<th scope="cols">home</th>
	<th scope="cols">점수</th>
	<th scope="cols">away</th>
	<th scope="col">날짜</th>
</tr>
</thead>
<tbody>
<c:forEach items="${afterlist}" var="afterlist">
<tr>
<td>${afterlist.home}</td>
<td>${afterlist.point} : ${afterlist.losepoint}</td>
<td>${afterlist.away}</td>
<td>${afterlist.indate}</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<br>
<div style="float: left;">
<h3 style="margin-left: 10px">축구팀 순위</h3>
<table class="type12">
<thead>
<tr>
	<th width="5%">순위</th>
	<th width="15%">팀</th>
	<th width="5%">승</th>
	<th width="5%">무</th>
	<th width="5%">패</th>
	<th width="5%">득점</th>
	<th width="5%">실점</th>
	<th width="5%">승점</th>
</tr>
</thead>
<tbody>

<c:forEach items="${teamList}" var="teamList">
<c:set var="i" value="${i+1}"/>
<tr>
<td>${i}</td>
<td>${teamList.team}</td>
<td>${teamList.win}</td>
<td>${teamList.draw}</td>
<td>${teamList.lose}</td>
<td>${teamList.point}</td>
<td>${teamList.losepoint}</td>
<td>${teamList.points}</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>
