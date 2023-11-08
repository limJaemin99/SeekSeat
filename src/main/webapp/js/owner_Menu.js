function addMenu() {
    var menuImage = document.getElementById("menuImage").files[0];
    var menuName = document.getElementById("menuName").value;
    var menuPrice = document.getElementById("menuPrice").value;
    var menuDescription = document.getElementById("menuDescription").value;

    var table = document.getElementById("menuTable");
    var row = table.insertRow(table.rows.length);

    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);

    cell1.innerHTML = '<img src="' + URL.createObjectURL(menuImage) + '" alt="' + menuName + '" width="50">';
    cell2.innerHTML = menuName;
    cell3.innerHTML = menuPrice + ' 원';
    cell4.innerHTML = menuDescription;

    // 입력 필드 초기화
    document.getElementById("menuImage").value = "";
    document.getElementById("menuName").value = "";
    document.getElementById("menuPrice").value = "";
    document.getElementById("menuDescription").value = "";
    document.getElementById("selectedImage").src = "";
}

// 파일 선택 시 미리보기
document.getElementById("menuImage").addEventListener("change", function(event) {
    var selectedImage = document.getElementById("selectedImage");
    selectedImage.src = URL.createObjectURL(event.target.files[0]);
});