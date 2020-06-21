-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table turistapp.accidente
CREATE TABLE IF NOT EXISTS `accidente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `description` varchar(200) NOT NULL,
  `accidente_estado` tinyint(1) DEFAULT 0,
  `fechahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.accidente: ~5 rows (approximately)
/*!40000 ALTER TABLE `accidente` DISABLE KEYS */;
INSERT INTO `accidente` (`id`, `lat`, `lng`, `description`, `accidente_estado`, `fechahora`) VALUES
	(1, 46.580452, -0.194335, 'holi', 1, '2020-06-17 00:45:10'),
	(10, 45.469318, 0.250001, 'accidente aqui', 1, '2020-06-17 00:45:10'),
	(11, 47.777672, -1.903319, 'hora y fecha', 1, '2020-06-17 00:45:10'),
	(12, 44.942966, 1.315675, 'hora fecha', 1, '2020-06-17 00:45:38'),
	(13, 47.518627, 0.843263, 'fecha hora prueba', 1, '2020-06-17 00:46:56'),
	(14, 46.841599, 3.205323, 'revento camion', 1, '2020-06-17 02:20:04');
/*!40000 ALTER TABLE `accidente` ENABLE KEYS */;

-- Dumping structure for table turistapp.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categorias` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categorias` varchar(60) NOT NULL,
  PRIMARY KEY (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.categorias: ~16 rows (approximately)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id_categorias`, `nombre_categorias`) VALUES
	(1, 'Lugares Historicos'),
	(2, 'Restaurantes'),
	(3, 'Monumentos'),
	(4, 'Museo'),
	(5, 'Parques'),
	(6, 'Centros Comerciales'),
	(7, 'Hoteles'),
	(8, 'Casinos'),
	(9, 'Fuertes'),
	(10, 'Zoologicos'),
	(11, 'Playas'),
	(12, 'Lagos'),
	(13, 'Plazas'),
	(14, 'Edificios religiosos (Iglesias)'),
	(15, 'Senderos'),
	(16, 'Cementerios');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Dumping structure for table turistapp.ciudades
CREATE TABLE IF NOT EXISTS `ciudades` (
  `id_ciud` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ciud` varchar(60) NOT NULL,
  `descripcion_ciud` varchar(400) NOT NULL,
  `seguridad_ciud` int(11) NOT NULL,
  `paises_id_paises` int(11) NOT NULL,
  PRIMARY KEY (`id_ciud`),
  KEY `fk_ciudades_paises1_idx` (`paises_id_paises`),
  CONSTRAINT `fk_ciudades_paises1` FOREIGN KEY (`paises_id_paises`) REFERENCES `paises` (`id_paises`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.ciudades: ~5 rows (approximately)
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` (`id_ciud`, `nombre_ciud`, `descripcion_ciud`, `seguridad_ciud`, `paises_id_paises`) VALUES
	(1, 'Santiago', 'Santiago de Chile, es la capital de Chile.Situada a orillas del río Mapocho, Santiago fue fundada por el conquistador español Pedro de Valdivia, bajo el nombre de Santiago de Nueva Extremadura.Actualmente es el centro económico y administrativo del país, además de ser la aglomeración urbana más grande y con mayor cantidad de población del territorio nacional.', 0, 1),
	(2, 'Valparaiso', 'Puerto principal rico en cultura e historia', 6, 1),
	(3, 'Punta Arenas', 'Ciudad puerto de la zona austral de chile', 8, 1),
	(4, 'Concepcion', 'Capital de la provincia de Bio Bio teniendo una gran importancia comercial', 6, 1),
	(5, 'Antofagasta', 'Una ciudad puerto de gran heterogeniedad cultural', 4, 1);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;

-- Dumping structure for table turistapp.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cli` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cli` varchar(45) NOT NULL,
  `apellido_cli` varchar(45) NOT NULL,
  `fecha_nac` date NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.cliente: ~26 rows (approximately)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id_cli`, `nombre_cli`, `apellido_cli`, `fecha_nac`, `direccion`, `correo`, `telefono`) VALUES
	(1, 'asd', 'asd', '2020-05-03', 'asd', 'asd', NULL),
	(2, 'asd', 'asd', '2020-05-04', 'asd', 'dsa', NULL),
	(3, 'dsa', 'dsa', '2020-05-02', 'asd', 'dsadsad', NULL),
	(4, 'wena', 'wena wena', '2020-05-01', 'asd', 'wena@wena', NULL),
	(5, 'wenaaaa', 'asdsada', '2020-04-29', 'asds', 'wena@wenaaa', NULL),
	(6, 'wenaaaa', 'sadasd', '2020-04-30', 'asdsad', 'asdas@asda', NULL),
	(7, 'Funciona', 'Bien', '2020-04-08', 'asda', 'FuncionaBien@xd.cl', NULL),
	(8, 'asd', 'asd', '2020-05-04', 'asd', 'asd', NULL),
	(9, 'asd', 'asd', '2020-05-04', 'asd', 'asd', NULL),
	(10, 'wenaaaa funca', 'Bien', '2020-05-11', 'asdasd', 'asdas@asda.cl', NULL),
	(11, 'asd', 'asd', '2020-04-30', 'Los Benedictinos 534', 'FuncionaBien@xd.cl', NULL),
	(12, 'wenaaaa', 'asdasd', '2020-04-28', 'Los Benedictinos 534', 'FuncionaBien@xd.cl', NULL),
	(13, 'wenaaaa', 'Bien', '2020-04-27', 'Los Benedictinos 534', 'FuncionaBien@xd.cl', NULL),
	(14, 'Funciona', 'dsa', '2020-04-27', 'Los Benedictinos 534', 'FuncionaBien@xd.cl', NULL),
	(15, 'Funciona', 'wena wena', '2020-04-26', 'asd', 'FuncionaBien@xd.cl', NULL),
	(16, 'wenaaaa', 'asd', '2020-04-30', 'Los Benedictinos 534', 'FuncionaBien@xd.cl', NULL),
	(17, 'wenaaaa', 'asdasd', '2020-04-28', 'Los Benedictinos 534', 'FuncionaBien@xd.cl', NULL),
	(18, 'wenaaaa hoy', 'asdasd', '1999-01-05', 'Los Benedictinos 534', 'FuncionaBien@xd.cl', NULL),
	(19, 'wenaaaa hoy', 'asdasd', '1999-01-05', 'Los Benedictinos 534', 'FuncionaBien@xd.cl', NULL),
	(20, 'prueba1', 'probando', '1999-01-01', 'una casa', 'FuncionaBien@xd.cl', NULL),
	(21, 'PRUEBA 2', 'WENA WENA', '1989-02-15', 'x hay', 'Probando@Denuevo.xd', 0),
	(22, 'Prueba 3 xd', 'wena wena 3', '1999-02-16', 'x hay 3', 'FuncionaBien3@xd.cl', 0),
	(23, 'wena wena', 'Bien', '1999-05-20', 'asdasdasdasdassd', 'wenaaaa@wenaaa.ty', 123123),
	(24, 'wena', 'asdasd', '1999-05-20', 'asd', 'asd@asd.xd', 0),
	(25, 'wenaaaa funca', 'asd', '2000-05-27', 'asd', 'FuncionaBien213@xd.cl', 0),
	(26, 'Funciona', 'Bien', '1999-10-27', 'asdasdas', 'FuncionaBien12312@xd.cl', 0);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Dumping structure for table turistapp.comentarios
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id_comen` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` varchar(600) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  PRIMARY KEY (`id_comen`),
  KEY `fk_comentarios_cuenta1_idx` (`cuenta_id_cuenta`),
  CONSTRAINT `fk_comentarios_cuenta1` FOREIGN KEY (`cuenta_id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.comentarios: ~26 rows (approximately)
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` (`id_comen`, `detalle`, `cuenta_id_cuenta`) VALUES
	(1, 'wena', 20),
	(2, 'asdasdsa', 20),
	(3, 'asdqwe', 20),
	(4, 'ASDAA', 20),
	(5, 'ASDAA', 20),
	(6, 'este es otro', 2),
	(7, 'a', 20),
	(8, 'xd', 20),
	(9, 'aaaaaaaaa', 20),
	(10, 'AAAAAAAA', 20),
	(11, 'asd', 20),
	(12, 'asd', 20),
	(13, 'asd', 20),
	(14, 'asd', 20),
	(15, 'qwe', 20),
	(16, 'd', 20),
	(17, 'd', 20),
	(18, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eu aliquet quam. Curabitur at est lacinia, faucibus massa hendrerit, pellentesque turpis. Duis elementum erat at neque ullamcorper, eu volutpat justo bibendum. Nam rutrum risus a enim suscipit vulputate.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eu aliquet quam. Curabitur at est lacinia, faucibus massa hendrerit, pellentesque turpis. Duis elementum erat at neque ullamcorper, eu volutpat justo bibendum. Nam rutrum risus a enim suscipit vulputate.', 20),
	(19, 'WEEEEEENA A A A ', 20),
	(20, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eu aliquet quam. Curabitur at est lacinia, faucibus massa hendrerit, pellentesque turpis. Duis elementum erat at neque ullamcorper, eu volutpat justo bibendum. Nam rutrum risus a enim suscipit vulputate.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eu aliquet quam. Curabitur at est lacinia, faucibus massa hendrerit, pellentesque turpis. Duis elementum erat at neque ullamcorper, eu volutpat justo bibendum. Nam rutrum risus a enim suscipit vulputate.', 20),
	(21, 'PROBANDO XD', 20),
	(22, ':OMEGALUL:', 20),
	(23, 'NANI', 20),
	(24, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris urna massa, posuere id feugiat sed, viverra sit amet risus. Praesent pulvinar, purus at scelerisque iaculis, felis purus maximus dui, quis molestie elit elit quis sapien. Phasellus a vestibulum lorem. Nullam lacinia mi et nibh faucibus, nec euismod magna mollis. Sed ut fermentum urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec mollis convallis tortor vel pulvinar.', 16),
	(25, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris urna massa, posuere id feugiat sed, viverra sit amet risus. Praesent pulvinar, purus at scelerisque iaculis, felis purus maximus dui, quis molestie elit elit quis sapien. Phasellus a vestibulum lorem. Nullam lacinia mi et nibh faucibus, nec euismod magna mollis. Sed ut fermentum urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec mollis convallis tortor vel pulvinar.', 16),
	(26, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris urna massa, posuere id feugiat sed, viverra sit amet risus. Praesent pulvinar, purus at scelerisque iaculis, felis purus maximus dui, quis molestie elit elit quis sapien. Phasellus a vestibulum lorem. Nullam lacinia mi et nibh faucibus, nec euismod magna mollis. Sed ut fermentum urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec mollis convallis tortor vel pulvinar.', 17);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;

-- Dumping structure for table turistapp.continentes
CREATE TABLE IF NOT EXISTS `continentes` (
  `id_cont` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cont` varchar(45) NOT NULL,
  `descripcion_cont` varchar(300) NOT NULL,
  PRIMARY KEY (`id_cont`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.continentes: ~0 rows (approximately)
/*!40000 ALTER TABLE `continentes` DISABLE KEYS */;
INSERT INTO `continentes` (`id_cont`, `nombre_cont`, `descripcion_cont`) VALUES
	(1, 'América del Sur', 'Es el subcontinente austral de América, o también considerado por muchos uno de los continentes que conforman el supercontinente América.Está atravesada por la línea ecuatorial en su extremo norte, quedando así con la mayor parte de su territorio comprendida dentro del hemisferio sur.');
/*!40000 ALTER TABLE `continentes` ENABLE KEYS */;

-- Dumping structure for table turistapp.cuenta
CREATE TABLE IF NOT EXISTS `cuenta` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `contrasena` varchar(45) NOT NULL,
  `premium` tinyint(4) NOT NULL,
  `cliente_id_cli` int(11) NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `fk_cuenta_cliente_idx` (`cliente_id_cli`),
  CONSTRAINT `fk_cuenta_cliente` FOREIGN KEY (`cliente_id_cli`) REFERENCES `cliente` (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.cuenta: ~20 rows (approximately)
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` (`id_cuenta`, `contrasena`, `premium`, `cliente_id_cli`) VALUES
	(1, 'asd', 0, 1),
	(2, 'asd', 0, 7),
	(3, 'asd', 0, 9),
	(4, 'asd', 0, 10),
	(5, 'asd', 0, 11),
	(6, 'asd', 0, 12),
	(7, 'asd', 0, 13),
	(8, 'asd', 0, 14),
	(9, 'asd', 0, 15),
	(10, 'asd', 0, 16),
	(11, 'asd', 0, 17),
	(12, 'asd', 0, 18),
	(13, 'asd', 0, 19),
	(14, 'asd', 0, 20),
	(15, 'asd123', 0, 21),
	(16, 'asd3', 0, 22),
	(17, '123', 0, 23),
	(18, '1234', 0, 24),
	(19, '12345', 0, 25),
	(20, 'asd123', 0, 26);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;

-- Dumping structure for table turistapp.cuenta_lugares
CREATE TABLE IF NOT EXISTS `cuenta_lugares` (
  `cuenta_id_cuenta` int(11) NOT NULL,
  `lugares_id_lugar` int(11) NOT NULL,
  PRIMARY KEY (`cuenta_id_cuenta`,`lugares_id_lugar`),
  KEY `fk_cuenta_has_lugares_lugares1_idx` (`lugares_id_lugar`),
  KEY `fk_cuenta_has_lugares_cuenta1_idx` (`cuenta_id_cuenta`),
  CONSTRAINT `fk_cuenta_has_lugares_cuenta1` FOREIGN KEY (`cuenta_id_cuenta`) REFERENCES `cuenta` (`id_cuenta`),
  CONSTRAINT `fk_cuenta_has_lugares_lugares1` FOREIGN KEY (`lugares_id_lugar`) REFERENCES `lugares` (`id_lugar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.cuenta_lugares: ~43 rows (approximately)
/*!40000 ALTER TABLE `cuenta_lugares` DISABLE KEYS */;
INSERT INTO `cuenta_lugares` (`cuenta_id_cuenta`, `lugares_id_lugar`) VALUES
	(15, 1),
	(15, 2),
	(15, 3),
	(15, 4),
	(15, 5),
	(15, 6),
	(15, 7),
	(15, 9),
	(15, 10),
	(15, 12),
	(15, 15),
	(15, 16),
	(15, 18),
	(15, 19),
	(15, 20),
	(18, 1),
	(18, 2),
	(18, 3),
	(18, 4),
	(18, 5),
	(18, 6),
	(18, 7),
	(18, 9),
	(18, 10),
	(18, 12),
	(18, 15),
	(18, 16),
	(18, 18),
	(18, 20),
	(20, 1),
	(20, 2),
	(20, 3),
	(20, 4),
	(20, 5),
	(20, 6),
	(20, 7),
	(20, 9),
	(20, 10),
	(20, 12),
	(20, 15),
	(20, 16),
	(20, 18),
	(20, 20);
/*!40000 ALTER TABLE `cuenta_lugares` ENABLE KEYS */;

-- Dumping structure for table turistapp.cuenta_pregunta
CREATE TABLE IF NOT EXISTS `cuenta_pregunta` (
  `cuenta_id_cuenta` int(11) NOT NULL,
  `preguntas_id_pregunta` int(11) NOT NULL,
  `respuesta` int(11) DEFAULT NULL,
  PRIMARY KEY (`cuenta_id_cuenta`,`preguntas_id_pregunta`),
  KEY `fk_cuenta_has_preguntas_preguntas1_idx` (`preguntas_id_pregunta`),
  KEY `fk_cuenta_has_preguntas_cuenta1_idx` (`cuenta_id_cuenta`),
  CONSTRAINT `fk_cuenta_has_preguntas_cuenta1` FOREIGN KEY (`cuenta_id_cuenta`) REFERENCES `cuenta` (`id_cuenta`),
  CONSTRAINT `fk_cuenta_has_preguntas_preguntas1` FOREIGN KEY (`preguntas_id_pregunta`) REFERENCES `preguntas` (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.cuenta_pregunta: ~12 rows (approximately)
/*!40000 ALTER TABLE `cuenta_pregunta` DISABLE KEYS */;
INSERT INTO `cuenta_pregunta` (`cuenta_id_cuenta`, `preguntas_id_pregunta`, `respuesta`) VALUES
	(15, 1, 2),
	(15, 2, 1),
	(15, 3, 1),
	(15, 4, 1),
	(18, 1, 1),
	(18, 2, 1),
	(18, 3, 1),
	(18, 4, 1),
	(20, 1, 2),
	(20, 2, 1),
	(20, 3, 2),
	(20, 4, 1);
/*!40000 ALTER TABLE `cuenta_pregunta` ENABLE KEYS */;

-- Dumping structure for table turistapp.lugares
CREATE TABLE IF NOT EXISTS `lugares` (
  `id_lugar` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_lugar` varchar(60) NOT NULL,
  `descripcion_lugar` varchar(700) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `ciudades_id_ciud` int(11) NOT NULL,
  PRIMARY KEY (`id_lugar`),
  KEY `fk_lugares_ciudades1_idx` (`ciudades_id_ciud`),
  CONSTRAINT `fk_lugares_ciudades1` FOREIGN KEY (`ciudades_id_ciud`) REFERENCES `ciudades` (`id_ciud`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.lugares: ~24 rows (approximately)
/*!40000 ALTER TABLE `lugares` DISABLE KEYS */;
INSERT INTO `lugares` (`id_lugar`, `nombre_lugar`, `descripcion_lugar`, `longitud`, `latitud`, `ciudades_id_ciud`) VALUES
	(1, 'Palacio de la Moneda', 'La única forma de visitar la sede del Gobierno de Chile, es realizando una visita guiada oficial del Palacio de la Moneda.\r\n\r\nEsta visita deben solicitarla llenando un formulario disponible en el sitio oficial del Gobierno: visitasguiadas.presidencia.cl\r\n\r\nAllí sigan las instrucciones que todo está claro.\r\n\r\nLuego de su inscripción les llegará un correo electrónico confirmando su reserva e indicándoles los próximos pasos.', -33.442824, -70.65387, 1),
	(2, 'Plaza de Armas', 'La Plaza de Armas de Santiago es considerada el corazón de la capital de Chile, marcando el hito conocido como Kilómetro Cero, desde el cual se comienza a medir la distancia entre las diferentes ciudades del país.\r\n\r\nEn su entorno no solo convergen emblemáticos edificios, símbolos del origen de la ciudad y testigos de su desarrollo de más de cuatro siglos, sino que también característicos personajes que llenan de vida este espacio.\r\n\r\nEntre ellos, los visitantes pueden encontrar a pintores que día a día despliegan su arte; históricos fotógrafos que usan antiguas máquinas de cajón; o humoristas callejeros que atraen la atención de los transeúntes.  ', -33.43781, -70.650483, 1),
	(3, 'Parque Metropolitano', 'Este parque está formado por cerros desprendidos del cordón Manquehue y abarca una superficie de 720 hectáreas.\r\n\r\nEn la cumbre del cerro San Cristóbal, a unos 860 metros de altitud, se encuentra una imagen de la Virgen de la Inmaculada Concepción. La escultura mide 14 metros y fue inaugurada en 1908 ante la presencia de numerosos fieles.\r\n\r\nEl parque como lo conocemos actualmente es el resultado de la iniciativa del Intendente Alberto Mackenna Subercaseaux, que en 1921 comenzó los trabajos de forestación con aromos, pinos y otras especies.\r\n\r\nAcá los turistas también encontrarán el Zoológico Nacional, el Jardín Botánico, dos piscinas, zonas de picnic y una privilegiada vista al valle.', -33.430398, -70.636293, 1),
	(4, 'Mercado central de Santiago', 'Es uno de los centros gastronómicos más característicos de Santiago, en cuyos restaurantes es posible degustar comida típica chilena, principalmente basada en productos del mar.\r\n\r\nAdquirió aún más notoriedad el año 2012, cuando National Geographic lo eligió como el quinto mejor mercado de comidas del mundo.\r\n\r\nEn 2004, el entorno del Mercado Central fue intervenido para reordenarlo, realzar su valor patrimonial y revitalizar la vida urbana que allí se desarrolla y desde agosto de 2017, los pasillos y la plaza central del lugar cuentan con una red de Wi-Fi de acceso público.', -33.433745, -70.651101, 1),
	(5, 'Playa de reñaca', 'Reñaca es una localidad chilena ubicada al norte de la comuna de Viña del Mar, en la región de Valparaíso. Principalmente turístico y residencial, es uno de los barrios más exclusivos dentro del Área Metropolitana de Valparaíso. Característico por su extensa playa y edificios escalonados en las laderas de los cerros, cada año se transforma en el epicentro de la diversión veraniega para porteños y visitantes.', -32.96961, -71.545661, 2),
	(6, 'Casa Museo La Sebastiana', 'La Sebastiana es una de las tres casas —junto con La Chascona en Santiago y la Casa de Isla Negra— que fueron propiedad del poeta chileno Pablo Neruda. Situada en Valparaíso, en el Cerro Bellavista, destaca por la belleza de su construcción y su magnífica vista a la bahía del puerto. Al igual que las otras dos, está convertida en museo administrado por la Fundación Neruda.', -33.053849, -71.622614, 2),
	(7, 'Jardin Botanico de Viña Del Mar', 'El Jardín Botánico Nacional, es un jardín botánico de 395 ha incluidos cerros de matorral y bosque esclerófilo. Dentro de esta superficie hay 22 ha correspondientes al parque antiguo construido por Pascual Baburizza que están abiertas al público. Es miembro del BGCI y presenta trabajos para la Agenda Internacional para la Conservación en los Jardines Botánicos, su código de reconocimiento internacional como institución botánica, así como las siglas de su herbario es VINAD. ', -33.048643, -71.501528, 2),
	(8, 'Palacio Baburizza', 'El Palacio Baburizza es un inmueble construido en 1916 en el cerro Alegre de la ciudad chilena de Valparaíso por los arquitectos italianos Arnaldo Barison y Renato Schiavon para la familia Zanelli. Su nombre es en honor a su segundo propietario, el empresario croata Pascual Baburizza, que adquirió la mansión en 1925.? La casona se convirtió en sede del Museo Municipal de Bellas Artes de Valparaíso en 1971 y ocho años más tarde fue declarada Monumento Histórico.', -33.040121, -71.62881, 2),
	(9, 'Paseo Gervasoni', 'El paseo Gervasoni esta ubicado en el Cerro Concepción, se puede acceder a este paseo subiendo por el Ascensor Concepción , se accede también desde Calle Papudo hasta pasaje Templeman. ', -33.0411, -71.626717, 2),
	(10, 'Playa Torpederas', 'Playa Las Torpederas es un balneario de Valparaíso, Chile, situado en la base del cerro Playa Ancha y ubicado en el remate de la Avenida Altamirano. ', -33.022351, -71.643891, 2),
	(11, 'Museo A Cielo Abierto', 'El Museo a Cielo Abierto de Valparaíso es una iniciativa pionera en Chile y está compuesto por 20 murales de diversos estilos pictóricos; ubicados en los faldeos del cerro Bellavista en la principal ciudad portuaria de Chile. Se inaugura en 1992 y participan connotados artistas, algunos de fama mundial como Roberto Matta o Mario Carreño entre otros.', -33.048277, -71.62235, 2),
	(12, 'Ascensor Reina Victoria', 'El ascensor Reina Victoria, ubicado en el cerro Alegre, es uno de los 30 ascensores que forman parte de la historia de la ciudad de Valparaíso, Chile.? Se construyó en 1902 y se inauguró en 1903. Fue declarado Monumento Histórico, mediante el Decreto Exento n.º 866, del 1 de septiembre de 1998.', -33.04387, -71.626441, 2),
	(13, 'Museo de Historia Natural de Valparaiso', 'El Museo de Historia Natural de Valparaíso es un museo de historia natural ubicado en la ciudad de Valparaíso, en Chile. Fue fundado en 1878 por Eduardo de la Barra en el Liceo de Hombres de Valparaíso. Tras pasar por varias instalaciones, desde 1988 tiene su sede en el Palacio Lyon.? Actualmente está administrado por el Servicio Nacional del Patrimonio Cultural.', -33.0464, -71.621101, 2),
	(14, 'Parque cultural de Valparaiso', 'El Parque Cultural de Valparaíso, también conocido como la Ex-cárcel, es un complejo arquitectónico construido en el Cerro Cárcel de Valparaíso, Chile, a partir de 2010 e inaugurado durante el gobierno de Sebastián Piñera en octubre de 2011?. El establecimiento se emplaza sobre las bases de lo que fue la antigua cárcel pública de la ciudad, siendo ocupada hoy por artistas y agrupaciones culturales y comunitarias locales.? Dentro del terreno del parque también se emplaza un antiguo polvorín, sitio arqueológico de fines de la época colonial, que corresponde a la construcción más antigua que se conserva de la ciudad, ? y al único testimonio de las fortificaciones en los cerros.', -33.04617, -71.627592, 2),
	(15, 'Reserva Nacional Nonguen', 'La reserva nacional Nonguén, que abarca 3055 hectáreas y está mayormente emplazada en la comuna de Chiguayante, fue creada el 30 de diciembre de 2009, siendo la quinta reserva de la región del Biobío, y el 8 de mayo de 2020 fue recategorizado como parque nacional, convirtiéndose en el primero de su tipo existente en un sector periurbano de Chile.?Esta reserva comprende la muestra más representativa del bosque caducifolio de Concepción, el cual cubría la cordillera de la Costa de la región del Biobío, y que fue reemplazado casi en su totalidad por cultivos agrícolas y plantaciones forestales de pinos y eucaliptos', -36.876336, -72.99334, 4),
	(16, 'Parque Ecuador', 'El Parque Ecuador es un parque chileno perteneciente a la ciudad de Concepción, en la Región del Biobío. Se ubica a los pies del Cerro Caracol y muy cerca del centro de la ciudad, estando dividido del centro urbano por la Calle Víctor Lamas. Corresponde a una gran zona recreativa de más de un kilómetro de longitud, con varios puntos de relevancia histórica, social y cultural.?Desde inicios del año 2015, es un parque inclusivo de accesibilidad para niños y adultos con capacidades diferentes.', -36.832734, -73.047392, 4),
	(17, 'Cerro Caracol', 'El Cerro Caracol es un hito geográfico de la ciudad de Concepción, Chile. Es conocido como el pulmón verde de la ciudad, por la gran cantidad de forestación y flora que contiene. Como área recreativa se ha «fusionado» con el Parque Ecuador, el que se ubica a las faldas del cerro.?El cerro se extiende por más de 1200 ha de variada y abundante vegetación, y su altura máxima es de 250 metros. Posee diversos senderos y caminos para vehículos motorizados que permiten la realización de paseos, senderismo o ciclismo.', -36.834125, -73.047778, 4),
	(18, 'Monitor Huascar', 'El monitor Huáscar es un buque de guerra del siglo XIX que tuvo una relevante participación en la Guerra del Pacífico. Fue construido en el Reino Unido en 1864 por orden del gobierno peruano y sirvió en la Marina de Guerra de Perú hasta el 8 de octubre de 1879, cuando fue capturado por la escuadra chilena en el combate naval de Angamos. El Huáscar sirvió activamente en la Armada de Chile hasta 1897, cuando fue dado de baja. Actualmente sirve como museo marítimo flotante en el puerto chileno de Talcahuano, Región del Biobío.? Es el segundo blindado a flote más antiguo del mundo después del HMS Warrior.', -36.705236, -73.111699, 4),
	(19, 'Plaza Acevedo', 'La Plaza Acevedo es una área verde de la ciudad chilena de Concepción, con forma de triángulo, ubicada entre las calles San Juan Bosco, Maipú y Collao. Su nombre rinde homenaje a Luis Acevedo Acevedo, pionero de la aviación en Chile, que falleció el 13 de abril de 1913, al caer su avión en los terrenos donde hoy se ubica la comuna de San Pedro de la Paz.? Las autoridades de la época deciden, ese mismo año, crear una plaza en memoria del aviador. El trazado se hizo el 21 de marzo de 1914.?Dentro de la plaza se ubica el Museo de Historia Natural de Concepción, que fue creado el año 1902 por el naturalista británico Edwin Reed Brookman.', -36.815664, -73.031426, 4),
	(20, 'Parque Museo Pedro del Rio', 'El Parque Pedro del Río Zañartu, está ubicado en la comuna de Hualpén, Chile. Es un lugar recreativo-histórico del sector, en cuyos terrenos se emplaza el Museo Pedro del Río Zañartu, obra construida durante el período de Chile colonial, y que perteneció a la familia de Pedro del Río Zañartu. Desde 1976 es considerado Monumento Nacional de Chile.', -36.796942, -73.152675, 4),
	(21, 'Pinacoteca', 'La Casa del Arte José Clemente Orozco, más comúnmente conocida como Casa del Arte o Pinacoteca, es un museo pictórico y artístico chileno ubicado en la Ciudad Universitaria de Concepción, campus de la Universidad de Concepción ubicado al frente de la Plaza Perú, en la ciudad de Concepción. Este museo posee la colección de pintura chilena más completa del país, compuesta por obras de distintas épocas que ascienden al día de hoy a más de 1800 obras.', -36.796951, -73.152718, 4),
	(22, 'Plaza de la Independencia de Concepcion', 'La plaza de la Independencia es la plaza de Armas de la ciudad chilena de Concepción. Es considerada el núcleo de toda la ciudad por su relevancia histórica-social. Se ubica en el cuadrante formado por las avenidas O\'Higgins, Aníbal Pinto, Barros Arana y Caupolicán. Es la única plaza de armas en Chile que se denomina de esa manera, y su nombre se debe a que es el lugar en donde Bernardo O\'Higgins realizó la declaración solemne de la independencia chilena.', -36.827173, -73.050225, 4),
	(23, 'Catedral Metropolitana de la Santísima Concepción', 'La Catedral de la Santísima Concepción es la catedral de Concepción de Chile, sede de la Arquidiócesis de la Santísima Concepción y uno de los principales templos de la Iglesia Católica en Chile. Se ubica en la comuna de Concepción, frente a la Plaza de la Independencia. El conjunto arquitectónico de la Catedral de la Santísima Concepción está compuesto por un Museo Eclesiástico, el Aula Magna y el templo Catedral propiamente tal.', -36.827199, -73.051109, 4),
	(24, 'Museo de Historia Natural de Concepcion', 'El Museo de Historia Natural de Concepción es un museo de historia natural ubicado en la ciudad de Concepción, en Chile. Su colección muestra parte de la historia geográfica de Concepc', -36.815365, -73.030552, 4);
/*!40000 ALTER TABLE `lugares` ENABLE KEYS */;

-- Dumping structure for table turistapp.lugares_categorias
CREATE TABLE IF NOT EXISTS `lugares_categorias` (
  `lugares_id_lugar` int(11) NOT NULL,
  `categorias_id_categorias` int(11) NOT NULL,
  PRIMARY KEY (`lugares_id_lugar`,`categorias_id_categorias`),
  KEY `fk_lugares_has_categorias_categorias1_idx` (`categorias_id_categorias`),
  KEY `fk_lugares_has_categorias_lugares1_idx` (`lugares_id_lugar`),
  CONSTRAINT `fk_lugares_has_categorias_categorias1` FOREIGN KEY (`categorias_id_categorias`) REFERENCES `categorias` (`id_categorias`),
  CONSTRAINT `fk_lugares_has_categorias_lugares1` FOREIGN KEY (`lugares_id_lugar`) REFERENCES `lugares` (`id_lugar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.lugares_categorias: ~15 rows (approximately)
/*!40000 ALTER TABLE `lugares_categorias` DISABLE KEYS */;
INSERT INTO `lugares_categorias` (`lugares_id_lugar`, `categorias_id_categorias`) VALUES
	(1, 11),
	(2, 4),
	(3, 5),
	(4, 1),
	(5, 15),
	(6, 11),
	(7, 4),
	(9, 4),
	(10, 5),
	(12, 13),
	(15, 13),
	(16, 4),
	(18, 13),
	(19, 14),
	(20, 4);
/*!40000 ALTER TABLE `lugares_categorias` ENABLE KEYS */;

-- Dumping structure for table turistapp.lugares_comentados
CREATE TABLE IF NOT EXISTS `lugares_comentados` (
  `lugares_id_lugar` int(11) NOT NULL,
  `comentarios_id_comen` int(11) NOT NULL,
  PRIMARY KEY (`lugares_id_lugar`,`comentarios_id_comen`),
  KEY `fk_lugares_has_comentarios_comentarios1_idx` (`comentarios_id_comen`),
  KEY `fk_lugares_has_comentarios_lugares1_idx` (`lugares_id_lugar`),
  CONSTRAINT `fk_lugares_has_comentarios_comentarios1` FOREIGN KEY (`comentarios_id_comen`) REFERENCES `comentarios` (`id_comen`),
  CONSTRAINT `fk_lugares_has_comentarios_lugares1` FOREIGN KEY (`lugares_id_lugar`) REFERENCES `lugares` (`id_lugar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.lugares_comentados: ~27 rows (approximately)
/*!40000 ALTER TABLE `lugares_comentados` DISABLE KEYS */;
INSERT INTO `lugares_comentados` (`lugares_id_lugar`, `comentarios_id_comen`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 6),
	(1, 19),
	(1, 20),
	(1, 21),
	(1, 22),
	(1, 23),
	(1, 24),
	(3, 9),
	(3, 25),
	(3, 26),
	(7, 16),
	(7, 17),
	(9, 4),
	(9, 5),
	(9, 11),
	(9, 12),
	(9, 18),
	(12, 7),
	(12, 8),
	(15, 13),
	(15, 14),
	(15, 17),
	(16, 15),
	(18, 10);
/*!40000 ALTER TABLE `lugares_comentados` ENABLE KEYS */;

-- Dumping structure for table turistapp.paises
CREATE TABLE IF NOT EXISTS `paises` (
  `id_paises` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(60) NOT NULL,
  `descripcion_pais` varchar(400) NOT NULL,
  `continentes_id_cont` int(11) NOT NULL,
  PRIMARY KEY (`id_paises`),
  KEY `fk_paises_continentes1_idx` (`continentes_id_cont`),
  CONSTRAINT `fk_paises_continentes1` FOREIGN KEY (`continentes_id_cont`) REFERENCES `continentes` (`id_cont`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.paises: ~3 rows (approximately)
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` (`id_paises`, `nombre_pais`, `descripcion_pais`, `continentes_id_cont`) VALUES
	(1, 'Chile', 'Los principales atractivos turísticos chilenos corresponden a lugares de paisajes naturales en las zonas extremas del país. En el ámbito nacional, el turismo se concentra en el verano, especialmente en los balnearios costeros de la zona norte', 1),
	(2, 'Argentina', 'Es un país sudamericano de gran envergadura con un terreno que incluye las montañas de los Andes, lagos glaciales y praderas en las Pampas, la tierra tradicional de pastoreo de su famoso ganado. El país es conocido por el baile y la música del tango.', 1),
	(3, 'Perú', 'Perú abarca una sección del bosque del Amazonas y Machu Picchu, una antigua ciudad inca en las alturas de los Andes. La región en torno a Machu Picchu, incluido el Valle Sagrado, el Camino del Inca y la ciudad colonial de Cuzco, es rica en sitios arqueológicos.', 1);
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;

-- Dumping structure for table turistapp.preguntas
CREATE TABLE IF NOT EXISTS `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `descripcion_pregunta` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table turistapp.preguntas: ~4 rows (approximately)
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` (`id_pregunta`, `descripcion_pregunta`) VALUES
	(1, '¿Cuándo viajas que te gusta más?'),
	(2, 'Sueles viajar solo o acompañado?'),
	(3, '¿Qué lugares te gustan más?'),
	(4, 'Alguna vez has pagado por guias para tus viajes?');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
