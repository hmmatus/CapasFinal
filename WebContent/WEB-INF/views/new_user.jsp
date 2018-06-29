<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>New User</title>
<script>
var d = new Date();
document.getElementById("demo").value = d;
</script>
</head>
<body>
<div class="page-header">
  <h1>New User</h1>
</div>
<div class="container-fluid">
<form:form name="form2" method="post"
		action="${pageContext.request.contextPath}/save"
		modelAttribute="newUser">
	<div class="form-group">
		<form:input type="text" class="form-control" name="username" path="username" placeholder="Username"/>
	</div>
		<div class="form-group">
		<form:input type="text" class="form-control" name="password" path="password" placeholder="Password"/>
	</div>
		<div class="form-group">
		<form:input type="text" class="form-control" name="nomCompleto" path="nomCompleto" placeholder="Name complete"/>
	</div>
		<div class="form-group">
		<form:input type="text" class="form-control" name="numCuenta" path="numCuenta" placeholder="Account code"/>
	</div>
		<div class="form-group">
		<form:input type="text" class="form-control" name="saldo" path="saldo" placeholder="Balance"/>
	</div>
	<form:input type="hidden"  path="fCreacion" id="demo" />
	<div class="form-check form-check-inline">
		<label class="form-check-label" for="uEstado">state:</label> </br>
		<form:radiobutton class="form-check-input" name="uEstado" path="uEstado" value="true"/><label class="form-check-label" for="uEstado">Active </label><br><br>
		<form:radiobutton class="form-check-input" name="uEstadoi" path="uEstado" value="false"/><label class="form-check-label" for="uEstadoi">Inactive</label>
		</div>
		<br>
	<input type="submit" class="btn btn-primary" value="Create user">
	<a class="btn btn-light" href="${pageContext.request.contextPath}/admin"> Cancelar</a>
</form:form>
</div>
</body>
</html>