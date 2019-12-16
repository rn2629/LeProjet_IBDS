USE LeProjet_Rodrigue
Go


CREATE PROCEDURE insertJoueur @Nom VARCHAR(50), @Prenom VARCHAR(50), @Gamertag VARCHAR(50), @MotDePasse VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON
    DECLARE @sel UNIQUEIDENTIFIER=NEWID();
		INSERT INTO tblJoueur (nom, prenom, gamerTag, motDePasse, sel)
		VALUES(@Nom, @Prenom, @GamerTag, HASHBYTES('SHA2_512', @MotDePasse+CAST(@sel AS VARCHAR(36))), @sel);
END