<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find/findIdOrPw.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage.css">
<style>
    .loader {
      margin: auto;
      border: 4px solid rgba(0, 0, 0, 0);
      border-radius: 50%;
      border-top: 4px solid #ffffff;
      width: 30px;
      height: 30px;
      -webkit-animation: spin 2s linear infinite;
      animation: spin 2s linear infinite;
    }
    
    /* Safari */
    @-webkit-keyframes spin {
      0% { -webkit-transform: rotate(0deg); }
      100% { -webkit-transform: rotate(360deg); }
    }
    
    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
</style>
</head>
<body>
<jsp:include page="/header.jsp"/>
<main>
    <div class="login_container">
    	<a href="${pageContext.request.contextPath}/index.jsp"><h2 class="logo">SKI:P</h2></a>
		<div class="tab_menu">
			<ul>
				<li class="tab_item">
					<a class="tab_id" href="javascript:clickId()">아이디</a>
				</li>
				<li class="tab_item">
					<a class="tab_pw" href="javascript:clickPw()">비밀번호</a>
				</li>
			</ul>
		</div>
    
		<!-- 아이디 찾기 탭 -->
    	<div class="tab_con" id="id_find">
			<h3>아이디 찾기</h3>
	        <div class="login_info">
	            <input class="input_text" type="text" name="email" placeholder="이메일">
	            <div class="err_msg"></div>
	            <button class="login_btn" type="button" onclick="findId()">찾기</button>
	        </div>
	        
			<!-- 아이디 찾기 결과 -->
	        <div class="find_result">
	        	<hr>
				<h4>이메일로 아이디를 전송했습니다.</h4>
				<div class="email_box"></div>
				<input class="login_btn" type="button" value="로그인">
				<div class="email_retry">이메일을 못 받으셨나요? <a href="javascript:findId()">재전송</a></div>
			</div>
		</div>
		
		<!-- 비밀번호 찾기 탭 -->
		<div class="tab_con" id="pw_find">
			<h3>비밀번호 찾기</h3>
			<div class="login_info">
				<input class="input_text" type="text" name="email" placeholder="이메일">
				<input class="input_text" type="text" name="user_id" placeholder="아이디">
				<div class="err_msg"></div>
				<button class="login_btn" onclick="findPw()">찾기</button>
			</div>

			<!-- 비밀번호 찾기 결과 -->
			<div class="find_result">
				<hr>
				<h4>이메일로 임시 비밀번호를 전송했습니다.</h4>
				<div class="email_box"></div>
				<input class="login_btn" type="button" value="로그인">
				<div class="email_retry">이메일을 못 받으셨나요? <a href="javascript:findPw()">재전송</a></div>
			</div>
		</div>
    </div>
</main>
<jsp:include page="/footer.jsp"/>
<script>
	const tab_items = document.getElementsByClassName("tab_item");
	
	if (location.hash === "#id_find") {
		document.getElementsByClassName("tab_id")[0].click();
	} else {
		document.getElementsByClassName("tab_pw")[0].click();
	}

	const login_infos = document.getElementsByClassName("login_info");
	const find_results = document.getElementsByClassName("find_result");

	const emails = document.getElementsByName("email");
	const user_id = document.getElementsByName("user_id")[0];
	
	const login_btn = document.getElementsByClassName("login_btn");
	login_btn[1].addEventListener('click', () => {
		location.href = "${pageContext.request.contextPath}/users/login";
	});
	login_btn[3].addEventListener('click', () => {
		location.href = "${pageContext.request.contextPath}/users/login";
	});
	
	const fail_msg = "가입된 계정이 없습니다!";
	
	function changeTab(to) {
		for (let i = 0; i < tab_items.length; i++) {
			if (i === to) {
				tab_items[i].style = "color: rgb(50, 50, 50); border-top: 2px solid #5399f5; border-left: 2px solid #5399f5; border-right: 2px solid #5399f5;";
			} else {
				tab_items[i].style = "color: rgb(150, 150, 150); border-bottom: 2px solid #5399f5;";
			}
		}
	}
	
	function clickId() {
		location.href = "#id_find";
		changeTab(0);
	}
	
	function clickPw() {
		location.href = "#pw_find";
		changeTab(1);
	}
	
	function findId() {
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4 && xhr.status === 200) {
				login_btn[0].onclick = findId;
				login_btn[0].innerHTML = "찾기";
				const json = JSON.parse(xhr.responseText);
				if (json.exists) {
					document.getElementsByClassName("email_box")[0].innerHTML = emails[0].value;
					login_infos[0].style = "display: none";
					find_results[0].style = "display: block";
				} else {
					document.getElementsByClassName("err_msg")[0].innerHTML = fail_msg;
				}
			}
		};
		// 버튼 비활성화
		login_btn[0].onclick = null;
		// 스피너
		login_btn[0].innerHTML = "<div class=\"loader\"></div>";
		let params = "email=" + emails[0].value;
		xhr.open('post', "${pageContext.request.contextPath}/users/find/id");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(params);
	}
	
	function findPw(email_idx, user_id_idx) {
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4 && xhr.status === 200) {
				login_btn[2].onclick = findPw;
				login_btn[2].innerHTML = "찾기";
				const json = JSON.parse(xhr.responseText);
				if (json.exists) {
					document.getElementsByClassName("email_box")[1].innerHTML = emails[1].value;
					login_infos[1].style = "display: none";
					find_results[1].style = "display: block";
				} else {
					document.getElementsByClassName("err_msg")[1].innerHTML = fail_msg;
				}
			}
		};
		login_btn[2].onclick = null;
		login_btn[2].innerHTML = "<div class=\"loader\"></div>";
		let params = "email=" + emails[1].value + "&user_id=" + user_id.value;
		xhr.open('post', "${pageContext.request.contextPath}/users/find/pw");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(params);
	}
</script>
</body>
</html>