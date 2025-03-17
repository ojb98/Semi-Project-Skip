<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage.css">
</head>
<body>
<main>
	<div class="login_container">
		<a href="${pageContext.request.contextPath}/index.jsp"><h2 class="logo">SKI:P</h2></a>
		<div class="tab_menu">
			<ul>
				<li class="tab_item">
					<a class="tab_user" href="javascript:clickUser()">일반회원</a>
				</li>
				<li class="tab_item">
					<a class="tab_manager" href="javascript:clickManager()">관리자</a>
				</li>
			</ul>
		</div>

		<div class="tab_con" id="user_login">
			<h3>회원 정보를 입력해주세요.</h3>
			<form class="login_info" action="${pageContext.request.contextPath}/users/signup" method="post" onsubmit="return checkIfValid(0)">
				<input class="input_text" type="text" name="user_id" placeholder="아이디" value="${requestScope.user_id}" onblur="checkUser_id(0)">
				<div class="err_msg user_idErrMsg"></div>
				<input class="input_text" type="password" name="password" placeholder="비밀번호" value="${requestScope.password}" onblur="checkPassword(0)">
				<div class="err_msg passwordErrMsg"></div>
				<input class="input_text" type="password" name="cpassword" placeholder="비밀번호 확인" onkeyup="checkCpassword(0)">
				<div class="err_msg cpasswordErrMsg"></div>
				<div class="input_email">
					<input class="input_text" type="text" name="email" placeholder="이메일" value="${requestScope.email}" onblur="checkEmail(0)"><a class="input_btn" href="javascript:verifyEmail(0);">인증</a>
				</div>
				<div class="err_msg emailErrMsg"></div>
				<input class="input_text" type="hidden" name="verCode" placeholder="인증번호" onkeyup="checkVerCode(0)">
				<div class="err_msg verCodeErrMsg" style="display: none;"></div>
				<input class="input_text" type="text" name="phone" placeholder="'-' 없이 휴대폰 번호 입력" value="${requestScope.phone}" onblur="checkPhone(0)">
				<div class="err_msg phoneErrMsg"></div>
				<input class="input_text" type="text" name="name" placeholder="이름" value="${requestScope.name}" onblur="checkName(0)">
				<div class="err_msg nameErrMsg"></div>
				<input class="login_btn" type="submit" value="가입하기">
			</form>
		</div>

		<div class="tab_con" id="manager_login">
			<h3>관리자 정보를 입력해주세요.</h3>
			<form class="login_info" action="${pageContext.request.contextPath}/users/managerSignup" method="post" onsubmit="return checkIfValid(1)">
				<div class="input_radio">
					<input type="radio" id="ski" name="category" value="SKI" checked><label for="ski">스키장</label>
					<input type="radio" id="rental" name="category" value="RENTAL"><label for="rental">렌탈샵</label>
					<input type="radio" id="resort" name="category" value="RESORT"><label for="resort">리조트</label>
				</div>
				<input class="input_text" type="text" name="user_id" placeholder="아이디" value="${requestScope.user_id}" onblur="checkUser_id(1)">
				<div class="err_msg user_idErrMsg"></div>
				<input class="input_text" type="password" name="password" placeholder="비밀번호" value="${requestScope.password}" onblur="checkPassword(1)">
				<div class="err_msg passwordErrMsg"></div>
				<input class="input_text" type="password" name="cpassword" placeholder="비밀번호 확인" onkeyup="checkCpassword(1)">
				<div class="err_msg cpasswordErrMsg"></div>
				<div class="input_email">
					<input class="input_text" type="text" name="email" placeholder="이메일" value="${requestScope.email}" onblur="checkEmail(1)"><a class="input_btn" href="javascript:verifyEmail(1);">인증</a>
				</div>
				<div class="err_msg emailErrMsg"></div>
				<input class="input_text" type="hidden" name="verCode" placeholder="인증번호" onkeyup="checkVerCode(1)">
				<div class="err_msg verCodeErrMsg" style="display: none;"></div>
				<input class="input_text" type="text" name="phone" placeholder="'-' 없이 휴대폰 번호 입력" value="${requestScope.phone}" onblur="checkPhone(1)">
				<div class="err_msg phoneErrMsg"></div>
				<input class="input_text" type="text" name="name" placeholder="이름" value="${requestScope.name}" onblur="checkName(1)">
				<div class="err_msg nameErrMsg"></div>
				<input class="login_btn" type="submit" value="가입하기">
			</form>
		</div>
	</div>
