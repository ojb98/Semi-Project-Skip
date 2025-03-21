<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mainpage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/header.jsp" />

	<!-- main -->
	<main>
		<div class="cart_container">
			<div class="cart_title">
				<h2>장바구니</h2>
			</div>
			<div class="cart_info">
				<c:choose>
					<c:when test="${not empty requestScope.cartList}">
						<c:forEach var="cart" items="${requestScope.cartList}">
							<div class="cart_item">
								<input type="checkbox" class="cart_checkbox" name="" id="">
								<div class="item_img img1">
									<img src = "/test${cart.mainImg}">
								</div>
								<div class="item_info">
									<span class="item_badge">${cart.category }</span>
									<div class="item_title_box">
										<h3>${cart.name }</h3>
										<span class="rating"><i class="fa fa-star"></i>${cart.rating }</span>
									</div>
									<p class="item_detail">${cart.description }</p>
									<div class="counter">
										<button type="button" class="minus">-</button>
										<span class="count">${cart.quantity }</span>
										<button type="button" class="plus">+</button>
									</div>
									<div class="item_price">
										<p class="price">
										<fmt:formatNumber value="${cart.price}" pattern="#,###"/>원
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>

			<!-- pay_info, total_price, pay_btn 영역 전체 부분 pay.html 에 css와 동일하게 사용-->
			<div class="pay_info">
				<h3>결제 정보</h3>
				<div class="pay_price">
					<span class="label">객실 가격(1박)</span> <span class="value">121,000원</span>
				</div>
				<div class="pay_discount">
					<span class="label">객실 할인 금액</span> <span class="value">-12,100원</span>
				</div>
			</div>
			<div class="total_price">
				<span class="lable">총 결제 금액</span> <span class="value">108,900원</span>
			</div>
			<button class="pay_btn">
				<span>108,900</span>원 결제하기
			</button>
		</div>
	</main>

	<!-- footer -->
	<jsp:include page="/footer.jsp" />

	<script>
		document.querySelector('.pay_btn').addEventListener('click',
				function() {
					window.location.href = 'pay.html'; // 원하는 경로로 이동
				});
	</script>
</body>


</html>