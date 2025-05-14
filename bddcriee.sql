-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 08 mars 2024 à 22:12
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bddcriee`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE `acheteur` (
  `idAcheteur` int(11) NOT NULL,
  `raisonSociale` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `numHabilitation` int(11) NOT NULL,
  `Bloquage` tinyint(1) NOT NULL DEFAULT 0,
  `nomAcheteur` varchar(250) NOT NULL,
  `mailAcheteur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`idAcheteur`, `raisonSociale`, `adresse`, `numHabilitation`, `Bloquage`, `nomAcheteur`, `mailAcheteur`) VALUES
(1, NULL, NULL, 1, 0, 'Yuh Dekih', 'yuh.nugen@iz.com'),
(2, NULL, NULL, 2, 0, 'Mohrir Rokah', 'mehr.kami@nugen.net'),
(3, NULL, NULL, 3, 0, 'Lucy Hailstone', 'iz.diamondust@alius.net'),
(4, NULL, NULL, 4, 0, 'Saki Saki', 'saki.saki.kanojo.mo.kanojo@anime.net'),
(5, NULL, NULL, 5, 0, 'Akiyama Cocona', 'cocona.xgalx@xg.com'),
(6, NULL, NULL, 6, 0, 'Akiyama Mikazuki', 'mika.aki@tt.glojp'),
(7, NULL, NULL, 7, 0, 'Akiyama Heisuke', 'aki.heitodo@rgg.net');

-- --------------------------------------------------------

--
-- Structure de la table `association`
--

