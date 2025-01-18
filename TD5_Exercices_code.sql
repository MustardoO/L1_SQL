/*%gainde@gainde-Inspiron-3505:~$ sudo -u postgres -i
%[sudo] Mot de passe de gainde : 
%postgres@gainde-Inspiron-3505:~$ psql
%psql (12.9 (Ubuntu 12.9-0ubuntu0.20.04.1))
%Type "help" for help.
%postgres-# \c ma_bdd ---> \c permet de se connecter
%You are now connected to database "ma_bdd" as user "postgres".*/
	
/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice1.1.sql
# Rôle ........ : Écrire un bloc PL/SQL calculant le maximum de deux nombres et le renvoie en sortie
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

-- Test -> ok
do $$
declare
	var1 numeric (7,2);
	var2 numeric (7,2);
begin
	SELECT MIN(sal) INTO var1 FROM EMP;
	SELECT MAX(sal) INTO var2 FROM EMP;
	raise notice 'Entre % et %, le nombre le plus grand est : %', var1, var2, var2;
end $$;

-- OK !
DO $$
DECLARE
	var1 numeric (7,2);
	var2 numeric (7,2);
BEGIN
	SELECT MIN(sal) INTO var1 FROM EMP;
	SELECT MAX(sal) INTO var2 FROM EMP;
	RAISE NOTICE '%', GREATEST(var1, var2);
end $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice1.2.sql
# Rôle ........ : Écrire un bloc PL/SQL qui affiche le nombre d’employés d’un département dont le numéro est donné.
— B est fonction de A
— Ecrire un bloc PL/SQL qui remplit cette table comme suit : col1 -> 1,2,...,10 col2 -> 3,6,...30
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

-- \prompt "Donner un numéro de département" vnodept
-- prompt accept ne marche pas en pl/pgsql seulement en pl/sql oracle

-- OK fonctionne
do $$

declare

	var3 integer := 30;
	var4 numeric(4);
	
begin
	
	SELECT COUNT(noemp) INTO var4 FROM EMP WHERE nodept=var3;
	raise notice '%', var4;
	
end $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice1.3.sql
# Rôle ........ : Créer une table NOMBRE ayant les deux attributs de type NUMBER, A et B.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */


DO $$

DECLARE
	
	varA integer := 1;
	varB integer := varA * 3;

BEGIN

	CREATE TABLE NOMBRE(
		A INTEGER,
		B INTEGER);
	
	LOOP
		INSERT INTO NOMBRE VALUES (varA, varB);
		varA := varA + 1 ;
		varB := varA * 3;
		EXIT WHEN varA > 10;
	END LOOP;
	
END $$;

SELECT * FROM NOMBRE;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice1.4.sql
# Rôle ........ : Créer une table NOMBRE ayant les deux attributs de type NUMBER, A et B.Écrire un programme PL/SQL affichant le reste de la division de n par m sans utiliser la fonction modulo.
— Les nombres n et m sont deux entiers strictement positifs.
— Traiter le cas ou m vaut 0.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

DO $$

DECLARE
	
	n integer;
	m integer;
	s integer;
	
BEGIN
	
	n := 500;
	m := 0;
	
	IF	m < 0 OR n < 0 THEN
	
		RAISE NOTICE E'Au moins un des deux entiers est négatif :\nm = %\nn = %', m, n;
	
	ELSIF m != 0 THEN
	
		s := n - m;
		WHILE s >= m LOOP
			s := s - m;
		END LOOP;
	
		RAISE NOTICE 'Reste de la division : %', s ;
	
	ELSE
	
		RAISE NOTICE 'ON PEUT PAS DIVISER PAR 0 !';
	
	END IF;
	
END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice1.5.sql
# Rôle ........ : On souhaite afficher pour un département dont le numéro est donné, le message : "Le département NOM se trouve à LOC".
Si par exemple le numéro donné est 30, le message sera : "Le département VENTES se trouve à DINAR"
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */


DO $$

DECLARE

	vnum numeric(3,0) := 30;
	vnom DEPT.nomDEPT%TYPE;
	vloc DEPT.LOC%TYPE;
	
BEGIN

	SELECT nomDEPT INTO vnom FROM DEPT WHERE noDEPT = vnum;
	SELECT LOC INTO vloc FROM DEPT WHERE noDEPT = vnum;
	
	RAISE NOTICE 'Le département % se trouve à %.', vnom, vloc;
	
