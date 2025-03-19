<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="info_title">
	<h1>회원 정보</h1>
</div>
<form class="user_info" action="${pageContext.request.contextPath}/mypage/account/update" method="post" onsubmit="">
	<div class="input_frame">
		<div class="input_box">
			<span class="input_desc">아이디</span>
			<span class="output_text">${user.user_id}</span></div>
		<div class="input_box">
			<span class="input_desc">비밀번호</span>
			<input class="input_text" type="password" name="password" placeholder="새 비밀번호를 입력해주세요.">
			<div class="err_msg passwordErrMsg"></div>
		</div>
		<div class="input_box">
			<span class="input_desc">새 비밀번호</span>
			<input class="input_text" type="password" name="cpassword" placeholder="새 비밀번호를 확인해주세요.">
			<div class="err_msg cpasswordErrMsg"></div>
		</div>
	</div>
	<div class="input_frame">
		<div class="input_box">
			<span class="input_desc">이름</span>
			<input class="input_text" type="text" name="name" value="${user.name}">
			<div class="err_msg nameErrMsg"></div>
		</div>
		<div class="input_box">
			<span class="input_desc">이메일</span>
			<div class="input_email">
				<input class="input_text" type="text" name="email" value="${user.email}"><a class="input_btn" href="javascript:verifyEmail();">인증</a>
			</div>
			<div class="err_msg emailErrMsg"></div>
		</div>
		<div class="input_box" hidden>
			<span class="input_desc">인증번호</span>
			<input class="input_text" type="text" name="verCode" placeholder="인증번호를 입력해주세요.">
			<div class="err_msg verCodeErrMsg"></div>
		</div>
		<div class="input_box">
			<span class="input_desc">전화번호</span>
			<input class="input_text" type="text" name="phone" value="${user.phone}">
			<div class="err_msg phoneErrMsg"></div>
		</div>
	</div>
	<div class="input_frame">
		<div class="input_box">
			<span class="input_desc">가입형태</span>
			<span class="output_text">
				<c:choose>
					<c:when test="${user.social == 'NORMAL'}">회원가입</c:when>
					<c:when test="${user.social == 'KAKAO'}">소셜(카카오)</c:when>
				</c:choose>
			</span>
		</div>
		<div class="input_box">
			<span class="input_desc">권한</span>
			<span class="output_text">
				<c:choose>
					<c:when test="${user.role == 'USER'}">일반회원</c:when>
					<c:when test="${user.role == 'SKI'}">관리자(스키장)</c:when>
					<c:when test="${user.role == 'RESORT'}">관리자(리조트)</c:when>
					<c:when test="${user.role == 'RENTAL'}">관리자(렌탈샵)</c:when>
					<c:when test="${user.role == 'ADMIN'}">관리자(사이트)</c:when>
				</c:choose>
			</span>
		</div>
	</div>
	<div class="login_btn_box">
		<input class="login_btn" type="submit" value="저장">
	</div>
</form>

<script>
	const password = document.getElementsByName("password")[0];
	const cpassword = document.getElementsByName("cpassword")[0];
	const email = document.getElementsByName("email")[0];
	const verCode = document.getElementsByName("verCode")[0];
	const phone = document.getElementsByName("phone")[0];
	const name = document.getElementsByName("name")[0];
	
	const passwordErrMsg = document.getElementsByClassName("passwordErrMsg")[0];
	const cpasswordErrMsg = document.getElementsByClassName("cpasswordErrMsg")[0];
	const emailErrMsg = document.getElementsByClassName("emailErrMsg")[0];
	const verCodeErrMsg = document.getElementsByClassName("verCodeErrMsg")[0];
	const phoneErrMsg = document.getElementsByClassName("phoneErrMsg")[0];
	const nameErrMsg = document.getElementsByClassName("nameErrMsg")[0];

	// 전체 유효성 검사	
	function checkIfValid() {
		checkPassword();
		checkCpassword();
		checkEmail();
		checkVerCode();
		checkPhone();
		checkName();
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
		
		// 이메일 인증 체크
		if (verCode.type === 'hidden') {
			emailErrMsg.innerHTML = "이메일을 인증해주세요.";
		}
	}

	function checkVerCode() {
		verCodeErrMsg.innerHTML = "";

		// 인증 번호 체크
		if (verCode.value !== verificationCode) {
			verCodeErrMsg.innerHTML = "인증번호가 일치하지 않습니다.";
		}
	}
	
	function checkPhone() {
		phoneErrMsg.innerHTML = "";

		// 공백 체크
		if (phone.value === '') {
			phoneErrMsg.innerHTML = "전화번호를 입력해주세요.";
		}

		// 입력값 체크
		for (let i = 0; i < phone.value.length; i++) {
			const c = phone.value.charAt(i);
			if (c < '0' || c > '9') {
				phoneErrMsg.innerHTML = "숫자만 입력해주세요.";
				return;
			}
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
		checkEmail();
		emailErrMsg.innerHTML = (emailErrMsg.innerHTML === "이메일을 인증해주세요.") ? "" : emailErrMsg.innerHTML;
		if (emailErrMsg.innerHTML !== "") {
			return;
		}
		const verify_btn = document.getElementsByClassName("input_btn");
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