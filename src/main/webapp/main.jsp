<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>                                                
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자 메인 페이지</h1>
	<ul>
		<li><a href="${pageContext.request.contextPath }/facility/insert">시설 등록</a></li>
		<li><a href="${pageContext.request.contextPath }/facility/list">시설 목록</a></li>
		<li><a href="${pageContext.request.contextPath }/resort/insert">리조트 등록</a></li>
		<li><a href="${pageContext.request.contextPath }/resort/list">리조트 리스트</a></li>
	</ul>
</body>
</html>