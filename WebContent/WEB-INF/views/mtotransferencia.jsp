<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert2@7.24.2/dist/sweetalert2.all.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transferencias</title>
</head>

<script>
$(document).on('click', '#btn-aceptar', function(e) {
    e.preventDefault();
    
    
 
    
    swal({
    	  title: 'Estas seguro?',
    	  text: "Una vez aceptada la transaccion no se puede revertir!",
    	  type: 'warning',
    	  showCancelButton: true,
    	  confirmButtonColor: '#3085d6',
    	  cancelButtonColor: '#d33',
    	  confirmButtonText: 'Confirmar!'
    	}).then((result) => {
    	  if (result.value) {
    	    swal(
    	      'Confirmada!',
    	      'Su transacción se ha realizado con éxito.',
    	      'success'
    	    )
    	    $('#f-aceptar').submit();
    	  }
    	})
    
});



$(document).on('click', '#btn-rechazar', function(e) {
    e.preventDefault();
    
    
 
    
    swal({
    	  title: 'Esá seguro?',
    	  text: "Una vez rechazada la transacción, no volverá a aparecer!",
    	  type: 'warning',
    	  showCancelButton: true,
    	  confirmButtonColor: '#3085d6',
    	  cancelButtonColor: '#d33',
    	  confirmButtonText: 'Rechazar'
    	}).then((result) => {
    	  if (result.value) {
    	    swal(
    	      'Rechazada!',
    	      'La transacción ha sido rechazada.',
    	      'success'
    	    )
    	    $('#f-rechazar').submit();
    	  }
    	})
    
});


</script>

<body>
<br>
<div class="container">
	<h1>Mantenimiento de transferencias</h1>
	<hr>
	<p>Este listado de transferencias requiere su acción.<p>
	<br>
	<table class="table table-hover">
    <thead class="thead-light">
      <tr >
        <th>Usuario</th>
        <th>Cuenta</th>
        <th>Monto</th>
        <th>Concepto</th>
        <th>Fecha</th>
        <th>Saldo</th>
        <th>Estado</th>
        <th>Accion</th>
        <th></th>
      </tr>
    </thead>
    <tbody>  
			
			
	      <c:forEach var="c" items="${operacion}">
				<tr>
					<td>${c.idOperacion}</td>
					<td>${c.tipoOperacion}</td>
					<td>${c.fechaOperacion}</td>
					<td>${c.monto}</td>
					<td>${c.concepto}</td>
					<td>${c.idUsuario}</td>
					<td>${c.estado}</td>
				
				<td>
					<form id="f-aceptar" method="post" action="${pageContext.request.contextPath}/accept">
											<input type="hidden" name="id" value="${c.idOperacion}">
					
						<input id="btn-aceptar" type="submit" class="btn btn-success" onclick=" sweetAlert()" value="Aceptar">
						

					</form>
				</td>
				
				<td>
					<form id="f-rechazar" method="post" action="${pageContext.request.contextPath}/deny">
						<input name="id_r" type="hidden" value="${c.idOperacion}">
					
						<input id="btn-rechazar" type="submit" class="btn btn-danger" onclick=" sweetAlert()" value="Rechazar">

					</form>
				</td>
				
				</tr>
			</c:forEach>
			
			
			<tr>
				<td>SRDVO0051</td>
				<td>Sir Davos</td>
				<td>$500</td>
				<td>Pago de armas para el ejercito del norte.</td>
				<td>06/18/12</td>
				<td>$500</td>
				<td>$500</td>
				<td><button class="btn btn-success">Aceptar</button>
				<td><button class="btn btn-danger">Rechazar</button>
			</tr><tr>
				<td>SRDVO0051</td>
				<td>Sir Davos</td>
				<td>$500</td>
				<td>Pago de armas para el ejercito del norte.</td>
				<td>06/18/12</td>
				<td>$500</td>
				<td>$500</td>
				<td><button class="btn btn-success">Aceptar</button>
				<td><button class="btn btn-danger">Rechazar</button>
			</tr>			
		    
    </tbody>
  </table>
  
  <form action="${pageContext.request.contextPath}/index">
        <input type="submit" class="btn btn-secondary " value="Regresar">
  
  </form>
	
	
</div>

</body>
</html>
