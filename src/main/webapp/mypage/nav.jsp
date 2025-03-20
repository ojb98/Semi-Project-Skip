<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mypage nav_container">
	<ul>
		<li>
			<input class="info" type="button" value="회원 정보" onclick="clickInfo()">
		</li>
		<li>
			<input class="skiBookings rentalBookings resortBookings" type="button" value="예약 목록" onclick="clickBookings()">
		</li>
		<li>
			<input class="reviews" type="button" value="리뷰 목록" onclick="clickReviews()">
		</li>
		<li>
			<input class="inquiries" type="button" value="문의 목록" onclick="clickInquiries()">
		</li>
		<li>
			<input class="delete" type="button" value="회원 탈퇴" onclick="clickDelete()">
		</li>
	</ul>
</div>

<script>
	function clickInfo() {
		location.href = "${pageContext.request.contextPath}/mypage/info";
	}
	
	function clickBookings() {
		location.href = "${pageContext.request.contextPath}/mypage/bookings/ski";
	}
	
	function clickReviews() {
		location.href = "${pageContext.request.contextPath}/mypage/reviews";
	}
	
	function clickInquiries() {
		location.href = "${pageContext.request.contextPath}/mypage/inquiries";
	}
	
	function clickDelete() {
		location.href = "${pageContext.request.contextPath}/mypage/account/delete";
	}
</script>