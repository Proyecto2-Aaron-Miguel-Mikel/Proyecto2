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

		extract($_REQUEST);

		session_start();
		$usuario_actual = $_SESSION['usu_id'];

		$sql = "SELECT * FROM tbl_tiporecurso ORDER BY tr_id";

		$usuario_sql = "SELECT * FROM tbl_usuario ORDER BY usu_id";

		$encurso =	" SELECT * FROM tbl_reserva INNER JOIN tbl_recurso ON tbl_recurso.rec_id = tbl_reserva.res_recursoid INNER JOIN tbl_usuario ON tbl_usuario.usu_id = tbl_reserva.res_usuarioid WHERE res_fechafinal IS NULL";

		$finaliza =	" SELECT * FROM tbl_reserva INNER JOIN tbl_recurso ON tbl_recurso.rec_id = tbl_reserva.res_recursoid INNER JOIN tbl_usuario ON tbl_usuario.usu_id = tbl_reserva.res_usuarioid WHERE res_fechafinal IS NOT NULL ";


		if(isset($enviar)){
		 	if($tr_id>0){
		 		$encurso .= " AND rec_tipoid='$tr_id' ";
		 	}
		 	if ($usu_id>0){
		 		$encurso .= " AND usu_id='$usu_id' ";
		 	}
		}

		$reservas = mysqli_query($conexion, $encurso);
		$reservas1 = mysqli_query($conexion, $finaliza);
		$tipos = mysqli_query($conexion, $sql);
		$usuarios = mysqli_query($conexion, $usuario_sql);

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="./recursos.css">
	<title>Reservas</title>
</head>
<body>
<div class="header">
	<div class="logo">
		<a href="#"></a>
	</div>
	<h1>Reservas</h1>
</div>
<nav>
	<ul class="topnav">	
		<li class="li"><a href="administrador_recursos.php">Administrar recursos</a></li>
		<li class="li"><a href="#">Adiministrar reservas</a></li>
		<li class="li"><a href="administrador_stats.php">Estadísticas</a></li>
	</ul>
</nav>
<?php
if(mysqli_num_rows($tipos)>0){
	?>
<form action="historial_recursos.php" method="get" class="formtipo">
Tipo de recurso:
	<select name="tr_id">
		<option value="0">-- Elegir tipo --</option>
		<?php
				while($tipo=mysqli_fetch_array($tipos)){
					echo "<option value=" . $tipo['tr_id'] . ">" . $tipo['tr_nombre'] . "</option>";
				}
			?>
	</select>
	Usuario:
	<select name="tr_id">
		<option value="0">-- Elegir usuario --</option>
		<?php
				while($usuario=mysqli_fetch_array($usuarios)){
					echo "<option value=" . $usuario['usu_id'] . ">" . $usuario['usu_nombre'] . "</option>";
				}
			}
			?>
	</select>

	<input type="submit" name="enviar" value="Filtrar">
</form>
<h1>Reservas en curso</h1>
<br/>
<?php
	if (mysqli_num_rows($reservas)>0) { 

						while($reserva	=	mysqli_fetch_array($reservas)){
								echo "<table border>";
									echo "<tr>";
										echo "<td colspan='2'>" .$reserva['rec_nombre']. "</td>";
									echo "</tr>";
									echo "<tr>";
										echo "<td rowspan='3'><img class='img_recu' src='../img/recursos/".$reserva['rec_foto']."'></td>";
										echo "<td>".$reserva['rec_descripcion']."</td>";
									echo "</tr>";
									echo "<tr>";
										echo "<td>Fecha de inicio: " .$reserva['res_fechainicio']. "</td>";
									echo "</tr>";
									echo "<tr>";
										echo "<td>Usuario: " .$reserva['usu_nickname']. "</td>";
									echo "</tr>";
								echo "</table>";
								echo "</div>";
								echo "<br/>";
							}
					} else {
						echo "No hay reservas en curso";
					}
	?>

	<h1>Reservas finalizadas</h1>
<br/>
<?php
	if (mysqli_num_rows($reservas1)>0) { 

						while($reserva1	=	mysqli_fetch_array($reservas1)){
								echo "<table border>";
									echo "<tr>";
										echo "<td colspan='2'>" .$reserva1['rec_nombre']. "</td>";
									echo "</tr>";
									echo "<tr>";
										echo "<td rowspan='3'><img class='img_recu' src='../img/recursos/".$reserva1['rec_foto']."'></td>";
										echo "<td>".$reserva1['rec_descripcion']."</td>";
									echo "</tr>";
									echo "<tr>";
										echo "<td>Fecha de inicio: " .$reserva1['res_fechainicio']. "</td>";
									echo "</tr>";
									echo "<tr>";
										echo "<td>Fecha devolucion: " .$reserva1['res_fechafinal']. "</td>";
									echo "</tr>";
									echo "<tr>";
										echo "<td>Usuario: " .$reserva1['usu_nickname']. "</td>";
									echo "</tr>";
								echo "</table>";
								echo "</div>";
								echo "<br/>";
							}
					} else {
						echo "No se ha realizado ninguna reserva";
					}
	?>

</body>
</html>