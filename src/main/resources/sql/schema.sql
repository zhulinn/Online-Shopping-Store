create table `product_info` (
  `product_id` varchar(32) not null,
  `product_name` VARCHAR(64) not null,
  `product_price` DECIMAL(8, 2) not NULL ,
  `product_stock` int not null ,
  `product_description` VARCHAR(64) ,
  `product_icon` VARCHAR(512),
  `category_type` int not null ,
  `product_status` TINYINT(3) NOT NULL DEFAULT '0',
  `create_time` TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP ,
  `update_time` TIMESTAMP NOT  NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY key (`product_id`),
  FOREIGN KEY (category_type) REFERENCES order_master(category_type)
);

CREATE TABLE `product_category`(
  `category_id` int not null auto_increment,
  `category_name` VARCHAR (64) not null,
  `category_type` int not null,
  `create_time` TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP ,
  `update_time` TIMESTAMP NOT  NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uniq_category_type` (`category_type`)
);

CREATE TABLE `order_master` (
`order_id` VARCHAR (32) NOT  NULL ,
`buyer_name` VARCHAR (32) not NULL ,
`buyer_phone` VARCHAR (32) not  null,
`buyer_address` VARCHAR (128) NOT  NULL,
`buyer_email` VARCHAR (32) not null,
`order_amount` DECIMAL (8,2) not NULL ,
`order_status` tinyint(3) not null DEFAULT '0' comment 'default 0 new order',
`pay_status` tinyint(3) not null DEFAULT '0' comment 'default 0 unpaid',
  `create_time` TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP ,
  `update_time` TIMESTAMP NOT  NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
primary key (`order_id`),
KEY `idx_buyer_email` (`buyer_email`)
);

CREATE TABLE `order_detail` (
`detail_id` VARCHAR (32) NOT NULL ,
`order_id` VARCHAR (32) NOT NULL,
  `product_id` varchar(32) not null,
#   `product_name` VARCHAR(64) not null,
#   `product_price` DECIMAL (8, 2) not NULL ,
#   `product_quantity` int not null ,
#   `product_description` VARCHAR (64) ,
#   `product_icon` VARCHAR (512),
    `create_time` TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP ,
  `update_time` TIMESTAMP NOT  NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
primary key (`detail_id`),
FOREIGN KEY (`product_id`) REFERENCES product_info(product_id),
FOREIGN KEY (order_id) REFERENCES order_master(order_id),
key `idx_order_id` (`order_id`)
);

CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  email VARCHAR(32) NOT NULL UNIQUE KEY ,
  password VARCHAR(64) NOT NULL,
  name VARCHAR(32) NOT NULL ,
  phone VARCHAR (32) not  null,
  address VARCHAR (128) NOT  NULL,
  active BIT NOT NULL DEFAULT 1 COMMENT 'default 1 active',
  roles VARCHAR(16) NOT NULL

);