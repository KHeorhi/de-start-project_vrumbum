/*сохраните в этом файле запросы для первоначальной загрузки данных - создание схемы raw_data и таблицы sales и наполнение их данными из csv файла*/
/*
  ОПИСАНИЕ ПРИЧИНЫ ВЫБОРА ТИПА ДАННЫХ ДЛЯ ПОЛЯ НАХОДИТСЯ В ФАЙЛЕ `comments.txt`.
*/

CREATE SCHEMA IF NOT EXISTS raw_data;

CREATE TABLE IF NOT EXISTS raw_data.sales(
    id                   SMALLINT PRIMARY KEY
  , auto                 TEXT NOT NULL
  , gasoline_consumption DOUBLE PRECISION NULL
  , price                NUMERIC(9, 2) NOT NULL
  , date                 DATE NOT NULL
  , person_name          TEXT NOT NULL
  , phone                TEXT NULL
  , discount             SMALLINT default 0
  , brand_origin         TEXT NULL
);

\copy raw_data.sales(id, auto, gasoline_consumption, price, date, person_name, phone, discount, brand_origin) FROM '/usr/local/share/cars.csv' CSV HEADER DELIMITER ',' NULL 'null';
