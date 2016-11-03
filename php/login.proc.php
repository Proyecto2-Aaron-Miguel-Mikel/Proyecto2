<?php
extract($_POST);

//Realizamos la conexión a la BD
$mysqli = new mysqli("localhost", "root", "", "bd_mamproyecto2");
if ($mysqli->connect_errno) {
    echo "Fallo al conectar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
//Consulta de busqueda del usuario
	$con =	"SELECT * FROM `tbl_usuario` WHERE `usu_nickname` = '". $name ."' AND `usu_contrasena` = '" . $pass . "'";	
	//Lanzamos la consulta a la BD
	$result	=	mysqli_query($mysqli,$con);
	//Contamos los resultados que nos devuelve
	$total  = mysqli_num_rows($result); 
	if($total>=1){
		echo "Tu nombre es: " .$name;
		echo "<br/> Tu contraseña es " . $pass;
	}
	else{
		//echo "Tus datos no son correctos";
		header("location: ../index.php?nolog=1");
	}
?>