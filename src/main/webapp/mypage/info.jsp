<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="nav_title">
	<h1>회원 정보</h1>
</div>
<form class="user_info" action="${pageContext.request.contextPath}/mypage/info" method="post" onsubmit="return checkIfValid()">
	<div class="input_frame">
		<div class="input_box">
			<span class="input_desc">아이디</span>
			<span class="output_text">${user.user_id}</span></div>
		<div class="input_box">
			<span class="input_desc">비밀번호</span>
			<input class="input_text" type="password" name="password" placeholder="새 비밀번호를 입력해주세요." onblur="checkPassword()">
		</div>
		<div class="err_box">
			<span class="err_msg passwordErrMsg"></span>
		</div>
		<div class="input_box">
			<span class="input_desc">새 비밀번호</span>
			<input class="input_text" type="password" name="cpassword" placeholder="새 비밀번호를 확인해주세요." onkeyup="checkCpassword()">
		</div>
		<div class="err_box">
			<span class="err_msg cpasswordErrMsg"></span>
		</div>
	</div>
	<div class="input_frame">
		<div class="input_box">
			<span class="input_desc">이메일</span>
			<span class="output_text">${user.email}</span>
		</div>
		<div class="input_box">
			<span class="input_desc">이름</span>
			<input class="input_text" type="text" name="name" value="${user.name}" onblur="checkName()">
		</div>
		<div class="err_box">
			<span class="err_msg nameErrMsg"></span>
		</div>
		<div class="input_box">
			<span class="input_desc">전화번호</span>
			<input class="input_text" type="text" name="phone" value="${user.phone}" onblur="checkPhone()">
		</div>
		<div class="err_box">
			<span class="err_msg phoneErrMsg"></span>
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
	const phone = document.getElementsByName("phone")[0];
	const name = document.getElementsByName("name")[0];
	
	const passwordErrMsg = document.getElementsByClassName("passwordErrMsg")[0];
	const cpasswordErrMsg = document.getElementsByClassName("cpasswordErrMsg")[0];
	const phoneErrMsg = document.getElementsByClassName("phoneErrMsg")[0];
	const nameErrMsg = document.getElementsByClassName("nameErrMsg")[0];
	
	// 전체 유효성 검사	
	function checkIfValid() {
		checkPassword();
		checkCpassword();
		checkPhone();
		checkName();
		if (passwordErrMsg.innerHTML !== "") {
			return false;
		}
		if (cpasswordErrMsg.innerHTML !== "") {
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
</script>