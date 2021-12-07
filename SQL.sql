SELECT
  ` model avto`.модель
FROM клиенты
  INNER JOIN ` model avto`
    ON клиенты.id_model = ` model avto`.id_model
  INNER JOIN `коробка передач`
    ON ` model avto`.id_korobka = `коробка передач`.id_korobka
  INNER JOIN цвет
    ON ` model avto`.id_color = цвет.id_color
WHERE ` model avto`.модель = 'LADA'