<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="../CSS/FreeBoardList.css">
<meta charset="EUC-KR">
<script type="text/javascript">
	function getselectvalue() {
		//form.selectoption.value= form.select.options[form.select,selectedIndex].value;
		document.getElementById("selectoption").value = document
				.getElementById("selectbox").value;
		document.form.submit();
	}
	
	function closeWithSubmit(qseq) {
		var f = document.forms.popupForm;
		document.domain = "localhost";
		opener.name = "openerNames";
		document.getElementById("qseq").value= qseq;
		f.target = opener.name;
		f.submit();
		self.close();
	}
</script>
<title>Insert title here</title>
</head>
<body>
		<form action="/sportproduct/search" method="post" class="abcd">
	<h2 align="center">상품 찾기</h2>	
	<div class="search">
	<div class="search-container">
			<select name="selectbox" id="selectbox"
				style="width: 100px; height: 50px; font-size: 20px; margin-right: 30px;">
				<option value="sportkind">스포츠종류</option>
				<option value="brand">브랜드</option>
				<option value="kind">종류</option>
				<option value="name">이름</option>
			</select><input type="text" placeholder="Search.." id="searchtext"  maxlength="20"
				name="searchtext" style="width: 300px;"> <input
				type="hidden" id="selectoption" name="selectoption">
			<button onclick="getselectvalue();">
				<i class="fa fa-search"></i>
			</button>
	</div>
	</div>
		</form>
		<form action="/sportproduct/select" method="post" name="popupForm">
			<table>
		<tr>
			<th style="width:10%">스포츠종류</th>
			<th style="width:10%">브랜드</th>
			<th style="width:10%">종류</th>
			<th style="width:10%">이름</th>
			<th style="width:10%">선택</th>
		</tr>
			<c:forEach items="${searchlist}" var="list" varStatus="status">
				<tr>
					<td align="center">${list.sportkind}</td>
					<td align="center">${list.brand}</td>
					<td align="center">${list.kind}</td>
					<td align="center">${list.name}</td>
					<td align="center">
					<a href="javascript:;" onclick="closeWithSubmit(${list.qseq});">선택<input type="hidden" id="qseq" name="qseq">
					</a></td>
				</tr>
			</c:forEach>
			</table>
			</form>
</body>
</html>