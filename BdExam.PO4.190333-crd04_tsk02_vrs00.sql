USE [БД.ПО4.190333-билет4];
GO

DROP PROCEDURE IF EXISTS Билет4_Задание2;
GO

CREATE PROCEDURE Билет4_Задание2
	@запрос VARCHAR(100)
AS
BEGIN
	DECLARE @полныйЗапрос VARCHAR(102);
	
	SET @полныйЗапрос = CONCAT('%', @запрос, '%');

	SELECT *
	FROM СПР_Жокеи
	WHERE CONCAT(фамилия, ' ', имя, ' ', отчество) LIKE @полныйЗапрос;
END;
GO

EXEC Билет4_Задание2 'ol';
