<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/CreateUserCss.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script>
//아이디 유효성 검사(1 = 중복 / 0 != 중복)
var idck = 0;
$(function() {
  $("#idcheck").click(function () {
		var id = $('#id').val();
		var idJ = /^[a-z0-9]{4,12}$/;
		$.ajax({
			async: true,
			type : 'POST',
			data : id,
			url : "${pageContext.request.contextPath}/user/idcheck",
			 dataType : "json",
			 contentType: "application/json; charset=UTF-8",
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data > 0) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
						idck = 0;
					} else {
						
						if(idJ.test(id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("사용가능한 아이디 입니다");
							$("#reg_submit").attr("disabled", false);
							idck = 1;
							$("#id").attr("readonly",true);
						} else if(id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 ');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							idck = 0;
						} else if(id == null){
							
							$('#id_check').text('아이디를 입력해주세요 ');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							idck = 0;
						}	else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 ");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
							idck = 0;
						}
						
					}
				},  error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        alert ("아이디를 입력해주세요");
				}
			});

});
});

$(function() {
	  $("#resetid").click(function () {
		  $("#id").attr("readonly",false);
		 idck=0;
	  });
	  });
</script>
<script type="text/javascript"> -->
function nullCheck() {
	var id = document.getElementById('id').value;
	//var idcheck = document.form.getElementById('id');
	var pw = document.getElementById('pw').value;
	var pw2 = document.getElementById('pw2').value;
	var name = document.getElementById('name').value;
	var birth = document.getElementById('birth').value;
	var eamil = document.getElementById('email').value;
	var phone = document.getElementById('phone').value;
	var male = document.getElementById('male').value;
	var female = document.getElementById('female').value;
	var secret = document.getElementById('secret').value;
	var address1 = document.form.address1.value;
	var address2 = document.form.address2.value;
	var man = document.querySelector('input[name="man"]:checked').value;
	if (pw == "") {
		alert("비밀번호를 입력해주세요");
		document.form.pw.focus();
		return false;
	}
	if (document.form.pw.value.indexOf(" ") >= 0) {
		alert("비밀번호에 공백을 사용할 수 없습니다.")
		document.form.pw.focus();
		return false;
	}
	if (document.form.pw.value.length<4 || document.form.pw.value.length>12) {
		alert("비밀번호를 4~12자까지 입력해주세요.")
		document.form.pw.focus();
		return false;
	}
	if (pw != pw2) {
		alert("비밀번호가 일치하지 않습니다");
		document.form.pw2.focus();
		return false;
	}
	if (name == "") {
		alert("이름을 입력해주세요");
		document.form.name.focus();
		return false;
	}
	if (document.form.name.value.indexOf(" ") >= 0) {
		alert("이름에 공백을 사용할 수 없습니다.")
		document.form.name.focus();
		return false;
	}
	if (email == "") {
		alert("이메일을 입력해주세요");
		document.form.email.focus();
		return false;
	}
	if (document.form.email.value.indexOf(" ") >= 0) {
		alert("이메일에 공백을 사용할 수 없습니다.")
		document.form.email.focus();
		return false;
	}
	if (birth == "") {
		alert("생일을 입력해주세요");
		document.form.date.focus();
		return false;
	}
	if (phone == "") {
		alert("전화번호를 입력해주세요");
		document.form.phone.focus();
		return false;
	}
	if (isNaN(phone)) {
		alert("전화번호는 숫자만 입력 가능합니다");
		document.form.phone.focus();
		return false;
	}
	if (document.form.phone.value.indexOf(" ") >= 0) {
		alert("전화번호에 공백을 사용할 수 없습니다.")
		document.form.phone.focus();
		return false;
	}
	if (document.form.phone.value.length<10 || document.form.phone.value.length>12) {
		alert("전화번호를 10~12자까지 입력해주세요.")
		document.form.phone.focus();
		return false;
	}
	if (address1 == "") {
		alert("주소를 입력해주세요");
		document.form.address1.focus();
		return false;
	}
	if (address2 == "") {
		alert("상세주소를 입력해주세요");
		document.form.address2.focus();
		return false;
	}
	if (idck == 0) {
		alert("아이디 중복체크를 해주세요")
		return false;
	}
	document.form.submit();
	/* var left = Math.ceil(((window.screen.width)/2)-100);
	var top = Math.ceil(((window.screen.height)/2)-50); 
	window.open('checkcreate.jsp','', 'width=300, height=100, width='+ left + ', top=' + top); */
}
function post() {
	var url = "/post/postsearchpage";
	window.open(url, "post",
			"toorbar=no, menubar=no, scrollbars=yes, resizable=no,"
					+ "width=500, height=300, top=300, left=300 ");
}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
	<div class="main">
		<p class="create" align="center">회원가입</p>
		<form class="form" name="form" action="/user/insert" method="post">
			<div class="form-group">
			<p class="abc"><label for="id">아이디</label></p>
			<br>
			<input type="text" class="id" id="id" name="id" placeholder="ID" size="10" maxlength="20">
			<input type="button" name="idcheck" id="idcheck" class="idcheck" value="중복체크">
			<input type="button" name="resetid" id="resetid" class="resetid" value="새로운 아이디">
			<br> 
			<div class="check_font" id="id_check"></div>
			</div>
			<p class="abc">비밀번호</p>
			<br> <input type="password" class="pw" id='pw' name="pw" size="10" maxlength="20"><br>
			<p class="abc">비밀번호 확인</p>
			<br> 
			<input type="password" class="pw2" id='pw2' name="pw2" size="10"><br>
			<p class="abc">이름</p>
			<br> <input type="text" class="name" id='name' name="name" size="10" maxlength="20"><br>
			<p class="abc">생년월일</p>
			<br> <input type="date" class="birth" id='birth' name='birth' size="10"><br>
			<p class="abc">이메일</p>
			<br> 
			<input type="text" class="email" id='email' name='email' size="10"><br>
			<p class="abc">성별</p>
			<br>
			<div class="man">
				남자<input type="radio" name="man" id='male' value="남자" size="10" checked> 
				여자<input type="radio" name="man" id='female' value="여자" size="10"> 
				비공개<input type="radio" name="man" id='secret' value="비공개" size="10"><br>
			</div>
			<p class="abc">전화번호</p>
			<br> <input type="text" class="phone" id='phone'
				name="phone" size="10" maxlength="20"><br>
			<p class="abc">주소</p>
			<br> <input type="text" class="address1" name="address1"
				maxlength="30"><a class="helf" onclick="post()">주소검색</a>
			<p class="abc">상세주소</p>
			<br> <input type="text" class="address2" name="address2"
				maxlength="30"><br> <a class="button2"
				onclick="nullCheck();" align="center">회원가입</a><br> <br> <a
				class="button2" onclick="window.history.back();">취소</a>
		</form>
	</div>
</body>