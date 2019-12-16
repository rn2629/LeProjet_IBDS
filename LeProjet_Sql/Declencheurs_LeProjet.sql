

CREATE TRIGGER insert_Personnage
ON tblPersonnage
AFTER INSERT AS
BEGIN
	DECLARE @age INT
	DECLARE @ageMin INT
	DECLARE @ageMax INT
	DECLARE @race INT
	DECLARE @genre CHAR(1)
	DECLARE @niveau INT
	SELECT @age = age FROM INSERTED
	SELECT @genre = genre FROM INSERTED
	SELECT @niveau = niveau FROM INSERTED
	SELECT @race = race FROM INSERTED;
	IF(@genre = 'F' OR @genre = 'M')
	BEGIN
		IF(@niveau >= 1 AND @niveau <= 20)
		BEGIN
			SELECT @ageMin = (SELECT ageAdulte FROM tblRace WHERE id = @race)
			SELECT @ageMax = (SELECT ageAvance FROM tblRace WHERE id = @race)
			IF(NOT(@age >= @ageMin AND @age <= @ageMax))
			BEGIN
				PRINT 'Age invalide';
				ROLLBACK TRANSACTION;
			END;
		END;
		ELSE
		BEGIN
			PRINT 'Niveau invalide';
			ROLLBACK TRANSACTION;
		END;
	END;
	ELSE
	BEGIN
		PRINT 'Genre invalide';
		ROLLBACK TRANSACTION;
	END;
END;

GO
CREATE TRIGGER updatePersonnage
ON tblPersonnage
AFTER UPDATE AS
BEGIN
	DECLARE @age INT
	DECLARE @ageMin INT
	DECLARE @ageMax INT
	DECLARE @race INT
	DECLARE @genre CHAR(1)
	DECLARE @niveau INT
	SELECT @age = age FROM INSERTED
	SELECT @genre = genre FROM INSERTED
	SELECT @niveau = niveau FROM INSERTED
	SELECT @race = race FROM INSERTED
	IF(@genre = 'F' OR @genre = 'M')
	BEGIN
		IF(@niveau >= 1 AND @niveau <= 20)
		BEGIN
			SELECT @ageMin = (SELECT ageAdulte FROM tblRace WHERE id = @race)
			SELECT @ageMax = (SELECT ageAvance FROM tblRace WHERE id = @race)
			IF(NOT(@age >= @ageMin AND @age <= @ageMax))
			BEGIN
				PRINT 'Age invalide';
				ROLLBACK TRANSACTION;
			END;
		END;
		ELSE
		BEGIN
			PRINT 'Niveau invalide';
			ROLLBACK TRANSACTION;
		END;
	END;
	ELSE
	BEGIN
		PRINT 'Genre non valide';
		ROLLBACK TRANSACTION;
	END;
END;


