-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2022 a las 12:16:10
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsiscte`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts_data`
--

CREATE TABLE `contacts_data` (
  `id_contacto` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `phone1` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `phone2` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `corporative_email` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `personal_email` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corporative_data`
--

CREATE TABLE `corporative_data` (
  `id_persona` int(11) NOT NULL,
  `document_number` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `document_type` int(11) NOT NULL,
  `document_city` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `names` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `lastnames` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `job_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `corporative_data`
--

INSERT INTO `corporative_data` (`id_persona`, `document_number`, `document_type`, `document_city`, `names`, `lastnames`, `job_type`) VALUES
(1, '1121916239', 1, 'Villavicencio', 'Andrés Felipe', 'Galeano Espósito', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_type`
--

CREATE TABLE `document_type` (
  `id_document` int(11) NOT NULL,
  `siglas` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `document_describe` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `document_type`
--

INSERT INTO `document_type` (`id_document`, `siglas`, `document_describe`) VALUES
(1, 'CC', 'Cédula de ciudadanía'),
(2, 'TI', 'Tarjeta de identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job type`
--

CREATE TABLE `job type` (
  `id_job` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `salary_amount` int(11) NOT NULL,
  `supervisor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `job type`
--

INSERT INTO `job type` (`id_job`, `descripcion`, `salary_amount`, `supervisor`) VALUES
(1, 'Develop', 1000000, NULL),
(2, 'Tester', 1200000, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contacts_data`
--
ALTER TABLE `contacts_data`
  ADD PRIMARY KEY (`id_contacto`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `corporative_data`
--
ALTER TABLE `corporative_data`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `document_type` (`document_type`),
  ADD KEY `job_type` (`job_type`);

--
-- Indices de la tabla `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`id_document`);

--
-- Indices de la tabla `job type`
--
ALTER TABLE `job type`
  ADD PRIMARY KEY (`id_job`),
  ADD KEY `supervisor` (`supervisor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contacts_data`
--
ALTER TABLE `contacts_data`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `corporative_data`
--
ALTER TABLE `corporative_data`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `document_type`
--
ALTER TABLE `document_type`
  MODIFY `id_document` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `job type`
--
ALTER TABLE `job type`
  MODIFY `id_job` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contacts_data`
--
ALTER TABLE `contacts_data`
  ADD CONSTRAINT `contacts_data_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `corporative_data` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `corporative_data`
--
ALTER TABLE `corporative_data`
  ADD CONSTRAINT `corporative_data_ibfk_1` FOREIGN KEY (`document_type`) REFERENCES `document_type` (`id_document`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `corporative_data_ibfk_2` FOREIGN KEY (`job_type`) REFERENCES `job type` (`id_job`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
