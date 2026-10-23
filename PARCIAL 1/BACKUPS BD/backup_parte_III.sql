-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: pixel_security360
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
-- Table structure for table `autenticacion`
--

DROP TABLE IF EXISTS `autenticacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autenticacion` (
  `id_autenticacion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nombre_usuario` varchar(40) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `agente_usuario` varchar(200) NOT NULL,
  `token` varchar(255) NOT NULL,
  `fecha_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_autenticacion`),
  UNIQUE KEY `uq_autenticacion_token` (`token`),
  KEY `fk_autenticacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_autenticacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticacion`
--

LOCK TABLES `autenticacion` WRITE;
/*!40000 ALTER TABLE `autenticacion` DISABLE KEYS */;
INSERT INTO `autenticacion` VALUES (1,1,'arodriguez','$2b$12$7fcac4077d14474abc7f62a4a7dc65f02e5c7e467fbf1769f9ac4','Chrome 126 - Windows 11','0b73cc74b62cb6e67eee94971d085bb9cd657f3d493efaabbe710826dbd80d1d','2026-10-02 08:00:00',1),(2,2,'lperez','$2b$12$0f9a674f93815404e1d577f03d80c30a6860225c892f18957af1e','Firefox 127 - Windows 10','b0ccb4e7896f241f00d659240979ec44ec98fc6f74c28f3a1779dd6c66ea6c5a','2026-10-03 08:00:00',1),(3,3,'mcastillo','$2b$12$db172d439ded9acbf5974efb4d937af7f618e9f87b3c2c28bb612','Safari 17 - iPhone 15','88da89b6cc6f4e589ec964e046bf5e22eda85141a3575792eb1e8396e0a81624','2026-10-04 08:00:00',1),(4,4,'amendoza','$2b$12$5044b3c29554b11f26b46966f74d48f37af92a9a15b5b460428d8','Chrome 126 - Android 14','b212eff8cec14c51fa4a5951a160f55e3a6a49bf469e9ede29712768df67bb78','2026-10-05 08:00:00',1),(5,5,'svargas','$2b$12$2360335de2b1d3f97ec2737813d355a68b652912f74d9e69c0f0c','Edge 126 - Windows 11','1fa02cd9c511b920578b08593d9d88d1edcf14da7ecafee837916d9a0a0e9a2d','2026-10-06 08:00:00',0),(6,6,'jbatista','$2b$12$43ab1ab4c9e0ce5e358da95afac05482b78b43c6f6f231f164a93','Chrome 126 - Windows 11','7d9e1b6c7487043fda568533a2d376849602875611490971ad78b246b4ea82ab','2026-10-07 08:00:00',1),(7,7,'dortega','$2b$12$86bffc80bb43def13d87e8757bbd79247f17795ee3b6565799792','Firefox 127 - Windows 10','2be4de895bead4cfa98b40e85d7d1066b55c2e5d14d97d1381e13f8601ee5d10','2026-10-08 08:00:00',1),(8,8,'rsamaniego','$2b$12$da3cd96ea2c0a601723197e6bf006ba7dc3797a1f54ffdd638567','Safari 17 - iPhone 15','a2a4dceb6b92eb2099a48f73fde5b69ce932ba750935de359e17156d013bbc68','2026-10-09 08:00:00',1),(9,9,'parosemena','$2b$12$0b0a78e252eb7492f9698cdb687255d0aa0b87d1b68627b99e445','Chrome 126 - Android 14','ec4d6877dd8589422964f6ce1b9d9fa54382834fc9c13093479cd1688dbe39e9','2026-10-10 08:00:00',1),(10,10,'hquintero','$2b$12$619254034c1b87b82a5e5e8616b6e067e04501335381d9c55fc3a','Edge 126 - Windows 11','29ff30dbded5d9139023a141545ed8d02cf2654c74edf1252b16cb3b7c1db21c','2026-10-11 08:00:00',0),(11,11,'lfernandez','$2b$12$f87b68ce4bb289be5a9c2f02197f4d4edceeb08f0fa7e928db298','Chrome 126 - Windows 11','8f430ea7151849b93a45c745c189386381f99ee89eb1a5eddd56d23f4382a1c8','2026-10-12 08:00:00',1),(12,12,'emoreno','$2b$12$904938e172759f14aa948b18d5089f6d4dee89b2edf4a5d189d89','Firefox 127 - Windows 10','1e9f15fb0d9a45447aab3125d7224498bdbc0f0c486097d9e964013a58a07444','2026-10-13 08:00:00',1),(13,13,'vnunez','$2b$12$e342ff1480f087b693f943020bc9bc6e6cc891b98f6c84126597c','Safari 17 - iPhone 15','ff6e4feafde30a498b588344e8b47e6065e1ae4e709dcfdd7a5ebb2f9db71d7f','2026-10-14 08:00:00',1),(14,14,'mherrera','$2b$12$1e1bf85e67d42ba5a10a86d8567b11659fcfb3f58357ba4f19150','Chrome 126 - Android 14','6213a8a44d8d63039d72ea78b61f4d0e4fcc7392d86b5bdd156a9f742fa4d218','2026-10-15 08:00:00',1),(15,15,'psolis','$2b$12$80a285a49c6462606385c495f1efe2eb9ef704ba1de95fb73fe52','Edge 126 - Windows 11','21b0c0a283b802947747280ffea603aa4ba85a2d5591f21e6399509463d072be','2026-10-16 08:00:00',0),(16,16,'fcedeno','$2b$12$9acfcb427fa78b49b1cde08e8ae99026f768128c0430ef884ff08','Chrome 126 - Windows 11','d72bbd5321cd6e5be490816fb44cbf3217a1bf13706a68cc1cbe4d3c48a611e8','2026-10-17 08:00:00',1),(17,17,'grios','$2b$12$46d79a15323dfe8758c7ba565d37e993b3b34ffac0ab10d07e50e','Firefox 127 - Windows 10','dfff9d87f4579b965283cbfd15a9d56739320b892680d8219227b0fd79888437','2026-10-18 08:00:00',1),(18,18,'ajaramillo','$2b$12$5005c2b05e55b929a33cf9b49e4cf59f814222e154bed41597bdc','Safari 17 - iPhone 15','d4e32d59bb5f9014f0cab7c4e7a03433e72cf41e79afa7887a7f123996ad0b92','2026-10-19 08:00:00',1),(19,19,'nbarrios','$2b$12$037278e124bda1a9fd74f6513e1f700e8c9343f5de345cff0c705','Chrome 126 - Android 14','1611785475066a380937215be1d78d35c3d953d10d27902fb9bdcff4e2a1b592','2026-10-20 08:00:00',1),(20,20,'ralvarado','$2b$12$011acff4164fb0b7c8808b35e9bb8bb6d8b72c17abc176ea1a02a','Edge 126 - Windows 11','d18e208a96c7ccb1dad5ff8afdaa85f4b262351fd392cd359276b3519d481dd2','2026-10-21 08:00:00',0);
/*!40000 ALTER TABLE `autenticacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `marca` enum('visa','mastercard','american_express','discover','diners') NOT NULL,
  `numero_tarjeta` varchar(19) NOT NULL,
  `titular` varchar(100) NOT NULL,
  `cvc` varchar(4) NOT NULL,
  `vencimiento_mes` tinyint NOT NULL,
  `vencimiento_anio` smallint NOT NULL,
  `predeterminada` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_metodo_pago`),
  UNIQUE KEY `uq_metodo_usuario_tarjeta` (`id_usuario`,`numero_tarjeta`),
  CONSTRAINT `fk_metodo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `ck_metodo_anio` CHECK ((`vencimiento_anio` >= 2026)),
  CONSTRAINT `ck_metodo_cvc` CHECK (regexp_like(`cvc`,_utf8mb4'^[0-9]{3,4}$')),
  CONSTRAINT `ck_metodo_mes` CHECK ((`vencimiento_mes` between 1 and 12)),
  CONSTRAINT `ck_metodo_numero` CHECK (regexp_like(`numero_tarjeta`,_utf8mb4'^[0-9]{13,19}$'))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,1,'visa','4111111111111111','ANA RODRIGUEZ','123',8,2028,1),(2,1,'mastercard','5555555555554444','ANA RODRIGUEZ','456',3,2029,0),(3,2,'visa','4012888888881881','LUIS PEREZ','789',11,2027,1),(4,2,'american_express','378282246310005','LUIS PEREZ','1234',5,2030,0),(5,3,'mastercard','5105105105105100','MARTA CASTILLO','321',2,2028,1),(6,3,'discover','6011111111111117','MARTA CASTILLO','654',9,2029,0),(7,4,'american_express','371449635398431','ANDRES MENDOZA','4321',12,2027,1),(8,4,'visa','4111111111111111','ANDRES MENDOZA','987',6,2030,0),(9,5,'discover','6011000990139424','SOFIA VARGAS','147',4,2028,1),(10,5,'diners','30569309025904','SOFIA VARGAS','258',10,2029,0),(11,6,'visa','4012888888881881','JORGE BATISTA','369',1,2031,1),(12,6,'mastercard','5555555555554444','JORGE BATISTA','741',7,2028,0),(13,7,'diners','38520000023237','DANIELA ORTEGA','852',3,2027,1),(14,7,'visa','4111111111111111','DANIELA ORTEGA','963',8,2030,0),(15,8,'mastercard','5105105105105100','RICARDO SAMANIEGO','159',12,2028,1),(16,8,'american_express','378282246310005','RICARDO SAMANIEGO','7531',2,2029,0),(17,9,'visa','4012888888881881','PAOLA AROSEMENA','246',5,2029,1),(18,10,'discover','6011111111111117','HECTOR QUINTERO','135',9,2027,1),(19,11,'mastercard','5555555555554444','LUCIA FERNANDEZ','579',11,2030,1),(20,12,'visa','4111111111111111','ESTEBAN MORENO','864',4,2031,1);
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `id_reporte` int NOT NULL AUTO_INCREMENT,
  `referencia` varchar(20) NOT NULL,
  `id_usuario` int NOT NULL,
  `id_tipo_prueba` int NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `resumen` varchar(255) DEFAULT NULL,
  `severidad` enum('informativa','baja','media','alta','critica') NOT NULL,
  `estado` enum('borrador','emitido','entregado') NOT NULL DEFAULT 'borrador',
  `fecha_emision` date NOT NULL,
  `visible_cliente` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_reporte`),
  UNIQUE KEY `uq_reporte_referencia` (`referencia`),
  KEY `fk_reporte_usuario` (`id_usuario`),
  KEY `fk_reporte_tipo_prueba` (`id_tipo_prueba`),
  CONSTRAINT `fk_reporte_tipo_prueba` FOREIGN KEY (`id_tipo_prueba`) REFERENCES `tipo_prueba` (`id_tipo_prueba`),
  CONSTRAINT `fk_reporte_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
INSERT INTO `reporte` VALUES (1,'REP-2026-001',1,2,'Analisis de vulnerabilidades - Portal corporativo','Se identificaron 14 hallazgos en el portal web','alta','entregado','2026-03-12',1),(2,'REP-2026-002',2,5,'Prueba de inyeccion SQL - Sistema de facturacion','Parametro vulnerable en el modulo de busqueda','critica','entregado','2026-03-20',1),(3,'REP-2026-003',3,6,'Prueba XSS - Intranet institucional','XSS reflejado en el formulario de contacto','media','entregado','2026-03-28',1),(4,'REP-2026-004',4,1,'Reconocimiento - Infraestructura externa','Se enumeraron 23 subdominios expuestos','informativa','entregado','2026-04-02',1),(5,'REP-2026-005',5,7,'Autenticacion y sesiones - Plataforma de tramites','Tokens de sesion sin expiracion definida','alta','emitido','2026-04-10',1),(6,'REP-2026-006',6,8,'Control de acceso - Aplicacion de inventario','Acceso horizontal a datos de otros usuarios','alta','entregado','2026-04-18',1),(7,'REP-2026-007',7,9,'Ingenieria social - Campana de phishing','31% del personal abrio el correo simulado','media','entregado','2026-04-25',1),(8,'REP-2026-008',8,10,'Red interna - Segmentacion','Segmentos de red sin restriccion entre areas','media','emitido','2026-05-05',1),(9,'REP-2026-009',9,11,'Red externa - Perimetro','Puertos de administracion expuestos a internet','alta','entregado','2026-05-14',1),(10,'REP-2026-010',10,12,'Redes inalambricas - Sucursal Boquete','Cifrado WPA2 con clave debil','media','entregado','2026-05-22',1),(11,'REP-2026-011',11,13,'Pruebas de API - Servicio de pagos','Endpoints sin limitacion de solicitudes','alta','emitido','2026-06-03',1),(12,'REP-2026-012',12,14,'Aplicacion movil - Banca en linea','Almacenamiento inseguro de datos locales','media','entregado','2026-06-12',1),(13,'REP-2026-013',1,15,'Configuracion en la nube - Almacenamiento','Bucket con permisos de lectura publicos','critica','entregado','2026-06-20',1),(14,'REP-2026-014',2,17,'Politicas de contrasenas - Directorio activo','Cuentas con contrasenas comunes detectadas','alta','entregado','2026-07-01',1),(15,'REP-2026-015',3,18,'Contenedores - Cluster de produccion','Imagenes base con vulnerabilidades conocidas','media','emitido','2026-07-15',1),(16,'REP-2026-016',4,20,'Cifrado y transporte - Sitio web','Soporte de protocolos TLS obsoletos','baja','entregado','2026-07-28',1),(17,'REP-2026-017',5,3,'Explotacion - Servidor de aplicaciones','Ejecucion remota de comandos comprobada','critica','entregado','2026-08-09',1),(18,'REP-2026-018',6,4,'Post-explotacion - Escalada de privilegios','Escalada a administrador de dominio lograda','critica','emitido','2026-08-21',1),(19,'REP-2026-019',7,2,'Analisis de vulnerabilidades - Red de oficinas','Se hallaron 9 vulnerabilidades de severidad media','media','borrador','2026-09-10',0),(20,'REP-2026-020',8,13,'Pruebas de API - Aplicacion de reservas','Falta de validacion en parametros de entrada','baja','borrador','2026-10-05',0);
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_prueba`
--

DROP TABLE IF EXISTS `tipo_prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_prueba` (
  `id_tipo_prueba` int NOT NULL AUTO_INCREMENT,
  `referencia` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado` enum('activo','desactivado') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id_tipo_prueba`),
  UNIQUE KEY `uq_tipo_prueba_referencia` (`referencia`),
  UNIQUE KEY `uq_tipo_prueba_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_prueba`
--

LOCK TABLES `tipo_prueba` WRITE;
/*!40000 ALTER TABLE `tipo_prueba` DISABLE KEYS */;
INSERT INTO `tipo_prueba` VALUES (1,'PT-001','Reconocimiento','Recopilacion de informacion publica y activa sobre el objetivo','2025-01-15','activo'),(2,'PT-002','Analisis de Vulnerabilidades','Identificacion y clasificacion de vulnerabilidades en sistemas y redes','2025-01-15','activo'),(3,'PT-003','Explotacion','Aprovechamiento controlado de vulnerabilidades para comprobar su impacto','2025-01-15','activo'),(4,'PT-004','Escalada de Privilegios y Post-Explotacion','Obtencion de mayores privilegios y evaluacion del alcance del compromiso','2025-01-15','activo'),(5,'PT-005','Pruebas de Inyeccion SQL','Deteccion de fallos que permiten manipular consultas a la base de datos','2025-03-10','activo'),(6,'PT-006','Pruebas de Cross-Site Scripting (XSS)','Busqueda de inyeccion de scripts en aplicaciones web','2025-03-10','activo'),(7,'PT-007','Autenticacion y Gestion de Sesiones','Evaluacion de inicio de sesion, tokens y expiracion de sesiones','2025-04-22','activo'),(8,'PT-008','Pruebas de Control de Acceso','Verificacion de permisos y separacion de privilegios entre usuarios','2025-04-22','activo'),(9,'PT-009','Ingenieria Social y Phishing','Simulacion de campanas de engano dirigidas al personal','2025-05-30','activo'),(10,'PT-010','Pruebas de Red Interna','Evaluacion de segmentacion y exposicion dentro de la red corporativa','2025-06-18','activo'),(11,'PT-011','Pruebas de Red Externa','Evaluacion del perimetro expuesto a internet','2025-06-18','activo'),(12,'PT-012','Seguridad de Redes Inalambricas','Revision de cifrado, claves y puntos de acceso no autorizados','2025-08-05','activo'),(13,'PT-013','Pruebas de API','Analisis de endpoints, autenticacion y validacion de parametros','2025-09-12','activo'),(14,'PT-014','Pruebas de Aplicaciones Moviles','Revision de almacenamiento local y comunicacion de apps moviles','2025-10-20','activo'),(15,'PT-015','Revision de Configuracion en la Nube','Auditoria de permisos y configuraciones en servicios cloud','2025-11-14','activo'),(16,'PT-016','Denegacion de Servicio Controlada','Prueba de resistencia ante saturacion de recursos en ventanas acordadas','2025-12-02','desactivado'),(17,'PT-017','Fuerza Bruta y Politicas de Contrasenas','Evaluacion de contrasenas debiles y mecanismos de bloqueo','2026-01-08','activo'),(18,'PT-018','Seguridad de Contenedores','Analisis de imagenes, orquestacion y configuracion de contenedores','2026-01-27','activo'),(19,'PT-019','Seguridad Fisica y de Dispositivos','Revision de acceso fisico a equipos e instalaciones','2026-02-10','desactivado'),(20,'PT-020','Cifrado y Transporte (TLS)','Evaluacion de protocolos y certificados en comunicaciones','2026-02-24','activo');
/*!40000 ALTER TABLE `tipo_prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tipo_usuario`),
  UNIQUE KEY `uq_tipo_usuario_nombre` (`nombre`),
  CONSTRAINT `ck_tipo_usuario_nombre` CHECK ((char_length(`nombre`) >= 3))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Cliente',1),(2,'Administrador',1),(3,'Vendedor',1),(4,'Ejecutivo',1),(5,'Otros',1);
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
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
  `nombre_usuario` varchar(40) NOT NULL,
  `token` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `ciudad` varchar(60) NOT NULL,
  `sexo` enum('masculino','femenino') NOT NULL,
  `estado_civil` enum('soltero','casado','divorciado','viudo','union_libre') NOT NULL,
  `tipo_empresa` enum('publica','privada') NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `id_tipo_usuario` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `uq_usuario_nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `uq_usuario_token` (`token`),
  KEY `fk_usuario_tipo` (`id_tipo_usuario`),
  CONSTRAINT `fk_usuario_tipo` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`),
  CONSTRAINT `ck_usuario_nombre_usuario` CHECK ((char_length(`nombre_usuario`) >= 4))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Ana','Rodriguez','arodriguez','bc20f84b860e63570e4f4ff14cb14963cfdb74ae5f7e924b2d04a69157b0dfa1','$2b$12$7fcac4077d14474abc7f62a4a7dc65f02e5c7e467fbf1769f9ac4','Ciudad de Panama','femenino','soltero','privada','Calle 50, Edificio Torres del Pacifico, Piso 8',1,1),(2,'Luis','Perez','lperez','11f4f19e48b6ffa00690fa6b4bb6ba882a66be0a87e26dc3d72418fab7e53c28','$2b$12$0f9a674f93815404e1d577f03d80c30a6860225c892f18957af1e','Colon','masculino','casado','privada','Avenida Bolivar, Casa 14',1,1),(3,'Marta','Castillo','mcastillo','da7ec3bfd3204cbd48e4c27bd21d4a789a7cd4b5e342d9788833593dd0717daa','$2b$12$db172d439ded9acbf5974efb4d937af7f618e9f87b3c2c28bb612','David','femenino','casado','publica','Barrio Bolivar, Calle 3, Casa 22',1,1),(4,'Andres','Mendoza','amendoza','83e728a86877d6c60f1ea133c8f4a84e1fd703480d8dc669ebfb819d2d559750','$2b$12$5044b3c29554b11f26b46966f74d48f37af92a9a15b5b460428d8','Santiago','masculino','divorciado','privada','Avenida Central, Local 5',1,1),(5,'Sofia','Vargas','svargas','a025d3cfdfc5cba1c6db8fc0e13c1b5242831da5d39a3c4dcfe64f27f68edc76','$2b$12$2360335de2b1d3f97ec2737813d355a68b652912f74d9e69c0f0c','Chitre','femenino','soltero','publica','Calle Manuel Maria Icaza, Casa 9',1,1),(6,'Jorge','Batista','jbatista','1d48477896a14e11cd06e7d4c088c120e21701fdc3ae5edc11654fc556e8fcc8','$2b$12$43ab1ab4c9e0ce5e358da95afac05482b78b43c6f6f231f164a93','La Chorrera','masculino','union_libre','privada','Barriada Santa Marta, Casa 31',1,1),(7,'Daniela','Ortega','dortega','413c899349c2f227ab80325f45ae5bc2d26a6d31c17761ab785937246b60fa29','$2b$12$86bffc80bb43def13d87e8757bbd79247f17795ee3b6565799792','Penonome','femenino','casado','privada','Calle Juan Demostenes Arosemena, Edificio Plaza, Of. 2',1,1),(8,'Ricardo','Samaniego','rsamaniego','3d942d24aa41eea77ca4303e309b86e0b47a22e1d1dac115c91c1d277512c133','$2b$12$da3cd96ea2c0a601723197e6bf006ba7dc3797a1f54ffdd638567','Las Tablas','masculino','soltero','publica','Avenida Belisario Porras, Casa 18',1,1),(9,'Paola','Arosemena','parosemena','04b174c750a96d15a645b56d6df613314b9331065b5d1a21bbe2b340d9e35c8e','$2b$12$0b0a78e252eb7492f9698cdb687255d0aa0b87d1b68627b99e445','Aguadulce','femenino','soltero','privada','Calle 8va Norte, Casa 4',1,1),(10,'Hector','Quintero','hquintero','b7559522edede63c90445793439428392847ac8b98f19e8c9f2e3d80e2542ad1','$2b$12$619254034c1b87b82a5e5e8616b6e067e04501335381d9c55fc3a','Boquete','masculino','viudo','privada','Camino Real, Finca Los Naranjos',1,1),(11,'Lucia','Fernandez','lfernandez','2402e3da11eb34e5ff0ae5bbb5c66a01fef3ee7bcc893ff4833fa4589021577f','$2b$12$f87b68ce4bb289be5a9c2f02197f4d4edceeb08f0fa7e928db298','Ciudad de Panama','femenino','divorciado','publica','Via Espana, Torre Global, Piso 3',1,1),(12,'Esteban','Moreno','emoreno','af59c60da297891a0ca0de725011c2af25927e910e738a2b3b7bbf5074e23761','$2b$12$904938e172759f14aa948b18d5089f6d4dee89b2edf4a5d189d89','Colon','masculino','casado','publica','Calle 11, Edificio Cristobal, Apto 6',1,1),(13,'Valeria','Nunez','vnunez','d7cdd21a31876e14defb90ec61b1dc2d155723324a8803066e991ea59c77ddd9','$2b$12$e342ff1480f087b693f943020bc9bc6e6cc891b98f6c84126597c','Ciudad de Panama','femenino','soltero','privada','Obarrio, Calle 55, Torre Pixel, Piso 12',1,2),(14,'Miguel','Herrera','mherrera','e22bb40e2ca89ee2eebf22724a7e5802ce00e22e8482fdc718c00d71c1489ef5','$2b$12$1e1bf85e67d42ba5a10a86d8567b11659fcfb3f58357ba4f19150','Ciudad de Panama','masculino','casado','privada','Obarrio, Calle 55, Torre Pixel, Piso 12',1,2),(15,'Patricia','Solis','psolis','1011cf409a3018c3bed0a15f26814b0ddb4d0f7b95db4b33912e54d2bc034494','$2b$12$80a285a49c6462606385c495f1efe2eb9ef704ba1de95fb73fe52','David','femenino','casado','privada','Avenida Obaldia, Local 12',1,3),(16,'Fernando','Cedeno','fcedeno','c5ba48945efbdd6dbed613ec15d8bf072191990fb8cfb3d15ca5c4c0602227e1','$2b$12$9acfcb427fa78b49b1cde08e8ae99026f768128c0430ef884ff08','Santiago','masculino','soltero','privada','Calle 6ta, Local 3',1,3),(17,'Gabriela','Rios','grios','1b9d9d47c4209ac393e12f63a765c0de668f4d16d2cdbadb38857443aeca843b','$2b$12$46d79a15323dfe8758c7ba565d37e993b3b34ffac0ab10d07e50e','La Chorrera','femenino','union_libre','privada','Avenida Libertador, Local 7',1,3),(18,'Alberto','Jaramillo','ajaramillo','461d94725d8ab02cfb0c1523be8b2eb881d8642a51e569160ee20a65cb47458e','$2b$12$5005c2b05e55b929a33cf9b49e4cf59f814222e154bed41597bdc','Ciudad de Panama','masculino','casado','privada','Costa del Este, Torre Financiera, Piso 20',1,4),(19,'Natalia','Barrios','nbarrios','bef844a5fe7c792c754a16d37a3232100fb06e8f2f2d36afa500d042070c0c5a','$2b$12$037278e124bda1a9fd74f6513e1f700e8c9343f5de345cff0c705','Ciudad de Panama','femenino','divorciado','privada','Costa del Este, Torre Financiera, Piso 22',1,4),(20,'Roberto','Alvarado','ralvarado','63af5f638b38f74f763a1876a6b9b2f50c7c3cda937ce9d503b2cff73f0d14a3','$2b$12$011acff4164fb0b7c8808b35e9bb8bb6d8b72c17abc176ea1a02a','Colon','masculino','soltero','publica','Zona Libre, Edificio 4',0,5);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-23 22:29:59
