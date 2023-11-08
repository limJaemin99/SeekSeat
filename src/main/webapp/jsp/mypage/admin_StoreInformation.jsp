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
   <h1 style="font-size: 2.5em">🏬매장🏬</h1>
               <div class="reel">
            <input type="hidden" id="member_type" value="${sessionScope.user.member_type}">
            <c:forEach items="${list }" var="vo">
               <article>
                     <a href="javascript:newWindow('${vo.store_id }')" class="image featured"><img alt="${vo.mainPictureUrl}" src="/upload/${vo.store_id}/${vo.mainPictureUrl}"></a>
                     <header>
                        <h3>${vo.name}</h3>
                        <c:if test="${vo.station == '강남역' }">
                        <a href="javascript:newWindow2(222)"><img src="../../image/강남역.jpg"style="width: 120px;height: 50px;"></a>
                        </c:if>
                        <c:if test="${vo.station == '역삼역' }">
                        <a href="javascript:newWindow2(221)"><img src="../../image/역삼역.jpg"style="width: 120px;height: 50px;"></a>
                        </c:if>
                        <c:if test="${vo.station == '삼성역' }">
                        <a href="javascript:newWindow2(219)"><img src="../../image/삼성역.jpg"style="width: 120px;height: 50px;"></a>
                        </c:if>
                        <c:if test="${vo.station == '선릉역' }">
                        <a href="javascript:newWindow2(220)"><img src="../../image/선릉역.jpg"style="width: 120px;height: 50px;"></a>
                        </c:if>
                        <c:if test="${vo.station == '신논현역' }">
                        <a href="javascript:newWindow2(925)"><img src="../../image/신논현역.jpg"style="width: 120px;height: 50px;"></a>
                        </c:if>
                        <pre style="font-size: 10px; white-space: initial;height: 50px;line-height: initial">${vo.hashtag }</pre>
                        <p style="font-size: 10px;">${vo.content}</p>
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
         <script type="text/javascript">
         function newWindow(id) {
            let member_type = document.getElementById('member_type').value
            
            let options = "toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1200, height=1000, top=0,left=0";

            window.open("../search/searchStoreInfo?store_id="+id+"&member_type="+member_type,"_blank", options);
      }
   </script>
          <script type="text/javascript">
         function newWindow2(id) {
            console.log(id)
            let options = "toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no,width=450, height=520, top=250,left=700";

            window.open("https://map.naver.com/p/subway/1000/entry/"+id,"_blank", options);
      }
   </script>

</body>
</html>