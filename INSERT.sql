/*Добавьте в этот файл запросы, которые наполняют данными таблицы в схеме автосалона*/
INSERT INTO car_shop.colors(name)(
  SELECT DISTINCT split_part(auto, ', ', 2) AS NAME
    FROM raw_data.sales
);

INSERT INTO car_shop.cars_model(brand_name, model_name, gasoline_consumption, brand_origin)(
SELECT DISTINCT SPLIT_PART(SPLIT_PART(auto, ', ', 1),' ', 1)
     , SUBSTR(SPLIT_PART(auto, ', ', 1), STRPOS(SPLIT_PART(auto, ', ', 1),SPLIT_PART(SPLIT_PART(auto, ', ', 1),' ',2)))
     , gasoline_consumption
     , sales.brand_origin
  FROM raw_data.sales
);

INSERT INTO car_shop.customer(name, phone)(
  SELECT DISTINCT person_name
       , phone
    FROM raw_data.sales
);

INSERT INTO car_shop.auto(cars_id, color_id) (
SELECT distinct cm.id, c.id
  FROM car_shop.cars_model cm, car_shop.colors c, raw_data.sales s
  WHERE cm.brand_name = SPLIT_PART(SPLIT_PART(auto, ', ', 1),' ', 1)
    AND cm.model_name = SUBSTR(SPLIT_PART(auto, ', ', 1), STRPOS(SPLIT_PART(auto, ', ', 1),SPLIT_PART(SPLIT_PART(auto, ', ', 1),' ',2)))
    AND c.name = SPLIT_PART(s.auto, ', ', 2)
);

INSERT INTO car_shop.order_list(auto_id, customer_id, price, discount, sale_day)(
SELECT a.id
     , cu.id
     , s.price
     , s.discount
     , s.date
  FROM car_shop.auto a, car_shop.colors cl, car_shop.cars_model cm, car_shop.customer cu, raw_data.sales s
  WHERE cm.brand_name = SPLIT_PART(SPLIT_PART(auto, ', ', 1),' ', 1)
    AND cm.model_name = SUBSTR(SPLIT_PART(auto, ', ', 1), STRPOS(SPLIT_PART(auto, ', ', 1),SPLIT_PART(SPLIT_PART(auto, ', ', 1),' ',2)))
    and cl.name = SPLIT_PART(s.auto, ', ', 2)
    and cu.phone = s.phone
    and a.color_id = cl.id
    and a.cars_id = cm.id
);
