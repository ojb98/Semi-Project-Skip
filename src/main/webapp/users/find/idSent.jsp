<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/find/idSent.jsp</title>
</head>
<body>
<div>
	<h3>아래 이메일로 아이디를 전송했습니다.</h3>
	<div>${email}</div>
	<input type="button" value="로그인">
</div>
<form action="${pageContext.request.contextPath}/users/find/id" method="post">
	<input type="hidden" name="email" value="${email}">
	<div>이메일을 못 받으셨나요? <input type="submit" value="재전송"></div>
</form>
</body>
</html>