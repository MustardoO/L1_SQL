/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice1.1.sql
# Rôle ........ : Code SQL créant une table appelée EMP avec différents attributs dont une clé primaire qui ne doit pas être nulle.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 25/04/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

CREATE TABLE EMP(
NoEMP NUMERIC(4) NOT NULL,
NomEMP VARCHAR(10),
EMPLOI VARCHAR(15),
MGR NUMERIC(4),
DateEMB DATE,
SAL NUMERIC(7,2),
COMM NUMERIC(7,2),
NoDEPT NUMERIC(2),
CONSTRAINT EMP_clé_primaire PRIMARY KEY (NoEMP));



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice1.2
# Rôle ........ : Code SQL ajoutant une/des ligne(s) à la table EMP.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 26/04/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

INSERT INTO EMP /*(noemp, nomemp, emploi, mgr, dateemb, sal, comm, nodept)*/
values (7369, 'SERGE', 'FONCTIONNAIRE', 7902, '17-DEC-1980', 800, NULL, 20);

INSERT INTO EMP
VALUES (7369, 'SERGE', 'FONCTIONNAIRE', 7902, '17-DEC-1980', 800, NULL, 20),
	(7499, 'BRAHIM', 'VENDEUR', 7698, '20-FEB-1981', 1600, 300, 30),
	(7521, 'NASSIMA', 'VENDEUR', 7698, '22-FEB-1981', 1250, 500, 30),
	(7566, 'LUCIE', 'GESTIONNAIRE', 7839, '2-APR-1981', 2975, NULL, 20),
	(7654, 'MARTIN', 'VENDEUR', 7698, '28-SEP-1981', 1250, 1400, 30),
	(7698, 'BENJAMIN', 'GESTIONNAIRE', 7839, '1-MAY-1981', 2850, NULL, 30),
	(7782, 'DAYANE', 'GESTIONNAIRE', 7839, '9-JUN-1981', 2450, NULL, 10),
	(7788, 'ARIJ', 'ANALYSTE', 7566, '09-DEC-1982', 3000, NULL, 20),
	(7839, 'MAYAR', 'PRESIDENT', NULL, '17-NOV-1981', 5000, NULL, 10),
	(7844, 'ROI', 'VENDEUR', 7698, '8-SEP-1981', 1500, 0, 30),
	(7876, 'VIRGINIE', 'FONCTIONNAIRE', 7788, '12-JAN-1983', 1100, NULL, 20),
	(7900, 'LYNA', 'FONCTIONNAIRE', 7698, '3-DEC-1981', 950, NULL, 30),
	(7902, 'ASMA', 'ANALYSTE', 7566, '3-DEC-1981', 3000, NULL, 20),
	(7934, 'SIMONE', 'FONCTIONNAIRE', 7782, '23-JAN-1982', 1300, NULL,10);
	
/* Utiliser TO_DATE(’17-DEC-1980’, ’DD-MON-YYYY’) pour écrire la date */


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice1.3
# Rôle ........ : Code SQL créant la table DEPT dont clé prim NoDEPT + attributs
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

CREATE TABLE DEPT(
NoDEPT NUMERIC(2) NOT NULL,
NomDEPT VARCHAR(14),
LOC VARCHAR(13),
CONSTRAINT DEPT_clé_primaire PRIMARY KEY (NoDEPT));



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice1.4
# Rôle ........ : Code SQL ajoutant des données = la table DEPT
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

INSERT INTO DEPT /*NoDEPT, NomDEPT, VILLE */
VALUES (10, 'COMPTABILITE', 'BREST'),
	(20, 'RECHERCHE', 'RENNES'),
	(30, 'VENTES', 'DINAR'),
	(40, 'GESTION', 'DINAN');
	
SELECT * FROM DEPT;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice1.5
# Rôle ........ : Modifie les tables EMP et DEPT demanière en ajoutant une contrainte, une clé étrangère.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

