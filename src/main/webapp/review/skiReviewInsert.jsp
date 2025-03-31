<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/popupForm.css">
</head>
<body>
	<form id="reviewForm" class="insert_form" method="post" action="${pageContext.request.contextPath}/review/skiReviewInsert" enctype="multipart/form-data" onsubmit="setTimeout(closePopup, 500)">
		<h2>리뷰작성</h2>
		<div class = "">
			<input type="hidden" name="payment_id" value="${payment_id }">	
		</div>
		<div class="">
			<input type="hidden" name="uuid" value="${uuid }">
		</div>
		<div class="">
			<input type="hidden" name="ski_id" value="${ski_id }">
		</div>
		<div class="insert_col">
			<label>리뷰 평점</label>
			<select name="rating" id=rating class="select_box">
				<option value="" selected disabled>선택</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			<p class="rating_msg">평점을 선택해주세요.</p>
		</div>
		<div class="insert_col">
			<label>리뷰내용</label>
			<textarea id="review_comment" class="text_area" rows="5" cols="50" name="review_comment" placeholder="5자 이상입력하세요."></textarea>
			<p class="comment_msg">리뷰를 5자 이상 작성해주세요.</p>
		</div>
		<div class="insert_col">
			<label>첨부파일</label>
			<input type="file" name="review_img">
		</div>
			<input class="insert_btn" type="submit" value="등록">
	</form>
	
	<script>	
	const reviewForm = document.querySelector("#reviewForm");
	reviewForm.addEventListener("submit", (event) => {
	    let isValid = true;

	    // 평점 유효성 검사
	    const rating = document.querySelector("#rating").value;
	    const ratingMsg = document.querySelector(".rating_msg");

	    if (rating === "") {
	        ratingMsg.style.display = "block";
	        isValid = false;
	    } else {
	        ratingMsg.style.display = "none";
	    }

	    // 리뷰 내용 유효성 검사
	    const reviewText = document.querySelector("#review_comment").value.trim();
	    const commentMsg = document.querySelector(".comment_msg");

	    if (reviewText.length < 5) {
	        commentMsg.style.display = "block";
	        isValid = false;
	    } else {
	        commentMsg.style.display = "none";
	    }

	    if (!isValid) {
	        event.preventDefault(); // 유효성 검사 실패 시 제출 방지
	    } else {
	        event.preventDefault(); // 기본 제출 방지 후 AJAX로 처리

	        const formData = new FormData(reviewForm);

	        fetch(reviewForm.action, {
	            method: "POST",
	            body: formData,
	        })
	        .then(response => {
	            if (response.ok) {
	                alert("리뷰가 등록되었습니다.");
	                window.close(); // 서버 응답을 받은 후 창 닫기
	            } else {
	                alert("리뷰 등록에 실패했습니다.");
	            }
	        })
	        .catch(error => {
	            console.error("Error:", error);
	            alert("서버 오류 발생!");
	        });
	    }
	});
				
		
		
		
	</script>
</body>
</html>