<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="../CSS/Order.css">
<meta charset="UTF-8">
<script type="text/javascript">
function insert() {
	var ad1 = document.getElementById('address1');
	var ad2 = document.getElementById('address2');
	var abc = "";
	var def = "";
	ad1.value= abc;
	ad2.value= def;
}
function post() {
	var url = "postsearch.jsp";
	window.open(url, "post", "toorbar=no, menubar=no, scrollbars=yes, resizable=no," +
			"width=500, height=300, top=300, left=300 ");
}
function pricecheck() {
	var count = document.getElementById("count").value;
	var counttext = document.getElementById("count");
	var number = document.getElementById("number").value;
	var price = document.getElementById("price").value;
	var allPrice = document.getElementById("allPrice").value;
	var allpricetext = document.getElementById("allpriceset");
	if (parseInt(count) >parseInt(number)) {
		alert ("남은 수량보다 적게 입력해주세요");
	}else {
		document.getElementById("allpriceset").value = count*price;
		document.getElementById("allPrice").value = count*price;
		document.getElementById("count").readOnly = true;
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
	<form action="/order/order" method="post">
	<c:set var="product" value="${product}"/>
<c:set var="user" value="${sessionScope.user}"/>
<input type="hidden" id="id" name="id" value="${user.id}">
<input type="hidden" id="phone" name="phone" value="${user.phone}">
<input type="hidden" id="qseq" name="qseq" value="${product.qseq}">
<input type="hidden" id="name" name="name" value="${product.name}">
<input type="hidden" id="price" name="price" value="${product.price}">
<input type="hidden" id="number" name="number" value="${product.number}">
<input type="hidden" id="allPrice" name="allPrice" value=""> 
<table class="table" align="center">
	<tr>
	<td colspan="4"><p class="aaa">주문하기</p></td>
	</tr>
	<tr>
	<td><p class="abc">전화번호</p></td>
	<td><input type="text" class="phone" name="phonenumber" id="phonenumber" value="${user.phone}"></td>
	</tr>
	<tr>
	<td colspan="4"><input type="button" class="button2" value="직접 주소 입력하기" onclick="insert();"></td>
	</tr>
	<tr>
	<td colspan="4"><p class="abc">주소</p></td>
	</tr>
	<tr>
	<td colspan="3"><input type="text" class="address1" id="address1" name="address1" value="${user.address1}"></td>
	<td colspan="1"><a class="helf" onclick="post()">주소검색</a></td>
	</tr>
	<tr>
	<td colspan="4"><p class="abc">상세 주소</p></td>
	</tr>
	<tr>
	<td colspan="3"><input type="text" class="address2" id="address2" name="address2" value="${user.address2}"></td>
	</tr>
	<tr>
	<td colspan="2"><p class="aaa">상품명</p></td>
	<td colspan="2"><p class="aaa">${product.name}</p></td>
	</tr>
	<tr>
	<td colspan="1"><p class="aaa">금액</p></td>
	<td colspan="1"><p class="aaa">${product.price}</p></td>
	<td colspan="1"><p class="aaa">남은수량</p></td>
	<td colspan="1"><p class="aaa">${product.number}</p></td>
	</tr>
	<tr>	
	<td colspan="1"><p class="aaa">개수</p></td>
	<td colspan="1"><p class="aaa"><input type="text" id="count" name="count"></p></td>
	<td colspan="1"><p class="aaa">금액확인</p></td>
	<td colspan="1"><p class="aaa"><input type="button" value="금액확인" onclick="pricecheck();"></p></td>
	</tr>
	<tr>
	<td colspan="2"><p class="abc">총금액</p></td>
	<td colspan="2"><p class="abc"><input type="text" id="allpriceset" name="allpriceset" readonly></p></td>
	</tr>
	<tr>
	<td colspan="1"><p class="abc">계좌이체</p></td>
	<td colspan="3"><p class="abc">국민은행 123214123 김승민</p></td>
	</tr>
	<tr>
	<td colspan="2"><input type="submit" class="button2" value="주문하기"></td>
	<td colspan="2"><a class="button2" onclick="window.history.back();">취소</a></td>
	</tr>
	</table>
	</form>
</body>
</html>