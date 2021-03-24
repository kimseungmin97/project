<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/FreeBoardInsert.css">
<script type="text/javascript">
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); }; 
		reader.readAsDataURL(event.target.files[0]); } 
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<jsp:include page="headermenu.jsp" />
<form class="form" name="form" action="/product/reviewinsert" method="post">
	<c:set var="user" value="${sessionScope.user}"/>
<input type="hidden" value="${user.id}" name="id" id="id">
<input type="hidden" value="${qseq}" name="qseq" id="qseq">
<input type="hidden" value="${oseq}" name="oseq" id="oseq">
  <div class="container">
    <h1 align="center">상품 후기 작성</h1>
    	 <label for="subject">평점 주기</label>    
       <br> 
       <label for="subject"><input type="number" min="0" max="5" id="grade" name="grade"></label>    
       <br> 
        <label for="subject">이미지 선택</label>    
       <br> 
       <input type="file" id="img" name="img" accept="image/*" onchange="setThumbnail(event);"/>
       <br>
       <div id="image_container"></div>
       <br>
    <label for="content"><b>내용</b></label><br>
    <textarea class="textarea" rows="40" cols="40" placeholder="내용을 입력해주세요" 
    name="content" id="content" maxlength=10000></textarea>	
    <button type="submit" class="registerbtn">작성완료</button>
    <a class="button2" onclick="window.history.back();">취소</a>
  </div>
</form>
</body>
</html>