END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.1.sql
# Rôle ........ : Écrire une fonction PL/SQL qui calcule et affiche n!.
— n est un entier et doit être considéré comme paramètre de la fonction
— Proposer une solution itérative et une solution récursive.
Si par exemple le numéro donné est 30, le message sera : "Le département VENTES se trouve à DINAR"
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

--Il est nécessaire de préciser le language car Posgres en supporte plusieurs.

--OK -> Solution iterative
CREATE OR REPLACE FUNCTION factorielle(n integer)
	
	RETURNS integer
	LANGUAGE plpgsql
	as $$

DECLARE
	
	vcompteur integer := 1;
	vtotal integer := 1;
	
BEGIN

	IF n != 0 OR n !=1 THEN
	
		LOOP
			vtotal := vtotal * vcompteur;
			vcompteur := vcompteur + 1;
			EXIT WHEN vcompteur > n;
		END LOOP;
	
	END IF;
	
	RETURN vtotal;
	
END $$;


-- RECURSION OK  --> BIZARREMENT lorsqu'on inverse n=0 par n!=0 ça ne marche plus dépassement de capacité

CREATE OR REPLACE FUNCTION factorielle(n integer)
	
	RETURNS integer
	LANGUAGE plpgsql
	as $$
	
BEGIN

	IF n = 0 OR n = 1 THEN

		RETURN 1;
	
	ELSE 
	
		RETURN n * factorielle(n - 1);
	
	END IF;
	
END $$;

-- RECURSION OK

CREATE OR REPLACE FUNCTION factorielle(n integer)
	
	RETURNS integer
	LANGUAGE plpgsql
	as $$
	
BEGIN

	IF n = 0 THEN
		
		RETURN 1;
	
	ELSIF n = 1 THEN
		
		RETURN 1;
	
	ELSE
	
		RETURN n * factorielle(n - 1);
	
	END IF;
	
END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.2.sql
# Rôle ........ : Écrire un programme PL/SQL qui contient les éléments suivants :
— Une fonction récursive fFactR (n in number) calculant n!.
— Une procédure pFact (n in number) qui appelle la fonction fFactR.
— Un bloc PL/SQL anonyme qui appelle la procédure pFact.
— n doit être lu en dehors de fFactR et de pFact.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

----------------------------- FONCTION

CREATE OR REPLACE FUNCTION fFactR(n integer)

	RETURNS integer
	LANGUAGE plpgsql
	as $$
	
BEGIN

	IF n = 0 OR n = 1 THEN

	RETURN 1;
	
	ELSE 
	
		RETURN n * factorielle(n - 1);
	
	END IF;
	
END $$;

----------------------------- PROCEDURE

CREATE OR REPLACE PROCEDURE pFact(n integer)

	LANGUAGE plpgsql
	as $$

DECLARE

	result integer := fFactR(n);
	
BEGIN

	RAISE NOTICE '%', result;

END $$;

----------------------------- BLOC

DO $$

DECLARE

	n integer := 5;

BEGIN

	CALL pFact(n);
	
END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.3.sql
# Rôle ........ : Proposer une procédure affichant les nombres de 1 à n.
— n est un entier et doit être considéré comme paramètre de la procédure
— Proposer deux façons de tester le fonctionnement de cette procédure.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

--- V1 OK

CREATE OR REPLACE PROCEDURE compteN(n integer)

	LANGUAGE plpgsql
	as $$

DECLARE

	cpt integer := 1;

BEGIN
	
	LOOP
		RAISE NOTICE '%', cpt;
		cpt := cpt + 1;
		EXIT WHEN cpt > n;
	END LOOP;

END $$;

-- V2

CREATE OR REPLACE PROCEDURE compteN(n integer)

	LANGUAGE plpgsql
	as $$

DECLARE

	cpt integer := n;

BEGIN
	
	LOOP
		RAISE NOTICE '%', cpt;
		cpt := cpt - 1;
		EXIT WHEN cpt = 0 ;
	END LOOP;

END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.4.sql
# Rôle ........ : Proposer une fonction qui calcule et renvoie 2n + m 2 .
— n et m sont des entiers et doivent être considérés comme paramètres de la fonction.
— Aucune autre variable ne doit être déclarée.
— Proposer deux façons de tester le fonctionnement de cette fonction.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

