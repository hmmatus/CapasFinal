<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Admin main</title>
</head>
<body>

	<div class="input-group">
		<form action="${pageContext.request.contextPath}/usuarios">
			<h5>Search user by account code</h5>
			<input type="text" class="form-control"
				placeholder="Insert account code" aria-label=""
				aria-describedby="basic-addon1" name="cor">
				<br>
			<div class="input-group-append">
				<input class="btn btn-primary" type="submit" value="Search">
			</div>
		</form>
	</div>
	<br>
	<div class="form-inline">
	<form action="${pageContext.request.contextPath}/todos">
		<input type="submit" name="button" class="btn btn-info" value="Show Users" style="margin: 35px;">
	</form>
		<form action="${pageContext.request.contextPath}/crear">
		<input type="submit" for="button" class="btn btn-secondary"  value="New User">
	</form>
	</div>
	<table class="table">
		<thead class="thead-light">
			<tr>
				<th>#</th>
				<th>User Name</th>
				<th>Full Name</th>
				<th>Account code</th>
				<th>Creation Date</th>
				<th>Balance</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">
				<tr>
					<th scope="row"><c:out value="${user.idUsuario}"></c:out></th>
					<td><c:out value="${user.username}"></c:out></td>
					<td><c:out value="${user.nomCompleto}"></c:out></td>
					<td><c:out value="${user.numCuenta}"></c:out></td>
					<td><c:out value="${user.fechaCreacion}"></c:out></td>
					<td><c:out value="${user.saldo}"></c:out></td>
					<td><c:out value="${user.uactivoEstado}"></c:out></td>
					<td><form action="${pageContext.request.contextPath}/editar">
							<input type="hidden" value="${user.idUsuario}" name="ide"
								path="ide" readonly>
								<input type="submit" value="Edit" class="btn btn-success">
						</form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>