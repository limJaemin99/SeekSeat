<%@page import="org.vo.StoreInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
   <title>SeekSeat</title>
   <meta charset="UTF-8" />
   <meta name="viewport"
      content="width=device-width, initial-scale=1, user-scalable=no" />
   <link rel="stylesheet" href="../../css/search.css" />
   <link rel="stylesheet" href="../../css/search_list.css" />
   <link rel="stylesheet" href="../../css/owner.css" />
</head>
<body class="no-sidebar is-preload">
      <!-- Header -->
     <div id="header" style="padding: 20px 0px;">
               <!-- Inner -->
                        <h1 style="margin-bottom: 0px;"><a id="logo">SEEKSEAT</a></h1>
                        <h5>in GangNam</h5>
            </div>
    <hr style="width: 100%;">
   <section style="margin-bottom: 100px; background: white;">
      <br>
      <input type="hidden" name="session" id="session" value="${user.member_type}">
      <input type="hidden" name="store_id" id="store_id" value="${store_id}">
      <div style="text-align: center;  position: relative;">
      <c:if test="${store.mainPictureUrl != null}">
         <img alt="${store.mainPictureUrl}" src="/upload/${store_id}/${store.mainPictureUrl}" style="width: 800px; height: 500px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);">
        </c:if>
      <c:if test="${store.mainPictureUrl == null}">
         <img alt="이미지 준비중" src="../../image/no_img.jpg" style="width: 820px; height: 520px;">
        </c:if>
         <div style="width: 750px; height:200px; position: absolute; left: 50%; transform: translate(-50%, -50%); background: white; padding: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);">
			<h1 style="text-align: center;margin: 10px 0 10px 0;">${name}
			<c:if test="${sessionScope.user.member_type == 1}">
				<c:if test="${isFavorite == 1}">
					<a onclick="favorite()">
						<img src="../../image/북마크ON.png" style="width:40px; height: 30px; vertical-align: middle; padding-right: 10px; float: right;">
					</a>
				</c:if>
				<c:if test="${isFavorite == 0}">
					<a onclick="favorite()">
						<img src="../../image/북마크OFF.png" style="width:40px; height: 30px; vertical-align: middle; padding-right: 10px; float: right;">
					</a>
				</c:if>
			</c:if>
				<c:if test="${sessionScope.user.member_type != 1}">
					<a onclick="favorite()">
						<img src="../../image/북마크리본.jpg" style="width:40px; height: 30px; vertical-align: middle; padding-right: 10px; float: right;">
					</a>
				</c:if>
				</h1>
            <p>카테고리:${store.category}/평점(${store.rating})/<a ${store.reviewCount}>리뷰</a></p>
         </div>
      </div>
      <div id="storeButton">   <!-- ━━━━━━━━━━ 버튼 ━━━━━━━━━━ -->
         <button id="storeInfo" style="width: 50px; height: 50px; padding: 0;"><img src="../../image/가게정보.jpg" style="width: 100%; height: 100%; padding: 0;">매장정보</button>
         <button id="menu" style="width: 50px; height: 50px; padding: 0;"><img src="../../image/메뉴정보.jpg"style="width: 100%; height: 100%; padding: 0;">메뉴정보</button>
         <button id="reserve" style="width: 50px; height: 50px; padding: 0;"><img src="../../image/예약.jpg" style="width: 100%; height: 100%; padding: 0;">예약</button>
         <p style="position: relative;margin: 0;">가게정보/메뉴정보/예약</p>
      </div>
      <div id="storeInfoSection" style="height: 500px;">   <!-- ━━━━━━━━━━ 매장 정보 ━━━━━━━━━━ -->
         <form action="searchStoreInfo?store_id=" method="get" >
            <input type="hidden" name="store_id" value="">
             <table style="margin-top: -90px; padding-top: 75px; max-width: 800px; text-align: left;">
                <tr>
                <td colspan="10" style="vertical-align: middle; height: 120px;"></td>
                </tr>
                <tr>
                <td colspan="10"><strong style="font-weight: 1000;">상세정보</strong></td>
                </tr>
               <tr>
               <td style="vertical-align: middle;"><img src="../../image/address.jpg" style="width:40px; height: 30px; vertical-align: middle; padding-right: 10px ">${store.address }</td>
                </tr>
               <tr>
               <td style="vertical-align: middle;"><img src="../../image/전화.jpg" style="width:40px; height: 30px; vertical-align: middle; padding-right: 10px ">${store.store_tel }</td>
                </tr>
               <tr>
               <td style="vertical-align: middle;">
             <img src="../../image/시간.jpg" style="width: 40px; height: 30px; vertical-align: middle; padding-right: 10px ">
             ${openTime }~${closeTime }
             <c:choose>
                 <c:when test="${currentTime lt openTime}">
                     <span style="color: blue;">영업전</span>
                 </c:when>
                 <c:when test="${currentTime ge openTime && currentTime le closeTime}">
                     <span style="color: green;">영업중</span>
                 </c:when>
                 <c:when test="${currentTime gt closeTime}">
                     <span style="color: red;">영업종료</span>
                 </c:when>
             </c:choose>
         </td>
                </tr>
               <tr>
               <td style="vertical-align: middle;"><img src="../../image/달력.jpg" style="width:40px; height: 30px; vertical-align: middle; padding-right: 10px ">${store.closedDays }</td>
            </tr>
               <tr>
               <td style="vertical-align: middle;"><img src="../../image/소개글.jpg" style="width:40px; height: 30px; vertical-align: middle; padding-right: 10px ">${store.content }</td>
            </tr>
               <tr>
               <td style="vertical-align: middle;"><img src="../../image/지하철.jpg" style="width:40px; height: 30px; vertical-align: middle; padding-right: 10px ">
               <c:if test="${store.station == '강남역' }">
                        <a href="javascript:newWindow2(222)"><img src="../../image/강남역.jpg"style="width: 100px;height: 45px;vertical-align: middle;"></a>
                        </c:if>
                        <c:if test="${store.station == '역삼역' }">
                        <a href="javascript:newWindow2(221)"><img src="../../image/역삼역.jpg"style="width: 100px;height: 45px;vertical-align: middle;"></a>
                        </c:if>
                        <c:if test="${store.station == '삼성역' }">
                        <a href="javascript:newWindow2(219)"><img src="../../image/삼성역.jpg"style="width: 100px;height: 45px;vertical-align: middle;"></a>
                        </c:if>
                        <c:if test="${store.station == '선릉역' }">
                        <a href="javascript:newWindow2(220)"><img src="../../image/선릉역.jpg"style="width: 100px;height: 45px;vertical-align: middle;"></a>
                        </c:if>
                        <c:if test="${store.station == '신논현역' }">
                        <a href="javascript:newWindow2(925)"><img src="../../image/신논현역.jpg"style="width: 100px;height: 45px;vertical-align: middle;"></a>
                        </c:if>
               </td>
            </tr>
               <tr>
               <td style="vertical-align: middle;"><img src="../../image/북마크.jpg" style="width:40px; height: 30px; vertical-align: middle; padding-right: 10px "><a>${store.hashtag }</a></td>
            </tr>
      </table>     
         </form>
      </div>
        <div id="menuSection">   <!-- ━━━━━━━━━━ 메뉴 정보 ━━━━━━━━━━ -->
         <table style="margin-top: -90px; padding-top: 75px; max-width: 800px;">
         <tr>
                <td colspan="10" style="vertical-align: middle; height: 123px;"></td>
                </tr>
         <tr>
            <th>사진</th>
            <th>메뉴 이름</th>
            <th>가격</th>
            <th>설명</th>
            <th>추천메뉴</th>
         </tr>
         <c:forEach items="${menuList}" var="vo" varStatus="status">
            <tr>
               <td id="menuPictureUrl">
               <c:if test="${vo.menuPictureUrl != null}">
                 <img alt="${vo.menuPictureUrl}" src="/upload/${store_id}/${vo.menuPictureUrl}">
               </c:if>
               <c:if test="${vo.menuPictureUrl == null}">
                 <img alt="메뉴 이미지 없음" src="../../image/no_menu.jpg">
               </c:if>
               </td>
               
               <td id="menu_name"><c:out value="${vo.menu_name}"/></td>
               <td id="price"><c:out value="${vo.price}"/></td>
               <td id="content"><c:out value="${vo.content}"/></td>
               <td id="best">
                  <c:if test="${vo.best == 'on'}">
                     <a>👍</a>
                  </c:if>
                  <c:if test="${vo.best == null}">
                     <a>━</a>
                  </c:if>
               </td>
            </tr>
         </c:forEach>
      </table>
      </div>
      <div id="reservationSection" style="text-align: center;">   <!-- ━━━━━━━━━━ 예약 ━━━━━━━━━━ -->
         <h1>예약 페이지</h1>   
         <iframe src="../reserve/reservation?store_id=${store_id}&store_name=${name}" style="margin-top: -90px; padding-top: 75px; width: 1100px; height: 950px;"></iframe>      
      </div>
   </section>
   <!-- Footer -->
   <jsp:include page="../includes/footer.jsp"></jsp:include>
   
   <!-- Scripts -->
   <script src="https://kit.fontawesome.com/252e7f2829.js"></script>
   <script src="../../assets/js/jquery.min.js"></script>
   <script src="../../assets/js/jquery.dropotron.min.js"></script>
   <script src="../../assets/js/jquery.scrolly.min.js"></script>
   <script src="../../assets/js/jquery.scrollex.min.js"></script>
   <script src="../../assets/js/browser.min.js"></script>
   <script src="../../assets/js/breakpoints.min.js"></script>
   <script src="../../assets/js/util.js"></script>
   <script src="../../assets/js/main.js"></script>
   <script src="../../assets/js/index.js"></script>
   <script type="text/javascript">
   //초기 화면 띄우기
      document.getElementById("storeInfoSection").style.display = "block";
    document.getElementById("menuSection").style.display = "none";
    document.getElementById("reservationSection").style.display = "none";
    
    // 매장 정보 버튼
    document.getElementById("storeInfo").addEventListener("click", function() {
        document.getElementById("storeInfoSection").style.display = "block";
        document.getElementById("menuSection").style.display = "none";
        document.getElementById("reservationSection").style.display = "none";
    });
    
    // 메뉴 버튼
    document.getElementById("menu").addEventListener("click", function() {
       document.getElementById("storeInfoSection").style.display = "none";
        document.getElementById("menuSection").style.display = "block";
        document.getElementById("reservationSection").style.display = "none";
    });
    
    // 예약 버튼
    document.getElementById("reserve").addEventListener("click", function() {
       let session = document.getElementById('session').value;
       let store_id = document.getElementById('store_id').value;
       
       if(session == '1') {
          document.getElementById("storeInfoSection").style.display = "none";
            document.getElementById("menuSection").style.display = "none";
            document.getElementById("reservationSection").style.display = "block";
       } else {
          var result = confirm('예약은 일반회원 로그인이 필요합니다.\n로그인 하시겠습니까?');
          
          if(result){
             console.log('로그인으로');
             location.href = '../login/loginForReserve?member_type='+session+'&store_id='+store_id;
          } else {
             console.log('로그인하지 않음');
          }
       }
    });
   </script>
   <script type="text/javascript">
         function newWindow2(id) {
            console.log(id)
            let options = "toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no,width=450, height=520, top=250,left=700";

            window.open("https://map.naver.com/p/subway/1000/entry/"+id,"_blank", options);
      }
   </script>
	<script type="text/javascript">
		function favorite() {
			let session = document.getElementById('session').value;
	    	let store_id = document.getElementById('store_id').value;
	    	
	    	if(session == '1') {	//일반회원 O
	    		location.href = '../favorite/favorite?store_id='+store_id;
	    	} else {	//일반회원 X
	    		var result = confirm('즐겨찾기 기능은 일반회원 로그인이 필요합니다.\n로그인 하시겠습니까?');
	    		
	    		if(result){
	    			console.log('로그인으로');
	    			location.href = '../login/loginForReserve?member_type='+session+'&store_id='+store_id;
	    		} else {
	    			console.log('로그인하지 않음');
	    		}
	    	}
		}
	</script>

</body>
</html>