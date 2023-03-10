USE [БД.ПО4.190333-билет2];
GO

DROP PROCEDURE IF EXISTS Билет2_Задание3;
GO

CREATE PROCEDURE Билет2_Задание3
	@КодСотрудника INT,
	@ФиоСотрудника VARCHAR(100) OUTPUT,
	@ДолжностьСотрудника VARCHAR(64) OUTPUT
AS
BEGIN
	SET @ФиоСотрудника = (
		SELECT
			CONCAT(
				фамилия,
				' ',
				имя,
				' ',
				отчество
			)
		FROM СПР_Сотрудники
		WHERE id = @КодСотрудника
	);

	SET @ДолжностьСотрудника = (
		SELECT СПР_Должности.наименование
		FROM
			СПР_Сотрудники
			INNER JOIN СПР_Должности
			ON СПР_Должности.id = СПР_Сотрудники.должностьКод
		WHERE СПР_Сотрудники.id = @КодСотрудника
	);
END;
GO

-- = = = = = = = =

DECLARE @переменнаяФиоСотрудника VARCHAR(100);
DECLARE @переменнаяДолжностьСотрудника VARCHAR(64);

-- = = = = = = = =

EXEC Билет2_Задание3 1, @ФиоСотрудника = @переменнаяФиоСотрудника OUTPUT, @ДолжностьСотрудника = @переменнаяДолжностьСотрудника OUTPUT;

PRINT 'Fio sotrydnika: ' + @переменнаяФиоСотрудника;
PRINT 'Doljnost sotrydnika: ' + @переменнаяДолжностьСотрудника;

SELECT
	@переменнаяФиоСотрудника AS ФиоВрача,
	@переменнаяДолжностьСотрудника AS КатегорияВрача;

-- = = = = = = = =

EXEC Билет2_Задание3 2, @ФиоСотрудника = @переменнаяФиоСотрудника OUTPUT, @ДолжностьСотрудника = @переменнаяДолжностьСотрудника OUTPUT;

PRINT 'Fio sotrydnika: ' + @переменнаяФиоСотрудника;
PRINT 'Doljnost sotrydnika: ' + @переменнаяДолжностьСотрудника;

SELECT
	@переменнаяФиоСотрудника AS ФиоВрача,
	@переменнаяДолжностьСотрудника AS КатегорияВрача;