CREATE OR REPLACE FUNCTION calcule(n int, m int)
	
	RETURNS integer
	LANGUAGE plpgsql
	as $$

BEGIN

	RETURN 2 * n + m * m;

END $$;



/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice2.5.sql
# Rôle ........ : Proposer une fonction qui calcule et renvoie 2n + m 2 .
— n et m sont des entiers et doivent être considérés comme paramètres de la fonction.
— Aucune autre variable ne doit être déclarée.
— Proposer deux façons de tester le fonctionnement de cette fonction.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

--OK
CREATE OR REPLACE PROCEDURE pAug(nEmp EMP.noEMP%TYPE, tAug numeric(3,2))

	LANGUAGE plpgsql
	AS $$

BEGIN
	
	UPDATE EMP SET sal = sal + sal * tAug/100 WHERE  noemp = nEMP;

END $$;

--OK 

DO $$
BEGIN
	CALL pAug(7369, 10.5);
END $$;

-- Pour vériier
SELECT noemp, nomemp, sal FROM EMP WHERE noemp = 7369;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.1.sql
# Rôle ........ : Écrire un bloc PL/SQL affichant le nombre de départements dont aucun employé ne touche une commission. Un département possédant un ou plusieurs employés ayant une commission >0 ne doit pas être considéré.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

--SELECT DISTINCT nodept FROM EMP WHERE comm IS NULL OR comm = 0;

DO $$

DECLARE

	curseur CURSOR FOR SELECT DISTINCT comm, nodept FROM EMP ORDER BY nodept; --ordre important
	
	comm_curseur EMP.comm%TYPE;
	dpt_curseur EMP.noDEPT%TYPE;

	dpt_éliminé EMP.noDEPT%TYPE; --stock le dpt éliminé
	cpt_ini int;
	cpt int; --compteur
	
BEGIN
	
	--SELECT DISTINCT count(nodept) INTO cpt FROM DEPT; --ini du compteur
	SELECT COUNT(*) INTO cpt FROM (SELECT DISTINCT nodept FROM EMP) AS SUB;
	
	cpt_ini := cpt;
	
	OPEN curseur;
	
		LOOP
		
			FETCH curseur INTO comm_curseur, dpt_curseur;
			
				IF comm_curseur > 0 THEN
					
					IF dpt_éliminé <> dpt_curseur OR dpt_éliminé IS NULL THEN
					
						dpt_éliminé := dpt_curseur ;
					
						cpt := cpt - 1;
						
						RAISE NOTICE 'Au moins un employé touche une commission dans le département %.', dpt_curseur;
					
					END IF;
					
					--RAISE NOTICE '% % % %', comm_curseur, dpt_curseur, cpt, dpt_éliminé;
					
				END IF;
				
			EXIT WHEN NOT FOUND;
			
		END LOOP;
		
	CLOSE curseur;
	
	RAISE NOTICE 'Aucun employé ne touche de commission dans % départements sur %.', cpt, cpt_ini;

END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.2.sql
# Rôle ........ : Écrire un bloc PL/SQL affichant le nombre de départements dont tous les employés touchent un salaire supérieur à 2000e.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 12/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */


DO $$

DECLARE

	curseur CURSOR FOR SELECT sal, nodept FROM EMP ORDER BY nodept; --ordre important
	
	sal_curseur EMP.sal%TYPE;
	dpt_curseur EMP.noDEPT%TYPE;

	dpt_éliminé EMP.noDEPT%TYPE; --stock le dpt éliminé
	cpt_ini int;
	cpt int; --compteur
	
BEGIN
	
	--SELECT DISTINCT count(nodept) INTO cpt FROM DEPT; --ini du compteur
	SELECT COUNT(*) INTO cpt FROM (SELECT DISTINCT nodept FROM EMP) AS SUB;
	
	cpt_ini := cpt;
	
	OPEN curseur;
	
		LOOP
		
			FETCH curseur INTO sal_curseur, dpt_curseur;
			
				IF sal_curseur <= 2000 THEN
					
					IF dpt_éliminé <> dpt_curseur OR dpt_éliminé IS NULL THEN
					
						dpt_éliminé := dpt_curseur ;
					
						cpt := cpt - 1;
						
						RAISE NOTICE 'Au moins un employé touche un salaire inférieur ou égal à 2000 dans le département %.', dpt_curseur;
					
					END IF;
					
					--RAISE NOTICE '% % % %', comm_curseur, dpt_curseur, cpt, dpt_éliminé;
					
				END IF;
				
			EXIT WHEN NOT FOUND;
			
		END LOOP;
		
	CLOSE curseur;
	
	RAISE NOTICE 'Tous les employés touchent un salaire supérieur à 2000 dans % départements sur %.', cpt, cpt_ini;

