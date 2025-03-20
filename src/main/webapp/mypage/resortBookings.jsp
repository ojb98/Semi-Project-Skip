<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/mypage/reserv_tab.jsp"/>

<ul id="ski_list">
	<c:forEach var="dto" items="${list}">
		<li>
			<div class="reserv_container">
				<div class="reserv_title">
					<span>${dto.resort_reserv_id}</span>
					<span>${dto.created_at}</span>
				</div>
				
				<div class="reserv_content">
					<div class="reserv_place"><a href="">${dto.name}</a></div>
					<div class="reserv_stat">
						<div class="reserv_items">
							<div class="reserv_item">
								<span class="item_name">(${dto.room_type}) ${dto.room_name}</span>
								<span class="item_stat"><fmt:formatNumber value="${dto.total_price div dto.quantity}" type="number" pattern="###, ###"/>원 <span class="delimiter">·</span> ${dto.quantity}개</span>
							</div>
						</div>
						<div class="reserv_price">
							<span><fmt:formatNumber value="${dto.total_price}" type="number"/>원</span>
						</div>
					</div>
					<div class="reserv_date">
						<div>
							<div class="reserv_time"><fmt:formatDate value="${dto.checkin_date}" type="date" pattern="yyyy-MM-dd"/></div>
							<div class="reserv_time"><fmt:formatDate value="${dto.checkin_date}" type="time"/></div>
						</div>
						<div>
							<div class="reserv_time"><fmt:formatDate value="${dto.checkout_date}" type="date" pattern="yyyy-MM-dd"/></div>
							<div class="reserv_time"><fmt:formatDate value="${dto.checkout_date}" type="time"/></div>
						</div>
						<div class="reserv_status">${dto.status}</div>
					</div>
					<div class="reserv_btns">
						<div>
							<input class="review_btn" type="button" value="취소하기">
						</div>
						<div>
							<input class="review_btn" type="button" value="리뷰하기">
						</div>
						<div>
							<input class="review_btn" type="button" value="문의하기">
						</div>
					</div>
				</div>
			</div>
		</li>
	</c:forEach>
</ul>
<div class="reserv_page">
	<c:choose>
		<c:when test="${startPage != 1}">
			<input class="page_prev page_active" type="button" value="이전" onclick="clickPrev()"/>
		</c:when>
		<c:otherwise>
			<input class="page_prev page_inactive" type="button" value="이전">
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:choose>
			<c:when test="${i == pageNum}">
				<span>${i}</span>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/mypage/bookings/resort?pageNum=${i}&year=${year}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${endPage != pageCount}">
			<input class="page_next page_active" type="button" value="다음" onclick="clickNext()"/>
		</c:when>
		<c:otherwise>
			<input class="page_next page_inactive" type="button" value="다음">
		</c:otherwise>
	</c:choose>
</div>

<script>
	function clickPrev() {
		location.href = "${pageContext.request.contextPath}/mypage/bookings/resort?pageNum=${startPage - 1}&year=${year}";
	}
	
	function clickNext() {
		location.href = "${pageContext.request.contextPath}/mypage/bookings/resort?pageNum=${endPage + 1}&year=${year}";
	}
</script>