-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2022 a las 05:50:01
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ef_brighit`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED DEFAULT 0,
  `tipo` varchar(16) DEFAULT '',
  `s1_densidadpieza` varchar(16) DEFAULT '',
  `s1_grosor` varchar(16) DEFAULT '',
  `s1_alturacapa` varchar(16) DEFAULT '',
  `s1_material` varchar(16) DEFAULT '',
  `s1_urlimage` varchar(16) DEFAULT '',
  `s1_autoservicio` varchar(16) DEFAULT '',
  `s2_grosorlinea` varchar(16) DEFAULT '',
  `s2_colorlinea` varchar(16) DEFAULT '',
  `s2_material` varchar(16) DEFAULT '',
  `s2_dim1` varchar(16) DEFAULT '',
  `s2_dim2` varchar(16) DEFAULT '',
  `s2_ulrimagen` varchar(16) DEFAULT '',
  `s3_largo` varchar(16) DEFAULT '',
  `s3_ancho` varchar(16) DEFAULT '',
  `s3_alto` varchar(16) DEFAULT '',
  `s3_resolucion` varchar(16) DEFAULT '',
  `fecha` date DEFAULT NULL,
  `estado` varchar(16) DEFAULT 'NUEVO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `id_usuario`, `tipo`, `s1_densidadpieza`, `s1_grosor`, `s1_alturacapa`, `s1_material`, `s1_urlimage`, `s1_autoservicio`, `s2_grosorlinea`, `s2_colorlinea`, `s2_material`, `s2_dim1`, `s2_dim2`, `s2_ulrimagen`, `s3_largo`, `s3_ancho`, `s3_alto`, `s3_resolucion`, `fecha`, `estado`) VALUES
(1, 3, 'IMPRESION3D', '10', 'Fino', '0.1', 'ABS', 'sdsdsd', 'si', '', '', '', '', '', '', '', '', '', '', '2022-12-13', 'NUEVO'),
(2, 3, 'CORTELASER', '', '', '', '', '', '', 'Fino', 'Rojo', 'Acrilico', '2323', '2323', '2323', '', '', '', '', '2022-12-13', 'NUEVO'),
(3, 3, 'ESCANEO3D', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', 'null', 'null', '2022-12-11', 'NUEVO'),
(4, 4, 'IMPRESION3D', '10', 'Fino', '0.1', 'ABS', 'prueba123', 'si', '', '', '', '', '', '', '', '', '', '', '2022-12-13', 'NUEVO'),
(5, 7, 'CORTELASER', '', '', '', '', '', '', 'Fino', 'Rojo', 'Acrilico', '123', '123', '2323', '', '', '', '', '2022-12-13', 'NUEVO'),
(6, 7, 'IMPRESION3D', '10', 'Fino', '0.1', 'ABS', '2323', 'si', '', '', '', '', '', '', '', '', '', '', '2022-12-13', 'NUEVO'),
(7, 7, 'ESCANEO3D', '', '', '', '', '', '', '', '', '', '', '', '', '123', '123', 'null', 'Alta', '2022-12-13', 'NUEVO'),
(8, 7, 'ESCANEO3D', '', '', '', '', '', '', '', '', '', '', '', '', '23', '23', 'null', 'Alta', '2022-12-13', 'NUEVO'),
(9, 7, 'ESCANEO3D', '', '', '', '', '', '', '', '', '', '', '', '', '22', '22', 'null', 'Alta', '2022-12-13', 'NUEVO'),
(10, 8, 'IMPRESION3D', '10', 'Fino', '0.1', 'ABS', 'www.google.com', 'si', '', '', '', '', '', '', '', '', '', '', '2022-12-13', 'NUEVO'),
(11, 8, 'CORTELASER', '', '', '', '', '', '', 'Fino', 'Rojo', 'Acrilico', '22', '22', '22', '', '', '', '', '2022-12-13', 'NUEVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(64) DEFAULT '',
  `apellido` varchar(64) DEFAULT '',
  `correo` varchar(64) DEFAULT '',
  `clave` varchar(128) DEFAULT '',
  `tipo` varchar(16) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `correo`, `clave`, `tipo`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', 'admin123', ''),
(3, 'mario', 'manchego', 'mario@gmail.com', 'mario123', 'EXTERNO'),
(4, 'Brighit', 'AAA', 'usuario@gmail.com', 'usuario123', 'EXTERNO'),
(6, 'felipe', 'portilla', 'felipe@gmail.com', 'felipe123', 'EXTERNO'),
(7, 'juan', 'perez', 'juan@gmail.com', 'juancito', 'EXTERNO'),
(8, 'gabriel', 'marquez', 'gabriel@gmail.com', 'gabo123', 'EXTERNO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
