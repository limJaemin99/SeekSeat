<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리</title>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, width=device-width">
<link rel="stylesheet" href="../../assets/css/owner_headerFooter.css" />
<link rel="stylesheet" type="text/css" href="../../css/owner.css">
<link rel="stylesheet" type="text/css" href="../../css/owner_Table.css">
</head>
<body>
<!-- 사장님 정보 수정 화면 -->
<div id="header" style="padding: 50px 0px;">

               <!-- Inner -->
                        <h1><a href="../../home" id="logo">SEEKSEAT</a></h1>

               <!-- Nav -->
                  <nav id="nav">
                  
                     <ul style="padding: 0px">
                        <li><a href="../../home">Home</a></li>
         <!-- 일반 회원 -->   <c:if test="${sessionScope.user.member_type == 1}">
                           <li>
                              <a href="../mypage/main?type=1">마이페이지</a>
                              <ul>
                                 <li><a href="#">예약 내역</a></li>
                                 <li><a href="#">즐겨찾기</a></li>
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
                                             	<li><a href="../table/registerTable?store_id=${list.store_id}">테이블 등록/수정</a></li>
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
<form action="registerTable" method="post">
	<input type="hidden" name="tableCount" value="">
	<input type="hidden" name="store_id" value="${store_id}">
	<input type="hidden" name="x_coordinate" id="x_coordinate" value="">
	<input type="hidden" name="y_coordinate" id="y_coordinate" value="">
		<section>
			<h2>테이블 관리</h2>
			<br>
			<div class="container">
				<div class="drop-zone"></div>
				<div class="seat-container">
					<div class="seat" id="toilet" data-seat-number="toilet">Toilet</div>
					<div class="seat" id="door" data-seat-number="door">Door</div>
				</div>
			</div>

			<div class="button-container">
				<button type="button" class="add-seat-button" data-seat-type="A">2인석(A)
					좌석 추가</button>
				<button type="button" class="add-seat-button" data-seat-type="B">4인석(B)
					좌석 추가</button>
				<button type="button" class="add-seat-button" data-seat-type="C">6인석(C)
					좌석 추가</button>
				<!-- <button class="add-seat-button" data-seat-type="W">창문(W) 추가</button> -->
				<button type="button" class="save-button">저장</button>
			</div>
		</section>
</form>
	
<%-- <jsp:include page="../includes/footer.jsp"></jsp:include> --%>
	
<script type="text/javascript" src="../../js/table_Register.js"></script>
<script src="https://kit.fontawesome.com/252e7f2829.js"></script>
         <script src="../../assets/js/jquery.min.js"></script>
         <script src="../../assets/js/jquery.dropotron.min.js"></script>
         <script src="../../assets/js/jquery.scrolly.min.js"></script>
         <script src="../../assets/js/jquery.scrollex.min.js"></script>
         <script src="../../assets/js/browser.min.js"></script>
         <script src="../../assets/js/breakpoints.min.js"></script>
         <script src="../../assets/js/util.js"></script>
         <script src="../../assets/js/main.js"></script>
</body>
</html>


