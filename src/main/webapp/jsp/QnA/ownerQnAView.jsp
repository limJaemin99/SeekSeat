<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&amp;A</title>
<link rel="stylesheet" type="text/css" href="../../css/owner.css">
</head>
<body>
<!-- 사장님 1:1 문의 내역 화면 -->
<jsp:include page="../includes/header.jsp"></jsp:include>

   <section id="QnAOwner">
      <h2>1:1문의</h2>
      <form action="QnAList?type=2" method="post">
         <table>
            <tr>
               <th>No</th>
               <th>문의자</th>
               <th>제목</th>
               <th>작성일</th>
               <th>처리현황</th>
            </tr>
            <c:forEach var="vo" items="${list }">
               <tr>
                  <td><c:out value="${vo.r }" /></td>
                  <td><c:out value="${user.id }" /></td>
                  <td><a href="read?type=2&writeNo=${vo.writeNo }&page=${paging.currentPage}#QnAOwner" ><c:out value="${vo.title }" /></a></td>
                  <td>
                     <%-- <c:out value="${vo.createdDate }" /> --%>
                      <fmt:formatDate value="${vo.createdDate }" pattern="yyyy-MM-dd HH:mm" />
                  </td>
                  <td>
                  	<c:if test="${vo.status == 1}"><a id="wait" style="color: blue; font-weight: bold;">대기</a></c:if>
                  	<c:if test="${vo.status == 2}"><a id="end" style="color: green; font-weight: bold;">답변완료</a></c:if>
                  </td>
               </tr>

            </c:forEach>
         </table>
         <div
            style="width: 800px; margin: auto; padding: 10px; text-align: center;">
            전체 글 개수 :
            <c:out value="${paging.totalCount }" />
            <br>
            <hr>
            <a class="pagenum" href="?type=2&page=1#QnAOwner">&lt;&lt;</a>
            <!--(1) 첫번째 페이지 1번으로 이동 -->

            <!--(2)  실행하면서 파악해보세요. -->
            <!-- 요청은 ListController가 받음.page파라미터 변경됨. -->
            <a class="pagenum" href="?type=2&page=${paging.startPage-1 }#QnAOwner"
               style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'>&lt;</a>

            <!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
            <c:forEach var="i" begin="${paging.startPage }"
               end="${paging.endPage }">
               <a class="pagenum ieach" href="?type=2&page=${i }#QnAOwner"><c:out
                     value="${i }" /></a>
            </c:forEach>

            <!--(4)  실행하면서 파악해보세요. -->
            <a class="pagenum" href="?type=2&page=${paging.endPage+1 }#QnAOwner"
               style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'>&gt;</a>

            <a class="pagenum" href="?type=2&page=${paging.totalPage }#QnAOwner">&gt;&gt;</a>
            <!--(5) 가장 마지막 페이지로 이동 -->
         </div>
      </form>
         
      <div class="button">
         <button onclick="location.href='write?type=2'">문의글 작성</button>
      </div>
   </section>

<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>

