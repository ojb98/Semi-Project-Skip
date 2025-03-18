/**
 * 
 */

console.log("파일 정상 로드");

window.List2 = function() {
  console.log("페이지함수");
}

//function getList(pageNum)

function getList(pageNum) {
  console.log("함수호출 확인, pageNum:" + pageNum);
  const xhr = new XMLHttpRequest();
  xhr.onload = function () {
    const reviewList = document.querySelector(".review_list");
    
    const resp = xhr.responseText;
    const json = JSON.parse(resp);
    console.log(json + "호출확인");

    json.list.forEach(function (reviewList) {
      const review_item = document.createElement("li");
      review_item.className = "review_item";
      const reviews = json.list;


      reviews.forEach(function (review) {
        /* 평점 별 */
        let starts = "";
        for (let i = 0; i < review.rating; i++) {
          starts += `<i class="fa fa-star"></i>`;
        }

        /* 리뷰이미지 */
        let imgTag = "";
        if (review.reviewImg) {
          imgTag = `<img src=${contextPath}/reviewImgs/${review.reviewImg}>`;
        }

        review_item.innerHTML = `
          <div class= "user_review">
            <div class= "item_content">
              <div class= "rating_box">
                <div class= "star_box">
                  ${starts}
                </div>
                <span class="rating_number">${review.rating} 점</span>
              </div>
              <div class="user_box">
                <p class="user_id">${review.uuid}</p>
                <p class="created_at">${review.createdAt}</p>
                <div class="content">
                  <p>${review.resortComment}</p>
                </div>
              </div>
              <div class="item_img">
                ${imgTag}
              </div>
            </div>
          </div>
          <div class="item_ctrl">
            <a href="${contextPath}/jsp/update?reviewId=${review.reviewId}">수정</a>
            <a href="${contextPath}/jsp/delete?reviewId=${review.reviewId}" onclick = "return confirm ('정말 삭제하시겠습니까?');">삭제</a>	                  	
          </div>
        `
      })
    })
    //페이징
    const page_btn = document.querySelector(".page_btn");

    let str = "<div>";

    //이전 버튼
    if (json.startPage > 10) {
      str += "<a href='javascript:getList(" + (json.startPage - 1) + ")'><i class='fa fa-angle-left'></i>이전</a>";
    }

    //페이지 숫자
    for (let i = json.startPage; i <= json.endPage; i++) {
      if (i == json.pageNum) {
        str += "<a href='javascript:getList(" + i + ")' class='active'>" + i + "</a>";
      } else {
        str += "<a href='javascript:getList(" + i + ")'>i</a>";
      }
    }

    //다음 버튼
    if (json.endPage < json.pageCount) {
      str += "<a href='javascript:getList(" + (json.endPage + 1) + ")'<i class='fa fa-angle-right'></i>다음</a>";
    }

    str += "</div>"
    page_btn.innerHTML += str;
  }
  xhr.open('get', `${contextPath}/review/list?pageNum=${pageNum}`, true);
  xhr.send();
}
getList(1);

      // const div = document.createElement("div");
      // const str = ` "리뷰아이디:" + ${reviewDto.reviewId} + <br> +
      // "결제아이디:" + ${reviewDto.paymentId} + <br> +
      // "아이디:" + ${reviewDto.uuid} + <br> +
      // "리조트아이디:" + ${reviewDto.resortId} + <br> +
      // "별점:" + ${reviewDto.rating} + <br> +
      // "리뷰내용:" + ${reviewDto.resortComment} + <br> +
      // "리뷰이미지:" + ${reviewDto.reviewImg} + <br>
      // `
      // div.innerHTML=str;
      // div.className="comm";
      // reviewList.appendChild(div);

      
      //리뷰 정렬
function reviewSort(sortType) {
	console.log("sort 함수 작동 테스트");
	const xhr = new XMLHttpRequest();
	xhr.onload = function() {
		const resp = xhr.responseText;
		const json = JSON.parse(resp);
		console.log(json + "호출확인");
		
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
                    <a href="javascript:updatePopup(${reviewDto.reviewId})">수정</a>
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
	
	xhr.open('get', `${contextPath}/review/array?sort=${sortType}`, true);
	xhr.send();
}
reviewSort(null);