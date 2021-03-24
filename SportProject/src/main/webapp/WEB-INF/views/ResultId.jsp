<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/ResultId.css">
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>
<jsp:include page="header.jsp" />
<jsp:include page="headermenu.jsp"/>
<div class="main">
<c:forEach items="user" var="user"/>
		<p class="sign" align="center">아이디 찾기</p>
			<p class="abc" align="center">회원님의 아이디는</p>
			<p class="abc1" align="center">${user.id}</p>
			<p class="abc" align="center">입니다</p><br>
			<a class="button2" type="button" onclick="location.href='/user/Loginpage'" align="center">로그인</a>
	</div>
</body>
</html>