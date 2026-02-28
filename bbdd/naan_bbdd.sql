-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 28, 2026 at 01:15 PM
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
  `id_detalle` int NOT NULL,
  `id_carrito` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Triggers `metodo_pago`
--
DELIMITER $$
CREATE TRIGGER `trg_metodo_predeterminado_insert` BEFORE INSERT ON `metodo_pago` FOR EACH ROW BEGIN
    IF NEW.es_predeterminado = TRUE THEN
        UPDATE metodo_pago
        SET es_predeterminado = FALSE
        WHERE id_usuario = NEW.id_usuario;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_metodo_predeterminado_update` BEFORE UPDATE ON `metodo_pago` FOR EACH ROW BEGIN
    IF NEW.es_predeterminado = TRUE THEN
        UPDATE metodo_pago
        SET es_predeterminado = FALSE
        WHERE id_usuario = NEW.id_usuario AND id_metodo_pago <> NEW.id_metodo_pago;
    END IF;
END
$$
DELIMITER ;

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

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_categoria` int DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `eliminado_en` datetime DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '0',
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  ADD PRIMARY KEY (`id_detalle`),
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
  MODIFY `id_auditoria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `avatar_3d`
--
ALTER TABLE `avatar_3d`
  MODIFY `id_avatar` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  MODIFY `id_detalle` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle_pedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historial_estado_pedido`
--
ALTER TABLE `historial_estado_pedido`
  MODIFY `id_historial` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodo_pago` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT;

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
