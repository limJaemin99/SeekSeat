<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<link rel="stylesheet" href="../../assets/css/user_headerFooter.css" />
<link rel="stylesheet" type="text/css" href="../../css/user.css">
<link rel="stylesheet" type="text/css" href="../../css/user_Table.css">
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>
<section>
   <h1>좌석 정보</h1>
    
    <div id="seat-container"></div>   
    <div id="reserved-seats"></div>
    <div id="Reservation-container">
       <form action="/SeekSeat/TableReservationServlet" method="post">
          <label for="id">예약자ID:</label>
          <input type="text" id="id" name="id"><br>

          <label for="name">예약자명:</label>
          <input type="text" id="name" name="name"><br>

          <label for="date">예약 날짜:</label>
          <input type="date" id="date" name="date"><br>

          <label for="time">예약 시간:</label>
          <select id="time" name="time"></select><br>

          <label for="num">예약 인원</label>
          <input type="number" id="num" name="num"><br>

          <label for="table">예약 테이블:</label>
          <input type="text" id="table" name="table"><br>  

          <label for="message">예약 메세지:</label>
          <input type="text" id="message" name="message"><br>

          <br><input type="submit" id="Reservation" value="예약하기">
       </form>
    </div>
 
</section>
<jsp:include page="../includes/footer.jsp"></jsp:include>

<script type="text/javascript" src="../../js/sideMenu.js"></script>
<script type="text/javascript" src="../../js/user_Table.js"></script>
</body>
</html>