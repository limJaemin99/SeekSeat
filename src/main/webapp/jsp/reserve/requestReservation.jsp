<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%-- <jsp:include page="../includes/header.jsp"></jsp:include> --%>
   <div style="text-align: center;">
      <table style="border: 1px solid black; margin: auto;">
            <tr>
               <th><label for="sName">매장이름</label></th>
               <td><input type="text" id="sName" name="store_name" value="${store_name}" readonly="readonly"></td>   
            </tr>
   
            <tr>
               <th><label for="rName">예약자 이름</label></th>
               <td><input type="text" id="rName" name="user_name" value="${user.name}" readonly="readonly"></td>   
            </tr>
            <tr>
               <th><label for="hCount">인원수</label></th>
               <td><input type="number" id="hCount" name="headCount"></td>   
            </tr>
   
            <tr>
               <th><label for="rDate">예약날짜</label></th>
               <td><input type="date" id="rDate" name="reserve_day"></td>   
            </tr>
      </table>
   </div>
   <hr>
   <form action="#" method="get">
   <div style="width: 1000px; height: 600px; margin: auto;">
      <img alt="noTable" src="../../image/테이블 준비중.jpg" style="width: 1000px; height: 600px;">
   </div>
   <div style="text-align: center;">
      <table style="margin: auto;">
         <tr>
            <td>&nbsp;&nbsp;</td>   
            <th><label for="hCount">예약 메시지</label></th>
            <td><input type="text" id="rMessage" name="headCount"></td>   
         </tr>
      </table>
      
      <label for="rTime">시간 선택</label>
      <div id="rTime">
         <button class="time_button" name="16:00" value="16:00">16:00</button>
         <button class="time_button" name="16:30" value="16:30">16:30</button>
         <button class="time_button" name="17:00" value="17:00">17:00</button>
         <button class="time_button" name="17:30" value="17:30">17:30</button>
         <button class="time_button" name="18:00" value="18:00">18:00</button>
         <button class="time_button" name="18:30" value="18:30">18:30</button>
         <input type="hidden" value="" name="reserve_time" id="reserve_time">
      </div>
      
      
      <br>
      <button type="submit" style="margin: auto; width: 300px; height: 60px;">예약하기</button>
   </div>
   </form>

 <%-- <jsp:include page="../includes/footer.jsp"></jsp:include> --%>
 
<script type="text/javascript">
   // 예약날짜 최소값 지정하는 함수 (min값 지정해서 오늘 이전 날짜 지정불가)
   // 휴무일도 지정할 수 있게 해야하는데 아직 미구현(09.15)
      const now = new Date();
      const year = now.getFullYear();
      const month = (now.getMonth() + 1).toString().padStart(2, '0');
      const day = now.getDate().toString().padStart(2, '0');
      const minDate = year + '-' + month + '-' + day;
      console.log(minDate);
      document.getElementById("rDate").min = minDate;
</script> 

<script type="text/javascript">
      // 현재 시간 이전 시간은 선택 못하게 하는 함수
      function setDisableButton() {

         const rTime = document.getElementById("rTime");
         const allButtons = rTime.querySelectorAll(".time_button");

         const now = new Date();
         const hour = now.getHours();
         const minute = now.getMinutes();

         allButtons.forEach(function(button) {
            const buttonTimes = button.value.split(":");
            const buttonHour = parseInt(buttonTimes[0]);
            const buttonMinute = parseInt(buttonTimes[1]);

            if (buttonHour < hour
                  || (buttonHour === hour && buttonMinute <= minute)) {
               button.style.backgroundColor = "grey";
               button.disable = true;

            }
         });
      }

      setDisableButton();
      // 예약 시간 선택을 감싸는 부모 div 요소
      const rTime = document.getElementById("rTime");

      // 부모 div에 클릭 이벤트 리스너 추가
      rTime
            .addEventListener("click",function(event) {
                     if (event.target.classList.contains("time_button")) {
                         event.preventDefault(); // 이벤트의 기본 동작(페이지 새로고침) 막기
                        const clickedButton = event.target;

                        if (clickedButton.style.backgroundColor === "green") {
                           // 이미 green이면 초기 색상으로 변경
                           clickedButton.style.backgroundColor = "";
                           setDisableButton();
                           // 색상이 green이면 해당 값을 reserve-time input의 value로 설정
                           document.getElementById("reserve_time").value = "";
                        } else {
                           // 다른 버튼들의 색깔을 초기화
                           const allButtons = rTime
                                 .querySelectorAll(".time_button");
                           allButtons.forEach(function(otherButton) {
                              otherButton.style.backgroundColor = "";
                           });
                           // 클릭한 버튼만 green으로 변경
                           clickedButton.style.backgroundColor = "green";
                           setDisableButton();
                           // 클릭한 버튼의 값을 reserve-time input의 value로 설정
                           document.getElementById("reserve_time").value = clickedButton.value;
                        }
                     }
                  });
   </script>


</body>
</html>