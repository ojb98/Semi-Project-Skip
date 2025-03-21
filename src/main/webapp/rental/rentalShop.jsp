<%@ page import="rental.dto.RentalShopDTO" %>
<%@ page import="ski.dto.SkiDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/search.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/detail.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/wish.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/cart.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/pay.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">
    <title>Simple Layout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: white;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 100%;
            margin: 0 auto;
            padding: 0;
        }

        .header_logo {
            font-family: 'GumiRomanceTTF';
            font-style: italic;
            color: #5399f5;
            font-size: 24px;
            font-weight: 700;
            line-height: 58px;
        }

        .header_menu,
        .header_nav {
            height: 58px;
        }

        /* header_nav */
        .header_menu {
            width: 1230px;
            /* padding: 0 75px; */
            margin: 0 auto;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .menu ul {
            display: flex;
            font-weight: 700;
            gap: 34px;
        }

        .login ul {
            display: flex;
            font-weight: 700;
            gap: 34px;
        }

        .header_menu a:hover {
            color: #5399f5;
        }

        .main-banner {
            width: 100%;
            aspect-ratio: 6 / 1;
            overflow: hidden;
        }

        .main-banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            image-rendering: crisp-edges;
        }

        .shop-name {
            display: flex;
            padding: 2rem 0;
            flex-direction: row;
            justify-content: center;
            font-weight: 400;
            font-size: 30px;
            color: #4C4C4C;
        }

        .main-content {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2rem;
            width: 70%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
            justify-content: center;
        }

        .item-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            padding: 0 0 1.5rem 0;
        }

        .item-box img {
            width: 100%;
            aspect-ratio: 1 / 1;
            object-fit: cover;
            border: 1px solid rgba(0, 0, 0, 0.18);
            border-radius: 12px;
            transition: all 0.2s ease-in-out;
        }

        .item-box a {
            display: block;
            width: 100%;
            color: black;
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 300;
        }

        .item-content {
            width: 100%;
            padding: 0.3rem 0 0.3rem 0;
            text-align: center;
        }

        .item-box img:hover {
            transform: translateY(-4px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
        }

        @media (max-width: 1200px) {
            .main-content {
                grid-template-columns: repeat(3, 1fr);
                width: 80%;
            }
        }

        @media (max-width: 900px) {
            .main-content {
                grid-template-columns: repeat(2, 1fr);
                width: 90%;
            }
        }

        @media (max-width: 600px) {
            .main-content {
                grid-template-columns: repeat(1, 1fr);
                width: 95%;
            }
        }

        .tab-button.active {
            color: #5399F5;
            border-bottom: 2px solid #5399F5;
        }

        .tab-button:hover {
            color: #5399F5;
        }

        /* 리뷰와 문의 섹션 스타일 */
        .review-qna-container {
            max-width: 65%;
            margin: 0 auto;
            padding: 2rem;
        }

        .tab-container {
            border-bottom: 1px solid #ddd;
            margin-bottom: 2rem;
        }

        .tab-button {
            font-size: 16px;
            padding: 1rem 2rem;
            border: none;
            background: none;
            cursor: pointer;
        }

        .tab-button:first-child {
            font-weight: bold;
        }

        .review-meta span {
            color: #5399F5;
        }

        .review-list,
        .qna-list {
            height: 500px;
        }

        .review-item,
        .qna-item {
            padding: 1.5rem 0;
            border-bottom: 1px solid #eee;
        }


    </style>
</head>
<body>
<div class="container">
    <header>
        <nav class="header_nav">
            <div class="header_menu">
                <div class="header_logo">
                    <h1>
                        <a href="index.html">SKI:P</a>
                    </h1>
                </div>
                <div class="login">
                    <ul>
                        <li>
                            <a href="#">로그인</a>
                        </li>
                        <li>
                            <a href="#">로그아웃</a>
                        </li>
                        <li>
                            <a href="#">마이페이지</a>
                        </li>
                        <li>
                            <a href="#">찜</a>
                        </li>
                        <li>
                            <a href="#">장바구니</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="main-banner">
        <img src="배너.jpg" alt="배너">
    </div>

    <%
        String isRentalOrSki = (String) request.getAttribute("isRentalOrSki");
        if (isRentalOrSki.equalsIgnoreCase("RENTAL")) {
            RentalShopDTO dto = (RentalShopDTO) request.getAttribute("dto");
        } else if (isRentalOrSki.equalsIgnoreCase("SKI")) {
            SkiDTO dto = (SkiDTO) request.getAttribute("dto");
        }
    %>
    <c:choose>
        <c:when test="${not empty requestScope.dto}">
            <div class="shop-name">
                <h2>${requestScope.dto.name}</h2>
            </div>

            <div class="main-content">
                <c:forEach var="item"
                           items="${fn:split('리프트권,패키지,스키,보드,보호구,상의,하의,신발', ',')}"
                           varStatus="status">
                    <div class="item-box">
                        <c:set var="linkUrl" value=""/>

                        <c:if test="${requestScope.isRentalOrSki eq 'RENTAL'}">
                            <c:set var="linkUrl"
                                   value="${pageContext.request.contextPath}/rental/rentalItem?item_type=${item}&rentalshop_id=${dto.rentalshop_id}&img_num=${status.index + 1}&isRentalOrSki=RENTAL"/>
                        </c:if>

                        <c:if test="${requestScope.isRentalOrSki eq 'SKI'}">
                            <c:set var="linkUrl"
                                   value="${pageContext.request.contextPath}/rental/rentalItem?item_type=${item}&ski_id=${dto.ski_id}&img_num=${status.index + 1}&isRentalOrSki=SKI"/>
                        </c:if>

                        <a href="${linkUrl}">
                            <img src="../rentMainImage/main${status.index + 1}.jpg?v=${System.currentTimeMillis()}"
                                 alt="장비"/>
                            <div class="item-content">
                                <h3 class="item-title">${item}</h3>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 50vh; text-align: center;">
                <h2 style="font-size: 24px; color: #333; margin-bottom: 1rem;">등록된 렌탈샵이 없습니다</h2>
                <p style="color: #666; font-size: 16px;">잠시 후 다시 시도해주세요</p>
            </div>
        </c:otherwise>
    </c:choose>

    <!-- 리뷰와 문의 섹션 추가 -->
    <div class="review-qna-container">
        <div class="tab-container">
            <button class="tab-button active" onclick="showTab('review')">리뷰</button>
            <button class="tab-button" onclick="showTab('qna')">Q&A</button>
        </div>

        <div id="review-section" class="tab-content">
            <div class="review-list">
                <div class="review_amount">
                    <%--                    <h3>리뷰 #{qweqwe} 건</h3>--%>
                </div>
                <%--                <c:forEach>--%>
                <%--                     <div class="review-item"></div>--%>
                <%--                   </div>--%>
                <%--                    --%>
                <%--                </c:forEach>--%>
            </div>
        </div>

        <div id="qna-section" class="tab-content" style="display: none;">
            <div class="qna-list">
                <div class="qna-amount">
                    <%--                    <h3>qna #{qweqwe} 건</h3>--%>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
    function showTab(tabName) {
        const reviewSection = document.getElementById('review-section');
        const qnaSection = document.getElementById('qna-section');
        const buttons = document.querySelectorAll('.tab-button');

        if (tabName === 'review') {
            reviewSection.style.display = 'block';
            qnaSection.style.display = 'none';
            buttons[0].classList.add('active');
            buttons[1].classList.remove('active');
        } else {
            reviewSection.style.display = 'none';
            qnaSection.style.display = 'block';
            buttons[0].classList.remove('active');
            buttons[1].classList.add('active');
        }
    }
</script>
</body>
</html>