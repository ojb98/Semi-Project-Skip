<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/jsp/reviewInsert" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->
		<h1>리뷰작성</h1>
		<lable>리조트 결제 아이디</lable>
		<input type="text" name="paymentId">
		<lable>회원 아이디</lable>
		<input type="text" name="uuid">
		<lable>리조트 아이디</lable>
		<input type="text" name="resortId">
		<div>
		<label>리뷰 평점</label>
		<select name="rating">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		</div>
		<div>
		<label>리뷰내용</label>
		<textarea rows="5" cols="50" name="resortComment"></textarea>
		</div>
		<label>첨부파일</label>
		<input type="file" name="reviewImg">
		<input type="submit" value="등록">
	</form>
</body>
</html>