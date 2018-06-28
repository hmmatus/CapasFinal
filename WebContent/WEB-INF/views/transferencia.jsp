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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<!--  <script>
$(document).ready(function () {
	$('#container .input-group.date').datepicker({
	    language: "es"
	});
	});
</script>-->
<script>
$( document ).ready(function() {
	$('#submit').prop("disabled",true);
});
function validateForm(){
		var monto =parseInt($('#monto').val());
		var saldo =parseInt($('#saldo').val());
		var concepto =$('#concepto').val();
		var cuenta =$( "#benef option:selected" ).val();
		  if(monto<=saldo && concepto!=null && concepto.trim() !="" && cuenta!=null){
				  $('#submit').prop("disabled",false);
			  }
		  else if (monto > saldo ) {
		   	  Swal('El monto es mayor al saldo disponible')
		   	  
		  }
	}
function validateTrans(){
	
	var saldo =$( "#saldo" ).val();
	var monto =$( "#monto" ).val();
	var benef =$( "#benef option:selected" ).text();
	var cuenta =$( "#benef option:selected" ).val();
	var concepto =$( "#concepto" ).text();
	Swal({
		  title: 'Resumen de la transferencia',
		  type: 'warning',
		  html:
			    '<b>Saldo: </b>'+saldo+' <br>'+
			    '<b>Monto: </b>'+monto+' <br>'+
			    '<b>Beneficiario: </b>'+benef+' <br>'+
			    '<b>Cuenta del beneficiario: </b>'+cuenta+' <br>',
			  showCloseButton: true,
			  showCancelButton: true,
			  focusConfirm: false,
		  showCancelButton: true,
		  confirmButtonText: 'confirmar',
		  cancelButtonText: 'cancelar'
		}).then((result) => {
		  if (result.value) {
			  Swal({
				  title: '¿Esta seguro de realizar la transferencia?',
				  type: 'warning',
				  text: '',
				  showCancelButton: true,
				  confirmButtonText: 'Si',
				  cancelButtonText: 'No'
				}).then((result) => {
				  if (result.value) {
					  $('#form1').submit();
					  Swal('Transaccion realizada con exito')
					} else if (result.dismiss === Swal.DismissReason.cancel) {
				    Swal('Cancelado')
				  }
				})
			} else if (result.dismiss === Swal.DismissReason.cancel) {
		    Swal('Cancelado')
		  }
		})
	
}
</script>
</head>
<body>
<div class="container" id="container">
			<h2>Transferencia de Dinero</h2>
			<form id="form1" method="post" action="${pageContext.request.contextPath}/agregarTransferencia" >
			
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/listaBenef">Agregar Beneficiario</a>
				  <div class="form-group">
				  
				    <label for="saldo">Saldo:</label>
				    <input type="number" class="form-control" name="saldo" id="saldo" value="${usuario.saldo}" readonly>
				   
				  </div>
				  <div class="form-group">
				    <label for="benef">Beneficiario</label>
				    <select name="benef" class="form-control" id="benef">
				      <c:forEach var="c" items="${beneficiario}">
				      <option value="${c.numCuenta}">${c.username}</option>
				      </c:forEach>
				    </select>
				  </div>
				  
				  <div class="form-group">
				  
				    <label for="monto">Monto</label>
				    <input type="number" min="1.00" path="concepto" class="form-control" onblur="validateForm()" name="monto" id="monto"  required>
				   
				  </div>
				  <div class="form-group">
				  
				    <label for="concepto">Concepto</label>
				    <input type="text" class="form-control" onchange="validateForm()" name="concepto" id="concepto" required>
				   
				  </div>
				  <button type="button" class="btn btn-primary" onclick="validateTrans()">Realizar Transferencia</button>

				  <!--<button type="submit" class="btn btn-primary">Submit</button> -->
			</form>
			</div>
			<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="resources/js/bootstrap-datepicker.min.js"></script>
			<script type="text/javascript" src="resources/js/bootstrap-datepicker.es.min.js"></script>
</body>
</html>