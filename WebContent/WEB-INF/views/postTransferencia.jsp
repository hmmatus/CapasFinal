<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resumen final</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-reboot.min.css">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/sweetalert2.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body>
	<div class="container" id="container">
	<h1>Resumen final de la transferencia</h1>
		<h4>Saldo: ${nuevoSaldo}</h4>
		<h4>Beneficiario: ${beneficiario.username}</h4>
		<h4>Cuenta de beneficiario: ${beneficiario.numCuenta}</h4>
		<h4>Monto: ${monto}</h4>
		<h4>Concepto: ${concepto}</h4>
		<h4>Fecha de transferencia: ${fecha}</h4>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/cuenta"> Regresar</a>
		
	</div>
</body>
</html>