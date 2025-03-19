<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="login_container">
	<form class="login_info" action="${pageContext.request.contextPath}/mypage/account/delete" method="post" onsubmit="return confirm('정말로 탈퇴하시겠습니까?')">
		<input type="password" class="input_text" name="password" placeholder="비밀번호를 입력하세요.">
		<div class="err_msg">${err}</div>
		<input type="submit" class="login_btn" value="탈퇴">
	</form>
</div>