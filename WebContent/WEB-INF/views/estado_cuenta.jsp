<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-reboot.min.css">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/sweetalert2.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<script type="text/javascript">
$(document).ready(function () {
	 $('#fechamin').datepicker({
         uiLibrary: 'bootstrap4',
        	 format: 'dd-mm-yyyy'
     });
	$('#fechamax').datepicker({
		uiLibrary: 'bootstrap4',
       	 format: 'dd-mm-yyyy'
	});
	});

</script>
<title>Operation Status</title>
</head>
<body>
<div class="container" id="container">

		<h2>Insert a Date's range:</h2>
		<form action="${pageContext.request.contextPath}/busqueda" id="fingre">
			<h4>Since:</h4>
			<input type="text" id="fechamin" name="fingre" class="form-control"
				placeholder="Begin Date">
			<h4>Until:</h4>
			<input type="text" name="fvenc" id="fechamax" class="form-control"
				placeholder="End Date">
			 <input type="submit" id="button" class="btn btn-primary"
				value="Send">
		</form>
		<h4 value="${error}"></h4>
		<h3>
			<c:out value="${error}"></c:out>
		</h3>
		<h2>Information Table</h2>

		<table class="table table-hover" id="dev-table">
			<thead class="thead-light">
				<tr>
					<th>Code</th>
					<th>Operation Type</th>
					<th>Operation Date</th>
					<th>Balance</th>
					<th>Operacion Concept</th>
					<th>User</th>
					<th>Benefit</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ope}" var="ope">
					<tr>
						<td><c:out value="${ope.idOperacion}"></c:out></td>
						<td><c:out value="${ope.OTipoOperacion}"></c:out></td>
						<td><c:out value="${ope.fechaOperacion}"></c:out></td>
						<td><c:out value="${ope.monto}"></c:out></td>
						<td><c:out value="${ope.concepto}"></c:out></td>
						<td><c:out value="${ope.idUsuario}"></c:out></td>
						<td><c:out value="${ope.idBeneficiario}"></c:out></td>
						<td><c:out value="${ope.sEstado}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/cuenta"> Regresar</a>
	</div>
	
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
			 <script  type="text/javascript" src="resources/js/datepickerB4.min.js"></script>
    <link href="resources/css/datepickergijgoB4.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />
</body>
</html>