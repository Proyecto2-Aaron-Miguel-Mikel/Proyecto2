<?php
	//Cogemos la ID del recurso que queremos liberar
	$id_recu	=	$_GET['id'];
	echo $_GET['id'];
	//Cogemos la fecha actual en formato americano
	$fdate	= date("Y")."/".date("m")."/".date("d");
	echo $fdate;
	$mysqli = new mysqli("localhost", "root", "", "bd_mamproyecto2");
	$con_recu	=	"UPDATE `tbl_recurso` SET `rec_estado` = 'Disponible' WHERE `tbl_recurso`.`rec_id` = ".$id_recu.";";
	echo $con_recu;
?>