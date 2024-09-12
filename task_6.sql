/*добавьте сюда запрос для решения задания 6*/
SELECT COUNT(0) AS persons_from_usa_count
  FROM car_shop.customer
  WHERE phone LIKE '+1%';