<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage/layout.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage.css">
<style type="text/css">	
	.mypage {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
	}

	.mypage .nav_container {
		margin-top: 80px;
	}
	
	.nav_container li:first-child input {
		border-top-left-radius: 16px;
	}
	
	.nav_container li:last-child input {
		border-bottom-left-radius: 16px;
	}
	
	.nav_container input {
		background-color: white;
		height: 70px;
		width: 160px;
		font-size: 16px;
		color: #444444;
		border: 1px solid #eaeaea;
	}
	
	.nav_container input:hover {
		cursor: pointer;
		transition: 0.5s;
		background-color: #f8f8f8;
	}
	
	.nav_container .${content} {
		font-weight: 700;
		background-color: #5399f5;
		cursor: pointer;
		transition: 0.5s;
		color: white;
	}

	.nav_container .${content}:hover {
		font-weight: 700;
		background-color: #5399f5;
		cursor: pointer;
		transition: 0.5s;
		color: white;
	}

	.content_container {
		width: 800px;
		margin-right: 60px;
	}
	
	.tab_container {
		margin-top: 20px;
		margin-bottom: 60px;
		display: flex;
		justify-content: space-between;
	}
	
	.tab_container ul {
		display: flex;
		flex-direction: row;
		width: 50%;
		height: 100%;
		gap: 20px;
	}

	.tab_container .booking_tab {
		width: 80px;
		height: 40px;
		background-color: white;
		color: #444444;
		border: 1px solid #5399f5;
		border-radius: 16px;
		cursor: pointer;
	}

	.tab_container .booking_tab:hover {
		background-color: #e8f2ff;
	}

	.tab_container .${content} {
		background-color: #5399f5;
		color: white;
		cursor: pointer;
	}

	.tab_container .${content}:hover {
		background-color: #5399f5;
		color: white;
		cursor: pointer;
	}

	.tab_container .search_box input {
		height: 40px;
		border-radius: 10px;
	}

	.tab_container .search_box input:first-child {
		border: 1px solid #5399f5;
		width: 200px;
		margin-right: 10px;
	}

	.tab_container .search_box input:first-child:focus {
		border-color: #5399f5;
		box-shadow: 0 0 8px rgba(83, 153, 245, 0.6);
		transition: box-shadow 0.2s ease-in-out;
	}

	.tab_container .search_box input:last-child {
		background-color: #5399f5;
		color: white;
		width: 60px;
		cursor: pointer;
	}

	.tab_container .search_box input:last-child:hover {
		background-color: #2c7fec;
	}
	
	.reserv_container {
		border: 1px solid rgb(240, 240, 240);
		border-radius: 10px;
		box-shadow: rgba(0, 0, 0, 0.08) 0px 2px 4px 0px,
			rgba(0, 0, 0, 0.16) 0px 0px 1px 0px;
		margin-bottom: 60px;
	}
	
	.reserv_title {
		height: 50px;
		display: flex;
		border-bottom: 1px solid #eaeaea;
		padding-left: 20px;
		padding-right: 20px;
		justify-content: space-between;
		align-items: center;
	}
	.reserv_title span {
		font-size: 0.9em;
		font-weight: 800;
	}
	
	.reserv_content {
		height: 160px;
		display: flex;
	}
	
	.reserv_place {
		display: flex;
		justify-content: center;
		width: 20%;
		align-items: center;
	}
	
	.reserv_place a {
		font-size: 1.1em;
		font-weight: 500;
	}

	.reserv_place a:hover {
		text-decoration: underline;
		text-underline-position: under;
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
	
	.reserv_stat {
		padding: 10px;
		width: 55%;
	}
	
	.reserv_items {
		height: 110px;
		border-bottom: 1px solid gray;
		margin-bottom:5px;
		padding-bottom: 10px;
		overflow-y: auto;
	}
	
	.reserv_item {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.reserv_item .item_stat {
		font-size: 0.9em;
		color: rgb(50, 50, 50);
	}

	.reserv_item .delimiter {
		margin-left: 5px;
		margin-right: 5px;
		color: rgb(200, 200, 200);
	}
	
	.reserv_price {
		display: flex;
		justify-content: flex-end;
		font-weight: 700;
	}
	
	.reserv_date {
		padding-top: 21px;
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 20%;
		gap: 25px;
	}

	.reserv_time {
		font-size: 0.8em;
		color: rgb(50, 50, 50);
	}
	
	.reserv_status {
		font-size: 1em;
		color: #5399f5;
		font-weight: 700;
	}

	.reserv_btns {
		gap: 10px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		width: 20%;
	}

	.reserv_btns div {
		display: flex;
		justify-content: center;
	}

	.review_btn {
	    border: 15px;
	    width: 120px;
	    height: 40px;
	    border: 1px solid #5399f5;
	    border-radius: 10px;
	    background-color: white;
	    cursor: pointer;
	    transition: 0.5s;
	    color: #5399f5;
	}
	
	.review_btn:hover {
		background-color: #e8f2ff;
	}
	
	.reserv_page {
		display: flex;
		justify-content: center;
		align-items: center;
		gap: 15px;
	}
	
	.reserv_page a {
		color: #5399f5;
	}
	
	.reserv_page span {
		font-weight: 600;
	}

	.reserv_page .page_prev {
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		color: rgb(255, 255, 255);
		width: 45px;
		height: 32px;
		margin: 6px;
	}

	.reserv_page .page_next {
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
		color: white;
		width: 45px;
		height: 32px;
		margin: 6px;
	}
	
	.reserv_page .page_active {
		cursor: pointer;
		background-color: #5399f5;
	}
	
	.reserv_page .page_active:hover {
		background-color: #2c7fec;
	}

	.reserv_page .page_inactive {
		background-color: rgb(220, 220, 220);
	}
	
	.mypage h1 {
		font-size: 27px;
		font-weight: 500;
		margin-bottom: 30px;
		color: black;
	}
	
	.nav_title {
		border-bottom: 1px solid #eaeaea;
	}

	.user_info .input_frame {
		border-bottom: 1px solid #eaeaea;
		padding-top: 20px;
		padding-bottom: 50px;
	}
	
	.user_info .input_box {
		width: 70%;
		margin-top: 30px;
		display: flex;
		justify-content: space-between;
		align-items: center;
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
		width: 70%;
		display: flex;
		justify-content: flex-end;
	}

	.user_info .err_box span {
		width: 275px;
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
		width: 299px;
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