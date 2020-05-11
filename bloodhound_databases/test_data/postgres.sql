-- Adminer 4.7.5 PostgreSQL dump

DROP TABLE IF EXISTS "orders";
DROP SEQUENCE IF EXISTS orders_id_seq;
CREATE SEQUENCE orders_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."orders" (
    "id" integer DEFAULT nextval('orders_id_seq') NOT NULL,
    "description" character varying(128) NOT NULL,
    "price" double precision NOT NULL
) WITH (oids = false);

INSERT INTO "orders" ("id", "description", "price") VALUES
(1,	'simple order 1',	10.99),
(2,	'simple order 2',	199.17);

-- 2020-02-02 10:32:57.21047+00
