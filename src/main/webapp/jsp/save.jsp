<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>save.jsp</title>
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

  <!-- main-->
  <main>
    <div class="save_container">
      <div class="save_title">
        <h2>찜</h2>
      </div>
      <div class="save_box">
        <a href="resort_detail.jsp" class="save_item">
          <div class="item_img img1"></div>
          <div class="item_text">
            <h4>리조트</h4>
            <div class="item_bottom">
              <div class="left">
                <h3>용평리조트</h3>
                <span class="rating"><i class="fa fa-star"></i>4.6</span>
              </div>
              <div class="right">
                <span>279,000원</span>
              </div>
            </div>
          </div>
          <span class="heart_btn fa-heart-active"><i class="fa fa-heart fa-heart-active"></i></span>
        </a>
        <a href="resort_detail.jsp" class="save_item">
          <div class="item_img img2"></div>
          <div class="item_text">
            <h4>리조트</h4>
            <div class="item_bottom">
              <div class="left">
                <h3>용평리조트</h3>
                <span class="rating"><i class="fa fa-star"></i>4.6</span>
              </div>
              <div class="right">
                <span>279,000원</span>
              </div>
            </div>
          </div>
          <span class="heart_btn fa-heart-active"><i class="fa fa-heart fa-heart-active"></i></span>
        </a>
        <a href="resort_detail.jsp" class="save_item">
          <div class="item_img img3"></div>
          <div class="item_text">
            <h4>리조트</h4>
            <div class="item_bottom">
              <div class="left">
                <h3>용평리조트</h3>
                <span class="rating"><i class="fa fa-star"></i>4.6</span>
              </div>
              <div class="right">
                <span>279,000원</span>
              </div>
            </div>
          </div>
          <span class="heart_btn fa-heart-active"><i class="fa fa-heart fa-heart-active"></i></span>
        </a>
        <a href="resort_detail.jsp" class="save_item">
          <div class="item_img img4"></div>
          <div class="item_text">
            <h4>리조트</h4>
            <div class="item_bottom">
              <div class="left">
                <h3>용평리조트</h3>
                <span class="rating"><i class="fa fa-star"></i>4.6</span>
              </div>
              <div class="right">
                <span>279,000원</span>
              </div>
            </div>
          </div>
          <span class="heart_btn fa-heart-active"><i class="fa fa-heart fa-heart-active"></i></span>
        </a>
        <a href="resort_detail.jsp" class="save_item">
          <div class="item_img img5"></div>
          <div class="item_text">
            <h4>리조트</h4>
            <div class="item_bottom">
              <div class="left">
                <h3>용평리조트</h3>
                <span class="rating"><i class="fa fa-star"></i>4.6</span>
              </div>
              <div class="right">
                <span>279,000원</span>
              </div>
            </div>
          </div>
          <span class="heart_btn fa-heart-active"><i class="fa fa-heart fa-heart-active"></i></span>
        </a>
        <a href="resort_detail.jsp" class="save_item">
          <div class="item_img img6"></div>
          <div class="item_text">
            <h4>리조트</h4>
            <div class="item_bottom">
              <div class="left">
                <h3>용평리조트</h3>
                <span class="rating"><i class="fa fa-star"></i>4.6</span>
              </div>
              <div class="right">
                <span>279,000원</span>
              </div>
            </div>
          </div>
          <span class="heart_btn fa-heart-active"><i class="fa fa-heart fa-heart-active"></i></span>
        </a>
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