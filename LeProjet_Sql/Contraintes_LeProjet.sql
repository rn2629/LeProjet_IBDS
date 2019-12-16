# --------------------------------------------------------
# Création des Contraintes LeProjet             
# base de données LeProjet.
# Fait par : Rodrigue Ngampiep
# 
# --------------------------------------------------------



USE LeProjet_Rodrigue
GO 

/****** Creations Cles Primaires ******/

ALTER TABLE tblClasse		    ADD PRIMARY KEY (id);
ALTER TABLE tblCaracteristiques ADD PRIMARY KEY (id);
ALTER TABLE tblCategorieTaille	ADD PRIMARY KEY (id);
ALTER TABLE tblArmure			ADD PRIMARY KEY (id);
ALTER TABLE tblPersonnage		ADD PRIMARY KEY (id);
ALTER TABLE tblRace				ADD PRIMARY KEY (id);
ALTER TABLE tblBonusRace	    ADD PRIMARY KEY (caracteristique);
ALTER TABLE tblArme				ADD PRIMARY KEY (id);
ALTER TABLE tblDivinite			ADD PRIMARY KEY	(id);
ALTER TABLE tblJoueur			ADD PRIMARY KEY (id);
ALTER TABLE tblAlignement		ADD PRIMARY KEY (id);
ALTER TABLE tblArme_Perso		ADD PRIMARY KEY (armeId);
ALTER TABLE tblArme_Perso		ADD PRIMARY KEY (persoId);
ALTER TABLE tblArmure_Perso		ADD PRIMARY KEY (armureId);
ALTER TABLE tblArmure_Perso		ADD PRIMARY KEY (persoId);

/****** Creations Cles Secondaires ******/

ALTER TABLE tblPersonnage 	 	ADD FOREIGN KEY(joueur)    	     REFERENCES tblJoueur(id);
ALTER TABLE tblDivinite   	 	ADD FOREIGN KEY(alignement) 	 REFERENCES tblAlignement(id);
ALTER TABLE tblPersonnage 	 	ADD FOREIGN KEY(alignement) 	 REFERENCES tblAlignement(id);
ALTER TABLE	tblPersonnage 	 	ADD FOREIGN KEY(classe) 	 	 REFERENCES tblClasse(id);
ALTER TABLE tblPersonnage 	 	ADD FOREIGN KEY(race)	 	     REFERENCES tblRace(id);
ALTER TABLE tblPersonnage 	 	ADD FOREIGN KEY(divinite)   	 REFERENCES tblDivinite(id);
ALTER TABLE tblCaracteristiques ADD FOREIGN KEY(personnage) 	 REFERENCES tblPersonnage(id);
ALTER TABLE tblBonusRace  	 	ADD FOREIGN KEY(race)       	 REFERENCES tblRace(id);
ALTER TABLE tblRace			    ADD FOREIGN KEY(categorieTaille) REFERENCES tblCategorieTaille(id);
ALTER TABLE tblArmure  		    ADD FOREIGN KEY(categorieTaille) REFERENCES tblCategorieTaille(id);
ALTER TABLE tblArme		 	    ADD FOREIGN KEY(categorieTaille) REFERENCES tblCategorieTaille(id);
ALTER TABLE tblArme_Perso 		ADD FOREIGN KEY(armeId)		  	 REFERENCES tblArme(id);
ALTER TABLE tblArme_Perso       ADD FOREIGN KEY(persoId)		 REFERENCES tblPersonnage(id);
ALTER TABLE tblArmure_Perso 	ADD FOREIGN KEY(armureId)	     REFERENCES tblArmure(id);
ALTER TABLE tblArmure_Perso	    ADD FOREIGN KEY(persoId)	 	 REFERENCES tblPersonnage(id);

/****** Contraintes et  Autres ******/

ALTER TABLE tblArmure  	  ADD CONSTRAINT DefautBonus 	 DEFAULT 0 FOR bonusDexMax;
ALTER TABLE tblArmure 	  ADD CONSTRAINT DefautCa		 DEFAULT 0 FOR bonusCA;
ALTER TABLE tblArmure 	  ADD CONSTRAINT DefautPoids	 DEFAULT 1 FOR poidsKg;
ALTER TABLE tblPersonnage ADD gamerTag   varchar(10)     NOT NULL;
ALTER TABLE tblRace		  ADD ageAdulte  INT			 NOT NULL;
ALTER TABLE tblArme		  ADD nbDeDegat  INT 			 NOT NULL;
ALTER TABLE tblPersonnage ADD CONSTRAINT Unique_gamerTag UNIQUE (gamerTag);
ALTER TABLE tblRace 	  ADD CONSTRAINT Langue_Defaut   DEFAULT 'Commun' FOR langue;
ALTER TABLE tblArme 	  ADD CONSTRAINT True_False		 DEFAULT 0 FOR deuxMains;
ALTER TABLE tblArme		  ADD poids	     float			 NOT NULL;
ALTER TABLE tblCaracteristiques ADD force INT  NOT NULL;
