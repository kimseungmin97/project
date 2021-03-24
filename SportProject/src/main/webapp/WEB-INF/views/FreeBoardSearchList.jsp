<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../CSS/FreeBoardList.css">
<meta charset="UTF-8">
<script type="text/javascript">
	function getselectvalue() {
		var selectbox = document.getElementById("selectbox").value;
		if (selectbox == "검색메뉴 선택") {
			alert("검색 메뉴를 선택해주세요");
			return false;
		} else {
			document.abc.submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="headermenu.jsp" />
	<h2 align="center">자유게시판</h2>
	<div class="search">
		<div class="search-container">
			<form
				action="/freeboard/FreeBoardSearch?&selectbox=${selectbox}&searchtext=${searchtext}"
				method="get" name="abc" id="abc">
				<select name="selectbox" id="selectbox"
					style="width: 200px; height: 50px; font-size: 20px; margin-right: 30px;">
					<option value="검색메뉴 선택">검색메뉴 선택</option>
					<option value="value">분류</option>
					<option value="id">작성자</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select> <input type="text" placeholder="Search.." id="searchtext"
					name="searchtext" style="width: 1000px;">
				<!-- <input type="hidden" id="selectoption" name="selectoption" > -->
				<input type="button" onclick="getselectvalue();" value="검색">
				<input type="hidden">
			</form>
		</div>
	</div>
	<br>
	<table>
		<tr>
			<th style="width: 5%">번호</th>
			<th style="width: 10%">분류</th>
			<th style="width: 20%">게시물 제목</th>
			<th style="width: 10%">작성자</th>
			<th style="width: 10%">작성날짜</th>
			<th style="width: 5%"></th>
		</tr>
		<c:forEach items="${searchlist}" var="list">
			<tr>
				<td align="center">${list.qseq}</td>
				<td align="center">${list.value}</td>
				<td align="center"><a
					onclick="location.href='/freeboard/FreeBoardDetail?qseq=${list.qseq}'">${list.subject}<input
						type="hidden" name="view" id="view" value="${list.view}"></a></td>
				<td align="center">${list.id}</td>
				<td align="center">${list.indate}</td>
				<td align="center">${list.view}</td>
			</tr>
		</c:forEach>
	</table>
	<c:forEach var="num" begin="1" end="${pageNum}">
		<a href="/freeboard/FreeBoardList?num=${num}">[${num}] </a>
	</c:forEach>
	<c:choose>
		<c:when test="${sessionScope.user != null}">
			<c:set var="user" value="${sessionScope.user}" />
			<input type="hidden" value="${user.id}" name="id" id="id">
			<input type="hidden" value="${user.pw}" name="pw" id="pw">
			<input type="button"
				onclick="location.href='/freeboard/FreeBoardInsertpage'"
				value="글 작성">
		</c:when>
		<c:otherwise>
	글작성은 로그인이후 이용가능합니다
	<input type="button" onclick="location.href='/user/Loginpage'"
				value="로그인하기">
		</c:otherwise>
	</c:choose>

</body>
</html>
