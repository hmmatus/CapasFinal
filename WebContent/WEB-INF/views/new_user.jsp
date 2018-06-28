<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Crear Usuario</title>
<script>
var d = new Date();
document.getElementById("demo").value = d;
</script>
</head>
<body>
<div class="page-header">
  <h1>Create New User</h1>
</div>
<div class="container-fluid">
<form:form name="form2" method="post"
		action="${pageContext.request.contextPath}/save"
		modelAttribute="newUser">
	<div class="form-group">
		<label for="username">Username: </label>
		<form:input type="text" class="form-control" name="username" path="username" placeholder="New Username"/>
	</div>
		<div class="form-group">
		<label for="password">Password: </label>
		<form:input type="text" class="form-control" name="password" path="password" placeholder="New Password"/>
	</div>
		<div class="form-group">
		<label for="nomCompleto">Full Name: </label>
		<form:input type="text" class="form-control" name="nomCompleto" path="nomCompleto" placeholder="Insert Full Name"/>
	</div>
		<div class="form-group">
		<label for="numCuenta">Account number</label>
		<form:input type="text" class="form-control" name="numCuenta" path="numCuenta" placeholder="Insert Account Number"/>
	</div>
		<div class="form-group">
		<label for="saldo">Balance: </label>
		<form:input type="text" class="form-control" name="saldo" path="saldo" placeholder="Insert actual Balance"/>
	</div>
	<form:input type="hidden"  path="fCreacion" id="demo" />
	<div class="form-check form-check-inline">
		<label class="form-check-label" for="uEstado">Status:          </label>
		<form:radiobutton class="form-check-input" name="uEstado" path="uEstado" value="true"/><label class="form-check-label" for="uEstado">Activo </label><br><br>
		<form:radiobutton class="form-check-input" name="uEstadoi" path="uEstado" value="false"/><label class="form-check-label" for="uEstadoi">Inactivo</label>
		</div>
		<br>
	<input type="submit" class="btn btn-primary" value="Create User">
</form:form>
</div>
</body>
</html>