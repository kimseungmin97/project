<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="../CSS/AddProduct.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function notnumber() {
	alert("현재 남은 재고가 없습니다");
}
</script>
</head>
<body>
<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
	<form  class="form" name="form" action="/order/orderpage" method="post">
	<input type="hidden" value="${user.id}" name="id" id="id">
	<input type="hidden" value="${user.pw}" name="pw" id="pw">
	<input type="hidden" value="${product.qseq}" name="qseq" id="qseq">
	<input type="hidden" value="${product.price}" name="price" id="price">
	<input type="hidden" value="${product.number}" name="number" id="number">
	<table class="table" align="center">
	<tr>
	<td colspan="4"><p class="aaa">상품 상세보기</p></td>
	</tr>
	<tr>
	<td colspan="1"><p class="abc">브랜드</p></td><td>${product.brand}</td>
	<td colspan="1"><p class="abc">종류</p></td><td>${product.kind}</td>
	</tr>
	<tr>
	<td colspan="1"><p class="abc">스포츠종류</p></td><td>${product.sportkind}</td>
	<td colspan="1"><p class="abc">이름</p></td><td>${product.name}</td>
	</tr>
	<tr>
	<td colspan="4"><img src="../img/${product.img}" style="width: 100%"></td>
	</tr>
	<tr>
	<td colspan="1"><p class="abc">개수</p></td><td colspan="1">${product.number}</td>
	<td colspan="1"><p class="abc">판매가</p></td><td>${product.price}원</td>
	</tr>
	<tr>
	<c:choose>
	<c:when test="${sessionScope.user != null}">
	<c:set var="user" value="${sessionScope.user}"/>
	<c:choose>
	<c:when test="${product.number != 0 }">
	<td colspan="2"><input type="submit" id="order" name="order" class="order" value="구매하기"></td>	
	</c:when>
	<c:otherwise>
	<td colspan="2"><input type="button" id="order" name="order" class="order" value="구매하기" onclick="notnumber();"></td>
	</c:otherwise>
	</c:choose>
	</c:when>
	<c:otherwise>
	<td colspan="2"><input type="button" class="button2" value="로그인" onclick="location.href='/user/Loginpage'"></td>
	</c:otherwise>
	</c:choose>
	<td colspan="1"><a class="button2" onclick="window.history.back();">취소</a></td>
	</tr>
	</table>
	
	<h3 style="margin-left: 100px">후기 목록</h3>
	<table style="margin-left: 3%">
	<c:forEach items="${list}" var="list">
	<tr>
	<th width="10%">평점</th>
	<th width="10%">이미지</th>
	<th width="5%">아이디</th>
	<th width="20%">내용</th>
	<th width="10%">날짜</th>
	</tr>
	<tr>
	<td align="center">${list.grade}</td>
	<td align="center"><img src="../img/${list.img}" style="width: 200px;height: 100px;"></td>
	<td align="center">${list.id}</td>
	<td align="center">${list.content}</td>
	<td align="center">${list.indate}</td>
	<c:set var="user" value="${sessionScope.user}"/>
	<c:if test="${user.id == list.id}">
	<td><input type="button" value="후기 삭제" onclick="location.href='/product/reviewdelete?seq=${list.seq}'"><input type="hidden" value="${list.seq}" id="seq" name="seq"></td>
	</c:if>
	</tr>
	</c:forEach>
	</table>
	</form>
</body>
</html>