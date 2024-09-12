/*Добавьте в этот файл все запросы, для создания схемы данных автосалона и
 таблиц в ней в нужном порядке*/

/*
  ОПИСАНИЕ ПРИЧИНЫ ВЫБОРА ТИПА ДАННЫХ ДЛЯ ПОЛЯ НАХОДИТСЯ В ФАЙЛЕ `comments.txt`.
*/

CREATE SCHEMA IF NOT EXISTS car_shop;

CREATE TABLE IF NOT EXISTS car_shop.colors(
    id    SMALLSERIAL PRIMARY KEY
  , name  TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS car_shop.country(
    id    SMALLSERIAL PRIMARY KEY NOT NULL
  , name  TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS car_shop.brand(
    id          SMALLSERIAL PRIMARY KEY NOT NULL
  , name        TEXT NOT NULL
  , country_id  SMALLINT REFERENCES car_shop.country(id)
);

CREATE TABLE IF NOT EXISTS car_shop.cars_model(
    id                    SMALLSERIAL PRIMARY KEY NOT NULL
  , brand_id              SMALLINT NOT NULL REFERENCES car_shop.brand(id)
  , model_name            TEXT NOT NULL
  , gasoline_consumption  NUMERIC(3, 1) default null
);

CREATE TABLE IF NOT EXISTS car_shop.customer(
    id           SMALLSERIAL PRIMARY KEY
  , name         TEXT NOT NULL
  , phone        TEXT NOT NULL
  , UNIQUE(name, phone)
);

CREATE TABLE IF NOT EXISTS car_shop.auto(
    id          SMALLSERIAL PRIMARY KEY NOT NULL
  , cars_id     SMALLINT NOT NULL REFERENCES car_shop.cars_model (id)
  , color_id    SMALLINT NOT NULL REFERENCES car_shop.colors (id)
  , UNIQUE (cars_id, color_id)
);

CREATE TABLE IF NOT EXISTS car_shop.order_list(
    order_id    SMALLSERIAL PRIMARY KEY NOT NULL
  , auto_id     SMALLINT NOT NULL REFERENCES car_shop.auto(id)
  , customer_id SMALLINT   NOT NULL REFERENCES car_shop.customer (id)
  , price       NUMERIC(9,2) NOT NULL
  , discount    SMALLINT   default 0
  , sale_day    DATE       NOT NULL
);
