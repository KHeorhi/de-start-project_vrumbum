/*добавьте сюда запрос для решения задания 2*/
SELECT b.name
     , EXTRACT('year' FROM ol.sale_day) AS year
     , ROUND(avg(ol.price),2) AS price_avg
  FROM car_shop.order_list ol
   JOIN car_shop.auto ON ol.auto_id = auto.id
   JOIN car_shop.cars_model cm ON auto.cars_id = cm.id
   JOIN car_shop.brand b ON cm.brand_id = b.id
  GROUP BY year, name
  ORDER BY b.name, year;