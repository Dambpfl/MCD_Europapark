-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour europapark
CREATE DATABASE IF NOT EXISTS `europapark` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `europapark`;

-- Listage de la structure de table europapark. assigne
CREATE TABLE IF NOT EXISTS `assigne` (
  `id_employe` int DEFAULT NULL,
  `id_attraction` int DEFAULT NULL,
  KEY `id_employe` (`id_employe`),
  KEY `id_attraction` (`id_attraction`),
  CONSTRAINT `FK__attraction2` FOREIGN KEY (`id_attraction`) REFERENCES `attraction` (`id_attraction`),
  CONSTRAINT `FK__employe` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.assigne : ~7 rows (environ)
INSERT INTO `assigne` (`id_employe`, `id_attraction`) VALUES
	(4, 1),
	(5, 1),
	(6, 1),
	(1, 3),
	(3, 3),
	(2, 2),
	(7, 4);

-- Listage de la structure de table europapark. attraction
CREATE TABLE IF NOT EXISTS `attraction` (
  `id_attraction` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `description` text,
  `capaciteMax` int DEFAULT NULL,
  `duree` int DEFAULT NULL,
  `id_categorie` int DEFAULT NULL,
  `id_intensite` int DEFAULT NULL,
  PRIMARY KEY (`id_attraction`),
  KEY `id_categorie` (`id_categorie`),
  KEY `id_intensite` (`id_intensite`),
  CONSTRAINT `FK_attraction_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`),
  CONSTRAINT `FK_attraction_intensite` FOREIGN KEY (`id_intensite`) REFERENCES `intensite` (`id_intensite`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.attraction : ~4 rows (environ)
INSERT INTO `attraction` (`id_attraction`, `nom`, `description`, `capaciteMax`, `duree`, `id_categorie`, `id_intensite`) VALUES
	(1, 'Blue fire', 'Megacoaster de 0 à 100 en 2,5 secondes', 20, 140, 3, 3),
	(2, 'Parcours de tacots', 'Jeunes et moins jeunes, roulez en Ford TS.', 4, 158, 2, 1),
	(3, 'L´Oie d´Or', 'Spectacle programmé avec de superbes effets spéciaux. 13 personnages animés te plongeront au coeur de ce conte. Émerveillement garanti !', 15, 600, 1, 1),
	(4, 'Poseidon grand huit aquatique', 'La mythologie grecque réserve bien des surprises - et le dieu des mers t\'a préparé une véritable odyssée : Ton escapade sauvage dans l\'univers aquatique de Poséidon débute dans un temple antique. Ensuite, en route vers le firmament avant de replonger dans l\'océan ! Ou comme le disait ce bon vieux Héraclite, grand fan de sensations fortes : Πάντα ῥεῖ - tout coule (de source) !', 8, 290, 3, 2);

-- Listage de la structure de table europapark. avis
CREATE TABLE IF NOT EXISTS `avis` (
  `id_avis` int NOT NULL AUTO_INCREMENT,
  `note` int DEFAULT NULL,
  `commentaire` text,
  `dateAvis` datetime DEFAULT NULL,
  `id_attraction` int DEFAULT NULL,
  `id_visiteur` int DEFAULT NULL,
  PRIMARY KEY (`id_avis`),
  KEY `id_attraction` (`id_attraction`),
  KEY `id_visiteur` (`id_visiteur`),
  CONSTRAINT `FK_avis_attraction` FOREIGN KEY (`id_attraction`) REFERENCES `attraction` (`id_attraction`),
  CONSTRAINT `FK_avis_visiteur` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id_visiteur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.avis : ~1 rows (environ)
INSERT INTO `avis` (`id_avis`, `note`, `commentaire`, `dateAvis`, `id_attraction`, `id_visiteur`) VALUES
	(1, 9, 'C\'était génial', '2024-08-15 11:30:58', 1, 1);

-- Listage de la structure de table europapark. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.categorie : ~3 rows (environ)
INSERT INTO `categorie` (`id_categorie`, `nomCategorie`) VALUES
	(1, 'Spectacle'),
	(2, 'Manège'),
	(3, 'Grand Huit');

-- Listage de la structure de table europapark. contient
CREATE TABLE IF NOT EXISTS `contient` (
  `id_attraction` int DEFAULT NULL,
  `id_forfait` int DEFAULT NULL,
  KEY `id_attraction` (`id_attraction`),
  KEY `id_forfait` (`id_forfait`),
  CONSTRAINT `FK__attraction` FOREIGN KEY (`id_attraction`) REFERENCES `attraction` (`id_attraction`),
  CONSTRAINT `FK__forfait` FOREIGN KEY (`id_forfait`) REFERENCES `forfait` (`id_forfait`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.contient : ~4 rows (environ)
INSERT INTO `contient` (`id_attraction`, `id_forfait`) VALUES
	(1, 1),
	(3, 3),
	(2, 3),
	(4, 2);

-- Listage de la structure de table europapark. employe
CREATE TABLE IF NOT EXISTS `employe` (
  `id_employe` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id_employe`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `FK_employe_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.employe : ~7 rows (environ)
INSERT INTO `employe` (`id_employe`, `prenom`, `nom`, `id_role`) VALUES
	(1, 'Emma', 'Durand', 2),
	(2, 'Lucas', 'Martin', 1),
	(3, 'Clara', 'Lefèvre', 2),
	(4, 'Hugo', 'Bernard', 1),
	(5, 'Sophie', 'Dubois', 1),
	(6, 'Thomas', 'Petit', 1),
	(7, 'Camille', 'Morel', 1);

-- Listage de la structure de table europapark. experience
CREATE TABLE IF NOT EXISTS `experience` (
  `id_experience` int NOT NULL AUTO_INCREMENT,
  `nomExp` varchar(50) DEFAULT NULL,
  `dureeExp` int DEFAULT NULL,
  `prixExp` decimal(20,6) DEFAULT NULL,
  `id_forfait` int DEFAULT NULL,
  PRIMARY KEY (`id_experience`),
  KEY `id_forfait` (`id_forfait`),
  CONSTRAINT `FK_experience_forfait` FOREIGN KEY (`id_forfait`) REFERENCES `forfait` (`id_forfait`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.experience : ~3 rows (environ)
INSERT INTO `experience` (`id_experience`, `nomExp`, `dureeExp`, `prixExp`, `id_forfait`) VALUES
	(1, 'Visite VIP', 120, 200.000000, 2),
	(2, 'Repas thématiques', 30, 150.000000, 3),
	(3, 'Accès rapide aux attractions', 1440, 400.000000, 1);

-- Listage de la structure de table europapark. forfait
CREATE TABLE IF NOT EXISTS `forfait` (
  `id_forfait` int NOT NULL AUTO_INCREMENT,
  `nomForfait` varchar(50) DEFAULT NULL,
  `id_reservation` int DEFAULT NULL,
  PRIMARY KEY (`id_forfait`),
  KEY `id_reservation` (`id_reservation`),
  CONSTRAINT `FK_forfait_reservation` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.forfait : ~3 rows (environ)
INSERT INTO `forfait` (`id_forfait`, `nomForfait`, `id_reservation`) VALUES
	(1, 'Duo', 1),
	(2, 'Groupe', 3),
	(3, 'Famille', 2);

-- Listage de la structure de table europapark. intensite
CREATE TABLE IF NOT EXISTS `intensite` (
  `id_intensite` int NOT NULL AUTO_INCREMENT,
  `nomIntensite` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_intensite`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.intensite : ~3 rows (environ)
INSERT INTO `intensite` (`id_intensite`, `nomIntensite`) VALUES
	(1, 'Familiale'),
	(2, 'Modérée'),
	(3, 'Extrême');

-- Listage de la structure de table europapark. reservation
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `dateReservation` datetime DEFAULT NULL,
  `nbPersonne` int DEFAULT NULL,
  `id_visiteur` int DEFAULT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `id_visiteur` (`id_visiteur`),
  CONSTRAINT `FK_reservation_visiteur` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id_visiteur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.reservation : ~3 rows (environ)
INSERT INTO `reservation` (`id_reservation`, `dateReservation`, `nbPersonne`, `id_visiteur`) VALUES
	(1, '2024-03-04 10:09:20', 2, 2),
	(2, '2025-01-04 07:12:45', 5, 1),
	(3, '2025-01-04 13:15:13', 6, 3);

-- Listage de la structure de table europapark. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `nomRole` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.role : ~2 rows (environ)
INSERT INTO `role` (`id_role`, `nomRole`) VALUES
	(1, 'Opérateur de manège'),
	(2, 'Guide VIP');

-- Listage de la structure de table europapark. visiteur
CREATE TABLE IF NOT EXISTS `visiteur` (
  `id_visiteur` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `numeroTel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_visiteur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table europapark.visiteur : ~3 rows (environ)
INSERT INTO `visiteur` (`id_visiteur`, `prenom`, `nom`, `email`, `numeroTel`) VALUES
	(1, 'Rousseau', 'Nathan', 'rousseau@visiteur.com', '0610203040'),
	(2, 'Garnier', 'Léa', 'garnier@visiteur.com', '0620304060'),
	(3, 'Lambert', 'Julien', 'lambert@visiteur.com', '0623351452');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
