<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<nav class="header_nav">
		<div class="header_menu">
			<div class="header_logo">
	  			<h1>
	    			<a href="${pageContext.request.contextPath}">SKI:P</a>
	  			</h1>
			</div>
			<div class="login">
				<c:choose>
					<c:when test="${empty user}">
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/users/login">로그인</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/users/signup">회원가입</a>
							</li>
							
						</ul>
					</c:when>
					<c:otherwise>
						<ul>
							<!-- 로그인한 역할을 보고 나오게 함 (choose) 사용'USER', 'SKI', 'RENTAL', 'RESORT', 'ADMIN' -->
							<c:choose>
								<c:when test="${user.role == 'SKI' }">
									<li><a href="${pageContext.request.contextPath}/skiAdmin/skiAdminMain.jsp">관리자사이트</a></li>
								</c:when>
								<c:when test="${user.role == 'RENTAL' }">
									<li><a href="${pageContext.request.contextPath}/rentalAdmin/rentalAdminMain.jsp">관리자사이트</a></li>
								</c:when>
								<c:when test="${user.role == 'RESORT' }">
									<li><a href="${pageContext.request.contextPath}/resortAdmin/resortAdminMain.jsp">관리자사이트</a></li>
								</c:when>
								<c:when test="${user.role == 'ADMIN' }">
									<li><a href="${pageContext.request.contextPath}/resortAdmin/resortAdminMain.jsp">관리자사이트</a></li>
								</c:when>
								<c:otherwise>
								
								</c:otherwise>
							</c:choose>
							
							<li>
								<a href="${pageContext.request.contextPath}/users/logout">로그아웃</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/mypage/info">마이페이지</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/wishlist/">찜</a>
							</li>
							<li>
								<a href="cart.html">장바구니</a>
							</li>
							
							
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
</header>