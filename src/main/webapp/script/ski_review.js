
//최신순, 평점 높은순, 평점 낮은순 선택시 색상 변화
const filterBtns = document.querySelectorAll(".filter_btn");

filterBtns.forEach(function (btn) {
    btn.addEventListener("click", function () {
        // 모든 버튼에서 active 제거
        filterBtns.forEach(btn => btn.classList.remove("active"));
        // 현재 클릭한 버튼에 active 추가
        this.classList.add("active");
    });
});

// contextPath 변수
const contextPath = "/test/";


// 리뷰 정렬 및 페이징
function reviewSort(sortType, ski_id ,pageNum = 1) {
	const xhr = new XMLHttpRequest();
	xhr.onload = function() {
		const resp = xhr.responseText;
		const json = JSON.parse(resp);

		const reviewList = document.querySelector(".review_list");
		reviewList.innerHTML = ""; // 기존 리스트 초기화

		json.list.forEach(function (reviewDto) {
			const review_item = document.createElement("li");
			
			review_item.className = "review_item";

			/* 평점 별 */
			let stars = "";
			for (let i = 0; i < reviewDto.rating; i++) {
				stars += `<i class="fa fa-star"></i>`;
			}

			/* 리뷰 이미지 */
			let imgTag = "";
			if (reviewDto.review_img) {
				imgTag = `<img src=${contextPath}/reviewImgs/${reviewDto.review_img}>`;
			}

			review_item.innerHTML = `
				<div class="user_review">
					<div class="item_content">
						<div class="rating_box">
							<div class="star_box">${stars}</div>
							<span class="rating_number">${reviewDto.rating} 점</span>
						</div>
						<div class="user_box">
							<p class="uuid">uuid: ${reviewDto.uuid}</p>
							<p class="user_id">유저아아디: ${reviewDto.user_id}</p>
							<p class="created_at">작성일: ${reviewDto.created_at}</p>
							<div class="content">
								<p>리뷰내용: ${reviewDto.review_comment}</p>
							</div>
						</div>
					</div>
					<div class="item_img">${imgTag}</div>
				</div>
			`;
			reviewList.appendChild(review_item);
		});

		// 페이징 처리
		const page_btn = document.querySelector(".page_btn");
		page_btn.innerHTML = ""; // 기존 버튼 초기화

		// 이전 버튼
		if (json.startPage > 10) {
			let prevBtn = document.createElement("a");
			prevBtn.href = `javascript:reviewSort('${sortType}',${ski_id}, ${json.startPage - 1})`;
			prevBtn.innerHTML = `<i class='fa fa-angle-left'></i> 이전`;
			page_btn.appendChild(prevBtn);
		}

		// 페이지 숫자 버튼
		for (let i = json.startPage; i <= json.endPage; i++) {
			let pageLink = document.createElement("a");
			pageLink.href = `javascript:reviewSort('${sortType}',${ski_id}, ${i})`;
			pageLink.textContent = i;
			if (i === json.pageNum) {
				pageLink.classList.add("active");
			}
			page_btn.appendChild(pageLink);
		}

		// 다음 버튼
		if (json.endPage < json.pageCount) {
			let nextBtn = document.createElement("a");
			nextBtn.href = `javascript:reviewSort('${sortType}', ${ski_id},${json.endPage + 1})`;
			nextBtn.innerHTML = `다음 <i class='fa fa-angle-right'></i>`;
			page_btn.appendChild(nextBtn);
		}
	};

	xhr.open('get', `${contextPath}/ski/review?sort=${sortType}&pageNum=${pageNum}&ski_id=${ski_id}`, true);
	xhr.send();
}





