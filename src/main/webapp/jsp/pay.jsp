<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
              <a href="login.jsp">로그인</a>
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
    <div class="pay_container">
      <div class="pay_title">
        <h2>예약 확인 및 결제</h2>
      </div>
      <div class="pay_info">
        <h3>예약자 정보</h3>
        <h4>예약자 이름</h4>
        <input class="input_text" type="text" name="" id="">
        <h4>휴대폰 번호</h4>
        <input class="input_text" type="text" name="" id="">
      </div>
      <div class="pay_method">
        <h3>결제 수단</h3>
        <div class="method_select">
          <div class="select_item kakao_pay"></div>
          <div class="select_item">신용/체크 카드</div>
          <div class="select_item">간편 계좌 이체</div>
          <div class="select_item naver_pay"></div>
        </div>
      </div>
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
      <div class="terms_agreement">
        <div class="terms_checkbox">
          <input type="checkbox" name="" id="terms_agreement">
          <label for="terms_agreement">약관 전체동의</label>
        </div>
        <i class="fa fa-chevron-down"></i>
      </div>
      <button class="pay_btn"><span>108,900</span>원 결제하기</button>
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
    document.addEventListener("DOMContentLoaded", function () {
      const items = document.querySelectorAll(".select_item");

      items.forEach(item => {
        item.addEventListener("click", function () {
          // 모든 항목의 선택 효과 초기화
          items.forEach(i => i.classList.remove("selected"));

          // 클릭한 항목만 선택
          this.classList.add("selected");
        });
      });
    });
  </script>
</body>
</html>