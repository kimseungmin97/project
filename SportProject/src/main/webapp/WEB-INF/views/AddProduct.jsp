<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="/CSS/AddProduct.css">
<script>
	function SearchCar() {
		document.domain = "localhost";
		window.open("/sportproduct/SearchSP", "Search Car", "width=900, height=500");
	}
	function setThumbnail(event) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#image_container").appendChild(img); }; 
			reader.readAsDataURL(event.target.files[0]); } 
	</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
	<form action="/product/productinsert" method="post">
	<table class="table" align="center">
	<tr>
	<td colspan="4"><p class="aaa">상품 추가</p></td>
	</tr>
	<tr>
	<td colspan="4"><input type="button" onclick="SearchCar();" value="상품 정보 가져오기" class="button2"></td>
	</tr>
	<tr>
	<td colspan="1"><p class="abc">브랜드</p></td><td><input type="text" class="brand" id='brand' name="brand" size="10" value="${list.brand}"></td>
	<td colspan="1"><p class="abc">종류</p></td><td><input type="text" class="kind" id='kind' name="kind" size="10" value="${list.kind}"></td>
	</tr>
	<tr>
	<td colspan="1"><p class="abc">스포츠종류</p></td><td><input type="text" class="sportkind" id='sportkind' name="sportkind" size="10" value="${list.sportkind}"></td>
	<td colspan="1"><p class="abc">이름</p></td><td><input type="text" class="name" id='name' name="name" size="10" value="${list.name}"></td>
	</tr>
	<tr>
	<td colspan="4"><p class="abc">이미지</p></td>
	</tr>
	<tr>
	</tr>
	<tr>
	<td colspan="4"><input type="file" id="img" name="img" accept="image/*" onchange="setThumbnail(event);"/></td>
	</tr>
	<tr>
	<td><div id="image_container"></div></td>
	</tr>
	<tr>
	<td colspan="1"><p class="abc">개수</p></td><td><input type="text" class="number" id='number' name="number" size="10"></td>
	</tr>
	<tr>
	<td colspan="1"><p class="abc">판매가</p></td><td><input type="text" class="price" id='price' name="price" size="10"></td>
	<td colspan="1"><p class="abc">구매가</p></td><td><input type="text" class="buyprice" id='buyprice' name="buyprice" size="10"></td>
	</tr>
	<tr>
	
	<td colspan="2"><input type="submit" class="button2" value="상품추가"></td>
	<td colspan="2"><a class="button2" onclick="window.history.back();" align="center">취소</a></td>
	</tr>
	</table>
	</form>
</body>
</html>