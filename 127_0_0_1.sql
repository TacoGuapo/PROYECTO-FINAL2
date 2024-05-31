-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2024 a las 06:32:28
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
-- Base de datos: `proyecto_final`
--
CREATE DATABASE IF NOT EXISTS `proyecto_final` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyecto_final`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--
-- Creación: 30-05-2024 a las 10:17:31
-- Última actualización: 31-05-2024 a las 04:29:21
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(6, 'deportes'),
(7, 'Noticias'),
(8, 'Comedia'),
(9, 'series'),
(10, 'Peliculas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_posts`
--
-- Creación: 31-05-2024 a las 04:05:57
-- Última actualización: 31-05-2024 a las 04:30:24
--

CREATE TABLE `category_posts` (
  `id_posts` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `category_posts`
--

INSERT INTO `category_posts` (`id_posts`, `id_category`) VALUES
(15, 6),
(15, 6),
(18, 10),
(17, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--
-- Creación: 30-05-2024 a las 07:23:39
-- Última actualización: 31-05-2024 a las 04:28:13
--

CREATE TABLE `comments` (
  `id_comments` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `creation_date` varchar(250) NOT NULL,
  `content` varchar(250) NOT NULL,
  `id_posts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id_comments`, `id_users`, `creation_date`, `content`, `id_posts`) VALUES
(11, 19, '2024-05-31 04:27:20', 'Nececesita una reformacion el futbol peruano', 15),
(12, 17, '2024-05-31 04:27:33', 'Nos falta mucho aun', 15),
(13, 20, '2024-05-31 04:27:59', 'La mejor serie de todas', 16),
(14, 19, '2024-05-31 04:28:13', 'Mi favorita', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--
-- Creación: 30-05-2024 a las 10:16:53
--

CREATE TABLE `posts` (
  `id_posts` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` varchar(250) NOT NULL,
  `creation_date` varchar(250) NOT NULL,
  `user` varchar(250) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id_posts`, `title`, `content`, `creation_date`, `user`, `id_users`) VALUES
(15, 'Volvimos a perder', 'Alianza lima volvio a perder en el extranjero como siempre.', '2024-05-30 10:16:55', 'Tacomor', 18),
(16, 'Final epico', 'El final de Breaking Bad estuvo de 20.', '2024-05-30 10:18:11', 'Abejilla', 19),
(17, 'Ultima hora en Villa maria', 'Acaba de quemarse una casa a la altura del paradero 5.', '2024-05-30 10:19:13', 'papanatas', 17),
(18, 'Buena pelicula', 'Volviendo a ver Spiderman No way home.', '2024-05-30 10:19:49', 'mcclovin', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--
-- Creación: 28-05-2024 a las 17:50:41
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `rol_name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `rol_name`) VALUES
(1, 'Admin'),
(2, 'Users');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--
-- Creación: 30-05-2024 a las 08:22:32
-- Última actualización: 31-05-2024 a las 04:02:50
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `user` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_users`, `user`, `name`, `email`, `password`, `id_rol`) VALUES
(16, 'mcclovin', 'Mick Araujo', 'misioneroaraujo2021@hotmail.com', 'salmos826', 2),
(17, 'papanatas', 'Anthony Vela', 'misionerovela@hotmail.com', 'papas123', 2),
(18, 'Tacomor', 'Francis Sotero', 'karma.police190@hotmail.com', 'karmapolice4321', 1),
(19, 'Abejilla', 'Mishell Ortiz', 'mishellortiz@hotmail.com', 'abeja4321', 2),
(20, 'ambulez', 'Francis', 'karma.police190@hotmail.com', '43114123', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indices de la tabla `category_posts`
--
ALTER TABLE `category_posts`
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_posts` (`id_posts`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comments`),
  ADD KEY `comments_ibfk_1` (`id_users`),
  ADD KEY `id_posts` (`id_posts`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id_posts`),
  ADD KEY `id_users` (`id_users`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comments` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id_posts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `category_posts`
--
ALTER TABLE `category_posts`
  ADD CONSTRAINT `category_posts_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `category_posts_ibfk_2` FOREIGN KEY (`id_posts`) REFERENCES `posts` (`id_posts`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_posts`) REFERENCES `posts` (`id_posts`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
