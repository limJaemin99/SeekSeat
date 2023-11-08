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
<link rel="stylesheet" type="text/css" href="../../css/menu.css">
</head>
<body>	<!-- 메뉴 수정/삭제 화면 -->
<jsp:include page="../includes/header.jsp"/>
   <section>
      <h2>메뉴 수정</h2>
      <h3 style="text-align: center; margin-top: 10px;">상호명 : ${name}</h3>
      <br>
      <form id="frm" action="updateMenuInfo?store_id=${store_id}" method="post" enctype="multipart/form-data">
         <table>
            <tr>
               <!-- <th><label for="storeid">매장 ID</label></th> -->
               <th><label for="menuPictureUrl">메뉴 사진</label></th>
               <th><label for="menuname">메뉴 이름</label></th>
               <th><label for="price">가격</label></th>
               <th><label for="content">설명(원산지)</label></th>
               <th><label for="best">추천 메뉴</label></th>
            </tr>
            <c:forEach items="${list}" var="vo" varStatus="status">
            <tr>
               <td>
               <input id="menuPictureUrl${status.index}" type="file"  name="menuPictureUrl[${status.index}]" accept="image/*" value="${vo.menuPictureUrl}" onchange="addMenuInfo(${status.index})">
               </td>
               <td>
               <input id="menuname${status.index}" type="text" name="menu_name[]" value="${vo.menu_name }" readonly="readonly" onchange="addMenuInfo(${status.index})">
				</td>
               <td>
				<input id="price${status.index}" type="number" name="price[]" value="${vo.price }" onchange="addMenuInfo(${status.index})">
				</td>
               <td>
				<input id="content${status.index}" name="content[]" type="text" value="${vo.content }" onchange="addMenuInfo(${status.index})">
               </td>
               <td>
			    <input style="appearance: auto;" type="checkbox" id="best${status.index}" name="bestCheck" onclick="check(${status.index})">
			    <input type="hidden" id="best${status.index}Hidden" name="best[]">
				</td>
            </tr>
            </c:forEach>
         </table>


      <br>
      <!-- post방식으로 registerStore전송해주면 ActionController으로 넘김 -->
      <div class="button" >
         <!--  <button onclick="location.href='RegisterStoreInfo'">저장</button>-->
         <button type="submit">저장</button>
         <button type="button" onclick="location.href='menuList?store_id=${store_id}'">목록</button>
      </div>

      </form>

	</section>
	<jsp:include page="../includes/footer.jsp"></jsp:include>

<script type="text/javascript">
function check(n) {
    var checkboxId = 'best' + n;
    var hiddenInputId = 'best' + n + 'Hidden';
    
    if (document.getElementById(checkboxId).checked) {
        document.getElementById(hiddenInputId).value = 'on';
    } else {
        document.getElementById(hiddenInputId).value = 'off';
    }
    
    console.log(document.getElementById(hiddenInputId).value);
}

</script>
<script type="text/javascript">
    // 배열 초기화
    var menuNames = [];
    var prices = [];
    var contents = [];
    var menuPictureUrls = [];

    // 메뉴 정보 추가 함수
   function addMenuInfo(index) {
    menuNames[index] = document.getElementById('menuname' + index).value;
    prices[index] = document.getElementById('price' + index).value;
    contents[index] = document.getElementById('content' + index).value;
    
    // 파일 입력 필드의 value 값을 읽어와서 배열에 추가
    var fileInputId = 'menuPictureUrl' + index;
    menuPictureUrls[index] = document.getElementById(fileInputId).value;
}
</script>


</body>
</html>