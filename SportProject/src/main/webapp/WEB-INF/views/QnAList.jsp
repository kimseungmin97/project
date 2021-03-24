<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../CSS/FreeBoardList.css">
<meta charset="UTF-8">
<title>고객게시판</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="headermenu.jsp"/>
<article>
<h2>고객게시판</h2>
<table>
		<tr>
			<th style="width:10%">작성날짜</th>
			<th style="width:20%">게시물 제목</th>
			<th style="width:5%">답변</th>
		</tr>
<c:forEach items="${qnalist}" var="qna">
		<tr>
			<td align="center">${qna.indate}</td>
			<td align="center"><a onclick="location.href='/qna/qnadetail?qseq=${qna.qseq}'">${qna.subject}</a></td>
			<td align="center">
<c:choose>
<c:when test="${qna.rep eq '0'}">
미답변
</c:when>
<c:when test="${qna.rep eq '1'}">
답변완료
</c:when>
</c:choose>
			</td>
		</tr>
	</c:forEach>
	</table>
<form method="post" action="/qna/qnainsertpage">
	<input type="hidden" value="${user.id}" name="id" id="id">
	<input type="hidden" value="${user.pw}" name="pw" id="pw">
	<input type="submit" value="글 작성">
	</form>

</article>
</body>
</html>