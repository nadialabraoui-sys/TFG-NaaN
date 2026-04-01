-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 01, 2026 at 08:26 AM
-- Server version: 8.0.45
-- PHP Version: 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `naan_bbdd`
--

-- --------------------------------------------------------

--
-- Table structure for table `auditoria`
--

CREATE TABLE `auditoria` (
  `id_auditoria` int NOT NULL,
  `tabla_afectada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_registro` int DEFAULT NULL,
  `operacion` enum('INSERT','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datos_anteriores` json DEFAULT NULL,
  `datos_nuevos` json DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auditoria`
--

INSERT INTO `auditoria` (`id_auditoria`, `tabla_afectada`, `id_registro`, `operacion`, `datos_anteriores`, `datos_nuevos`, `fecha`) VALUES
(1, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-02-28 16:40:57'),
(2, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-04 15:40:02'),
(3, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-04 15:40:23'),
(4, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-04 15:40:35'),
(5, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-04 15:40:36'),
(6, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-04 15:40:41'),
(7, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-04 15:41:27'),
(8, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-04 15:41:58'),
(9, 'Categoria', 1, 'UPDATE', '{\"nombre\": \"Ropa\", \"descripcion\": \"Ropa de todo tipo\"}', '{\"nombre\": \"Guayaberas Editado\", \"descripcion\": \"Ropa de todo tipo\"}', '2026-03-04 15:47:15'),
(10, 'Categoria', 1, 'UPDATE', '{\"nombre\": \"Guayaberas Editado\", \"descripcion\": \"Ropa de todo tipo\"}', '{\"nombre\": \"Ropa\", \"descripcion\": \"Ropa de todo tipo\"}', '2026-03-04 15:47:30'),
(11, 'Categoria', 2, 'UPDATE', '{\"nombre\": \"Guayaberas\", \"descripcion\": \"Ropa presidencial de Mexico\"}', '{\"nombre\": \"Guayabera Editado\", \"descripcion\": \"Ropa presidencial de Mexico\"}', '2026-03-04 15:47:39'),
(12, 'Pedido', 1, 'UPDATE', '{\"total\": 0.00, \"estado\": \"pendiente\"}', '{\"total\": 0.00, \"estado\": \"pagado\"}', '2026-03-04 16:07:28'),
(13, 'Pedido', 1, 'UPDATE', '{\"total\": 0.00, \"estado\": \"pagado\"}', '{\"total\": 0.00, \"estado\": \"enviado\"}', '2026-03-04 16:07:35'),
(14, 'Pedido', 1, 'UPDATE', '{\"total\": 0.00, \"estado\": \"enviado\"}', '{\"total\": 0.00, \"estado\": \"cancelado\"}', '2026-03-04 16:07:47'),
(15, 'Pedido', 1, 'UPDATE', '{\"total\": 0.00, \"estado\": \"cancelado\"}', '{\"total\": 39.98, \"estado\": \"cancelado\"}', '2026-03-04 16:38:18'),
(16, 'Pedido', 1, 'UPDATE', '{\"total\": 39.98, \"estado\": \"cancelado\"}', '{\"total\": 0.00, \"estado\": \"cancelado\"}', '2026-03-04 16:38:45'),
(17, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 11:47:41'),
(18, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:02:33'),
(19, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:02:35'),
(20, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:02:36'),
(21, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:02:37'),
(22, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:02:38'),
(23, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:02:38'),
(24, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:02:39'),
(25, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:02:40'),
(26, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:02:41'),
(27, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:02:41'),
(28, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:02:43'),
(29, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:02:49'),
(30, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:02:50'),
(31, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:04:54'),
(32, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:04:55'),
(33, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:04:57'),
(34, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:04:57'),
(35, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:04:58'),
(36, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:04:59'),
(37, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:05:00'),
(38, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:05:01'),
(39, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:05:02'),
(40, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:05:02'),
(41, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:10:38'),
(42, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:13:05'),
(43, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:13:06'),
(44, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:13:08'),
(45, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:13:09'),
(46, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:13:09'),
(47, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 12:13:10'),
(48, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:13:11'),
(49, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:13:11'),
(50, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:13:16'),
(51, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:13:28'),
(52, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:14:25'),
(53, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:20:06'),
(54, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:20:07'),
(55, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:20:08'),
(56, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:20:08'),
(57, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:20:09'),
(58, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:20:10'),
(59, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:21:37'),
(60, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:21:38'),
(61, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:21:38'),
(62, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:24:00'),
(63, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:24:03'),
(64, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:24:05'),
(65, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:24:07'),
(66, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:24:11'),
(67, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:24:18'),
(68, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:24:22'),
(69, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:24:41'),
(70, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 12:24:46'),
(71, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:24:48'),
(72, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:24:50'),
(73, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:24:54'),
(74, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:24:55'),
(75, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:24:56'),
(76, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:24:57'),
(77, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:26:51'),
(78, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:26:53'),
(79, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:26:55'),
(80, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:26:56'),
(81, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:26:59'),
(82, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:27:03'),
(83, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:27:04'),
(84, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:28:09'),
(85, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:31:36'),
(86, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:31:40'),
(87, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:31:42'),
(88, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:31:42'),
(89, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 12:31:43'),
(90, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:31:44'),
(91, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 12:31:53'),
(92, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:31:54'),
(93, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:31:55'),
(94, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:31:56'),
(95, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:32:00'),
(96, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:34:41'),
(97, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:34:46'),
(98, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:35:24'),
(99, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:36:05'),
(100, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:36:07'),
(101, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:36:13'),
(102, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:36:15'),
(103, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:36:16'),
(104, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:36:17'),
(105, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:36:18'),
(106, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:38:56'),
(107, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:38:59'),
(108, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 12:39:00'),
(109, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:39:01'),
(110, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:39:06'),
(111, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:39:08'),
(112, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:39:09'),
(113, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:39:10'),
(114, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:40:12'),
(115, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:40:13'),
(116, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 12:40:14'),
(117, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:40:15'),
(118, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:40:27'),
(119, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:40:28'),
(120, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:40:29'),
(121, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:40:29'),
(122, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:41:31'),
(123, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:41:32'),
(124, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 12:41:33'),
(125, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:41:39'),
(126, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:41:40'),
(127, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 12:41:42'),
(128, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:45:02'),
(129, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:45:03'),
(130, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:45:04'),
(131, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:45:06'),
(132, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:45:07'),
(133, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:45:08'),
(134, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:46:43'),
(135, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 12:46:45'),
(136, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:46:47'),
(137, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:47:30'),
(138, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:47:32'),
(139, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:47:33'),
(140, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:48:45'),
(141, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:48:50'),
(142, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-16 12:48:51'),
(143, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:48:51'),
(144, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 12:48:53'),
(145, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:50:26'),
(146, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:51:04'),
(147, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-16 12:51:05'),
(148, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 12:51:06'),
(149, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 13:16:12'),
(150, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-16 16:25:03'),
(151, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 16:25:05'),
(152, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-16 20:56:19'),
(153, 'Producto', 4, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:39:18'),
(154, 'Producto', 1, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:39:34'),
(155, 'Producto', 1, 'UPDATE', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:39:54'),
(156, 'Producto', 1, 'UPDATE', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:39:56'),
(157, 'Producto', 1, 'UPDATE', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:39:57'),
(158, 'Producto', 1, 'UPDATE', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:39:58'),
(159, 'Producto', 1, 'UPDATE', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:39:59'),
(160, 'Producto', 1, 'UPDATE', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:40:39'),
(161, 'Producto', 1, 'UPDATE', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:40:40'),
(162, 'Producto', 1, 'UPDATE', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:40:43'),
(163, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:43:01'),
(164, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:43:02'),
(165, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:43:07'),
(166, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:43:34'),
(167, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:43:59'),
(168, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:44:15'),
(169, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:44:17'),
(170, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:46:46'),
(171, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:46:50'),
(172, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:46:51'),
(173, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:46:52'),
(174, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:47:00'),
(175, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:47:05'),
(176, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:47:14'),
(177, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:47:17'),
(178, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:47:20'),
(179, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:47:25'),
(180, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:47:38'),
(181, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:48:18'),
(182, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-17 10:50:14'),
(183, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:55:27'),
(184, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:56:47'),
(185, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 10:57:24'),
(186, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 10:59:42'),
(187, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:01:47'),
(188, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:01:50'),
(189, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:01:56'),
(190, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:01:59'),
(191, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:02:01'),
(192, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:02:20'),
(193, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:02:55'),
(194, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:02:57'),
(195, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:02:58'),
(196, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:05:44'),
(197, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:05:46'),
(198, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-17 11:05:48'),
(199, 'Producto', 4, 'UPDATE', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:05:53'),
(200, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-17 11:05:55'),
(201, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:05:58'),
(202, 'Producto', 4, 'UPDATE', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:06:02'),
(203, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:06:25'),
(204, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '2026-03-17 11:07:10'),
(205, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:13:34'),
(206, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:13:42'),
(207, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:15:38'),
(208, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:17:13'),
(209, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:17:50'),
(210, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:18:04'),
(211, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:18:09'),
(212, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:18:14'),
(213, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:19:52'),
(214, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:20:53'),
(215, 'Producto', 3, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 24.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 24.99}', '2026-03-17 11:20:58'),
(216, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:21:07'),
(217, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:22:01'),
(218, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:22:01'),
(219, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:55:33'),
(220, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:55:35'),
(221, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:55:37'),
(222, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 11:55:42'),
(223, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:59:42'),
(224, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 11:59:46'),
(225, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 12:01:48'),
(226, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 12:02:26'),
(227, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 12:02:32'),
(228, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 12:02:49'),
(229, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 12:02:54'),
(230, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 12:04:42'),
(231, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-17 12:04:55'),
(232, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-17 12:04:57'),
(233, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-18 10:59:16'),
(234, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '2026-03-18 10:59:24'),
(235, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '2026-03-18 11:02:41'),
(236, 'Producto', 2, 'UPDATE', '{\"stock\": 50, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 50, \"activo\": 0, \"precio\": 19.99}', '2026-03-18 17:31:43'),
(237, 'Producto', 1, 'UPDATE', '{\"stock\": 52, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 52, \"activo\": 0, \"precio\": 19.99}', '2026-03-24 12:06:36'),
(238, 'Producto', 4, 'UPDATE', '{\"stock\": 51, \"activo\": 1, \"precio\": 19.99}', '{\"stock\": 51, \"activo\": 0, \"precio\": 19.99}', '2026-03-24 12:06:48'),
(239, 'Categoria', 1, 'UPDATE', '{\"nombre\": \"Ropa\", \"descripcion\": \"Ropa de todo tipo\"}', '{\"nombre\": \"Ropa editada\", \"descripcion\": \"Ropa de todo tipo\"}', '2026-03-25 11:21:44'),
(240, 'Pedido', 2, 'UPDATE', '{\"total\": 0.00, \"estado\": \"pendiente\"}', '{\"total\": 0.00, \"estado\": \"pagado\"}', '2026-03-25 16:20:44'),
(241, 'Pedido', 2, 'UPDATE', '{\"total\": 0.00, \"estado\": \"pagado\"}', '{\"total\": 0.00, \"estado\": \"enviado\"}', '2026-03-25 16:20:53'),
(242, 'Pedido', 2, 'UPDATE', '{\"total\": 0.00, \"estado\": \"enviado\"}', '{\"total\": 0.00, \"estado\": \"entregado\"}', '2026-03-25 16:20:58'),
(243, 'Pedido', 3, 'UPDATE', '{\"total\": 0.00, \"estado\": \"pendiente\"}', '{\"total\": 0.00, \"estado\": \"cancelado\"}', '2026-03-25 16:28:35'),
(244, 'Categoria', 1, 'UPDATE', '{\"nombre\": \"Ropa editada\", \"descripcion\": \"Ropa de todo tipo\"}', '{\"nombre\": \"Ropa editada\", \"descripcion\": \"Ropa de todo tipo editado\"}', '2026-03-25 19:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `avatar_3d`
--

CREATE TABLE `avatar_3d` (
  `id_avatar` int NOT NULL,
  `id_usuario` int NOT NULL,
  `pecho` decimal(5,2) DEFAULT NULL,
  `cintura` decimal(5,2) DEFAULT NULL,
  `cadera` decimal(5,2) DEFAULT NULL,
  `estatura` decimal(5,2) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `talla` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `avatar_3d`
--

INSERT INTO `avatar_3d` (`id_avatar`, `id_usuario`, `pecho`, `cintura`, `cadera`, `estatura`, `peso`, `edad`, `talla`) VALUES
(2, 4, 1.00, 1.00, 1.00, 1.00, 1.00, 12, 'L');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int NOT NULL,
  `id_usuario` int NOT NULL,
  `total` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `id_usuario`, `total`) VALUES
(1, 4, 39.98),
(4, 6, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Ropa editada', 'Ropa de todo tipo editado'),
(2, 'Guayabera Editado', 'Ropa presidencial de Mexico');

--
-- Triggers `categoria`
--
DELIMITER $$
CREATE TRIGGER `trg_audit_categoria_update` AFTER UPDATE ON `categoria` FOR EACH ROW BEGIN
    INSERT INTO Auditoria(
        tabla_afectada,
        id_registro,
        operacion,
        datos_anteriores,
        datos_nuevos
    )
    VALUES(
        'Categoria',
        NEW.id_categoria,
        'UPDATE',
        JSON_OBJECT('nombre', OLD.nombre, 'descripcion', OLD.descripcion),
        JSON_OBJECT('nombre', NEW.nombre, 'descripcion', NEW.descripcion)
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_carrito`
--

CREATE TABLE `detalle_carrito` (
  `id_detalle_carrito` int NOT NULL,
  `id_carrito` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detalle_carrito`
--

INSERT INTO `detalle_carrito` (`id_detalle_carrito`, `id_carrito`, `id_producto`, `cantidad`, `precio_unitario`) VALUES
(2, 1, 1, 2, 19.99);

--
-- Triggers `detalle_carrito`
--
DELIMITER $$
CREATE TRIGGER `trg_carrito_total_delete` AFTER DELETE ON `detalle_carrito` FOR EACH ROW BEGIN
    UPDATE carrito
    SET total = (SELECT COALESCE(SUM(cantidad*precio_unitario),0)
                 FROM detalle_carrito
                 WHERE id_carrito = OLD.id_carrito)
    WHERE id_carrito = OLD.id_carrito;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_carrito_total_insert` AFTER INSERT ON `detalle_carrito` FOR EACH ROW BEGIN
    UPDATE carrito
    SET total = (SELECT COALESCE(SUM(cantidad*precio_unitario),0)
                 FROM detalle_carrito
                 WHERE id_carrito = NEW.id_carrito)
    WHERE id_carrito = NEW.id_carrito;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_carrito_total_update` AFTER UPDATE ON `detalle_carrito` FOR EACH ROW BEGIN
    UPDATE carrito
    SET total = (SELECT COALESCE(SUM(cantidad*precio_unitario),0)
                 FROM detalle_carrito
                 WHERE id_carrito = NEW.id_carrito)
    WHERE id_carrito = NEW.id_carrito;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle_pedido` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_en_el_momento` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `detalle_pedido`
--
DELIMITER $$
CREATE TRIGGER `trg_pedido_total_delete` AFTER DELETE ON `detalle_pedido` FOR EACH ROW BEGIN
    UPDATE Pedido
    SET total = (
        SELECT COALESCE(SUM(cantidad * precio_en_el_momento), 0)
        FROM Detalle_Pedido
        WHERE id_pedido = OLD.id_pedido
    )
    WHERE id_pedido = OLD.id_pedido;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_pedido_total_insert` AFTER INSERT ON `detalle_pedido` FOR EACH ROW BEGIN
    UPDATE Pedido
    SET total = (
        SELECT COALESCE(SUM(cantidad * precio_en_el_momento), 0)
        FROM Detalle_Pedido
        WHERE id_pedido = NEW.id_pedido
    )
    WHERE id_pedido = NEW.id_pedido;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_pedido_total_update` AFTER UPDATE ON `detalle_pedido` FOR EACH ROW BEGIN
    UPDATE Pedido
    SET total = (
        SELECT COALESCE(SUM(cantidad * precio_en_el_momento), 0)
        FROM Detalle_Pedido
        WHERE id_pedido = NEW.id_pedido
    )
    WHERE id_pedido = NEW.id_pedido;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL,
  `id_usuario` int NOT NULL,
  `calle` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_postal` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `id_usuario`, `calle`, `numero`, `ciudad`, `provincia`, `codigo_postal`, `pais`) VALUES
(1, 4, 'Calle 1', '1', 'Logroño', 'La Rioja', '26003', 'España');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorito`
--

CREATE TABLE `favorito` (
  `id_usuario` int NOT NULL,
  `id_producto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorito`
--

INSERT INTO `favorito` (`id_usuario`, `id_producto`) VALUES
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `historial_estado_pedido`
--

CREATE TABLE `historial_estado_pedido` (
  `id_historial` int NOT NULL,
  `id_pedido` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comentario` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `historial_estado_pedido`
--

INSERT INTO `historial_estado_pedido` (`id_historial`, `id_pedido`, `estado`, `comentario`, `fecha`) VALUES
(1, 1, 'pagado', NULL, '2026-03-04 16:07:28'),
(2, 1, 'enviado', NULL, '2026-03-04 16:07:35'),
(3, 1, 'cancelado', 'Muy mal servicio, paquete llegó tarde', '2026-03-04 16:07:47'),
(4, 2, 'pagado', NULL, '2026-03-25 16:20:44'),
(5, 2, 'enviado', NULL, '2026-03-25 16:20:53'),
(6, 2, 'entregado', NULL, '2026-03-25 16:20:58'),
(7, 3, 'cancelado', NULL, '2026-03-25 16:28:35');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int NOT NULL,
  `id_usuario` int NOT NULL,
  `tipo` enum('paypal','tarjeta','bizum','google_pay') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_enmascarado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `es_predeterminado` tinyint(1) DEFAULT '0',
  `fecha_expiracion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodo_pago`, `id_usuario`, `tipo`, `numero_enmascarado`, `es_predeterminado`, `fecha_expiracion`) VALUES
(1, 4, 'paypal', '2', 0, '2036-03-01'),
(3, 4, 'paypal', '1234', 0, '2027-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_23_130126_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_metodo_pago` int DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_direccion` int NOT NULL,
  `gastos_envio` decimal(10,2) DEFAULT '0.00',
  `codigo_seguimiento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` enum('pendiente','pagado','enviado','entregado','cancelado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_usuario`, `id_metodo_pago`, `fecha`, `id_direccion`, `gastos_envio`, `codigo_seguimiento`, `total`, `estado`) VALUES
(1, 4, 1, '2026-03-04 16:06:56', 1, 5.99, 'ABC123', 0.00, 'cancelado'),
(2, 3, 1, '2026-03-25 16:20:30', 1, 5.99, 'ABC456', 0.00, 'entregado'),
(3, 3, 1, '2026-03-25 16:21:11', 1, 5.99, 'ABC456', 0.00, 'cancelado'),
(4, 3, 1, '2026-03-25 16:28:40', 1, 5.99, 'ABC456', 0.00, 'pendiente');

--
-- Triggers `pedido`
--
DELIMITER $$
CREATE TRIGGER `trg_audit_pedido_update` AFTER UPDATE ON `pedido` FOR EACH ROW BEGIN
    INSERT INTO auditoria(tabla_afectada,id_registro,operacion,datos_anteriores,datos_nuevos)
    VALUES(
        'Pedido',
        NEW.id_pedido,
        'UPDATE',
        JSON_OBJECT('estado',OLD.estado,'total',OLD.total),
        JSON_OBJECT('estado',NEW.estado,'total',NEW.total)
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_historial_estado` AFTER UPDATE ON `pedido` FOR EACH ROW BEGIN
    IF OLD.estado <> NEW.estado THEN
        INSERT INTO historial_estado_pedido(id_pedido, estado, fecha)
        VALUES (NEW.id_pedido, NEW.estado, NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'token_registro', '396d74d9c2b13957bc0dd36cb477046c2dfdfc3a1e99f000d3db1520f3a4426c', '[\"*\"]', NULL, NULL, '2026-02-28 14:45:18', '2026-02-28 14:45:18'),
(2, 'App\\Models\\User', 3, 'token_login', '2bd1d2187d3212a8185be762f3fb7088fa2dfabc8102b1634b2f28c7f2104725', '[\"*\"]', NULL, NULL, '2026-02-28 14:45:53', '2026-02-28 14:45:53'),
(3, 'App\\Models\\User', 3, 'token_login', '4e5cc85d3965f9efcf33e8881d59a40bb8d4a819ef6862fe2dad36a78b864f05', '[\"*\"]', '2026-03-01 11:55:13', NULL, '2026-03-01 11:54:28', '2026-03-01 11:55:13'),
(4, 'App\\Models\\User', 3, 'token_login', 'ae4238299d5f69d3433168715e9eafffb55122c9ee19916b9db4b925feacc739', '[\"*\"]', '2026-03-01 12:11:33', NULL, '2026-03-01 12:10:30', '2026-03-01 12:11:33'),
(5, 'App\\Models\\User', 3, 'token_login', '80371cecb5df5c127743b96135e1fa553d082763bfc68e701a1cb9f1405e4b2a', '[\"*\"]', '2026-03-02 19:57:02', NULL, '2026-03-01 12:12:46', '2026-03-02 19:57:02'),
(6, 'App\\Models\\User', 4, 'token_registro', '35bfbbb2335b7e8439ff3dcfaea9f1e418b9236be4159976f3cb73124e525ab7', '[\"*\"]', NULL, NULL, '2026-03-04 13:26:07', '2026-03-04 13:26:07'),
(8, 'App\\Models\\User', 4, 'token_login', '76723c5c97575b6b09a4d3b2cf14121335ae2a93eb21fcb65d3c197d3002e050', '[\"*\"]', NULL, NULL, '2026-03-04 13:27:48', '2026-03-04 13:27:48'),
(9, 'App\\Models\\User', 4, 'token_login', '3ae8b14233e65f2b6d1df7e64343abbcd88dc441790c13da4288dcdb0f1d8049', '[\"*\"]', '2026-03-04 13:29:06', NULL, '2026-03-04 13:28:24', '2026-03-04 13:29:06'),
(10, 'App\\Models\\User', 3, 'token_login', 'ef8cdf410ac9a439e39b4863bc63ded8f1c8230df561a3bf0e33b53497bea2ba', '[\"*\"]', '2026-03-04 13:36:14', NULL, '2026-03-04 13:29:27', '2026-03-04 13:36:14'),
(11, 'App\\Models\\User', 3, 'token_login', '10a8dd59081ec51c234b6656168f12e024f52c63c3c3f0dd4f64f9935153f8b1', '[\"*\"]', '2026-03-05 11:28:07', NULL, '2026-03-04 13:37:25', '2026-03-05 11:28:07'),
(12, 'App\\Models\\User', 4, 'token_login', 'c75977a9ab04a755cc21f56c5ed99d9df39fbfdbbe48a9c994e017f893154a24', '[\"*\"]', '2026-03-05 12:18:49', NULL, '2026-03-04 13:45:32', '2026-03-05 12:18:49'),
(13, 'App\\Models\\User', 5, 'token_registro', '47974a93ffc4c5f2cc33e6ea8209e6c22a7e52770111f07c46105b0462b80512', '[\"*\"]', NULL, NULL, '2026-03-04 13:49:56', '2026-03-04 13:49:56'),
(14, 'App\\Models\\User', 6, 'token_registro', '07dca2dad498ee85d5edec79be55c3d8f4896aa961c2a50355ef5abfce80b692', '[\"*\"]', NULL, NULL, '2026-03-04 14:23:07', '2026-03-04 14:23:07'),
(15, 'App\\Models\\User', 7, 'token_registro', '14f89d6545bd018fb95505034e6759f192dd478a1955dbbd09ef185ab5b09336', '[\"*\"]', NULL, NULL, '2026-03-05 12:19:56', '2026-03-05 12:19:56'),
(16, 'App\\Models\\User', 7, 'token_login', '9b9165d31b83651707c9964eda061e3144cdd85e9eef0cd852a441467b3fb22e', '[\"*\"]', '2026-03-05 12:23:41', NULL, '2026-03-05 12:20:11', '2026-03-05 12:23:41'),
(17, 'App\\Models\\User', 3, 'token_login', 'f0203e94f9d5f1c32e64736dbcc0a32e6abb116c467151e92d1a8cea9aaa4a24', '[\"*\"]', '2026-03-25 17:52:29', NULL, '2026-03-11 10:52:11', '2026-03-25 17:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_categoria` int DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexo` enum('hombre','mujer','unisex') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `talla` enum('XS','S','M','L','XL','XXL') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `eliminado_en` datetime DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '0',
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `id_categoria`, `color`, `sexo`, `talla`, `activo`, `eliminado_en`, `precio`, `stock`, `imagen`) VALUES
(1, 'Camisetas', 'Camiseta de algodón chula', 1, NULL, NULL, NULL, 0, '2026-03-24 12:06:36', 19.99, 52, 'camiseta.jpg'),
(2, 'Camiseta', 'Camiseta de algodón chula', 1, NULL, NULL, NULL, 0, '2026-03-18 17:31:43', 19.99, 50, 'camiseta.jpg'),
(3, 'Camisetas', 'Camiseta de algodón', 1, NULL, NULL, NULL, 0, '2026-03-17 11:20:58', 24.99, 50, 'camiseta.jpg'),
(4, 'Camisetas', 'Camiseta de algodón', 1, NULL, NULL, NULL, 0, '2026-03-24 12:06:48', 19.99, 51, 'camiseta.jpg'),
(5, 'pantalon', 'pantalon corto', 2, NULL, NULL, NULL, 1, NULL, 12.00, 12, 'hola.jpg'),
(6, 'Doraemon', 'Gato cosmico', 2, NULL, NULL, NULL, 1, NULL, 10000.00, 1, 'doraemon.png');

--
-- Triggers `producto`
--
DELIMITER $$
CREATE TRIGGER `trg_audit_producto_update` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN
    INSERT INTO auditoria(tabla_afectada,id_registro,operacion,datos_anteriores,datos_nuevos)
    VALUES(
        'Producto',
        NEW.id_producto,
        'UPDATE',
        JSON_OBJECT('precio',OLD.precio,'stock',OLD.stock,'activo',OLD.activo),
        JSON_OBJECT('precio',NEW.precio,'stock',NEW.stock,'activo',NEW.activo)
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_producto_eliminado_en` BEFORE UPDATE ON `producto` FOR EACH ROW BEGIN
    -- Si se desactiva el producto, ponemos la fecha
    IF OLD.activo = TRUE AND NEW.activo = FALSE THEN
        SET NEW.eliminado_en = NOW();
    -- Si se reactiva el producto, borramos la fecha
    ELSEIF OLD.activo = FALSE AND NEW.activo = TRUE THEN
        SET NEW.eliminado_en = NULL;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fXSRBOcHjiaXfJleOI4EsItZuDWXcQQgJgWnTCmW', NULL, '127.0.0.1', 'PostmanRuntime/7.51.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXFiVDh1QTRucjJpSkxkRmplU21mNXFRRDFESk1QRTJRQk9IOVdCOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773229880);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `contrasena`, `rol`, `telefono`, `fecha_nacimiento`, `fecha_registro`) VALUES
(3, 'Nacho Editado', 'nacho@gmail.com', '$2y$12$jBEf22KxxgscSbsUhlj7eu7AtudgUsIBVGD07hr3BpLaL4bMHvT6G', 'admin', '611111111', '2005-03-21', '2026-02-28 16:45:18'),
(4, 'Ivan', 'ivan@gmail.com', '$2y$12$GWF9PUhMxXoJiGBYRomr7ucZDdztKuPCbgaIVcGh3bHeqjXTya2Ay', 'cliente', '123456789', '2005-09-11', '2026-03-04 15:26:07'),
(6, 'Nadia', 'nadia@gmail.com', '$2y$12$6EZVzswDZQcIdXIAnO9QGu7/3oLq1HEnMQdLS/aQGf4i684eYFfmW', 'cliente', '600000000', '2000-01-01', '2026-03-04 16:23:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id_auditoria`),
  ADD KEY `idx_auditoria_tabla_fecha` (`tabla_afectada`,`fecha`);

--
-- Indexes for table `avatar_3d`
--
ALTER TABLE `avatar_3d`
  ADD PRIMARY KEY (`id_avatar`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`),
  ADD UNIQUE KEY `id_usuario_2` (`id_usuario`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD PRIMARY KEY (`id_detalle_carrito`),
  ADD KEY `id_carrito` (`id_carrito`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle_pedido`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorito`
--
ALTER TABLE `favorito`
  ADD PRIMARY KEY (`id_usuario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `historial_estado_pedido`
--
ALTER TABLE `historial_estado_pedido`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodo_pago`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `idx_producto_activo_eliminado` (`activo`,`eliminado_en`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id_auditoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `avatar_3d`
--
ALTER TABLE `avatar_3d`
  MODIFY `id_avatar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  MODIFY `id_detalle_carrito` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historial_estado_pedido`
--
ALTER TABLE `historial_estado_pedido`
  MODIFY `id_historial` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodo_pago` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avatar_3d`
--
ALTER TABLE `avatar_3d`
  ADD CONSTRAINT `avatar_3d_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD CONSTRAINT `detalle_carrito_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Constraints for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Constraints for table `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `favorito`
--
ALTER TABLE `favorito`
  ADD CONSTRAINT `favorito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE;

--
-- Constraints for table `historial_estado_pedido`
--
ALTER TABLE `historial_estado_pedido`
  ADD CONSTRAINT `historial_estado_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE;

--
-- Constraints for table `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD CONSTRAINT `metodo_pago_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`);

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE SET NULL;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `borrar_productos_inactivos` ON SCHEDULE EVERY 1 DAY STARTS '2026-02-27 14:23:59' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DELETE FROM producto
    WHERE activo = 0
    AND eliminado_en IS NOT NULL
    AND eliminado_en < NOW() - INTERVAL 3 YEAR;
END$$

CREATE DEFINER=`root`@`localhost` EVENT `limpiar_auditoria` ON SCHEDULE EVERY 1 DAY STARTS '2026-02-27 14:40:20' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM Auditoria
  WHERE fecha < NOW() - INTERVAL 1 YEAR$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
