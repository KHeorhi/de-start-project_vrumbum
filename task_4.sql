/*добавьте сюда запрос для решения задания 4*/
SELECT c.name AS person
     , STRING_AGG(CONCAT(b.name, ' ', cm.model_name), ', ') AS cars
  FROM car_shop.order_list o
   JOIN car_shop.auto a ON o.auto_id = a.id
   JOIN car_shop.cars_model cm ON a.cars_id = cm.id
   JOIN car_shop.brand b ON cm.brand_id = b.id
   JOIN car_shop.customer c ON o.customer_id = c.id
  GROUP BY person
  ORDER BY person;