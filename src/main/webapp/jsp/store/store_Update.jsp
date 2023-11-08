<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리</title>
<meta name="viewport"
   content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
<link rel="stylesheet" type="text/css" href="../../css/owner.css">
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>
   <section>
      <h2>STORE INFORMATION</h2>
      <br>
      <form action="updateStoreInfo?store_id=${storeInfo.store_id}" method="post" enctype="multipart/form-data">
         <table>
            <tr>
               <th><label for="userid">사장님 ID</label></th>
               <td><input type="text" id="userid" name="id" value="${sessionScope.user.id}" readonly="readonly"></td>
            </tr>
            <tr>
               <th><label for="store_id">매장 ID</label></th>
               <td><input type="text" id="store_id" name="store_id" value="${storeInfo.store_id}" readonly="readonly"></td>
            </tr>
            <tr>
               <th><label for="storeName">매장 이름</label></th>
               <td><input type="text" id="storeName" name="name" value="${storeInfo.name }" readonly="readonly"></td>
            </tr>
            <tr>
               <th><label for="phone">전화번호</label></th>
               <td><input id="phone" name="store_tel" type="text" size="11"
                  maxlength="13" oninput="formatPhone()" value="${storeInfo.store_tel }" readonly="readonly"></td>
            </tr>
            <tr>
               <th><label for="adr">주소</label></th>
               <td><input type="text" id="adr" name="address" value="${storeInfo.address }"></td>
            </tr>
            <tr>
               <th><label for="adrstation">인근 역</label></th>
               <td><select id="adrstation" name="station">   
                              <option value="none" style="text-align: center;">----------------선 택----------------</option>
                                <option value="강남역" style="text-align: center;">강남역</option>
                              <option value="역삼역" style="text-align: center;">역삼역</option>
                              <option value="삼성역" style="text-align: center;">삼성역</option>
                              <option value="선릉역" style="text-align: center;">선릉역</option>
                              <option value="신논현역" style="text-align: center;">신논현역</option>
                           </select></td>
            </tr>
            <tr>
               <th><label for="group">분류</label></th>
               <td>
               <!-- <input type="text" id="categoryOpt" name="category"> -->
               <!-- <select id="group1" name="group1">
                     <option value="option1">----지역----</option>
                     <option value="option2">옵션 2</option>

               </select> -->
                <select id="group" name="category">
               <option value="0">-------------음식 종류-------------</option>
                  <option value="중식">중식</option>
                  <option value="한식">한식</option>
                  <option value="일식">일식</option>
                  <option value="양식">양식</option>
                  <option value="디저트">디저트</option>
               </select>
               </td>
            </tr>
            <tr>
               <th><label for="oTime1">영업시작시간</label></th>
               <td colspan="3">
                  <!-- 오전/오후 선택 -->
                  <select id="oTime1" name="openAMPM">
                     <option value="am">오전</option>
                     <option value="pm">오후</option>
                  </select>
                  <!-- 시간(hour) 선택 -->
                  <select id="oTime2" name="openTime1">
                     <option value="01">01</option>
                     <option value="02">02</option>
                     <option value="03">03</option>
                     <option value="04">04</option>
                     <option value="05">05</option>
                     <option value="06">06</option>
                     <option value="07">07</option>
                     <option value="08">08</option>
                     <option value="09">09</option>
                     <option value="10">10</option>
                     <option value="11">11</option>
                     <option value="12">12</option>
                  </select>
                  <!-- 분(minute) 선택 -->
                  <select id="oTime3" name="openTime2">
                     <option value="00">00</option>
                     <option value="10">10</option>
                     <option value="20">20</option>
                     <option value="30">30</option>
                     <option value="40">40</option>
                     <option value="50">50</option>
                  </select>
               </td>
            </tr>
            <tr>
               <th><label for="cTime1">영업마감시간</label></th>
               <td colspan="3">
                  <!-- 오전/오후 선택 -->
                  <select id="cTime1" name="closeAMPM">
                     <option value="am">오전</option>
                     <option value="pm">오후</option>
                  </select>
                  <!-- 시간(hour) 선택 -->
                  <select id="cTime2" name="closeTime1">
                     <option value="01">01</option>
                     <option value="02">02</option>
                     <option value="03">03</option>
                     <option value="04">04</option>
                     <option value="05">05</option>
                     <option value="06">06</option>
                     <option value="07">07</option>
                     <option value="08">08</option>
                     <option value="09">09</option>
                     <option value="10">10</option>
                     <option value="11">11</option>
                     <option value="12">12</option>
                  </select>
                  <!-- 분(minute) 선택 -->
                  <select id="cTime3" name="closeTime2">
                     <option value="00">00</option>
                     <option value="10">10</option>
                     <option value="20">20</option>
                     <option value="30">30</option>
                     <option value="40">40</option>
                     <option value="50">50</option>
                  </select>
               </td>
            </tr>
            <tr>
               <th><label for="cdays">휴무일</label></th>
               <td><input id="cdays" name="closedDays" type="text"  value="${storeInfo.closedDays }"></td>
            </tr>
            <tr>
               <th><label for="introduce">매장 소개글</label></th>
               <td><input type="text" id="introduce" name="content"  value="${storeInfo.content }"></td>
            </tr>
            <tr>
               <th><label for="picture1">메인 사진</label></th>
               <td><input type="file" id="picture1" name="mainPictureUrl" value="${storeInfo.mainPictureUrl }" ></td>
            </tr>
            <tr>
               <th><label for="picture2">매장 사진</label></th>
               <td><input type="file" id="picture2" name="pictureUrl" value="${storeInfo.pictureUrl }"></td>
            </tr>
            <tr>
               <th><label for="picture3">메뉴판 사진</label></th>
               <td><input type="file" id="picture3" name="menuPictureUrl"  value="${storeInfo.menuPictureUrl }"></td>
            </tr>   
            <tr>
               <th><label for="hashtag">매장 해시태그</label></th>
               <td><textarea id="hashtag" name="hashtag"><c:out value="${storeInfo.hashtag }"></c:out></textarea></td>
            </tr>
         </table>


      <br>
      <!-- post방식으로 registerStore전송해주면 ActionController으로 넘김 -->
      <div class="button" >
         <!--  <button onclick="location.href='RegisterStoreInfo'">저장</button>-->
         <button type="button" onclick="check()">저장</button>
      </div>

      </form>

   </section>
   
   <jsp:include page="../includes/footer.jsp"></jsp:include>
   <script type="text/javascript">
      function check() {
         let hashtag = document.getElementById('hashtag').value
         var unable = ['강남','역삼','삼성','선릉','신논현'];
         
         for (var i = 0; i < unable.length; i++) {
            let temp = hashtag.indexOf(unable[i]);
            
            if(temp > -1) {
               alert('['+unable[i]+'] 은 입력할 수 없는 단어입니다.')
               return;
            } else {
               document.forms[0].submit();
            }
         }
         
      }
   </script>

</body>
</html>