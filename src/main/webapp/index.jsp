<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage.css">
</head>
<body>
<!-- header -->
<jsp:include page="/header.jsp" />

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
<jsp:include page="/footer.jsp" />
</body>
</html>