ALTER TABLE EMP ADD CONSTRAINT EMP_clé_étrangère FOREIGN KEY (NoDEPT) REFERENCES DEPT(NoDEPT);
/*ALTER TABLE DEPT ADD CONSTRAINT DEPT_clé_étrangère FOREIGN KEY (NoEMP) REFERENCES EMP(NoEMP);*/



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.1
# Rôle ........ : Affiche toutes les lignes (tuples) de la table EMP
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT * FROM EMP;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.2
# Rôle ........ : Affiche tous les noms et professions de la table EMP.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomemp, emploi FROM EMP;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.3
# Rôle ........ : Affiche tous les tuples correspondant au dept 20 dans EMP.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT * 
FROM EMP 
WHERE nodept=20 ;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.4
# Rôle ........ : Recherche et affiche les noms et salaires des employés exerçant en tant que vendeur et ayant une commission.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomemp, sal
FROM EMP
WHERE emploi= 'VENDEUR' AND comm IS NOT NULL ;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.5
# Rôle ........ : Affiche tous les numéros de département. Est-il possible d’améliorer le contenu d’affichage ? Commenter.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nodept FROM EMP;

/*Il est possible d'améliorer l'affichage en ajoutant les deux dernières instructions suivantes :*/
SELECT nodept 
FROM EMP
GROUP BY nodept /*Évite la redondance*/
ORDER BY nodept ASC; /* tri croissant --> ORDER BY doit venir après GROUP BY*/



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.6
# Rôle ........ : Liste les gestionnaires. On ne s’intéressera qu’à leurs noms, leurs salaires et leurs commissions.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomemp, sal, comm 
FROM EMP 
WHERE emploi='GESTIONNAIRE';



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.7
# Rôle ........ : Détermine la ville du département de ASMA.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT loc
FROM EMP, DEPT
WHERE EMP.nodept = DEPT.nodept
AND nomemp='ASMA';



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.8
# Rôle ........ : On s’intéresse aux employés gagnant entre 1000 e et 3000 e. Propose une requête assurant cette tâche.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT *
FROM EMP
WHERE sal BETWEEN 1000 AND 3000;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.9
# Rôle ........ : Liste les noms des départements dont le nom de ville commence par R ou D.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomdept
FROM DEPT
WHERE loc LIKE 'R%' OR loc LIKE 'D%';



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.10
# Rôle ........ : Liste les noms des départements dont le nom de ville contient un R ou D.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomdept
FROM DEPT
WHERE loc LIKE '%R%' OR loc LIKE '%D%';



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.11
# Rôle ........ : Dans l’ordre décroissant des salaires, lister les noms, les fonctions et les salaires des employés gagnant moins de 3000 e.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomemp, emploi, sal
FROM EMP
WHERE sal < 3000
ORDER BY sal DESC;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.12
# Rôle ........ : Dans l’ordre décroissant des numéros des départements ensuite dans l’ordre croissant des salaires, lister les noms, les fonctions, les salaires des employés et les numéros des départements.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomemp, emploi, sal, nodept
FROM EMP
ORDER BY nodept DESC, sal ASC;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.13
# Rôle ........ : Dans l’ordre décroissant des noms des départements ensuite dans l’ordre croissant des salaires, lister les noms, les fonctions, les salaires des employés et les noms des départements.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT EMP.nomemp, EMP.emploi as fonction, sal, DEPT.nomdept
FROM EMP, DEPT
WHERE EMP.nodept = DEPT.nodept
ORDER BY DEPT.nomdept DESC, sal ASC;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.1
# Rôle ........ : On souhaite revaloriser le salaire de tous les employés de 200e chacun. Proposer l’instruction permettant de le faire sur la table EMP.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

UPDATE EMP SET sal = sal + 200;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.2
# Rôle ........ : On souhaite revaloriser le salaire de tous les employés de 200e chacun. Proposer l’instruction permettant de le faire sur la table EMP.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

INSERT INTO DEPT /*NoDEPT, NomDEPT, VILLE */
VALUES (50, 'INFORMATIQUE', 'PARIS');



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.3
# Rôle ........ : Écrit et exécute l’instruction de création de la table COMMISSION dont les attributs sont :
(a) NomEmp de type chaı̂ne de caractères (VARCHAR(10))
(b) Emploi de type chaı̂ne de caractères (VARCHAR(10))
(c) Salaire de type réel (number(7,2))
(d) ValComm de type réel (Number(4,2))
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 03/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

CREATE TABLE COMMISSION (
	NomEMP VARCHAR(10),
	Emploi VARCHAR(10),
	Salaire NUMERIC(7,2),
	ValComm NUMERIC(4,2)
	);



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.4
# Rôle ........ : Insére plusieurs tuples dans la table COMMISSION.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

INSERT INTO COMMISSION (nomemp, emploi, salaire, valcomm)
SELECT nomemp, emploi, sal, comm/1000 FROM EMP
WHERE emploi='VENDEUR'; 

