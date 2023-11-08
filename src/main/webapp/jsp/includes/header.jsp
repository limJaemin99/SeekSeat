<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/headerFooter.css" />
</head>
<body>
   <!-- Header -->
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
                                             	<li><a href="../table/registerTable?store_id=${list.store_id}">테이블 등록/수정</a></li>
   <!-- 메뉴 추가 등록 고민 09.05 -->               <li><a href="../store/storeMenu?store_id=${list.store_id}">메뉴 등록</a></li>
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
                              </li>
                              <li>
                              <a href="../mypage/userList">일반 회원</a>
                              </li>
                              <li>
                              <a href="../mypage/ownerList">사업자 회원</a>
                              </li>
                              <li>
                              <a href="../mypage/storeRead">등록 매장</a>
                              </li>
                             
<!--                               <ul>
                                 <li><a href="#">Lorem ipsum dolor</a></li>
                                 <li><a href="#">Magna phasellus</a></li>
                                 <li><a href="#">Etiam dolore nisl</a></li>
                                 <li>
                                    <a href="#">And a submenu &hellip;</a>
                                    <ul>
                                       <li><a href="#">Lorem ipsum dolor</a></li>
                                       <li><a href="#">Phasellus consequat</a></li>
                                       <li><a href="#">Magna phasellus</a></li>
                                       <li><a href="#">Etiam dolore nisl</a></li>
                                    </ul>
                                 </li>
                                 <li><a href="#">Veroeros feugiat</a></li>
                              </ul>
                           </li>
                           <li><a href="left-sidebar.html">Left Sidebar</a></li>
                           <li><a href="right-sidebar.html">Right Sidebar</a></li>
                           <li><a href="no-sidebar.html">No Sidebar</a></li>
 -->
                        </c:if>
                        <c:if test="${sessionScope.user.member_type != null}">
                           <li><a href="../../index">LogOut</a></li>
                        </c:if>
                     </ul>
                  </nav>

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
</body>
</html>