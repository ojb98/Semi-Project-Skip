<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

  <!-- main -->
  <main>
    <div class="resort_container">
      <section class="resort_menu">
        <div class="search_box">
          <i class="fa fa-search"></i>
          <input class="search" type="text" name="" id="">
        </div>
        <div class="calendar_box">
          <label for="">가는 날</label>
          <input type="date" name="date" id="">
          <label for="">오는 날</label>
          <input type="date" name="date" id="">
        </div>
        <div class="select_box">
          <form action="">
            <label for="">인원</label>
            <select id="">
              <option value="">1</option>
              <option value="">2</option>
              <option value="">3</option>
              <option value="">4</option>
            </select>
          </form>
        </div>
      </section>
      <section class="resort_info">
        <div class="resort_img">
          <div class="main_img"></div>
          <div class="sub_img_container">
            <div class="sub_img1"></div>
            <div class="sub_img2"></div>
            <div class="sub_img3"></div>
            <div class="sub_img4"></div>
          </div>
        </div>
        <div class="resort_title">
          <div class="title_top">
            <h3>호텔</h3>
            <span class="heart_btn"><i class="fa fa-heart"></i></span>
          </div>
          <div class="title_bottom">
            <h2>나인트리 바이 파르나스 서울 인사동</h2>
            <p class="price">233,700~</p>
          </div>
        </div>
        <div class="resort_features">
          <a href="#none" class="features_item features_review">
            <div class="title">
              <span class="rating"><i class="fa fa-star"></i>4.6</span>
              <span>1,287명 평가</span>
              <i class="fa fa-chevron-right"></i>
            </div>
            <div class="content">
              <p>안녕, 인사동과 연결되어 있어 접근성이 너무 좋아요 서울 여행에서 차 가지고 다니면 많이 불편한데 서울 여러 중심부를 편하게 다닐 수 있어요.</p>
            </div>
          </a>
          <div href="#none" class="features_item features_facilty">
            <div class="title">
              <span>부대시설</span>
            </div>
            <div class="content">
              <span class="facilty">피트니스</span>
              <span class="facilty"><i class="fa fa-wifi"></i>무선인터넷</span>
              <span class="facilty"><i class="fa fa-bath"></i>욕실용품</span>
              <span class="facilty"><i class="fa fa-glass"></i>레스토랑</span>
              <span class="facilty">금연</span>
              <span class="facilty"><i class="fa fa-television"></i>TV</span>
            </div>
          </div>
          <a href="#none" class="features_item features_location">
            <div class="title">
              <span>위치 정보</span>
              <i class="fa fa-chevron-right"></i>
            </div>
            <div class="content">
              <p><i class="fa fa-map-marker"></i>서울 종로구 관훈동 155-2 <span>지도보기</span></p>
              <p><i class="fa fa-location-arrow"></i>안국역 도보 4분 </p>
            </div>
          </a>
        </div>
      </section>
      <section class="room_section">
        <h2>객실 선택</h2>
        <div class="room_type">
          <a href="#none" class="main_img">
            <div class="img_plus">
              <i class="fa fa-file-image-o"></i>
              <span>4</span>
              <i class="fa fa-plus"></i>
            </div>
          </a>
          <div class="room_details">
            <h3>싱글룸</h3>
            <div class="room_details_top">
              <div class="check_in_out">
                <p><i class="fa fa-clock-o"></i>입실 18:00</p>
                <p>퇴실 12:00</p>
              </div>
              <div class="room_price">
                <p class="price">233,700원</p>
                <p class="room_msg">남은 객실 수 1개</p>
                <button class="room_btn">객실 예약</button>
              </div>
            </div>
            <div class="room_description">
              <p><span>객실정보</span>기준2인 · 최대2인</p>
              <p><span>추가정보</span>18시 이후 체크인 가능 / 유료 주차 / 연박불가</p>
            </div>
          </div>
        </div>
        <div class="room_type">
          <a href="#none" class="main_img">
            <div class="img_plus">
              <i class="fa fa-file-image-o"></i>
              <span>4</span>
              <i class="fa fa-plus"></i>
            </div>
          </a>
          <div class="room_details">
            <h3>트윈룸</h3>
            <div class="room_details_top">
              <div class="check_in_out">
                <p><i class="fa fa-clock-o"></i>입실 18:00</p>
                <p>퇴실 12:00</p>
              </div>
              <div class="room_price">
                <p class="price">233,700원</p>
                <p class="room_msg">남은 객실 수 1개</p>
                <button class="room_btn">객실 예약</button>
              </div>
            </div>
            <div class="room_description">
              <p><span>객실정보</span>기준2인 · 최대2인</p>
              <p><span>추가정보</span>18시 이후 체크인 가능 / 유료 주차 / 연박불가</p>
            </div>
          </div>
        </div>
        <div class="room_type">
          <a href="#none" class="main_img">
            <div class="img_plus">
              <i class="fa fa-file-image-o"></i>
              <span>4</span>
              <i class="fa fa-plus"></i>
            </div>
          </a>
          <div class="room_details">
            <h3>더블룸</h3>
            <div class="room_details_top">
              <div class="check_in_out">
                <p><i class="fa fa-clock-o"></i>입실 18:00</p>
                <p>퇴실 12:00</p>
              </div>
              <div class="room_price">
                <p class="price">233,700원</p>
                <p class="room_msg">남은 객실 수 1개</p>
                <button class="room_btn">객실 예약</button>
              </div>
            </div>
            <div class="room_description">
              <p><span>객실정보</span>기준2인 · 최대2인</p>
              <p><span>추가정보</span>18시 이후 체크인 가능 / 유료 주차 / 연박불가</p>
            </div>
          </div>
        </div>
        <div class="room_type">
          <a href="#none" class="main_img">
            <div class="img_plus">
              <i class="fa fa-file-image-o"></i>
              <span>4</span>
              <i class="fa fa-plus"></i>
            </div>
          </a>
          <div class="room_details">
            <h3>패밀리룸</h3>
            <div class="room_details_top">
              <div class="check_in_out">
                <p><i class="fa fa-clock-o"></i>입실 18:00</p>
                <p>퇴실 12:00</p>
              </div>
              <div class="room_price">
                <p class="price">233,700원</p>
                <p class="room_msg">남은 객실 수 1개</p>
                <button class="room_btn">객실 예약</button>
              </div>
            </div>
            <div class="room_description">
              <p><span>객실정보</span>기준2인 · 최대2인</p>
              <p><span>추가정보</span>18시 이후 체크인 가능 / 유료 주차 / 연박불가</p>
            </div>
          </div>
        </div>
        <div class="room_type">
          <a href="#none" class="main_img">
            <div class="img_plus">
              <i class="fa fa-file-image-o"></i>
              <span>4</span>
              <i class="fa fa-plus"></i>
            </div>
          </a>
          <div class="room_details">
            <h3>스위트룸</h3>
            <div class="room_details_top">
              <div class="check_in_out">
                <p><i class="fa fa-clock-o"></i>입실 18:00</p>
                <p>퇴실 12:00</p>
              </div>
              <div class="room_price">
                <p class="price">233,700원</p>
                <p class="room_msg">남은 객실 수 1개</p>
                <button class="room_btn">객실 예약</button>
              </div>
            </div>
            <div class="room_description">
              <p><span>객실정보</span>기준2인 · 최대2인</p>
              <p><span>추가정보</span>18시 이후 체크인 가능 / 유료 주차 / 연박불가</p>
            </div>
          </div>
        </div>
      </section>
      <section class="tabs">
        <div class="tabs_btns">
          <a href="#none" class="review_btn btn active">리뷰</a>
          <a href="#none" class="inquiry_btn btn">문의</a>
        </div>
        <div class="review_tab">
          <div class="review_title">
            <div class="title_left">
              <div class="review_rating">
                <h3>리뷰 평점</h3>
                <span class="rating"><i class="fa fa-star"></i></span>
                <div class="rating_number">
                  <span>${avgRating}</span><span>/</span><span>5</span>
                </div>
              </div>
              <div class="review_number">
                <h3>전체 리뷰 수</h3>
                <i class="fa fa-commenting"></i>
                <p>${reviewCount}</p>
              </div>
            </div>
            <div class="title_right">
              <div class="review_filter">
                <a class="filter_btn active" href="<%=request.getContextPath() %>/jsp/reviewList"><i class="fa fa-check"></i>최신순</a>
                <a class="filter_btn" href="<%=request.getContextPath() %>/jsp/reviewDesc"><i class="fa fa-check"></i>평점 높은순</a>
                <a class="filter_btn" href="<%=request.getContextPath() %>/jsp/reviewAsc"><i class="fa fa-check"></i>평점 낮은순</a>
              </div>
            </div>
          </div>
          <div class="review_contents">
            <ul class="review_list"">
            </ul>
          </div>
          <!-- 페이징 -->
          <div class="page_btn">
          </div>
        </div>
      </section>
    </div>
  </main>

  <script>
	const filterBtns = document.querySelectorAll(".filter_btn");
	
	filterBtns.forEach(function (btn) {
	    btn.addEventListener("click", function () {
	        // 모든 버튼에서 active 제거
	        filterBtns.forEach(btn => btn.classList.remove("active"));
	
	        // 현재 클릭한 버튼에 active 추가
	        this.classList.add("active");
	    });
	});
	
	
  </script>
  <script src="<%=request.getContextPath() %>/script/review.js"></script>
  <script type="text/javascript">
  getList(1);
  </script>
</body>
</html>