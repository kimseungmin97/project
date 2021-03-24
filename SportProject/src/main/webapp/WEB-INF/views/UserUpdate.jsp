<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/CreateUserCss.css">
<script>
	function nullCheck() {
		
		var eamil = document.getElementById('email').value;
		var phone = document.getElementById('phone').value;
		var address1 = document.form.address1.value;
		var address2 = document.form.address2.value;
		/* 	var pw = document.form.pw.value;
		var name = document.form.name.value;
		var birth = document.form.birth.value; */
		if (email =="") {
			alert("이메일을 입력해주세요");
			document.form.email.focus();
			return false;
		}
		else if (document.form.email.value.indexOf(" ") >= 0) {
			alert("이메일에 공백을 사용할 수 없습니다.")
			document.form.email.focus();
			return false;
		}
		else if (phone == ""){
			alert("전화번호를 입력해주세요");
			document.form.phone.focus();
			return false;
		}
		else if(isNaN(phone)) {
			alert("전화번호는 숫자만 입력 가능합니다");
			document.form.phone.focus();
			return false;
		}
		else if(address1 == ""){
			alert("주소를 입력해주세요");
			document.form.address1.focus();
			return false;
		}
		else if(address2 == ""){
			alert("상세주소를 입력해주세요");
			document.form.address2.focus();
			return false;
		}
		
		document.form.submit();
	}
	function post() {
		var url = "postsearch.jsp";
		window.open(url, "post", "toorbar=no, menubar=no, scrollbars=yes, resizable=no," +
				"width=500, height=300, top=300, left=300 ");
	}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<jsp:include page="headermenu.jsp"/>
		<div class="main">
		<p class="create" align="center">정보수정</p>
		<form class="form" name="form" action="UserUpdate" method="post"> 
	
	<input type="hidden" value="${user.id}" name="id"	id="id">
			<p class="abc">이메일</p><br>
			<input type="text" class="email" id='email' name='email' value="${user.email}" size="10"><br> 
			<p class="abc">전화번호</p><br>
			<input type="text" class="phone" id='phone' name="phone" value="${user.phone}" size="10"><br>
			<p class="abc">주소</p><br>	
			<input type="text" class="address1" value="${user.address1}" id="address1" name="address1"><a class="helf" onclick="post()">주소검색</a>
			<p class="abc">상세주소</p><br>
			<input type="text" class="address2" name="address2" id="address2" value="${user.address2}"><br>
			<a class="button2" onclick="nullCheck();" align="center">정보 수정</a><br><br>
			<a class="button2" onclick="window.history.back();">취소</a>
		</form>
		</div>
</body>