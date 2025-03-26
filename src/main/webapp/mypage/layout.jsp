<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SKI:P</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage.css">
<style type="text/css">
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
	
	.qna_background {
		display: none;
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: hidden;
		background: rgba(0, 0, 0, 0.5);
	}
	
	.qna_form {
		position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    padding: 20px;
	    background: #ffffff;
	    border-radius: 20px;
	}
</style>
</head>
<body>
<!-- header -->
<jsp:include page="/header.jsp"/>

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