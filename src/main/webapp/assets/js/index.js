function adjustSearchBar() {
  const searchContainer = document.querySelector('.search-container');
  const searchInput = document.getElementById('searchInput');
  
  if (window.innerWidth >= 1100) { 
    searchInput.style.width = '500px'; // 원하는 가로 길이 조절
  } else {
    searchInput.style.width = '100%';
  }
}

window.addEventListener('resize', adjustSearchBar);
adjustSearchBar(); // 초기 로드 시 검색창 스타일 조정