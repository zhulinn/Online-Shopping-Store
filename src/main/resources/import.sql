/*
 Navicat Premium Data Transfer

 Source Server         : post
 Source Server Type    : PostgreSQL
 Source Server Version : 100003
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100003
 File Encoding         : 65001

 Date: 15/03/2018 11:27:12
*/


-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO "public"."hibernate_sequence" VALUES (3);
INSERT INTO "public"."hibernate_sequence" VALUES (3);
INSERT INTO "public"."hibernate_sequence" VALUES (3);
INSERT INTO "public"."hibernate_sequence" VALUES (3);
INSERT INTO "public"."hibernate_sequence" VALUES (3);


-- ----------------------------
-- Records of order_main
-- ----------------------------
INSERT INTO "public"."order_main" VALUES (2147483641, '3200 West Road', 'customer1@email.com', 'customer1', '123456789', '2018-03-15 06:58:28', 13.00, 0, '2018-03-15 06:58:28');
INSERT INTO "public"."order_main" VALUES (2147483643, '222 East Drive ', 'employee1@email.com', 'employee1', '123123122', '2018-03-15 06:58:34', 20.00, 1, '2018-03-15 07:05:25');
INSERT INTO "public"."order_main" VALUES (2147483646, '2346dfgadga', 'customer2@email.com', 'customer2', '2343456', '2018-03-15 07:03:42', 13.00, 2, '2018-03-15 07:04:30');
INSERT INTO "public"."order_main" VALUES (2147483648, '2346dfgadga', 'customer2@email.com', 'customer2', '2343456', '2018-03-15 07:04:15', 64.00, 0, '2018-03-15 07:04:15');
INSERT INTO "public"."order_main" VALUES (1, '222 East Drive ', 'employee1@email.com', 'employee1', '123123122', '2018-03-15 09:22:45', 13.00, 0, '2018-03-15 09:22:45');


-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO "public"."product_category" VALUES (2147483641, 'Books', 0, '2018-03-09 23:03:26', '2018-03-10 00:15:27');
INSERT INTO "public"."product_category" VALUES (2147483642, 'Clothes', 2, '2018-03-10 00:15:02', '2018-03-10 00:15:21');
INSERT INTO "public"."product_category" VALUES (2147483644, 'Drink', 3, '2018-03-10 01:01:09', '2018-03-10 01:01:09');
INSERT INTO "public"."product_category" VALUES (2147483645, 'Food', 1, '2018-03-10 00:26:05', '2018-03-10 00:26:05');


-- ----------------------------
-- Records of product_in_order
-- ----------------------------
INSERT INTO "public"."product_in_order" VALUES (2147483642, 2, 'Boys Clothes', 'https://d2ul0w83gls0j4.cloudfront.net/taxonomy/300/0102/20171024151632.jpg', 'C0002', 'Shirts', 13.00, 1, 2147483641);
INSERT INTO "public"."product_in_order" VALUES (2147483644, 0, 'Learn Spring', 'https://images-na.ssl-images-amazon.com/images/I/51gHy16h5TL._SX397_BO1,204,203,200_.jpg', 'B0002', 'Spring In Action', 20.00, 1, 2147483643);
INSERT INTO "public"."product_in_order" VALUES (2147483647, 2, 'Boys Clothes', 'https://d2ul0w83gls0j4.cloudfront.net/taxonomy/300/0102/20171024151632.jpg', 'C0002', 'Shirts', 13.00, 1, 2147483646);
INSERT INTO "public"."product_in_order" VALUES (2147483640, 2, 'Boys Clothes', 'https://d2ul0w83gls0j4.cloudfront.net/taxonomy/300/0102/20171024151632.jpg', 'C0002', 'Shirts', 13.00, 4, 2147483648);
INSERT INTO "public"."product_in_order" VALUES (2147483641, 3, 'Awesome', 'https://starbuckssecretmenu.net/wp-content/uploads/2017/06/Starbucks-Violet-Drink.jpg', 'D0002', 'Starbucks Violet Drink', 2.00, 1, 2147483648);
INSERT INTO "public"."product_in_order" VALUES (2, 2, 'Boys Clothes', 'https://d2ul0w83gls0j4.cloudfront.net/taxonomy/300/0102/20171024151632.jpg', 'C0002', 'Shirts', 13.00, 1, 1);
INSERT INTO "public"."product_in_order" VALUES (2147483649, 2, 'Under Armour', 'https://assets.academy.com/mgen/33/20088533.jpg?is=500,500', 'C0001', 'T-shirt', 10.00, 1, 2147483648);


