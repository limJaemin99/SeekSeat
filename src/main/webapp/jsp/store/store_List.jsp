<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리</title>
<link rel="stylesheet" type="text/css" href="../../css/owner.css?v=3">
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>
   <section>
      <br>
      <h2 style="margin: 0px; text-align: center;">매장 목록</h2>
      <br>
      <hr style="width: 1000px;">
      <form action="" method="get" >
         <input type="hidden" name="store_id" value="">
      </form>   
      <table>
         <tr>
            <th>매장 ID</th>
            <th>매장 이름</th>
            <th>카테고리</th>
            <th>메뉴 정보</th>
            <th>메뉴 수정/등록</th>
            <th>매장 정보 수정</th>
            <th>매장 삭제</th>
         </tr>
         <c:forEach items="${list}" var="vo" varStatus="status">
            <tr>
               <%-- <td id="store_id${status.count}"><input type="hidden" id="store_id"><c:out value="${vo.store_id}"/> --%>
               <td>
                  <a id="store_id${status.count}" data-value="${vo.store_id}">${vo.store_id}</a>
               </td>
               <td id="name${status.count}"><c:out value="${vo.name}"/></td>
               <td id="category${status.count}"><c:out value="${vo.category}"/></td>
               <td><a href="menuList?store_id=${vo.store_id}"><img src="../../image/메뉴정보.png"  style="width: 50px; height: 50px;"></a></td>
               <td><a href="updateMenuInfo?store_id=${vo.store_id}"><img src="../../image/메뉴수정.png"  style="width: 50px; height: 50px;"></a></td>
               <td><a href="updateStoreInfo?store_id=${vo.store_id}"><img src="../../image/매장.png"  style="width: 50px; height: 50px;"></a></td>
               <td><a href="deleteStoreInfo?store_id=${vo.store_id}&name=${vo.name}"><img src="../../image/휴지통.png" style="width: 50px; height: 50px;"></a></td>
            </tr>
         </c:forEach>
      </table>   
      <div id="storediv" style="text-align: center;">
         <button style="display :inline-block;" onclick="location.href='registerStoreInfo?type=2'">매장등록</button>
         </div>
     <!--  <script type="text/javascript"> 
         function server(storeid,n) {
            const frm = document.forms[0]
            frm.store_id.value=storeid
            if(n==1){
                frm.action = 'updateMenuInfo';
                frm.submit();
            }else if(n==2){
                frm.action = 'updateStoreInfo';
                frm.submit();
            }
         }
      </script> -->
   </section>
   <jsp:include page="../includes/footer.jsp"/>

</body>
</html>