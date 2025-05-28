-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2025 a las 19:08:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crm_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `telefono`, `email`, `empresa`, `notas`) VALUES
(12, 'Carlosa', 'Gómez', '600778899', 'carlos.gomez@example.com', 'GreenCorp', 'Necesita presupuesto urgente'),
(13, 'Sofía', 'Ruiz', '600556677', 'sofia.ruiz@example.com', '', ''),
(14, 'David', 'Pérez', '600889900', 'david.perez@example.com', 'FastDelivery', ''),
(15, 'Elena', 'Moreno', '600334455', 'elena.moreno@example.com', 'FastDelivery', 'Solicita informes mensuales'),
(16, 'Miguel', 'Díaz', '600667788', 'miguel.diaz@example.com', 'Alpha Inc', ''),
(17, 'Laura', 'Torres', '600123789', 'laura.torres@example.com', 'Alpha Inc', ''),
(18, 'Andrés', 'Vega', '600456123', 'andres.vega@example.com', '', ''),
(19, 'Cristina', 'Ortiz', '600789456', 'cristina.ortiz@example.com', 'BetaSoft', ''),
(20, 'Jorge', 'Castro', '600321654', 'jorge.castro@example.com', 'BetaSoft', 'Prefiere llamadas por la tarde'),
(21, 'Isabel', 'Núñez', '600654987', 'isabel.nunez@example.com', 'Omega Corp', ''),
(22, 'Raúl', 'Salas', '600987321', 'raul.salas@example.com', 'Omega Corp', ''),
(23, 'Patricia', 'Molina', '600147258', 'patricia.molina@example.com', '', ''),
(24, 'Fernando', 'Ramos', '600369258', 'fernando.ramos@example.com', 'Tech Solutions', ''),
(25, 'Verónica', 'Santos', '600258369', 'veronica.santos@example.com', '', ''),
(26, 'Diego', 'Jiménez', '600753159', 'diego.jimenez@example.com', 'Innovatech', 'Cliente nuevo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
