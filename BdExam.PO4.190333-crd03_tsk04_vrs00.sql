USE [БД.ПО4.190333-билет3];
GO

DROP TRIGGER IF EXISTS Билет3_Задание4;
GO

CREATE TRIGGER Билет3_Задание4
ON СПР_Законодатели
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM ДОК_Заседания
	WHERE комиссияКод IN (
		SELECT id FROM ДОК_ПриказСозданияЗаконКомиссии
		WHERE председательКод IN (SELECT id FROM deleted)
	);

	DELETE FROM ТБЧ_СписокЧленовЗаконКомиссии
	WHERE комиссияКод IN (
		SELECT id FROM ДОК_ПриказСозданияЗаконКомиссии
		WHERE председательКод IN (SELECT id FROM deleted)
	);

	DELETE FROM ДОК_ПриказСозданияЗаконКомиссии
	WHERE председательКод IN (SELECT id FROM deleted);

	DELETE FROM ТБЧ_СписокЧленовЗаконКомиссии
	WHERE законодательКод IN (SELECT id FROM deleted);

	DELETE FROM ДОК_Заседания
	WHERE организаторКод IN (SELECT id FROM deleted);

	DELETE FROM СПР_Законодатели
	WHERE id IN (SELECT id FROM deleted);
END;
GO
