# Gestion-Hotel
Partie 1 : Analyse et Conception

1. Analyse du besoin

Identifier :

Les acteurs du système
Les données à gérer
Les règles de gestion

2. User Stories métier

Rédaction des besoins fonctionnels sous forme de scénarios utilisateurs :

Gestion des clients
Gestion des chambres
Gestion des réservations
Gestion des paiements
Suivi des séjours

3. Identification des acteurs
Administrateur de base de données
Réceptionniste
Client
Responsable hôtel

4. Modélisation des données (MCD)

Entités principales :

CLIENT
CHAMBRE
CATEGORIE_CHAMBRE
RESERVATION
SEJOUR
PAIEMENT

Relations :

Un client effectue plusieurs réservations
Une réservation concerne une chambre
Une chambre appartient à une catégorie
Une réservation peut générer un séjour
Une réservation peut avoir plusieurs paiements

5. Modèle Logique de Données (MLD)

Transformation du MCD en tables relationnelles avec :

Clés primaires
Clés étrangères
Respect des formes normales (1FN, 2FN, 3FN)

Partie 2 : Implémentation

6. Création de la base de données
CREATE DATABASE hotel_db;
USE hotel_db;
7. Création des tables
CLIENT
CHAMBRE
CATEGORIE_CHAMBRE
RESERVATION
SEJOUR
PAIEMENT

Avec contraintes :

PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
AUTO_INCREMENT
DEFAULT

8. Insertion des données

Insertion de données de test pour vérifier la structure :

INSERT INTO CLIENT VALUES (...);
INSERT INTO CHAMBRE VALUES (...);

9. Consultation des données

Exemples de requêtes :

SELECT * FROM CLIENT;

SELECT * FROM RESERVATION WHERE statut = 'Confirmee';

SELECT * FROM CHAMBRE WHERE statut = 'Disponible';

10. Analyse des données

Exemples de statistiques :

SELECT COUNT(*) FROM RESERVATION;

SELECT statut, COUNT(*) 
FROM RESERVATION 
GROUP BY statut;

**Technologies utilisées
MySQL
SQL (DDL + DML)
Modélisation MERISE

**Résultat attendu

Une base de données :

Structurée
Normalisée
Sans doublons
Facile à interroger
Adaptée à la gestion d’un hôtel

**Auteur

Projet réalisé dans le cadre d’un exercice de conception et implémentation de base de données relationnelle.