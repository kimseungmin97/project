<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript">
function closeWithSubmit() {
	var f = document.forms.form;
	document.domain = "localhost";
	opener.name = "openerNames";
	f.target = opener.name;
	f.submit();
	self.close();
}
</script>
<title>Insert title here</title>
</head>
<body>
<form action="/order/orderupdate" method="post" name="form">
<input type="hidden" id="id" name="id" value="${user.id}">
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="list" value="${list}"/>
<input type="hidden" name="oseq"  id="oseq" value="<%=request.getParameter("oseq")%>" />
<table>
<tr>
<th> 입금 계좌는 </th>
</tr>
<tr>
<td>국민은행 12345677</td>
</tr>
<tr>
<td align="center">입니다</td>
</tr>
<tr>
<td align="center">* 입금후 확인을 눌러주세요 </td>
</tr>
<tr>
<td><input type="button" onclick="closeWithSubmit()" value="확인"></td>
<td><input type="button" value="취소" onclick="self.close()"></td>
</tr>
</table>
</form>
</body>
</html>