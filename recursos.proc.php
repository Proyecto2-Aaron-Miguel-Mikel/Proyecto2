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

		$sql = "UPDATE tbl_recurso SET rec_estado='ocupado' WHERE rec_id='$rec_id'";

		echo $sql;

		$reservar_producto = mysqli_query($conexion, $sql);

		header('location: recursos.php');
?>