<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SKI:P</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage.css">
</head>
<body>
<jsp:include page="/header.jsp"/>

<form action="${pageContext.request.contextPath}/search">
	<input type="text" name="keyword" value="${keyword}">
	<input type="submit" value="검색">
</form>

<c:forEach var="dto" items="${list}">
	<div>
		<div>${dto.name} | ${dto.category}</div>
		<div>${dto.location}</div>
		<div>${dto.description }</div>
	</div>
</c:forEach>

<jsp:include page="/footer.jsp"/>
</body>
</html>