END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.3.sql
# Rôle ........ : Proposer un bloc PL/SQL qui affiche les noms des départements qui existent dans les deux tables EMP et DEPT.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 17/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */


DO $$

DECLARE
	
	curseur1 CURSOR FOR SELECT DISTINCT nomdept FROM DEPT, EMP WHERE EMP.nodept = DEPT.nodept;
	curseur2 CURSOR FOR SELECT nomdept FROM DEPT;
	
	nomdept_curseur DEPT.nomdept%TYPE;
	
BEGIN

	RAISE NOTICE 'La table EMP compte les départements suivants :';	
	
	OPEN curseur1;
			
		LOOP
		
			FETCH curseur1 INTO nomdept_curseur;
			
			EXIT WHEN NOT FOUND;
			
			RAISE NOTICE '%', nomdept_curseur;	
			
		END LOOP;
	
	CLOSE curseur1;
	
	RAISE NOTICE 'La table DEPT compte les départements suivants :';
	
	OPEN curseur2;
		
		LOOP
		
			FETCH curseur2 INTO nomdept_curseur;
			
			EXIT WHEN NOT FOUND;
			
			RAISE NOTICE '%', nomdept_curseur;	
			
		END LOOP;
		
	CLOSE curseur2;
	
END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.4.sql
# Rôle ........ : Proposer un bloc PL/SQL qui affiche le résultat suivant :
Avec :
— NDEPT : nom du département
— NOMBEMP : nombre d’employés
— MS1 est la moyenne des salaires par département. Seuls les salaires inférieurs ou égaux à 2500e sont à considérer.
— MS2 est la moyenne des salaires par département. Seuls les salaires supérieurs à 2500e sont à considérer.
— Seuls les employés n’ayant pas de commission sont à considérer.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 17/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

--SELECT nomdept, COUNT(*), AVG(sal), AVG() FROM EMP, DEPT WHERE EMP.nodept = DEPT.nodept GROUP BY 1;
SELECT EMP.nodept, DEPT.nomdept, sal, comm FROM EMP, DEPT WHERE EMP.nodept = DEPT.nodept ORDER BY nodept;

SELECT EMP.nodept, DEPT.nomdept, AVG(sal), comm FROM EMP, DEPT WHERE EMP.nodept = DEPT.nodept GROUP BY EMP.nodept, nomdept, comm ORDER BY nodept;

SELECT COUNT(nomdept) AS NOMBEMP, AVG(sal) AS MS1, AVG(sal) AS MS2 FROM EMP, DEPT
WHERE EMP.nodept = DEPT.nodept, 
;

SELECT AVG(sal) as MS1 FROM EMP WHERE sal <= 2500;
SELECT AVG(sal) AS MS2 FROM EMP WHERE sal > 2500;

--- OK!!!!
DO $$

DECLARE
	
	curseur CURSOR FOR SELECT DEPT.nomdept, EMP.nodept, sal, sal, comm 
					   FROM EMP, DEPT 
					   WHERE EMP.nodept = DEPT.nodept 
					   ORDER BY EMP.nodept;
	
	ndept DEPT.nomdept%TYPE;
	numdpt EMP.nodept%TYPE;
	nombemp int := 0;
	ms1 EMP.sal%TYPE;
	ms2 EMP.sal%TYPE;
	
	
	vcomm EMP.comm%TYPE;
	ndept_actu DEPT.nomdept%TYPE;
	sal1 EMP.sal%TYPE := 0;
	sal2 EMP.sal%TYPE := 0;
	cpt1 int;
	cpt2 int;
	
