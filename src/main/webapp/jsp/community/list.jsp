<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEEK SEAT</title>
<link rel="styleSheet" href="css/list.css">	<!-- 홈 화면에서 실행했을때의 CSS 경로 -->
<link rel="styleSheet" href="../../css/list.css">	<!-- 독립적으로 실행했을때의 CSS 경로 -->
</head>
<body>
<!-- 커뮤니티 list 화면 -->
<main id="list">
<h2>Seek Seat 커뮤니티</h2>
<hr style="color:white;">
<div style="margin:auto;width:900px;">
<ul id="main">
   <li>
      <ul  class="row">
         <li class="head">번호</li>
         <li class="head">제목</li>
         <li class="head">작성자</li>
         <li class="head">작성일</li>
      </ul>
   </li>
   
    <c:forEach var="vo" items="${home}"> 
   <li>
      <ul  class="row">
         <li class="data">
            <c:out value="${vo.r }"/>
         </li>
         <li class="data"><a href="jsp/community/read?writeNo=${vo.writeNo }&page=${paging.currentPage}" class="title">  <!-- 현재페이지 번호 전달 시작 -순서1) -->
               <c:out value="${vo.title }"/>
            </a>
         <li class="data">
            <c:out value="${vo.id }"/><%-- (<c:out value="${vo.ip }"/>) --%>
         </li>
         <li  class="data" id="date">
            <fmt:formatDate value="${vo.createdDate }" pattern="yyyy-MM-dd hh:mm:ss"/>
         </li>
         
      </ul>
   </li>
    </c:forEach>
   </ul>
   <div style="width:800px;margin: auto;padding: 10px;text-align: center;">
   전체 글 개수 : <c:out value="${paging.totalCount }"/> <br>
   <hr>
   <a class="pagenum" href="?page=1#section2">&lt;&lt;</a>   <!--(1) 첫번째 페이지 1번으로 이동 -->
   
   <!--(2)  실행하면서 파악해보세요. --> <!-- 요청은 ListController가 받음.page파라미터 변경됨. -->
   <a class="pagenum" href="?page=${paging.startPage-1 }#section2"      
         style='<c:if test="${paging.startPage==1 }">display:none;</c:if>' >&lt;</a>
   
   <!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
   <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
      <a class="pagenum ieach" href="?page=${i }#section2"><c:out value="${i }"/></a>
   </c:forEach>
   
   <!--(4)  실행하면서 파악해보세요. -->
   <a class="pagenum" href="?page=${paging.endPage+1 }#section2"
         style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'   >&gt;</a>
         
   <a class="pagenum" href="?page=${paging.totalPage }#section2">&gt;&gt;</a>  <!--(5) 가장 마지막 페이지로 이동 -->
</div>
   <div style="float:right;margin:0px 40px;">
<%--       <a href="write?page=${paging.currentPage }" class="button" >글쓰기</a> --%>  
      <!-- 로그인 상태가 아니면 로그인으로 이동으로 변경 -->
      <a href="javascript:write()" class="button">글쓰기</a>
   </div>
</div>
<script type="text/javascript">
   function write() {
      let yn
      if('${user.id}'==''){
         yn=confirm('글쓰기는 로그인이 필요합니다. 로그인 하시겠습니까?')
         if(yn) location.href='./login?back=w'  // 로그인 후 글쓰기 url로 redirect 하기 위한 파라미터
      }else{
         location.href='jsp/community/write?page=${paging.currentPage }'
      }
   }
</script>
</main>

<script type="text/javascript">
   const pnums = document.querySelectorAll('.ieach');
   pnums.forEach(function(item){
      console.log(item);
      /* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
      if(item.innerHTML=='${paging.currentPage}') {    
         item.style.color = 'black';
         item.style.fontWeight = 'bold';
      }else{
         item.style.color = '#37966f';
      }
   });
</script>
</body>
</html>

