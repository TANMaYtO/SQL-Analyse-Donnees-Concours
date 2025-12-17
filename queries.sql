-- PROJET SQL : Analyse des Concours Grandes Écoles
-- Fichier : queries.sql
-- Auteur : Ada Faty GATH

-- Question 1: Quelle est la liste des concours présents dans la base de données ?
SELECT nom, filiere 
FROM concours;

-- Question 2: Quel est le nombre total d'inscrits au concours CCINP pour la filière MP ?
SELECT inscrit 
FROM concours 
WHERE nom = 'ccinp' 
AND filiere = 'mp';

-- Question 3: Quelles sont les épreuves écrites du concours CCINP pour la filière PC ?
-- Note : oral = False
SELECT e.nom, e.oral, c.nom, c.filiere 
FROM epreuve e 
INNER JOIN concours c ON e.concours_id = c.id
WHERE e.oral = FALSE
AND c.nom = 'ccinp' 
AND c.filiere = 'pc';

-- Question 4: Pour chaque filière, quel est le nombre d'épreuves orales du concours CCINP ?
SELECT c.filiere, COUNT(e.oral) as nbre_epreuves_orales_ccinp
FROM concours c
INNER JOIN epreuve e ON c.id = e.concours_id
WHERE e.oral = TRUE 
AND c.nom = 'ccinp'
GROUP BY c.filiere;

-- Question 5: Quel est le coefficient de l'épreuve de "mathématiques" pour le concours CCINP en filière MP (distinguer l'écrit de l'oral) ?
SELECT e.nom, e.oral, e.coefficient, em.matiere, c.nom, c.filiere
FROM epreuve e
INNER JOIN epreuve_matiere em ON e.id = em.epreuve_id
INNER JOIN concours c ON e.concours_id = c.id
WHERE em.matiere = 'mathématiques'
AND c.nom = 'ccinp'
AND c.filiere = 'mp';

-- Question 6: Pour chaque concours, quelle est la durée totale des épreuves écrites ?
SELECT c.nom, SUM(e.duree) as duree_totale_epreuves_ecrites
FROM concours c
INNER JOIN epreuve e ON c.id = e.concours_id
WHERE e.oral = FALSE
GROUP BY c.nom;

-- Question 7: Quelle est la liste des matières couvertes par les épreuves du concours CMP en filière MPI ?
-- Utilisation de DISTINCT pour éviter les doublons
SELECT DISTINCT em.matiere as liste_des_matieres_epreuves_cmp_mpi
FROM concours c
INNER JOIN epreuve e ON c.id = e.concours_id
INNER JOIN epreuve_matiere em ON e.id = em.epreuve_id
WHERE c.nom = 'cmp' 
AND c.filiere = 'mpi';

-- Question 8: Pour le concours CCINP en filière MP, quel est le coefficient total des épreuves de mathématiques ?
SELECT SUM(e.coefficient) as coefficient_total_epreuves_mathematiques
FROM epreuve e
INNER JOIN concours c ON e.concours_id = c.id 
INNER JOIN epreuve_matiere em ON e.id = em.epreuve_id 
WHERE c.nom = 'ccinp'
AND c.filiere = 'mp'
AND em.matiere = 'mathématiques';

-- Question 9: Quel est le nom des épreuves dont la durée de préparation est supérieure à 30 minutes (0.5h) ?
SELECT nom, preparation 
FROM epreuve
WHERE preparation > 0.5;

-- Question 10: Pour chaque concours, quel est le nombre total d'heures (épreuve et préparation) ?
SELECT c.nom, SUM(e.duree + e.preparation) as total_d_heures
FROM concours c
INNER JOIN epreuve e ON c.id = e.concours_id
GROUP BY c.nom;