-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO "public"."product_info" VALUES ('B0001', 0, '2018-03-10 06:44:25', 'Books for learning Java', 'https://images-na.ssl-images-amazon.com/images/I/41f6Rd6ZEPL._SX363_BO1,204,203,200_.jpg', 'Core Java', 30.00, 0, 100, '2018-03-10 06:44:25');
INSERT INTO "public"."product_info" VALUES ('B0002', 0, '2018-03-10 10:35:43', 'Learn Spring', 'https://images-na.ssl-images-amazon.com/images/I/51gHy16h5TL._SX397_BO1,204,203,200_.jpg', 'Spring In Action', 20.00, 0, 200, '2018-03-10 10:35:43');
INSERT INTO "public"."product_info" VALUES ('B0003', 0, '2018-03-10 10:37:39', 'Java EE', 'https://covers.oreillystatic.com/images/9780596516680/lrg.jpg', 'Head First', 10.00, 1, 200, '2018-03-10 19:42:02');
INSERT INTO "public"."product_info" VALUES ('B0004', 0, '2018-03-10 10:39:29', 'Java SE', 'https://www.pearsonhighered.com/assets/bigcovers/0/1/3/2/0132778041.jpg', 'Effective Java', 30.00, 0, 200, '2018-03-10 10:39:32');
INSERT INTO "public"."product_info" VALUES ('B0005', 0, '2018-03-10 10:40:35', 'Java SE', 'http://mindview.net/Books/TIJ/TIJ3Cover.jpg', 'Thinking in Java', 30.00, 0, 200, '2018-03-10 10:40:35');
INSERT INTO "public"."product_info" VALUES ('C0001', 2, '2018-03-10 12:09:41', 'Under Armour', 'https://assets.academy.com/mgen/33/20088533.jpg?is=500,500', 'T-shirt', 10.00, 0, 110, '2018-03-10 12:09:41');
INSERT INTO "public"."product_info" VALUES ('C0002', 2, '2018-03-10 12:11:51', 'Boys Clothes', 'https://d2ul0w83gls0j4.cloudfront.net/taxonomy/300/0102/20171024151632.jpg', 'Shirts', 13.00, 0, 110, '2018-03-10 12:11:51');
INSERT INTO "public"."product_info" VALUES ('C0003', 2, '2018-03-10 12:12:46', 'Mans', 'https://img1.newchic.com/thumb/view/oaupload/newchic/images/00/30/df8a1f83-035c-4942-93d6-49933ac52a34.jpg', 'Coats', 22.00, 0, 222, '2018-03-10 12:12:46');
INSERT INTO "public"."product_info" VALUES ('D0001', 3, '2018-03-10 06:51:03', 'Everyone likes it', 'https://www.thesun.co.uk/wp-content/uploads/2017/03/nintchdbpict000277254629.jpg?strip=all&w=676', 'Coca Cola', 1.00, 0, 100, '2018-03-10 12:04:13');
INSERT INTO "public"."product_info" VALUES ('D0002', 3, '2018-03-10 12:08:17', 'Awesome', 'https://starbuckssecretmenu.net/wp-content/uploads/2017/06/Starbucks-Violet-Drink.jpg', 'Starbucks Violet Drink', 2.00, 0, 222, '2018-03-10 12:08:17');
INSERT INTO "public"."product_info" VALUES ('F0001', 1, '2018-03-10 12:15:05', 'Kids Party Food', 'http://asset1.marksandspencer.com/is/image/mands/MS_FD_F04C_00398503_NC_X_EC_0?$PDP_MAXI_ZOOM_NEW$', 'Chicken', 4.00, 0, 59, '2018-03-10 12:15:10');
INSERT INTO "public"."product_info" VALUES ('F0002', 1, '2018-03-10 12:16:44', 'Family s', 'http://cdn1.thecomeback.com/wp-content/uploads/2017/05/mcdonalds_food-832x447.png', 'McDonald‘s Food', 20.00, 0, 23, '2018-03-10 12:16:44');

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (2147483641, '1', '3200 West Road', 'customer1@email.com', 'customer1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', '123456789', 'ROLE_CUSTOMER');
INSERT INTO "public"."users" VALUES (2147483642, '1', '2000 John Road', 'manager1@email.com', 'manager1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', '987654321', 'ROLE_MANAGER');
INSERT INTO "public"."users" VALUES (2147483643, '1', '222 East Drive ', 'employee1@email.com', 'employee1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', '123123122', 'ROLE_EMPLOYEE');
INSERT INTO "public"."users" VALUES (2147483645, '1', '3100 Western Road A', 'customer2@email.com', 'customer2', '$2a$10$0oho5eUbDqKrLH026A2YXuCGnpq07xJpuG/Qu.PYb1VCvi2VMXWNi', '2343456', 'ROLE_CUSTOMER');
