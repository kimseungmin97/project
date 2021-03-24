<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/SearchId.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
alert("입력하신 정보와 일치하는 회원정보가 없습니다");
	function nullCheck() {
		var name = document.getElementById('name').value;
		var date = document.getElementById('date').value;
		var phonenumber = document.getElementById('phonenumber').value;

		if (name == "") {
			alert("이름을 입력해주세요");
			document.form.name.focus();
			return false;
		} else if (birth == "") {
			alert("생일을 입력해주세요");
			document.form.birth.focus();
			return false;
		} else if (phonenumber == "") {
			alert("전화번호를 입력해주세요");
			document.form.phonenumber.focus();
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
		<form class="form" name="form" method="post" action="SearchId.do">
			<p class="abc">이름</p>
			<input type="text" class="name" id="name" name="name" align="center">
			<p class="abc">생년월일</p>
			<input type="date" class="birth" id='birth' name="birth"size="10" align="center">
			<p class="abc">전화번호</p>
			<input type="text" class="phonenumber" id='phonenumber' name='phonenumber'>
			<a class="button2" type="button" onclick="nullCheck()" align="center">아이디찾기</a><br>
			<br>
			<a class="button2" onclick="window.history.back();">취소</a>
		</form>
	</div>
</body>
</html>