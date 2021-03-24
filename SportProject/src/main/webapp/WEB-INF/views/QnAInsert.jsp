<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="headermenu.jsp"/>
<h2>고객 게시판</h2>
<p>고객님의 방문에 감사드리며 친절하게 1:1 답변을 드립니다</p>
<div class="container">
  <form action="/qna/qnainsert" method="post"  class="form" name="form" >
  <c:set var="user" value="${sessionScope.user}"/>
  <input type="hidden" value="${user.id}" name="id" id="id">
  ${user.id}
    <div class="row">
      <div class="col-25">
        <label for="fname">제목</label>
      </div>
      <div class="col-75">
        <input type="text" id="subject" name="subject" placeholder="제목을 적어주세요">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="subject">내용</label>
      </div>
      <div class="col-75">
        <textarea id="content" name="content" placeholder="내용을 적어주세요" style="height:200px"></textarea>
      </div>
    </div>
    <div class="row">
      <input type="submit" value="글작성">
      <a class="button2" onclick="window.history.back();">취소</a>
    </div>
  </form>
</div>
</body>
</html>