<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/SearchId.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function nullCheck() {
		var name = document.getElementById('name').value;
		var birth = document.getElementById('birth').value;
		var phone = document.getElementById('phone').value;

		if (name == "") {
			alert("이름을 입력해주세요");
			document.form.name.focus();
			return false;
		} else if (birth == "") {
			alert("생일을 입력해주세요");
			document.form.birth.focus();
			return false;
		} else if (phone == "") {
			alert("전화번호를 입력해주세요");
			document.form.phone.focus();
			return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
	<div class="main">
		<p class="sign" align="center">아이디 찾기</p>
		<form class="form" name="form" method="post" action="/user/SearchId">
			<p class="abc">이름</p>
			<input type="text" class="name" id="name" name="name" align="center">
			<p class="abc">생년월일</p>
			<input type="date" class="birth" id='birth' name="birth"size="10" align="center">
			<p class="abc">전화번호</p>
			<input type="text" class="phone" id="phone" name="phone" align="center">
			<br>
			<br>
			<a class="button2" type="button" onclick="nullCheck()" align="center">아이디찾기</a><br>
			<br>
			<a class="button2" onclick="window.history.back();">취소</a>
		</form>
	</div>
</body>
</html>