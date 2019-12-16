# --------------------------------------------------------
# Création de la Base de Données LeProjet             
# base de données LeProjet.
# Fait par : Rodrigue Ngampiep
# 
# --------------------------------------------------------



USE LeProjet_Rodrigue
GO 

CREATE TABLE tblJoueur
(
	id         int IDENTITY(1,1)  	NOT NULL,
	nom	       VARCHAR(50) 	 	    NOT NULL,
	prenom     VARCHAR(50)    	    NOT NULL,
	gamerTag   VARCHAR(50) 	        NOT NULL,
	motDePasse binary(64)	        NOT NULL,
	sel        UniqueIdentifier     NULL
);

CREATE TABLE tblClasse
(
	id INT IDENTITY(1,1) NOT NULL,
	nom VARCHAR(25) 	 NOT NULL,
	deVie INT 			 NOT NULL,
	bonusReflex INT 	 NOT NULL,
	bonusVigueur INT 	 NOT NULL,
	bonusVolonte INT 	 NOT NULL,
	bonusCompetence INT  NOT NULL
);

CREATE TABLE tblDivinite 
(
	id INT IDENTITY(1,1) NOT NULL,
	nom VARCHAR(50) 	 NOT NULL,
	alignement INT 		 NOT NULL
);
	
CREATE TABLE tblAlignement
(
	id INT IDENTITY(1,1) NOT NULL,
	morale varchar(25)   NOT NULL,
	ethique varchar(25)  NOT NULL,
	abreviation char(2)  NOT NULL
);

CREATE TABLE tblArme
(
	id INT IDENTITY(1,1)  NOT NULL,
	nom varchar(100)	  NOT NULL,
	categorie varchar(50) NOT NULL,
	type varchar(50) 	  NOT NULL,
	deuxMains bit	      NULL,
	categorieTaille INT   NOT NULL,
	deDegat	INT			  NOT NULL,
	ndDeDegat INT 		  NOT NULL
);

CREATE TABLE tblArme_Perso
(
	armeId INT   NOT NULL,
	persoId INT  NOT NULL
);

CREATE TABLE tblCategorieTaille
(
	id INT IDENTITY(1,1) NOT NULL,
	nom varchar(25) 	 NOT NULL,
	abreviation char(1)  NOT NULL,
	poidsMinKg float 	 NOT NULL,
	tailleMin INT 		 NOT NULL,
	tailleMax INT 		 NOT NULL
);

CREATE TABLE tblArmure
(
	id INT IDENTITY(1,1)	   NOT NULL,
	nom varchar(100) 		   NOT NULL,
	type varchar(50)   		   NOT NULL,
	categoriePoids varchar(50) NOT NULL,
	categorieTaille INT 	   NOT NULL,
	bonusDexMax		INT 	   NOT NULL,
	bonusCA			INT		   NOT NULL,
	poidsKg 		float 	   NOT NULL
);

CREATE TABLE tblArmure_Perso
(
	armureId INT  NOT NULL,
	persoId  INT  NOT NULL
);

CREATE TABLE tblRace
(
	id INT IDENTITY(1,1)  NOT NULL,
	nom varchar(50)		  NOT NULL,
	categorieTaille INT   NOT NULL,
	ageAdullte INT		  NOT NULL,
	ageAvance  INT 		  NOT NULL,
	langue 	 varchar(MAX) NULL
);

CREATE TABLE tblBonusRace
(
	caracteristique varchar(50) NOT NULL,
	race INT 					NOT NULL,
	bonus INT 					NOT NULL
);

CREATE TABLE tblCaracteristiques
(
	id INT IDENTITY(1,1)	 NOT NULL,
	personnage INT 			 NOT NULL,
	fone INT		 	 	 NOT NULL,
	dexterite INT 			 NOT NULL,
	constitution INT 		 NOT NULL,
	intelligence INT 		 NOT NULL,
	sagesse 	 INT 		 NOT NULL,
	charisme  	 INT 		 NOT NULL,
	competences  varchar(MAX) 	 NOT NULL
);

CREATE TABLE tblPersonnage
(
	id          INT IDENTITY(1,1)   NOT NULL,
	nom         varchar(50)	        NOT NULL,
	divinite    INT 		    	NOT NULL,	
	alignement  INT 		   	    NOT NULL,
	classe		INT 	    	    NOT NULL,
	niveau      INT 	   		    NOT NULL,
	race 	    INT 	   		    NOT NULL,
	genre 		char(1)	            NOT NULL,
	age 		INT	  	            NOT NULL,
	taille 		INT                 NOT NULL,
	poids       float               NOT NULL,
	yeux 	    varchar(50)         NOT NULL,
	cheveux		varchar(50)         NOT NULL,
	joueur 		INT 		        NOT NULL
);
	
