
CREATE TABLE product_category(
  category_id int not null auto_increment,
  category_name VARCHAR (64) not null,
  category_type int not null,
  create_time TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP ,
  update_time TIMESTAMP NOT  NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (category_id),
  UNIQUE KEY uniq_category_type (category_type)
);

create table product_info (
  product_id varchar(32) not null,
  product_name VARCHAR(64) not null,
  product_price DECIMAL(8, 2) not NULL ,
  product_stock int not null ,
  product_description VARCHAR(64) ,
  product_icon VARCHAR(512),
  category_type int not null ,
  product_status TINYINT(3) NOT NULL DEFAULT '0',
  create_time TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP ,
  update_time TIMESTAMP NOT  NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY key (product_id),
  FOREIGN KEY (category_type) REFERENCES product_category(category_type)
);

CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT  ,
  email VARCHAR(32) NOT NULL UNIQUE  ,
  password VARCHAR(64) NOT NULL,
  name VARCHAR(32) NOT NULL ,
  phone VARCHAR (32) not  null,
  address VARCHAR (128) NOT  NULL,
  active BIT NOT NULL DEFAULT 1 COMMENT 'default 1 active',
  role VARCHAR(16) NOT NULL,
    primary key (id),
  UNIQUE KEY uniq_email (email)
);

CREATE TABLE `order_main`  (
  `order_id` bigint(20) NOT NULL,
  `buyer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `order_amount` decimal(19, 2) NOT NULL,
  `order_status` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
);

CREATE TABLE `product_in_order`  (
  `id` bigint(20) NOT NULL,
  `category_type` int(11) NOT NULL,
  `product_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(19, 2) NOT NULL,
  `product_quantity` int(11) NULL DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKt0sfj3ffasrift1c4lv3ra85e`(`order_id`) USING BTREE
);