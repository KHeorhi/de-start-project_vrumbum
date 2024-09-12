/*добавьте сюда запрос для решения задания 3*/
SELECT EXTRACT('month' FROM ol.sale_day) AS month
     , EXTRACT('year' FROM ol.sale_day) AS year
     , ROUND(AVG(price), 2) AS price_avg
  FROM car_shop.order_list ol
  WHERE date_trunc('year', ol.sale_day) = '2022-01-01'
  GROUP BY month, year
  ORDER BY month;