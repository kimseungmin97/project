<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
* {
box-sizing : border-box;
}
.header {
  padding: 40px;
  height : 250px;
  text-align: center;
  background: #1abc9c;
  color: white;
}
.site {
	margin-left: 60ex;
}
.header:right {
text-align: left;
}
.box {
background-color: #333;
dispaly : flex;
align-items: center;
justify-content: center;
}
 img.left { 
        float: left;
      }
.button {
width : 140px;
height: 45px;
font-size : 11px;
text-transform: uppercase;
letter-spacing: 2.5px;
font-weight: 500;
color:#000;
background-color: #fff;
border: none;
border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
}
.button:hover {
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
</style>
</head>
<body>
<div class="header">
<div>
<img src="../img/boy.png" width="200px" height="200px" class="left">
</div>
<div class="site" style="float:left;">
<h1><a href="/home">슬기로운 운동생활</a></h1>
<p>오늘도 좋은 하루 되세요</p>
</div>
</div>
<c:choose>
<c:when test="${sessionScope.user != null}">
	<c:set var="user" value="${sessionScope.user}"/>
	<c:choose>
	<c:when test="${user.id eq 'ksm' and user.pw eq 123}">
<div class="box">
	<input type="button" class="button" name="경기관리" value="경기관리" onclick="location.href='/game/Sportmanage'"> 
	<input type="button" class="button" name="주문관리" value="주문관리" onclick="location.href='/order/orderAllList'">
	<input type="button" class="button" name="스포츠상품추가" value="스포츠상품추가" onclick="location.href='/sportproduct/sportproductinsertpage'">
	<input type="button" class="button" name="상품추가" value="상품추가" onclick="location.href='/product/Productinsertpage'"> 
	<input type="button" class="button" name="QnA 답변" value="QnA 답변" onclick="location.href='/qna/qnalistall'">
	<input type="button" class="button" name="로그아웃" value="로그아웃" onclick="location.href='/user/Logoutpage'">
</div>
</c:when>
<c:otherwise>
<div class="box">
	<input type="hidden" value="${user.id}" name="id" id="id">
	<input type="hidden" value="${user.pw}" name="pw" id="pw">
	<input type="button" class="button" name="주문현황" value="주문현황" onclick="location.href='/order/orderList'"> 
	<input type="button" class="button" name="고객센터" value="고객센터" onclick="location.href='/qna/qnalist'"></input>
	<input type="button" class="button" name="정보수정" value="정보수정" onclick="location.href='/user/UserUpdatepage'">
	<input type="button" class="button" name="비번변경" value="비번변경" onclick="location.href='/user/ChangePwpage'">
	<input type="button" class="button" name="회원탈퇴" value="회원탈퇴" onclick="location.href='/user/UserDeletepage'">
	<input type="button" class="button" name="로그아웃" value="로그아웃" onclick="location.href='/user/Logoutpage'">
</div>
</c:otherwise>
</c:choose>
	</c:when>
	<c:otherwise>
<div class="box">
<input type="button" class="button" value="로그인" onclick="location.href='/user/Loginpage'">
<input type="button" class="button" value="회원가입" onclick="location.href='/user/Createpage'">
<input type="button" class="button" name="아이디" value="아이디찾기" onclick="location.href='/user/SearchIdpage'">
<input type="button" class="button" name="비밀번호" value="비밀번호찾기"onclick="location.href='/user/SearchPwpage'">
</div>
</c:otherwise>
</c:choose>
<!-- <input type="button" class="button" name="회원가입" value="장바구니"><br> -->
</body>
</html>