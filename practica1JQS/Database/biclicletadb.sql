-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-02-2023 a las 14:52:07
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biclicletadb`
--
CREATE DATABASE IF NOT EXISTS `biclicletadb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `biclicletadb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `idAlquiler` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaDesde` date NOT NULL,
  `cantidadDias` tinyint(4) NOT NULL,
  `idBicicleta` int(11) NOT NULL,
  `idTalla` int(11) NOT NULL,
  `comentarios` text DEFAULT NULL,
  `seguroAsistencia` tinyint(1) NOT NULL,
  `total` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`idAlquiler`, `idUsuario`, `fechaDesde`, `cantidadDias`, `idBicicleta`, `idTalla`, `comentarios`, `seguroAsistencia`, `total`) VALUES
(1, 1, '2023-02-12', 1, 8, 5, 'Ninguno', 1, '41000.00'),
(2, 2, '2023-02-12', 2, 3, 4, 'Revisión exahustiva', 0, '56000.00'),
(3, 3, '2023-02-13', 1, 7, 4, 'Agregar más tallas', 1, '46000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicicleta`
--

CREATE TABLE `bicicleta` (
  `idBicicleta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precioDia` decimal(18,2) NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bicicleta`
--

INSERT INTO `bicicleta` (`idBicicleta`, `nombre`, `descripcion`, `precioDia`, `idCategoria`) VALUES
(1, 'Sunday BluePrint', 'Ideal para los pequeños, ajustable, piñon de 13T', '20000.00', 1),
(2, 'Coluer Rockband Rojo', 'Cuadro Rockband en acero Hi-Ten, Horquilla rígida en acero reforzada y eje 14mm', '24000.00', 1),
(3, 'Subrosa Black (2021)', 'BMX SUBROSA TIRO XL – edición 2021, Tamaño del ciclista desde 1,75 m', '28000.00', 1),
(4, 'Orbea Orca M30i Amarillo/negro 2023', 'Orbea ha lanzado como adelanteo de gama un modelo con su cuadro de carbono OMR', '35000.00', 2),
(5, 'BMC Roadmachine One ora/pet/pet (2022)', 'Roadmachine Tiene una estructura ligera y una excelente transmisión de energía. Su diseño orientado al DNA rendimiento la convierte en una máquina muy eficiente en una amplia gama de terrenos.', '45000.00', 2),
(6, 'Orbea Orca M20 Bla/iri', 'CUADRO Orbea Orca carbon OMR Disc, monocoque construction, HS 1,5″, BB 386mm, powermeter compatible, Rear Thru Axle 12x142mm, thread M12x2 P1, Speed release compatible dropout, Internal Cable.', '40000.00', 2),
(7, 'Focus Thron2 6.8 750 WH F.White (2023)', 'El eficaz motor Bosch Performance CX (4ª gen.) te ofrece asistencia hasta los 25 km/h con unos potentes 85 Nm. El motor más potente de Bosch está perfectamente integrado, la THRON² tiene un comportamiento muy equilibrado. ', '42000.00', 3),
(8, 'Focus Jarifa2 6.7 Nine 29″ negro (2023)', 'Bosch Smart system personalizable con motor performance cx, pantalla intuvia y batería de 625 wh. Geometría mtb preparada para la montaña con ruedas de 29″ (talla xs: 27,5″) y cambios shimano deore de 10 velocidades. Cómodo puesto de mandos y potencia', '36000.00', 3),
(9, 'Mondraker Prime X Black/Green', 'La Prime X es nuestra Urban Cross con nuestro sello de identidad que te permitirá disfrutar de la bici con estilo propio, con comodidad y confianza.', '33000.00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicicleta_talla`
--

CREATE TABLE `bicicleta_talla` (
  `idBicicleta` int(11) NOT NULL,
  `idTalla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bicicleta_talla`
--

INSERT INTO `bicicleta_talla` (`idBicicleta`, `idTalla`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 4),
(3, 5),
(3, 6),
(4, 3),
(4, 4),
(4, 5),
(5, 3),
(5, 4),
(5, 5),
(6, 4),
(6, 5),
(6, 6),
(7, 3),
(7, 4),
(7, 5),
(8, 4),
(8, 5),
(9, 3),
(9, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombre`) VALUES
(1, 'BMX'),
(2, 'Carretera'),
(3, 'Eléctricas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `idTalla` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`idTalla`, `nombre`, `descripcion`) VALUES
(1, '5 a 8 años', 'Bicicleta infantil para edades entre 5 a 8 años'),
(2, '8 a 11 años', 'Bicicleta infantil para edades entre 8 a 11 años'),
(3, 'S', '15-16 pulgadas'),
(4, 'M', '17-18 pulgas'),
(5, 'L', '19-20 pulgadas'),
(6, 'XL', '21-22 pulgadas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `identificacion` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `identificacion`, `nombre`, `email`, `telefono`) VALUES
(1, '112233445566', 'Adrián Vargas Mesa', 'avargasm@prueba.com', '112233445566'),
(2, '223344556677', 'Sofía Torres Mora', 'storresm@prueba.com', '223344556677'),
(3, '334455667788', 'Valeria Obando Castillo', 'vobandoc@prueba.com', '334455667788');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`idAlquiler`),
  ADD KEY `fk_alquiler_usuario_idx` (`idUsuario`),
  ADD KEY `fk_alquiler_talla_idx` (`idTalla`),
  ADD KEY `fk_alquiler_bicicleta_idx` (`idBicicleta`);

--
-- Indices de la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  ADD PRIMARY KEY (`idBicicleta`),
  ADD KEY `fk_bicicleta_categoria_idx` (`idCategoria`);

--
-- Indices de la tabla `bicicleta_talla`
--
ALTER TABLE `bicicleta_talla`
  ADD PRIMARY KEY (`idBicicleta`,`idTalla`),
  ADD KEY `fk_bicicleta_talla_talla_idx` (`idTalla`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`idTalla`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `idAlquiler` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  MODIFY `idBicicleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `talla`
--
ALTER TABLE `talla`
  MODIFY `idTalla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `fk_alquiler_bicicleta` FOREIGN KEY (`idBicicleta`) REFERENCES `bicicleta` (`idBicicleta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alquiler_talla` FOREIGN KEY (`idTalla`) REFERENCES `talla` (`idTalla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alquiler_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  ADD CONSTRAINT `fk_bicicleta_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bicicleta_talla`
--
ALTER TABLE `bicicleta_talla`
  ADD CONSTRAINT `fk_bicicleta_talla_bicicleta` FOREIGN KEY (`idBicicleta`) REFERENCES `bicicleta` (`idBicicleta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bicicleta_talla_talla` FOREIGN KEY (`idTalla`) REFERENCES `talla` (`idTalla`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
