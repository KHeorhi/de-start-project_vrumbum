/*добавьте сюда запрос для решения задания 1*/
SELECT (COUNT(*) FILTER (WHERE gasoline_consumption IS NULL)::REAL / COUNT(*) * 100)::NUMERIC(4, 2) AS nulls_percentage_gasoline_consumption
  FROM car_shop.cars_model;