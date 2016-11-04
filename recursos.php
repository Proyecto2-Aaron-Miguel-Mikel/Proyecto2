<?php
		//realizamos la conexión
		$conexion = mysqli_connect('localhost', 'root', '', 'bd_mamproyecto2');

		//le decimos a la conexión que los datos los devuelva diréctamente en utf8, así no hay que usar htmlentities
		$acentos = mysqli_query($conexion, "SET NAMES 'utf8'");

		if (!$conexion) {
		    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
		    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
		    echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
		    exit;
		}

		$sql = "SELECT * FROM tbl_tiporecurso ORDER BY tr_id";

		$disponible =	" SELECT * FROM tbl_recurso INNER JOIN tbl_tiporecurso ON tbl_tiporecurso.tr_id = tbl_recurso.rec_tipoid WHERE rec_estado='disponible' ";

		$ocupado =	" SELECT * FROM tbl_recurso INNER JOIN tbl_tiporecurso ON tbl_tiporecurso.tr_id = tbl_recurso.rec_tipoid WHERE rec_estado='ocupado' ";

		extract($_REQUEST);

		if(isset($enviar)){
		 	if($tr_id>0){
		 		$disponible .= " AND rec_tipoid='$tr_id '";
		 		$ocupado .= " AND rec_tipoid='$tr_id' ";
		 	}
		}

		$tipos = mysqli_query($conexion, $sql);
		$recursos = mysqli_query($conexion, $disponible);
		$recursos1 = mysqli_query($conexion, $ocupado);

?>
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
<?php
if(mysqli_num_rows($tipos)>0){
	?>
<form action="recursos.php" method="get" class="formtipo">
	Tipo de recurso:
	<select name="tr_id">
		<option value="0">-- Elegir tipo --</option>
		<?php
				while($tipo=mysqli_fetch_array($tipos)){
					echo "<option value=" . $tipo['tr_id'] . ">" . $tipo['tr_nombre'] . "</option>";
				}
			?>
	</select>
	<input type="submit" name="enviar" value="Filtrar">
</form>
<br/><br/>
<h1>Recursos Disponibles</h1>
<br/>
<?php
	}
	if(mysqli_num_rows($recursos)>0){
		while($recurso=mysqli_fetch_array($recursos)){
					echo "Nombre: " .$recurso['rec_nombre']. "<br/>" ;
					echo "Descripcion: " .$recurso['rec_descripcion']. "<br/>" ;
					echo "Estado: " .$recurso['rec_estado']. "<br/><br/>";
					echo "<a href='recursos.proc.php?rec_id=" .$recurso['rec_id']. "'>Reservar</a>";
					echo "<br/>";
					echo "<hr/>";
			} 
		} else {
			echo "No hay recursos disponibles";
		}

	?>

<br/><br/>
<h1>Recursos en uso</h1>
<br/>
<?php
	if(mysqli_num_rows($recursos1)>0){
		while($recurso1=mysqli_fetch_array($recursos1)){
					echo "Nombre: " .$recurso1['rec_nombre']. "<br/>" ;
					echo "Descripcion: " .$recurso1['rec_descripcion']. "<br/>" ;
					echo "Estado: " .$recurso1['rec_estado']. "<br/>" ;
					echo "<hr/>";
			} 
		} else {
			echo "No hay recursos en uso";
		}

	?>

</body>
</html>