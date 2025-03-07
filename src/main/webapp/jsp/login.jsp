<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
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
    <div class="login_container">
      <h2 class="logo">SKI:P</h2>
      <h3>로그인</h3>
      <div class="login_info">
        <input class="input_text" type="text" name="" id="" placeholder="아이디">
        <input class="input_pwd" type="password" name="" id="" placeholder="비밀번호">
      </div>
      <div class="login_check">
        <input type="checkbox" name="" id="log_retain">
        <label for="log_retain">로그인 유지하기</label>
        <input type="checkbox" name="" id="id_save">
        <label for="id_save">아이디 저장</label>
      </div>
      <button class="login_btn">로그인</button>
      <button class="login_btn kakao_login">카카오 로그인</button>
      <div class="account_area">
        <ul>
          <li>
            <a href="#none">아이디 찾기</a>
          </li>
          <li>
            <a href="#none">비밀번호 찾기</a>
          </li>
          <li>
            <a href="#none">회원가입</a>
          </li>
        </ul>
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
</body>
</html>