BEGIN
	
	OPEN curseur;
	
	RAISE NOTICE '     NDEPT     |    NOMBEMP    |      MS1      |      MS2      '; --par 15
	RAISE NOTICE '---------------+---------------+---------------+---------------';
	
	LOOP
	
		FETCH curseur INTO ndept, numdpt, sal1, sal2, vcomm;
			
		IF vcomm IS NULL OR vcomm = 0 THEN	--si la comm est inexistante ou nulle ...
			
			IF ndept = ndept_actu THEN -- tant qu'on est au même numéro de dpt alors ...
				
				nombemp := nombemp + 1; -- on compte le nombre d'employés
				
				IF sal1 <= 2500 THEN -- si <= 2500
					
					cpt1 := cpt1 + 1;
					ms1 := (ms1 + sal1)/cpt1;--  on fait la moyenne 1
										
				ELSE -- si >2500
					
					cpt2 := cpt2 + 1;
					ms2 := (ms2 + sal2)/cpt2;--  on fait la moyenne 2
					
				END IF;
			
			ELSE -- dès que le numéro de dpt change...
				
				IF ndept_actu IS NULL THEN
				
					ndept_actu := ndept; -- initialise ndept_actu
					
				ELSE
				
					RAISE NOTICE '    %    |    %    |    %    |    %', ndept_actu, nombemp, ms1, ms2;
					
					ndept_actu := ndept; -- (ré)initialise ndept_actu
				
				END IF;
				
				nombemp := 1; -- réini nb d'employés
				cpt1 := 0;
				cpt2 := 0;
				
				IF sal1 <= 2500 THEN -- si <= 2500, réini
				
					ms1 := sal1;
					ms2 := 0;
				
				ELSE  -- si >2500, réini
					
					ms1 := 0;
					ms2 := sal2;
				
				END IF;

			END IF;
		
		END IF;
		
	EXIT WHEN NOT FOUND;
		
	END LOOP;
	
	CLOSE curseur;
	
END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.5.sql
# Rôle ........ : Proposer un bloc PL/SQL affichant les noms des employés du département "VENTES" dont le salaire > 1400 e.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 17/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

SELECT EMP.nodept, DEPT.nomdept, nomemp, sal 
					   FROM EMP, DEPT 
					   WHERE EMP.nodept = DEPT.nodept 
					   ORDER BY nodept;
					   
DO $$

DECLARE

	curseur CURSOR FOR SELECT DEPT.nomdept, nomemp, sal 
					   FROM EMP, DEPT 
					   WHERE EMP.nodept = DEPT.nodept 
					   ORDER BY EMP.nodept;
					   
	vnomdept DEPT.nomdept%TYPE;
	vnomemp EMP.nomemp%TYPE;
	vsal EMP.sal%TYPE;

BEGIN

	OPEN curseur;
	
	LOOP
	
		FETCH curseur INTO vnomdept, vnomemp, vsal;
		
		IF vnomdept ='VENTES' AND vsal > 1400 THEN
		
			RAISE NOTICE '%', vnomemp;
		
		END IF;
	
	EXIT WHEN NOT FOUND;
		
	END LOOP;
	
	CLOSE curseur;

END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.6.sql
# Rôle ........ : Proposer un bloc PL/SQL permettant de recopier le contenu de la table EMP avec augmentation de la commission de 50% dans la table EMPBIS possédant le même schéma que EMP. On suppose que la table EMPBIS existe et est vide.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 17/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

DROP TABLE IF EXISTS EMPBIS;

CREATE TABLE EMPBIS(
NoEMP NUMERIC(4) NOT NULL,
NomEMP VARCHAR(10),
EMPLOI VARCHAR(15),
MGR NUMERIC(4),
DateEMB DATE,
SAL NUMERIC(7,2),
COMM NUMERIC(7,2),
NoDEPT NUMERIC(2),
CONSTRAINT EMPBIS_clé_primaire PRIMARY KEY (NoEMP));


DO $$

DECLARE

	curseur CURSOR FOR SELECT * FROM EMP;
	
	vnoemp EMP.noemp%TYPE;
	vnomemp EMP.nomemp%TYPE;
	vemploi EMP.emploi%TYPE;
	vmgr EMP.mgr%TYPE;
	vdateemb EMP.dateemb%TYPE;
	vsal EMP.sal%TYPE;
	vcomm EMP.comm%TYPE;
	vnodept EMP.nodept%TYPE;
	
BEGIN

	OPEN curseur;
	
	LOOP
		
		FETCH curseur INTO vnoemp, vnomemp, vemploi, vmgr, vdateemb, vsal, vcomm, vnodept;
		
		EXIT WHEN NOT FOUND;
			
		INSERT INTO EMPBIS VALUES (vnoemp, vnomemp, vemploi, vmgr, vdateemb, vsal, (vcomm * 1.5), vnodept);
			
	END LOOP;
			
	CLOSE curseur;

