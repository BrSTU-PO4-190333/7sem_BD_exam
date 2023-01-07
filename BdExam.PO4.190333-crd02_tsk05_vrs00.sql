USE [БД.ПО4.190333-билет2];
GO

DROP VIEW IF EXISTS Билет2_Задание5;
GO

CREATE VIEW Билет2_Задание5 AS
(
	SELECT
		A.наименование AS Лекарство,
		C.наименование AS АналогЛекарства
	FROM
		СПР_Лекарства AS A
		INNER JOIN ТБЧ_АналогиЛекарств AS B
		ON A.id = B.лекарствоКод
		INNER JOIN СПР_Лекарства AS C
		ON B.аналогЛекарствоКод = C.id
);
GO

SELECT * FROM Билет2_Задание5
ORDER BY Лекарство;
GO
