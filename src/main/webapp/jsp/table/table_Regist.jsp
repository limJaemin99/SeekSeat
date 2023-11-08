<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SeekSeat</title>
	<link rel="styleSheet" href="../../css/table_Regist.css">
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
	<h3>테이블 배치</h3>
	<p>[매장 가로 크기]</p><input type="number" id="colCount" name="colCount">
	<p>[매장 세로 크기]</p><input type="number" id="rowCount" name="rowCount">
	<button type="button" onclick="tableCount()">적용</button>
	<form action="" method="post">
		<section id="tableSection">
			<div id="tableDiv">
				<table id="tb" style="margin: auto;">
					<tr>
						<td><h1>매장의 가로/세로 크기를 선택하면 배치도가 나타납니다</h1></td>
					</tr>
				</table>
			</div>
			<div id="submitDiv">
				<button type="button" onclick="save()">저장</button>
			</div>
		</section>
	</form>
	<script type="text/javascript">
		let row = 0;
		let col = 0;
		
		function tableCount() {
			let rowCount = document.getElementById('rowCount').value;
			let colCount = document.getElementById('colCount').value;
			
			row = rowCount;
			col = colCount;
			
			if(rowCount == 0 || colCount == 0)
				alert('0은 입력할 수 없습니다.')
			else if(rowCount < 0 || colCount < 0)
				alert('음수값은 입력할 수 없습니다.')
			else if(rowCount * colCount > 200)
				alert('테이블 수는 200개를 넘어갈 수 없습니다.')
			else if(colCount > 20)
				alert('매장의 가로 크기는 20을 넘어갈 수 없습니다.')
			else
				createTable(rowCount, colCount);	
		}
		
		function createTable(rowCount, colCount) {
	    	var table = document.getElementById("tb");
	    	
	    	table.innerHTML = "";
	            
	    	for (let i = 0; i < rowCount; i++) {
	        	var row = table.insertRow(i);
	        	for (let j = 0; j < colCount; j++) {
	            	var cell = row.insertCell(j);
	                var div = document.createElement("div");
	                div.className = "table";
	                div.id = i * colCount + j + 1;
	                div.textContent = i * colCount + j + 1;
	                
	                cell.appendChild(div);
	                
	                var input = document.createElement("input");
	                input.type = "hidden";
	                input.id = "table"+(i * colCount + j + 1);
	                input.value = "off";
	                
	                div.appendChild(input);
	                }
	            }
	        }
		
		var tableDiv = document.getElementById('tableDiv');

		tableDiv.addEventListener('click', (event) => {
		    if (event.target.classList.contains('table')) {
		        // 클릭된 요소가 'table' 클래스를 가지고 있다면
		        var tableId = event.target.id;
		        var inputId = "table" + tableId;

		        var input = document.getElementById(inputId);
		        
		        if (input.value === "off") {
		            input.value = "on";
		            event.target.style.backgroundColor = 'gray';
		            event.target.style.color = 'white';
		        } else {
		            input.value = "off";
		            event.target.style.backgroundColor = 'white';
		            event.target.style.color = 'black';
		        }
		    }
		});
		
		function save() {
			let size = row * col;
			let selected = [];
			let count = 0;
			
			for (var i = 1; i <= size; i++) {
				if(document.getElementById('table'+i).value == "on") {
					selected[count] = i;
					count++;
					console.log(i);
				}
			}
		}
	</script>
	
<jsp:include page="../includes/footer.jsp"/>
</body>
</html>