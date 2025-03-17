<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mypage_nav_container">
	<ul>
		<li>
			<a class="info" href="${pageContext.request.contextPath}/mypage/info">회원정보</a>
		</li>
		<li>
			<a class="skiBookings rentalBookings resortBookings" href="${pageContext.request.contextPath}/mypage/bookings/ski">예약</a>
		</li>
		<li>
			<a class="reviews" href="${pageContext.request.contextPath}/mypage/reviews">리뷰</a>
		</li>
		<li>
			<a href="inquiries">문의</a>
		</li>
		<li>
			<a class="delete" href="${pageContext.request.contextPath}/mypage/account/delete">회원탈퇴</a>
		</li>
	</ul>
</div>