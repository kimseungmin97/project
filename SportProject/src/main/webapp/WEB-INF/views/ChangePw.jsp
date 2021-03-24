<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/SearchPw.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function nullCheck() {
		var pw = document.getElementById('nowpw').value;
		var pw2 = document.getElementById('pw2').value;
		var pw3 = document.getElementById('pw3').value;
		alert(pw);
		if (pw == "") {
			alert("현재 비밀번호를 입력해주세요");
			return false;
		} else if (pw2 == "") {
			alert("변경할 비밀번호를 입력해주세요");
			return false;
		}  else if (pw3 == "") {
			alert("변경할 비밀번호를 확인해주세요");
			return false;
		}else if (pw2 != pw3) {
			alert ("변경하는 비밀번호가 일치하지 않습니다");
			return false;
		}if (document.form.pw2.value.indexOf(" ") >= 0) {
			alert("비밀번호에 공백을 사용할 수 없습니다.")
			document.form.pw.focus();
			return false;
		}
		if (document.form.pw2.value.length<4 || document.form.pw.value.length>12) {
			alert("비밀번호를 4~12자까지 입력해주세요.")
			document.form.pw.focus();
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
		<p class="sign" align="center">비밀번호 변경</p>
		<form class="form" name="form" method="post" action="/user/ChangePw">
		<%-- <c:set var="user" value="${sessionScope.user}"/> --%>
			<p class="abc">현재 비밀번호</p>
			<input type="text" class="id" id="nowpw" name="nowpw" align="center">
			<p class="abc">변경할 비밀번호</p>
			<input type="text" class="name" id="pw2" name="pw2" align="center">
			<p class="abc">비밀번호 확인</p>
			<input type="text" class="name" id="pw3" name="pw3" align="center">
			<a class="button2" type="button" onclick="nullCheck()" align="center">비밀번호 변경</a><br>
			<br><a class="button2" onclick="window.history.back();">취소</a>	
		</form>
	</div>
</body>
</html>