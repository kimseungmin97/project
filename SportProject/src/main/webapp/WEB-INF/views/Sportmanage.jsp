<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="headermenu.jsp"/>
		<input type="button" onclick="location.href='/game/soccergameinsert'" value="축구경기추가"  disabled>
		<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" var="today" pattern="yyyy-MM-dd"/>
	<div class="scrollmenu" style="width: 86%; margin-top: 50px; margin-left: 7%">
	<c:forEach var="month" begin="01" end="12">
		<a href="/game/monthgamemanage?month=${month}" id="monthcheck" style="width: 7.9%">${month}월<input type="hidden" value="${month}" id="month" name="month"></a>
	</c:forEach>
	</div>
	<table style="margin-left: 10%">
	<tr>
	<th style="width: 10%" align="center">날짜</th>
	<th style="width: 10%" align="center">home</th>	
	<th style="width: 30%" align="center">점수</th>
	<th style="width: 10%" align="center">away</th>
	<th style="width: 10%" align="center">경기결과</th>
	</tr>
	<c:forEach items="${list}" var="list">
	<form action="/game/soccerupdate?qseq=${list.qseq}" method="post" class="abc" name="abc">	
	<input type="hidden" id="result" name="result">
	<input type="hidden" id="home" name="home" value="${list.home}">
	<input type="hidden" id="away" name="away" value="${list.away}">
	<tr>
	<td align="center">${list.indate}</td>
	<td align="center">${list.home}</td>
	<c:choose>
	<c:when test="${list.result != null}">
	<td align="center">${list.point} : ${list.losepoint}</td>
	</c:when>
	<c:otherwise>
	<td align="center"><input type="text" id="point" name="point"> : <input type="text" id="losepoint" name="losepoint"><input type="hidden" value="${list.qseq}" id="qseq" name="qseq"></td>
	</c:otherwise>
	</c:choose>
	<td align="center">${list.away}</td>
	<td align="center">${list.result}</td>
	<c:choose>
	<c:when test="${today >= list.indate}">
	<c:choose>
	<c:when test="${list.result != null}">
	</c:when>
	<c:otherwise>
	<td align="center"><input type="submit" value="결과입력하기"></td>	
	</c:otherwise>
	</c:choose>
	</c:when>
	<c:otherwise>
	<td align="center"><input type="button" value="결과 입력하기" onclick="location.href=''" disabled></td>	
	</c:otherwise>
	</c:choose>
	</tr>
	</form>
	</c:forEach>
	</table>
</body>
</html>