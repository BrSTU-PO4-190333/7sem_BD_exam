USE [БД.ПО4.190333-билет3];
GO

DROP PROCEDURE IF EXISTS Билет3_Задание2;
GO

CREATE PROCEDURE Билет3_Задание2
	@запрос VARCHAR(128)
AS
BEGIN
	DECLARE @ПолныйЗапрос VARCHAR(130);

	SET @ПолныйЗапрос = CONCAT('%', @запрос, '%');

	SELECT *
	FROM ДОК_ПриказСозданияЗаконКомиссии
	WHERE наименование LIKE @ПолныйЗапрос;
END;
GO

EXEC Билет3_Задание2 'po';
