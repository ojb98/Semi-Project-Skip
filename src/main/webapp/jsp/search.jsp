<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search.jsp</title>
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
    <section class="search_detail">
      <div class="search_menu">
        <form action="">
          <label for="">스키장</label>
          <select id="">
            <option value="" selected>-- 리조트 선택 --</option>
            <option value="" disabled>-- 강원도 --</option>
            <option value="">평창 휘닉스파크</option>
            <option value="">평창 모나용평</option>
            <option value="">평창 알펜시아</option>
            <option value="">춘천 엘리시안 강촌</option>
            <option value="">정선 하이원 리조트</option>
            <option value="">홍천 비발디파크</option>
            <option value="">원주 오크밸리</option>
            <option value="">횡성 웰리힐리파크</option>
            <option value="">태백 오투리조트</option>
            <option value="" disabled>-- 경기도 --</option>
            <option value="">광주 곤지암 리조트</option>
            <option value="">이천 지산 포레스트</option>
            <option value="" disabled>-- 전라북도 --</option>
            <option value="">무주 리조트</option>
            <option value="" disabled>-- 경상남도 --</option>
            <option value="">양산 에덴밸리 리조트</option>
          </select>
        </form>
        <form action="">
          <label for="user-color">리조트</label>
          <select id="">
            <option value="" selected>-- 리조트 선택 --</option>
            <option value="" disabled>-- 강원도 --</option>
            <option value="">평창 휘닉스파크</option>
            <option value="">평창 모나용평</option>
            <option value="">평창 알펜시아</option>
            <option value="">춘천 엘리시안 강촌</option>
            <option value="">정선 하이원 리조트</option>
            <option value="">홍천 비발디파크</option>
            <option value="">원주 오크밸리</option>
            <option value="">횡성 웰리힐리파크</option>
            <option value="">태백 오투리조트</option>
            <option value="" disabled>-- 경기도 --</option>
            <option value="">광주 곤지암 리조트</option>
            <option value="">이천 지산 포레스트</option>
            <option value="" disabled>-- 전라북도 --</option>
            <option value="">무주 리조트</option>
            <option value="" disabled>-- 경상남도 --</option>
            <option value="">양산 에덴밸리 리조트</option>
          </select>
        </form>
        <form action="">
          <label for="user-color">렌탈샵</label>
          <select id="">
            <option value="" selected>-- 리조트 선택 --</option>
            <option value="" disabled>-- 강원도 --</option>
            <option value="">평창 휘닉스파크</option>
            <option value="">평창 모나용평</option>
            <option value="">평창 알펜시아</option>
            <option value="">춘천 엘리시안 강촌</option>
            <option value="">정선 하이원 리조트</option>
            <option value="">홍천 비발디파크</option>
            <option value="">원주 오크밸리</option>
            <option value="">횡성 웰리힐리파크</option>
            <option value="">태백 오투리조트</option>
            <option value="" disabled>-- 경기도 --</option>
            <option value="">광주 곤지암 리조트</option>
            <option value="">이천 지산 포레스트</option>
            <option value="" disabled>-- 전라북도 --</option>
            <option value="">무주 리조트</option>
            <option value="" disabled>-- 경상남도 --</option>
            <option value="">양산 에덴밸리 리조트</option>
          </select>
        </form>
      </div>
    </section>
    <section class="search_main">
      <div class="search_list">
        <h2 class="list_title">스키장</h2>
        <a href="resort_detail.jsp" class="search_card">
          <div class="card_img"></div>
          <div class="card_info">
            <span class="card_badge">리조트 · 호텔</span>
            <h2 class="card_title">휘닉스 리조트 평창</h2>
            <p class="card_location">평창군 · 휘닉스 파크 내</p>
            <span class="rating"><i class="fa fa-star"></i>4.6</span>
            <span class="personnel">1,992명 평가</span>
            <div class="card_price">
              <p class="price_original">400,000원</p>
              <p class="price_discount">108,900원</p>
            </div>
            <span class="heart_btn"><i class="fa fa-heart"></i></span>
          </div>
        </a>
        <p class="card_line"></p>
        <h2 class="list_title">리조트</h2>
        <a href="resort_detail.jsp" class="search_card">
          <div class="card_img"></div>
          <div class="card_info">
            <span class="card_badge">리조트 · 호텔</span>
            <h2 class="card_title">휘닉스 리조트 평창</h2>
            <p class="card_location">평창군 · 휘닉스 파크 내</p>
            <p class="card_rating"><i class="fa fa-star"></i> 4.6 1,992명 평가</p>
            <div class="card_price">
              <p class="price_original">400,000원</p>
              <p class="price_discount">108,900원</p>
            </div>
            <span class="heart_btn"><i class="fa fa-heart"></i></span>
          </div>
        </a>
        <p class="card_line"></p>
        <h2 class="list_title">렌탈샵</h2>
        <a href="resort_detail.jsp" class="search_card">
          <div class="card_img"></div>
          <div class="card_info">
            <span class="card_badge">리조트 · 호텔</span>
            <h2 class="card_title">휘닉스 리조트 평창</h2>
            <p class="card_location">평창군 · 휘닉스 파크 내</p>
            <p class="card_rating"><i class="fa fa-star"></i> 4.6 1,992명 평가</p>
            <div class="card_price">
              <p class="price_original">400,000원</p>
              <p class="price_discount">108,900원</p>
            </div>
            <span class="heart_btn"><i class="fa fa-heart"></i></span>
          </div>
        </a>
        <p class="card_line"></p>
        <a href="resort_detail.jsp" class="search_card">
          <div class="card_img"></div>
          <div class="card_info">
            <span class="card_badge">리조트 · 호텔</span>
            <h2 class="card_title">휘닉스 리조트 평창</h2>
            <p class="card_location">평창군 · 휘닉스 파크 내</p>
            <p class="card_rating"><i class="fa fa-star"></i> 4.6 1,992명 평가</p>
            <div class="card_price">
              <p class="price_original">400,000원</p>
              <p class="price_discount">108,900원</p>
            </div>
            <span class="heart_btn"><i class="fa fa-heart"></i></span>
          </div>
        </a>
        <p class="card_line"></p>
        <a href="resort_detail.jsp" class="search_card">
          <div class="card_img"></div>
          <div class="card_info">
            <span class="card_badge">리조트 · 호텔</span>
            <h2 class="card_title">휘닉스 리조트 평창</h2>
            <p class="card_location">평창군 · 휘닉스 파크 내</p>
            <p class="card_rating"><i class="fa fa-star"></i> 4.6 1,992명 평가</p>
            <div class="card_price">
              <p class="price_original">400,000원</p>
              <p class="price_discount">108,900원</p>
            </div>
            <span class="heart_btn"><i class="fa fa-heart"></i></span>
          </div>
        </a>
        <p class="card_line"></p>
        <a href="resort_detail.jsp" class="search_card">
          <div class="card_img"></div>
          <div class="card_info">
            <span class="card_badge">리조트 · 호텔</span>
            <h2 class="card_title">휘닉스 리조트 평창</h2>
            <p class="card_location">평창군 · 휘닉스 파크 내</p>
            <span class="rating"><i class="fa fa-star"></i>4.6</span>
            <span>1,992명 평가</span>
            <div class="card_price">
              <p class="price_original">400,000원</p>
              <p class="price_discount">108,900원</p>
            </div>
            <span class="heart_btn"><i class="fa fa-heart"></i></span>
          </div>
        </a>
        <p class="card_line"></p>
        <a href="resort_detail.jsp" class="search_card">
          <div class="card_img"></div>
          <div class="card_info">
            <span class="card_badge">리조트 · 호텔</span>
            <h2 class="card_title">휘닉스 리조트 평창</h2>
            <p class="card_location">평창군 · 휘닉스 파크 내</p>
            <p class="card_rating"><i class="fa fa-star"></i> 4.6 1,992명 평가</p>
            <div class="card_price">
              <p class="price_original">400,000원</p>
              <p class="price_discount">108,900원</p>
            </div>
            <span class="heart_btn"><i class="fa fa-heart"></i></span>
          </div>
        </a>
        <p class="card_line"></p>
        <a href="resort_detail.jsp" class="search_card">
          <div class="card_img"></div>
          <div class="card_info">
            <span class="card_badge">리조트 · 호텔</span>
            <h2 class="card_title">휘닉스 리조트 평창</h2>
            <p class="card_location">평창군 · 휘닉스 파크 내</p>
            <p class="card_rating"><i class="fa fa-star"></i> 4.6 1,992명 평가</p>
            <div class="card_price">
              <p class="price_original">400,000원</p>
              <p class="price_discount">108,900원</p>
            </div>
            <span class="heart_btn"><i class="fa fa-heart"></i></span>
          </div>
        </a>
        <p class="card_line"></p>

      </div>
      <div class="search_map">
        지도 api영역입니다.
      </div>
    </section>

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