GO
CREATE TRIGGER caracteristiquesVerif
ON tblCaracteristiques
AFTER INSERT AS
BEGIN
	DECLARE @id INT
	DECLARE @force INT
	DECLARE @dexterite INT
	DECLARE @constitution INT
	DECLARE @intelligence INT
	DECLARE @sagesse INT
	DECLARE @charisme INT
	DECLARE @bonusForce INT
	DECLARE @bonusDexterite INT
	DECLARE @bonusConstitution INT
	DECLARE @bonusIntelligence INT
	DECLARE @bonusSagesse INT
	DECLARE @bonusCharisme INT
	SELECT @id = personnage FROM INSERTED
	SELECT @force =	force FROM INSERTED
	SELECT @dexterite = dexterite FROM INSERTED
	SELECT @constitution = constitution FROM INSERTED
	SELECT @intelligence = intelligence FROM INSERTED
	SELECT @sagesse = sagesse FROM INSERTED
	SELECT @charisme = charisme FROM INSERTED
	SELECT @bonusForce = (SELECT tblBonusRace.bonus FROM tblPersonnage JOIN tblRace ON tblPersonnage.race = tblRace.id JOIN tblBonusRace ON tblBonusRace.race = tblRace.id WHERE tblPersonnage.id = @id AND tblBonusRace.caracteristique = 'force')
	SELECT @bonusDexterite = (SELECT tblBonusRace.bonus FROM tblPersonnage JOIN tblRace ON tblPersonnage.race = tblRace.id JOIN tblBonusRace ON tblBonusRace.race = tblRace.id WHERE tblPersonnage.id = @id AND tblBonusRace.caracteristique = 'dexterite')
	SELECT @bonusConstitution = (SELECT tblBonusRace.bonus FROM tblPersonnage JOIN tblRace ON tblPersonnage.race = tblRace.id JOIN tblBonusRace ON tblBonusRace.race = tblRace.id WHERE tblPersonnage.id = @id AND tblBonusRace.caracteristique = 'constitution')
	SELECT @bonusIntelligence = (SELECT tblBonusRace.bonus FROM tblPersonnage JOIN tblRace ON tblPersonnage.race = tblRace.id JOIN tblBonusRace ON tblBonusRace.race = tblRace.id WHERE tblPersonnage.id = @id AND tblBonusRace.caracteristique = 'intelligence')
	SELECT @bonusSagesse = (SELECT tblBonusRace.bonus FROM tblPersonnage JOIN tblRace ON tblPersonnage.race = tblRace.id JOIN tblBonusRace ON tblBonusRace.race = tblRace.id WHERE tblPersonnage.id = @id AND tblBonusRace.caracteristique = 'sagesse')
	SELECT @bonusCharisme = (SELECT tblBonusRace.bonus FROM tblPersonnage JOIN tblRace ON tblPersonnage.race = tblRace.id JOIN tblBonusRace ON tblBonusRace.race = tblRace.id WHERE tblPersonnage.id = @id AND tblBonusRace.caracteristique = 'charisme')
	IF(@force < 3 OR @dexterite < 3 OR @constitution < 3 OR @intelligence < 3 OR @sagesse < 3 OR @charisme < 3)
	BEGIN
		PRINT 'VAleur de caracteristique inferieure a 3';
		ROLLBACK TRANSACTION;
	END;
	IF(@bonusForce < 0 OR @bonusForce > 0)
	BEGIN
		DECLARE @totalForce INT
		SELECT @totalForce = @force + @bonusForce
		UPDATE tblCaracteristiques SET tblCaracteristiques.force = @totalForce WHERE tblCaracteristiques.personnage = @id
	END;
	IF(@bonusDexterite < 0 OR @bonusDexterite > 0)
	BEGIN
		DECLARE @totalDexterite INT
		SELECT @totalDexterite = @dexterite + @bonusDexterite
		UPDATE tblCaracteristiques SET tblCaracteristiques.dexterite = @totalDexterite WHERE tblCaracteristiques.personnage = @id
	END;
	IF(@bonusConstitution < 0 OR @bonusConstitution > 0)
	BEGIN
		DECLARE @totalConstitution INT
		SELECT @totalConstitution = @constitution + @bonusConstitution
		UPDATE tblCaracteristiques SET tblCaracteristiques.constitution = @totalConstitution WHERE tblCaracteristiques.personnage = @id
	END;
	IF(@bonusIntelligence < 0 OR @bonusIntelligence > 0)
	BEGIN
		DECLARE @totalIntelligence INT
		SELECT @totalIntelligence = @intelligence + @bonusIntelligence
		UPDATE tblCaracteristiques SET tblCaracteristiques.intelligence = @totalIntelligence WHERE tblCaracteristiques.personnage = @id
	END;
	IF(@bonusSagesse < 0 OR @bonusSagesse > 0)
	BEGIN
		DECLARE @totalSagesse INT
		SELECT @totalSagesse = @sagesse + @bonusSagesse
		UPDATE tblCaracteristiques SET tblCaracteristiques.sagesse = @totalSagesse WHERE tblCaracteristiques.personnage = @id
	END;
	IF(@bonusCharisme < 0 OR @bonusCharisme > 0)
	BEGIN
		DECLARE @totalCharisme INT
		SELECT @totalCharisme = @charisme + @bonusCharisme
		UPDATE tblCaracteristiques SET tblCaracteristiques.charisme = @totalCharisme WHERE tblCaracteristiques.personnage = @id
	END;
END;


Go
CREATE TRIGGER alignementInsert
ON tblAlignement
INSTEAD OF INSERT AS
BEGIN
	DECLARE @morale VARCHAR(25)
	DECLARE @ethique VARCHAR(25)
	DECLARE @abreviation CHAR(2)
	SELECT @morale = morale FROM INSERTED
	SELECT @ethique = ethique FROM INSERTED
	SELECT @abreviation = LEFT(@morale,1)+LEFT(@ethique,1)
	INSERT INTO tblAlignement VALUES (@morale,@ethique,@abreviation)
END;




