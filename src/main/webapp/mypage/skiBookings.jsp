<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/mypage/reserv_tab.jsp"/>

<ul id="ski_list">
	<c:forEach var="dto" varStatus="status" items="${list}">
		<li>
			<div class="reserv_container">
				<div class="reserv_title">
					<span>${dto.ski_reserv_id}</span>
					<span>${dto.created_at}</span>
				</div>
				
				<div class="reserv_content">
					<div class="reserv_place"><a href="">${dto.name}</a></div>
					<div class="reserv_stat">
						<div class="reserv_items">
							<div>
								<c:forEach var="itemDto" items="${dto.skiReservationItemDtoList}">
									<div class="reserv_item">
										<span class="item_name">${itemDto.item_name} </span>
										<span class="item_stat"><fmt:formatNumber value="${itemDto.subtotal_price div itemDto.quantity}" type="number" pattern="###, ###"/>원 <span class="delimiter">·</span> ${itemDto.quantity}개</span>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="reserv_price">
							<span><fmt:formatNumber value="${dto.total_price}" type="number"/>원</span>
						</div>
					</div>
					<div class="reserv_date">
						<div>
							<div class="reserv_time"><fmt:formatDate value="${dto.reserv_start}" type="date" pattern="yyyy-MM-dd"/></div>
							<div class="reserv_time"><fmt:formatDate value="${dto.reserv_start}" type="time"/></div>
						</div>
						<div>
							<div class="reserv_time"><fmt:formatDate value="${dto.reserv_end}" type="date" pattern="yyyy-MM-dd"/></div>
							<div class="reserv_time"><fmt:formatDate value="${dto.reserv_end}" type="time"/></div>
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

<c:if test="${list.size() == 0}">
	<h2>조회된 목록이 없습니다.</h2>
</c:if>
<div class="reserv_page">
	<c:choose>
		<c:when test="${startPage == 1}">
			<input class="page_prev page_inactive" type="button" value="이전">
		</c:when>
		<c:otherwise>
			<input class="page_prev page_active" type="button" value="이전" onclick="clickPrev()"/>
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:choose>
			<c:when test="${i == pageNum}">
				<span>${i}</span>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/mypage/bookings/ski?pageNum=${i}&year=${year}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${endPage == pageCount}">
			<input class="page_next page_inactive" type="button" value="다음">
		</c:when>
		<c:otherwise>
			<input class="page_next page_active" type="button" value="다음" onclick="clickNext()"/>
		</c:otherwise>
	</c:choose>
</div>

<script>
	function clickPrev() {
		location.href = "${pageContext.request.contextPath}/mypage/bookings/ski?pageNum=${startPage - 1}&year=${year}";
	}
	
	function clickNext() {
		location.href = "${pageContext.request.contextPath}/mypage/bookings/ski?pageNum=${endPage + 1}&year=${year}";
	}
</script>