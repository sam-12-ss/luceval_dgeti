-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2025 a las 21:23:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `luceval_dbbb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `id` int(11) NOT NULL,
  `materia` varchar(100) NOT NULL,
  `grupo` varchar(50) NOT NULL,
  `alumno` varchar(100) NOT NULL,
  `asistencia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `id` int(11) NOT NULL,
  `profesor` varchar(100) DEFAULT NULL,
  `grupo` varchar(50) DEFAULT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `materia` varchar(100) DEFAULT NULL,
  `alumno` varchar(100) DEFAULT NULL,
  `actividades` text DEFAULT NULL,
  `proyecto` decimal(5,2) DEFAULT NULL,
  `examen` decimal(5,2) DEFAULT NULL,
  `promedio` decimal(5,2) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_profesores`
--

CREATE TABLE `registro_profesores` (
  `id` int(11) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `nombre_profesor` varchar(100) DEFAULT NULL,
  `grado` varchar(20) DEFAULT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `materia` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_profesores`
--

INSERT INTO `registro_profesores` (`id`, `matricula`, `nombre_profesor`, `grado`, `carrera`, `materia`, `fecha`) VALUES
(1, '12345', 'Juan Perez', '1°', 'Ingeniería', 'Matemáticas', '2025-10-22 05:00:47'),
(2, '12345', 'Juan Perez', '2°', 'Ingeniería', 'Física', '2025-10-22 05:00:47'),
(3, '12345', 'Juan Perez', '3°', 'Ingeniería', 'Química', '2025-10-22 05:00:47'),
(4, '67890', 'Ana López', '1°', 'Medicina', 'Anatomía', '2025-10-22 05:00:47'),
(5, '67890', 'Ana López', '2°', 'Medicina', 'Fisiología', '2025-10-22 05:00:47'),
(6, '67890', 'Ana López', '3°', 'Medicina', 'Farmacología', '2025-10-22 05:00:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `id` int(11) NOT NULL,
  `matricula` varchar(50) NOT NULL,
  `materia` varchar(100) NOT NULL,
  `grupo` varchar(50) NOT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `alumno` varchar(100) NOT NULL,
  `promedio_evaluacion` decimal(5,2) NOT NULL DEFAULT 0.00,
  `porcentaje_asistencia` int(11) NOT NULL DEFAULT 0,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `contraseña`) VALUES
(1, 'usuario@luceval.com', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_alumno_materia_grupo` (`materia`,`grupo`,`alumno`);

--
-- Indices de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro_profesores`
--
ALTER TABLE `registro_profesores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_alumno_materia_grupo` (`matricula`,`materia`,`grupo`,`alumno`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_profesores`
--
ALTER TABLE `registro_profesores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
