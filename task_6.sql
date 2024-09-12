/*добавьте сюда запрос для решения задания 6*/
SELECT COUNT(*) AS persons_from_usa_count  -- ИСПОЛЬЗОВАТЬ COUNT(0) УЖЕ ПРИВЫЧКА
  FROM car_shop.customer
  WHERE phone LIKE '+1%';