<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/find/pw.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<main>
	<div class="login_container">
		<a href="${pageContext.request.contextPath}/index.jsp"><h2 class="logo">SKI:P</h2></a>
		<h3>비밀번호 찾기</h3>
		<form class="login_info" action="${pageContext.request.contextPath}/users/find/pw" method="post">
			<input class="input_text" type="text" name="email" placeholder="이메일" value="${requestScope.email}">
			<input class="input_text" type="text" name="user_id" placeholder="아이디" value="${requestScope.email}">
			<div id="errMsg">${errMsg}</div>
			<input class="login_btn" type="submit" value="찾기">
		</form>
	</div>
</main>
</body>
</html>