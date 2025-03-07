<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup.jsp</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/users/signup" method="post" onsubmit="return checkIfValid()">
	<input type="text" name="user_id" placeholder="아이디" value="${requestScope.user_id}">
	<input type="password" name="password" placeholder="비밀번호" value="${requestScope.password}">
	<input type="password" name="cpassword" placeholder="비밀번호 확인" value="${requestScope.cpassword}">
	<input type="text" name="email" placeholder="이메일" value="${requestScope.email}">
	<input type="text" name="phone" placeholder="전화번호" value="${requestScope.phone}">
	<input type="text" name="name" placeholder="이름" value="${requestScope.name}">
	
	<!-- 약관 동의(미구현) -->
	<input type="checkbox" name="agree" id="agree"><label for="agree">모두 동의합니다.</label>
	<input type="submit" value="가입하기">
</form>
<script>
	let valid = true;

	// 전체 유효성 검사	
	function checkIfValid() {
		checkUser_id();
		checkPassword();
		checkCpassword();
		checkEmail();
		checkPhone();
		checkName();
		return valid;
	}
	
	function checkUser_id() {
		
	}
	
	function checkPassword() {
		
	}
	
	function checkCpassword() {
		
	}
	
	function checkEmail() {
		
	}
	
	function checkPhone() {
		
	}
	
	function checkName() {
		
	}
</script>
</body>
</html>