-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-04-2018 a las 10:46:43
-- Versión del servidor: 5.7.21-0ubuntu0.17.10.1
-- Versión de PHP: 7.1.11-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futbol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `codEquipo` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `liga` int(11) NOT NULL,
  `fundacion` int(11) NOT NULL,
  `localidad` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `imagen` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`codEquipo`, `nombre`, `liga`, `fundacion`, `localidad`, `imagen`) VALUES
(1111, 'Real Madrid', 33, 1902, 'Madrid', 'RealMadrid.png'),
(1112, 'Barcelona', 24, 1899, 'Barcelona', 'Barcelona.png'),
(1113, 'Atlético de Madrid', 10, 1903, 'Madrid', 'Atletico.png'),
(1114, 'Valéncia', 6, 1919, 'Valéncia', 'Valencia.png'),
(1115, 'Athletic Club', 8, 1898, 'Bilbao', 'Atletic.png'),
(1116, 'Sevilla', 1, 1890, 'Sevilla', 'Sevilla.png'),
(1117, 'Espanyol', 0, 1900, 'Barcelona', 'Espanyol.png'),
(1118, 'Real Sociedad', 2, 1909, 'San Sebastián', 'RealSociedad.png'),
(1119, 'Real Zaragoza', 0, 1932, 'Zaragoza', 'RealZaragoza.png'),
(1120, 'Betis', 1, 1907, 'Sevilla', 'Betis.png'),
(1121, 'Deportivo de la Coruña', 1, 1906, 'La Coruña', 'Deportivo.png'),
(1122, 'Celta de Vigo', 0, 1923, 'Vigo', 'Celta.png'),
(1123, 'Valladoid', 0, 1928, 'Valladoid', 'Valladoid.png'),
(1124, 'Racing de Santander', 0, 1913, 'Santander', 'Santander.png'),
(1125, 'Sporting de Gijón', 0, 1905, 'Gijón', 'Gijon.png'),
(1126, 'Osasuna', 0, 1920, 'Pamplona ', 'Osasuna.png'),
(1127, 'Real Oviedo', 0, 1926, 'Oviedo', 'Oviedo.png'),
(1128, 'Mallorca', 0, 1916, 'Mallorca', 'Mallorca.png'),
(1129, 'Las Palmas', 0, 1949, 'Las Palmas', 'LasPalmas.png'),
(1131, 'Málaga', 0, 1948, 'Málaga', 'Malaga.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `numeroID` int(11) NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `codEquipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`numeroID`, `nombre`, `codEquipo`) VALUES
(22200, 'Kepa Arrizabalaga', 1115),
(22201, 'Lucas Hernández', 1113),
(22202, 'Andrés Iniesta', 1112),
(22203, 'Maksym Koval', 1121),
(22204, 'Óscar Duarte', 1117),
(22204, 'Míchel Macedo', 1129),
(22205, 'Diego González', 1131),
(222006, 'Antonio Barragán', 1120),
(22207, 'Isco', 1111),
(22207, 'Cristiano Ronaldo', 1111),
(22208, 'Diego Llorente', 1118),
(22213, 'Andrés Prieto', 1131),
(22209, 'Toni Lato', 1114),
(22210, 'Adrián Marín', 1131),
(22211, 'Daniel Parejo', 1114),
(22212, 'Lucas Vázquez', 1111),
(22214, 'Hugo Mallo Novegil', 1122),
(22215, 'Iago Aspas Juncal', 1122),
(22215, 'Sergio González Soriano', 1121),
(22216, 'Juan Carlos Valerón Santana', 1121);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`codEquipo`),
  ADD KEY `nombre` (`nombre`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD KEY `codEquipo` (`codEquipo`),
  ADD KEY `codEquipo_2` (`codEquipo`),
  ADD KEY `codEquipo_3` (`codEquipo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`codEquipo`) REFERENCES `equipos` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
