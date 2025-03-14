<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="reserv_tab_container">
	<ul>
		<!-- 스키장 탭 -->
		<li>
			<a href="${pageContext.request.contextPath}/mypage/bookings/ski">스키장</a>
		</li>
		<!-- 리조트 탭 -->
		<li>
			<a href="javascript:resortBookList(2025, 1)">리조트</a>
		</li>
		<!-- 렌탈샵 탭 -->
		<li>
			<a href="javascript:rentalBookList(2025, 1)">렌탈샵</a>
		</li>
	</ul>
</div>