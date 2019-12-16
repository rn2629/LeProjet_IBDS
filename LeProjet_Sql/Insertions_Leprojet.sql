

USE LeProjet_Rodrigue
Go

INSERT INTO tblArmure (nom, type,categoriePoids,categorieTaille,bonusDexMax,bonusCA, poidsKg)/*good*/
VALUES ('Armure de cuire', 	'Armure', 	'Légère', 			1, 	6, 		2,	3.75),
	   ('Armure de cuire', 	'Armure', 	'Légère', 			2, 	2, 		2,	7.5),
	   ('Armure de cuire', 	'Armure', 	'Légère', 			3, 	3, 		2,	15),
	   ('Cotte de mailles', 'Armure', 	'Intermédiaire', 	3, 	2, 		4,	10),
	   ('Cotte de mailles', 'Armure', 	'Intermédiaire', 	1, 	2, 		4,	20),
       ('Cotte de mailles', 'Armure', 	'Intermédiaire', 	2, 	2, 		4,	40),
	   ('Harnois', 			'Armure', 	'Lourde', 			3, 	1, 		8,	12.5),
	   ('Harnois', 			'Armure', 	'Lourde', 			1, 	1, 		8,	25),
	   ('Harnois', 			'Armure', 	'Lourde', 			2, 	1, 		8,	50),
	   ('Targe', 			'Bouclier', 'Légère', 			3, 	1, 	1,	1.25),
	   ('Targe', 			'Bouclier', 'Légère', 			1, 	2, 	1,	2.5),
   	   ('Targe', 			'Bouclier', 'Légère', 			2, 	3, 	1,	5),
	   ('Écu en acier', 	'Bouclier', 'Intermédiaire', 	3, 	1, 	2,	3.75),
	   ('Écu en acier', 	'Bouclier', 'Intermédiaire', 	1, 	2, 	2,	7.5),
	   ('Écu en acier', 	'Bouclier', 'Intermédiaire', 	2, 	3, 	2,	15),
	   ('Pavois', 			'Bouclier', 'Lourde', 			3, 	2, 		1,	11.25),
	   ('Pavois', 			'Bouclier', 'Lourde', 			1, 	2, 		2,	22.5),
	   ('Pavois', 			'Bouclier', 'Lourde', 			2, 	2, 		3,	45);

	   						
INSERT INTO tblClasse (nom,deVie,bonusReflex, bonusVigueur,bonusVolonte, bonusCompetence)	/*good*/	
VALUES	('Barbare',	12,	2,	5,	2,	4),
('Barde', 6,	5,	2,	5,	6),
('Druide',		8,	2,	5,	5,	4),
('Ensorceleur', 4,	5,	2,	5,	2),
('Guerrier',	10,	2,	5,	2,	2),
('Magicien',	4,	2,	2,	5,	2),
('Moine',		8,	5,	5,	5,	4),
('Paladin',	10,	2,	5,	2,	2),
('Prêtre',		8,	2,	5,	5,	2),
('Rôdeur',		8,	5,	5,	2,	6),
('Roublard',	6,	5,	2,	2,	8);
				
INSERT INTO tblRace (nom,categorieTaille,ageAdulte,ageAvance,langue)  /* good*/
VALUES ('Humain',	3,	15, 53,	'Commun'),
('Demie-elfe',	1,	20, 93,	'Commun|Elfe'),
('Demi-orque',	2,	14, 45,	'Commun|Orque'),
('Elfe',	1,	110, 350,	'Commun|Elfe'),
('Gnome',	2,	40, 200,	'Commun|Gnome'),
('Halfelin', 2,	20, 100,	'Commun|Halfelin'),
('Nain',	1,	40, 250,	'Commun|Nain');

INSERT INTO tblBonusRace ([race],[caracteristique],[bonus])	
VALUES (0,	'Competences',4),
(2,	'Force',	2),
(2,	'Intelligence',-2),
(2,	'Charisme',	-2),
(3,	'Dextérité',2),
(3,	'Constitution',-2),
(4,	'Constitution',2),
(4,	'Force',	-2),
(5,	'Dextérité',2),
(5,	'Force',	-2),
(6,	'Constitution',2),
(6,	'Charisme',	-2);
						



