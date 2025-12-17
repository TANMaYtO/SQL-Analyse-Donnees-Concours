# Projet SQL : Analyse de Données & Modélisation Relationnelle

**Auteur :** Ada Faty GATH

**Cours :** Base de Données Relationnelles (SQL)

---

## 📋 Contexte de la Mission
Ce projet a pour objectif d'évaluer la capacité à manipuler et interroger une base de données relationnelle complexe. Le cas d'étude porte sur les **Concours d'entrée aux Grandes Écoles d'Ingénieurs** (GEI).

Il s'agit de structurer et d'analyser les données relatives aux concours, aux épreuves (écrites/orales), aux matières et aux statistiques d'inscription pour en extraire des **indicateurs clés (KPIs)** d'aide à la décision.

## 🛠️ Compétences Techniques Démontrées

### 1. Modélisation de Données (DDL)
- Conception d'un schéma relationnel cohérent avec clés primaires et étrangères.
- Tables implémentées :
  - **`concours`** : Informations sur les filières (MP, PC, MPI) et le nombre d'inscrits.
  - **`epreuve`** : Détails techniques (Durée, Coefficient, Type Oral/Écrit).
  - **`epreuve_matiere`** : Table de liaison pour associer les matières aux épreuves.
  - **`admission`** & **`ecole`** : Tables structurelles complémentaires.

### 2. Analyse de Données & Reporting (DQL)
Extraction d'indicateurs de performance via des requêtes SQL avancées :
- **KPIs de Volumétrie** : Calcul du nombre total d'inscrits et d'heures d'examen.
- **Jointures Complexes (JOIN)** : Consolidation des données sur 3 tables (`concours` ↔ `epreuve` ↔ `epreuve_matiere`) pour lier les coefficients aux filières.
- **Agrégations Statistiques** : Utilisation de `GROUP BY`, `SUM` et `COUNT` pour analyser la charge horaire par concours.
- **Data Quality** : Filtrage précis (`WHERE`, `DISTINCT`) pour isoler les épreuves orales ou les matières spécifiques.

---

## 📂 Structure du Dépôt

1. **`schema.sql`** :
   Script complet de création de la structure (DDL) et d'insertion du jeu de données de test (DML). Il initialise l'environnement complet avec les 5 tables.

2. **`queries.sql`** :
   Recueil des **10 requêtes analytiques** répondant aux problématiques métier posées (ex: "Quel est le coefficient total des mathématiques ?", "Quelles sont les épreuves avec préparation > 30 min ?").

---

## 🚀 Installation et Scénario de Test

Ce projet est conçu pour être exécuté sur tout SGBD standard (MySQL, PostgreSQL, SQLite, DBeaver).

### Prérequis
- Un client SQL installé (ex: DBeaver, MySQL Workbench) ou un environnement en ligne.

### Protocole de Validation

Pour reproduire l'analyse et valider le fonctionnement, suivez ces étapes :

- **1. Initialisation (Build)** :
  Exécutez le script **`schema.sql`**.
  *Résultat attendu :* Les anciennes tables sont supprimées et les 5 nouvelles tables (`concours`, `epreuve`, etc.) sont créées sans erreur.

- **2. Ingestion des Données (Load)** :
  Le script `schema.sql` insère automatiquement le jeu de données.
  *Vérification :* Faites un `SELECT * FROM concours;` pour vérifier que 5 lignes sont bien présentes.

- **3. Exécution des Analyses (Run)** :
  Ouvrez et exécutez les requêtes du fichier **`queries.sql`**. Chaque requête répond à une question précise du cahier des charges.

- **4. Validation des KPIs (Check)** :
  Vérifiez la cohérence des résultats.
  *Exemple témoin (Question 10) :* Le calcul de la charge horaire totale pour le concours **CCINP** doit retourner **97.5 heures**.