/* /!\ Emploi limité à 10 char et ValComm (4,2) => 3 chiffres avant la virgule + 1 (on compte la virgule) + 2 chiffres après la virgule  ? 
NOTE PERSO : Il semblerait que le premier nombre désigne le nombre total de digits dont les digits après la virgule + Vérifier si la virgule est comptée dans le premier nombre de la parenthèse.*/



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.5
# Rôle ........ : Supprimer de la table COMMISSION, le tuple correspondant à un nom d’employé (au choix).
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

DELETE FROM COMMISSION WHERE valcomm = 0;

/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.6
# Rôle ........ : Insére dans la table COMMISSION les données de la table EMP dont les employés ont une commission.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

/* Déjà fait à la question sur le critère de l'emploi, voici le code pour le faire directement sur le critère de la commission */

INSERT INTO COMMISSION (nomemp, emploi, salaire, valcomm)
SELECT nomemp, emploi, sal, comm/1000 FROM EMP
WHERE comm IS NOT NULL;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.7
# Rôle ........ : Vide la table COMMISSION puis la supprime.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

TRUNCATE TABLE COMMISSION;
SELECT * FROM COMMISSION; /* pour vérifier */
DROP TABLE COMMISSION;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.8
# Rôle ........ : Recréer la table COMMISSION en y chargeant directement les données de la table EMP dont les employés ont une commission.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

CREATE TABLE COMMISSION
AS SELECT nomemp, emploi, sal, comm
FROM EMP
WHERE comm IS NOT NULL;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.1
# Rôle ........ : Lister le nombre d’employés gagnant plus que le minimum de tous les salaires.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT COUNT(noemp)
FROM EMP
WHERE sal > (SELECT MIN(sal) FROM EMP);



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.2
# Rôle ........ : Affiche le nombre de départements différents dans la table EMP.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT COUNT(DISTINCT nodept) FROM EMP;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.3
# Rôle ........ : Affiche le salaire moyen dans la table EMP.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT ROUND(AVG(sal), 2) FROM EMP;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.4
# Rôle ........ : Liste tout employé dont le salaire est supérieur à au moins un salaire du département 30.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT *
FROM EMP
WHERE sal > (SELECT MIN(sal) FROM EMP WHERE nodept=30);



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.5
# Rôle ........ : Liste tout employé du département 10 dont le salaire est supérieur à tous ceux du département 20.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT * FROM EMP
WHERE nodept = 10 AND sal > (SELECT MAX(sal) FROM EMP WHERE nodept = 20);



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.6
# Rôle ........ : Lister les salaires minimal et maximal pour chaque département
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nodept, MIN(sal), MAX(sal) FROM EMP
GROUP BY nodept;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.7
# Rôle ........ : Lister le salaire moyen par emploi (EMPLOI)
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT emploi, ROUND(AVG(sal),2) as sal_moyen FROM EMP
GROUP BY emploi;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.8
# Rôle ........ : Lister les salaires minimal et maximal pour chaque département ayant au moins 2 employés.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nodept, MIN(sal), MAX(sal) FROM EMP
GROUP BY nodept
HAVING COUNT(nodept) >= 2;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.9
# Rôle ........ : Lister les départements ayant le minimum des salaires supérieur à la moyenne des salaires des employés de bureau (FONCTIONNAIRE)
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nodept FROM EMP
GROUP BY nodept
HAVING MIN(sal) > (SELECT AVG(sal) FROM EMP WHERE emploi = 'FONCTIONNAIRE');



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.10
# Rôle ........ : Donner les noms des employés par ordre alphabétique.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomemp FROM EMP
ORDER BY nomemp ASC;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.11
# Rôle ........ : Donner les noms des employés par ordre alphabétique inversé.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomemp FROM EMP
ORDER BY nomemp DESC;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.12
# Rôle ........ : Lister les noms des employés dont le nom de manager commence par un H ou un S ou un un M.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */


/* SELECT nomemp FROM EMP
WHERE nomemp LIKE 'H%'
	OR nomemp LIKE 'S%'
	OR nomemp LIKE 'M%'
	AND noemp IN (SELECT mgr FROM EMP);
	
SELECT noemp, nomemp, mgr FROM EMP
WHERE noemp IN (SELECT mgr FROM EMP);

SELECT nomemp FROM EMP WHERE nomemp LIKE 'H%'; */


