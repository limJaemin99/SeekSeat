<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="../../css/user.css">
</head>
<style>
	button{
		width: 100px; height: 45px;
		display :inline-block;
	}
</style>
<body>
<!-- 관리자 1:1 문의 처리 화면 -->
   
  <jsp:include page="../includes/header.jsp"></jsp:include>
   <section id="QnASection">
      <h2>1:1문의</h2>
      <form action="" method="get">
      	<input type="hidden" name="mType" value="0">
      	<input type="hidden" name="type" value="3">
      </form>
	     <div id="admindiv" style="text-align: center;">
         	<button name="customerBtn" onclick="selectType(1)">일반</button>
         	<button name="ownerBtn" onclick="selectType(2)">사업자</button>
         </div>
	      <script type="text/javascript">
	      	function selectType(n){
	      		const frm = document.forms[0];
	      		if(n==1){
	      			frm.mType.value = n;
	      		frm.action = 'list';
	      		}else if(n==2){
	      			frm.mType.value = n;
	      		frm.action = 'list';
	      		}
	      		frm.submit();
	      	}
	      </script>
         <table>
            <tr>
               <th>No</th>
               <th>문의자</th>
               <th>제목</th>
               <th>작성일</th>
               <th>처리현황</th>
            </tr>
            <c:forEach var="vo" items="${list }">
               <%-- <c:if test="${vo.user_id }.eqauls(${sessionScope.user.user_id })"> --%>
               <tr>
                  <td><c:out value="${vo.r }" /></td>
                  <td><c:choose>
		                <c:when test="${not empty vo.user_id}">
		                    <c:out value="${vo.user_id}"/>
		                </c:when>
		                <c:when test="${not empty vo.owner_id}">
		                    <c:out value="${vo.owner_id}"/>
		                </c:when>
		                <c:otherwise>
		                    작성자 정보 없음
		                </c:otherwise>
		            </c:choose>
                  </td>
                  <td><a href="read?type=3&writeNo=${vo.writeNo }&page=${paging.currentPage}&mType=${mType}#QnASection" ><c:out value="${vo.title }" /></a></td>
                  <td><fmt:formatDate value="${vo.createdDate }"
                        pattern="yyyy-MM-dd HH:mm" /></td>
                  <td>
                  	<c:if test="${vo.status == 1}"><a id="wait" style="color: blue; font-weight: bold;">대기</a></c:if>
                  	<c:if test="${vo.status == 2}"><a id="end" style="color: green; font-weight: bold;">답변완료</a></c:if>
                  </td>
               </tr>
               <%-- </c:if> --%>

            </c:forEach>
         </table>
         <div
            style="width: 800px; margin: auto; padding: 10px; text-align: center;">
            전체 글 개수 :
            <c:out value="${paging.totalCount }" />
            <br>
            <hr>
            <a class="pagenum" href="?type=3&page=1&mType=${mType}#QnASection">&lt;&lt;</a>
            <!--(1) 첫번째 페이지 1번으로 이동 -->

            <!--(2)  실행하면서 파악해보세요. -->
            <!-- 요청은 ListController가 받음.page파라미터 변경됨. -->
            <a class="pagenum" href="?type=3&page=${paging.startPage-1}&mType=${mType}#QnASection"
               style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'>&lt;</a>

            <!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
            <c:forEach var="i" begin="${paging.startPage }"
               end="${paging.endPage }">
               <a class="pagenum ieach" href="?type=3&page=${i}&mType=${mType}#QnASection"><c:out
                     value="${i}" /></a>
            </c:forEach>

            <!--(4)  실행하면서 파악해보세요. -->
            <a class="pagenum" href="?type=3&page=${paging.endPage+1}&mType=${mType}#QnASection"
               style='<c:if test="${paging.endPage==paging.totalPage}&mType=${mType}#QnASection">display:none;</c:if>'>&gt;</a>

            <a class="pagenum" href="?type=3&page=${paging.totalPage}&mType=${mType}#QnASection">&gt;&gt;</a>
            <!--(5) 가장 마지막 페이지로 이동 -->
         </div>
   </section>

 
<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>