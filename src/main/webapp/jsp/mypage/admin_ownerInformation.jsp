<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원정보</title>
<link rel="stylesheet" type="text/css" href="../../css/user.css">
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>
  
   <section class="carousel">
				<h1 style="font-size: 2.5em">🧑🏻‍🍳사업자 회원🍳</h1>
               <div class="reel" style="height: 500px;">
				<c:forEach items="${list }" var="vo">
				   <article  style="text-align: left;">
                     <header>
                      <a class="image featured">
                     <img src="../../image/기본사진.jpg" style="width: 300px; height: 300px;"></a>
                        <h3><a href="#">이름 : ${vo.name}</a></h3>
                        <h4>ID : ${vo.id }</h4>
                     	<h4>전화번호 : ${vo.tel}</h4>
                     	<h4>이메일 : ${vo.email}</h4>
                     </header>
                  </article>
					</c:forEach>
               </div>
            </section>
   <jsp:include page="../includes/footer.jsp"/>
   
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