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
		  title: '글을 삭제하시겠습니까?',
		  text: "삭제하시면 다시 복구시킬 수 없습니다.",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes'
		}).then((result) => {
		  if (result.isConfirmed) {
			  //Yes 버튼 눌렀을 때 작업 할 내용
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    )
		  }
		})
</script>
</body>
</html>