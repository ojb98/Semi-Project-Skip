<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/mypage/reserv_tab.jsp"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<ul id="ski_list">
	<c:forEach var="dto" items="${list}">
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
							<div class="reserv_scroll">
								<c:forEach var="itemDto" items="${dto.skiReservationItemDtoList}">
									<div class="reserv_item">
										<span class="item_name">${itemDto.item_name} </span>
										<span class="item_stat"><fmt:formatNumber value="${itemDto.subtotal_price div itemDto.quantity}" type="number"/>원 <span class="delimiter">·</span> ${itemDto.quantity}개</span>
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
<a href="">이전</a>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<a href="">${i}</a>
</c:forEach>
<a href="">다음</a>