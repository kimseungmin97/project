<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/FreeBoardDetail.css">
<meta charset="UTF-8">
<script type="text/javascript">
function deletecheck() {
	var result;
	result = confirm("이 글을 삭제하실건가요?");
	if(result){
	    alert("삭제되었습니다");
	    location.href="FreeBoardDelete?qseq=${freeboard.qseq}";
	}else{
		alert("취소하셨습니다");
	}	
}
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
<form method="post" action="/freeboard/fbreply">
	<div class="main">
		<input type="hidden" value="${freeboard.qseq}" name="qseq" id="qseq">
	<table border="1">
	<tr>
	<th colspan="7">${freeboard.subject}</th>
	</tr>
	<tr>
	<td colspan="1">분류</td><td colspan="4">${freeboard.value}</td><td colspan="1">작성자</td><td colspan="1">${freeboard.id}</td>
	</tr>
	<tr>
	<td colspan="1">작성날짜</td><td colspan="4">${freeboard.indate}</td><td colspan="1">조회수</td><td colspan="1">${freeboard.view}</td>
	</tr>
	<tr>
	<td class="content" colspan="7">${freeboard.content}</td>
	</tr>
	<tr>
	<td colspan="7">댓글</td>
	</tr>
	<tr>
	<td colspan="1">작성자</td>
	<td colspan="5">내용</td>
	<td colspan="1">작성일</td>
	</tr>
	<c:forEach items="${replyList}" var="list">
	<tr>
	<td colspan="1">${list.id}</td>
	<td colspan="5">${list.content }</td>
	<td colspan="1">${list.indate }</td>
	</tr>
	</c:forEach>
	
	<c:choose>
<c:when test="${sessionScope.user != null}">
	<c:set var="user" value="${sessionScope.user}"/>
	<input type="hidden" value="${user.id}" name="id" id="id">
	<tr>
	<td colspan="1">댓글작성 </td>
	<td colspan="5"><input type="text" id="content" name="content" style="width: 500px;"></td>
	<td colspan="1"><input type="submit" value="작성"></td>
	</tr>
	</c:when>
	<c:when test="${sessionScope.user == null}">
	<tr>
	<td colspan="5">댓글 작성은 로그인 이후 가능합니다</td>
	<td colspan="2"><input type="button" value="로그인하러가기" onclick="location.href='/user/Loginpage'">
	</tr>
	</c:when>
	</c:choose>
	</table>
	<a class="button2" onclick="location.href='FreeBoardList?num=1'">뒤로가기</a>
	<br>
	<c:choose>
	<c:when test="${user.id == freeboard.id	}">
	<input type="button" value="글수정" onclick="location.href='/freeboard/FreeBoardChangepage?qseq=${freeboard.qseq}'">
	<%-- <input type="button" value="글삭제" onclick="location.href='FreeBoardDelete.do?qseq=${freeboard.qseq}'"> --%>
	<input type="button" value="글삭제" onclick="deletecheck();">
	</c:when>
	</c:choose>
	</div>
	</form>
</body>
</html>