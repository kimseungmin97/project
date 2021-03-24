<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	align-self: center;
	margin-top: 150px;
	width: 80%;
	height: 700px;
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
	<div class="scrollmenu" style="width: 86%; margin-top: 50px; margin-left: 7%">
	
	<c:forEach var="month" begin="01" end="12">
		<a href="/game/month?month=${month}" id="monthcheck" style="width: 7.9%">${month}월<input type="hidden" value="${month}" id="month" name="month"></a>
	</c:forEach>
	</div>
	<h2 align="center">${nowmonth}월의 경기</h2>
	<table style="width: 100%; height: 1000px;">
	<tr>
	<th style="width: 10%">날짜</th>
	<th style="width: 10%">home</th>
	<th style="width: 10%">점수</th>
	<th style="width: 10%">away</th>
	<th style="width: 10%">경기결과</th>
	</tr>
	<c:forEach items="${list}" var="list">
	<tr>
	<td align="center">${list.indate}</td>
	<td align="center">${list.home}</td>
	<td align="center">${list.point} : ${list.losepoint}</td>
	<td align="center">${list.away}</td>
	<td align="center">${list.result}</td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>