GO
CREATE TRIGGER alignementUpdate
ON tblAlignement
AFTER UPDATE AS
BEGIN
	DECLARE @id INT
	DECLARE @morale VARCHAR(25)
	DECLARE @ethique VARCHAR(25)
	DECLARE @abreviation CHAR(2)
	SELECT @morale = morale FROM INSERTED
	SELECT @ethique = ethique FROM INSERTED
	SELECT @id = id FROM INSERTED
	IF(@morale != '' AND @ethique != '')
	BEGIN
		SELECT @abreviation = LEFT(@morale,1)+LEFT(@ethique,1)
		UPDATE tblAlignement SET abreviation = @abreviation WHERE id = @id
	END;
	ELSE IF(@ethique = '')
	BEGIN
		SELECT @ethique = (SELECT ethique FROM tblAlignement WHERE id = @id)
		SELECT @abreviation = LEFT(@morale,1)+LEFT(@ethique,1)
		UPDATE tblAlignement SET abreviation = @abreviation WHERE id = @id
	END;
	ELSE IF(@morale = '')
	BEGIN
		SELECT @morale = (SELECT morale FROM tblAlignement WHERE id = @id)
		SELECT @abreviation = LEFT(@morale,1)+LEFT(@ethique,1)
		UPDATE tblAlignement SET abreviation = @abreviation WHERE id = @id
	END;
END;


GO
CREATE TRIGGER categorieTailleInsert
ON tblCategorieTaille
INSTEAD OF INSERT AS
BEGIN
	DECLARE @nom VARCHAR(25)
	DECLARE @abreviation CHAR(1)
	DECLARE @poidsMinKg	FLOAT
	DECLARE @tailleMin INT
	DECLARE @tailleMax INT
	SELECT @nom = nom FROM INSERTED
	SELECT @abreviation = LEFT(@nom,1)
	SELECT @poidsMinKg = poidsMinKg FROM INSERTED
	SELECT @tailleMin = tailleMin FROM INSERTED
	SELECT @tailleMax = tailleMax FROM INSERTED
	INSERT INTO tblCategorieTaille VALUES (@nom,@abreviation,@poidsMinKg,@tailleMin,@tailleMax)
END;


GO
CREATE TRIGGER categorieTailleUpdate
ON tblCategorieTaille
AFTER UPDATE AS
BEGIN
	DECLARE @nom VARCHAR(25)
	DECLARE @abreviation CHAR(1)
	SELECT @nom = nom FROM INSERTED
	IF(@nom != '')
	BEGIN
		SELECT @abreviation = LEFT(@nom,1)
		UPDATE tblCategorieTaille SET abreviation = @abreviation WHERE nom = @nom
	END;
END;



GO
CREATE TRIGGER armure_persoInsert
ON tblArmure_Perso
AFTER INSERT
AS
BEGIN
	DECLARE @armureId INT
	DECLARE @persoId INT
	DECLARE @categorieTaillePerso INT
	DECLARE @categorieTailleArmure INT
	DECLARE @Bouclier VARCHAR(50)
	DECLARE @Armure VARCHAR(50)
	DECLARE @itsAWhat VARCHAR(50)
	SELECT @armureId = armureId FROM INSERTED
	SELECT @persoId = persoId FROM INSERTED
	SELECT @categorieTaillePerso = (SELECT categorieTaille FROM tblRace JOIN tblPersonnage ON tblRace.id = tblPersonnage.race WHERE tblPersonnage.id = @persoId)
	SELECT @categorieTailleArmure = (SELECT categorieTaille FROM tblArmure WHERE tblArmure.id = @armureId)
	SELECT @itsAWhat = (SELECT type FROM tblArmure JOIN tblArmure_Perso ON tblArmure.id = tblArmure_Perso.armureId WHERE armureId = @armureId)
	IF(@categorieTaillePerso != @categorieTailleArmure)
	BEGIN
		PRINT 'Armure pas à la taille du personnage';
		ROLLBACK TRANSACTION;
	END;
	ELSE
	BEGIN
		SELECT @Bouclier = (SELECT type FROM tblArmure JOIN tblArmure_Perso ON tblArmure.id = tblArmure_Perso.armureId WHERE type = 'Bouclier' AND id != @armureId)
		SELECT @Armure = (SELECT type FROM tblArmure JOIN tblArmure_Perso ON tblArmure.id = tblArmure_Perso.armureId WHERE type = 'Armure' AND id != @armureId)
		IF(@Bouclier != '' AND @itsAWhat= 'Bouclier')
		BEGIN
			DELETE FROM tblArmure_Perso WHERE tblArmure_Perso.persoId = @persoId AND tblArmure_Perso.armureId IN (SELECT Id FROM tblArmure WHERE type='Bouclier' AND id != @armureId) 
		END;
		IF(@Armure != ''  AND @itsAWhat= 'Armure')
		BEGIN
			DELETE FROM tblArmure_Perso WHERE tblArmure_Perso.persoId = @persoId AND tblArmure_Perso.armureId IN (SELECT Id FROM tblArmure WHERE type='Armure' AND id != @armureId)
		END;
	END;
END;