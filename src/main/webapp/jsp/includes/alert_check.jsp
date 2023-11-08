<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
</head>
<body>
<input type="hidden" id="forReserve" name="forReserve" value="${forReserve}">
<c:if test="${forReserve == 'true'}">
	<input type="hidden" name="store" id="store" value="${store}">
	<input type="hidden" name="store_id" id="store_id" value="${store_id}">
	<input type="hidden" name="isFavorite" id="isFavorite" value="${isFavorite}">
	<input type="hidden" name="member_type" id="member_type" value="${member_type}">
</c:if>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
	var forReserve = document.getElementById('forReserve').value;
	Swal.fire({
		  title: '${title}',
		  text: '${message}',
		  icon: 'success',
		  confirmButtonText: '확인'
		}).then((result) => {
			if(forReserve == 'true'){
				var store = document.getElementById('store').value;
				var store_id = document.getElementById('store_id').value;
				var isFavorite = document.getElementById('isFavorite').value;
				var member_type = document.getElementById('member_type').value;
				console.log(member_type)
		    	location.href = '${url}?store_id='+store_id+'&isFavorite='+isFavorite+'&member_type='+member_type+'&store='+store;
			} else {
		    	location.href = '${url}';
		  	}
		});
</script>
</body>
</html>