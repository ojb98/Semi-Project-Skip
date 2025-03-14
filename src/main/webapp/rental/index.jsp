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
<%-- TODO: 스키,렌탈샵 리뷰추가 --%>
<a href="<%=request.getContextPath()%>/rental/rentalShop?rentalshop_id=1&isRentalOrSki=rental">rental</a>
<br>
<br>
<a href="<%=request.getContextPath()%>/rental/rentalShop?ski_id=2&isRentalOrSki=ski">ski</a>
<br>
<br>
<%-- TODO: facility들 추가 --%>
<a href="<%=request.getContextPath()%>/rental/resort?resort_id=1">resort</a>


</body>
</html>
