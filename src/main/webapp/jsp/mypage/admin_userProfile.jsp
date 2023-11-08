<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" type="text/css" href="../../css/owner.css?v=3">
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>
   <section>
      <br>
      <h2 style="margin: 0px; text-align: center;">일반 회원 목록</h2>
      <br>
      <hr style="width: 1000px;">
      <table>
         <tr>
            <th>이름</th>
            <th>이메일</th>
            <th>주소</th>
         </tr>
         <c:forEach items="${list}" var="vo">
            <tr>
               <td>${vo.name}</td>
               <td>${vo.email}</td>
               <td>${vo.address}</td>
            </tr>
         </c:forEach>
      </table>   
      <div id="storediv" style="text-align: center;">
         <button style="display :inline-block;" onclick="location.href='userProfile'">자세히 보기</button>
         </div>
   </section>
   <jsp:include page="../includes/footer.jsp"/>

</body>
</html>