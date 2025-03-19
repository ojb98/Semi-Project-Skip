<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="dto.RentItemDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UsersDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>s</title>
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

        .nav {
            background: white;
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .nav-logo {
            color: #5399F5;
            text-decoration: none;
            font-weight: 800;
            font-size: 2rem;
            font-style: italic;
        }

        .nav-menu {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .nav-menu a {
            color: black;
            text-decoration: none;
            font-weight: 600;
            padding: 0.4rem 1rem;
            border-radius: 12px;
            transition: all 0.2s ease-in-out;
        }

        .nav-menu a:hover {
            background: rgba(66, 133, 244, 0.08);
            color: #4285F4;
        }

        .body-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            max-width: 1100px;
            min-height: 660px;
            background-color: white;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            margin: 0 auto;
            padding: 2rem;
        }

        .main-image {
            width: 48%;
            height: auto;
            border: white;
            padding: 2rem;
        }

        .main-image img {
            width: 100%;
            aspect-ratio: 1 / 1;
            object-fit: cover;
            border: 1px solid rgba(0, 0, 0, 0.18);
            border-radius: 12px;
        }

        .description {
            width: 52%;
            height: auto;
            min-height: 600px;
            border: white;
            padding: 2rem;
            overflow: visible;
        }

        .pr {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            margin-bottom: 15px;
        }

        .select-item {
            margin-bottom: 5px;
            width: 100%;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        input[type="date"] {
            position: relative;
            min-height: 40px;
            padding: 10px;
            background-color: #fff;
            color: #666;
        }

        input[type="date"]::-webkit-calendar-picker-indicator {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        input[type="date"]:before {
            content: attr(placeholder);
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #666;
            font-size: 14px;
        }

        input[type="date"]:valid:before,
        input[type="date"]:focus:before {
            display: none;
        }

        .item-list {
            margin-top: 20px;
            border-top: 1px solid #eee;
            max-height: 200px;
            width: 100%;
            overflow-y: auto;
            overflow-x: hidden;
            padding: 10px 0;
        }

        .item-list-object {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 15px;
            margin-bottom: 10px;
            background-color: #f8f9fa;
            border-radius: 6px;
            border: 1px solid #eee;
            width: 100%;
            min-width: auto;
        }

        .item-info {
            display: flex;
            align-items: center;
            gap: 10px;
            width: 45%;
            min-width: 0;
        }

        .item-name, .item-time {
            font-size: 13px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 8px;
            margin: 0 10px;
            width: auto;
            min-width: 90px;
        }

        .quantity-btn {
            width: 25px;
            height: 25px;
            border: 1px solid #ddd;
            background-color: white;
            border-radius: 4px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            color: #5399F5;
            transition: all 0.2s ease;
        }

        .quantity-btn:hover {
            background-color: #5399F5;
            color: white;
            border-color: #5399F5;
        }

        .quantity {
            font-size: 14px;
            color: #333;
            min-width: 20px;
            text-align: center;
        }

        .item-price {
            min-width: 100px;
            text-align: right;
            margin-right: 10px;
            font-size: 13px;
        }

        .delete-btn {
            width: 28px;
            height: 28px;
            padding: 0;
            border: none;
            background: none;
            color: #999;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }

        .delete-btn:hover {
            background-color: #ffebee;
            color: #e53935;
        }

        .total-price {
            margin-top: 15px;
            text-align: right;
            font-weight: bold;
            font-size: 20px;
            color: #5399F5;
            padding: 15px 0;
            border-top: 2px solid #eee;
        }

        .purchase {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 100%;
            margin-top: 20px;
        }

        .purchase-left button,
        .purchase-right button {
            width: 200px;
            height: 50px;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .purchase-left button {
            background-color: white;
            color: #5399F5;
            border: 1px solid #5399F5;
        }

        .purchase-right button {
            background-color: #5399F5;
            color: white;
            border: 1px solid #5399F5;
        }

        .purchase button:hover {
            background-color: #1967D2;
            border-color: #1967D2;
            color: white;
        }

        /* items 섹션 스타일 추가 */
        .items {
            max-width: 1100px;
            margin: 2rem auto;
            padding: 2rem;
        }

        .items h1 {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 2rem;
            color: #333;
        }

        .items-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
        }

        .item-card {
            position: relative;
            border: 1px solid #eee;
            border-radius: 12px;
            overflow: hidden;
            background: white;
            transition: all 0.2s ease;
            padding: 1.5rem;
        }

        .item-card::before {
            content: attr(data-number);
            position: absolute;
            top: 1rem;
            left: 1rem;
            width: 2rem;
            height: 2rem;
            background: #5399F5;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 0.9rem;
            z-index: 1;
        }

        .item-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .item-card img {
            width: 100%;
            aspect-ratio: 1;
            object-fit: contain;
            background: #f8f9fa;
            border-radius: 8px;
        }

        .item-card .item-info {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .item-card .item-name {
            font-size: 1rem;
            font-weight: 600;
            color: #333;
        }

        .item-card .item-detail {
            font-size: 0.9rem;
            color: #666;
            line-height: 1.4;
        }

        .heart-container {
            position: absolute;
            bottom: 10px;
            right: 10px;
            z-index: 1;
        }

        .heart-button {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 30px;
            color: #999; /* 기본 색상 */
            transition: color 0.3s ease;
        }

        .heart-icon.fas {
            color: red;  /* 붉은색으로 지정 */
        }

        .heart-button.active .heart-icon {
            color: red; /* 활성화된 상태의 색상 */
        }
    </style>
</head>
<body>
<div class="container">
    <nav class="nav">
        <div class="nav-container">
            <a href="${pageContext.request.contextPath}/" class="nav-logo">SKI:P</a>
            <ul class="nav-menu">
                <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                <li><a href="${pageContext.request.contextPath}/favorite">찜</a></li>
                <li><a href="${pageContext.request.contextPath}/myPage">마이페이지</a></li>
                <li><a href="${pageContext.request.contextPath}/market">장바구니</a></li>
            </ul>
        </div>
    </nav>

    <%
        int img_num = (int) request.getAttribute("img_num");
        String[] arr = {"리프트권", "패키지", "스키", "보드", "보호구", "상의", "하의", "신발"};
        int index = img_num - 1;
        request.setAttribute("arr", arr);
        request.setAttribute("index", index);
        final String isRentalOrSki = (String) request.getAttribute("isRentalOrSki");
        System.out.println(isRentalOrSki + "88888888888888");

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

    <div class="body-container">
        <div class="main-image">
            <img src="../rentMainImage/main<%=img_num%>.jpg" alt="${arr[index]}">
        </div>
        <div class="description">

            <c:choose>
                <c:when test="${index <= 1}">
                    <h2>${arr[index]} 구매</h2>
                </c:when>
                <c:otherwise>
                    <h2>${arr[index]} 대여</h2>
                </c:otherwise>
            </c:choose>


            <div class="select-item">
                <form method="post" action="#">
                    <%
                        int price_per_hour = (request.getAttribute("price_per_hour") != null)
                                ? (int) request.getAttribute("price_per_hour") : 0;
                        request.setAttribute("price_per_hour", price_per_hour);
                    %>
                    <div class="pr" data-price="${requestScope.price_per_hour}">
                        ${requestScope.price_per_hour}원
                    </div>

                    <div class="date">
                        <label>이용날짜</label><br>
                        <input type="date" id="selectDate" placeholder="이용하실 날짜를 선택해주세요"/>
                    </div>

                    <div class="item">
                        <label>장비선택</label><br>
                        <select name="아이템" id="item-select">
                            <option value="">장비를 선택하세요</option>
                            <jsp:useBean id="list" scope="request" type="java.util.List"/>
                            <c:choose>
                                <c:when test="${not empty list}">
                                    <c:forEach var="item" items="${list}" varStatus="status">
                                        <option value="${item.item_id}"
                                                data-name="${item.item_id}">${(status.index + 1)}</option>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <option value="">장비가 없습니다.</option>
                                </c:otherwise>
                            </c:choose>

                        </select>
                    </div>

                    <div class="time">
                        <label>이용타임</label><br>
                        <div style="display: flex; gap: 10px; align-items: center;">
                            <select name="startTime" id="startTime" style="flex: 1;">
                                <option value="">시작 시간</option>
                                <c:forEach begin="9" end="24" varStatus="status">
                                    <option value="${status.index}">${status.index}:00</option>
                                </c:forEach>
                            </select>
                            <span style="color: #666;">~</span>
                            <select name="endTime" id="endTime" style="flex: 1;">
                                <option value="">종료 시간</option>
                            </select>
                        </div>
                    </div>

                    <div class="item-list">
                        <div class="item-list-object">
                        </div>
                        <div class="time-select"></div>
                    </div>

                    <div class="total-price" id="total-price">0원</div>

                    <div class="purchase">
                        <div class="purchase-left">
                            <button>
                                <i class="fas fa-shopping-cart"></i> 장바구니
                            </button>
                        </div>

                        <div class="purchase-right">
                            <button>
                                <i class="fa-solid fa-credit-card"></i> 바로예약
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="items">
        <c:choose>
            <c:when test="${index > 1}">
                <h1>${arr[index]} 장비 옵션</h1>
            </c:when>
            <c:otherwise>
                <h1>${arr[index]} 구매</h1>
            </c:otherwise>
        </c:choose>
        <div class="items-grid">
            <c:choose>
                <c:when test="${not empty list}">
                    <c:forEach var="item" items="${list}" varStatus="status">
                        <div class="item-card" data-number="${status.index + 1}">
                            <img src="${item.item_img}" alt="장비 이미지"/>
                            <div class="heart-container">
                                <button class="heart-button" data-item-id="${item.item_id}">
                                    <i class="far fa-heart heart-icon"></i>
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div style="grid-column: 1 / -1; text-align: center; padding: 2rem;">
                        <h2>현재 등록된 아이템이 없습니다.</h2>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>

<script>
    let totalPrice = 0;
    let selectedItems = new Map();
    const uuid = <%= uuid %>;
    const isRentalOrSki = '<%=isRentalOrSki%>';
    console.log(isRentalOrSki);
    const pricePerHour = parseInt(document.querySelector('.pr').dataset.price);

    document.addEventListener('DOMContentLoaded', function () {
        const today = new Date();
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, '0');
        const day = String(today.getDate()).padStart(2, '0');
        const formattedDate = `${year}-${month}-${day}`;
        const dateInput = document.getElementById('selectDate');
        dateInput.value = formattedDate;

        const itemList = document.querySelector('.item-list');
        itemList.innerHTML = '';
        updateTotalPrice();

        document.getElementById('startTime').addEventListener('change', function () {
            const startTime = parseInt(this.value);
            const endTimeSelect = document.getElementById('endTime');
            endTimeSelect.innerHTML = '<option value="">종료 시간</option>';

            if (startTime) {
                const maxHours = Math.min(startTime + 8, 22);
                for (let i = startTime + 2; i <= maxHours; i += 2) {
                    const option = document.createElement('option');
                    option.value = i;
                    option.textContent = i + ':00';
                    endTimeSelect.appendChild(option);
                }
            }
        });

        document.querySelector('.purchase-left button').addEventListener('click', function (e) {
            e.preventDefault();
            if (uuid === -1) {
                alert('로그인이 필요합니다.');
                return;
            }
            validateAndSubmit('cart');
        });

        document.querySelector('.purchase-right button').addEventListener('click', function (e) {
            e.preventDefault();
            validateAndSubmit('payment');
        });

        const selectButton = document.createElement('button');
        selectButton.type = 'button';
        selectButton.className = 'select-btn';
        selectButton.textContent = '선택';
        selectButton.style.cssText = `
            padding: 8px 16px;
            background-color: #5399F5;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            width: 100%;
        `;
        document.getElementById('endTime').parentNode.parentNode.appendChild(selectButton);

        selectButton.addEventListener('click', function (e) {
            e.preventDefault();
            addItem();
        });

        const heartButtons = document.querySelectorAll('.heart-button');

        heartButtons.forEach(button => {
            button.addEventListener('click', function () {
                const itemId = this.getAttribute('data-item-id');
                if (uuid === -1) {
                    alert('로그인이 필요합니다.');
                    return;
                }
                const heartIcon = this.querySelector('.heart-icon');
                const url = '/wish';

                let isWish = heartIcon.classList.contains('far');
                heartIcon.classList.toggle('fas', isWish);
                heartIcon.classList.toggle('far', !isWish);

                fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        isWish: isWish,  // 찜 상태 (true -> 찜 추가, false -> 찜 삭제)
                        uuid: uuid,      // 사용자 uuid
                        ref_id: itemId,  // 아이템 ID
                        isRentalOrSki: isRentalOrSki  // 카테고리 (렌탈, 스키 등)
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        if (!data.success) {
                            alert('처리 중 오류가 발생했습니다.');
                            // 실패하면 원래 상태로 되돌리기
                            heartIcon.classList.toggle('fas');
                            heartIcon.classList.toggle('far');
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('서버와의 통신에 실패했습니다.');
                    });
            });
        });

        // 페이지 로드 시 서버에서 찜 목록 불러오기
        window.addEventListener('load', () => {
            fetch('/wish?uuid=' + uuid)
                .then(response => response.json())
                .then(data => {
                    const wishList = data.wishList || [];
                    heartButtons.forEach(button => {
                        const itemId = button.getAttribute('data-item-id');
                        const heartIcon = button.querySelector('.heart-icon');
                        if (wishList.includes(parseInt(itemId))) {
                            heartIcon.classList.add('fas');  // 찜한 상태
                            heartIcon.classList.remove('far');  // 빈 하트 제거
                        } else {
                            heartIcon.classList.add('far');  // 찜하지 않은 상태
                            heartIcon.classList.remove('fas');  // 채워진 하트 제거
                        }
                    });
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        });
    });

    function addItem() {
        const itemSelect = document.getElementById('item-select');
        const startTimeSelect = document.getElementById('startTime');
        const endTimeSelect = document.getElementById('endTime');

        if (!itemSelect.value || !startTimeSelect.value || !endTimeSelect.value) {
            alert('장비와 이용시간을 선택해주세요.');
            return;
        }

        const selectedItem = itemSelect.options[itemSelect.selectedIndex].text;
        const startTime = parseInt(startTimeSelect.value);
        const endTime = parseInt(endTimeSelect.value);
        const hours = endTime - startTime;
        const itemPrice = pricePerHour * hours;

        const itemElement = document.createElement('div');
        itemElement.className = 'item-list-object';
        itemElement.dataset.itemId = itemSelect.value;

        const html = '<div class="item-info">' +
            '<span class="item-name">' + selectedItem + '번 장비</span>' +
            '<span class="item-time">' + startTime + '시 ~ ' + endTime + '시 (' + hours + '시간)</span>' +
            '</div>' +
            '<div class="quantity-control">' +
            '<button type="button" class="quantity-btn minus-btn">-</button>' +
            '<span class="quantity">1</span>' +
            '<button type="button" class="quantity-btn plus-btn">+</button>' +
            '</div>' +
            '<span class="item-price">' + itemPrice.toLocaleString() + '원</span>' +
            '<button type="button" class="delete-btn"><i class="fas fa-times"></i></button>'

        itemElement.innerHTML = html;

        const itemList = document.querySelector('.item-list');
        itemList.appendChild(itemElement);

        const minusBtn = itemElement.querySelector('.minus-btn');
        const plusBtn = itemElement.querySelector('.plus-btn');
        const deleteBtn = itemElement.querySelector('.delete-btn');

        minusBtn.addEventListener('click', () => changeQuantity(itemElement, -1));
        plusBtn.addEventListener('click', () => changeQuantity(itemElement, 1));
        deleteBtn.addEventListener('click', () => deleteOption(deleteBtn));

        selectedItems.set(itemSelect.value, {
            quantity: 1,
            startTime: startTime,
            endTime: endTime,
            hours: hours,
            basePrice: itemPrice,
            name: selectedItem
        });

        totalPrice += itemPrice;
        updateTotalPrice();

        itemSelect.value = '';
        startTimeSelect.value = '';
        endTimeSelect.innerHTML = '<option value="">종료 시간</option>';
    }

    function changeQuantity(itemElement, change) {
        const quantityElement = itemElement.querySelector('.quantity');
        const priceElement = itemElement.querySelector('.item-price');
        const itemId = itemElement.dataset.itemId;
        const itemData = selectedItems.get(itemId);

        if (!itemData) return;

        const newQuantity = itemData.quantity + change;
        if (newQuantity < 1 || newQuantity > 10) {
            alert('수량은 1~10개까지만 선택 가능합니다.');
            return;
        }

        totalPrice -= itemData.basePrice * itemData.quantity;

        itemData.quantity = newQuantity;
        selectedItems.set(itemId, itemData);

        quantityElement.textContent = newQuantity;
        const newPrice = itemData.basePrice * newQuantity;
        priceElement.textContent = newPrice.toLocaleString() + '원';

        totalPrice += itemData.basePrice * newQuantity;
        updateTotalPrice();
    }

    function deleteOption(button) {
        const itemElement = button.closest('.item-list-object');
        const itemId = itemElement.dataset.itemId;
        const itemData = selectedItems.get(itemId);

        if (itemData) {
            totalPrice -= itemData.basePrice * itemData.quantity;
            selectedItems.delete(itemId);
            updateTotalPrice();
        }

        itemElement.remove();
    }

    function updateTotalPrice() {
        const priceElement = document.getElementById('total-price');
        if (priceElement) {
            priceElement.textContent = '총 금액: ' + totalPrice.toLocaleString() + '원';
            priceElement.style.fontSize = '20px';
            priceElement.style.fontWeight = 'bold';
            priceElement.style.color = '#5399F5';
            priceElement.style.padding = '15px 0';
            priceElement.style.borderTop = '2px solid #eee';
            priceElement.style.marginTop = '20px';
        }
    }

    function validateAndSubmit(type) {
        const dateInput = document.getElementById('selectDate');
        const itemCount = selectedItems.size;

        if (!dateInput.value) {
            alert('이용하실 날짜를 선택해주세요.');
            dateInput.focus();
            return;
        }

        if (itemCount === 0) {
            alert('최소 1개 이상의 장비를 선택해주세요.');
            return;
        }

        let items = [];
        selectedItems.forEach((data, id) => {
            items.push({
                itemId: parseInt(id),
                quantity: data.quantity,
                startTime: data.startTime,
                endTime: data.endTime,
                hours: data.hours,
                price: data.basePrice * data.quantity,
            });
        });

        let url = '';
        if (type === 'cart') {
            url = '${pageContext.request.contextPath}/cart';
            alert('장바구니에 추가되었습니다.');
        } else {
            url = '${pageContext.request.contextPath}/payments';
            alert('결제 페이지로 이동합니다.');
        }

        const fields = [
            {name: 'items', value: JSON.stringify(items)},
            {name: 'totalPrice', value: totalPrice},
            {name: 'rentDate', value: dateInput.value},
            {name: 'isRentalOrSki', value: isRentalOrSki},
            {name: 'uuid', value: uuid}
        ];

        createAndSubmitForm(url, fields);
    }

    function createAndSubmitForm(url, fields) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = url;

        fields.forEach(field => {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = field.name;
            input.value = field.value;
            form.appendChild(input);
        });

        document.body.appendChild(form);
        form.submit();
    }
</script>

</body>
</html>
