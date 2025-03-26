<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    
    	<c:forEach var="it" items="${list.skiItemDto}">
		<tr>
            <td>${it.item_id }</td>
            <td>${list.item_type }</td>
            <td>${it.item_name }</td>
            <td>${it.item_detail }</td>
            <td>${it.total_quantity }</td>
            <fmt:formatNumber var="price" value="${list.price_per_hour }" pattern="###,###" />
            <td>${price }원</td>
            <td>
                <img src="${pageContext.request.contextPath}/skiItemImg/${it.item_img}" width="100">
            </td>
            <td>${it.created_at}</td>
            <td><a href="${pageContext.request.contextPath}/adminSkiItem/update?item_id=${it.item_id}">
            <button class="update-btn">수정</button></a></td>
            <td>
            	<a href="${pageContext.request.contextPath}/adminSkiItem/delete?item_id=${it.item_id}" 
            		onclick="return confirm('정말 삭제하시겠습니까?');">
            	<button class="delete-btn">삭제</button>
            	</a>
            </td>
        </tr>
        </c:forEach>
    </c:forEach>
	</table>

	
<!-- 블록 단위 페이징 네비게이션 -->
<div class="paging">
  <!-- 이전 블록 -->
  <c:if test="${startPage > 1}">
      <a href="javascript:void(0);" onclick="loadItemCategoryInfo(${startPage - 1});">이전</a>
  </c:if>
  
  <!-- 페이지 번호 링크 -->
  <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <c:choose>
          <c:when test="${i == currentPage}">
              <span class="current">${i}</span>
          </c:when>
          <c:otherwise>
              <a href="javascript:void(0);" onclick="loadItemCategoryInfo(${i});">${i}</a>
          </c:otherwise>
      </c:choose>
  </c:forEach>
  
  <!-- 다음 블록 -->
  <c:if test="${endPage < totalPages}">
      <a href="javascript:void(0);" onclick="loadItemCategoryInfo(${endPage + 1});">다음</a>
  </c:if>
</div>