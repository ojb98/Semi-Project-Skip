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

<div class="search_background">
	<main class="search_main">
		<div class="search_wrapper">
			<form action="${pageContext.request.contextPath}/search">
				<div class="search_box">
					<input type="text" name="keyword" value="${keyword}">
					<input type="submit" value="검색">
				</div>
			</form>
			<div class="search_list">
				<c:forEach var="dto" items="${list}">
					<div class="search_item">
						<div>
							<a href="">${dto.name}</a>
							<span class="category">
								<c:choose>
									<c:when test="${dto.category == 'SKI'}">
										스키장
									</c:when>
									<c:when test="${dto.category == 'RESORT'}">
										리조트
									</c:when>
									<c:when test="${dto.category == 'RENTAL'}">
										렌탈샵
									</c:when>
								</c:choose>
							</span>
						</div>
						<div class="location">${dto.location}</div>
						<div class="description">${dto.description }</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</main>
</div>

<jsp:include page="/footer.jsp"/>
</body>
</html>