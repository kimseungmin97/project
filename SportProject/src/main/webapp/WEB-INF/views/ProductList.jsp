<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/ProductList.css">
	<!-- <script type="text/javascript">
	function SearchList() {
		var sportkind = document.getElementById("sportkind");
	}
	</script> -->
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
	<div class="main2">
	<form action="/product/searchList?sportkind=${sportkind}&brand=${brand}&kind=${kind}" method="get">
<table align="center" class="b">
<tr>
<th colspan="120" align="center">스포츠 종류</th>
</tr>
<tr>
<td colspan="20"><input type="radio" name="sportkind" value="all" checked> 전체</td>
<td colspan="20"><input type="radio" name="sportkind" value="축구"> 축구</td>
<td colspan="20"><input type="radio" name="sportkind" value="농구"> 농구</td>
<td colspan="20"><input type="radio" name="sportkind" value="야구"> 야구</td>
<td colspan="20"><input type="radio" name="sportkind" value="배드민턴"> 배드민턴</td>
<td colspan="20"><input type="radio" name="sportkind" value="자전거"> 자전거</td>
</tr>
<tr>
<th colspan="120" align="center">브랜드</th>
</tr>
 <tr>
<td colspan="15"><input type="radio" name="brand" value="all" checked> 전체</td>
<td colspan="15"><input type="radio" name="brand" value="나이키"> 나이키</td>
<td colspan="15"><input type="radio" name="brand" value="아디다스"> 아디다스</td>
<td colspan="15"><input type="radio" name="brand" value="푸마"> 푸마</td>
<td colspan="15"><input type="radio" name="brand" value="르꼬끄"> 르꼬끄</td>
<td colspan="15"><input type="radio" name="brand" value="휠라"> 휠라</td>
<td colspan="15"><input type="radio" name="brand" value="리복"> 리복</td>
<td colspan="15"><input type="radio" name="brand" value="언더아머"> 언더아머</td>
</tr>
 <tr>
 <th colspan="120" align="center">종류</th>
 </tr>
 <tr>
<td colspan="24"><input type="radio" name="kind" value="all" checked> 전체</td>
<td colspan="24"><input type="radio" name="kind" value="의류"> 의류</td>
<td colspan="24"><input type="radio" name="kind" value="신발"> 신발</td>
<td colspan="24"><input type="radio" name="kind" value="공"> 공</td>
<td colspan="24"><input type="radio" name="kind" value="스포츠용품"> 스포츠용품</td>
      	</tr>
      	<tr>
      	<td colspan="120"><input type="submit" value="검색" name="searchbutton" id="searchbutton" ></td>
      	</tr>
  </table>
  </form>
  	<c:if test="${product.sportkind != null}">
  ${product.sportkind}/${product.brand}/${product.kind} 검색결과
  </c:if>
  <table class="list">
		<c:set var="i" value="0" />
		<c:set var="j" value="5" />
	<c:forEach items="${productlist}" var="list">	
	 <c:if test="${i%j == 0 }">
	 <tr>
	  </c:if>
	  <td>
	  <div style="background-color: #a6c6f7;">
				<a onclick="location.href='/product/productDetail?qseq=${list.qseq}'">
					<img src="../img/${list.img}" style="width: 200px;height: 100px;">
					<h4>${list.brand}</h4>
					<h4>${list.kind}</h4>
					<h4>${list.name}</h4>
					<p>${list.price}원</p>
				</a>
				</div>
		</td>
		<c:if test="${i%j == j-1}">
		</tr>	
		</c:if>
		<c:set var="i" value="${i+1}" />
	</c:forEach>
	</table>
	</div>
</body>
</html>