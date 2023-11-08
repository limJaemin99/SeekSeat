<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE HTML>
<html>
<head>
	<title>SeekSeat</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="styleSheet" href="assets/css/main.css" />
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">
		<div id="header">
			<div class="inner">
				<header>
					<!-- <h1><a href="home" id="logo">SEEK SEAT</a></h1>
					<h5>in GangNam</h5> -->
					<hr>
					<form action="jsp/search/search" method="get">
					<div class="search-container">
						<select id="address" style="width: 20%; height: 50px; display: inline-block; padding: 0; margin-right: 10px; border-radius: 5px;">   
							<option value="none" style="text-align: center;">---선택---</option>
							<option value="서울특별시 강남구 강남대로 396" style="text-align: center;">강남역</option>
							<option value="서울특별시 강남구 테헤란로 156" style="text-align: center;">역삼역</option>
							<option value="서울특별시 강남구 테헤란로 538" style="text-align: center;">삼성역</option>
							<option value="서울특별시 강남구 테헤란로 340" style="text-align: center;">선릉역</option>
							<option value="서울특별시 강남구 봉은사로 102" style="text-align: center;">신논현역</option>
						</select>
						<input type="hidden" id="station" name="station" value="">
						<input name="keyword" type="search" id="searchInput" placeholder="Search...">
						<button type="button" class="searchButton" onclick="check()"></button>
					</div>
					<script type="text/javascript">
						var select = document.getElementById("address");
							select.addEventListener("change", station);
                            
						function station() {
							var select = document.getElementById("address");
							var selectedOption = select.options[select.selectedIndex].text;
							let station = document.getElementById("station");
							station.value = selectedOption;
						}
                            	
						function check() {
							var frm = document.forms[0]
							let address = frm.address.value
							let keyword = frm.keyword.value
							if(address == 'none')
								alert('주소를 선택해주세요')
							else if(keyword == '')
								alert('검색어가 입력되지 않았습니다')
							else
								frm.submit()
						}
					</script>
					</form>
				</header>
				<footer>
					<a href="#banner" class="button circled scrolly">
						<i class="fas fa-solid fa-arrow-down"></i>
					</a>
				</footer>
			</div>
			<nav id="nav">
				<ul style="padding: 0px">
					<li><a href="home">Home</a></li>
					<c:if test="${sessionScope.user.member_type == null}">
						<li><a href="jsp/login/login?forReserve=false">LogIn / SignUp</a></li>
					</c:if>
 <!-- 일반 회원 -->	<c:if test="${sessionScope.user.member_type == 1}">
						<li>
							<a href="jsp/mypage/main?type=1">마이페이지</a>
							<ul>
								<li><a href="#">예약 내역</a></li>
								<li><a href="jsp/favorite/userFavorite">즐겨찾기</a></li>
								<li><a href="#">최근 방문</a></li>
							</ul>
						</li>
						<li><a href="jsp/QnA/list?type=1">1:1 문의</a></li>
						<li><a href="jsp/mypage/userInfo?type=1">내 정보</a></li>
                        </c:if>
 <!-- 사장님 -->			<c:if test="${sessionScope.user.member_type == 2}">
							<li>
								<a href="#">매장 관리</a>
								<ul>
									<li><a href="jsp/store/registerStoreInfo">매장 추가</a></li>
									<li>
										<a href="jsp/store/storeList">내 매장</a>
										<ul>
											<c:forEach var="list" items="${storeList}">
												<li>
													<a href="#">${list.name}</a>
														<ul>
															<li><a href="jsp/table/registerTable?store_id=${list.store_id}">테이블 등록/수정</a></li>
															<li><a href="jsp/store/storeMenu?store_id=${list.store_id}">메뉴 등록</a></li>
                                                			<li><a href="jsp/store/menuList?store_id=${list.store_id}">메뉴 수정/삭제</a></li>
                                                			<li><a href="jsp/store/updateStoreInfo?store_id=${list.store_id}">매장 정보</a></li>
                                             			</ul>
                                          		</li>
                                       		</c:forEach>
                                    	</ul>
                                 	</li>
									<li><a href="#">예약 현황</a></li>
								</ul>
							</li>
							<li><a href="jsp/QnA/list?type=2">1:1 문의</a></li>
							<li><a href="jsp/mypage/userInfo?type=2">내 정보</a></li>
						</c:if>
 <!-- 관리자 -->			<c:if test="${sessionScope.user.member_type == 3}">
							<li>
								<a href="jsp/QnA/list?type=3">1:1 문의 관리</a></li>
								<li><a href="jsp/mypage/userList">일반 회원</a></li>
								<li><a href="jsp/mypage/ownerList">사업자 회원</a></li>
								<li><a href="jsp/mypage/storeRead">등록 매장</a></li>
						</c:if>
                        <c:if test="${sessionScope.user.member_type != null}">
                        	<li><a href="index">LogOut</a></li>
						</c:if>
					</ul>
				</nav>
			</div>

            <section id="banner">
               <header>
                  <h2>오늘의 추천</h2>
                  <p>
                     Today's recommended Restaurants.
                  </p>
               </header>
			</section>


            <section class="carousel">
               <div class="reel">
				<input type="hidden" id="member_type" name="member_type" value="${sessionScope.user.member_type}">
				<c:forEach items="${listAll }" var="vo">
				   <article>
                     <a href="javascript:newWindow('${vo.store_id }')" class="image featured"><img alt="${vo.mainPictureUrl}" src="/upload/${vo.store_id}/${vo.mainPictureUrl}"></a>
                     <header>
                        <h3>${vo.name}</h3>
                        <c:if test="${vo.station == '강남역' }">
                        <a href="javascript:newWindow2(222)"><img src="./image/강남역.jpg"style="width: 120px;height: 50px;"></a>
                        </c:if>
                        <c:if test="${vo.station == '역삼역' }">
                        <a href="javascript:newWindow2(221)"><img src="./image/역삼역.jpg"style="width: 120px;height: 50px;"></a>
                        </c:if>
                        <c:if test="${vo.station == '삼성역' }">
                        <a href="javascript:newWindow2(219)"><img src="./image/삼성역.jpg"style="width: 120px;height: 50px;"></a>
                        </c:if>
                        <c:if test="${vo.station == '선릉역' }">
                        <a href="javascript:newWindow2(220)"><img src="./image/선릉역.jpg"style="width: 120px;height: 50px;"></a>
                        </c:if>
                        <c:if test="${vo.station == '신논현역' }">
                        <a href="javascript:newWindow2(925)"><img src="./image/신논현역.jpg"style="width: 120px;height: 50px;"></a>
                        </c:if>
                        <pre style="font-size: 10px; white-space: initial;height: 50px;line-height: initial">${vo.hashtag }</pre>
                     	<p style="font-size: 13px;">${vo.content}</p>
                     </header>
                  </article>
					</c:forEach>
               </div>
            </section>
   
         <!-- Features -->
            <c:if test="${sessionScope.user.member_type == 1}">
               <div class="wrapper style1">
                  <section class="scrollable-section" id="section2">
                      <jsp:include page="jsp/community/list.jsp"/>
                     </section>
               </div>
             </c:if>

         <!-- Footer -->
            <div id="footer">
               <div class="container">               
                  <!-- Copyright -->
                  <div class="copyright">
                     <ul class="menu">
                        <li>&copy; Seek Seat. All rights reserved.</li>
                     </ul>
                  </div>
               </div>
            </div>
      </div>

      
      
      
	<script src="https://kit.fontawesome.com/252e7f2829.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/index.js"></script>
	<script type="text/javascript">
		function newWindow(id) {
   			let member_type = document.getElementById('member_type').value
   			
   			let options = "toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200, height=1000, top=0,left=0";

   			window.open("jsp/search/searchStoreInfo?store_id="+id+"&member_type="+member_type,"_blank", options);
		}
	</script>
	<script type="text/javascript">
		function newWindow2(id) {
			let options = "toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no,width=450, height=520, top=250,left=700";

   			window.open("https://map.naver.com/p/subway/1000/entry/"+id,"_blank", options);
		}
	</script>

</body>
</html>