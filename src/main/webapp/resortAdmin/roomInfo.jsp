<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>객실 상세정보</h1>
	<table border="1" width="1000">
	<tr>
        <th>번호</th>
        <th>객실명</th>
        <th>객실유형</th>
        <th>객실 수</th>
        <th>최대숙박 인원</th>
        <th>1박당 가격</th>
        <th>메인이미지</th>
        <th>서브이미지1</th>
        <th>서브이미지2</th>
        <th>서브이미지3</th>
        <th>추가 및 설명</th>
        <th>등록일</th>
        <th>객실수정</th>
        <th>객실삭제</th>
    </tr>
    <c:forEach var="rm" items="${rmdto}">
		<tr>
            <td>${rm.room_id}</td>
            <td>${rm.room_name }</td>
            <td>${rm.room_type}</td>
            <td>${rm.room_quantity}</td>
            <td>${rm.max_guests}</td>
            <td>${rm.price_per_night}</td>
            <td>
                <img src="${pageContext.request.contextPath}/roomImg/${rm.rmain_img}" width="100">
            </td>
            <td>
                <c:choose>
                    <c:when test="${not empty rm.rsub_img1}">
                        <img src="${pageContext.request.contextPath}/roomImg/${rm.rsub_img1}" width="100">
                    </c:when>
                    <c:otherwise>
                        <label>이미지 없음</label>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${not empty rm.rsub_img2}">
                        <img src="${pageContext.request.contextPath}/roomImg/${rm.rsub_img2}" width="100">
                    </c:when>
                    <c:otherwise>
                        <label>이미지 없음</label>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${not empty rm.rsub_img3}">
                        <img src="${pageContext.request.contextPath}/roomImg/${rm.rsub_img3}" width="100">
                    </c:when>
                    <c:otherwise>
                        <label>이미지 없음</label>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${rm.description}</td>
            <td>${rm.created_at}</td>
            <td><a href="${pageContext.request.contextPath}/adminRoom/update?room_id=${rm.room_id}">
            <button class="update-btn">수정</button></a></td>
            <td>
            	<a href="${pageContext.request.contextPath}/adminRoom/delete?room_id=${rm.room_id}" 
            		onclick="return confirm('정말 삭제하시겠습니까?');">
            	<button class="delete-btn">삭제</button>
            	</a>
            </td>
        </tr>
        
    </c:forEach>
	</table>

<!-- 페이징 버튼 -->
<div class="button-container-right">
    <c:if test="${currentPage > 1}">
        <button onclick="loadRoomInfo(${currentPage - 1})">이전</button>
    </c:if>
    <c:if test="${currentPage < totalPages}">
        <button onclick="loadRoomInfo(${currentPage + 1})">다음</button>
    </c:if>
</div>
