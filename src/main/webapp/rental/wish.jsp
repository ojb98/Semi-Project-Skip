<%@page import="users.dao.UsersDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>찜 목록</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mainpage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css">
</head>
<style>
/* 기존 스타일 유지 */
.save_container {
	width: 1230px;
	margin: 50px auto;
}

.save_container .save_title {
	display: flex;
	justify-content: space-between;
}

.save_container .save_title h2 {
	display: inline-block;
	padding: 10px 40px;
	border-radius: 10px;
	background-color: #5399f5;
	color: #fff;
}

.save_box {
	margin-top: 20px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-column-gap: 20px;
	grid-row-gap: 30px;
}

.save_item {
	position: relative;
	overflow: hidden;
	border-radius: 10px;
	display: flex;
	flex-direction: column;
}

.item-box {
	width: 100%;
	height: auto;
	position: relative;
}

.main-image {
	position: relative;
	height: 70%;
	z-index: 1;
}

.item_text {
	padding: 10px;
	flex-grow: 1;
	position: relative;
	z-index: 2;
}

.save_item img {
	width: 100%;
	height: 100%;
	object-fit: fit;
	border-radius: 10px;
}

.item_bottom {
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: relative;
	z-index: 2;
}

.save_item .heart_btn {
	position: absolute;
	top: 15px;
	right: 15px;
	font-size: 24px;
	z-index: 10;
}

.item_text h4 {
	font-size: 14px;
	color: #6f7077;
	margin: 10px 0;
}

.item_bottom .left {
	display: flex;
}

.item_bottom .left h3 {
	margin-right: 5px;
}
</style>
<body>
	<main>
		<%-- 사용자 UUID 가져오기 --%>
		<%
		Cookie[] cookies = request.getCookies();
		String userId = null;
		int uuid = -1;

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user_id")) {
			userId = cookie.getValue();
			break;
				}
			}
		}

		if (userId != null) {
			UsersDao usersDao = UsersDao.getInstance();
			uuid = usersDao.getUUID(userId);
		}
		%>

		<jsp:include page="/header.jsp" />

		<div class="save_container">
			<div class="save_title">
				<h2>찜</h2>
			</div>
			<div class="save_box">
				<c:choose>
					<c:when test="${not empty requestScope.wishList}">
						<c:forEach var="wish" items="${requestScope.wishList}">
							<a href="${pageContext.request.contextPath}${wish.link} "
								class="save_item" data-item-id="${wish.ref_id}" data-category="${wish.category}">
								<div class="item-box">
									<div class="main-image">
										<img src="/test${wish.mainImg}" />
									</div>
									<div class="item_text">
										<h4>${wish.category}</h4>
										<div class="item_bottom">
											<div class="left">
												<h3>${wish.name}</h3>
												<span class="rating"><i class="fa fa-star"></i>${wish.rating}</span>
											</div>
											<div class="right">
												<span>${wish.price}</span>
											</div>
										</div>
									</div>
									<span class="heart_btn"> <i
										class="fa fa-heart ${wish.isWish ? 'fas' : 'far'} heart-icon"></i>
									</span>
								</div>
							</a>

						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>현재 찜 목록이 비었음</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</main>

	<jsp:include page="/footer.jsp" />

	<script>
    const uuid = <%=uuid%>;  // 사용자 UUID

    // 하트 클릭 이벤트 처리
    const heartButtons = document.querySelectorAll('.heart_btn');

    heartButtons.forEach(button => {
        button.addEventListener("click", function (event) {
            event.preventDefault(); // 링크 이동 방지

            const itemElement = this.closest('.save_item');  // .save_item을 제대로 찾고 있는지 확인
            if (!itemElement) {
                alert('아이템을 찾을 수 없습니다.');
                return;
            }
            
            const itemId = this.closest('.save_item').getAttribute('data-item-id');  // 아이템 ID
            let category = itemElement.getAttribute('data-category'); 

            // itemId가 비어 있는지 확인
            if (!itemId || !category) {
                alert('잘못된 아이템 정보입니다.');
                return;
            }
            const heartIcon = this.querySelector('.heart-icon');
            const isWish = heartIcon.classList.contains('fas'); // 현재 찜 상태 확인

            if (uuid === -1) {
                alert('로그인이 필요합니다.');
                return;
            }
            
            if (category === '스키장') category = 'SKI';
            if (category === '렌탈샵') category = 'RENTAL';
            if (category === '리조트') category = 'RESORT';

            // DB에서 해당 아이템을 찜 목록에서 제거
            fetch('/test/wish', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    uuid: uuid,
                    ref_id: itemId,
                    isWish: isWish,  // 현재 상태 반대로 전달 (삭제하면 false)
                    category: category
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // 찜 목록에서 해당 아이템을 제거
                    this.closest('.save_item').remove();  // 페이지에서 상품 제거
                } else {
                    alert('처리 중 오류가 발생했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('서버와의 통신에 실패했습니다.');
            });
        });
    });
</script>

</body>
</html>
