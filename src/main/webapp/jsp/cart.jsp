<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart.jsp</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/search.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/detail.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/save.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cart.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/pay.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">
</head>
<body>
  <!-- header -->
  <header>
    <nav class="header_nav">
      <div class="header_menu">
        <div class="header_logo">
          <h1>
            <a href="index.jsp">SKI:P</a>
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
              <a href="save.jsp">찜</a>
            </li>
            <li>
              <a href="cart.jsp">장바구니</a>
            </li>
          </ul>
        </div>
    </nav>
  </header>

  <!-- main -->
  <main>
    <div class="cart_container">
      <div class="cart_title">
        <h2>장바구니</h2>
      </div>
      <div class="cart_info">
        <div class="cart_item">
          <input type="checkbox" class="cart_checkbox" name="" id="">
          <div class="item_img img1"></div>
          <div class="item_info">
            <span class="item_badge">리조트 · 호텔</span>
            <div class="item_title_box">
              <h3>용평 리조트</h3>
              <span class="rating"><i class="fa fa-star"></i>4.6</span>
            </div>
            <p class="item_detail">그린피아 25평 (슬로프 전망)</p>
            <div class="counter">
              <button type="button" class="minus">-</button>
              <span class="count">1</span>
              <button type="button" class="plus">+</button>
            </div>
            <div class="item_price">
              <p class="price">279,000원</p>
            </div>
          </div>
        </div>
        <div class="cart_item">
          <input type="checkbox" class="cart_checkbox" name="" id="">
          <div class="item_img img2"></div>
          <div class="item_info">
            <span class="item_badge">리조트 · 호텔</span>
            <div class="item_title_box">
              <h3>용평 리조트</h3>
              <span class="rating"><i class="fa fa-star"></i>4.6</span>
            </div>
            <p class="item_detail">그린피아 25평 (슬로프 전망)</p>
            <div class="counter">
              <button type="button" class="minus">-</button>
              <span class="count">1</span>
              <button type="button" class="plus">+</button>
            </div>
            <div class="item_price">
              <p class="price">279,000원</p>
            </div>
          </div>
        </div>
        <!-- pay_info, total_price, pay_btn 영역 전체 부분 pay.jsp 에 css와 동일하게 사용-->
        <div class="pay_info">
          <h3>결제 정보</h3>
          <div class="pay_price">
            <span class="label">객실 가격(1박)</span>
            <span class="value">121,000원</span>
          </div>
          <div class="pay_discount">
            <span class="label">객실 할인 금액</span>
            <span class="value">-12,100원</span>
          </div>
        </div>
        <div class="total_price">
          <span class="lable">총 결제 금액</span>
          <span class="value">108,900원</span>
        </div>
        <button class="pay_btn"><span>108,900</span>원 결제하기</button>
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
    document.querySelector('.pay_btn').addEventListener('click', function () {
      window.location.href = 'pay.jsp'; // 원하는 경로로 이동
    });
  </script>
</body>
</html>