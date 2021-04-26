<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</head>
<body class="bg-info"> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.post('ControllerMostrarInformacion',{
		
	},function(response){
	let datos = JSON.parse(response);
	console.log(datos);
	var tabla = document.getElementById('tablaDatos');
	for (let item of datos){
		
		tabla.innerHTML += `
		<tr>
		<td>${item.idUsuario}</td> 
		<td>${item.Usuario}</td> 
		<td>${item.Pass}</td>
		<td>${item.TipoUser}</td>
		<td> <a href="ControllerMostrarInformacion?IdUsuario=${item.idUsuario}&Eliminar=btne" class="btn btn-danger">ELIMINAR <a>
		<a href ="add.jsp?Id=${item.idUsuario}&Usuario=${item.Usuario}&Pass=${item.Pass}" class="btn btn-warning">ACTUALIZAR</a>
		</td>
		</tr>
		
		`	
	}
	
});
});
</script>
<%
HttpSession sesion = (HttpSession) request.getSession();
String usuSession = String.valueOf(sesion.getAttribute("usuario"));
System.out.print(usuSession +"Nombre usuario");

if (usuSession.equals(null)||usuSession.equals("null")){
	
	response.sendRedirect("index.jsp");
}

%>

<div class="container">
<div class="row">
<div class="offset-md-4 col-md-4 bg-warning">
<h1 align="center">WELCOME</h1>
</div>
<div class="col-md-4 bg-success">
<form action="ControllerAcceso" method="post">
<input type="submit" name="btncerrar" value="Cerrar" > 
</form>
</div>
</div>
</div>






	<div class=" container rounded shadown-lg">

	<table class="table table-dark table-striped rounded" id="tablaDatos">
	<thead>
	<th>IdUsuario </th>
	<th>Usuario </th>
	<th>Password </th>
	<th>Tipo </th>
	<th>ACCIONES </th>
	</thead>
	<tbody>
	
	
	</tbody>
	</table>
	</div>
	
</body>
</html>