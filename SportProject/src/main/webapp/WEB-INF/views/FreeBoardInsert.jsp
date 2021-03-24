<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/FreeBoardInsert.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function nullCheck() {
	var value = document.getElementById('value').value;
	if (value == "게시판 선택") {
		alert ("게시판을 선택해주세요");
		document.form.value.focus();
		return false;
	}
	document.form.submit();
}
</script>
</head>
<body>
<jsp:include page="header.jsp" />
<jsp:include page="headermenu.jsp" />
<form class="form" name="form" action="/freeboard/FreeBoardInsert" method="post">
	<c:set var="user" value="${sessionScope.user}"/>
<input type="hidden" value="${user.id}" name="id" id="id">
  <div class="container">
    <h1 align="center">자유게시판 글쓰기</h1>
    <select name="value" id="value" class="value">
			<option value="게시판 선택">게시판 선택</option>
			<option value="경기분석">경기분석</option>
			<option value="축구장추천">축구장추천</option>
			<option value="상품추천">상품추천</option>
			<option value="피파온라인선수추천">피파온라인선수추천</option>
		</select><br>
    <label for="subject"><b>제목</b></label><br>
    <input type="text" class="title2" placeholder="제목을 입력해주세요" name="subject" id="subject" style="width:100%"><br>
    <label for="content"><b>내용</b></label><br>
    <textarea class="textarea" rows="40" cols="40" placeholder="내용을 입력해주세요" 
    name="content" id="content" maxlength=10000></textarea>
    <button type="button" onclick="nullCheck();" class="registerbtn">작성완료</button>
    <a class="button2" onclick="window.history.back();">취소</a>
  </div>
</form>
</body>
</html>
