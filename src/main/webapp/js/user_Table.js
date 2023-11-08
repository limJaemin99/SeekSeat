// 저장된 좌석 정보를 쿠키에서 읽어오는 함수
function getSeatData() {
   const cookieValue = document.cookie.replace(/(?:(?:^|.*;\s*)seatData\s*\=\s*([^;]*).*$)|^.*$/, "$1");
   return JSON.parse(decodeURIComponent(cookieValue));
}

// 쿠키에서 좌석 정보를 읽어와 화면에 표시
const seatData = getSeatData();
const seatContainer = document.getElementById("seat-container");
const reservedSeats = document.getElementById("reserved-seats");
const selectedSeats = [];

// 선택한 좌석 정보를 저장할 변수
let selectedTable = "";

// 이미 예약된 정보를 저장할 변수
const reservedInfo = [];

// 좌석 정보를 화면에 표시
if (seatData) {
   for (const seatInfo of seatData) {
      const seatNumber = seatInfo.seatNumber;
      const left = seatInfo.left;
      const top = seatInfo.top;

      const seatElement = document.createElement("div");
      seatElement.textContent = seatNumber;
      seatElement.className = "seat"; // 좌석 클래스 추가
      seatElement.style.left = left;
      seatElement.style.top = top;

      seatElement.addEventListener("click", seatClickHandler); // 클릭 이벤트 추가

      seatContainer.appendChild(seatElement);
   }
} else {
   seatContainer.textContent = "저장된 좌석 정보가 없습니다.";
}

// 좌석 선택 클릭 이벤트 핸들러
function seatClickHandler(event) {
   const seatElement = event.target;
   if (seatElement.classList.contains("seat")) {
      // 선택한 좌석의 상태를 토글
      seatElement.classList.toggle("selected");
      const seatNumber = seatElement.textContent;
      if (seatElement.classList.contains("selected")) {
         selectedSeats.push(seatNumber);
      } else {
         const index = selectedSeats.indexOf(seatNumber);
         if (index !== -1) {
            selectedSeats.splice(index, 1);
         }
      }

      // 선택한 좌석 정보를 인풋 필드에 표시
      selectedTable = selectedSeats.join(", ");
      document.getElementById("table").value = selectedTable;

   } else {
      reservedSeats.textContent = "선택된 좌석이 없습니다.";
   }
}

const timeSelect = document.getElementById("time");

// 예약하기 버튼 클릭 이벤트 핸들러
document.getElementById("Reservation").addEventListener("click", function(event) {
  event.preventDefault(); // 폼 제출 방지

  // 사용자가 선택한 시간, 날짜 및 테이블 위치 가져오기
  const selectedTime = document.getElementById("time").value;
  const selectedDate = document.getElementById("date").value;
  const selectedTable = document.getElementById("table").value;

  // 중복 예약 여부 확인
  if (isReservationDuplicate(selectedTime, selectedDate, selectedTable)) {
    alert("이미 예약된 테이블입니다.");
  } else {
    // 중복 예약이 아니면 예약 정보를 저장하고 폼을 서버로 제출할 수 있습니다.
    reservedInfo.push({
      time: selectedTime,
      date: selectedDate,
      table: selectedTable
    });
    alert("예약이 완료되었습니다.");
    // 여기서 폼 제출 또는 서버로 데이터 전송을 추가할 수 있습니다.
  }
});

// 중복 예약 확인 함수
function isReservationDuplicate(time, date, table) {
  for (const reservation of reservedInfo) {
    if (reservation.time === time && reservation.date === date && reservation.table === table) {
      return true; // 중복 예약이 있으면 true 반환
    }
  }
  return false; // 중복 예약이 없으면 false 반환
}

// 시간 옵션 생성
for (let hours = 0; hours < 24; hours++) {
   for (let minutes = 0; minutes < 60; minutes += 30) {
      const hourText = hours.toString().padStart(2, '0');
      const minuteText = minutes.toString().padStart(2, '0');
      const timeOption = document.createElement("option");
      timeOption.value = `${hourText}:${minuteText}`;
      timeOption.textContent = `${hourText}:${minuteText}`;
      timeSelect.appendChild(timeOption);
   }
}