<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SKI:P</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage.css">
</head>
<body>
<jsp:include page="/header.jsp"/>
<main>
	<div class="login_container">
		<a href="${pageContext.request.contextPath}/index.jsp"><h2 class="logo">SKI:P</h2></a>
		<h3>로그인</h3>
		<form class="login_info" action="${pageContext.request.contextPath}/users/login" method="post" onsubmit="return checkIfValid()">
			<input class="input_text" type="text" name="user_id" placeholder="아이디" value="${user_id}" onblur="checkUser_id()">
			<div class="err_msg" id="user_idErrMsg"></div>
			<input class="input_text" type="password" name="password" placeholder="비밀번호" value="${requestScope.password}" onblur="checkPassword()">
			<div class="err_msg" id="passwordErrMsg">${err}</div>
			<div class="login_check">
				<input type="checkbox" name="auto" id="auto" <c:if test="${!(empty auto)}">checked</c:if>><label for="auto">로그인 유지하기</label>
				<input type="checkbox" name="save" id="save" <c:if test="${!(empty save)}">checked</c:if>><label for="save">아이디 저장</label>
			</div>
			<input class="login_btn" type="submit" value="로그인">
			<input class="login_btn kakao_login" type="button" value="카카오 로그인" onclick="kakaoLogin()">
		</form>
		<div class="account_area">
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}/users/find/id">아이디 찾기</a>							
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/users/find/pw">비밀번호 찾기</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/users/signup">회원가입</a>
				</li>
			</ul>
		</div>
	</div>
</main>
<jsp:include page="/footer.jsp"/>
<script type="text/javascript">
	const user_id = document.getElementsByName("user_id")[0];
	const password = document.getElementsByName("password")[0];
	const user_idErrMsg = document.getElementById("user_idErrMsg");
	const passwordErrMsg = document.getElementById("passwordErrMsg");
	
	// 전체 유효성 검사	
	function checkIfValid() {
		checkUser_id();
		checkPassword();
		if (user_idErrMsg.innerHTML !== "") {
			return false;
		}
		if (passwordErrMsg.innerHTML !== "") {
			return false;
		}
		return true;
	}
	
	function checkUser_id() {
		user_idErrMsg.innerHTML = "";
		if (user_id.value === '') {
			user_idErrMsg.innerHTML = "아이디를 입력해주세요.";
		}
	}
	
	function checkPassword() {
		passwordErrMsg.innerHTML = "";
		if (password.value === '') {
			passwordErrMsg.innerHTML = "비밀번호를 입력해주세요.";
		}
	}

	function kakaoLogin() {
		location.href = "https://kauth.kakao.com/oauth/authorize?client_id=19456d5f13cb8a11d9fd01e85a8e0c2a" +
		"&redirect_uri=http://localhost:8081${pageContext.request.contextPath}/users/kakao/login" + "&response_type=code";
	}
</script>
</body>
</html>