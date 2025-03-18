<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="nav_title">
	<h1>예약 목록</h1>
</div>
<div class="tab_container">
	<ul>
		<!-- 스키장 탭 -->
		<li>
			<input class="booking_tab skiBookings" type="button" value="스키장" onclick="clickSki()">
		</li>
		<!-- 리조트 탭 -->
		<li>
			<input class="booking_tab resortBookings" type="button" value="리조트" onclick="clickResort()">
		</li>
		<!-- 렌탈샵 탭 -->
		<li>
			<input class="booking_tab rentalBookings" type="button" value="렌탈샵" onclick="clickRental()">
		</li>
	</ul>

	<div class="search_box">
		<input type="text" name="year" placeholder="원하시는 연도를 조회하세요." value="${year}">
		<input type="button" value="조회" onclick="search()">
	</div>
</div>

<script>
	const urlMapper = new Map();
	urlMapper.set("skiBookings", "ski");
	urlMapper.set("resortBookings", "resort");
	urlMapper.set("rentalBookings", "rental");
	const year = document.getElementsByName("year")[0];

	function clickSki() {
		location.href = "${pageContext.request.contextPath}/mypage/bookings/ski?year=" + year.value;
	}
	
	function clickResort() {
		location.href = "${pageContext.request.contextPath}/mypage/bookings/resort?year=" + year.value;
	}
	
	function clickRental() {
		location.href = "${pageContext.request.contextPath}/mypage/bookings/rental?year=" + year.value;
	}

	function search() {
		location.href = "${pageContext.request.contextPath}/mypage/bookings/" + urlMapper.get("${content}") + "?year=" + year.value;
	}
</script>