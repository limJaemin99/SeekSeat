const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const businessButton = document.getElementById('b_signUp');
const container = document.getElementById('container');
const sign_inContainer = document.querySelector('.sign-in-container')
const sign_upContainer = document.querySelector('.sign-up-container');
const businessContainer = document.querySelector('.business-container');

signUpButton.addEventListener('click', () => {
  container.classList.add("right-panel-active");
  sign_upContainer.style.display = "block";
  sign_inContainer.style.display = "none";
  businessContainer.style.display = "none"; // business-container 숨김
});

signInButton.addEventListener('click', () => {
  container.classList.remove("right-panel-active");
  sign_inContainer.style.display = "block";
  sign_upContainer.style.display = "none"; // sign-up-container 숨김
  businessContainer.style.display = "none"; // business-container 숨김
});

businessButton.addEventListener('click', () => {
  container.classList.add("right-panel-active");
  businessContainer.style.display = "block";
  sign_inContainer.style.display = "none";
  sign_upContainer.style.display = "none"; // sign-up-container 숨김
  businessContainer.classList.add("overlay-right");
});


function formatPhone() {
    let input = document.getElementById("phone");
    let value = input.value.replace(/[^\d]/g, ''); // 숫자 이외의 문자 제거
    let formattedValue = value.substring(0, 3) + "-" + value.substring(3, 7) + "-" + value.substring(7);
    input.value = formattedValue;
}

function formatBusinessNo() {
    let input = document.getElementById("businessno");
    let value = input.value.replace(/[^\d]/g, ''); // 숫자 이외의 문자 제거
    let formattedValue = value.substring(0, 3) + "-" + value.substring(3, 5) + "-" + value.substring(5);
    input.value = formattedValue;
}
function formatBusinessPhone() {
    let input = document.getElementById("businessphone");
    let value = input.value.replace(/[^\d]/g, ''); // 숫자 이외의 문자 제거
    let formattedValue = value.substring(0, 3) + "-" + value.substring(3, 7) + "-" + value.substring(7);
    input.value = formattedValue;
}