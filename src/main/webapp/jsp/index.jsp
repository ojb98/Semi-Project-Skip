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
            <a href="<%=request.getContextPath() %>index.jsp">SKI:P</a>
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
    <div class="slide">
      슬라이드 영역
    </div>
    <div class="main_menu">
      <button type="button" class="menu_btn"><i class="fa fa-map-marker"></i>스키장 어디로 가시나요?</button>
      <button type="button" class="search_btn">리조트 검색</button>
      <!-- 지역 선택 박스 -->
      <div class="location_box">
        <div class="location_inner">
          <div class="search_bar">
            <input type="text" placeholder="지역명, 명소명, 호텔명 검색">
            <button type="button" class="close_btn" id="closeBtn">&times;</button>
          </div>

          <div class="location_list">
            <h3><i class="fa fa-map-marker"></i>주요도시</h3>

            <h4>강원도</h4>
            <div class="button_group">
              <button>평창 휘닉스파크</button>
              <button>평창 모나용평</button>
              <button>평창 알펜시아</button>
              <button>춘천 엘리시안 강촌</button>
              <button>정선 하이원 리조트</button>
              <button>홍천 비발디파크</button>
              <button>원주 오크밸리</button>
              <button>횡성 웰리힐리파크</button>
              <button>태백 오투리조트</button>
            </div>

            <h4>경기도</h4>
            <div class="button_group">
              <button>광주 곤지암 리조트</button>
              <button>이천 지산 포레스트</button>
            </div>
            <h4>전라북도</h4>
            <div class="button_group">
              <button>무주 리조트</button>
            </div>
            <h4>경상남도</h4>
            <div class="button_group">
              <button>양산 에덴밸리 리조트</button>
            </div>
          </div>
        </div>
      </div>


    </div>
    <!-- main -->
    <div class="main_container">
      <div class="main_title_box">
        <div class="search_menu">
          <form action="">
            <label for="" class="main_title">지금 스키장 날씨는?</label>
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
      </div>
      <div class="main_content">
        날씨 api 영역입니다.
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
  // location_btn 클릭시 location_box disply=block
  const menu_btn = document.querySelector('.menu_btn');
  const locationBox = document.querySelector('.location_box');
  
  // 스키장 어디로 가시나요 btn 클릭시 location_box 보이기
  menu_btn.addEventListener('click', function () {
    document.querySelector('.location_box').style.display = 'block';
  });

  // location_box 바깥 클릭 시 닫기
  document.addEventListener('click', function (event) {
    // 클릭한 요소가 location_box 내부 또는 버튼이면 닫지 않음
    if (!locationBox.contains(event.target) && event.target !== menu_btn) {
      locationBox.style.display = 'none';
    }
  });

  //임의로 리조트버튼 검색 클릭시 search.jsp로 이동하기
  document.querySelector('.search_btn').addEventListener('click', function () {
    window.location.href = 'search.jsp'; // 원하는 경로로 이동
  });
  </script>
</body>
</html>