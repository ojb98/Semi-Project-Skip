<%@ page import="dao.UsersDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/font.css">
</head>
<body>
<style>
    .save_container {
        width: 1230px;
        margin: 50px auto;
    }

    .save_container .save_title {
        display: flex;
        justify-content: space-between;
    }

    .save_container .save_title h2 {
        display: inline-block;
        padding: 10px 40px;
        border-radius: 10px;
        background-color: #5399f5;
        color: #fff;
    }

    /* save_box */
    .save_box {
        margin-top: 20px;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-column-gap: 20px;
        grid-row-gap: 30px;
    }

    .save_item {
        position: relative;
    }

    .save_item .heart_btn {
        position: absolute;
        top: 15px;
        right: 15px;
        font-size: 24px;
    }

    .save_item .item_img {
        height: 260px;
        border-radius: 10px;
    }

    .save_item .item_img:hover {
        background-size: 120%;
    }

    .save_item .item_text h4 {
        font-size: 12px;
        color: #6f7077;
        margin: 20px 0 10px 0;
    }

    .item_text .item_bottom {
        display: flex;
        justify-content: space-between;
    }

    .item_bottom .left {
        display: flex;
    }

    .item_bottom .left h3 {
        margin-right: 5px;
    }

</style>
<!-- header -->
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
                        <a href="#none">로그인</a>
                    </li>
                    <li>
                        <a href="#none">로그아웃</a>
                    </li>
                    <li>
                        <a href="#none">마이페이지</a>
                    </li>
                    <li>
                        <a href="save.html">찜</a>
                    </li>
                    <li>
                        <a href="cart.html">장바구니</a>
                    </li>
                </ul>
            </div>
    </nav>
</header>

<!-- main-->
<main>

    <%
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
            UsersDao usersDao = new UsersDao();
            uuid = usersDao.getUUID(userId);
        }

    %>

    <div class="save_container">
        <div class="save_title">
            <h2>찜</h2>
        </div>
        <div class="save_box">
            <c:choose>
                <c:when test="${not empty requestScope.wishList}">
                    <c:forEach var="wish" items="${requestScope.wishList}">
                        <a href="${pageContext.request.contextPath}${wish.link}" class="save_item">
                            <div class="item-box">
                                <div class="main-image">
                                    <img src="${wish.mainImg}"/>
                                </div>
                                <div class="item_text">
                                    <h4>${wish.category}</h4>
                                    <div class="item_bottom">
                                        <div class="left">
                                            <h3>${wish.name}</h3>
                                            <span class="rating"><i class="fa fa-star"></i>${wish.rating}</span>
                                        </div>
                                        <div class="right">
                                            <span>${wish.price}</span>
                                        </div>
                                    </div>
                                </div>
                                <span class="heart_btn fa-heart-active"><i
                                        class="fa fa-heart fa-heart-active"></i></span>
                            </div>
                        </a>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>현재 찜 목록이 비었음</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>


<!-- footer -->
<footer>
    <div class="footer_inner">
        <div class="footer_top">
            <div class="footer_left">
                <a href="#none">회사소개</a>
                <a href="#none">이용약관</a>
                <a href="#none">개인정보 처리방침</a>
                <a href="#none">찾아오시는 길</a>
            </div>
            <div class="footer_right">
                <a href="#none" class="sns blog"></a>
                <a href="#none" class="sns kakao"></a>
                <a href="#none" class="sns instagram"></a>
            </div>
        </div>

        <div class="footer_bottom">
            <p class="footer_title">SKI:P</p>
            <p>사업자 등록번호: 123-45-67890</p>
            <p>COPYRIGHT ⓒ TRAVLE CO., LTD. ALL RIGHTS RESERVED.</p>
        </div>
    </div>
</footer>

<script>
    const hearts = document.querySelectorAll(".fa-heart");

    hearts.forEach(function (heart) {
        heart.addEventListener("click", function () {
            this.classList.toggle("fa-heart-active");
        });
    });

    const heartBtns = document.querySelectorAll('.heart_btn');

    heartBtns.forEach(btn => {
        btn.addEventListener("click", function (event) {
            event.preventDefault(); // a 태그 이동 막기
            this.classList.toggle("fa-heart-active"); // 토글 효과 적용
        });
    });

</script>
</body>

</html>
</body>
</html>
