const checkButton = document.getElementById('checkButton');
const container = document.getElementById('container');
const changePwContainer = document.querySelector('.change-pw-container');
const findPwContainer = document.querySelector('.find-pw-container');

const pwInput = document.querySelector('input[name="pw"]');
const checkPwInput = document.querySelector('#checkpw');
const submitButton = document.querySelector('button');

const customerFindButton = document.querySelector('.customerFind');
const businessFindButton = document.querySelector('.businessFind');

/*화면 전환*/
checkButton.addEventListener('click', () => {
	const frm = document.forms[1];
	const code = frm.code.value;
	let insertCode = frm.insertCode.value;
	if(code != ''){
		if(insertCode === code) {
			container.classList.add("right-panel-active");
			changePwContainer.style.opacity = 1;
			findPwContainer.style.opacity = 0;
			changePwContainer.style.display = 'block';
			findPwContainer.style.display = 'none';
		} else {
			/*인증 번호가 틀렸을때 동작을 여기에 구현(08.29)*/
			alert('인증번호가 일치하지 않습니다.')
		}
	} else {
		alert('인증이 완료되지 않았습니다.');
	}
});

/*customer, business 버튼 클릭시 색상 변경*/
customerFindButton.addEventListener('click', () => {
    customerFindButton.classList.add('clicked');
    businessFindButton.classList.remove('clicked');
});

businessFindButton.addEventListener('click', () => {
    businessFindButton.classList.add('clicked');
    customerFindButton.classList.remove('clicked');
});