SELECT nomemp FROM EMP
WHERE (nomemp LIKE 'H%'
	OR nomemp LIKE 'S%'
	OR nomemp LIKE 'M%')
	AND noemp IN (SELECT mgr FROM EMP);



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.13
# Rôle ........ : Lister les noms des employés dont le nom de manager se termine par un E ou un M ou un un A.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomemp FROM EMP
WHERE (nomemp LIKE '%E'
	OR nomemp LIKE '%M'
	OR nomemp LIKE '%A')
	AND noemp IN (SELECT mgr FROM EMP);
	
	
	
/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.14
# Rôle ........ : Donner les informations sur les employés par ordre décroissant de date d’embauche puis par ordre alphabétique de nom.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT * FROM EMP
ORDER BY dateEmb DESC, nomemp ASC;
	
	

/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.15
# Rôle ........ : Présenter les employés par groupes de même valeur de salaire, et par ordre décroissant de ces valeurs.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT sal, nodept, nomemp FROM EMP
GROUP BY sal, nodept, nomemp
ORDER BY sal DESC;

/* En utilisant count */

SELECT sal, count(*) AS nbemployés FROM EMP
GROUP BY sal
ORDER BY sal DESC;

/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.16
# Rôle ........ : Représenter les employés groupés selon les noms de département ordonnés dans l’ordre alphabétique inverse.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomdept FROM DEPT
WHERE DEPT.nodept = EMP.nodept
GROUP BY nomdept
ORDER BY nomdept DESC;

/* En utilisant count */

SELECT nomdept, count(EMP.nomemp) AS nbemployés FROM DEPT, EMP
WHERE DEPT.nodept = EMP.nodept
GROUP BY nomdept
ORDER BY nomdept DESC;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.17
# Rôle ........ : Représenter les employés groupés selon le mois et l’année de leur date d’embauche (ordre chronologique)
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 04/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

/* TESTS

SELECT to_char(dateemb, 'DD-MON-YYYY') FROM EMP;

SELECT to_date(dateemb, 'yyyy MON dd'), count(*) FROM EMP
GROUP BY dateemb
ORDER BY dateemb ASC; */

/* par mois et par année*/

SELECT DATE_TRUNC('month', dateemb)::date AS date_arrivée, count(*) AS nb_employés FROM EMP
GROUP BY DATE_TRUNC('month', dateemb)
ORDER BY DATE_TRUNC('month', dateemb) ASC;

/*Ou on peut aussi faire */

SELECT to_char((DATE_TRUNC('month', dateemb)), 'MON-YYYY') AS date_arrivée, count(*) AS nb_employés FROM EMP
GROUP BY DATE_TRUNC('month', dateemb)
ORDER BY DATE_TRUNC('month', dateemb) ASC;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.18
# Rôle ........ : Afficher le salaire moyen par job.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT emploi, ROUND(AVG(sal),2) FROM EMP
GROUP BY emploi;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.19
# Rôle ........ : Afficher les noms des employés groupés par job puis par nom de département.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT emploi, nomdept, nomemp FROM EMP, DEPT
WHERE DEPT.nodept = EMP.nodept
GROUP BY EMP.emploi, DEPT.nomdept, EMP.nomemp
ORDER BY emploi, nomdept, nomemp;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.20
# Rôle ........ : Afficher les nombres d’employés dirigés directement par chaque manager (ici on comprend manager comme un employé ayant son numéro dans la colonne mgr).
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

/*Ci-dessous concerne les manager*/
SELECT COUNT(noemp) FROM EMP
WHERE noemp IN (SELECT mgr FROM EMP);

SELECT nomemp FROM EMP
WHERE noemp IN (SELECT mgr FROM EMP);

/*Ci-dessous concerne les employés*/

SELECT COUNT(*) FROM (SELECT nomemp FROM EMP
EXCEPT SELECT nomemp FROM EMP
WHERE noemp IN (SELECT mgr FROM EMP)) as exception;

SELECT nomemp FROM EMP
EXCEPT SELECT nomemp FROM EMP
WHERE noemp IN (SELECT mgr FROM EMP);



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.21
# Rôle ........ : Afficher la ville et le nom des départements qui ont plus de quatre employés.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT loc, nomdept FROM DEPT, EMP
WHERE DEPT.nodept = EMP.nodept AND nodept in ();

SELECT nodept FROM EMP
GROUP BY nodept
HAVING Count(nodept) > 4;

SELECT loc, nomdept, nomemp FROM DEPT, EMP
WHERE EMP.nodept = DEPT.nodept
	AND EMP.nodept in (SELECT nodept FROM EMP
	GROUP BY nodept
	HAVING Count(nodept) > 4)
ORDER BY 1;

