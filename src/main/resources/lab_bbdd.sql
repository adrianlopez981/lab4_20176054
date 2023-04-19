-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: lab4
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aerolinea`
--

DROP TABLE IF EXISTS `aerolinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aerolinea` (
  `idaerolinea` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  PRIMARY KEY (`idaerolinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `idreserva` int NOT NULL,
  `fecha_reserva` datetime NOT NULL,
  `precio_total` decimal(10,0) NOT NULL,
  `estado_pago` varchar(45) NOT NULL,
  `vuelo_idvuelo` int NOT NULL,
  `user_iduser` int NOT NULL,
  PRIMARY KEY (`idreserva`),
  KEY `fk_reserva_vuelo1_idx` (`vuelo_idvuelo`),
  KEY `fk_reserva_user1_idx` (`user_iduser`),
  CONSTRAINT `fk_reserva_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`),
  CONSTRAINT `fk_reserva_vuelo1` FOREIGN KEY (`vuelo_idvuelo`) REFERENCES `vuelo` (`idvuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo` (
  `idvuelo` int NOT NULL,
  `origen` varchar(45) NOT NULL,
  `destino` varchar(45) NOT NULL,
  `fecha_salida` datetime NOT NULL,
  `fecha_llegada` datetime NOT NULL,
  `duracion` int NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `asientos_disponibles` int NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `aerolinea_idaerolinea` int NOT NULL,
  PRIMARY KEY (`idvuelo`),
  KEY `fk_vuelo_aerolinea_idx` (`aerolinea_idaerolinea`),
  CONSTRAINT `fk_vuelo_aerolinea` FOREIGN KEY (`aerolinea_idaerolinea`) REFERENCES `aerolinea` (`idaerolinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'lab4'
--

--
-- Dumping routines for database 'lab4'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-18 21:56:45

INSERT INTO `lab4`.`user` (`iduser`, `username`, `email`, `password`) VALUES ('1', 'rodrigo', 'rodrigo@pucp.pe', 'rodrigo');
INSERT INTO `lab4`.`user` (`iduser`, `username`, `email`, `password`) VALUES ('2', 'hiro', 'hiro@pucp.pe', 'hiro');
INSERT INTO `lab4`.`user` (`iduser`, `username`, `email`, `password`) VALUES ('3', 'brenda', 'brenda@pucp.pe', 'brenda');
INSERT INTO `lab4`.`user` (`iduser`, `username`, `email`, `password`) VALUES ('4', 'jesus', 'jesus@pucp.pe', 'jesus');
INSERT INTO `lab4`.`user` (`iduser`, `username`, `email`, `password`) VALUES ('5', 'stefano', 'stefano@pucp.pe', 'stefano');
 
 
INSERT INTO `lab4`.`aerolinea` (`idaerolinea`, `nombre`, `codigo`) VALUES ('1', 'latam', 'LA');
INSERT INTO `lab4`.`aerolinea` (`idaerolinea`, `nombre`, `codigo`) VALUES ('2', 'star peru', '2I');
INSERT INTO `lab4`.`aerolinea` (`idaerolinea`, `nombre`, `codigo`) VALUES ('3', 'atsa airlines', '4A');
INSERT INTO `lab4`.`aerolinea` (`idaerolinea`, `nombre`, `codigo`) VALUES ('4', 'volaris', 'Y4');
INSERT INTO `lab4`.`aerolinea` (`idaerolinea`, `nombre`, `codigo`) VALUES ('5', 'jetSmart Peru', 'JZ');
INSERT INTO `lab4`.`aerolinea` (`idaerolinea`, `nombre`, `codigo`) VALUES ('6', 'Viva air', 'VV');
INSERT INTO `lab4`.`aerolinea` (`idaerolinea`, `nombre`, `codigo`) VALUES ('7', 'Wingo', 'P5');
 
 
 
INSERT INTO `lab4`.`vuelo` (`idvuelo`, `origen`, `destino`, `fecha_salida`, `fecha_llegada`, `duracion`, `precio`, `aerolinea_idaerolinea`, `asientos_disponibles`, `descripcion`) VALUES ('1', 'lima', 'tarapoto', '2023-04-04 08:15.000', '2023-04-04 09:15.000', '60', '25', '1','95','Quien visite Tarapoto no puede dejar de probar la exquisita gastronomía que caracteriza a esta ciudad peruana, entre los platos que el visitante podrá degustar, en los diferentes restaurantes, ferias y comunidades nativas, se encuentran el Avispajuane y el juane de gallina');
INSERT INTO `lab4`.`vuelo` (`idvuelo`, `origen`, `destino`, `fecha_salida`, `fecha_llegada`, `duracion`, `precio`, `aerolinea_idaerolinea`, `asientos_disponibles`,`descripcion`) VALUES ('2', 'lima', 'ayacucho', '2023-04-05 10:15:00', '2023-04-05 11:00:00', '45', '25', '4','92','Ayacucho es naturaleza y fiesta. Recorre sus casonas e iglesias coloniales como la Catedral y el templo de Santo Domingo; disfruta de sus fiestas llenas de color y diviértete en Semana Santa con un pueblo arraigado en su fe. Conoce la tradición alfarera de la mano de sus artesanos y deja que sus paisajes de desbordada naturaleza viva te desconecten. Ayacucho, un lugar que merece ser recorrido en su totalidad, te espera.');
INSERT INTO `lab4`.`vuelo` (`idvuelo`, `origen`, `destino`, `fecha_salida`, `fecha_llegada`, `duracion`, `precio`, `aerolinea_idaerolinea`, `asientos_disponibles`,`descripcion`) VALUES ('3', 'lima', 'bogota', '2023-04-05 10:15:00', '2023-04-05 13:15:00', '270', '120', '2','85','Definitivamente el turismo en Bogotá en más que Monserrate y la Candelaria, hay muchas excursiones por senderos mágicos que puedes realizar. Estas actividades también se conocen como: senderismo, excursionismo, caminata, montañismo, hiking o trekking.');
INSERT INTO `lab4`.`vuelo` (`idvuelo`, `origen`, `destino`, `fecha_salida`, `fecha_llegada`, `duracion`, `precio`, `aerolinea_idaerolinea`, `asientos_disponibles`,`descripcion`) VALUES ('4', 'lima ', 'cajamarca', '2023-04-12 10:15:00', '2023-04-12 11:30:00', '75', '45', '3','68','En esta región se encuentran importantes monumentos históricos como el canal de Cumbemayo, las ventanillas de Otuzco, el cuarto de rescate, iglesia, museo y cripta de San Francisco, iglesia Belén, iglesia San Pedro y San Jorge, la Catedral de Cajamarca, y el parque forestal más grande del Perú: la granja de Porcón.');
INSERT INTO `lab4`.`vuelo` (`idvuelo`, `origen`, `destino`, `fecha_salida`, `fecha_llegada`, `duracion`, `precio`, `aerolinea_idaerolinea`, `asientos_disponibles`,`descripcion`) VALUES ('5', 'lima', 'madrid', '2023-04-22 06:15:00', '2023-04-22 17:50:00', '700', '700', '2','80','Es uno de los dichos más famosos sobre la ciudad, el cielo de Madrid tiene ese color azul intenso que le hace tan característico. Como capital de España desde 1561, alberga las más importantes instituciones del Estado al ser sede del Gobierno central, además de ser la residencia oficial de los Reyes y de grandes organismos nacionales, como la Real Academia Española de la Lengua; e internacionales, como la Organización Mundial del Turismo');
INSERT INTO `lab4`.`vuelo` (`idvuelo`, `origen`, `destino`, `fecha_salida`, `fecha_llegada`, `duracion`, `precio`, `aerolinea_idaerolinea`, `asientos_disponibles`,`descripcion`) VALUES ('6', 'bogota', 'lima', '2023-05-02 09:10:00', '2023-05-02 10:10:00', '60', '45', '3','94','Los alrededores de Lima son excepcionales. Hay expediciones que parten del Callao para observar los lobos marinos y fauna alada que alborotan las islas Palomino, mientras que otros grupos más audaces salen a divisar ballenas en el zócalo continental. Hacia el sur se erige Pachacamac, hermoso santuario prehispánico que fuera el lugar de peregrinaje más importante del antiguo Perú. Y al norte de la capital se estira Caral la ciudad más antigua de América, construida hace 5 mil años.');
INSERT INTO `lab4`.`vuelo` (`idvuelo`, `origen`, `destino`, `fecha_salida`, `fecha_llegada`, `duracion`, `precio`, `aerolinea_idaerolinea`, `asientos_disponibles`,`descripcion`) VALUES ('7', 'lima', 'pucallpa', '2023-06-12 09:10:00', '2023-06-12 10:10:00', '60', '45', '2', '45','Una de las lagunas más grandes de la amazonía, cuyos alrededores albergan lugares ricos en flora y fauna. Es un lugar ideal para conocer a los nativos, como también albergues turísticos y restaurantes de comida típica.');
 
 
 
 
 
INSERT INTO `lab4`.`reserva` (`idreserva`, `fecha_reserva`, `precio_total`, `estado_pago`, `user_iduser`, `vuelo_idvuelo`) VALUES ('1', '2023-01-01 10:15:00', '25', 'procesado', '1', '3');
INSERT INTO `lab4`.`reserva` (`idreserva`, `fecha_reserva`, `precio_total`, `estado_pago`, `user_iduser`, `vuelo_idvuelo`) VALUES ('2', '2023-02-03 12:15:00', '120', 'falla', '2', '1');
INSERT INTO `lab4`.`reserva` (`idreserva`, `fecha_reserva`, `precio_total`, `estado_pago`, `user_iduser`, `vuelo_idvuelo`) VALUES ('3', '2023-02-14 08:05:00', '25', 'procesado', '3', '5');



