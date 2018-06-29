<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Beneficiario</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-reboot.min.css">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/sweetalert2.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body>
<script type="text/javascript">
$( document ).ready(function() {
	var a = $('#beneficiario').val();
	$('#numerocuenta').val(a);
	
});
	function numCuenta(){
		var a = $('#beneficiario').val();
		$('#numerocuenta').val(a);
		
	}
	function validateForm(){
		var x =$( "#beneficiario option:selected" ).text();
		Swal({
			  title: '¿Esta seguro de agregar el beneficiario '+x+'?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonText: 'Si',
			  cancelButtonText: 'No'
			}).then((result) => {
			  if (result.value) {
				  $('#form1').submit();
			
			  // For more information about handling dismissals please visit
			  // https://sweetalert2.github.io/#handling-dismissals
			  } else if (result.dismiss === Swal.DismissReason.cancel) {
			    Swal(
			      'Cancelado'
			    )
			  }
			})
		
	}
</script>
<div class="container" id="container">
			<form id="form1" method="post" action="${pageContext.request.contextPath}/agregarBenef" >
				  <div class="form-group">
				    <label for="exampleSelect1">Seleccionar Beneficiario</label>
				    <select class="form-control" name="nombrebenef" onChange="numCuenta()" id="beneficiario">
				      <c:forEach var="c" items="${usuarios}">
				      <option value="${c.numCuenta}">${c.username}</option>
				      </c:forEach>
				    </select>
				  </div>
				<div class="form-group" id="cuenta">
				    <label for="numerocuenta">Numero de cuenta</label>
				    
				    <input type="text" class="form-control" value="" name="numerocuenta" id="numerocuenta" aria-describedby="emailHelp" readonly>
				     <small id="emailHelp" class="form-text text-muted">Numero de cuenta, de tu beneficiario.</small>
				   
				  </div>
					 
				  <button type="button" class="btn btn-primary" onclick="validateForm()">Agregar</button>
				  <a class="btn btn-light" href="${pageContext.request.contextPath}/cuenta"> Cancelar</a>
				 
			</form>
			<h3>${us}</h3>
			</div>
			<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
			<!--<script type="text/javascript" src="resources/js/bootstrap-datepicker.min.js"></script>
			<script type="text/javascript" src="resources/js/bootstrap-datepicker.es.min.js"></script>-->
</body>
</html>