<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="resources/jquery-1.12.3.js"></script>
<script type="text/javascript" src="resources/jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/jquery-ui/jquery-ui.css">
<script type="text/javascript"
	src="resources/sweetalert/dist/sweetalert.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="resources/css/formas.css">
<script type="text/javascript" src="resources/jquery-1.12.3.js"></script>
<script type="text/javascript" src="resources/jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/jquery-ui/jquery-ui.css">
<script type="text/javascript"
	src="resources/sweetalert/dist/sweetalert.min.js"></script>
<title>Estado de Cuenta</title>


</head>
<body>
	<h2>Ingrese un intervalo de fechas:</h2>
	<form action="${pageContext.request.contextPath}/search" id="fingre">
		<h4>Since:</h4>
		<input type="text" id="fechamin" name="fingre" class="form-control"
			placeholder="Fecha de entrada">
		<script type="text/javascript">
						$("#fechamin").datepicker({ dateFormat: 'yyyy/MM/DD' });
					</script>

		<h4>Until:</h4>
		<input type="text" name="fvenc" id="fechamax" class="form-control"
			placeholder="Fecha de fin">
		<script type="text/javascript">
				$("#fechamax").datepicker({ dateFormat: 'yyyy/MM/DD' });
			</script>
		<br> <input type="submit" class="btn btn-primary">
	</form>
	<br>
	<br>

	<h2>Information Table</h2>

	<table class="table table-hover" id="dev-table">
		<thead>
			<tr>
				<th>Correlativo</th>
				<th>Tipo de Operacion</th>
				<th>Fecha de operacion</th>
				<th>Monto</th>
				<th>Concepto de la operacion</th>
				<th>Usuario</th>
				<th>Cuenta Usuario</th>
				<th>Estado</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ope}" var="ope">
				<td><c:out value="${ope.idOperacion}"></c:out></td>
				<td><c:out value="${ope.tipoOperacion}"></c:out></td>
				<td><c:out value="${ope.fechaOperacion}"></c:out></td>
				<td><c:out value="${ope.monto}"></c:out></td>
				<td><c:out value="${ope.concepto}"></c:out></td>
				<td><c:out value="${ope.idUsuario}"></c:out></td>
				<td><c:out value="${ope.idBeneficiario}"></c:out></td>
				<td><c:out value="${ope.sEstado}"></c:out></td>
			</c:forEach>
			<tr>
				<td>1</td>
				<td>Kilgore</td>
				<td>Trout</td>
				<td>kilgore</td>
			</tr>
		</tbody>
	</table>
</body>
</html>