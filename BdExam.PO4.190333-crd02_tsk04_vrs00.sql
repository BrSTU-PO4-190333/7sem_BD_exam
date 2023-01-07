USE [БД.ПО4.190333-билет2];
GO

DROP TRIGGER IF EXISTS Билет2_Задание4;
GO

CREATE TRIGGER Билет2_Задание4
ON СПР_Сотрудники
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM ТБЧ_СписокПоступленияЛекарств
	WHERE документПоступленияКод IN (
		SELECT id FROM ДОК_Поступление WHERE сотрудникКод IN (
			SELECT id FROM deleted
		)
	);

	DELETE FROM ДОК_Поступление
	WHERE сотрудникКод IN (
		SELECT id FROM deleted
	);

	DELETE FROM ТБЧ_СписокПроданныхЛекарств
	WHERE документПродажиКод IN (
		SELECT id FROM ДОК_Продажи WHERE сотрудникКод IN (
			SELECT id FROM deleted
		)
	);

	DELETE FROM ДОК_Продажи
	WHERE сотрудникКод IN (
		SELECT id FROM deleted
	);

	DELETE FROM СПР_Сотрудники
	WHERE id IN (
		SELECT id FROM deleted
	);
END;
GO
