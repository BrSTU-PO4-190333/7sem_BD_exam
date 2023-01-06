USE [БД.ПО4.190333-билет1];
GO

DROP TRIGGER IF EXISTS Билет1_Задание4;
GO

CREATE TRIGGER Билет1_Задание4
ON СПР_Пациенты
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM ДОК_Осмотр
	WHERE пациентКод IN (
		SELECT id FROM Deleted
	);

	DELETE FROM СПР_Пациенты
	WHERE id IN (
		SELECT id FROM Deleted
	);
END;
GO