INSERT INTO tblArme (nom,categorie,type,deuxMains,categorieTaille,deDegat, nbDeDegat) /*good*/
VALUES	
('Dague',	'Courante',	'Corps à corps',	0,	1,	3,1),
('Dague',	'Courante',	'Corps à corps',	0,	2,	4,1),
('Dague',	'Courante',	'Corps à corps',	0,	3,	6,1),
('Masse d''armes lourde',	'Courante',	'Corps à corps',	0,	1,	6,1),
('Masse d''armes lourde',	'Courante',	'Corps à corps',	0,	2,	8,1),
('Masse d''armes lourde',	'Courante',	'Corps à corps',	0,	3,	10,1),
('Lance',	'Courante',	'Corps à corps',	1,		1,	6,1),
('Lance',	'Courante',	'Corps à corps',	1,		2,	8,1),
('Lance',	'Courante',	'Corps à corps',	1,		3,	10,1),
('Arbalète légère',		'Courante',	'Distance',		1,		1,	6,1),
('Arbalète légère',		'Courante',	'Distance',		1,		2,	8,1),
('Arbalète légère',		'Courante',	'Distance',		1,		3,	10,1),
('Hachette','Guerre',		'Corps à corps',	0,	1,	4,1),
('Hachette','Guerre',		'Corps à corps',	0,	2,	6,1),
('Hachette','Guerre',		'Corps à corps',	0,	3,	8,1),
('Fléau d''arme léger',		'Guerre',		'Corps à corps',	0,	1,	6,1),
('Fléau d''arme léger',		'Guerre',		'Corps à corps',	0,	2,	8,1),
('Fléau d''arme léger',		'Guerre',		'Corps à corps',	0,	3,	10,1),
('Épée à deux mains',		'Guerre',		'Corps à corps',	1,		1,10,1),
('Épée à deux mains',		'Guerre',		'Corps à corps',	1,		2,	6,2),
('Épée à deux mains',		'Guerre',		'Corps à corps',	1,		3,	8,2),
('Arc long','Guerre',		'Distnace',		1,		1,	6,1),
('Arc long','Guerre',		'Distnace',		1,		2,	8,1),
('Arc long','Guerre',		'Distnace',		1,		3,	10,1),
('Nunchaku','Exotique',	'Corps à corps',	0,	1,	4,1),
('Nunchaku','Exotique',	'Corps à corps',	0,	2,	6,1),
('Nunchaku','Exotique',	'Corps à corps',	0,	3,	8,1),
('Hache de guerre naine',	'Exotique',	'Corps à corps',	0,	1,	8,1),
('Hache de guerre naine',	'Exotique',	'Corps à corps',	0,	2,	10,1),
('Hache de guerre naine',	'Exotique',	'Corps à corps',	0,	3,	12,1),
('Chaîne cloutée',			'Exotique',	'Corps à corps',	1,		1,	6,1),
('Chaîne cloutée',			'Exotique',	'Corps à corps',	1,		2,	4,2),
('Chaîne cloutée',			'Exotique',	'Corps à corps',	1,		3,	6,2),
('Shuriken','Exotique',	'Distance',		0,	1, 1, 1),
('Shuriken','Exotique',	'Distance',		0,	2,	2, 1),
('Shuriken','Exotique',	'Distance',		0,	3,	3, 1);

INSERT INTO tblDivinite (nom,alignement ) /* good*/
VALUES	('Aurile, déesse de l''hiver',	7),
('Azouth, dieu des magiciens',	3),
('Baine, dieu de la tyrannie',6),
('Beshaba, déesse de la malchance',8),
('Bhaal, dieu du meurtre',	7),
('Chauntéa, déesse de l''agriculture',	1),
('Cyric, dieu du mensonge',	8),
('Déneïr, dieu de l''écriture',	1),
('Eldath, déesse de la paix',	9),
('Gond, dieu de l''artisanat',4),
('Heaum, dieu de la protection',3),
('Ilmater, dieu de l''endurance',9),
('Kelemvor, dieu de la mort',	3),
('Lathandre, dieu de la naissance et du renouveau',	1),
('Leira, déesse de l''illusion',5),
('Lliira, déesse de la joie',	2),
('Loviatar, déesse de la douleur',6),
('Malar, dieu de la chasse',	8),
('Mask, dieu des voleurs',	5),
('Mailikki, déesse des forêts',	1),
('Milil, dieu de la poésie et des chants',	1),
('Myrkul, dieu de la mort',	7),
('Mystra, déesse de la magie',	1),
('Oghma, dieu de la connaissance',	4),
('Savras, dieu de la divination et du destin',	3),
('Séluné, déesse de la lune',	2),
('Shar, déesse des ténèbres et de l''égarement',	7),
('Sunie, déesse de la beauté et de l''amour',	2),
('Sylvanus, dieu de la nature sauvage',	4),
('Talona, déesse des maladies et du poison',	8),
('Talos, dieu des tempêtes',	7),
('Tempus, dieu de la guerre',	4),
('Torm, dieu du courage et du sacrifice de soi',	9),
('Tymora, déesse de la bonne fortune',	2),
('Tyr, dieu de la justice',	9),
('Umberlie, déesse des océans',	8),
('Waukyne, déesse du commerce',	4);
	
INSERT INTO tblCategorieTaille (nom,abreviation, poidsMinKg,tailleMin,tailleMax)/*good*/
VALUES('Petit','P', 3.6, 60, 122),
('Moyen', 'M', 27, 122, 244),
('Grand', 'G', 226, 244, 488);
					
INSERT INTO tblAlignement (morale,ethique, abreviation)/*good*/
VALUES ('Loyal',		'Bon', 'LB'),
('Neutre',		'Bon', 'NB'),
('Chaotique',	'Bon', 'CB'),
('Loyal',		'Neutre', 'LN'),
('Neutre',		'Neutre', 'NN'),
('Chaotique',	'Neutre', 'CN'),
('Loyal',		'Mauvais', 'LM'),
('Neutre',		'Mauvais', 'NM'),
('Chaotique',	'Mauvais', 'CM');



INSERT INTO tblPersonnage(nom, divinite,alignement,classe,niveau,race, genre,age,taille,poids,yeux,cheveux,joueur,gamerTag)/*good*/
VALUES (				 'WRAITH', 16, 	1, 			5, 	  120, 		10,	'F', 30, 185, 60,     'Bleu','Noir',1,'RN2629_CMR');