<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리</title>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, width=device-width">
<link rel="stylesheet" type="text/css" href="../../css/menu.css">
</head>
<style type="text/css">
	button{
  		width: 100px;
   		height: 50px;
	}
</style>
<body>
<!-- 매장 메뉴 등록 화면 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>

	<section>
		<h2 style="margin-bottom: 0px;">메뉴 등록</h2>
		<h3 style="text-align: center; margin-top: 10px;">상호명 : ${name}</h3>
		<br>
	<form id="frm" action="storeMenu?store_id=${store_id}" method="post" enctype="multipart/form-data">
    <table id="myTable">
        <tr>
            <th><label for="menuPictureUrl">사진</label></th>
            <th><label for="menu_name">메뉴 이름</label></th>
            <th><label for="price">가격</label></th>
            <th><label for="content">설명</label></th>
            <th><label for="best">추천 메뉴</label></th>
            <th><label for="delete">삭제</label></th>
        </tr>
        <tr>
            <td>
                <input type="file" id="image_container" name="menuPictureUrl0" accept="image/*" onchange="setThumbnail(event, 0);">
                <div id="image_container0"></div>
            </td>
            <td><input type="text" id="menu_name" name="menu_name[]"></td>
            <td><input type="number" id="price" name="price[]"></td>
            <td><input type="text" id="content" name="content[]"></td>
            <td>
            	<input style="appearance: auto;" type="checkbox" id="best" name="bestCheck" onclick="check(0)">
            	<input type="hidden" id="best[]" name="best[]">
            </td>
            <td><button type="button" onclick="deleteRow(this)">삭제</button></td>
        </tr>
		
        <!-- 여러 메뉴 항목을 추가할 수 있는 버튼 -->
        <tr>
            <td colspan="6"><button type="button" onclick="addRow()">+</button></td>
        </tr>
    </table>
    <div class="button">
        <button type="submit">저장</button>
    </div>
	</form>
	</section>

<jsp:include page="../includes/footer.jsp"/>
	
<script type="text/javascript" src="../../js/owner_Info.js"></script>
<script type="text/javascript">
	function check(n) {
		if(n == 0){
			if(document.getElementById('best').checked)
				document.getElementById('best[]').value = 'on'
			else
				document.getElementById('best[]').value = 'off'
			console.log(document.getElementById('best[]').value)
		} else {
			if(document.getElementById('best'+n).checked)
				document.getElementById('best[]'+n).value = 'on'
			else
				document.getElementById('best[]'+n).value = 'off'
			console.log(document.getElementById('best[]'+n).value)
		}
	}
</script>
<script>
	let rowCounter = 1; // 행의 카운터를 유지하기 위한 변수
	function addRow() {
	    var table = document.getElementById("myTable");
	    var newRow = table.insertRow(table.rows.length - 1); // 새로운 행을 마지막 행 이전에 추가
	
	    // 각 열에 셀 추가
	    for (var i = 0; i < 5; i++) { 
	        var cell = newRow.insertCell(i);
	        if (i === 0) {
	            // 파일 업로드(input type="file") 필드를 생성
	            var input = document.createElement('input');
	            input.type = 'file';
	            input.name = 'menuPictureUrl' + rowCounter; // 메뉴 사진 파일
	            input.accept = 'image/*';
	            input.setAttribute('onchange', 'setThumbnail(event, ' + rowCounter + ');');
	            cell.appendChild(input);
	
	            // 메뉴 사진 미리보기를 위한 컨테이너(div) 추가
	            var div = document.createElement('div');
	            div.id = 'image_container' + rowCounter;
	            cell.appendChild(div);
	        } else if (i === 2) { // 가격 열일 때
	            var input = document.createElement('input');
	            input.type = 'number';
	            input.name = 'price[]'; // 가격
	            cell.appendChild(input);
	        } else if (i === 4) { // 추천 메뉴 열일 때
	        	var input = document.createElement('input');
	        	input.type = 'checkbox';
	        	input.style = 'appearance: auto;';
	        	input.name = 'bestCheck'; // 추천 메뉴
	        	input.id = 'best' + rowCounter;
	        	input.onclick = (function() {
	        		var currentRowCounter = rowCounter;
	                return function() {
	                    check(currentRowCounter);
	                };
	            })(rowCounter);
	        	cell.appendChild(input);
	            
	            //check 여부 확인용 hidden
	            var input = document.createElement('input');
	            input.type = 'hidden';
	            input.name = 'best[]';
	            input.id = 'best[]' + rowCounter;
	            cell.appendChild(input);
	        } else {
	            var input = document.createElement('input');
	            input.type = 'text';
	            input.name = i === 1 ? 'menu_name[]' : 'content[]'; // 메뉴 이름, 설명
	            cell.appendChild(input);
	        }
	    }
	
	    // 숨겨진(store_id) 필드 추가
	    var hiddenInput = document.createElement('input');
	    hiddenInput.type = 'hidden';
	    hiddenInput.name = 'store_id';
	    hiddenInput.value = '<%= session.getAttribute("store_id") %>';
	    newRow.appendChild(hiddenInput);
	
	    // 삭제 버튼 추가
	    var deleteButtonCell = newRow.insertCell(5);
	    var deleteButton = document.createElement('button');
	    deleteButton.textContent = '삭제';
	    deleteButton.setAttribute('onclick', 'deleteRow(this)');
	    deleteButtonCell.appendChild(deleteButton);
	
	    rowCounter++; // 행 카운터 증가
	    
	    var form = document.getElementById("frm");
	    form.value += " "; // 이 부분을 추가해줍니다.
	}
	
	  function setThumbnail(event, rowIndex) {
	    var reader = new FileReader();
	    var imageContainer = document.getElementById('image_container' + rowIndex);
	    
	    reader.onload = function (event) {
	      var img = document.createElement("img");
	      img.setAttribute("src", event.target.result);
	      imageContainer.innerHTML = ''; // 미리보기 컨테이너 초기화
	      imageContainer.appendChild(img);
	    };
	
	    reader.readAsDataURL(event.target.files[0]); // 업로드한 파일의 첫 번째 파일만 사용
	  }
	
	  function deleteRow(button) {
	    var row = button.parentNode.parentNode; // 삭제 버튼이 속한 행
	    row.parentNode.removeChild(row); // 해당 행 삭제
	  }
	  function getCheckboxValue(checkboxId) { //체크박스 여부
		    var checkbox = document.getElementById(checkboxId);
		    return checkbox.checked ? 1 : 0;
		  }
</script>
</body>
</html>