END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice3.7.sql
# Rôle ........ : Proposer un bloc PL/SQL qui vérifie à partir de son nom donné, l’existence d’un département (par son numéro) dans la table EMP.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 17/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

DO $$

DECLARE

	curseur CURSOR FOR SELECT nodept, nomdept FROM DEPT;
	
	vnodept DEPT.nodept%TYPE;
	vnomdept DEPT.nomdept%TYPE;
	
BEGIN
	
	OPEN curseur;
	
	LOOP
		
		FETCH curseur INTO vnodept, vnomdept;
		
		EXIT WHEN NOT FOUND;
		
		IF vnodept IN (SELECT DISTINCT nodept FROM EMP) THEN
			
			RAISE NOTICE 'Le département % % existe dans EMP.',vnodept, vnomdept;
			
		ELSE
			
			RAISE NOTICE 'Le département % % n''existe pas dans EMP.',vnodept, vnomdept;
			
		END IF;

	END LOOP;
	
	CLOSE curseur;

END $$;


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.1.sql
# Rôle ........ : On souhaite interdire toute opération n’ayant pas pour objet la simple consultation de la table DEPT après 17H00.
Proposer un déclencheur assurant cette tâche.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 17/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

-- FUNCTION

CREATE OR REPLACE FUNCTION log_no_change_after_5pm()
	
	RETURNS TRIGGER	LANGUAGE PLPGSQL AS $$

BEGIN
	
	IF DATE_PART('hour', now()) >= 17 THEN
	
		--RAISE NOTICE 'ÉCHEC';
		RAISE EXCEPTION E'Tentative à % h %.\nDéclencheur = %\nTable ciblée = %\nopération = %',
		DATE_PART('hour', now()), DATE_PART('minute', now()), TG_NAME, TG_TABLE_NAME, TG_OP
					USING DETAIL = 'Mise à jour interdite après 17h.'; --E important
	
	ELSE
	
		RETURN NEW;
		
	END IF;
	
END $$; 

--TRIGGER semble OK

DROP TRIGGER IF EXISTS no_change_after_5pm ON EMP;

ALTER TABLE EMP DISABLE TRIGGER no_change_after_5pm; 

CREATE TRIGGER no_change_after_5pm

	BEFORE INSERT OR UPDATE OR DELETE
	ON EMP	
	FOR EACH STATEMENT
	EXECUTE PROCEDURE log_no_change_after_5pm();

-- TEST

UPDATE EMP SET sal = 800 WHERE nomemp = 'SERGE';	


/* MÉTADONNÉES 
# *******************************************************
# Nom ......... : Exercice4.2.sql
# Rôle ........ : On souhaite interdire de manière automatique toute insertion d’un salaire < 500e. Proposer un déclencheur assurant cette tâche.
# Auteur ...... : DIAGNE Moustapha
# Version ..... : V0.1 du 18/06/2022
# Licence ..... : réalisé dans le cadre du cours de base de données (TD5)
# (../..)
# Compilation : gcc (GNU COMPILER COLLECTION)
# Usage : Exercice de cours, TD5
#******************************************************* */

-- FONCTION TRIGGER

CREATE OR REPLACE FUNCTION log_no_sal_under_500e()

	RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
	
BEGIN

	IF NEW.sal < 500 THEN
	
		RAISE EXCEPTION E'Tentative à % h %.\nDéclencheur = %\nTable ciblée = %\nopération = %',
		DATE_PART('hour', now()), DATE_PART('minute', now()), TG_NAME, TG_TABLE_NAME, TG_OP
					USING DETAIL = 'Insertion d''un salaire inférieur à 500 interdite.';

	ELSE
		
		RAISE NOTICE E'%\n', NEW.sal;
		RETURN NEW;
	
	END IF;

END $$;

-- TRIGGER
DROP TRIGGER IF EXISTS no_sal_under_500e ON EMP;

CREATE TRIGGER no_sal_under_500e

	AFTER INSERT ON EMP
	FOR EACH ROW
	EXECUTE PROCEDURE log_no_sal_under_500e();
	

INSERT INTO EMP VALUES (7953, 'JIMMY', 'VENDEUR', 7839, '20-MAY-2015', 400, NULL, 10);
