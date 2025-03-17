<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="${pageContext.request.contextPath}/mypage/reviews" method="post">
	<select name="category">
        <option value="total" <c:if test="${empty category or category == 'total'}">selected</c:if>>전체</option>
        <option value="SKI" <c:if test="${category == 'SKI'}">selected</c:if>>스키장</option>
        <option value="RESORT" <c:if test="${category == 'RESORT'}">selected</c:if>>리조트</option>
        <option value="RENTAL" <c:if test="${category == 'RENTAL'}">selected</c:if>>렌탈샵</option>
    </select>

    <select name="rating">
        <option value="total" <c:if test="${empty rating or rating == 'total'}">selected</c:if>>전체</option>
        <option value="5" <c:if test="${rating == '5'}">selected</c:if>>5점</option>
        <option value="4" <c:if test="${rating == '4'}">selected</c:if>>4점</option>
        <option value="3" <c:if test="${rating == '3'}">selected</c:if>>3점</option>
        <option value="2" <c:if test="${rating == '2'}">selected</c:if>>2점</option>
        <option value="1" <c:if test="${rating == '1'}">selected</c:if>>1점</option>
    </select>

    <input type="submit" value="조회">
</form>

<c:forEach var="dto" items="${list}">
	<div>${dto.review_comment}</div>
</c:forEach>
<div>
	<c:if test="${startPage != 1}">
		<a href="${pageContext.request.contextPath}/mypage/reviews?pageNum=${startPage - 1}&category=${category}&rating=${rating}">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="${pageContext.request.contextPath}/mypage/reviews?pageNum=${i}&category=${category}&rating=${rating}">${i}</a>
	</c:forEach>
	<c:if test="${endPage != pageCount}">
		<a href="${pageContext.request.contextPath}/mypage/reviews?pageNum=${endPage - 1}&category=${category}&rating=${rating}">다음</a>
	</c:if>
</div>