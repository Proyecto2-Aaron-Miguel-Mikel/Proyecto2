<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="./recursos.css">
	<title>Recursos</title>
</head>
<body>
<div class="header">
	<div class="logo">
		<a href="#"></a>
	</div>
	<h1>Reserva tus recursos</h1>
</div>
<nav>
	<ul class="topnav">	
		<li class="li"><a href="#">Recursos</a></li>
		<li class="li"><a href="misrecursos.php">Mis recursos</a></li>
		<li class="li"><a href="historial.php">Historial de recursos</a></li>
	</ul>
</nav>
<form action="recursos.php" method="get" class="formtipo">
	Tipo de recurso:
	<select name="tr_id">
		<option value="0">-- Elegir tipo --</option>
		<option value="1">Aula de teoría</option>
		<option value="2">Aula deinformática</option>
		<option value="3">Despacho para entrevista</option>
		<option value="4">Sala de reuniones</option>
		<option value="5">Proyector portátil</option>
		<option value="6">Carro de portátiles</option>
		<option value="7">Portátil</option>
		<option value="8">Móvil</option>
	</select>
</form>

</body>
</html>