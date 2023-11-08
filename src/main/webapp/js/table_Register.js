document.addEventListener("DOMContentLoaded", function() {
	const seatContainer = document.querySelector(".seat-container");
	const dropZone = document.querySelector(".drop-zone");
	let isDragging = false;
	let selectedSeat = null;
	let offsetX = 0;
	let offsetY = 0;
	let seatCounter = 1; // 좌석 번호 초기값

	// 좌석 정보를 저장할 객체
	const seatData = {};

	seatContainer.addEventListener("mousedown", (event) => {
		
		if (event.target.classList.contains("seat")) {
			isDragging = true;
			selectedSeat = event.target;
			offsetX = event.clientX - selectedSeat.getBoundingClientRect().left;
			offsetY = event.clientY - selectedSeat.getBoundingClientRect().top;
		}
	});

	seatContainer.addEventListener("mousemove", (event) => {
		if (isDragging && selectedSeat !== null) {
			selectedSeat.style.position = "absolute";
			selectedSeat.style.zIndex = 1000;
			selectedSeat.style.left = (event.clientX - offsetX) + "px";
			selectedSeat.style.top = (event.clientY - offsetY) + "px";
		}
	});

	seatContainer.addEventListener("mouseup", (event) => {
		if (isDragging && selectedSeat !== null) {
			isDragging = false;
			selectedSeat = null;
			const type = event.target.className;
			let headCount = 0;

			if (type === "seatA")
				headCount = 2;
			else if (type === "seatB")
				headCount = 4;
			else if (type === "seatC")
				headCount = 6;

			const seatNumber = event.target.getAttribute("data-seat-number");
			const x = event.clientX - offsetX;
			const y = event.clientY - offsetY;
			
			if (seatNumber !== null) {
			seatData[seatNumber] = {
				seatNumber: seatNumber,
				left: x + "px",
				top: y + "px",
				headCount: headCount,
			};
			console.log(seatData);
		}
		}
	});

	let tableCount = 2;

	// 좌석 추가 버튼 클릭 이벤트 처리
	const addSeatButtons = document.querySelectorAll(".add-seat-button");
	addSeatButtons.forEach(button => {
		button.addEventListener("click", () => {
			tableCount++
			document.forms[0].tableCount.value = tableCount;
			console.log(document.forms[0].tableCount.value)
			const seatType = button.getAttribute("data-seat-type");
			if (seatType !== "W") {
				const newSeat = document.createElement("div");
				newSeat.className = "seat" + seatType;
				newSeat.textContent = seatType + seatCounter; // 좌석 번호 자동 증가
				const seatNumber = seatType + seatCounter; // 좌석 번호 설정
				newSeat.setAttribute("data-seat-number", seatNumber);
				seatCounter++;


				seatContainer.appendChild(newSeat);

				newSeat.addEventListener("mousedown", (event) => {
					isDragging = true;
					selectedSeat = event.target;
					offsetX = event.clientX - selectedSeat.getBoundingClientRect().left;
					offsetY = event.clientY - selectedSeat.getBoundingClientRect().top;
				});

				newSeat.addEventListener("mousemove", (event) => {
					if (isDragging && selectedSeat !== null) {
						selectedSeat.style.position = "absolute";
						selectedSeat.style.zIndex = 1000;
						selectedSeat.style.left = (event.clientX - offsetX) + "px";
						selectedSeat.style.top = (event.clientY - offsetY) + "px";
					}
				});

				newSeat.addEventListener("mouseup", () => {
					if (isDragging && selectedSeat !== null) {
					isDragging = false;
					selectedSeat = null;
					const type = event.target.className;
					let headCount = 0;

					if (type === "seatA")
						headCount = 2;
					else if (type === "seatB")
						headCount = 4;
					else if (type === "seatC")
						headCount = 6;

					const seatNumber = event.target.getAttribute("data-seat-number");
					const x = event.clientX - offsetX;
					const y = event.clientY - offsetY;

					if (seatNumber !== null) {
					seatData[seatNumber] = {
						seatNumber: seatNumber,
						left: x + "px",
						top: y + "px",
						headCount: headCount,
					};
					console.log(seatData);
					}
					}
				});
			} else {
				const newSeat = document.createElement("div");
				newSeat.className = "seat";
				newSeat.textContent = seatType; // 창은 번호를 증가시키지 않음
				const seatNumber = seatType; // 좌석 번호 설정
				newSeat.setAttribute("data-seat-number", seatNumber);

				seatContainer.appendChild(newSeat);
			}
		});
	});

	// 저장 버튼 클릭 이벤트 처리
	const saveButton = document.querySelector(".save-button");
	saveButton.addEventListener("click", () => {
		// 마지막으로 드래그한 좌석 정보만 JSON 문자열로 변환
		const seatDataArray = Object.values(seatData);
		const seatDataJSON = JSON.stringify(seatDataArray);
		console.log(seatDataJSON)
		// 쿠키에 좌석 정보를 저장합니다.
		document.cookie = `seatData=${encodeURIComponent(seatDataJSON)}`;
		console.log('마지막으로 드래그한 좌석 정보가 쿠키에 저장되었습니다.');
		/*tableCount 값 같이 넘겨줘야함*/
		document.forms[0].submit()
	});
});