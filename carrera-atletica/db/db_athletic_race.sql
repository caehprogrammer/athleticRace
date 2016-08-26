-- --------------------------------------------------------
-- Host:                         10.10.40.5
-- Versión del servidor:         5.6.17 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para db_athletic_race
CREATE DATABASE IF NOT EXISTS `db_athletic_race` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_athletic_race`;


-- Volcando estructura para procedimiento db_athletic_race.GET_PARTICIPANS
DROP PROCEDURE IF EXISTS `GET_PARTICIPANS`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `GET_PARTICIPANS`(IN `pt_action` VARCHAR(50), IN `pt_competitor_number` INT)
BEGIN
	CASE pt_action
		WHEN "allParticipants"
			THEN
				SELECT
					tb_participants.pk_participant,
					DATE(tb_participants.fl_date_register) AS fl_date_register,
					tb_participants.fl_date_born,
					CONCAT(YEAR(CURDATE())-YEAR(tb_participants.fl_date_born)+IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(tb_participants.fl_date_born,'%m-%d'), 0, -1))  AS fl_age,
					UPPER(tb_participants.fl_name) AS fl_name,
					UPPER(tb_participants.fl_patern_name) AS fl_patern_name,
					UPPER(tb_participants.fl_matern_name) AS fl_matern_name,
					tb_participants.fl_mail,
					UPPER(tb_participants.fl_cell_phone) AS fl_cell_phone,
					UPPER(tb_participants.fl_gender) AS fl_gender,
					tb_participants.fl_distance,
					UPPER(tb_participants.fl_category) AS fl_category,
					tb_participants.fl_competitor_number,
					tb_participants.fl_ticket_number,
					tb_participants.fl_date_register,
					UPPER(tb_participants.fl_size_tshirt) AS fl_size_tshirt,
					tb_participants.fk_institution,
					UPPER(tb_participants.fl_observations) AS fl_observations,
					tb_participants.fl_tshirt
				FROM
					tb_participants
				WHERE TRUE
				ORDER BY
					tb_participants.fl_ticket_number;
		WHEN "printReport"
			THEN
				SELECT
					CONCAT(DAY(NOW()),' de ', NAME_MONTH(),' del ', YEAR(NOW())) AS fl_date_print,
					tb_participants.pk_participant,
					CONCAT(tb_participants.fl_name,' ',tb_participants.fl_patern_name,' ',tb_participants.fl_matern_name) AS fl_name,
					CONCAT(DATE_FORMAT(IFNULL(DATE(tb_participants.fl_date_born),DATE(NOW())),'%d-%m-%Y')) AS fl_date_born,
					CONCAT(YEAR(CURDATE())-YEAR(tb_participants.fl_date_born)+IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(tb_participants.fl_date_born,'%m-%d'), 0, -1))  AS fl_age,
					CASE tb_participants.fl_gender
						WHEN 1
							THEN 
								"Hombre"
						ELSE
							"Mujer"
					END AS  fl_gender,
					tb_participants.fk_institution,
					tb_participants.fl_category,
					CASE tb_participants.fl_gender
						WHEN 1
							THEN 
								"Varonil"
						ELSE
							"Femenil"
					END AS fl_branch,
					CASE tb_participants.fl_distance
						WHEN 3
							THEN "3 Kilómentros"
						ELSE
							"5 Kilómetros"
					END AS fl_distance,
					CASE 
						WHEN fl_competitor_number>=1 AND fl_competitor_number<=9
							THEN
								CONCAT('000',tb_participants.fl_competitor_number)
						WHEN fl_competitor_number>=10 AND fl_competitor_number<=99
							THEN
								CONCAT('00',tb_participants.fl_competitor_number)
						WHEN fl_competitor_number>=100 AND fl_competitor_number<=999
							THEN
								CONCAT('0',tb_participants.fl_competitor_number)
						WHEN fl_competitor_number>=1000
							THEN
								CONCAT(tb_participants.fl_competitor_number)
					END AS fl_competitor_number 
				FROM
					tb_participants
				WHERE TRUE
					AND tb_participants.fl_competitor_number=pt_competitor_number;
		WHEN "byCompetitorNumber"
			THEN
				SELECT
					tb_participants.*
				FROM
					tb_participants
				WHERE TRUE
					AND tb_participants.fl_competitor_number=pt_competitor_number;
	END CASE;
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_athletic_race.GET_SYSTEM_USERS
DROP PROCEDURE IF EXISTS `GET_SYSTEM_USERS`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `GET_SYSTEM_USERS`(IN `pt_action` VARCHAR(50), IN `pt_user_name` VARCHAR(50), IN `pt_password` VARCHAR(50))
BEGIN
	CASE pt_action
		WHEN "login"
			THEN
				SELECT
					tb_system_users.*
				FROM
					tb_system_users
				WHERE TRUE
					AND tb_system_users.fl_user_name=pt_user_name
					AND tb_system_users.fl_password=pt_password;
	END CASE;
END//
DELIMITER ;


-- Volcando estructura para función db_athletic_race.NAME_MONTH
DROP FUNCTION IF EXISTS `NAME_MONTH`;
DELIMITER //
CREATE DEFINER=`root`@`%` FUNCTION `NAME_MONTH`() RETURNS varchar(20) CHARSET utf8
BEGIN
	DECLARE MONTH_NAME VARCHAR(12);
	CASE MONTH(NOW())
		WHEN 1 THEN SET MONTH_NAME = "Enero";
		WHEN 2 THEN SET MONTH_NAME = "Febrero";
		WHEN 3 THEN SET MONTH_NAME = "Marzo";
		WHEN 4 THEN SET MONTH_NAME = "Abril";
		WHEN 5 THEN SET MONTH_NAME = "Mayo";
		WHEN 6 THEN SET MONTH_NAME = "Junio";
		WHEN 7 THEN SET MONTH_NAME = "Julio";
		WHEN 8 THEN SET MONTH_NAME = "Agosto";
		WHEN 9 THEN SET MONTH_NAME = "Septiembre";
		WHEN 10 THEN SET MONTH_NAME = "Octubre";
		WHEN 11 THEN SET MONTH_NAME = "Noviembre";
		WHEN 12 THEN SET MONTH_NAME = "Diciembre";
	END CASE;
	RETURN MONTH_NAME;
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_athletic_race.SET_PASRTICIPANT
DROP PROCEDURE IF EXISTS `SET_PASRTICIPANT`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `SET_PASRTICIPANT`(IN `pt_action` VARCHAR(50), IN `pt_pk_participant` BIGINT, IN `pt_name` VARCHAR(50), IN `pt_patern_name` VARCHAR(50), IN `pt_matern_name` VARCHAR(50), IN `pt_mail` VARCHAR(50), IN `pt_cell_phone` VARCHAR(50), IN `pt_date_born` VARCHAR(50), IN `pt_age` INT, IN `pt_gender` INT, IN `pt_distance` INT, IN `pt_category` VARCHAR(50), IN `pt_competitor_number` INT, IN `pt_ticket_number` INT, IN `pt_size_tshirt` VARCHAR(50), IN `pt_fk_institution` BIGINT, IN `pt_observations` TEXT, IN `pt_tshirt` BIT)
BEGIN
	CASE pt_action
		WHEN "insert"
			THEN
				INSERT INTO
					tb_participants(
						fl_name,  
						fl_patern_name, 
						fl_matern_name, 
						fl_mail, 
						fl_cell_phone, 
						fl_date_born, 
						fl_age, 
						fl_gender, 
						fl_distance, 
						fl_category, 
						fl_competitor_number, 
						fl_ticket_number, 
						fl_size_tshirt, 
						fk_institution, 
						fl_observations
					)
				VALUES(
					pt_name, 
               pt_patern_name,  
               pt_matern_name, 
               pt_mail, 
               pt_cell_phone, 
               pt_date_born, 
               pt_age, 
               pt_gender, 
               pt_distance, 
               pt_category, 
               pt_competitor_number, 
               pt_ticket_number, 
               pt_size_tshirt, 
               pt_fk_institution, 
               pt_observations
				);
		WHEN "update"
			THEN
				UPDATE 	
					tb_participants
				SET
					fl_name=pt_name, 
					fl_patern_name=pt_patern_name, 
					fl_matern_name=pt_matern_name, 
					fl_mail=pt_mail, 
					fl_cell_phone=pt_cell_phone, 
					#fl_date_born=pt_date_born, 
					#fl_age=pt_age, 
					fl_gender=pt_gender,
					#fl_distance=pt_distance, 
					#fl_category=pt_category, 
					#fl_competitor_number=pt_competitor_number, 
					#fl_ticket_number=pt_ticket_number, 
					#fl_size_tshirt=pt_size_tshirt, 
					#fk_institution=pt_institution, 
					#fl_observations=pt_observations
					fl_tshirt=pt_tshirt
				WHERE TRUE
					AND tb_participants.pk_participant=pt_pk_participant;			
		WHEN "delete"
			THEN
				DELETE FROM	
					tb_participants
				WHERE TRUE
					AND tb_participants.pk_participant=pt_pk_participant;			
	END CASE;
END//
DELIMITER ;


-- Volcando estructura para tabla db_athletic_race.tb_participants
DROP TABLE IF EXISTS `tb_participants`;
CREATE TABLE IF NOT EXISTS `tb_participants` (
  `pk_participant` bigint(20) NOT NULL AUTO_INCREMENT,
  `fl_name` varchar(200) NOT NULL,
  `fl_patern_name` varchar(200) NOT NULL,
  `fl_matern_name` varchar(200) NOT NULL,
  `fl_mail` varchar(200) NOT NULL,
  `fl_cell_phone` varchar(20) NOT NULL,
  `fl_date_born` date DEFAULT NULL,
  `fl_age` int(11) NOT NULL,
  `fl_gender` tinyint(4) NOT NULL,
  `fl_distance` tinyint(4) NOT NULL,
  `fl_category` varchar(50) NOT NULL,
  `fl_competitor_number` mediumint(8) unsigned NOT NULL,
  `fl_ticket_number` mediumint(8) unsigned NOT NULL,
  `fl_date_register` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fl_size_tshirt` varchar(50) NOT NULL,
  `fk_institution` bigint(20) DEFAULT NULL,
  `fl_observations` text NOT NULL,
  `fl_tshirt` bit(1) DEFAULT b'0',
  PRIMARY KEY (`pk_participant`),
  UNIQUE KEY `fl_mail` (`fl_mail`),
  UNIQUE KEY `fl_ticket_number` (`fl_ticket_number`),
  UNIQUE KEY `fl_competitor_number` (`fl_competitor_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla db_athletic_race.tb_system_users
DROP TABLE IF EXISTS `tb_system_users`;
CREATE TABLE IF NOT EXISTS `tb_system_users` (
  `pk_user` bigint(20) NOT NULL AUTO_INCREMENT,
  `fl_user_name` varchar(50) DEFAULT NULL,
  `fl_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
