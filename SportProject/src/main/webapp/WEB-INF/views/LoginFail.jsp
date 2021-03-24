<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/Login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
alert("아이디 및 비밀번호를 다시 확인해주세요");
function nullCheck() {
	var id = document.getElementById('id').value;
	var pw = document.getElementById("pw").value;
	if(id=="") {
		alert("아이디를 입력해주세요");
		document.form.id.focus();
		return false;
	}else if (pw=="") {
		alert("비밀번호를 입력해주세요");
		document.form.pw.focus();
		return false;
	}
	document.form.submit();
}
</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="headermenu.jsp"/>
<div class="main">
<p class="sign" align="center">로그인</p>
<form class="form" name="form" method='post' action="Login.do">
<input type="text" class="id" name="id" id="id" align="center" placeholder="아이디"><br>
<input type="password" class="pw" name="pw" id="pw" align="center" placeholder="비밀번호"><br>
<a class="button2" onclick="nullCheck();" >로그인</a><br>
<br>
<a class="button2" onclick="window.history.back();">취소</a>
<p class="forgot" align="center"><a class="helf" onclick="location.href='SearchId.jsp'">아이디 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="helf" onclick="location.href='SearchPw.jsp'">비밀번호 찾기</a></p>
</form>
</div>
</body>
</html>