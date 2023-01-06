SELECT *
FROM СПР_Пациенты
WHERE id NOT IN (
	SELECT пациентКод
	FROM ДОК_Осмотр
	WHERE окончательныйДиагногКод NOT IN (
		SELECT окончательныйДиагногКод
		FROM
			ДОК_Осмотр INNER JOIN СПР_Пациенты
			ON СПР_Пациенты.id = ДОК_Осмотр.пациентКод
		WHERE
			СПР_Пациенты.id = 3
			--AND СПР_Пациенты.фамилия LIKE 'Ivanov'
			--AND СПР_Пациенты.имя LIKE 'I%'
			--AND СПР_Пациенты.Отчество LIKE 'I%'
	)
);
