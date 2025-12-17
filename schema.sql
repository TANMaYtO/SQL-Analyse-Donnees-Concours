-- PROJET SQL : Gestion des Concours (Schema & Data)
-- Auteur : Ada Faty GATH
-- Base de données : MySQL / DBeaver

-- ==========================================
-- 1. NETTOYAGE (DROP TABLES)
-- ==========================================
DROP TABLE IF EXISTS concours;
DROP TABLE IF EXISTS epreuve;
DROP TABLE IF EXISTS epreuve_matiere;
DROP TABLE IF EXISTS admission;
DROP TABLE IF EXISTS ecole;

-- ==========================================
-- 2. CRÉATION DES TABLES (DDL)
-- ==========================================
CREATE TABLE concours (
    id INTEGER PRIMARY KEY,
    nom varchar(255),
    filiere varchar(255),
    inscrit INTEGER
);

CREATE TABLE epreuve (
    id INTEGER PRIMARY KEY,
    nom varchar(255),
    duree float,
    concours_id INTEGER,
    coefficient float,
    oral boolean,
    preparation float,
    FOREIGN KEY (concours_id) REFERENCES concours (id)
);

CREATE TABLE epreuve_matiere (
    epreuve_id INTEGER,
    matiere varchar(255),
    FOREIGN KEY (epreuve_id) REFERENCES epreuve (id)
);

CREATE TABLE admission (
    ecole_nom varchar(255),
    concours_id varchar(255),
    places INTEGER,
    dernier_admis INTEGER,
    FOREIGN KEY (concours_id) REFERENCES concours (id)
);

CREATE TABLE ecole (
    nom varchar(255), 
    ville varchar(255)
);

-- ==========================================
-- 3. INSERTION DES DONNÉES (DML)
-- ==========================================

-- Table : concours
INSERT INTO concours VALUES (0, 'ccinp', 'mp', 7872);
INSERT INTO concours VALUES (1, 'ccinp', 'pc', 4685);
INSERT INTO concours VALUES (2, 'ccinp', 'mpi', 0);
INSERT INTO concours VALUES (3, 'cmp', 'mp', 7872);
INSERT INTO concours VALUES (4, 'cmp', 'mpi', 0);

