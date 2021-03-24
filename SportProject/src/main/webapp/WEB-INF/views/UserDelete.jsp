<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/ResultId.css">
<meta charset="EUC-KR">
<script type="text/javascript">
function disable(box) {
	var abc = document.getElementById('button'); 
	if (box.checked == true	) {
	abc.disabled = false;		
	}else {
		abc.disabled = true;
	}
	
}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />	
<jsp:include page="headermenu.jsp"/>
<c:forEach items="user" var="user"/>	
		<p class="sign" align="center">회원탈퇴</p>
			<p class="abc" align="center">탈퇴 후에는 아이디${user.id}로 다시 가입할수 없으며</p>
			<p class="abc" align="center">아이디와 데이터는 복구할 수 없습니다.</p>
			<p class="abc" align="center">게시판에 남아있는 게시글은 탈퇴후 삭제할 수 없습니다.</p><br>
			<p class="abc" align="center"><input type="checkbox" onclick="disable(this);">위 사항에 동의합니다</p>
			<p class="abc" align="center"><input type="button" name="button" id="button" onclick="location.href='/user/UserDelete'" value="회원탈퇴" disabled></p>
</body>
</html>