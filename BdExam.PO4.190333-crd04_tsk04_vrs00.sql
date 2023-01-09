USE [БД.ПО4.190333-билет4];
GO

DROP TRIGGER IF EXISTS Билет4_Задание4;
GO

CREATE TRIGGER Билет4_Задание4
ON СПР_Владельцы
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM ТБЧ_СписокКомиссииЛошадей
	WHERE ТБЧ_СписокКомиссииЛошадей.лошадьКод IN (
		SELECT id
		FROM СПР_Лошади
		WHERE владелецКод IN (SELECT id FROM deleted)
	);

	DELETE FROM СПР_Лошади
	WHERE владелецКод IN (SELECT id FROM deleted);

	DELETE FROM СПР_Владельцы
	WHERE id IN (SELECT id FROM deleted);
END;
GO

--DELETE FROM СПР_Владельцы
--WHERE id = 3;
--GO
