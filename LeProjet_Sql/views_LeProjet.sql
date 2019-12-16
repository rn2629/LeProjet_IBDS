
USE LeProjet_Rodrigue
Go

CREATE VIEW vueArme_Perso
AS
SELECT ap.persoId AS 'Id Personnage', ar.nom AS 'Nom Arme', ar.type AS 'Type Arme', CONCAT(ar.nbDeDegat,'d',ar.deDegat) AS 'Dégat'
FROM tblArme AS ar
	JOIN tblArme_Perso AS ap
		ON ap.armeId = ar.id
GROUP BY ap.persoId, ar.nom, ar.type, CONCAT(ar.nbDeDegat,'d',ar.deDegat);
Go


CREATE VIEW vueArmure_Perso
AS
SELECT ap.persoId AS 'Id Personnage', ar.nom AS 'Nom Armure', ar.type AS 'Type Armure', ar.categorieTaille AS 'Categorie de poids', ar.bonusDexMax AS 'Bonus Dex Max', ar.bonusCa AS 'Bonus CA', ar.CategoriePoids AS 'Poids Armure'
FROM tblArmure AS ar
	JOIN tblArmure_Perso AS ap
		ON ap.armureId = ar.id
GROUP BY ap.persoId, ar.nom, ar.type, ar.categorieTaille, ar.bonusDexMax, ar.bonusCa, ar.CategoriePoids;
Go


CREATE VIEW vuePersonnage
AS
SELECT j.id AS 'Id Joueur', 
		p.nom AS 'Nom',  
		a.abreviation AS 'Alignement', 
		cl.nom AS 'Classe', 
		cl.deVie AS 'Dé Vie', 
		cl.bonusReflex AS 'Bonus Réflexe',
		cl.bonusVigueur AS 'Bonus Vigueur', 
		cl.bonusVolonte AS 'Bonus Volonté', 
		cl.bonusCompetence AS 'Bonus Compétence', 
		p.niveau AS 'Niveau', 
		p.race AS 'Race',
		p.genre AS 'Genre', 
		p.age AS 'Âge', 
		p.taille AS 'Taille', 
		p.yeux AS 'Couleur Yeux',
		p.cheveux AS 'Couleur Cheveux',
		(SUM(arme.poidsKg)+SUM(armu.poidsKg)+p.poids) AS 'Poids total',
		ca.force AS 'Force', 
		ca.dexterite AS 'Dextérité',
		ca.constitution AS 'Constitution', 
		ca.intelligence AS 'Intelligence', 
		ca.sagesse AS 'Sagesse', 
		ca.charisme AS 'Charisme', 
		ca.competences AS 'Compétences', 
		(10+SUM(armu.bonusCa)+MIN(armu.bonusDexMax)) AS 'Classe Armure'
		 
FROM tblPersonnage AS p
	JOIN tblJoueur AS j
		ON j.id = p.id
	JOIN tblAlignement AS a	
		ON a.id = p.alignement
	JOIN tblClasse AS cl
		ON cl.id = p.classe
	JOIN tblArmure_Perso AS armup
		ON armup.persoId = p.id
	JOIN tblArme_Perso AS armep
		ON armep.persoId = p.id
	JOIN tblArmure AS armu
		ON armu.id=armup.armureId
	JOIN tblArme AS arme
		ON arme.id=armep.armeId
	JOIN tblCaracteristiques AS ca
		ON ca.personnage=p.id
GROUP BY  j.id, 
		p.nom, 
		a.abreviation,
		cl.nom, 
		cl.deVie,
		cl.bonusReflex,
		cl.bonusVigueur,
		cl.bonusVolonte, 
		cl.bonusCompetence, 
		p.niveau, 
		p.race, 
		p.genre, 
		p.age, 
		p.taille, 
		p.yeux, 
		p.cheveux,		
		ca.force, 
		ca.dexterite,
		ca.constitution,
		ca.intelligence,
		ca.sagesse,
		ca.charisme,
		ca.competences,
		p.poids;