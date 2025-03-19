<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="nav_title">
	<h1>리뷰 목록</h1>
</div>
<form action="${pageContext.request.contextPath}/mypage/reviews" method="post">
	<div class="select_container">
		<div class="review_select">
			<select name="category">
		        <option value="" <c:if test="${empty category or category == ''}">selected</c:if>>전체</option>
		        <option value="SKI" <c:if test="${category == 'SKI'}">selected</c:if>>스키장</option>
		        <option value="RESORT" <c:if test="${category == 'RESORT'}">selected</c:if>>리조트</option>
		        <option value="RENTAL" <c:if test="${category == 'RENTAL'}">selected</c:if>>렌탈샵</option>
		    </select>
		    <select name="rating">
		        <option value="" <c:if test="${empty rating or rating == ''}">selected</c:if>>전체</option>
		        <option value="5" <c:if test="${rating == '5'}">selected</c:if>>⭐⭐⭐⭐⭐</option>
		        <option value="4" <c:if test="${rating == '4'}">selected</c:if>>⭐⭐⭐⭐</option>
		        <option value="3" <c:if test="${rating == '3'}">selected</c:if>>⭐⭐⭐</option>
		        <option value="2" <c:if test="${rating == '2'}">selected</c:if>>⭐⭐</option>
		        <option value="1" <c:if test="${rating == '1'}">selected</c:if>>⭐</option>
		    </select>
	    </div>
	    
	    <div class="search_box">
	    	<input type="text" name="year" value="${year}" placeholder="조회하실 연도를 입력하세요.">
	    	<input type="submit" value="조회">
	    </div>
	</div>
</form>

<c:forEach var="dto" items="${list}">
	<div class="review_container">
		<div class="review_title reserv_title">
			<a href="">${dto.ref_name}</a>
			<span>${dto.created_at}</span>
		</div>
		<div class="review_content">
			<div class="review_rating">
				<c:forEach var="i" begin="${dto.rating}" end="4">
					<img src="${pageContext.request.contextPath}/img/2B50_black.png" width="27px" height="27px"/>
				</c:forEach>
				<c:forEach var="i" begin="1" end="${dto.rating}">
					<img src="${pageContext.request.contextPath}/img/2B50_color.png" width="27px" height="27px"/>
				</c:forEach>
			</div>
			<div class="review_image">
				<img src="${pageContext.request.contextPath}/reviewImgs/${dto.img}" width="100px" height="100px"/>
			</div>
			<div class="review_comment">
				${dto.review_comment}
			</div>
		</div>
	</div>
</c:forEach>
<c:if test="${list.size() == 0}">
	<h2>조회된 목록이 없습니다.</h2>
</c:if>

<div class="reserv_page">
	<c:choose>
		<c:when test="${startPage == 1}">
			<input class="page_prev page_inactive" type="button" value="이전" onclick="clickPrev()">
		</c:when>
		<c:otherwise>
			<input class="page_prev page_active" type="button" value="이전" onclick="clickPrev()">
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:choose>
			<c:when test="${i == pageNum}">
				<span>${i}</span>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/mypage/reviews?pageNum=${i}&category=${category}&rating=${rating}&year=${year}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${endPage == pageCount}">
			<input class="page_next page_inactive" type="button" value="다음" onclick="clickNext()">
		</c:when>
		<c:otherwise>
			<input class="page_next page_active" type="button" value="다음" onclick="clickNext()">
		</c:otherwise>
	</c:choose>
</div>

<script>
	function clickPrev() {
		location.href = "${pageContext.request.contextPath}/mypage/reviews?pageNum=${startPage - 1}&category=${category}&rating=${rating}&year=${year}";
	}
	
	function clickNext() {
		location.href = "${pageContext.request.contextPath}/mypage/reviews?pageNum=${endPage + 1}&category=${category}&rating=${rating}&year=${year}";
	}
</script>