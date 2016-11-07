<?php
		//realizamos la conexión
		$conexion = mysqli_connect('localhost', 'root', '', 'bd_proyecto2');

		//le decimos a la conexión que los datos los devuelva diréctamente en utf8, así no hay que usar htmlentities
		$acentos = mysqli_query($conexion, "SET NAMES 'utf8'");

		if (!$conexion) {
		    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
		    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
		    echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
		    exit;
		}

		session_start();
		$mysqli = new mysqli("localhost", "root", "", "bd_proyecto2");
		$con =	"SELECT * FROM `tbl_usuario` WHERE `usu_id` = '". $_SESSION["usu_id"] ."'";
		//echo $con;
		//Lanzamos la consulta a la BD
		$result	=	mysqli_query($mysqli,$con);
		while ($fila = mysqli_fetch_row($result)) 
			{
				$usu_nickname	=	$fila[1];
				$usu_img	=	$fila[6];
				$usuario = $_SESSION['usu_id'];
			}
			
	


		$sql = "SELECT * FROM tbl_tiporecurso ORDER BY tr_id";

		$finalizado_sql =	" SELECT * FROM tbl_reserva INNER JOIN tbl_recurso ON tbl_recurso.rec_id = tbl_reserva.res_recursoid WHERE res_fechafinal IS NOT NULL AND  res_usuarioid='$usuario'";

		extract($_REQUEST);

		if(isset($enviar)){
		 	if($tr_id>0){
		 		$disponible .= " AND rec_tipoid='$tr_id '";
		 		$ocupado .= " AND rec_tipoid='$tr_id' ";
		 	}
		}

		$finalizados = mysqli_query($conexion, $finalizado_sql);
		$tipos = mysqli_query($conexion, $sql);

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/recursos.css">
	<title>Recursos</title>
</head>
<body>
	<div class="header">
			<div class="logo">
				<a href="#"></a>
			</div>
			<div class="profile">
			<p class="welcome">Hola bienvenido, <br /><b>
			<?php echo $usu_nickname; ?></b></p>
			</div>
			
			<h1>Reserva tus recursos</h1>

	</div>
<nav>
	<ul class="topnav">	
		<li class="li"><a href="recursos.php">Recursos</a></li>
		<li class="li"><a href="misrecursos.php">Mis recursos</a></li>
		<li class="li"><a href="#">Historial de recursos</a></li>
	</ul>
</nav>
<?php
if(mysqli_num_rows($finalizados)>0 && mysqli_num_rows($tipos)>0){
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
	<input type="submit" name="enviar" value="Filtrar">
</form>
<h1>Historial de recursos</h1>
<br/>
<?php
	if(mysqli_num_rows($finalizados)>0){
		while($finalizado=mysqli_fetch_array($finalizados)){
					echo "Nombre: " .$finalizado['rec_nombre']. "<br/>" ;
					echo "Descripcion: " .$finalizado['rec_descripcion']. "<br/>" ;
					echo "Estado: " .$finalizado['rec_estado']. "<br/>" ;
					echo "<hr/>";
				} 
			} 
		} else {
			echo "Aún no has reservado ningun recurso";
		}

	?>

</body>
</html>