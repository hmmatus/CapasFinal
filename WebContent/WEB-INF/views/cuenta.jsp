<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transferencia</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-reboot.min.css">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/sweetalert2.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script>
function signOut(){
	Swal({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes!'
		}).then((result) => {
		  if (result.value) {
		
		    		$('#form4').submit();
		    
		  }
		})

	}
</script>
</head>
<body>

<div class="container" id="container">
<h1>Mi cuenta</h1>
<form id="form1" method="post" action="${pageContext.request.contextPath}/transfeBenef" >
	<button type="submit" class="btn btn-primary">Realizar transferencia</button>
</form>
<br>
<form id="form2" method="post" action="${pageContext.request.contextPath}/estado" >
	<button type="submit" class="btn btn-light">Estado de cuenta</button>
	
</form>
<br>
<form id="form3" method="post" action="${pageContext.request.contextPath}/pendienteTrans" >
	<button type="submit" class="btn btn-info">Transferencias pendientes</button>

</form>
<br>
<form id="form4" method="post" action="${pageContext.request.contextPath}/index" >
	<button type="button" class="btn btn-info" onclick="signOut()">Sign out</button>
	
</form>
<br>
</div>
</body>
</html>