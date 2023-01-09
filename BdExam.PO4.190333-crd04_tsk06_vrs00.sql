USE [БД.ПО4.190333-билет4];
GO

SELECT
	DISTINCT
	Выборка2.ФиоСкакуна,
	Выборка2.ВозврастСкакуна,
	Выборка1.КоличествоСкачек,
	Выборка2.ФиоВладельца
FROM
	(
		SELECT жокейКод, COUNT(*) AS КоличествоСкачек
		FROM ТБЧ_СписокКомиссииЛошадей
		GROUP BY жокейКод
	) AS Выборка1
	INNER JOIN
	(
		SELECT
			СПР_Жокеи.id AS КодСкакуна,
			CONCAT(СПР_Жокеи.фамилия, ' ', СПР_Жокеи.имя, ' ', СПР_Жокеи.отчество) AS ФиоСкакуна,
			DATEDIFF(YEAR, СПР_Жокеи.деньРождения, getdate()) AS ВозврастСкакуна,
			CONCAT(СПР_Владельцы.фамилия, ' ', СПР_Владельцы.имя, ' ', СПР_Владельцы.отчество) AS ФиоВладельца
		FROM
			ДОК_Созтязания
			INNER JOIN ТБЧ_СписокКомиссииЛошадей
				ON ТБЧ_СписокКомиссииЛошадей.комиссияКод = ДОК_Созтязания.комиссияКод
			INNER JOIN СПР_Лошади
				ON СПР_Лошади.id = ТБЧ_СписокКомиссииЛошадей.лошадьКод
			INNER JOIN СПР_Владельцы
				ON СПР_Владельцы.id = СПР_Лошади.владелецКод
			INNER JOIN СПР_Жокеи
				ON СПР_Жокеи.id = ТБЧ_СписокКомиссииЛошадей.жокейКод
	) AS Выборка2
	ON Выборка2.КодСкакуна = Выборка1.жокейКод
ORDER BY ФиоСкакуна;
GO