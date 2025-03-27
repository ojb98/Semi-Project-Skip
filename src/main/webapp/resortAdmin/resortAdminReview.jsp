<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
                <a class="filter_btn active" href="<%=request.getContextPath() %>/resortAdmin/resortAdminReview"><i class="fa fa-check"></i>최신순</a>
                <a class="filter_btn" href="<%=request.getContextPath() %>/resortAdmin/resortReviewDesc"><i class="fa fa-check"></i>평점 높은순</a>
                <a class="filter_btn" href="<%=request.getContextPath() %>/resortAdmin/resortReviewAsc"><i class="fa fa-check"></i>평점 낮은순</a>
              </div>
            </div>
          </div>
          <div class="review_contents">
            <ul class="review_list" id="reviewList">
	           <c:forEach var="rrDto" items="${resortReviewList }" >
	              <li class="review_item">
	                <div class="user_review">
	                  <div class="item_content">
	                    <div class="rating_box">
	                    <div class="star_box">
	                    <c:choose>
	                    	<c:when test="${rrDto.rating == 5 }">
	                    		<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>	
	                    	</c:when>
	                    	<c:when test="${rrDto.rating == 4 }">
	                    		<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>	
	                    	</c:when>
	                    	<c:when test="${rrDto.rating == 3 }">
	                    		<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>	
	                    	</c:when>
	                    	<c:when test="${rrDto.rating == 2 }">
	                    		<i class="fa fa-star"></i><i class="fa fa-star"></i>	
	                    	</c:when>
	                    	<c:when test="${rrDto.rating == 1 }">
	                    		<i class="fa fa-star"></i>	
	                    	</c:when>
	                    </c:choose>
	                    </div>
	                    <span class="rating_number">${rrDto.rating.intValue()} 점</span>
	                    </div>
	                    <div class="user_box">
	                      <p class="user_id">${rrDto.uuid }</p>
	                      <p class="created_at">${rrDto.created_at }</p>
	                      <div class="content">
	                        <p>${rrDto.review_comment }</p>
	                      </div>
	                    </div>
	                  </div>
	                  <div class="item_img">
	                  <c:choose>
		                  	<c:when test="${not empty rrDto.review_img }">
		        				<img src="<%=request.getContextPath() %>/reviewImgs/${rrDto.review_img} ">
		                  	</c:when>
		                  	<c:otherwise>
		              			<!-- 이미지가 없으면 빈값 -->
		                  	</c:otherwise>
	                  </c:choose>
	                  </div>
	                </div>
	              </li>              
           		</c:forEach>
            </ul>
          </div>
          <!-- 페이징 -->
          <div class="page_btn">
            <a href="#none"><i class="fa fa-angle-left"></i>이전</a>
            <a class="active" href="#none">1</a>
            <a href="#none">2</a>
            <a href="#none">3</a>
            <a href="#none">4</a>
            <a href="#none">5</a>
            <a href="#none">6</a>
            <a href="#none">7</a>
            <a href="#none">8</a>
            <a href="#none">9</a>
            <a href="#none">10</a>
            <a href="#none">다음<i class="fa fa-angle-right"></i></a>
          </div>
        </div>
</body>
</html>