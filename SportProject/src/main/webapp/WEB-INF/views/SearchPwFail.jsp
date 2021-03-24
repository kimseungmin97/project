<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/SearchPw.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("입력하신 정보와 일치하는 회원정보가 없습니다");
	function nullCheck() {
		var id = document.getElementById('id').value;
		var name = document.getElementById('name').value;
		var phonenumber = document.getElementById('phonenumber').value;

		if (id == "") {
			alert("아이디를 입력해주세요");
			document.form.id.focus();
			return false;
		} else if (name == "") {
			alert("이름을 입력해주세요");
			document.form.name.focus();
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
		<p class="sign" align="center">비밀번호 찾기</p>
		<form class="form" name="form" method="post" action="SearchPw.do">
			<p class="abc">아이디</p>
			<input type="text" class="id" id='id' name="id" align="center">
			<p class="abc">이름</p>
			<input type="text" class="name" id="name" name="name" align="center">
			<p class="abc">전화번호</p>
			<input type="text" class="phone" id='phone' name='phone'>
			<a class="button2" type="button" onclick="nullCheck()" align="center">비밀번호 찾기</a><br>
			<br>
			<a class="button2" onclick="window.history.back();">취소</a>
		</form>
	</div>
</body>
</html>