<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../CSS/OrderList.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<article>
<form name="form" method="post">
<jsp:include page="header.jsp"/>
<jsp:include page="headermenu.jsp"/>
<table>
		<tr>
			<th style="width:10%">아이디</th>
			<th style="width:10%">상품이름</th>
			<th style="width:10%">가격</th>
			<th style="width:10%">주소</th>
			<th style="width:10%">상세주소</th>
			<th style="width:10%">주문날</th>
			<th style="width:10%">현재 상태</th>
			<th style="width:10%">입금 하기</th>
		</tr>
<c:forEach items="${list}" var="list">
<input type="hidden" value="${list.oseq}" id="oseq"	name="oseq">
		<tr>
			<td align="center">${list.id }</td>
			<td align="center">${list.name}</td>
			<td align="center">${list.allPrice}</td>
			<td align="center">${list.address1}</td>
			<td align="center">${list.address2}</td>
			<td align="center">${list.indate}</td>
			<c:choose>
			<c:when test="${list.result eq '0'}">
			<td align="center">입금 대기중</td>
			<td>-</td>
			</c:when>
			<c:when test="${list.result eq '1'}">
			<td align="center">입금 확인중</td>
			<td><input type="button" class="button2" onclick="location.href='OrderUpdateManager?oseq=${list.oseq}'" value="입금확인"></td>
			</c:when>
			<c:when test="${list.result eq '2'}">
			<td align="center">배송 대기중</td>
			<td><input type="button" class="button2" onclick="location.href='OrderUpdateManager?oseq=${list.oseq}'" value="배송 시작"></td>
			</c:when>
			<c:when test="${list.result eq '3'}">
			<td align="center">배송 중</td>
			<td><input type="button" class="button2" onclick="location.href='OrderUpdateManager?oseq=${list.oseq}'" value="배송완료"></td>
			</c:when>
			<c:when test="${list.result eq '4'}">
			<td align="center">배송 완료</td>
			<td></td>
			</c:when>
			</c:choose>
		</tr>
	</c:forEach>
	</table>
</form>
</article>
</body>
</html>