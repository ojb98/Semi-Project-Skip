<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/jsp/update" method="post" enctype="multipart/form-data">
		<h3>리뷰 수정</h3>
			<lable>리뷰 아이디</lable>
			<input type="text" name="reviewId" value="${rrDto.getReviewId() }">
			<lable>리조트 결제 아이디</lable>
			<input type="text" name="paymentId" value="${rrDto.getPaymentId() }">
			<lable>회원 아이디</lable>
			<input type="text" name="uuid" value="${rrDto.getUuid() }">
			<lable>리조트 아이디</lable>
			<input type="text" name="resortId" value="${rrDto.getResortId() }">
			<div>
			<label>평점</label>
				<select name="rating">
					<option value="${rrDto.getRating() }">${rrDto.getRating() }</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			<div>
				<label>리뷰내용</label>
				<textarea rows="5" cols="50" name="resortComment">${rrDto.getResortComment() }</textarea>			
			</div>
			<label>첨부파일</label>
			<input type="file" name="reviewImg" value="${rrDto.getReviewImg() }">
			<input type="submit" value="수정">
	</form>
</body>
</html>