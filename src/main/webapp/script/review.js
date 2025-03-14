console.log("스크립트 파일 정상 로드 확인");

function List2() {
	console.log("페이지함수 작동")
}
List2();

//최신순, 평점 높은순, 평점 낮은순 class 함수
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
const contextPath = "/Semi_Project_Skip/";


function getList(pageNum) {
    console.log("함수호출 확인, pageNum:" + pageNum);
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
        const reviewList = document.querySelector(".review_list");
        reviewList.innerHTML = ""; // 기존 리스트 초기화 (중복 방지)
        const resp = xhr.responseText;
        const json = JSON.parse(resp);

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
            if (reviewDto.reviewImg) {
                imgTag = `<img src=${contextPath}/reviewImgs/${reviewDto.reviewImg}>`;
            }

            review_item.innerHTML = `
                <div class= "user_review">
                    <div class= "item_content">
                        <div class= "rating_box">
                            <div class= "star_box">${stars}</div>
                            <span class="rating_number">${reviewDto.rating} 점</span>
                        </div>
                        <div class="user_box">
                            <p class="user_id">${reviewDto.uuid}</p>
                            <p class="created_at">${reviewDto.createdAt}</p>
                            <div class="content">
                                <p>${reviewDto.resortComment}</p>
                            </div>
                        </div>
                    </div>
                    <div class="item_img">${imgTag}</div>
                </div>
                <div class="item_ctrl">
                    <a href="${contextPath}/jsp/update?reviewId=${reviewDto.reviewId}">수정</a>
                    <a href="${contextPath}/jsp/delete?reviewId=${reviewDto.reviewId}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
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
	        prevBtn.href = `javascript:getList(${json.startPage - 1})`;
	        prevBtn.innerHTML = `<i class='fa fa-angle-left'></i> 이전`;
	        page_btn.appendChild(prevBtn);
	    }

	    // 페이지 숫자 버튼
	    for (let i = json.startPage; i <= json.endPage; i++) {
	        let pageLink = document.createElement("a");
	        pageLink.href = `javascript:getList(${i})`;
	        pageLink.textContent = i;
	        if (i === json.pageNum) {
	            pageLink.classList.add("active"); // 현재 페이지 강조
	        }
	        page_btn.appendChild(pageLink);
	    }

	    // 다음 버튼
	    if (json.endPage < json.pageCount) {
	        let nextBtn = document.createElement("a");
	        nextBtn.href = `javascript:getList(${json.endPage + 1})`;
	        nextBtn.innerHTML = `다음 <i class='fa fa-angle-right'></i>`;
	        page_btn.appendChild(nextBtn);
	    }
	};

    xhr.open('get', `${contextPath}/review/list?pageNum=${pageNum}`, true);
    xhr.send();
}

// 함수 호출
getList(1);


