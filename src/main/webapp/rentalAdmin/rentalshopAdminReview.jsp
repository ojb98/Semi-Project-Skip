<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/detail.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/rentalAdmin/header.jsp" />

	<!-- 메인 컨텐츠 영역 -->
	<main class="main-content">
		<div class="review_tab">
			<div class="review_title">
				<div class="title_left">
					<div class="review_rating">
						<h3>리뷰 평점</h3>
						<span class="rating"><i class="fa fa-star"></i></span>
						<div class="rating_number">
							<span>${avgReviews}</span><span>/</span><span>5</span>
						</div>
					</div>
					<div class="review_number">
						<h3>전체 리뷰 수</h3>
						<i class="fa fa-commenting"></i>
						<p>${totalReviews}</p>
					</div>
				</div>
				<div class="title_right">
					<div class="review_filter">
						<a
							class="filter_btn ${empty param.sort or param.sort eq 'latest' ? 'active' : ''}"
							href="${pageContext.request.contextPath}/rentalshopAdmin/rentalshopAdminReview?sort=latest&pageNum=1"></i>최신순</a>
						<a
							class="filter_btn ${param.sort eq 'ratingDesc' ? 'active' : ''}"
							href="${pageContext.request.contextPath}/rentalshopAdmin/rentalshopAdminReview?sort=ratingDesc&pageNum=1"></i>평점
							높은순</a> <a
							class="filter_btn ${param.sort eq 'ratingAsc' ? 'active' : ''}"
							href="${pageContext.request.contextPath}/rentalshopAdmin/rentalshopAdminReview?sort=ratingAsc&pageNum=1"></i>평점
							낮은순</a>
					</div>
				</div>
			</div>
			<div class="review_contents">
				<ul class="review_list" id="reviewList">
					<c:forEach var="rrDto" items="${rentalshopReviewList }">
						<li class="review_item">
							<div class="user_review">
								<div class="item_content">
									<div class="rating_box">
										<div class="star_box">
											<c:forEach var="i" begin="1" end="${rrDto.rating}">
												<i class="fa fa-star"></i>
											</c:forEach>
										</div>
										<span class="rating_number">${rrDto.rating.intValue()}
											점</span>
									</div>
									<div class="user_box">
										<p class="user_id">${rrDto.user_id }</p>
										<p class="created_at">${rrDto.created_at }</p>
										<div class="content">
											<p>${rrDto.review_comment }</p>
										</div>
									</div>
								</div>
								<div class="item_img">
									<c:choose>
										<c:when test="${not empty rrDto.review_img }">
											<img
												src="<%=request.getContextPath() %>/reviewImgs/${rrDto.review_img} ">
										</c:when>
										<c:otherwise>
											<!-- 이미지가 없으면 빈값 -->
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- 페이징 -->
			<div class="page_btn">
				<c:if test="${startPage > 10 }">
					<a class="before_btn"
						href="${pageContext.request.contextPath }/rentalshopAdmin/rentalshopAdminReview=${startPage-1}&sort=${param.sort}"><i
						class="fa fa-angle-left">이전</a>
				</c:if>

				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${i==pageNum }">
							<a class="active"
								href="${pageContext.request.contextPath }/rentalshopAdmin/rentalshopAdminReview?pageNum=${i}&sort=${param.sort}">
								<span>${i }</span>
							</a>
						</c:when>
						<c:otherwise>
							<a
								href="${pageContext.request.contextPath }/rentalshopAdmin/rentalshopAdminReview?pageNum=${i}&sort=${param.sort}">
								<span>${i }</span>
							</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${endPage < pageCount }">
					<a class="after_btn"
						href="${pageContext.request.contextPath }/rentalshopAdmin/rentalshopAdminReview=${endPage+1}&sort=${param.sort}">다음<i
						class="fa fa-angle-right"></i></a>
				</c:if>
			</div>

		</div>
	</main>
</body>
</html>