<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.comment_msg {
		font-size: 12px;
		color: red;
		display: none;
	}
</style>
<body>
	<form id="reviewForm" action="<%=request.getContextPath() %>/jsp/update" method="post" enctype="multipart/form-data">
		<h2>리뷰 수정</h2>
			<div class="">
				<lable>리뷰 아이디</lable>
				<input type="text" name="reviewId" value="${rrDto.getReviewId() }" readonly>
			</div>
			<div class="">
				<lable>리조트 결제 아이디</lable>
				<input type="text" name="paymentId" value="${rrDto.getPaymentId() }" readonly>			
			</div>
			<div class="">
				<lable>회원 아이디</lable>
				<input type="text" name="uuid" value="${rrDto.getUuid() }" readonly>
			</div>
			<div class="">
				<lable>리조트 아이디</lable>
				<input type="text" name="resortId" value="${rrDto.getResortId() }" readonly>
			</div>
			<div>
			<label>리뷰 평점</label>
				<select name="rating">
					<option value="${rrDto.getRating() }">${rrDto.getRating() }</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			<div class="">
				<label>리뷰내용</label>
				<textarea id="resortComment" rows="5" cols="50" name="resortComment" placeholder="5자 이상입력하세요.">${rrDto.getResortComment() }</textarea>
				<p class="comment_msg">리뷰를 5자 이상 작성해주세요.</p>			
			</div>
			<label>첨부파일</label>
			<input type="file" name="reviewImg" value="${rrDto.getReviewImg() }">
			<input type="submit" value="수정">
	</form>
	
	<script>
	const reviewForm = document.querySelector("#reviewForm");
	reviewForm.addEventListener("submit", (event) => {
	    let isValid = true;

	    // 리뷰 내용 유효성 검사
	    const reviewText = document.querySelector("#resortComment").value.trim();
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
	                alert("리뷰가 수정되었습니다.");
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