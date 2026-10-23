-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: parcial1
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria_acceso`
--

DROP TABLE IF EXISTS `auditoria_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_acceso` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `codigo_evento` varchar(36) NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `resultado` enum('exitoso','fallido','bloqueado') NOT NULL,
  `es_sospechoso` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_auditoria`),
  UNIQUE KEY `uq_auditoria_codigo` (`codigo_evento`),
  KEY `fk_auditoria_usuario` (`id_usuario`),
  CONSTRAINT `fk_auditoria_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL,
  CONSTRAINT `ck_auditoria_ip` CHECK (((`ip` is null) or (char_length(`ip`) >= 7)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_acceso`
--

LOCK TABLES `auditoria_acceso` WRITE;
/*!40000 ALTER TABLE `auditoria_acceso` DISABLE KEYS */;
INSERT INTO `auditoria_acceso` VALUES (1,'422ef3ed-cde6-11f1-82a4-92e22baf26d5',1,'2026-10-22 07:30:00','190.34.12.45','Mozilla/5.0 (Windows NT 10.0) Chrome/126.0','exitoso',0),(2,'422efbaf-cde6-11f1-82a4-92e22baf26d5',1,'2026-10-21 18:05:00','190.34.12.46','Mozilla/5.0 (iPhone; CPU iPhone OS 17) Safari','exitoso',0),(3,'422efd47-cde6-11f1-82a4-92e22baf26d5',2,'2026-10-22 08:45:00','200.46.88.17','Mozilla/5.0 (Windows NT 10.0) Firefox/127.0','exitoso',0),(4,'422efe0a-cde6-11f1-82a4-92e22baf26d5',10,'2026-10-19 22:14:00','45.77.120.8','curl/8.4.0','fallido',1),(5,'422efe80-cde6-11f1-82a4-92e22baf26d5',10,'2026-10-19 22:15:00','45.77.120.8','curl/8.4.0','fallido',1),(6,'422efeec-cde6-11f1-82a4-92e22baf26d5',10,'2026-10-19 22:16:00','45.77.120.8','curl/8.4.0','bloqueado',1),(7,'422eff50-cde6-11f1-82a4-92e22baf26d5',NULL,'2026-10-20 03:02:00','185.220.101.4','python-requests/2.31','fallido',1),(8,'422effb8-cde6-11f1-82a4-92e22baf26d5',5,'2026-10-05 11:20:00','190.34.9.60','Mozilla/5.0 (Windows NT 10.0) Chrome/126.0','fallido',0),(9,'422f0022-cde6-11f1-82a4-92e22baf26d5',9,'2026-10-22 08:00:00','10.0.0.15','Mozilla/5.0 (X11; Linux x86_64) Chrome/126.0','exitoso',0),(10,'422f0088-cde6-11f1-82a4-92e22baf26d5',6,'2026-10-22 06:50:00','201.218.5.120','Mozilla/5.0 (Linux; Android 14) Chrome/126.0','exitoso',0);
/*!40000 ALTER TABLE `auditoria_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_servicio`
--

DROP TABLE IF EXISTS `categoria_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_servicio` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `segmento` enum('personal','empresarial','ambos') NOT NULL DEFAULT 'ambos',
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `uq_categoria_nombre` (`nombre`),
  CONSTRAINT `ck_categoria_nombre` CHECK ((char_length(`nombre`) >= 3))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_servicio`
--

LOCK TABLES `categoria_servicio` WRITE;
/*!40000 ALTER TABLE `categoria_servicio` DISABLE KEYS */;
INSERT INTO `categoria_servicio` VALUES (1,'Hosting','ambos',1),(2,'Correo corporativo','empresarial',1),(3,'Respaldo en la nube','ambos',1),(4,'Seguridad administrada','empresarial',1),(5,'Gestion de dominios','ambos',1),(6,'Soporte tecnico','empresarial',1),(7,'Almacenamiento','personal',1),(8,'Redes y VPN','empresarial',1),(9,'Analitica','empresarial',1),(10,'Capacitacion','ambos',1);
/*!40000 ALTER TABLE `categoria_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratacion`
--

DROP TABLE IF EXISTS `contratacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratacion` (
  `id_contratacion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_servicio` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` enum('activa','pausada','cancelada','vencida') NOT NULL DEFAULT 'activa',
  `renovacion_automatica` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contratacion`),
  UNIQUE KEY `uq_contratacion` (`id_usuario`,`id_servicio`,`fecha_inicio`),
  KEY `fk_contratacion_servicio` (`id_servicio`),
  CONSTRAINT `fk_contratacion_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`),
  CONSTRAINT `fk_contratacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `ck_contratacion_fechas` CHECK (((`fecha_fin` is null) or (`fecha_fin` >= `fecha_inicio`)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratacion`
--

LOCK TABLES `contratacion` WRITE;
/*!40000 ALTER TABLE `contratacion` DISABLE KEYS */;
INSERT INTO `contratacion` VALUES (1,1,1,'2026-01-05',NULL,'activa',1),(2,1,3,'2026-02-10',NULL,'activa',1),(3,2,2,'2026-01-15',NULL,'activa',0),(4,3,4,'2026-03-01',NULL,'activa',1),(5,4,1,'2026-02-20','2026-08-20','cancelada',0),(6,5,6,'2026-04-12',NULL,'pausada',0),(7,6,7,'2026-05-03',NULL,'activa',1),(8,7,8,'2026-03-18',NULL,'activa',0),(9,8,9,'2026-06-01','2026-09-01','vencida',0),(10,2,10,'2026-07-07',NULL,'activa',1);
/*!40000 ALTER TABLE `contratacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credencial`
--

DROP TABLE IF EXISTS `credencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credencial` (
  `id_credencial` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `algoritmo` enum('bcrypt','argon2','scrypt') NOT NULL DEFAULT 'bcrypt',
  `mfa_habilitado` tinyint(1) NOT NULL DEFAULT '0',
  `intentos_fallidos` int NOT NULL DEFAULT '0',
  `ultimo_cambio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_credencial`),
  UNIQUE KEY `uq_credencial_usuario` (`id_usuario`),
  CONSTRAINT `fk_credencial_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `ck_credencial_intentos` CHECK ((`intentos_fallidos` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credencial`
--

LOCK TABLES `credencial` WRITE;
/*!40000 ALTER TABLE `credencial` DISABLE KEYS */;
INSERT INTO `credencial` VALUES (1,1,'$2b$12$96a693ee08c9fe1f5e660fc2f606534b8d3d4b22cb788d5a98e84','bcrypt',0,0,'2026-01-03 09:15:00'),(2,2,'$2b$12$bcb68a6da069b118fe57c63fda7288b8241f6a51467fd14f51d5f','bcrypt',0,0,'2026-01-10 14:35:00'),(3,3,'$2b$12$d86c6542fcee60380de2ddd10bbe1babcc8b8ff552743cef699c5','bcrypt',1,0,'2026-03-02 10:00:00'),(4,4,'$2b$12$df2db31cfc564b9ad5de72eb5c69ba6e217b8aec852b030b27ed1','bcrypt',0,0,'2026-02-18 16:50:00'),(5,5,'$2b$12$0382a339972d9821cbe5bacac2cf1acd1efe4f112744b1d7ea8d4','bcrypt',0,3,'2026-04-08 11:25:00'),(6,6,'$2b$12$a7f91f62322bd5898449115477beb44dc9d38264a910e70d8704d','bcrypt',0,0,'2026-04-30 09:00:00'),(7,7,'$2b$12$e9c3795c763ebda70c9adc26dc1409f3faaa6f1aa6ed7efe440b6','bcrypt',1,0,'2026-06-15 12:00:00'),(8,8,'$2b$12$00e960bcf6df86d490860b6751bf278b4fccc964d3ad26ddec17c','bcrypt',0,0,'2026-05-28 17:45:00'),(9,9,'$argon2id$v=19$m=65536,t=3,p=4$6dbd3fc7491f560486a5de$c7b332162c638c9a314069748c2a42a4f60c1ffd3c','argon2',1,0,'2026-09-01 08:30:00'),(10,10,'$scrypt$ln=15,r=8,p=1$aea4955176ca330e90be91$34eb9527409f363e83183ec861fdc32c77c4ee3a18','scrypt',0,5,'2026-01-20 09:35:00');
/*!40000 ALTER TABLE `credencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id_metodo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo` enum('tarjeta','transferencia','billetera','efectivo') NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_metodo`),
  UNIQUE KEY `uq_metodo_nombre` (`nombre`),
  CONSTRAINT `ck_metodo_nombre` CHECK ((char_length(`nombre`) >= 3))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,'Visa','tarjeta',1),(2,'Mastercard','tarjeta',1),(3,'American Express','tarjeta',1),(4,'Transferencia ACH','transferencia',1),(5,'Transferencia internacional','transferencia',1),(6,'Yappy','billetera',1),(7,'PayPal','billetera',1),(8,'Apple Pay','billetera',1),(9,'Efectivo en oficina','efectivo',1),(10,'Pago en ventanilla','efectivo',0);
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_contratacion` int NOT NULL,
  `id_metodo` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','completado','fallido','reembolsado') NOT NULL DEFAULT 'pendiente',
  `referencia` varchar(60) NOT NULL,
  `conciliado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `uq_pago_referencia` (`referencia`),
  KEY `fk_pago_contratacion` (`id_contratacion`),
  KEY `fk_pago_metodo` (`id_metodo`),
  CONSTRAINT `fk_pago_contratacion` FOREIGN KEY (`id_contratacion`) REFERENCES `contratacion` (`id_contratacion`),
  CONSTRAINT `fk_pago_metodo` FOREIGN KEY (`id_metodo`) REFERENCES `metodo_pago` (`id_metodo`),
  CONSTRAINT `ck_pago_monto` CHECK ((`monto` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,1,9.99,'2026-01-05 09:30:00','completado','PAG-2026-0001',1),(2,2,6,14.90,'2026-02-10 14:20:00','completado','PAG-2026-0002',1),(3,3,4,5.50,'2026-01-15 11:00:00','completado','PAG-2026-0003',1),(4,4,2,49.00,'2026-03-01 08:45:00','completado','PAG-2026-0004',1),(5,5,7,9.99,'2026-02-20 17:05:00','reembolsado','PAG-2026-0005',1),(6,6,5,79.00,'2026-04-12 10:00:00','pendiente','PAG-2026-0006',0),(7,7,9,12.00,'2026-05-03 15:30:00','completado','PAG-2026-0007',1),(8,8,3,25.00,'2026-03-18 19:10:00','fallido','PAG-2026-0008',0),(9,9,8,19.99,'2026-06-01 07:55:00','completado','PAG-2026-0009',1),(10,10,1,35.00,'2026-07-07 12:40:00','completado','PAG-2026-0010',0);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `nivel` enum('basico','intermedio','total') NOT NULL DEFAULT 'basico',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `uq_rol_nombre` (`nombre`),
  CONSTRAINT `ck_rol_nombre` CHECK ((char_length(`nombre`) >= 3))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'cliente','Usuario final que contrata servicios','basico',1),(2,'administrador','Gestiona usuarios y configuracion del sistema','total',1),(3,'vendedor','Gestiona cotizaciones y contrataciones','intermedio',1),(4,'ejecutivo','Consulta reportes gerenciales','intermedio',1),(5,'soporte','Atiende incidencias de los clientes','intermedio',1),(6,'auditor','Revisa accesos y registros de seguridad','intermedio',1),(7,'contador','Revisa pagos y conciliaciones','intermedio',1),(8,'supervisor','Supervisa al equipo de ventas y soporte','intermedio',1),(9,'desarrollador','Acceso tecnico a ambientes de prueba','total',1),(10,'invitado','Acceso temporal de solo lectura','basico',0);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio_mensual` decimal(10,2) NOT NULL,
  `modalidad` enum('basico','premium','empresarial') NOT NULL DEFAULT 'basico',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `uq_servicio_nombre` (`nombre`),
  KEY `fk_servicio_categoria` (`id_categoria`),
  CONSTRAINT `fk_servicio_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_servicio` (`id_categoria`),
  CONSTRAINT `ck_servicio_precio` CHECK ((`precio_mensual` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Hosting Web Basico','Alojamiento web con 10 GB y certificado SSL',9.99,'basico',1,1),(2,'Correo Corporativo','Casillas de correo con dominio propio',5.50,'basico',1,2),(3,'Respaldo Automatico en la Nube','Copias de seguridad diarias con retencion de 30 dias',14.90,'premium',1,3),(4,'Firewall Administrado','Monitoreo y reglas de firewall gestionadas',49.00,'empresarial',1,4),(5,'Gestion de Dominios','Registro y renovacion de dominios',3.50,'basico',1,5),(6,'Soporte Tecnico 24/7','Atencion de incidencias todo el dia',79.00,'empresarial',1,6),(7,'Almacenamiento Seguro 1TB','Almacenamiento cifrado de 1 TB',12.00,'basico',1,7),(8,'VPN Empresarial','Acceso remoto seguro para equipos de trabajo',25.00,'premium',1,8),(9,'Panel de Analitica Web','Reportes de trafico y comportamiento de usuarios',19.99,'premium',1,9),(10,'Capacitacion en Ciberseguridad','Talleres de concientizacion para empleados',35.00,'premium',1,10);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesion` (
  `id_sesion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `token_hash` varchar(255) NOT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `dispositivo` enum('web','movil','escritorio','otro') NOT NULL DEFAULT 'web',
  `ip` varchar(45) DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_expiracion` datetime NOT NULL,
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_sesion`),
  UNIQUE KEY `uq_sesion_token` (`token_hash`),
  KEY `fk_sesion_usuario` (`id_usuario`),
  CONSTRAINT `fk_sesion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `ck_sesion_fechas` CHECK ((`fecha_expiracion` > `fecha_inicio`))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (1,1,'2c95f62ab2518d93754237ef55b54e0579431b0b1cb86988e1fc293ed2dc7758','Mozilla/5.0 (Windows NT 10.0) Chrome/126.0','web','190.34.12.45','2026-10-22 07:30:00','2026-10-23 07:30:00',1),(2,1,'360be4c4892f8c5d7c7899ca13639ff6ef394db542865e07c71d2008be04f368','Mozilla/5.0 (iPhone; CPU iPhone OS 17) Safari','movil','190.34.12.46','2026-10-21 18:05:00','2026-10-22 18:05:00',1),(3,2,'f735c553854e6285e5b304915f3c58de9b54d99371a40e2b1a904623cb9155a9','Mozilla/5.0 (Windows NT 10.0) Firefox/127.0','web','200.46.88.17','2026-10-22 08:45:00','2026-10-23 08:45:00',1),(4,3,'d4832c7d1c2b1cf9fb21d1173a24c7bc0257c071702bafc23fd8f62de59b78c7','PixelSecurityDesktop/2.3 (Windows)','escritorio','181.197.20.9','2026-10-18 09:00:00','2026-10-19 09:00:00',0),(5,4,'84dd3e2b55aa9c50b9d0e9416fd904d7665e9836d145db3cf7b2669584874b27','Mozilla/5.0 (Windows NT 10.0) Edg/126.0','web','186.74.101.33','2026-09-15 14:20:00','2026-09-16 14:20:00',0),(6,6,'ae06d95843b44cbf9f84cf33b5320dfb43b9600b45f2c5d21a5fd76f73a96ceb','Mozilla/5.0 (Linux; Android 14) Chrome/126.0','movil','201.218.5.120','2026-10-22 06:50:00','2026-10-23 06:50:00',1),(7,7,'92f4e8d4a351dbfedd21c70d69d58406b1ec35b8191ff986513bab558eb26b05','Mozilla/5.0 (Macintosh; Intel Mac OS X) Chrome/126','web','190.34.77.8','2026-10-21 21:15:00','2026-10-22 21:15:00',1),(8,8,'a17f9a3d60f8facba4b1da04e7d4ae67dc4f324ac9a8f3aff836d15291488b6d','PixelSecurityAPI-Client/1.0','otro','200.46.12.99','2026-10-10 10:00:00','2026-10-10 11:00:00',0),(9,9,'943f8b97c15957b9af8acf7fd4f0789b61ddf76c6abd5185ed0a02f993629a5c','Mozilla/5.0 (X11; Linux x86_64) Chrome/126.0','web','10.0.0.15','2026-10-22 08:00:00','2026-10-22 16:00:00',1),(10,9,'6d5a204dab80bfe926c843e8cb317947036bcf7133b7f45f5288084c08a5a219','PixelSecurityDesktop/2.3 (Linux)','escritorio','10.0.0.16','2026-10-20 13:30:00','2026-10-20 21:30:00',0);
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `email` varchar(120) NOT NULL,
  `estado` enum('activo','inactivo','suspendido','bloqueado') NOT NULL DEFAULT 'activo',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `uq_usuario_email` (`email`),
  KEY `fk_usuario_rol` (`id_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `ck_usuario_email` CHECK ((`email` like _latin1'%@%'))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Ana','Rodriguez','ana.rodriguez@correo.com','activo',1,'2026-01-03 09:12:00',1),(2,'Luis','Perez','luis.perez@correo.com','activo',1,'2026-01-10 14:30:00',1),(3,'Marta','Castillo','marta.castillo@correo.com','activo',1,'2026-02-25 10:05:00',1),(4,'Andres','Mendoza','andres.mendoza@correo.com','inactivo',0,'2026-02-18 16:45:00',1),(5,'Sofia','Vargas','sofia.vargas@correo.com','suspendido',0,'2026-04-08 11:20:00',1),(6,'Jorge','Batista','jorge.batista@correo.com','activo',1,'2026-04-30 08:55:00',1),(7,'Daniela','Ortega','daniela.ortega@correo.com','activo',1,'2026-03-12 13:10:00',1),(8,'Ricardo','Samaniego','ricardo.samaniego@correo.com','activo',1,'2026-05-28 17:40:00',1),(9,'Valeria','Nunez','valeria.nunez@pixelcorp.com','activo',1,'2025-12-01 08:00:00',2),(10,'Miguel','Herrera','miguel.herrera@pixelcorp.com','bloqueado',0,'2026-01-20 09:30:00',3),(11,'Camila','Arosemena','camila.arosemena@pixelcorp.com','inactivo',0,'2026-10-22 07:36:45',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_auditoria_accesos`
--

DROP TABLE IF EXISTS `v_auditoria_accesos`;
/*!50001 DROP VIEW IF EXISTS `v_auditoria_accesos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_auditoria_accesos` AS SELECT 
 1 AS `id_auditoria`,
 1 AS `fecha_hora`,
 1 AS `usuario`,
 1 AS `estado_usuario`,
 1 AS `ip`,
 1 AS `user_agent`,
 1 AS `resultado`,
 1 AS `es_sospechoso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_negocio_contrataciones`
--

DROP TABLE IF EXISTS `v_negocio_contrataciones`;
/*!50001 DROP VIEW IF EXISTS `v_negocio_contrataciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_negocio_contrataciones` AS SELECT 
 1 AS `id_contratacion`,
 1 AS `cliente`,
 1 AS `email`,
 1 AS `categoria`,
 1 AS `servicio`,
 1 AS `precio_mensual`,
 1 AS `fecha_inicio`,
 1 AS `estado_contratacion`,
 1 AS `total_pagos`,
 1 AS `total_pagado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_seguridad_usuarios`
--

DROP TABLE IF EXISTS `v_seguridad_usuarios`;
/*!50001 DROP VIEW IF EXISTS `v_seguridad_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_seguridad_usuarios` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `email`,
 1 AS `rol`,
 1 AS `estado`,
 1 AS `activo`,
 1 AS `mfa_habilitado`,
 1 AS `intentos_fallidos`,
 1 AS `ultimo_cambio`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_auditoria_accesos`
--

/*!50001 DROP VIEW IF EXISTS `v_auditoria_accesos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Dashy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_auditoria_accesos` AS select `a`.`id_auditoria` AS `id_auditoria`,`a`.`fecha_hora` AS `fecha_hora`,coalesce(concat(`u`.`nombre`,' ',`u`.`apellido`),'Usuario desconocido') AS `usuario`,`u`.`estado` AS `estado_usuario`,`a`.`ip` AS `ip`,`a`.`user_agent` AS `user_agent`,`a`.`resultado` AS `resultado`,`a`.`es_sospechoso` AS `es_sospechoso` from (`auditoria_acceso` `a` left join `usuario` `u` on((`u`.`id_usuario` = `a`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_negocio_contrataciones`
--

/*!50001 DROP VIEW IF EXISTS `v_negocio_contrataciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Dashy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_negocio_contrataciones` AS select `c`.`id_contratacion` AS `id_contratacion`,concat(`u`.`nombre`,' ',`u`.`apellido`) AS `cliente`,`u`.`email` AS `email`,`cs`.`nombre` AS `categoria`,`s`.`nombre` AS `servicio`,`s`.`precio_mensual` AS `precio_mensual`,`c`.`fecha_inicio` AS `fecha_inicio`,`c`.`estado` AS `estado_contratacion`,count(`p`.`id_pago`) AS `total_pagos`,coalesce(sum((case when (`p`.`estado` = 'completado') then `p`.`monto` end)),0) AS `total_pagado` from ((((`contratacion` `c` join `usuario` `u` on((`u`.`id_usuario` = `c`.`id_usuario`))) join `servicio` `s` on((`s`.`id_servicio` = `c`.`id_servicio`))) join `categoria_servicio` `cs` on((`cs`.`id_categoria` = `s`.`id_categoria`))) left join `pago` `p` on((`p`.`id_contratacion` = `c`.`id_contratacion`))) group by `c`.`id_contratacion`,`u`.`nombre`,`u`.`apellido`,`u`.`email`,`cs`.`nombre`,`s`.`nombre`,`s`.`precio_mensual`,`c`.`fecha_inicio`,`c`.`estado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_seguridad_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `v_seguridad_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Dashy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_seguridad_usuarios` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`nombre` AS `nombre`,`u`.`apellido` AS `apellido`,`u`.`email` AS `email`,`r`.`nombre` AS `rol`,`u`.`estado` AS `estado`,`u`.`activo` AS `activo`,`cr`.`mfa_habilitado` AS `mfa_habilitado`,`cr`.`intentos_fallidos` AS `intentos_fallidos`,`cr`.`ultimo_cambio` AS `ultimo_cambio` from ((`usuario` `u` join `rol` `r` on((`r`.`id_rol` = `u`.`id_rol`))) left join `credencial` `cr` on((`cr`.`id_usuario` = `u`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-23 22:29:39
