/*добавьте сюда запрос для решения задания 5*/
SELECT c.name
     , round(min(price * 100 / (100 - discount)), 2) AS price_min
     , round(max(price * 100 / (100 - discount)), 2) AS price_max
  FROM car_shop.order_list o
  JOIN car_shop.auto a ON o.auto_id = a.id
  JOIN car_shop.cars_model cm ON a.cars_id = cm.id
  JOIN car_shop.brand b ON cm.brand_id = b.id
  LEFT JOIN car_shop.country c ON c.id = b.country_id
  GROUP BY c.name;