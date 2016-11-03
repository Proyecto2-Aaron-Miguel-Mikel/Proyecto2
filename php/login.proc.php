<?php
extract($_POST);
echo "Tu nombre es: " .$name;
echo "<br/> Tu contraseña es " . $pass;
$mysqli = new mysqli("localhost", "root", "", "bd_mamproyecto2");
	//formateamos el campo fecha, para que siga el estandar americano

	if ($mysqli->connect_errno) {
    echo "Fallo al conectar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
?>