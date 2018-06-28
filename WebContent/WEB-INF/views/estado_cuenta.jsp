<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script type="text/javascript">
	function llamada() {
		var fi = ("#fechamin").val();
		var fv = ("#fechamax").val();
		$("#div1").load(
				"${pageContext.request.contextPath}/Estado/busqueda?fingre="
						+ fi + "?fvenc=" + fv + "");
	}
</script>
<title>Operation Status</title>
</head>
<body>
	<div id="div1">
		<h2>Insert a Date's range:</h2>
		<form action="${pageContext.request.contextPath}/busqueda" id="fingre">
			<h4>Since:</h4>
			<input type="text" id="fechamin" name="fingre" class="form-control"
				placeholder="Begin Date">
			<script type="text/javascript">
				$("#fechamin").datepicker({
					dateFormat : 'yy/MM/DD'
				});
			</script>

			<h4>Until:</h4>
			<input type="text" name="fvenc" id="fechamax" class="form-control"
				placeholder="End Date">
			<script type="text/javascript">
				$("#fechamax").datepicker({
					dateFormat : 'yy/MM/DD'
				});
			</script>
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
	</div>
</body>
</html>