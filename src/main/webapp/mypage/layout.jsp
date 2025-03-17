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