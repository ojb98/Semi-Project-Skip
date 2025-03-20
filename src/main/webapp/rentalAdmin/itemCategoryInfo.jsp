<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1>카테고리&장비 상세정보</h1>
	<table border="1" width="1000">
	<tr>
        <th>번호</th>
        <th>장비타입</th>
        <th>장비이름</th>
        <th>장비상세</th>
        <th>총 장비수량</th>
		<th>시간당 대여가격</th>
        <th>장비 이미지</th>
        <th>등록일</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    <c:forEach var="list" items="${list}">
    
    	<c:forEach var="it" items="${list.itemesDto}">
		<tr>
            <td>${it.item_id }</td>
            <td>${list.item_type }</td>
            <td>${it.item_name }</td>
            <td>${it.item_detail }</td>
            <td>${it.total_quantity }</td>
            <td>${list.price_per_hour}</td>
            <td>
                <img src="${pageContext.request.contextPath}/rentItemImg/${it.item_img}" width="100">
            </td>
            <td>${it.created_at}</td>
            <td><a href="${pageContext.request.contextPath}/admin/update?">
            <button class="update-btn">수정</button></a></td>
            <td>
            	<a href="${pageContext.request.contextPath}/admin/delete?" 
            		onclick="return confirm('정말 삭제하시겠습니까?');">
            	<button class="delete-btn">삭제</button>
            	</a>
            </td>
        </tr>
        </c:forEach>
    </c:forEach>
	</table>

	
<!-- 페이징 버튼 -->
<div class="button-container-right">
    <c:if test="${currentPage > 1}">
        <button onclick="loadItemCategoryInfo(${currentPage - 1})">이전</button>
    </c:if>
    <c:if test="${currentPage < totalPages}">
        <button onclick="loadItemCategoryInfo(${currentPage + 1})">다음</button>
    </c:if>
</div>