<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script type="text/javascript" src="resources/js/sweetalert2.js"></script>
<script>
$(document).ready(function(){
	$('#btn-submit').click({
	    Swal({
	        title: 'Are you sure?',
	        type: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#DD6B55',
	        confirmButtonText: 'Yes, update it!',
	        closeOnConfirm: false
	    }, function(isConfirm){
	        if (isConfirm) form.submit();
	    });
	});
});
</script>
<title>Editar Usuario</title>
</head>
<body>
<div class="container-fluid">
	<h1>Edit User Information</h1>
	<form:form name="form1" id="myForm" method="post"
		action="${pageContext.request.contextPath}/actualizar"
		modelAttribute="newUser">
		<form:input type="hidden" path="idUsuario" value="${newUser.idUsuario}"/>
		<div class="form-group">
		<label for="username">Username: </label>
		<form:input type="text" class="form-control" name="username" path="username" value="${newUser.username}" />
		</div>
		<div class="form-group">
		<label for="exampleInputPassword">Password: </label>
		<form:input type="text" class="form-control" name="password" path="password" value="${newUser.password}"  />
		</div>
		<div class="form-group">
		<form:input type="hidden" class="form-control" name="nomCompleto" path="nomCompleto" value="${newUSer.nomCompleto}" />
		<form:input type="hidden" name="numCuenta" path="numCuenta" value="${newUser.numCuenta}"/>
		<form:input type="hidden" name="saldo" path="saldo" value="${newUser.saldo}"/>
		</div>
		<div class="form-check form-check-inline">
		<label class="form-check-label" for="uEstado">Status:          </label>
		<form:radiobutton class="form-check-input" name="uEstado" path="uEstado" value="true"/><label class="form-check-label" for="uEstado">Activo </label><br><br>
		<form:radiobutton class="form-check-input" name="uEstadoi" path="uEstado" value="false"/><label class="form-check-label" for="uEstadoi">Inactivo</label>
		</div>
		<br>
		<input type="submit" id="btn-submit" class="btn btn-primary" value="Update">
		<a class="btn btn-light" href="${pageContext.request.contextPath}/admin"> Cancelar</a>
	</form:form>
	</div>
</body>
</html>