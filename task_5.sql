/*добавьте сюда запрос для решения задания 5*/
SELECT brand_origin
     , round(min(price * 100 / (100 - discount)), 2) AS price_min
     , round(max(price * 100 / (100 - discount)), 2) AS price_max
  FROM car_shop.order_list o
  JOIN car_shop.auto a on o.auto_id = a.id
  JOIN car_shop.cars_model cm on a.cars_id = cm.id
  GROUP BY brand_origin;