<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="reserv_tab_container">
	<ul>
		<!-- 스키장 탭 -->
		<li>
			<a class="skiBookings" href="${pageContext.request.contextPath}/mypage/bookings/ski">스키장</a>
		</li>
		<!-- 리조트 탭 -->
		<li>
			<a class="resortBookings" href="${pageContext.request.contextPath}/mypage/bookings/resort">리조트</a>
		</li>
		<!-- 렌탈샵 탭 -->
		<li>
			<a class="rentalBookings" href="${pageContext.request.contextPath}/mypage/bookings/rental">렌탈샵</a>
		</li>
	</ul>
</div>