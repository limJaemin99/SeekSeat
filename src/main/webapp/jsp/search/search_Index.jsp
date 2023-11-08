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
</head>
<body class="no-sidebar is-preload">
   <div id="page-wrapper">

      <!-- Header -->
     <div id="header" style="padding: 50px 0px;">

               <!-- Inner -->
                        <h1 style="margin-bottom: 0px;"><a href="../../home" id="logo">SEEKSEAT</a></h1>
                        <h5>in GangNam</h5>

               <!-- Nav -->
                  <nav id="nav">
                  
                     <ul style="padding: 0px">
                        <li><a href="../../home">Home</a></li>
         <!-- 일반 회원 -->   <c:if test="${sessionScope.user.member_type == 1}">
                           <li>
                              <a href="../mypage/main?type=1">마이페이지</a>
                              <ul>
                                 <li><a href="#">예약 내역</a></li>
                                 <li><a href="../favorite/userFavorite">즐겨찾기</a></li>
                                 <li><a href="#">최근 방문</a></li>
                              </ul>
                           </li>
                           <li><a href="../QnA/list?type=1">1:1 문의</a></li>
                           <li><a href="../mypage/userInfo?type=1">내 정보</a></li>
                        </c:if>
         <!-- 사장님 -->      <c:if test="${sessionScope.user.member_type == 2}">
                           <li>
                              <a href="#">매장 관리</a>
                              <ul>
                                 <li><a href="../store/registerStoreInfo">매장 추가</a></li>
                                 <li>
                                    <a href="../store/storeList">내 매장</a>
                                    <ul>
                                       <c:forEach var="list" items="${storeList}">
                                          <li>
                                             <a href="#">${list.name}</a>
                                             <ul>
												<li><a href="../store/storeMenu?store_id=${list.store_id}">메뉴 등록</a></li>
                                                <li><a href="../store/menuList?store_id=${list.store_id}">메뉴 수정/삭제</a></li>
                                                <li><a href="../store/updateStoreInfo?store_id=${list.store_id}">매장 정보</a></li>
                                             </ul>
                                          </li>
                                       </c:forEach>
                                    </ul>
                                 </li>
                                 <li><a href="#">예약 현황</a></li>
                              </ul>
                           </li>
                           <li><a href="../QnA/list?type=2">1:1 문의</a></li>
                           <li><a href="../mypage/userInfo?type=2">내 정보</a></li>
                        </c:if>
         <!-- 관리자 -->      <c:if test="${sessionScope.user.member_type == 3}">
                           <li>
                              <a href="../QnA/list?type=3">1:1 문의 관리</a>
                        </c:if>
                        <c:if test="${sessionScope.user.member_type != null}">
                           <li><a href="../../index">LogOut</a></li>
                        </c:if>
                     </ul>
                  </nav>

            </div>

      <!-- Main -->
      <div class="wrapper style1">
         <div class="container">
            <div id="main" class="special">
               <header>
               <form action="search" method="get">
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

               <section>
               <div id="map" style="width:80%;height:500px;margin:auto"></div>
               <input type="hidden" id="address" value="${address}">
               <input type="hidden" id="keyword" value="${keyword}">
               <c:forEach var="list" items="${storelist}" varStatus="status">
                  <input id="store${status.index+1}" type="hidden" value="${list.address}">
                  <input id="name${status.index+1}" type="hidden" value="${list.name}">
               </c:forEach>
               <input type="hidden" id="size" value="${size}">
               <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c8e886dfc4b607b31c4e32cc2de7bac&libraries=services"></script>
               <script>
               // 마커를 담을 배열입니다
                  var markers = [];
               
                  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                          mapOption = {
                              center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                              disableDoubleClick : false,
                              level: 4 // 지도의 확대 레벨
                       };  
                  
                      // 지도를 생성합니다    
                      var map = new kakao.maps.Map(mapContainer, mapOption); 
                
                      // 주소-좌표 변환 객체를 생성합니다
                      var geocoder = new kakao.maps.services.Geocoder();
                      
                      // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
                      var infowindow = new kakao.maps.InfoWindow({zIndex:1});
                      
                      // 장소 검색 객체를 생성합니다
                      var ps = new kakao.maps.services.Places();
                      
                      let address = document.getElementById('address').value
                      
                      // 키워드로 장소를 검색합니다
                      let keyword = document.getElementById('keyword').value
                      
                      // 한번에 출력할 리스트의 갯수를 설정합니다
                      var options = {size : 5}
                      
                      ps.keywordSearch(keyword, placesSearchCB, options);
                      // 키워드 검색 완료 시 호출되는 콜백함수 입니다
                      function placesSearchCB (data, status, pagination) {
                          if (status === kakao.maps.services.Status.OK) {
                             // 검색 목록과 마커를 표출합니다
                            displayPlaces(data);

                            // 페이지 번호를 표출합니다
                            displayPagination(pagination);
                          } 
                      }
                      
                   // 검색 결과 목록과 마커를 표출하는 함수입니다
                      function displayPlaces(places) {

                         var listEl = document.getElementById('placesList'), menuEl = document
                               .getElementById('menu_wrap'), fragment = document
                               .createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';
                         // 검색 결과 목록에 추가된 항목들을 제거합니다
                         removeAllChildNods(listEl);
                     
                         // 지도에 표시되고 있는 마커를 제거합니다
                         removeMarker();
                         
                         for (var i = 0; i < places.length; i++) {

                            // 마커를 생성하고 지도에 표시합니다
                            var placePosition = new kakao.maps.LatLng(places[i].y,
                                  places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
                                  i, places[i]); // 검색 결과 항목 Element를 생성합니다

                            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                            // LatLngBounds 객체에 좌표를 추가합니다
                            bounds.extend(placePosition);

                            // 마커와 검색결과 항목에 mouseover 했을때
                            // 해당 장소에 인포윈도우에 장소명을 표시합니다
                            // mouseout 했을 때는 인포윈도우를 닫습니다
                            (function(marker, title) {
                               kakao.maps.event.addListener(marker, 'mouseover',
                                     function() {
                                        displayInfowindow(marker, title);
                                     });

                               kakao.maps.event.addListener(marker, 'mouseout',
                                     function() {
                                        infowindow.close();
                                     });

                               itemEl.onmouseout = function() {
                                  infowindow.close();
                               };
                            })(marker, places[i].place_name);

                            fragment.appendChild(itemEl);
                         }

                         // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
                         listEl.appendChild(fragment);

                         // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                         map.setBounds(bounds);
                      }
                      
                   // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
                      function displayPagination(pagination) {
                         var paginationEl = document.getElementById('pagination'), fragment = document
                               .createDocumentFragment(), i;

                         // 기존에 추가된 페이지번호를 삭제합니다
                         while (paginationEl.hasChildNodes()) {
                            paginationEl.removeChild(paginationEl.lastChild);
                         }

                         for (i = 1; i <= pagination.last; i++) {
                            var el = document.createElement('a');
                            el.href = "#";
                            el.innerHTML = i;

                            if (i === pagination.current) {
                               el.className = 'on';
                            } else {
                               el.onclick = (function(i) {
                                  return function() {
                                     pagination.gotoPage(i);
                                  }
                               })(i);
                            }

                            fragment.appendChild(el);
                         }
                         paginationEl.appendChild(fragment);
                      }
                      
                   // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                      function addMarker(position, idx, title) {
                         var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                         imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
                         imgOptions = {
                            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                            spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                            offset : new kakao.maps.Point(13, 37)
                         // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                         }, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
                               imgOptions), marker = new kakao.maps.Marker({
                            position : position, // 마커의 위치
                            image : markerImage
                         });

                         marker.setMap(map); // 지도 위에 마커를 표출합니다
                         markers.push(marker); // 배열에 생성된 마커를 추가합니다

                         return marker;
                      }
                      
                       // 검색결과 항목을 Element로 반환하는 함수입니다
                        function getListItem(index, places) {
                           var el = document.createElement('li'), itemStr = `<span class="markerbg marker_\${index + 1}"></span>
                                 <div class="info">
                                    <h3><a href="javascript:kakaoPlace('\${places.place_url}')">\${places.place_name}</a></h3>`;

                           if (places.road_address_name) {
                              itemStr += '    <span>' + places.road_address_name + '</span>'
                           } else {
                              itemStr += '    <span>' + places.address_name + '</span>';
                           }

                           itemStr += '  <span class="tel">' + places.phone + '</span>'
                                 + '</div>';

                           el.innerHTML = itemStr;
                           el.className = 'item';

                           return el;
                        }
                      
                       
                     // 검색결과 목록의 자식 Element를 제거하는 함수입니다
                      function removeAllChildNods(el) {
                         while (el.hasChildNodes()) {
                            el.removeChild(el.lastChild);
                         }
                      }
                     
                      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
                      function removeMarker() {
                         for (var i = 0; i < markers.length; i++) {
                            markers[i].setMap(null);
                         }
                         markers = [];
                      }
                     
                      // 인포윈도우에 장소명을 표시합니다
                      function displayInfowindow(marker, title) {
                         var content = '<div style="padding:5px;z-index:1;">' + title
                               + '</div>';

                         infowindow.setContent(content);
                         infowindow.open(map, marker);
                      }   
                      
                  //임의로 등록한 가게
                  let size = document.getElementById('size').value;

                  for (var i = 1; i <= size; i++) {
                     let store = document.getElementById('store'+i).value
                     // 가게 이름
                     let name = document.getElementById('name'+i).value
                     geocoder.addressSearch(store, function(result, status) {
                         // 정상적으로 검색이 완료됐으면 
                          if (status === kakao.maps.services.Status.OK) {
                           
                             let coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);
                           
                             var imageSrc = '../../image/customMarker.png', // 마커이미지의 주소입니다    
                                imageSize = new kakao.maps.Size(70, 70), // 마커이미지의 크기입니다
                                imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                               
                            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                                markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

                             
                             // 결과값으로 받은 위치를 마커로 표시합니다
                             let marker2 = new kakao.maps.Marker({
                                 map: map,
                                 position: coords2,
                                 image: markerImage
                             });
                             
                             // 마커에 클릭이벤트를 등록합니다
                                kakao.maps.event.addListener(marker2, 'click', function() {
                                
                                // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                                infowindow.setContent('<div style="padding:5px;font-size:12px;">' + name + '</div>');
                                infowindow.open(map, marker2);
                                }); 
                         }
                     }); 
                  }
                      
                      function displayMarker(place) {
                          
                          // 마커를 생성하고 지도에 표시합니다
                          var marker = new kakao.maps.Marker({
                              map: map,
                              position: new kakao.maps.LatLng(place.y, place.x) 
                          });
                      
                          // 마커에 클릭이벤트를 등록합니다
                          kakao.maps.event.addListener(marker, 'click', function() {
                              // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                              infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                              infowindow.open(map, marker);
                          });
                      }
                      
                      // 주소로 좌표를 검색합니다
                      geocoder.addressSearch(address, function(result, status) {
                      
                       // 정상적으로 검색이 완료됐으면 
                       if (status === kakao.maps.services.Status.OK) {
                         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                           map.setCenter(coords);
                       } 
                      }); 
                </script>
               </section>

            </div>
            <hr>
            <section class="list-container">
               <div class="row" id="restaurantList" style="text-align: center; width: 100%; margin: 0;">
                     <div style="width: 50%; padding: 0px; border-right: 1px solid lightgray; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                        <h4 style="text-align: center; margin: 10px 0px; padding-bottom: 10px; border-bottom: 1px solid lightgray;">검색 결과</h4>
                        <ul id="placesList" style="font-size: 12pt; line-height: 0.8em; padding-right: 1em;"></ul>
                  <div id="pagination"></div>
                     </div>
                     <input type="hidden" id="member_type" name="member_type" value="${sessionScope.user.member_type}">
                     <div style="width: 50%; padding: 0px; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                        <h4 style="text-align: center; margin: 10px 0px; padding-bottom: 10px; border-bottom: 1px solid lightgray;">SeekSeat 이용 가능 매장</h4>
                        <ul id="placesList2" style="font-size: 12pt; line-height: 0.8em; padding-right: 1em;">
                        <c:forEach var="list" items="${storelist}" varStatus="status" begin="0" end="4">
                              <li class="item">
                              <span class="markerbg marker_${status.index+1}"></span>
                        <div class="info">
                                 <h3><a href="javascript:newWindow('${list.store_id}')">${list.name}</a></h3>
                                 <span>${list.address}</span>
                                 <span class="tel">${list.store_tel}</span>
                        </div>
                              </li>
                           </c:forEach>
                        </ul>
                     </div>
               </div>
            </section>
         </div>

      </div>

   <!-- Footer -->
   <jsp:include page="../includes/footer.jsp"></jsp:include>
   </div>

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
         function newWindow(id) {
        	let member_type = document.getElementById('member_type').value
            
        	console.log(member_type)
        	
        	if(member_type != '1' || member_type != '2' || member_type != '3')
        		member_type = '0'
        	
        	console.log(member_type)
            let options = "toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200, height=1000, top=0,left=0";
			
            window.open("searchStoreInfo?store_id="+id+"&member_type="+member_type,"_blank", options);
      	}
         function kakaoPlace(address) {
            console.log('함수 실행 완료')
         let options = "toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200, height=1000, top=0,left=0";
            window.open(address,"_blank" , options);
            console.log('함수 실행 완료2')
      }
   </script>



</body>
</html>