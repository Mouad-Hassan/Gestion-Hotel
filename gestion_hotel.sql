-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 12 juin 2026 à 17:50
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie_chambre`
--

CREATE TABLE `categorie_chambre` (
  `id_categorie` varchar(50) NOT NULL,
  `nom_categorie` varchar(50) DEFAULT NULL,
  `prix_nuit` decimal(15,2) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie_chambre`
--

INSERT INTO `categorie_chambre` (`id_categorie`, `nom_categorie`, `prix_nuit`, `description`) VALUES
('CAT001', 'Standard', 300.00, 'Chambre standard'),
('CAT002', 'Single', 250.00, 'Chambre simple'),
('CAT003', 'Deluxe', 500.00, 'Chambre deluxe'),
('CAT004', 'Suite', 800.00, 'Suite luxueuse');

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id_chambre` varchar(50) NOT NULL,
  `numéro` varchar(50) DEFAULT NULL,
  `etage` varchar(50) DEFAULT NULL,
  `capacité` varchar(50) DEFAULT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `id_categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`id_chambre`, `numéro`, `etage`, `capacité`, `statut`, `id_categorie`) VALUES
('CH001', '101', '1', '2', 'Disponible', 'CAT001'),
('CH002', '102', '1', '2', 'Occupee', 'CAT001'),
('CH003', '201', '2', '1', 'Disponible', 'CAT002'),
('CH004', '202', '2', '3', 'Reservee', 'CAT003'),
('CH005', '301', '3', '4', 'Disponible', 'CAT004');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prénom` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `téléphone` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `date_inscription` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prénom`, `email`, `téléphone`, `adresse`, `date_inscription`) VALUES
('CL001', 'Benali', 'Youssef', 'youssef.benali@gmail.com', '0612345678', 'Casablanca', '2026-01-15 00:00:00'),
('CL002', 'El Amrani', 'Salma', 'salma@gmail.com', '0678451236', 'Rabat', '2026-02-03 00:00:00'),
('CL003', 'Alaoui', 'Mehdi', 'mehdi@gmail.com', '0654123789', 'Marrakech', '2026-02-20 00:00:00'),
('CL004', 'Tazi', 'Imane', 'imane@gmail.com', '0625478913', 'Fes', '2026-03-05 00:00:00'),
('CL005', 'Idrissi', 'Hamza', 'hamza@gmail.com', '0669874123', 'Agadir', '2026-03-18 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id_paiement` varchar(50) NOT NULL,
  `date_paiement` datetime DEFAULT NULL,
  `montant` decimal(15,2) DEFAULT NULL,
  `mode_paiement` varchar(50) DEFAULT NULL,
  `id_reservation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id_paiement`, `date_paiement`, `montant`, `mode_paiement`, `id_reservation`) VALUES
('PAY001', '2026-06-10 00:00:00', 900.00, 'Carte bancaire', 'RES001'),
('PAY002', '2026-06-18 00:00:00', 500.00, 'Especes', 'RES002'),
('PAY003', '2026-06-24 00:00:00', 2500.00, 'Virement', 'RES003');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` varchar(50) NOT NULL,
  `date_reservation` varchar(50) DEFAULT NULL,
  `date_arrivee` datetime DEFAULT NULL,
  `date_depart` datetime DEFAULT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `id_chambre` varchar(50) NOT NULL,
  `id_client` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date_reservation`, `date_arrivee`, `date_depart`, `statut`, `id_chambre`, `id_client`) VALUES
('RES001', '2026-06-01', '2026-06-15 00:00:00', '2026-06-18 00:00:00', 'Confirmee', 'CH001', 'CL001'),
('RES002', '2026-06-02', '2026-06-20 00:00:00', '2026-06-22 00:00:00', 'En attente', 'CH003', 'CL002'),
('RES003', '2026-06-03', '2026-06-25 00:00:00', '2026-06-30 00:00:00', 'Confirmee', 'CH004', 'CL003');

-- --------------------------------------------------------

--
-- Structure de la table `sejour`
--

CREATE TABLE `sejour` (
  `id_sejour` varchar(50) NOT NULL,
  `date_checkin` datetime DEFAULT NULL,
  `date_checkout` datetime DEFAULT NULL,
  `nb_nuits` varchar(50) DEFAULT NULL,
  `id_reservation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sejour`
--

INSERT INTO `sejour` (`id_sejour`, `date_checkin`, `date_checkout`, `nb_nuits`, `id_reservation`) VALUES
('SEJ001', '2026-06-15 00:00:00', '2026-06-18 00:00:00', '3', 'RES001'),
('SEJ002', '2026-06-20 00:00:00', '2026-06-22 00:00:00', '2', 'RES002'),
('SEJ003', '2026-06-25 00:00:00', '2026-06-30 00:00:00', '5', 'RES003');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie_chambre`
--
ALTER TABLE `categorie_chambre`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id_chambre`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id_paiement`),
  ADD KEY `id_reservation` (`id_reservation`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_chambre` (`id_chambre`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD PRIMARY KEY (`id_sejour`),
  ADD UNIQUE KEY `id_reservation` (`id_reservation`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `chambre_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie_chambre` (`id_categorie`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_chambre`) REFERENCES `chambre` (`id_chambre`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD CONSTRAINT `sejour_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
