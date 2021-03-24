<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/CarInsert.css">
<script>
	function abc() {
		//var brand = document.querySelector('input[name="brand"]:checked').value;
		var kind = document.getElementById("kind");
		kind = kind.options[kind.selectedIndex].value;
		var sportkind = document.getElementById("sportkind");
		sportkind = sportkind.options[sportkind.selectedIndex].value;
		var name = document.getElementById("name").value;
		if (name == "") {
			alert("이름을 입력해주세요");
			document.form.id.focus();
			return false;
		}
		document.searchForm.submit();
	}
</script>
<title>Insert title here</title>	
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
	<form class="searchForm" name="searchForm" id="searchForm"
		action="/sportproduct/sportproductinsert" method="post">
		<div class="main">
			<p class="create" align="center">상품 추가</p>
				<p class="abc">스포츠 종류</p>
			<select name="sportkind" id="sportkind"
				style="width: 150px; height: 40px; font-size: 20px; margin-left: 30px;">
				<option value="축구">축구</option>
				<option value="농구">농구</option>
				<option value="야구">야구</option>
				<option value="배드민턴">배드민턴</option>
				<option value="자전거">자전거</option>
			</select>
			<p class="abc">브랜드 선택</p>
			<br> 
			<label><input type="radio" class="brand" name="brand" value="나이키" checked>나이키</label> 
			<label><input type="radio" class="brand" name="brand" value="아디다스">아디다스</label>
			<label><input type="radio" class="brand" name="brand" value="푸마">푸마</label> 
			<label><input type="radio" class="brand" name="brand" value="르꼬끄">르꼬끄</label><br> 
			<label><input type="radio" class="brand" name="brand" value="휠라">휠라</label> 
			<label><input type="radio" class="brand" name="brand" value="리복">리복</label> 
			<label><input type="radio" class="brand" name="brand" value="언더아머">언더아머</label> 
			<br>
			
			<p class="abc">종류 선택</p>
			<select name="kind" id="kind"
				style="width: 150px; height: 40px; font-size: 20px; margin-left: 30px;">
				<option value="의류">의류</option>
				<option value="신발">신발</option>
				<option value="공">공</option>
				<option value="스포츠용품">스포츠용품</option>
			</select><br>
		
			<p class="abc">상품 이름</p>
			<br> <input type="text" id="name" name="name" class="name"
				maxlength="20"
				style="width: 150px; height: 40px; font-size: 20px; margin-left: 30px;">
			<br> <br> <a class="button2" onclick="abc();">상품 추가하기</a><br>
			<br> <a class="button2" onclick="window.history.back();">취소</a>
		</div>
	</form>
</body>
</html>