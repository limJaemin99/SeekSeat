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
		  showDenyButton: true,
		  showCancelButton: true,
		  confirmButtonText: '${choice1}',
		  denyButtonText: '${choice2}',
		}).then((result) => {
		  /* Read more about isConfirmed, isDenied below */
		  if (result.isConfirmed) {
		    Swal.fire('Saved!', '', 'success')
		  } else if (result.isDenied) {
		    Swal.fire('Changes are not saved', '', 'info')
		  }
		})
</script>
</body>
</html>