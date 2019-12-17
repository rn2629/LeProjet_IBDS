
USE LeProjet_Rodrigue
Go

CREATE PROCEDURE modifierJoueur @GamertagModif VARCHAR(50), @Nom VARCHAR(50), @Prenom VARCHAR(50), @Gamertag VARCHAR(50), @MotDePasse BINARY(50)
AS
BEGIN
	SET NOCOUNT ON
    DECLARE @sel UNIQUEIDENTIFIER=NEWID();
	DECLARE @joueurExist VARCHAR(50)
	SELECT @joueurExist = (SELECT gamerTag FROM tblJoueur WHERE gamerTag = @GamertagModif)
	IF (@joueurExist = '')
		PRINT 'Ce joueur est inexistant'
	ELSE 
		UPDATE tblJoueur SET nom = @Nom, prenom = @Prenom, gamerTag = @GamerTag, motDePasse = (HASHBYTES('SHA2_512', @motDePasse+CAST(@sel AS BINARY(36)))), sel = @sel WHERE gamerTag = @gamertagModif;
END