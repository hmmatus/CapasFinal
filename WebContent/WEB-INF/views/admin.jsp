<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
</head>
<body>
<br>
<div class="container">
	<h1>Listado de usuarios</h1>
	<hr>
	<br>
	<table class="table table-hover">
    <thead class="thead-light">
      <tr >
        <th>Código</th>
        <th>Usuario</th>
        <th>Password</th>
        <th>Nombre completo</th>
        <th>Cuenta</th>
        <th>Fecha de creacion</th>
        <th>Saldo</th>
        <th>Estado</th>
        <th>Accion</th>
        <th></th>
      </tr>
    </thead>
    <tbody>  

			<tr>
				<td>JSNOW0031</td>
				<td>jonsnow</td>
				<td>1234</td>
				<td>Jonathan Snow Stark</td>
				<td>12314-123</td>
				<td>06/18/12</td>
				<td>$500</td>
				<td>ACTIVO</td>
				<td><button class="btn btn-info">Editar</button>
				<td><button class="btn btn-danger">Eliminar</button>
			</tr>
			<tr>
				<td>JSNOW0031</td>
				<td>jonsnow</td>
				<td>1234</td>
				<td>Jonathan Snow Stark</td>
				<td>12314-123</td>
				<td>06/18/12</td>
				<td>$500</td>
				<td>ACTIVO</td>
				<td><button class="btn btn-info">Editar</button>
				<td><button class="btn btn-danger">Eliminar</button>
			</tr>
			<tr>
				<td>JSNOW0031</td>
				<td>jonsnow</td>
				<td>1234</td>
				<td>Jonathan Snow Stark</td>
				<td>12314-123</td>
				<td>06/18/12</td>
				<td>$500</td>
				<td>ACTIVO</td>
				<td><button class="btn btn-info">Editar</button>
				<td><button class="btn btn-danger">Eliminar</button>
			</tr>
			<tr>
				<td>JSNOW0031</td>
				<td>jonsnow</td>
				<td>1234</td>
				<td>Jonathan Snow Stark</td>
				<td>12314-123</td>
				<td>06/18/12</td>
				<td>$500</td>
				<td>ACTIVO</td>
				<td><button class="btn btn-info">Editar</button>
				<td><button class="btn btn-danger">Eliminar</button>
			</tr>
			<tr>
				<td>JSNOW0031</td>
				<td>jonsnow</td>
				<td>1234</td>
				<td>Jonathan Snow Stark</td>
				<td>12314-123</td>
				<td>06/18/12</td>
				<td>$500</td>
				<td>ACTIVO</td>
				<td><button class="btn btn-info">Editar</button>
				<td><button class="btn btn-danger">Eliminar</button>
			</tr>
			<tr>
				<td>JSNOW0031</td>
				<td>jonsnow</td>
				<td>1234</td>
				<td>Jonathan Snow Stark</td>
				<td>12314-123</td>
				<td>06/18/12</td>
				<td>$500</td>
				<td>ACTIVO</td>
				<td><button class="btn btn-info">Editar</button>
				<td><button class="btn btn-danger">Eliminar</button>
			</tr>
			<tr>
				<td>JSNOW0031</td>
				<td>jonsnow</td>
				<td>1234</td>
				<td>Jonathan Snow Stark</td>
				<td>12314-123</td>
				<td>06/18/12</td>
				<td>$500</td>
				<td>ACTIVO</td>
				<td><button class="btn btn-info">Editar</button>
				<td><button class="btn btn-danger">Eliminar</button>
			</tr>
			
		    
    </tbody>
  </table>
  
  <form action="${pageContext.request.contextPath}/index">
        <input type="submit" class="btn btn-secondary " value="Regresar">
  
  </form>
	
	
</div>

</body>
</html>