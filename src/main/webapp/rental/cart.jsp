<%@page import="users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mainpage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css">
<meta charset="UTF-8">
<title>장바구니</title>
</head>

<style>
.cart_container {
	width: 700px;
	margin: 50px auto;
}

.cart_title h2 {
	font-size: 20px;
	font-weight: 700;
}

.cart_item {
	display: flex;
	margin-top: 50px;
	position: relative;
}

.cart_item .cart_checkbox {
	width: 20px;
	margin: 0 10px 0 0;
}

.cart_item::before {
	position: absolute;
	content: '';
	width: 100%;
	height: 1px;
	background-color: #ebebeb;
	top: -25px;
}

.cart_item .item_img {
	border-radius: 10px;
	width: 300px; /* 이미지 크기 고정 */
	height: 300px; /* 1:1 비율 유지 */
	overflow: hidden; /* 넘치는 부분 자르기 */
	display: flex;
	align-items: center;
	justify-content: center;
}

.cart_item .item_img img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* 원본 비율 상관없이 꽉 채우기 */
}

.cart_item .item_info {
	padding-left: 10px;
	width: 60%;
	position: relative;
}

.cart_item .item_badge {
	color: #ccc;
	font-size: 12px;
}

.cart_item .item_title_box {
	display: flex;
	gap: 7px;
	margin: 5px 0;
}

.cart_item .item_title_box h3, .cart_item .item_title_box .item_detail {
	font-weight: 700;
}

.counter {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-top: 10px;
}

.counter button {
	width: 30px;
	height: 30px;
	border: 1px solid #ddd;
	background: white;
	font-size: 16px;
	cursor: pointer;
}

.counter .count {
	font-size: 16px;
	font-weight: bold;
	width: 40px;
	text-align: center;
}

.cart_item .item_price {
	text-align: right;
	margin-top: 100px;
}

.cart_item .price {
	font-size: 18px;
	font-weight: 700;
}

.cart_info .pay_btn {
	margin-top: 50px;
}
</style>

<body>
	<!-- header -->
	<jsp:include page="/header.jsp" />

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
	}
	%>

	<!-- main -->
	<main>
		<div class="cart_container">
			<div class="cart_title">
				<h2>장바구니</h2>
			</div>
			<div class="cart_info">
				<c:choose>
					<c:when test="${not empty requestScope.cartList}">
						<c:forEach var="cart" items="${requestScope.cartList}">
							<div class="cart_item">
								<input type="checkbox" class="cart_checkbox" name="" id="">
								<div class="item_img img1">
									<img src="/test${cart.mainImg}">
								</div>
								<div class="item_info">
									<span class="item_badge">${cart.category }</span>
									<div class="item_title_box">
										<h3>${cart.name }</h3>
										<span class="rating"><i class="fa fa-star"></i>${cart.rating }</span>
									</div>
									<p class="item_detail">${cart.description }</p>
									<div class="counter">
										<button type="button" class="minus">-</button>
										<span class="count">${cart.quantity }</span>
										<button type="button" class="plus">+</button>
									</div>
									<div class="item_price">
										<p class="price">
											<fmt:formatNumber value="${cart.price}" pattern="#,###" />
											원
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<br>
						<p>장바구니에 담긴 물건이 없습니다.</p>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="pay_info">
				<h3>결제 정보</h3>
				<div class="total_price">
					<span class="label">총 결제 금액</span> <span class="value"
						id="totalPrice">0원</span>
				</div>
				<button class="pay_btn">결제하기</button>
			</div>
	</main>

	<!-- footer -->
	<jsp:include page="/footer.jsp" />

	<script>
    const uuid = <%=uuid%>;

    function calculateTotal() {
        let totalPrice = 0;

        document.querySelectorAll('.cart_item').forEach(item => {
            const checkbox = item.querySelector('.cart_checkbox');
            if (checkbox.checked) {
                const price = parseInt(item.querySelector('.price').textContent.replace(/,/g, '').replace('원', ''));
                const quantity = parseInt(item.querySelector('.count').textContent);
                totalPrice += price * quantity; 
            }
        });

        document.getElementById('totalPrice').textContent = totalPrice.toLocaleString() + '원';
    }

    function updateQuantity(item, change) {
        const countElement = item.querySelector('.count');
        let quantity = parseInt(countElement.textContent);
        quantity += change;

        if (quantity < 1) {
            quantity = 1; 
        }

        countElement.textContent = quantity;
        calculateTotal(); 
    }

    document.querySelectorAll('.cart_checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', calculateTotal);
    });

    document.querySelectorAll('.minus').forEach(button => {
        button.addEventListener('click', function () {
            const item = button.closest('.cart_item');
            updateQuantity(item, -1);
        });
    });

    document.querySelectorAll('.plus').forEach(button => {
        button.addEventListener('click', function () {
            const item = button.closest('.cart_item');
            updateQuantity(item, 1);
        });
    });

    document.querySelector('.pay_btn').addEventListener('click', function () {
        if (uuid === -1) {
            alert('로그인이 필요합니다.');
            return;
        }

        const selectedItems = [];
        document.querySelectorAll('.cart_item').forEach(item => {
            const checkbox = item.querySelector('.cart_checkbox');
            if (checkbox.checked) {
                const roomId = item.querySelector('.heart-button').getAttribute('data-room-id');
                const quantity = parseInt(item.querySelector('.count').textContent);
                selectedItems.push({ roomId, quantity });
            }
        });

        if (selectedItems.length === 0) {
            alert('선택된 아이템이 없습니다.');
            return;
        }

        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '/payments'; 
      

        /* TODO: 넘길정보 받아와야됨 */
        /* 
        const inputQuantity = document.createElement('input');
            inputQuantity.type = 'hidden';
            inputQuantity.name = 'quantity'; 
            inputQuantity.value = item.quantity;
            form.appendChild(inputQuantity);
        */

        document.body.appendChild(form);
        form.submit(); 
    });

    calculateTotal();
</script>
</body>


</html>