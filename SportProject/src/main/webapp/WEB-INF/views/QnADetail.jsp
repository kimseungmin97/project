<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="../CSS/FreeBoardDetail.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/qna/qnareply" method="post">
	<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
	<div class="main">
		<table border="1">
			<tr>
				<th colspan="7">${qna.subject}</th>
			</tr>
			<tr>
				<td colspan="1">번호</td>
				<td colspan="4">${qna.qseq}</td>
				<td colspan="1">작성자</td>
				<td colspan="1">${qna.id}</td>
			</tr>
			<tr>
				<td colspan="1">작성날짜</td>
				<td colspan="4">${qna.indate}</td>
				<td colspan="1">답변상태</td>
				<td colspan="1">
				<c:choose>
						<c:when test="${qna.rep eq '0'}">미답변</c:when>
						<c:when test="${qna.rep eq '1'}">답변완료</c:when>
					</c:choose>
					</td>
			</tr>
			<tr>
				<td class="content" colspan="7">${qna.content}</td>
			</tr>
			<tr>
				<td class="reply" colspan="7">${qna.reply}</td>
			</tr>
		</table>
		<br>
		<c:set var="user" value="${sessionScope.user}" />
		<c:choose>
			<c:when test="${user.id eq 'ksm'}">
			<input type="hidden" name="qseq" id="qseq" value="${qna.qseq}">
				<input type="text" name="reply" id="reply">
				<input type="submit" value="submit" >
		</c:when>
		</c:choose>
	</div>
	</form>
</body>
</html>