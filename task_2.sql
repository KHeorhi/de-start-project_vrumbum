/*добавьте сюда запрос для решения задания 2*/
SELECT brand_name
     , EXTRACT('year' FROM ol.sale_day) AS year
     , ROUND(avg(ol.price),2) AS price_avg
  FROM car_shop.order_list ol
  JOIN car_shop.auto ON ol.auto_id = auto.id
  JOIN car_shop.cars_model cm ON auto.cars_id = cm.id
  GROUP BY year, brand_name
  ORDER BY brand_name, year;
