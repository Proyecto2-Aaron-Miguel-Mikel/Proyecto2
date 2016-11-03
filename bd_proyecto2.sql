-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2016 a las 16:23:43
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_proyecto2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_incidencia`
--

CREATE TABLE `tbl_incidencia` (
  `inc_id` int(4) NOT NULL,
  `inc_comentario` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `inc_recursoid` int(2) NOT NULL,
  `inc_tipinc` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_recurso`
--

CREATE TABLE `tbl_recurso` (
  `rec_id` int(2) NOT NULL,
  `rec_nombre` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `rec_foto` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `rec_descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `rec_tipoid` int(2) NOT NULL,
  `rec_estado` varchar(15) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reserva`
--

CREATE TABLE `tbl_reserva` (
  `res_id` int(4) NOT NULL,
  `res_fechainicio` datetime NOT NULL,
  `res_fechafinal` datetime DEFAULT NULL,
  `res_recursoid` int(2) NOT NULL,
  `res_usuarioid` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipoinc`
--

CREATE TABLE `tbl_tipoinc` (
  `ti_id` int(2) NOT NULL,
  `ti_nombre` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tiporecurso`
--

CREATE TABLE `tbl_tiporecurso` (
  `tr_id` int(2) NOT NULL,
  `tr_nombre` varchar(15) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `usu_id` int(3) NOT NULL,
  `usu_nickname` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_nombre` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_apellido` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_correo` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_cargo` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_foto` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_incidencia`
--
ALTER TABLE `tbl_incidencia`
  ADD PRIMARY KEY (`inc_id`);

--
-- Indices de la tabla `tbl_recurso`
--
ALTER TABLE `tbl_recurso`
  ADD PRIMARY KEY (`rec_id`);

--
-- Indices de la tabla `tbl_reserva`
--
ALTER TABLE `tbl_reserva`
  ADD PRIMARY KEY (`res_id`);

--
-- Indices de la tabla `tbl_tipoinc`
--
ALTER TABLE `tbl_tipoinc`
  ADD PRIMARY KEY (`ti_id`);

--
-- Indices de la tabla `tbl_tiporecurso`
--
ALTER TABLE `tbl_tiporecurso`
  ADD PRIMARY KEY (`tr_id`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_incidencia`
--
ALTER TABLE `tbl_incidencia`
  MODIFY `inc_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_recurso`
--
ALTER TABLE `tbl_recurso`
  MODIFY `rec_id` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_reserva`
--
ALTER TABLE `tbl_reserva`
  MODIFY `res_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_tipoinc`
--
ALTER TABLE `tbl_tipoinc`
  MODIFY `ti_id` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_tiporecurso`
--
ALTER TABLE `tbl_tiporecurso`
  MODIFY `tr_id` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `usu_id` int(3) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
