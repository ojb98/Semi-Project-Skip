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
	<input type="text" name="user_id" placeholder="아이디" value="${requestScope.user_id}" onblur="checkUser_id()">
	<div id="user_idErrMsg"></div>
	<input type="password" name="password" placeholder="비밀번호" value="${requestScope.password}" onblur="checkPassword()">
	<div id="passwordErrMsg"></div>
	<input type="password" name="cpassword" placeholder="비밀번호 확인" onkeyup="checkCpassword()">
	<div id="cpasswordErrMsg"></div>
	<input type="text" name="email" placeholder="이메일" value="${requestScope.email}" onblur="checkEmail()"><input type="button" value="인증" onclick="verifyEmail()">
	<div id="emailErrMsg"></div>
	<input type="hidden" name="verCode" placeholder="인증번호">
	<div id="verCodeErrMsg" style="display: none;"></div>
	<input type="text" name="phone" placeholder="전화번호" value="${requestScope.phone}" onblur="checkPhone()">
	<div id="phoneErrMsg"></div>
	<input type="text" name="name" placeholder="이름" value="${requestScope.name}" onblur="checkName()">
	<div id="nameErrMsg"></div>
	<input type="submit" value="가입하기">
</form>
<script>
	const user_id = document.getElementsByName("user_id")[0];
	const password = document.getElementsByName("password")[0];
	const cpassword = document.getElementsByName("cpassword")[0];
	const email = document.getElementsByName("email")[0];
	const verCode = document.getElementsByName("verCode")[0];
	const phone = document.getElementsByName("phone")[0];
	const name = document.getElementsByName("name")[0];
	
	const user_idErrMsg = document.getElementById("user_idErrMsg");
	const passwordErrMsg = document.getElementById("passwordErrMsg");
	const cpasswordErrMsg = document.getElementById("cpasswordErrMsg");
	const emailErrMsg = document.getElementById("emailErrMsg");
	const verCodeErrMsg = document.getElementById("verCodeErrMsg");
	const phoneErrMsg = document.getElementById("phoneErrMsg");
	const nameErrMsg = document.getElementById("nameErrMsg");
	
	let verificationCode;

	// 전체 유효성 검사	
	function checkIfValid() {
		checkUser_id();
		checkPassword();
		checkCpassword();
		checkEmail();
		checkVerCode();
		checkPhone();
		checkName();
		if (user_idErrMsg.innerHTML !== "") {
			return false;
		}
		if (passwordErrMsg.innerHTML !== "") {
			return false;
		}
		if (cpasswordErrMsg.innerHTML !== "") {
			return false;
		}
		if (emailErrMsg.innerHTML !== "") {
			return false;
		}
		if (verCodeErrMsg.innerHTML !== "") {
			return false;
		}
		if (phoneErrMsg.innerHTML !== "") {
			return false;
		}
		if (nameErrMsg.innerHTML !== "") {
			return false;
		}
		return true;
	}
	
	function checkUser_id() {
		user_idErrMsg.innerHTML = "";

		// 길이 체크
		if (user_id.value.length < 2) {
			user_idErrMsg.innerHTML = "2자 이상 입력해주세요.";
			return;
		}

		// 영문 혹은 숫자만 입력
		for (let i = 0; i < user_id.value.length; i++) {
			const c = user_id.value.charAt(i);
			if (((c < 'A' || c > 'Z') && (c < 'a' || c > 'z')) && (c < '0' || c > '9')) {
				user_idErrMsg.innerHTML = "영문 또는 숫자만 입력해주세요.";
				return;
			}
		}

		// 중복성 체크
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4 && xhr.status === 200) {
				const json = JSON.parse(xhr.responseText);
				if (json.exists) {
					user_idErrMsg.innerHTML = "중복된 아이디입니다.";
				}
			}
		};
		xhr.open('get', "${pageContext.request.contextPath}/users/idCheck?user_id=" + user_id.value);
		xhr.send();
	}
	
	function checkPassword() {
		passwordErrMsg.innerHTML = "";

		// 길이 체크
		if (password.value.length < 8) {
			passwordErrMsg.innerHTML = "8자 이상 입력해주세요.";
			return;
		}

		// 영문과 숫자 조합 입력
		let a = false;
		let n = false;
		for (let i = 0; i < password.value.length; i++) {
			const c = password.value.charAt(i);
			if (c >= '0' && c <= '9') {
				n = true;
			} else if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) {
				a = true;
			}
		}
		if (!(a && n)) {
			passwordErrMsg.innerHTML = "영문과 숫자를 조합해주세요.";
		}
	}
	
	function checkCpassword() {
		cpasswordErrMsg.innerHTML = "";

		// 동일 여부 체크
		if (password.value !== cpassword.value) {
			cpasswordErrMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
		}
	}
	
	function checkEmail() {
		emailErrMsg.innerHTML = "";

		// 이메일 형식 체크
		const a = email.value.indexOf("@");
		const p = email.value.indexOf(".");
		if (a < 1 || p < a + 2 || p === email.value.length - 1) {
			emailErrMsg.innerHTML = "이메일 형식을 맞춰주세요.";
		}
	}

	function checkVerCode() {
		verCodeErrMsg.innerHTML = "";

		// 인증 번호 체크
		
	}
	
	function checkPhone() {
		phoneErrMsg.innerHTML = "";

		// 공백 체크
		if (phone.value === '') {
			phoneErrMsg.innerHTML = "전화번호를 입력해주세요.";
		}
	}
	
	function checkName() {
		nameErrMsg.innerHTML = "";

		// 공백 체크
		if (name.value === '') {
			nameErrMsg.innerHTML = "이름을 입력해주세요.";
		}
	}
	
	function verifyEmail() {
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4 && xhr.status === 200) {
				const json = JSON.parse(xhr.responseText);
				verCode.type = "text";
				verCodeErrMsg.style.display = "block";
				verificationCode = json.verificationCode;
			}
		};
		xhr.open('get', "${pageContext.request.contextPath}/users/email/verify?email=" + email.value);
		xhr.send();
	}
</script>
</body>
</html>