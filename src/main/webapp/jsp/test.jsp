<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test.jsp</title>
</head>
<body>
	<ul>
		<li><a href="${pageContext.request.contextPath}/jsp/reviewInsert">리뷰쓰기</a></li>
		<li><a href="javascript:popup()">리뷰쓰기</a></li>
		<li><a href="${pageContext.request.contextPath}/jsp/reviewList">리뷰리스트</a></li>                         
	</ul>
	
	<script>
	function popup() {
		console.log("popup함수 작동확인");
	    const url = "${pageContext.request.contextPath}/jsp/reviewInsert";
	    const name = "reviewPopup";
	    const option = "width=600,height=600,top=100,left=100,location=no";

	    window.open(url, name, option);
	}
	</script>
</body>
</html>
