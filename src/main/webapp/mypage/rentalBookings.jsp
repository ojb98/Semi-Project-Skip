<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/mypage/reserv_tab.jsp"/>

<ul id="rental_list">
	<c:forEach var="dto" items="${list}">
		<li>
			<div class="reserv_container">
				<div class="reserv_title">
					<a href="">${dto.rent_reserv_id}</a>
					<span>${dto.created_at}</span>
				</div>
				
				<div class="reserv_content">
					<table width="100%">
						<colgroup>
							<col style="width: 20%">
							<col style="width: 35%"/>
							<col style="width: 15%"/>
							<col style="width: 15%"/>
							<col style="width: 15%"/>
						</colgroup>
				
						<thead hidden>
							<tr>
								<th>시설</th>
								<th>장비 상세</th>
								<th>총금액</th>
								<th>예약일/예약상태</th>
								<th>버튼</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div>${dto.name}</div>
								</td>
								<td>
									<div class="reserv_items">
										<c:forEach var="itemDto" items="${dto.rentalReservationItemDtoList}">
											<div>
												<span>${itemDto.item_name} </span>
												<span>${itemDto.quantity}개 </span>
												<span>${itemDto.subtotal_price}원</span>
											</div>
										</c:forEach>
									</div>
								</td>
								<td>
									<div>${dto.total_price}</div>
								</td>
								<td>
									<div>${dto.rental_start}</div>
								</td>
								<td>
									<div>버튼</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</li>
	</c:forEach>
</ul>