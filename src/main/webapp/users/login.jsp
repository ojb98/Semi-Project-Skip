<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/login.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="login_container">
	<h2 class="logo">SKI:P</h2>
	<h3>로그인</h3>
	<form class="login_info" action="${pageContext.request.contextPath}/users/login" method="post" onsubmit="return checkIfValid()">
		<input class="input_id" type="text" name="user_id" placeholder="아이디" value="${requestScope.user_id}" onblur="checkUser_id()">
		<div id="user_idErrMsg"></div>
		<input class="input_pwd" type="password" name="password" placeholder="비밀번호" value="${requestScope.password}" onblur="checkPassword()">
		<div id="passwordErrMsg"></div>
		<div class="login_check">
			<input type="checkbox" name="auto" id="auto"><label for="auto">로그인 유지하기</label>
			<input type="checkbox" name="save" id="save"><label for="save">아이디 저장</label>
		</div>
		<input class="login_btn" type="submit" value="로그인">
		<input class="login_btn kakao_login" type="submit" value="카카오 로그인">
	</form>
	<div class="account_area">
		<ul>
			<!-- 아이디/비밀번호 찾기(미구현) -->
			<li>
				<a href="${pageContext.request.contextPath}/users/findId">아이디 찾기</a>							
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/users/findPw">비밀번호 찾기</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/users/signup">회원가입</a>
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	const user_id = document.getElementsByName("user_id")[0];
	const user_idErrMsg = document.getElementById("user_idErrMsg");
	const password = document.getElementsByName("password")[0];
	const passwordErrMsg = document.getElementById("passwordErrMsg");
	
	// 전체 유효성 검사	
	function checkIfValid() {
		checkUser_id();
		checkPassword();
		if (user_idErrMsg.innerHTML !== '') {
			return false;
		}
		if (passwordErrMsg.innerHTML !== '') {
			return false;
		}
		return true;
	}
	
	function checkUser_id() {
		if (user_id.value === '') {
			user_idErrMsg.innerHTML = "아이디를 입력해주세요.";
		} else {
			user_idErrMsg.innerHTML = "";
		}
	}
	
	function checkPassword() {
		if (password.value === '') {
			passwordErrMsg.innerHTML = "비밀번호를 입력해주세요.";
		} else {
			passwordErrMsg.innerHTML = "";
		}
	}
</script>
</body>
</html>