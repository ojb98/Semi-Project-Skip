<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage/layout.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage.css">
<style type="text/css">
	.${content} {
		text-decoration: underline;
	}
	
	.mypage {
		display: flex;
		flex-direction: row;
	}

	.mypage_nav_container {
		width: 200px;
	}

	.content_container {
		width: 100%;
	}
	
	.reserv_tab_container {
		height: 75px;
	}
	
	.reserv_tab_container ul {
		display: flex;
		flex-direction: row;
		height: 100%;
		gap: 30px;
	}
	
	.reserv_title {
		border-top: 1px solid black;
		border-bottom: 1px solid #eaeaea;
		height: 60px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.reserv_title a {
		
	}
	
	.reserv_title span {

	}
	
	.reserv_content {
		height: 140px;
		display: block;
	}
	
	.reserv_content table {
		height: 100%;	
	}

	.reserv_content tbody td > div:not(.reserv_items) {
		display: flex;
		flex-direction: row;
		height: 100%;
		justify-content: center;
		align-items: center;
	}
	
	.reserv_items {
		height: 100%;
	}
	
	.info_title h1 {
		font-size: 27px;
		font-weight: 500;
		margin-bottom: 30px;
		color: rgb(100, 100, 100);
	}
	
	.info_title {
		border-bottom: 1px solid black;
	}
	
	.user_info .input_text {
		width: 300px;
		border: 1px solid #dadada;
		padding-top: 14px;
		padding-bottom: 14px;
		border-radius: 5px;
		box-sizing: border-box;
	}
	
	.user_info .input_text:focus {
		border-color: #5399f5;
		box-shadow: 0 0 8px rgba(83, 153, 245, 0.6);
		transition: box-shadow 0.2s ease-in-out;
	}
	
	.user_info .err_box {
		width: 60%;
		display: flex;
		justify-content: flex-end;
	}
	
	.user_info .err_msg {
		text-align: left;
	}
	
	.user_info .input_email {
		position: relative;
	}
	
	.user_info .input_email input {
		width: 274px;
	}
	
	.user_info .input_btn {
		position: absolute;
		font-size: 0.9em;
		top: 15px;
		right: 10px;
		width: 30px;
  		color:rgb(100, 100, 100);
	}
	
	.input_frame {
		border-bottom: 1px solid #eaeaea;
		padding-top: 20px;
		padding-bottom: 50px;
	}
	
	.input_box {
		width: 60%;
		margin-top: 30px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.login_btn_box {
		display: flex;
		justify-content: center;
	}
	
	.input_box .output_text {
		font-size: 0.9em;
	}
	
	.input_desc {
		font-size: 0.9em;
		font-weight: 600;
	}
	
	.input_box span {
		width: 306px;
		text-align: left;
	}
	
	.user_info .login_btn {
		margin-top: 50px;
		justify-content: center;
		width: 200px;
	}
</style>
</head>
<body>
<!-- header -->
<jsp:include page="/header.jsp" />

<main>
	<div class="mypage main_container">
		<!-- nav -->
		<jsp:include page="/mypage/nav.jsp" />
		
		<!-- content -->
		<div class="content_container">
			<jsp:include page="/mypage/${content}.jsp" />
		</div>
	</div>	
</main>

<!-- footer -->
<jsp:include page="/footer.jsp" />
</body>
</html>