SELECT loc, nomdept, nomemp FROM DEPT, EMP
WHERE EMP.nodept = DEPT.nodept
	AND EMP.nodept in (SELECT nodept FROM EMP
	GROUP BY nodept
	HAVING Count(nodept) > 4)
ORDER BY 1;

SELECT loc, nomdept, count(*) FROM DEPT, EMP
WHERE EMP.nodept = DEPT.nodept
	AND EMP.nodept in (SELECT nodept FROM EMP
	GROUP BY nodept
	HAVING Count(nodept) > 4)
GROUP BY 1, 2
ORDER BY 1;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.22
# Rôle ........ : Afficher la ville et le nom des départements qui ont plus de quatre employés.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomdept FROM DEPT, EMP
WHERE DEPT.nodept = EMP.nodept
GROUP BY nomdept
HAVING AVG(sal) > 2500;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.23
# Rôle ........ : Afficher le nombre d’employés par département et par profession.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT EMP.nodept, nomdept, emploi, Count(*) as nb_employés FROM EMP, DEPT
WHERE DEPT.nodept = EMP.nodept
GROUP BY EMP.nodept, nomdept, emploi
ORDER BY 1 ASC, 2 ASC, 3 ASC;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.24
# Rôle ........ : Donner pour chaque département, son nom, le salaire minimum de ses employés, le salaire maximum, le salaire moyen, le nombre d’employés, le nombre d’employés touchant une commission (éventuellement nulle) et le nombre de jobs différents exercés dans ce département.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomdept, min(sal) as sal_mini, max(sal) as sal_maxi, round(avg(sal),2) as sal_moyen, count(nomemp) as nb_employés, count(comm) as nb_commissionnés, count(DISTINCT emploi) as nb_emplois FROM EMP, DEPT
WHERE DEPT.nodept = EMP.nodept
GROUP BY nomdept;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice5.1
# Rôle ........ : Créer une vue EMPDEPT qui contient la jointure naturelle des deux tables EMP et DEPT.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT * FROM EMP
JOIN DEPT
ON EMP.nodept = DEPT.nodept;

/* Ou */

SELECT * FROM EMP, DEPT
WHERE EMP.nodept = DEPT.nodept;

/*avec View*/


CREATE VIEW EMPDEPT
AS SELECT noemp, nomemp, emploi, mgr, dateemb, sal, comm, EMP.nodept, nomdept, loc /* obligé de nommer toutes les colonnes *  ne marche pas */
FROM EMP, DEPT
WHERE EMP.nodept = DEPT.nodept;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice5.2
# Rôle ........ : En utilisant cette vue, afficher les noms d’employés touchant plus que 2000 e avec leurs villes.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

SELECT nomemp, loc FROM EMPDEPT
WHERE sal > 2000;

/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice5.3
# Rôle ........ : Vider la table EMP
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

TRUNCATE TABLE EMP;
SELECT * FROM EMP;

/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice5.4
# Rôle ........ : Supprimer la table EMP
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

DROP TABLE EMP CASCADE; -> /*CASCADE permet supprimer la view EMPDEPT qui en dépendait*/

/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice5.5
# Rôle ........ : Créer à nouveau la table EMP avec les mêmes attributs et les mêmes contraintes d’intégrité
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

CREATE TABLE EMP(
NoEMP NUMERIC(4) NOT NULL,
NomEMP VARCHAR(10),
EMPLOI VARCHAR(15),
MGR NUMERIC(4),
DateEMB DATE,
SAL NUMERIC(7,2),
COMM NUMERIC(7,2),
NoDEPT NUMERIC(2),
CONSTRAINT EMP_clé_primaire PRIMARY KEY (NoEMP),
CONSTRAINT EMP_clé_étrangère FOREIGN KEY (NoDEPT) REFERENCES DEPT(NoDEPT));

/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice5.6
# Rôle ........ : Supprimer la colonne COMM
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

ALTER TABLE EMP DROP COLUMN COMM;

/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice5.7
# Rôle ........ : Renommer la colonne COMM en BONUS
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */

ALTER TABLE EMP ADD COLUMN COMM NUMERIC(7,2);
ALTER TABLE EMP RENAME COLUMN COMM TO BONUS;

/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice5.8
# Rôle ........ : Ajouter une colonne à la table DEPT
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 05/05/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD3)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD3
#******************************************************* */ 

ALTER TABLE DEPT ADD COLUMN BUDGET_in_k€ NUMERIC(11,2);

