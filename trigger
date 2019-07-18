CREATE TRIGGER ServiceStatusUpdate ON Planes
	AFTER UPDATE
AS
BEGIN
	DECLARE @vLastServiceDate DATE;
	SELECT @vLastServiceDate = LastServiceDate FROM INSERTED;
	UPDATE Planes
	SET ServiceStatus = 'Current'
	WHERE LastServiceDate = @vLastServiceDate;
END;
GO
