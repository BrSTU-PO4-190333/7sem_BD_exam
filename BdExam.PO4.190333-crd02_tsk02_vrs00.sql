USE [БД.ПО4.190333-билет2];
GO

DROP PROCEDURE IF EXISTS Билет2_Задание2;
GO

CREATE PROCEDURE Билет2_Задание2 @text VARCHAR(64) AS
BEGIN
	DECLARE @searchText VARCHAR(100);

	SET @searchText = CONCAT('%', @text,'!%%'); 

	SELECT * FROM СПР_Лекарства
	WHERE наименование LIKE @searchText ESCAPE '!'
END;
GO

EXEC Билет2_Задание2 @text = '3';
GO
