<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/find/id.jsp</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/users/find/id" method="post">
	<input type="text" name="email" placeholder="이메일" value="${requestScope.email}">
	<div id="emailErrMsg">${errMsg}</div>
    <input type="submit" value="찾기">
</form>
</body>
</html>