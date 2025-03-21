<%@page import="users.dao.UsersDao"%>
<%@ page import="resort.dto.ResortDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="resort.dto.RoomDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="resort.dto.ResortReviewDTO" %>
<html>
<head>
    <title>resort</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainpage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <%-- 아이콘 --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <%-- 달력 --%>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
    <%-- flatpickr 한국어 --%>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/search.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/detail.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/wish.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/cart.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/pay.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">
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

        header {
            border-bottom: 1px solid #e9e9e9;
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


        /*.nav {*/
        /*    background: white;*/
        /*    padding: 1rem 0;*/
        /*    position: sticky;*/
        /*    top: 0;*/
        /*    z-index: 1000;*/
        /*    border-bottom: 1px solid rgba(0, 0, 0, 0.1);*/
        /*}*/

        /*.nav-container {*/
        /*    display: flex;*/
        /*    justify-content: space-between;*/
        /*    align-items: center;*/
        /*    max-width: 1280px;*/
        /*    margin: 0 auto;*/
        /*    padding: 0 1rem;*/
        /*}*/

        /*.nav-logo {*/
        /*    color: #5399F5;*/
        /*    text-decoration: none;*/
        /*    font-weight: 800;*/
        /*    font-size: 2rem;*/
        /*    font-style: italic;*/
        /*}*/

        /*.nav-menu {*/
        /*    display: flex;*/
        /*    gap: 2rem;*/
        /*    list-style: none;*/
        /*}*/

        /*.nav-menu a {*/
        /*    color: black;*/
        /*    text-decoration: none;*/
        /*    font-weight: 600;*/
        /*    padding: 0.4rem 1rem;*/
        /*    border-radius: 12px;*/
        /*    transition: all 0.2s ease-in-out;*/
        /*}*/

        /*.nav-menu a:hover {*/
        /*    background: rgba(66, 133, 244, 0.08);*/
        /*    color: #4285F4;*/
        /*}*/

        .content-wrapper {
            max-width: 1100px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .search-info-box {
            display: flex;
            align-items: center;
            font-size: 14px;
            background-color: #F7F7F7;
            width: fit-content;
            height: 42px;
            border-radius: 30px;
            padding: 0 8px;
            gap: 4px;
            border: 1px solid #EBEBEB;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            margin: 20px 0;
        }

        .search {
            display: flex;
            align-items: center;
            padding: 8px 16px;
            gap: 8px;
            border-right: 1px solid #EBEBEB;
            min-width: 200px;
        }

        .search i {
            color: #666;
            font-size: 16px;
            cursor: pointer;
        }

        .search-date {
            display: flex;
            align-items: center;
            padding: 8px 16px;
            border-right: 1px solid #EBEBEB;
            color: #333;
            font-weight: 500;
        }

        .search-date input {
            border: none;
            background-color: transparent;
            color: #333;
            cursor: pointer;
            padding: 8px;
            font-size: 14px;
        }

        .search-maxGuest {
            display: flex;
            align-items: center;
            padding: 8px 16px;
            color: #333;
            font-weight: 500;
        }

        .image-container {
            margin: 0;
            padding: 0;
        }

        .image-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 8px;
            height: 550px;
            position: relative;
        }

        .main-image {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .main-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 15px 0 0 15px;
        }

        .sub-images {
            display: grid;
            grid-template-rows: 1fr 1fr;
            gap: 8px;
            height: 100%;
        }

        .sub-image-top {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 8px;
        }

        .sub-image-top img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .sub-image-bottom {
            width: 100%;
            height: 100%;
        }

        .sub-image-bottom img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .sub-image-top img:first-child {
            border-radius: 0 15px 0 0;
        }

        .sub-image-top img:last-child {
            border-radius: 0 15px 0 0;
        }

        .sub-image-bottom img {
            border-radius: 0 0 15px 0;
        }

        .more-photos {
            position: absolute;
            bottom: 20px;
            right: 20px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .more-photos:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        .more-photos i {
            margin-right: 6px;
        }

        .search input {
            border: none;
            outline: none;
            background: transparent;
            font-size: 14px;
            width: 150px;
            color: #333;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .search input::placeholder {
            color: #999;
        }

        .resort-info {
            margin-top: 24px;
            border-bottom: 1px solid #EBEBEB;
            padding-bottom: 24px;
        }

        .resort-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #333;
        }

        .resort-price {
            font-size: 20px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
        }

        .resort-price span {
            font-weight: normal;
            font-size: 16px;
        }

        .service-icons {
            display: flex;
            gap: 24px;
            margin-top: 20px;
        }

        .service-item {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #666;
            font-size: 14px;
        }

        .service-item i {
            font-size: 18px;
            color: #333;
        }

        .review-count {
            display: flex;
            align-items: center;
            gap: 4px;
            color: #666;
            font-size: 14px;
            margin-top: 12px;
        }

        .review-count i {
            color: #FFA500;
        }

        .room-selection {
            margin-top: 40px;
        }

        .room-selection h2 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #333;
        }

        .room-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .room-item {
            display: flex;
            gap: 24px;
            padding: 24px;
            background: #F8F9FA;
            border-radius: 12px;
        }

        .room-image {
            width: 280px;
            height: 186px;
            border-radius: 8px;
            overflow: hidden;
            position: relative;
        }

        .room-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .room-image .photo-count {
            position: absolute;
            right: 8px;
            bottom: 8px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
        }

        .room-info {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .room-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 16px;
        }

        .room-name {
            font-size: 18px;
            font-weight: 600;
            color: #333;
        }

        .room-detail-link {
            color: #2B96ED;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
        }

        .room-detail-link:hover {
            text-decoration: underline;
        }

        .room-time {
            color: #666;
            font-size: 14px;
            margin-bottom: 12px;
        }

        .room-features {
            color: #666;
            font-size: 14px;
            margin-bottom: 16px;
        }

        .room-price-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: auto;
        }

        .room-price {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .price-amount {
            font-size: 20px;
            font-weight: 600;
            color: #333;
        }

        .price-text {
            flex: 1;
            text-align: left;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            overflow: auto;
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            height: 80%;
            max-width: 1000px;
            text-align: center;
        }

        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 10px;
            right: 25px;
            transition: 0.3s;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-images {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            padding: 10px;
        }

        .modal-image {
            width: 100%;
            aspect-ratio: 1920 / 1260;
            object-fit: cover;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .modal-image:hover {
            transform: scale(1.05);
        }

        .tab-button.active {
            color: #5399F5;
            border-bottom: 2px solid #5399F5;
        }

        .tab-button:hover {
            color: #5399F5;
        }

        .review-qna-container {
            max-width: 100%;
            margin: 0 auto;
            padding: 7rem 0;
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

        .review-list {
            margin-top: 20px;
        }

        .review-item {
            padding: 1.5rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 1rem;
            background-color: #f9f9f9;
            transition: box-shadow 0.3s ease;
        }

        .review-item:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .review-user {
            font-weight: bold;
            color: #333;
        }

        .review-rating {
            color: #FFA500;
        }

        .review-date {
            font-size: 12px;
            color: #999;
        }

        .review-content {
            margin: 0.5rem 0;
            color: #555;
        }

        .review-image {
            max-width: 100%;
            border-radius: 8px;
            margin-top: 0.5rem;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .quantity-btn {
            width: 30px;
            height: 30px;
            font-size: 16px;
            border: 1px solid #ddd;
            background-color: white;
            border-radius: 4px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #5399F5;
            transition: all 0.2s ease;
        }

        .quantity-btn:hover {
            background-color: #5399F5;
            color: white;
            border-color: #5399F5;
        }

        .room-price-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: auto;
        }

        .room-price {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .price-amount {
            flex: 1;
            text-align: left;
        }

        .price-text {
            flex: 1;
            text-align: left;
        }

        .purchase {
            display: flex;
            gap: 10px;
        }

        .purchase-button {
            width: 100px;
            height: 40px;
            background-color: #5399F5;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .purchase-button:hover {
            background-color: #4285F4;
        }

    </style>

</head>
<body>

<%
    final ResortDTO resortDTO = (ResortDTO) request.getAttribute("resortDTO");
    final List<RoomDTO> roomList = (List<RoomDTO>) request.getAttribute("roomList");
    final int reviewCount = (int) request.getAttribute("reviewCount");
    final float averageRating = (float) request.getAttribute("averageRating");
    final List<ResortReviewDTO> reviewList = (List<ResortReviewDTO>) request.getAttribute("reviewList");
    final int minPrice = (int) request.getAttribute("minPrice");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Calendar calendar = Calendar.getInstance();
    String today = sdf.format(calendar.getTime());
    calendar.add(Calendar.DATE, 1);
    String tomorrow = sdf.format(calendar.getTime());

    Cookie[] cookies = request.getCookies();
    String userId = null;
    int uuid = -1;

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user_id")) {
                userId = cookie.getValue();
                break;
            }
        }
    }

    if (userId != null) {
        UsersDao usersDao = UsersDao.getInstance();
        uuid = usersDao.getUUID(userId);
    }
%>

<div id="photoModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="modal-images">
            <img id="modalImage1" src="" alt="modalImage" class="modal-image">
            <img id="modalImage2" src="" alt="modalImage" class="modal-image">
            <img id="modalImage3" src="" alt="modalImage" class="modal-image">
            <img id="modalImage4" src="" alt="modalImage" class="modal-image">
        </div>
    </div>
</div>

<div class="container">
    
<jsp:include page="/header.jsp"/>

    <div class="content-wrapper">
        <div class="search-info-box">
            <div class="search">
                <i class="fas fa-search"></i>
                <input type="text" name="search"
                       placeholder="${requestScope.resortDTO.name != null ? requestScope.resortDTO.name : '검색어를 입력하세요.'}"/>
            </div>
            <div class="search-date">
                <input type="text" id="datePickerInput" value="<%= today %> - <%= tomorrow %>" readonly
                       style="border: none; background-color: transparent; color: #333; cursor: pointer;"/>
            </div>
            <div class="search-maxGuest">인원 2</div>
        </div>

        <c:choose>
        <c:when test="${not empty requestScope.resortDTO}">
        <div class="image-container">
            <div class="image-grid">
                <div class="main-image">
                    <img src="${requestScope.resortDTO.remain_img}" alt="mainImage">
                </div>
                <div class="sub-images">
                    <div class="sub-image-top">
                        <img src="${requestScope.resortDTO.resub_img1}" alt="subImage">
                        <img src="${requestScope.resortDTO.resub_img2}" alt="subImage">
                    </div>
                    <div class="sub-image-bottom">
                        <img src="${requestScope.resortDTO.resub_img3}" alt="subImage">
                    </div>
                </div>
                <div class="more-photos" onclick=
                        "openModal('${requestScope.resortDTO.remain_img},${requestScope.resortDTO.resub_img1},${requestScope.resortDTO.resub_img2},${requestScope.resortDTO.resub_img3}')">
                    <i class="fas fa-images"></i>사진 더보기
                </div>
            </div>
        </div>

        <div class="resort-info">
            <h1 class="resort-title">${requestScope.resortDTO.name}</h1>
            <div class="review-count">
                <i class="fas fa-star"></i>
                <span><fmt:formatNumber value="${requestScope.averageRating}" type="number"
                                        maxFractionDigits="2"/></span>
                <span>(<fmt:formatNumber value="${requestScope.reviewCount}" pattern="#,###"/>개 평가)</span>
            </div>
            <div class="resort-price">
                <fmt:formatNumber value="${requestScope.minPrice}" pattern="#,###"/><span> 원~</span>
            </div>
            <div class="service-icons">
                <c:choose>
                    <c:when test="${not empty requestScope.resortList}">
                        <c:forEach var="facility" items="${requestScope.resortList}">
                            <div class="service-item">
                                <i class="${facility.icon}"></i>
                                <span>${facility.name}</span>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="service-item">시설이 없습니다.</div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="room-selection">
            <h2>객실 선택</h2>
            <div class="room-list">
                <c:choose>
                    <c:when test="${not empty requestScope.roomList}">
                        <c:forEach var="item" items="${requestScope.roomList}">
                            <div class="room-item">
                                <div class="room-image">
                                    <img src="${item.rmain_img}" alt="${item.room_name}">
                                </div>
                                <div class="room-info">
                                    <div>
                                        <div class="room-header">
                                            <div class="room-name">[${requestScope.resortDTO.check_time}시
                                                체크인] ${item.room_name}</div>
                                            <a class="room-detail-link"
                                               onclick="openModal('${item.rmain_img},${item.rsub_img1},${item.rsub_img2},${item.rsub_img3}')">상세
                                                정보 ></a>
                                        </div>
                                        <div class="room-time">
                                            <i class="far fa-clock"></i>
                                            입실 ${requestScope.resortDTO.check_time}:00 / 퇴실 12:00
                                        </div>
                                        <div class="room-features">
                                            <div>기준 2인 / 최대 ${item.max_guests}인</div>
                                            <div>${item.description}</div>
                                        </div>
                                    </div>
                                    <div class="room-price-section">
                                        <div class="room-price">
                                            <div class="price-amount">
                                                <fmt:formatNumber value="${item.price_per_night}" pattern="#,###"
                                                                  var="formattedPrice"/>
                                                <span class="price-text">${formattedPrice}원</span>
                                            </div>
                                        </div>
                                        <div class="purchase">
                                            <div class="quantity-control">
                                                <button type="button" class="quantity-btn minus-btn">-</button>
                                                <span class="quantity" data-quantity="1">1</span>
                                                <button type="button" class="quantity-btn plus-btn">+</button>
                                            </div>
                                            <button class="purchase-button"
                                                    onclick="validateAndSubmit(true, '${item.room_id}', ${item.price_per_night}, ${requestScope.resortDTO.check_time})">
                                                장바구니
                                            </button>
                                            <button class="purchase-button"
                                                    onclick="validateAndSubmit(false, '${item.room_id}', ${item.price_per_night}, ${requestScope.resortDTO.check_time})">
                                                바로 예약
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div style="text-align: center; padding: 40px; color: #666;">
                            현재 예약 가능한 객실이 없습니다.
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="review-qna-container">
            <div class="tab-container">
                <button class="tab-button active" onclick="showTab('review')">리뷰</button>
                <button class="tab-button" onclick="showTab('qna')">Q&A</button>
            </div>

            <div id="review-section" class="tab-content">
                <div class="review-list">
                    <div class="review_amount">
                        <h3>리뷰 ${requestScope.reviewCount} 건</h3>
                    </div>
                    <c:forEach var="review" items="${requestScope.reviewList}">
                        <div class="review-item">
                            <div class="review-header">
                                <span class="review-user">${review.name}</span>
                                <span class="review-rating">
                                    <i class="fas fa-star" style="color: #FFA500;"></i>
                                    <fmt:formatNumber value="${review.rating}" type="number" maxFractionDigits="1"/>
                                </span>
                                <span class="review-date">${review.created_at}</span>
                            </div>
                            <div class="review-content">
                                <p>${review.resort_comment}</p>
                            </div>
                            <c:if test="${not empty review.review_img}">
                                <img src="${review.review_img}" alt="Review Image" class="review-image"/>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div id="qna-section" class="tab-content" style="display: none;">
            <div class="qna-list">
                <div class="qna-amount">\
                        <%--                    <h3>qna #{qweqwe} 건</h3>--%>
                </div>

            </div>
        </div>
    </div>
    </c:when>
    <c:otherwise>
        <div style="text-align: center; padding: 100px 0; color: #666;">
            <i class="fas fa-exclamation-circle" style="font-size: 48px; margin-bottom: 20px;"></i>
            <p>리조트 정보를 찾을 수 없습니다.</p>
        </div>
    </c:otherwise>
    </c:choose>

</div>

<jsp:include page="/footer.jsp"/>
<script>
    let startDate = null;
    let endDate = null;
    const uuid = <%= uuid %>;

    document.querySelectorAll('.room-item').forEach(item => {
        let quantity = 1; // 기본 수량

        // 수량 증가 버튼 클릭 이벤트
        const plusBtn = item.querySelector('.plus-btn');
        if (plusBtn) {
            plusBtn.addEventListener('click', () => {
                quantity++;
                item.querySelector('.quantity').textContent = quantity;
                item.querySelector('.quantity').setAttribute('data-quantity', quantity);
            });
        }

        // 수량 감소 버튼 클릭 이벤트
        const minusBtn = item.querySelector('.minus-btn');
        if (minusBtn) {
            minusBtn.addEventListener('click', () => {
                if (quantity > 1) {
                    quantity--;
                    item.querySelector('.quantity').textContent = quantity;
                    item.querySelector('.quantity').setAttribute('data-quantity', quantity);
                }
            });
        }


    });


    // 예약을 처리하는 함수
    function validateAndSubmit(isCart, roomId, price, startTime) {
        if (uuid === -1) {
            alert('로그인이 필요합니다.');
            return;
        }
        const dateInput = document.getElementById("datePickerInput");
        if (!dateInput || !dateInput.value.includes(" - ")) {
            alert("날짜를 선택해 주세요.");
            return;
        }

        const quantityElement = document.querySelector('.quantity');
        const quantity = parseInt(quantityElement.getAttribute('data-quantity'));

        const [startDate, endDate] = dateInput.value.split(" - ");
        const start = new Date(startDate);
        const end = new Date(endDate);
        const timeDifference = end - start; //밀리초 단위로 차이
        const daysDifference = timeDifference / (1000 * 3600 * 24); //일별로 차이
        const totalPrice = daysDifference * price * quantity; //총 금액

        const roomTimeElement = document.querySelector('.room-time');
        const checkTime = roomTimeElement ? roomTimeElement.textContent : 10; // 기본 체크인 시간

        // 폼 생성
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = isCart ? '/test/resort/cart' : '/test/resort/payment'; // 서버의 결제 처리 URL

        // 폼 필드 추가
        const fields = [
            {name: 'roomId', value: roomId},
            {name: 'price', value: totalPrice},
            {name: 'quantity', value: quantity},
            {name: 'startDate', value: startDate},
            {name: 'endDate', value: endDate},
            {name: 'startTime', value: startTime},
            {name: 'uuid', value: uuid}
        ];

        fields.forEach(field => {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = field.name;
            input.value = field.value;
            form.appendChild(input);
        });

        document.body.appendChild(form);
        form.submit(); // 폼 제출
    }


    <%--function handleSearch() {--%>
    <%--    const searchInput = document.getElementById('searchResort');--%>
    <%--    const searchValue = searchInput.value.trim();--%>

    <%--    if (searchValue) {--%>
    <%--        window.location.href = '${pageContext.request.contextPath}/rental/search?keyword=' + encodeURIComponent(searchValue);--%>
    <%--    }--%>
    <%--}--%>

    <%--document.addEventListener('DOMContentLoaded', function () {--%>
    <%--    const searchIcon = document.querySelector('.search i');--%>
    <%--    const searchInput = document.getElementById('searchResort');--%>

    <%--    searchIcon.addEventListener('click', handleSearch);--%>

    <%--    searchInput.addEventListener('keypress', function (e) {--%>
    <%--        if (e.key === 'Enter') {--%>
    <%--            handleSearch();--%>
    <%--        }--%>
    <%--    });--%>
    <%--});--%>


    flatpickr("#datePickerInput", {
        mode: "range",
        dateFormat: "Y-m-d",
        locale: "ko",
        onClose: function (selectedDates) {
            if (selectedDates.length === 2) {
                let startDate = selectedDates[0].toLocaleDateString('ko-KR', {
                    year: 'numeric',
                    month: '2-digit',
                    day: '2-digit'
                }).replace(/\. /g, '-').replace('.', '');

                let endDate = selectedDates[1].toLocaleDateString('ko-KR', {
                    year: 'numeric',
                    month: '2-digit',
                    day: '2-digit'
                }).replace(/\. /g, '-').replace('.', '');

                document.getElementById("datePickerInput").value = startDate + " - " + endDate;
            }
        }
    });


    function openModal(images) {
        const modalImages = images.split(','); // 이미지 URL을 ','를 기준으로 배열로 변환
        document.getElementById("modalImage1").src = modalImages[0];
        document.getElementById("modalImage2").src = modalImages[1];
        document.getElementById("modalImage3").src = modalImages[2];
        document.getElementById("modalImage4").src = modalImages[3];
        document.getElementById("photoModal").style.display = "block"; // 모달 열기
    }

    // 모달 밖을 클릭하면 닫기
    window.onclick = function (event) {
        if (event.target === document.getElementById("photoModal")) {
            document.getElementById("photoModal").style.display = "none";
        }
    }

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