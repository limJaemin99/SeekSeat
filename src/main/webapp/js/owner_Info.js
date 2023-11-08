/*전화번호 - 설정*/
function formatPhone() {
	let input = document.getElementById("phone");
	let value = input.value.replace(/[^\d]/g, ''); // 숫자 이외의 문자 제거
	let formattedValue = value.substring(0, 3) + "-" + value.substring(3, 7) + "-" + value.substring(7);
	input.value = formattedValue;
}

/*영업시간 콤보박스*/
function populateTimeSelect(selectId) {
	var select = document.getElementById(selectId);
	for (var hour = 0; hour < 24; hour++) {
		for (var minute = 0; minute < 60; minute += 30) {
			var timeString = (hour < 10 ? "0" : "") + hour + ":" + (minute === 0 ? "00" : minute);
			var option = document.createElement("option");
			option.value = timeString;
			option.text = timeString;
			select.appendChild(option);
		}
	}
}

function runTime1() {
	var runTime1 = document.getElementById("runTime1").value;
	// Do something with runTime1 if needed
}

function runTime2() {
	var runTime2 = document.getElementById("runTime2").value;
	// Do something with runTime2 if needed
}