
-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS "public"."hibernate_sequence";
CREATE TABLE "public"."hibernate_sequence" (
  "next_val" int8
)
;
-- ----------------------------
-- Table structure for order_main
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_main";
CREATE TABLE "public"."order_main" (
  "order_id" int8 NOT NULL,
  "buyer_address" varchar(255) COLLATE "pg_catalog"."default",
  "buyer_email" varchar(255) COLLATE "pg_catalog"."default",
  "buyer_name" varchar(255) COLLATE "pg_catalog"."default",
  "buyer_phone" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "order_amount" numeric(19,2) NOT NULL,
  "order_status" int4 NOT NULL DEFAULT 0,
  "update_time" timestamp(6)
)
;
-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_category";
CREATE TABLE "public"."product_category" (
  "category_id" int4 NOT NULL,
  "category_name" varchar(255) COLLATE "pg_catalog"."default",
  "category_type" int4,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
-- ----------------------------
-- Table structure for product_in_order
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_in_order";
CREATE TABLE "public"."product_in_order" (
  "id" int8 NOT NULL,
  "category_type" int4 NOT NULL,
  "product_description" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "product_icon" varchar(255) COLLATE "pg_catalog"."default",
  "product_id" varchar(255) COLLATE "pg_catalog"."default",
  "product_name" varchar(255) COLLATE "pg_catalog"."default",
  "product_price" numeric(19,2) NOT NULL,
  "product_quantity" int4,
  "order_id" int8 NOT NULL
)
;
-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_info";
CREATE TABLE "public"."product_info" (
  "product_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "category_type" int4,
  "create_time" timestamp(6),
  "product_description" varchar(255) COLLATE "pg_catalog"."default",
  "product_icon" varchar(255) COLLATE "pg_catalog"."default",
  "product_name" varchar(255) COLLATE "pg_catalog"."default",
  "product_price" numeric(19,2),
  "product_status" int4,
  "product_stock" int4,
  "update_time" timestamp(6)
)
;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int8 NOT NULL,
  "active" varbit(1) NOT NULL,
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "role" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Primary Key structure for table order_main
-- ----------------------------
ALTER TABLE "public"."order_main" ADD CONSTRAINT "order_main_pkey" PRIMARY KEY ("order_id");

-- ----------------------------
-- Uniques structure for table product_category
-- ----------------------------
ALTER TABLE "public"."product_category" ADD CONSTRAINT "product_category_category_type_key" UNIQUE ("category_type");

-- ----------------------------
-- Primary Key structure for table product_category
-- ----------------------------
ALTER TABLE "public"."product_category" ADD CONSTRAINT "product_category_pkey" PRIMARY KEY ("category_id");

-- ----------------------------
-- Indexes structure for table product_in_order
-- ----------------------------
CREATE INDEX "product_in_order_FKt0sfj3ffasrift1c4lv3ra85e" ON "public"."product_in_order" USING btree (
  "order_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table product_in_order
-- ----------------------------
ALTER TABLE "public"."product_in_order" ADD CONSTRAINT "product_in_order_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table product_info
-- ----------------------------
ALTER TABLE "public"."product_info" ADD CONSTRAINT "product_info_pkey" PRIMARY KEY ("product_id");

-- ----------------------------
-- Uniques structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_email_key" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
