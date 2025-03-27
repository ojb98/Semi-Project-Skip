<<<<<<< HEAD
=======
<%@page import="users.dao.UsersDao"%>
>>>>>>> d0835b37303487453d57cd028ddc2417316c8ece
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>test</title>
</head>
<body>
<%
    // 모든 쿠키를 가져옴
    Cookie[] cookies = request.getCookies();
    String userId = null;
    Integer uuid = -1;

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
        out.println("User ID: " + userId);
        out.println("uuid: " + uuid);
    } else {
        out.println("User ID not found in cookies.");
    }
%>

<a href = "<%=request.getContextPath()%>/login">로그인테스트으으으으ㅡ</a>
<br>
<br>
<a href = "<%=request.getContextPath()%>/logout">로그아아ㅏ앙아아ㅜㅅ</a>
<br>
<br>
<%-- TODO: 스키,렌탈샵 리뷰추가 --%>
<a href="<%=request.getContextPath()%>/rental/rentalShop?rentalshop_id=1&isRentalOrSki=RENTAL">rental</a>
<a href="<%=request.getContextPath()%>/rental/rentalShop?rentalshop_id=2&isRentalOrSki=RENTAL">renta2</a>
<a href="<%=request.getContextPath()%>/rental/rentalShop?rentalshop_id=3&isRentalOrSki=RENTAL">renta3</a>
<br>
<br>
<a href="<%=request.getContextPath()%>/rental/rentalShop?ski_id=1&isRentalOrSki=SKI">ski1</a>
<a href="<%=request.getContextPath()%>/rental/rentalShop?ski_id=2&isRentalOrSki=SKI">ski2</a>
<a href="<%=request.getContextPath()%>/rental/rentalShop?ski_id=3&isRentalOrSki=SKI">ski3</a>
<br>
<br>
<%-- TODO: ROOM_RESERVATION 테이블 추가 PAYMENTS 추가 RESORT_REVIEWS 추가 후 resortDetail수정--%>
<a href="<%=request.getContextPath()%>/rental/resort?resort_id=1">resort1</a>
<a href="<%=request.getContextPath()%>/rental/resort?resort_id=2">resort2</a>
<a href="<%=request.getContextPath()%>/rental/resort?resort_id=3">resort3</a>

<br>
<a href = "<%=request.getContextPath()%>/wishSelect?uuid=<%=uuid%>">찜목록</a>
<br>
<br>
<a href = "<%=request.getContextPath()%>/cartSelect?uuid=<%=uuid%>">장바구니</a>

</body>
</html>
