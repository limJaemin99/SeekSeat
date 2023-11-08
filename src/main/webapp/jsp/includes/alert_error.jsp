<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
	Swal.fire({
		title: '${title}',
		text: '${message}',
		icon: 'error',
		confirmButtonText: '확인'
	}).then((result) => {
		if (result.isConfirmed) {
			location.href = '${url}';
		}
	})
</script>
</body>
</html>