</main>
<script>
	// 로그인 css
	const tab_items = document.getElementsByClassName("tab_item");
	document.getElementsByClassName("tab_user")[0].click();

	function changeTab(to) {
		for (let i = 0; i < tab_items.length; i++) {
			if (i === to) {
				tab_items[i].style = "color: rgb(50, 50, 50); border-top: 2px solid #5399f5; border-left: 2px solid #5399f5; border-right: 2px solid #5399f5;";
			} else {
				tab_items[i].style = "color: rgb(150, 150, 150); border-bottom: 2px solid #5399f5;";
			}
		}
	}
	
	// 회원 로그인 css
	function clickUser() {
		location.href = "#user_login";
		changeTab(0);
	}

	// 관리자 로그인 css
	function clickManager() {
		location.href = "#manager_login";
		changeTab(1);
	}

	const user_id = document.getElementsByName("user_id");
	const password = document.getElementsByName("password");
	const cpassword = document.getElementsByName("cpassword");
	const email = document.getElementsByName("email");
	const verCode = document.getElementsByName("verCode");
	const phone = document.getElementsByName("phone");
	const name = document.getElementsByName("name");
	
	const user_idErrMsg = document.getElementsByClassName("user_idErrMsg");
	const passwordErrMsg = document.getElementsByClassName("passwordErrMsg");
	const cpasswordErrMsg = document.getElementsByClassName("cpasswordErrMsg");
	const emailErrMsg = document.getElementsByClassName("emailErrMsg");
	const verCodeErrMsg = document.getElementsByClassName("verCodeErrMsg");
	const phoneErrMsg = document.getElementsByClassName("phoneErrMsg");
	const nameErrMsg = document.getElementsByClassName("nameErrMsg");
	
	let verificationCode;

	// 전체 유효성 검사	
	function checkIfValid(k) {
		checkUser_id(k);
		checkPassword(k);
		checkCpassword(k);
		checkEmail(k);
		checkVerCode(k);
		checkPhone(k);
		checkName(k);
		if (user_idErrMsg[k].innerHTML !== "") {
			return false;
		}
		if (passwordErrMsg[k].innerHTML !== "") {
			return false;
		}
		if (cpasswordErrMsg[k].innerHTML !== "") {
			return false;
		}
		if (emailErrMsg[k].innerHTML !== "") {
			return false;
		}
		if (verCodeErrMsg[k].innerHTML !== "") {
			return false;
		}
		if (phoneErrMsg[k].innerHTML !== "") {
			return false;
		}
		if (nameErrMsg[k].innerHTML !== "") {
			return false;
		}
		return true;
	}
	
	function checkUser_id(k) {
		user_idErrMsg[k].innerHTML = "";

		// 길이 체크
		if (user_id[k].value.length < 2) {
			user_idErrMsg[k].innerHTML = "2자 이상 입력해주세요.";
			return;
		}

		// 영문 혹은 숫자만 입력
		for (let i = 0; i < user_id[k].value.length; i++) {
			const c = user_id[k].value.charAt(i);
			if (((c < 'A' || c > 'Z') && (c < 'a' || c > 'z')) && (c < '0' || c > '9')) {
				user_idErrMsg[k].innerHTML = "영문 또는 숫자만 입력해주세요.";
				return;
			}
		}

		// 중복성 체크
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4 && xhr.status === 200) {
				const json = JSON.parse(xhr.responseText);
				if (json.exists) {
					user_idErrMsg[k].innerHTML = "중복된 아이디입니다.";
				}
			}
		};
		xhr.open('get', "${pageContext.request.contextPath}/users/idCheck?user_id=" + user_id[k].value);
		xhr.send();
	}
	
	function checkPassword(k) {
		passwordErrMsg[k].innerHTML = "";

		// 길이 체크
		if (password[k].value.length < 8) {
			passwordErrMsg[k].innerHTML = "8자 이상 입력해주세요.";
			return;
		}

		// 영문과 숫자 조합 입력
		let a = false;
		let n = false;
		for (let i = 0; i < password[k].value.length; i++) {
			const c = password[k].value.charAt(i);
			if (c >= '0' && c <= '9') {
				n = true;
			} else if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) {
				a = true;
			}
		}
		if (!(a && n)) {
			passwordErrMsg[k].innerHTML = "영문과 숫자를 조합해주세요.";
		}
	}
	
	function checkCpassword(k) {
		cpasswordErrMsg[k].innerHTML = "";

		// 동일 여부 체크
		if (password[k].value !== cpassword[k].value) {
			cpasswordErrMsg[k].innerHTML = "비밀번호가 일치하지 않습니다.";
		}
	}
	
	function checkEmail(k) {
		emailErrMsg[k].innerHTML = "";

		// 이메일 형식 체크
		const a = email[k].value.indexOf("@");
		const p = email[k].value.indexOf(".");
		if (a < 1 || p < a + 2 || p === email[k].value.length - 1) {
			emailErrMsg[k].innerHTML = "이메일 형식을 맞춰주세요.";
			return;
		}
		
		// 이메일 인증 체크
		if (verCode[k].type === 'hidden') {
			emailErrMsg[k].innerHTML = "이메일을 인증해주세요.";
		}
	}

	function checkVerCode(k) {
		verCodeErrMsg[k].innerHTML = "";

		// 인증 번호 체크
		if (verCode[k].value !== verificationCode) {
			verCodeErrMsg[k].innerHTML = "인증번호가 일치하지 않습니다.";
		}
	}
	
	function checkPhone(k) {
		phoneErrMsg[k].innerHTML = "";

		// 공백 체크
		if (phone[k].value === '') {
			phoneErrMsg[k].innerHTML = "전화번호를 입력해주세요.";
		}

		// 입력값 체크
		for (let i = 0; i < phone[k].value.length; i++) {
			const c = phone[k].value.charAt(i);
			if (c < '0' || c > '9') {
				phoneErrMsg[k].innerHTML = "숫자만 입력해주세요.";
				return;
			}
		}
	}
	
	function checkName(k) {
		nameErrMsg[k].innerHTML = "";

		// 공백 체크
		if (name[k].value === '') {
			nameErrMsg[k].innerHTML = "이름을 입력해주세요.";
		}
	}
	
	function verifyEmail(k) {
		checkEmail(k);
		emailErrMsg[k].innerHTML = (emailErrMsg[k].innerHTML === "이메일을 인증해주세요.") ? "" : emailErrMsg[k].innerHTML;
		if (emailErrMsg[k].innerHTML !== "") {
			return;
		}
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4 && xhr.status === 200) {
				const json = JSON.parse(xhr.responseText);
				verCode[k].type = "text";
				verCodeErrMsg[k].style.display = "block";
				verificationCode = json.verificationCode;
			}
		};
		xhr.open('get', "${pageContext.request.contextPath}/users/email/verify?email=" + email[k].value);
		xhr.send();
	}
</script>
</body>
</html>