-- Table : epreuve & epreuve_matiere (Jeu de données complet)
INSERT INTO epreuve VALUES (0, 'mathématiques 1', 4, 0, 12.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (0, 'mathématiques');
INSERT INTO epreuve VALUES (1, 'mathématiques 2', 4, 0, 12.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (1, 'mathématiques');
INSERT INTO epreuve VALUES (2, 'physique-chimie', 4, 0, 12.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (2, 'physique');
INSERT INTO epreuve_matiere VALUES (2, 'chimie');
INSERT INTO epreuve VALUES (3, 'français-philosophie', 4, 0, 9.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (3, 'français-philosophie');
INSERT INTO epreuve VALUES (4, 'physique', 4, 0, 7.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (4, 'physique');
INSERT INTO epreuve VALUES (5, 'langue vivante a', 3, 0, 4.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (5, 'langue vivante a');
INSERT INTO epreuve VALUES (6, 'langue vivante b', 1, 0, 2.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (6, 'langue vivante b');
INSERT INTO epreuve VALUES (7, 'informatique ou sciences industrielles', 4, 0, 7.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (7, 'option info/si');
INSERT INTO epreuve VALUES (8, 'mathématiques', 0.5, 0, 14.0, True, 0.5);
INSERT INTO epreuve_matiere VALUES (8, 'mathématiques');
INSERT INTO epreuve VALUES (9, 'physique-chimie', 0.5, 0, 12.0, True, 0.5);
INSERT INTO epreuve_matiere VALUES (9, 'physique');
INSERT INTO epreuve_matiere VALUES (9, 'chimie');
INSERT INTO epreuve VALUES (10, 'langue vivante a', 0.5, 0, 6.0, True, 0.5);
INSERT INTO epreuve_matiere VALUES (10, 'langue vivante a');
INSERT INTO epreuve VALUES (11, 'tipe', 0.5, 0, 8.0, True, 0);
INSERT INTO epreuve_matiere VALUES (11, 'tipe');
INSERT INTO epreuve VALUES (12, 'mathématiques', 4, 1, 12.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (12, 'mathématiques');
INSERT INTO epreuve VALUES (13, 'physique', 4, 1, 13.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (13, 'physique');
INSERT INTO epreuve VALUES (14, 'français-philosophie', 4, 1, 9.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (14, 'français-philosophie');
INSERT INTO epreuve VALUES (15, 'chimie', 4, 1, 7.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (15, 'chimie');
INSERT INTO epreuve VALUES (16, 'langue vivante a', 3, 1, 4.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (16, 'langue vivante a');
INSERT INTO epreuve VALUES (17, 'langue vivante b', 1, 1, 2.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (17, 'langue vivante b');
INSERT INTO epreuve VALUES (18, 'informatique', 3, 1, 6.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (18, 'informatique');
INSERT INTO epreuve VALUES (19, 'modélisation', 4, 1, 7.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (19, 'modélisation');
INSERT INTO epreuve_matiere VALUES (19, 'physique');
INSERT INTO epreuve_matiere VALUES (19, 'chimie');
INSERT INTO epreuve VALUES (20, 'mathématiques', 0.5, 1, 8.0, True, 0.5);
INSERT INTO epreuve_matiere VALUES (20, 'mathématiques');
INSERT INTO epreuve VALUES (21, 'physique ou chimie', 0.5, 1, 9.0, True, 0.5);
INSERT INTO epreuve_matiere VALUES (21, 'physique');
INSERT INTO epreuve_matiere VALUES (21, 'chimie');
INSERT INTO epreuve VALUES (22, 'langue vivante a', 0.5, 1, 6.0, True, 0.5);
INSERT INTO epreuve_matiere VALUES (22, 'langue vivante a');
INSERT INTO epreuve VALUES (23, 'tp physique ou chimie', 2.25, 1, 9.0, True, 0.75);
INSERT INTO epreuve_matiere VALUES (23, 'physique');
INSERT INTO epreuve_matiere VALUES (23, 'chimie');
INSERT INTO epreuve VALUES (24, 'tipe', 0.5, 1, 8.0, True, 0);
INSERT INTO epreuve_matiere VALUES (24, 'tipe');
INSERT INTO epreuve VALUES (25, 'mathématiques 1', 4, 2, 11.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (25, 'mathématiques');
INSERT INTO epreuve VALUES (26, 'mathématiques 2', 4, 2, 11.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (26, 'mathématiques');
INSERT INTO epreuve VALUES (27, 'physique-chimie', 4, 2, 11.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (27, 'physique');
INSERT INTO epreuve_matiere VALUES (27, 'chimie');
INSERT INTO epreuve VALUES (28, 'français-philosophie', 4, 2, 9.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (28, 'français-philosophie');
INSERT INTO epreuve VALUES (29, 'physique', 4, 2, 9.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (29, 'physique');
INSERT INTO epreuve VALUES (30, 'informatique', 4, 2, 12.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (30, 'informatique');
INSERT INTO epreuve VALUES (31, 'langue vivante a', 3, 2, 4.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (31, 'langue vivante a');
INSERT INTO epreuve VALUES (32, 'langue vivante b', 1, 2, 2.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (32, 'langue vivante b');
INSERT INTO epreuve VALUES (33, 'informatique', 0.5, 2, 10.0, True, 0.5);
INSERT INTO epreuve_matiere VALUES (33, 'informatique');
INSERT INTO epreuve VALUES (34, 'mathématiques', 0.5, 2, 8.0, True, 0.5);
INSERT INTO epreuve_matiere VALUES (34, 'mathématiques');
INSERT INTO epreuve VALUES (35, 'physique-chimie', 0.5, 2, 8.0, True, 0.5);
INSERT INTO epreuve_matiere VALUES (35, 'physique');
INSERT INTO epreuve_matiere VALUES (35, 'chimie');
INSERT INTO epreuve VALUES (36, 'langue vivante a', 0.5, 2, 6.0, True, 0.5);
INSERT INTO epreuve_matiere VALUES (36, 'langue vivante a');
INSERT INTO epreuve VALUES (37, 'tipe', 0.5, 2, 8.0, True, 0);
INSERT INTO epreuve_matiere VALUES (37, 'tipe');
INSERT INTO epreuve VALUES (38, 'mathématiques 1', 3, 3, 4.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (38, 'mathématiques');
INSERT INTO epreuve VALUES (39, 'mathématiques 2', 4, 3, 5.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (39, 'mathématiques');
INSERT INTO epreuve VALUES (40, 'physique 1', 3, 3, 3.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (40, 'physique');
INSERT INTO epreuve VALUES (41, 'physique 2', 3, 3, 4.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (41, 'physique');
INSERT INTO epreuve VALUES (42, 'chimie', 3, 3, 2.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (42, 'chimie');
INSERT INTO epreuve VALUES (43, 'français', 3, 3, 5.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (43, 'français-philosophie');
INSERT INTO epreuve VALUES (44, 'langue vivante a', 1.5, 3, 3.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (44, 'langue vivante a');
INSERT INTO epreuve VALUES (45, 'informatique ou sciences industrielles', 3, 3, 2.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (45, 'option info/si');
INSERT INTO epreuve VALUES (46, 'informatique', 2, 3, 2.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (46, 'informatique');
INSERT INTO epreuve VALUES (47, 'mathématiques 1', 3, 4, 4.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (47, 'mathématiques');
INSERT INTO epreuve VALUES (48, 'mathématiques 2', 4, 4, 5.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (48, 'mathématiques');
INSERT INTO epreuve VALUES (49, 'physique 1', 3, 4, 3.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (49, 'physique');
INSERT INTO epreuve VALUES (50, 'physique 2', 4, 4, 3.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (50, 'physique');
INSERT INTO epreuve VALUES (51, 'français', 3, 4, 5.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (51, 'français-philosophie');
INSERT INTO epreuve VALUES (52, 'langue vivante a', 1.5, 4, 3.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (52, 'langue vivante a');
INSERT INTO epreuve VALUES (53, 'informatique 1', 3, 4, 3.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (53, 'informatique');
INSERT INTO epreuve VALUES (54, 'informatique 2', 4, 4, 4.0, False, 0.0);
INSERT INTO epreuve_matiere VALUES (54, 'informatique');