const menuToggle = document.getElementById('menu-toggle');
const sidebar = document.getElementById('sidebar');

menuToggle.addEventListener('click', () => {
	if (sidebar.style.left === '-250px') {
		sidebar.style.left = '0';
	} else {
		sidebar.style.left = '-250px';
	}
});



/* 토글 사이드바 외부를 클릭하면 사이드바가 닫히도록 설정*/
document.addEventListener('click', (event) => {
  const targetElement = event.target;

  if (targetElement !== menuToggle && targetElement !== sidebar && !sidebar.contains(targetElement)) {
    sidebar.style.left = '-250px';
  }
});