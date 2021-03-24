<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POST</title>
<script> type="text/javasrcipt";
	function result(zipNum,sido,gugun, dong) {
		opener.document.form.address1.value=zipNum + " " + sido+" "+gugun+" "+dong;
		self.close();
	}
</script>
</head>

<body>
 <div id="popup">
 <h1>우편번호 검색</h1>
 <form action="/post/postsearch" name=form method="post">
 동 이름 : <input name="dong" type="text">
 		<input type="submit" value="찾기" class="submit">
 </form>
 <table id="zipcode">
 <tr>
 <th>우편번호</th>
 <th>주소</th>
 </tr>
<c:forEach items="${postList}" var="list">
<tr>
	<td>${list.zipcode}</td>
	<td><a href="#" onclick="result('${list.zipcode}', '${list.sido}'
	, '${list.gugun}', '${list.dong}')">${list.sido} ${list.gugun} ${list.dong}</a></td>
</tr>
</c:forEach>
 </table>
 </div>
</body>
</html>