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
<script  src="http://code.jquery.com/jquery-latest.min.js">
</script>
<script>
		var openWin;
		function insert(oseq) {
		document.domain = "localhost";
		window.name= "parentForm";
		"<c:url value='InsertPrice.jsp?oseq="+oseq+"'/>"
		openWin = window.open("/order/insertpricepage?oseq="+ oseq, "InsertPrice", "width=400, height=400");
	//	openWin = window.open("InsertPrice.jsp?oseq="+oseq, "InsertPrice", "width=400, height=400");
		//openWin.document.getElementById("oseq").value = ;
		//openWin.document.getElementById("oseq").value = oseq;
		//document.getElementById("oseq").value()= oseq;
	}
</script>
</head>
<body>
<article>

<jsp:include page="header.jsp"/>
<jsp:include page="headermenu.jsp"/>
<table>
		<tr>
			<th style="width:8%">상품이름</th>
			<th style="width:8%">가격</th>
			<th style="width:8%">주소</th>
			<th style="width:8%">상세주소</th>
			<th style="width:10%">주문날</th>
			<th style="width:8%">현재 상태</th>
			<th style="width:12%">입금 하기</th>
			<th style="width:8%">주문취소</th>
		</tr>
<c:forEach items="${list}" var="list">
<form name="form" method="post" action="/order/orderdelete">
		<tr>
			<td align="center">${list.name}</td>
			<td align="center">${list.allPrice}</td>
			<td align="center">${list.address1}</td>
			<td align="center">${list.address2}</td>
			<td align="center">${list.indate}</td>
			<c:choose>
			<c:when test="${list.result eq '0'}">
			<td align="center">입금 대기중</td>
			<td><input type="button" class="button2" onclick="insert(${list.oseq});" value="입금하기"></td>
			<td align="center"><input type="submit" value="취소"><input type="hidden" id="id" name="id" value="${list.id}"><input type="hidden" id="qseq" name="qseq" value="${list.qseq}"><input type="hidden" id="oseq" name="oseq" value="${list.oseq}"></td>
			</c:when>
			<c:when test="${list.result eq '1'}">
			<td align="center">입금 확인중</td>
			<td><input type="button" class="button2" onclick="location.href='/qna/qnainsertpage'" value="입금확인신청"></td>
			<td align="center"><input type="submit" value="취소"><input type="hidden" id="id" name="id" value="${list.id}"><input type="hidden" id="qseq" name="qseq" value="${list.qseq}"><input type="hidden" id="oseq" name="oseq" value="${list.oseq}"></td>
			</c:when>
			<c:when test="${list.result eq '2'}">
			<td align="center">배송 대기중</td>
			<td>배송까지 3일정도 소요됩니다</td>
			<td>취소는 문의 주세요</td>
			</c:when>
			<c:when test="${list.result eq '3'}">
			<td align="center">배송 중</td>
			<td>-</td>
			<td>취소는 문의 주세요</td>
			</c:when>
			<c:when test="${list.result eq '4'}">
			<td align="center">배송 완료</td>
			<c:choose>
			<c:when test="${list.reviewresult eq '0'}">
			<td><input type="hidden" value="${list.qseq}" id="qseq" name="qseq" ><input type="button" class="button2" onclick="location.href='/product/productreviewinsert?qseq=${list.qseq}&oseq=${list.oseq}'" value="후기작성"></td>
			</c:when>
			<c:otherwise>
			<td>후기작성이 된 상품입니다</td>
			</c:otherwise>
			</c:choose>
			<td>-</td>
			</c:when>
			</c:choose>
		</tr>
		<input type="hidden" id="phonenumber" name="phonenumber" value="${list.phone}">
		<input type="hidden" id="id" name="id" value="${list.id}">
		<input type="hidden" id="qseq" name="qseq" value="${list.qseq}">
		<input type="hidden" id="oseq" name="oseq" value="${list.oseq}">
		<input type="hidden" id="result" name="result" id="result" value="${list.result}">
		<input type="hidden" id="count"	name="count" value="${list.count}">
		</form>
	</c:forEach>
	</table>

</article>
</body>
</html>