CREATE TABLE `association` (
  `id` int(11) NOT NULL,
  `nomAsso` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `association`
--

INSERT INTO `association` (`id`, `nomAsso`) VALUES
(1, 'Les Poissons'),
(2, 'Poisson libre'),
(3, 'Sor');

-- --------------------------------------------------------

--
-- Structure de la table `bac`
--

CREATE TABLE `bac` (
  `idBac` int(11) NOT NULL,
  `TypeBac` varchar(50) DEFAULT NULL,
  `nomBac` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `bac`
--

INSERT INTO `bac` (`idBac`, `TypeBac`, `nomBac`) VALUES
(4, 'B', 'Bac de Bar'),
(1, 'B', 'Bac de Saumon'),
(2, 'F', 'Bac de Requin');

-- --------------------------------------------------------

--
-- Structure de la table `bateau`
--

CREATE TABLE `bateau` (
  `idBateaux` int(10) UNSIGNED NOT NULL,
  `nomBateaux` varchar(50) DEFAULT NULL,
  `immatriculationBateaux` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `bateau`
--

INSERT INTO `bateau` (`idBateaux`, `nomBateaux`, `immatriculationBateaux`) VALUES
(1, 'Altair', 'Ad 895511'),
(2, 'Macareux', 'Ad 584873'),
(3, 'Avel Ar Mor', 'Ad 584930'),
(4, 'Plujadur', 'Ad 627846'),
(5, 'Gwaien', 'Ad 730414'),
(6, 'L Estran', 'Ad 815532'),
(7, 'Le Petit Corse', 'Ad 584826'),
(8, 'Le Vorlen', 'Ad 614221'),
(9, 'Les Copains d Abord', 'Ad 584846'),
(10, 'Tu Pe Du', 'Ad 584871'),
(11, 'Korrigan', 'Ad 895472'),
(12, 'Ar Guevel', 'Ad 895479'),
(13, 'Broceliande', 'Ad 895519'),
(14, 'L Aventurier', 'Ad 584865'),
(15, 'L Oceanide', 'Ad 741312'),
(16, 'L Arche d alliance', 'Ad 584830'),
(17, 'Sirocco', 'Ad 715792'),
(18, 'Ondine', 'Ad 584772'),
(19, 'Chimere', 'Ad 895516');

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

CREATE TABLE `espece` (
  `idEspece` int(10) UNSIGNED NOT NULL,
  `nomEspece` varchar(50) DEFAULT NULL,
  `nomScientifiqueEspece` varchar(50) DEFAULT NULL,
  `nomCourtEspece` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `espece`
--

INSERT INTO `espece` (`idEspece`, `nomEspece`, `nomScientifiqueEspece`, `nomCourtEspece`) VALUES
(31020, 'Turbot', 'Psetta maxima', 'TURBO'),
(31030, 'Barbue', 'Scophthalmus rhombus', 'BARBU'),
(31150, 'Plie ou carrelet', 'Pleuronectes Platessa', 'PLIE'),
(32020, 'Merlu', 'Merluccius bilinearis', 'MERLU'),
(32050, 'Cabillaud', 'Gadus Morhua Morhue', 'CABIL'),
(32130, 'Lieu Jaune de Ligne', 'Pollachius pollachius', 'LJAUL'),
(32140, 'Lieu Noir', 'Lophius Virens', 'LNOI'),
(32230, 'Lingue franche', 'Molva Molva', 'LINGU'),
(33020, 'Congre commun', 'Conger conger', 'CONGR'),
(33080, 'Saint Pierre', 'Zeus Faber', 'STPIE'),
(33090, 'Bar de Chalut', 'Dicentrarchus Labrax', 'BARCH'),
(33091, 'Bar de Ligne', 'Dicentrarchus Labrax', 'BARLI'),
(33110, 'Mérou ou cernier', 'Polyprion Americanus', 'CERNI'),
(33120, 'Mérou noir', 'Epinephelus Guaza', 'MEROU'),
(33410, 'Rouget Barbet', 'Mullus SPP', 'ROUGT'),
(33450, 'Dorade royale chalut', 'Sparus Aurata', 'DORAC'),
(33451, 'Dorade royale ligne', 'Sparus Aurata', 'DORAL'),
(33480, 'Dorade rose', 'Pagellus bogaraveo', 'DORAD'),
(33490, 'Pageot Acarne', 'Pagellus Acarne', 'PAGEO'),
(33500, 'Pageot Commun', 'Pagellus Arythrinus', 'PAGEC'),
(33580, 'Vieille', 'LabrusBergylta', 'VIEIL'),
(33730, 'Grondin gris', 'Eutrigla Gurnadus', 'GRONG'),
(33740, 'Grondin rouge', 'Aspitrigla Cuculus', 'GRONR'),
(33760, 'Baudroie', 'Lophius Piscatorus', 'BAUDR'),
(33761, 'Baudroie Maigre', 'Lophius Piscicatorius', 'BAUDM'),
(33790, 'Grondin Camard', 'Trigloporus Lastoviza', 'GRONC'),
(33800, 'Grondin Perlon', 'Trigla Lucerna', 'GRONP'),
(34150, 'Mulet', 'Mugil SPP', 'MULET'),
(35040, 'Sardine atlantique', 'Sardina Pilchardus', 'SARDI'),
(37050, 'Maquereau', 'Scomber Scombrus', 'MAQUE'),
(38150, 'Raie douce', 'Raja Montagui', 'RAIE'),
(38160, 'Raie Pastenague commune', 'Dasyatis Pastinaca', 'RAIEP'),
(42020, 'Crabe tourteau de casier', 'Cancer Pagurus', 'CRABS'),
(42021, 'Crabe tourteau de chalut', 'Cancer Pagurus', 'CRABL'),
(42040, 'Araignée de mer casier', 'Maja squinado', 'ARAIS'),
(42041, 'Araignée de mer chalut', 'Maja squinado', 'ARAIL'),
(43010, 'Homard', 'Hammarus gammorus', 'HOMAR'),
(43030, 'Langouste rouge', 'Palinurus elephas', 'LANGR'),
(44010, 'Langoustine', 'Nephrops norvegicus', 'LANGT'),
(57010, 'Seiche', 'Sepia SPP', 'SEICH'),
(57020, 'Calmar', 'Loligo SPP', 'CALAM'),
(57050, 'Poulpe', 'Octopus SPP', 'POULP');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `idFacture` int(10) UNSIGNED NOT NULL,
  `montantFacture` double DEFAULT NULL,
  `StatusFacture` varchar(50) DEFAULT NULL,
  `dateFacturePayer` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`idFacture`, `montantFacture`, `StatusFacture`, `dateFacturePayer`) VALUES
(1, 250, 'En cours', NULL),
(2, 140, 'Payer', '2022-09-09'),
(3, 800, 'Payer', '2022-09-20'),
(4, 599, 'En cours', NULL),
(5, 1599, 'En cours', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE `lot` (
  `id` decimal(3,0) UNSIGNED NOT NULL,
  `idDatePeche` date NOT NULL,
  `idBateau` int(10) UNSIGNED NOT NULL,
  `idLot` int(10) UNSIGNED NOT NULL,
  `idEspece` int(10) UNSIGNED NOT NULL,
  `idTaille` int(11) NOT NULL,
  `idPresentation` varchar(50) NOT NULL,
  `idQualite` char(10) NOT NULL,
  `idBac` int(11) NOT NULL,
  `poidsBrutLot` decimal(6,2) DEFAULT NULL,
  `prixPlancherLots` decimal(6,2) DEFAULT NULL,
  `prixDepartLots` decimal(6,2) DEFAULT NULL,
  `prixEcheresLots` double DEFAULT NULL,
  `dateEnchereLots` date DEFAULT NULL,
  `HeureDebutEnchereLots` datetime DEFAULT NULL,
  `codeEtatLots` char(1) DEFAULT NULL,
  `idAcheteurLots` int(11) DEFAULT NULL,
  `idFactureLots` int(10) UNSIGNED DEFAULT NULL,
  `nomLot` varchar(50) NOT NULL,
  `Bacnom` varchar(50) DEFAULT NULL,
  `StatuLot` varchar(50) DEFAULT NULL,
  `idAsso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`id`, `idDatePeche`, `idBateau`, `idLot`, `idEspece`, `idTaille`, `idPresentation`, `idQualite`, `idBac`, `poidsBrutLot`, `prixPlancherLots`, `prixDepartLots`, `prixEcheresLots`, `dateEnchereLots`, `HeureDebutEnchereLots`, `codeEtatLots`, `idAcheteurLots`, `idFactureLots`, `nomLot`, `Bacnom`, `StatuLot`, `idAsso`) VALUES
('7', '2022-07-25', 3, 7, 57020, 40, 'VID', 'A', 4, '3.00', NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, 'Septieme Lot', NULL, 'Vendu', NULL),
('8', '2022-07-25', 3, 8, 33090, 25, 'ET', 'A', 4, '3.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Huitieme Lot', NULL, 'Non vendu', 2),
('10', '2022-07-30', 11, 10, 33091, 30, 'ET', 'A', 4, '3.00', NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, 'Dixieme Lot', NULL, 'Vendu', NULL),
('9', '2023-06-24', 11, 9, 31030, 20, 'VID', 'B', 1, '3.00', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'Neuvieme Lot', NULL, 'Vendu', NULL),
('1', '2023-11-18', 1, 1, 42040, 10, 'ENT', 'B', 1, '5.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'Premier Lot', 'Bac de Saumon', 'Vendu', NULL),
('11', '2023-11-18', 1, 11, 33480, 20, 'ENT', 'A', 1, '6.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Onzième lot', NULL, 'Equarissage', NULL),
('2', '2023-11-18', 4, 2, 31030, 10, 'ET', 'E', 1, '3.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Deuxieme Lot', NULL, 'En vente', NULL),
('5', '2023-11-18', 4, 5, 31030, 15, 'ET', 'A', 1, '7.00', NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, 'cinquieme lot', NULL, 'Vendu', NULL),
('6', '2023-11-18', 4, 6, 33090, 20, 'ET', 'B', 1, '5.00', NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, 'Sixieme Lot', NULL, 'Vendu', NULL),
('3', '2023-11-18', 11, 2, 57020, 15, 'ET', 'A', 1, '5.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Deuxieme Lot', NULL, 'En vente', NULL),
('4', '2023-11-20', 11, 3, 31030, 15, 'ET', 'B', 2, '7.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Troisieme Lot', NULL, 'Equarissage', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `peche`
--

CREATE TABLE `peche` (
  `idBateau` int(10) UNSIGNED NOT NULL,
  `DatePeche` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `peche`
--

INSERT INTO `peche` (`idBateau`, `DatePeche`) VALUES
(1, '2022-07-18'),
(4, '2022-07-18'),
(9, '2022-07-18'),
(11, '2022-07-18'),
(11, '2022-07-20'),
(11, '2022-07-21'),
(11, '2022-07-23'),
(1, '2022-07-24'),
(11, '2022-07-24'),
(1, '2022-07-25'),
(3, '2022-07-25'),
(7, '2022-07-25'),
(11, '2022-07-25'),
(1, '2022-07-30'),
(3, '2022-07-30'),
(7, '2022-07-30'),
(11, '2022-07-30'),
(5, '2022-08-12'),
(9, '2022-08-12'),
(3, '2022-08-25'),
(11, '2022-08-25'),
(11, '2023-06-24'),
(1, '2023-11-18'),
(4, '2023-11-18'),
(11, '2023-11-18'),
(11, '2023-11-20');

-- --------------------------------------------------------

--
-- Structure de la table `presentation`
--

CREATE TABLE `presentation` (
  `idPresentation` varchar(50) NOT NULL,
  `libellePresentation` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `presentation`
--

INSERT INTO `presentation` (`idPresentation`, `libellePresentation`) VALUES
('ENT', 'Entier'),
('ET', 'Etété'),
('VID', 'Vidé');

-- --------------------------------------------------------

--
-- Structure de la table `qualite`
--

CREATE TABLE `qualite` (
  `idQualite` char(10) NOT NULL,
  `libelleQualite` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `qualite`
--

INSERT INTO `qualite` (`idQualite`, `libelleQualite`) VALUES
('A', 'glacé'),
('B', 'déclassé'),
('E', 'extra');

-- --------------------------------------------------------

--
-- Structure de la table `taille`
--

CREATE TABLE `taille` (
  `idTaille` int(11) NOT NULL,
  `specificationTaille` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `taille`
--

INSERT INTO `taille` (`idTaille`, `specificationTaille`) VALUES
(10, 'Taille de 10'),
(15, 'Taille de 15'),
(20, 'Taille de 20'),
(25, 'Taille de 25'),
(30, 'Taille de 30'),
(35, 'Taille de 35'),
(40, 'Taille de 40'),
(45, 'Taille de 45'),
(50, 'Taille de 50'),
(55, 'Taille de 55'),
(60, 'Taille de 60'),
(65, 'Taille de 65'),
(70, 'Taille de 70'),
(75, 'Taille de 75'),
(80, 'Taille de 80'),
(85, 'Taille de 85'),
(90, 'Taille de 90'),
(95, 'Taille de 95');

-- --------------------------------------------------------

--
-- Structure de la table `type_bac`
--

CREATE TABLE `type_bac` (
  `idTypeBac` int(11) NOT NULL,
  `Type_Bac` varchar(50) DEFAULT NULL,
  `Tare` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`idAcheteur`);

--
-- Index pour la table `association`
--
ALTER TABLE `association`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bac`
--
ALTER TABLE `bac`
  ADD PRIMARY KEY (`idBac`),
  ADD UNIQUE KEY `UC_BAC` (`TypeBac`,`nomBac`),
  ADD KEY `FK_BAC_NOMBAC` (`nomBac`);

--
-- Index pour la table `bateau`
--
ALTER TABLE `bateau`
  ADD PRIMARY KEY (`idBateaux`);

--
-- Index pour la table `espece`
--
ALTER TABLE `espece`
  ADD PRIMARY KEY (`idEspece`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`idFacture`);

--
-- Index pour la table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`idDatePeche`,`idBateau`,`idLot`),
  ADD KEY `idBateau` (`idBateau`,`idDatePeche`,`idLot`),
  ADD KEY `FK_LOT_ESPECE` (`idEspece`),
  ADD KEY `FK_LOT_TAILLE` (`idTaille`),
  ADD KEY `FK_LOT_PRESENTATION` (`idPresentation`),
  ADD KEY `FK_LOT_BAC` (`idBac`),
  ADD KEY `FK_LOT_QUALITE` (`idQualite`),
  ADD KEY `FK_LOT_ASSO` (`idAsso`),
  ADD KEY `FK_LOT_BACNOM` (`Bacnom`),
  ADD KEY `FK_LOT_FACTURE` (`idFactureLots`),
  ADD KEY `FK_LOT_ACHETEUR` (`idAcheteurLots`);

--
-- Index pour la table `peche`
--
ALTER TABLE `peche`
  ADD PRIMARY KEY (`DatePeche`,`idBateau`),
  ADD KEY `FK_PECHE_BATEAU` (`idBateau`);

--
-- Index pour la table `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`idPresentation`);

--
-- Index pour la table `qualite`
--
ALTER TABLE `qualite`
  ADD PRIMARY KEY (`idQualite`);

--
-- Index pour la table `taille`
--
ALTER TABLE `taille`
  ADD PRIMARY KEY (`idTaille`);

--
-- Index pour la table `type_bac`
--
ALTER TABLE `type_bac`
  ADD PRIMARY KEY (`idTypeBac`),
  ADD UNIQUE KEY `Type_Bac` (`Type_Bac`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acheteur`
--
ALTER TABLE `acheteur`
  MODIFY `idAcheteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `association`
--
ALTER TABLE `association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `bac`
--
ALTER TABLE `bac`
  MODIFY `idBac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `idFacture` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `type_bac`
--
ALTER TABLE `type_bac`
  MODIFY `idTypeBac` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `FK_LOT_ACHETEUR` FOREIGN KEY (`idAcheteurLots`) REFERENCES `acheteur` (`idAcheteur`),
  ADD CONSTRAINT `FK_LOT_BAC` FOREIGN KEY (`idBac`) REFERENCES `bac` (`idBac`),
  ADD CONSTRAINT `FK_LOT_BACNOM` FOREIGN KEY (`Bacnom`) REFERENCES `bac` (`nomBac`),
  ADD CONSTRAINT `FK_LOT_ESPECE` FOREIGN KEY (`idEspece`) REFERENCES `espece` (`idEspece`),
  ADD CONSTRAINT `FK_LOT_FACTURE` FOREIGN KEY (`idFactureLots`) REFERENCES `facture` (`idFacture`),
  ADD CONSTRAINT `FK_LOT_PECHE` FOREIGN KEY (`idBateau`,`idDatePeche`) REFERENCES `peche` (`idBateau`, `DatePeche`),
  ADD CONSTRAINT `FK_LOT_PRESENTATION` FOREIGN KEY (`idPresentation`) REFERENCES `presentation` (`idPresentation`),
  ADD CONSTRAINT `FK_LOT_QUALITE` FOREIGN KEY (`idQualite`) REFERENCES `qualite` (`idQualite`),
  ADD CONSTRAINT `FK_LOT_TAILLE` FOREIGN KEY (`idTaille`) REFERENCES `taille` (`idTaille`);

--
-- Contraintes pour la table `peche`
--
ALTER TABLE `peche`
  ADD CONSTRAINT `FK_PECHE_BATEAU` FOREIGN KEY (`idBateau`) REFERENCES `bateau` (`idBateaux`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
