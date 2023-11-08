/* 슬라이드 */
const slideWrap = document.querySelector(".slide_wrap");
const slideShow = slideWrap.querySelector(".slide_show");
const slideList = slideShow.querySelector(".slide_list");
const slides = slideList.querySelectorAll(".slide");
const slideBtn = slideWrap.querySelector(".slide_btn");

let slideCount = slides.length;
let slideWidth = slides[0].offsetWidth; // Assuming all slides have the same width
const showNum = 3;
let num = 0;
let currentIndex = 0;

const slideCopy = Array.from(slides).slice(0, showNum).map(slide => slide.cloneNode(true));
slideCopy.forEach(copy => slideList.appendChild(copy));

// 이미지 움직이기
function backShow() {
  if (num === 0) {
    // 시작
    num = slideCount;
    slideList.style.left = -num * slideWidth + "px";
  }
  num--;
  slideList.style.left = -slideWidth * num + "px";
}

function nextShow() {
  if (num === slideCount) {
    // 마지막
    num = 0;
    slideList.style.left = "0";
  }
  num++;
  slideList.style.left = -slideWidth * num + "px";
}

// 왼쪽, 오른쪽 버튼 설정
slideBtn.addEventListener("click", function(event) {
  const clickedButton = event.target;
  if (clickedButton.classList.contains("prev")) {
    // 왼쪽 버튼을 클릭
    backShow();
  } else {
    // 오른쪽 버튼을 클릭
    nextShow();
  }
});
