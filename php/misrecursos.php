<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="../css/recursos.css">
		<title>Recursos</title>
	</head>
	<body>
	<?php
	session_start();
	$mysqli = new mysqli("localhost", "root", "", "bd_mamproyecto2");

	//Cogemos el nombre de usuario y la imagen de forma dinámica en la BD
	$con =	"SELECT * FROM `tbl_usuario` WHERE `usu_id` = '". $_SESSION["usu_id"] ."'";
	//echo $con;
		//Lanzamos la consulta a la BD
		$result	=	mysqli_query($mysqli,$con);
		while ($fila = mysqli_fetch_row($result)) 
			{
				$usu_nickname	=	$fila[1];
				$usu_img	=	$fila[6];
				
			}
			
	?>
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
				<li class="li"><a href="#">Mis recursos</a></li>
				<li class="li"><a href="historial.php">Historial de recursos</a></li>
			</ul>
		</nav>
		<div class="container">
			<p class="reserved"> Tus recursos reservados són:</p> <br/>
			<?php
				$con 	=	"SELECT * FROM `tbl_reserva` WHERE `res_usuarioid` = " . $_SESSION["usu_id"] . "";
				$result 	=	mysqli_query($mysqli,$con);
				while($fila	=	mysqli_fetch_row($result)){
					echo $fila[3] . "<br/>";
					$con2	=	"SELECT * FROM `tbl_recurso` WHERE `rec_id` = ".$fila[3];
					echo $con2 . "<br/>";
				}

			?>
		</div>
	</body>
</html>