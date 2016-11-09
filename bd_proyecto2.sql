-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2016 at 06:28 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_proyecto2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_incidencia`
--

CREATE TABLE `tbl_incidencia` (
  `inc_id` int(4) NOT NULL,
  `inc_comentario` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `inc_recursoid` int(2) NOT NULL,
  `inc_tipinc` int(2) NOT NULL,
  `inc_fechaini` datetime NOT NULL,
  `inc_fechafinal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tbl_incidencia`
--

INSERT INTO `tbl_incidencia` (`inc_id`, `inc_comentario`, `inc_recursoid`, `inc_tipinc`, `inc_fechaini`, `inc_fechafinal`) VALUES
(10, '', 1, 1, '0000-00-00 00:00:00', '2016-11-09 18:21:34'),
(11, '', 2, 1, '2016-11-09 18:15:13', '2016-11-09 18:21:34'),
(12, '', 2, 1, '2016-11-09 18:15:42', '2016-11-09 18:21:34'),
(13, '', 2, 3, '2016-11-09 18:18:01', '2016-11-09 18:21:34'),
(14, '', 1, 1, '2016-11-09 18:21:23', '2016-11-09 18:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recurso`
--

CREATE TABLE `tbl_recurso` (
  `rec_id` int(2) NOT NULL,
  `rec_nombre` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `rec_foto` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `rec_descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `rec_tipoid` int(2) NOT NULL,
  `rec_estado` varchar(15) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tbl_recurso`
--

INSERT INTO `tbl_recurso` (`rec_id`, `rec_nombre`, `rec_foto`, `rec_descripcion`, `rec_tipoid`, `rec_estado`) VALUES
(1, 'Aula de teoría 308', '1.jpg', 'Aula de 60 m2 con capacidad para 36 alumnos.', 1, 'disponible'),
(2, 'Aula de teoría 410', '2.jpg', 'Aula de 30 m2 con capacidad para 15 alumnos.', 1, 'disponible'),
(3, 'Aula de teoría 209', '3.jpg', 'Aula de 70 m2 con capacidad para 40 alumnos.', 1, 'disponible'),
(4, 'Aula de teoría 103', '4.jpg', 'Aula de 20 m2 con capacidad para 10 alumnos', 1, 'disponible'),
(5, 'Aula de informática 501', '5.jpg', 'Aula de informática con 20 ordenadores', 2, 'disponible'),
(6, 'Aula de informática 104', '6.jpg', 'Aula de informática con 30 ordenadores', 2, 'disponible'),
(7, 'Despacho para entrevista 001', '7.jpg', 'Despacho de 10 m2 para entrevista', 3, 'disponible'),
(8, 'Despacho para entrevista 002', '8.jpg', 'Despacho de 10 m2 para entrevista', 3, 'disponible'),
(9, 'Sala de reuniones 010', '9.jpg', 'Sala de 20 m2 para reuniones', 4, 'disponible'),
(10, 'Proyector portátil', '10.jpg', 'Proyector con entrada HDMI para aulas con pizarra digital.', 5, 'disponible'),
(11, 'Carro de portátiles', '11.jpg', 'Carro con ruedas deslizantes con capacidad para 20 portátiles', 6, 'disponible'),
(12, 'Portátil TOSHIBA ', '12.jpg', 'Portátil i7 con Windows 10', 7, 'disponible'),
(13, 'Portátil LENOVO ', '13.jpg', 'Portátil i7 con Windows 10', 7, 'disponible'),
(14, 'Portátil ASUS', '14.jpg', 'Portátil i7 con Windows 10', 7, 'disponible'),
(15, 'Móvil iPhone 7', '15.jpg', 'Móvil iPhone 7 de la compañía Apple.', 8, 'disponible'),
(16, 'Móvil Samsung S7', '16.jpg', 'Móvil Samsung S7 de la compañía Samsung.', 8, 'disponible');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reserva`
--

CREATE TABLE `tbl_reserva` (
  `res_id` int(4) NOT NULL,
  `res_fechainicio` datetime NOT NULL,
  `res_fechafinal` datetime DEFAULT NULL,
  `res_recursoid` int(2) NOT NULL,
  `res_usuarioid` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tbl_reserva`
--

INSERT INTO `tbl_reserva` (`res_id`, `res_fechainicio`, `res_fechafinal`, `res_recursoid`, `res_usuarioid`) VALUES
(1, '2016-11-08 16:11:45', '2016-11-09 18:21:23', 1, 1),
(2, '2016-11-08 17:12:46', '2016-11-09 17:29:36', 16, 1),
(3, '2016-11-08 17:39:32', '2016-11-09 17:36:25', 6, 1),
(4, '2016-11-09 17:17:41', '2016-11-09 18:18:01', 2, 1),
(5, '2016-11-09 17:55:33', '2016-11-09 18:21:23', 1, 1),
(6, '2016-11-09 17:56:54', '2016-11-09 18:18:01', 2, 1),
(7, '2016-11-09 17:56:56', '2016-11-09 18:04:44', 5, 1),
(8, '2016-11-09 17:56:57', '2016-11-09 18:04:51', 3, 1),
(9, '2016-11-09 18:05:27', '2016-11-09 18:21:23', 1, 1),
(10, '2016-11-09 18:13:22', '2016-11-09 18:21:23', 1, 1),
(11, '2016-11-09 18:15:00', '2016-11-09 18:18:01', 2, 1),
(12, '2016-11-09 18:15:31', '2016-11-09 18:18:01', 2, 1),
(13, '2016-11-09 18:17:38', '2016-11-09 18:18:01', 2, 1),
(14, '2016-11-09 18:17:40', '2016-11-09 18:21:23', 1, 1),
(15, '2016-11-09 18:21:16', '2016-11-09 18:21:23', 1, 1),
(16, '2016-11-09 18:24:33', '2016-11-09 18:24:37', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipoinc`
--

CREATE TABLE `tbl_tipoinc` (
  `ti_id` int(2) NOT NULL,
  `ti_nombre` varchar(30) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tbl_tipoinc`
--

INSERT INTO `tbl_tipoinc` (`ti_id`, `ti_nombre`) VALUES
(1, 'Mal funcionamiento'),
(2, 'Material desaparecido'),
(3, 'Aula en mal estado'),
(4, 'Otros');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tiporecurso`
--

CREATE TABLE `tbl_tiporecurso` (
  `tr_id` int(2) NOT NULL,
  `tr_nombre` varchar(30) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tbl_tiporecurso`
--

INSERT INTO `tbl_tiporecurso` (`tr_id`, `tr_nombre`) VALUES
(1, 'Aula de teoría'),
(2, 'Aula de informática'),
(3, 'Despacho para entrevista'),
(4, 'Sala de reuniones'),
(5, 'Proyector portátil'),
(6, 'Carro de portátiles'),
(7, 'Portátil'),
(8, 'Móvil');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `usu_id` int(3) NOT NULL,
  `usu_nickname` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_nombre` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_apellido` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_correo` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_cargo` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_foto` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_contrasena` varchar(15) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`usu_id`, `usu_nickname`, `usu_nombre`, `usu_apellido`, `usu_correo`, `usu_cargo`, `usu_foto`, `usu_contrasena`) VALUES
(1, 'dmarin', 'David', 'Marín', 'david.marin@fje.edu', 'usuario', 'dmarin.jpg', 'qwe123'),
(2, 'sjimenez', 'Sergio', 'Jiménez', 'sergio.jimenez@fje.edu', 'usuario', 'sjimenez.jpg', 'zxc123'),
(3, 'aplans', 'Agnès', 'Plans', 'agnes.plans@fje.edu', 'usuario', 'aplans.jpg', 'asd123'),
(4, 'iromero', 'Ignasi', 'Romero', 'ignasi.romero@fje.edu', 'usuario', 'iromero.jpg', 'abc123'),
(5, 'administrador', 'Administrador', 'Administrador', 'mamproyecto2@gmail.com', 'administrador', '0.jpg', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_incidencia`
--
ALTER TABLE `tbl_incidencia`
  ADD PRIMARY KEY (`inc_id`);

--
-- Indexes for table `tbl_recurso`
--
ALTER TABLE `tbl_recurso`
  ADD PRIMARY KEY (`rec_id`);

--
-- Indexes for table `tbl_reserva`
--
ALTER TABLE `tbl_reserva`
  ADD PRIMARY KEY (`res_id`);

--
-- Indexes for table `tbl_tipoinc`
--
ALTER TABLE `tbl_tipoinc`
  ADD PRIMARY KEY (`ti_id`);

--
-- Indexes for table `tbl_tiporecurso`
--
ALTER TABLE `tbl_tiporecurso`
  ADD PRIMARY KEY (`tr_id`);

--
-- Indexes for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_incidencia`
--
ALTER TABLE `tbl_incidencia`
  MODIFY `inc_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_recurso`
--
ALTER TABLE `tbl_recurso`
  MODIFY `rec_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tbl_reserva`
--
ALTER TABLE `tbl_reserva`
  MODIFY `res_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tbl_tipoinc`
--
ALTER TABLE `tbl_tipoinc`
  MODIFY `ti_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_tiporecurso`
--
ALTER TABLE `tbl_tiporecurso`
  MODIFY `tr_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `usu_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
