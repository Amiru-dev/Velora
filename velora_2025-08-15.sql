# ************************************************************
# Sequel Ace SQL dump
# Version 20095
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.0.33)
# Database: velora
# Generation Time: 2025-08-15 3:09:07 AM +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `line_1` text NOT NULL,
  `line_2` text NOT NULL,
  `city_id` int NOT NULL,
  `postal_code` varchar(5) NOT NULL,
  `user_id` int NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_city1_idx` (`city_id`),
  KEY `fk_address_user1_idx` (`user_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_address_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;

INSERT INTO `address` (`id`, `line_1`, `line_2`, `city_id`, `postal_code`, `user_id`, `mobile`, `first_name`, `last_name`)
VALUES
	(1,'703/5','kulasewana Rd',1,'12883',1,'+94765434523',NULL,NULL),
	(2,'87/2 ','rajapaksha road',5,'69543',2,'+94784766700',NULL,NULL),
	(17,'kanth','no.23',1,'65433',16,'+94723456789',NULL,NULL);

/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table brand
# ------------------------------------------------------------

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;

INSERT INTO `brand` (`id`, `name`)
VALUES
	(1,'Apple'),
	(2,'Samsung'),
	(3,'Sony'),
	(4,'Asus'),
	(5,'MSI'),
	(6,'Lenovo');

/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_user1_idx` (`user_id`),
  KEY `fk_cart_product1_idx` (`product_id`),
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `qty`)
VALUES
	(70,16,7,1);

/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;

INSERT INTO `city` (`id`, `name`)
VALUES
	(1,'Colombo'),
	(2,'Mathara'),
	(3,'Galle'),
	(4,'Aluthgama'),
	(5,'Panadura');

/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table color
# ------------------------------------------------------------

DROP TABLE IF EXISTS `color`;

CREATE TABLE `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;

INSERT INTO `color` (`id`, `value`)
VALUES
	(1,'Black'),
	(2,'White'),
	(3,'Gold'),
	(4,'Red'),
	(5,'Silver');

/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table delivery_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `delivery_type`;

CREATE TABLE `delivery_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `delivery_type` WRITE;
/*!40000 ALTER TABLE `delivery_type` DISABLE KEYS */;

INSERT INTO `delivery_type` (`id`, `name`, `price`)
VALUES
	(1,'Within Colombo',100),
	(2,'Out Of Colombo',250);

/*!40000 ALTER TABLE `delivery_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model`;

CREATE TABLE `model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `brand_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_model_brand_idx` (`brand_id`),
  CONSTRAINT `fk_model_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;

INSERT INTO `model` (`id`, `name`, `brand_id`)
VALUES
	(1,'Xperia 5',3),
	(2,'S24 Ultra',2),
	(3,'iPhone 15 Pro Max',1),
	(5,'iPhone 15',1),
	(7,'Galaxy Z Fold',2),
	(8,'iPhone 16',1),
	(10,'TUF',4),
	(11,'Cyborg 15',5),
	(12,'Ideapad',6),
	(13,'IdeaCentre Tower',6),
	(14,'Vivobook',4),
	(15,'Modern 15',5);

/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `orders_id` int NOT NULL,
  `qty` int NOT NULL,
  `order_status_id` int NOT NULL,
  `delivery_type_id` int NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_product1_idx` (`product_id`),
  KEY `fk_order_item_order_status1_idx` (`order_status_id`),
  KEY `fk_order_item_delivery_type1_idx` (`delivery_type_id`),
  KEY `fk_order_item_orders1_idx` (`orders_id`),
  CONSTRAINT `fk_order_item_delivery_type1` FOREIGN KEY (`delivery_type_id`) REFERENCES `delivery_type` (`id`),
  CONSTRAINT `fk_order_item_order_status1` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `fk_order_item_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_item_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;

INSERT INTO `order_items` (`id`, `product_id`, `orders_id`, `qty`, `order_status_id`, `delivery_type_id`, `rating`)
VALUES
	(5,2,6,1,2,2,0),
	(6,3,7,1,2,2,0),
	(7,4,8,1,2,2,0),
	(8,5,9,1,1,2,0),
	(9,6,10,1,2,2,0),
	(10,7,11,1,1,2,0),
	(11,6,12,1,2,2,0),
	(12,20,13,1,2,2,0),
	(13,22,14,1,1,2,0),
	(14,22,15,1,1,1,0);

/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_status`;

CREATE TABLE `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;

INSERT INTO `order_status` (`id`, `value`)
VALUES
	(1,'Pending'),
	(2,'Delivered');

/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user1_idx` (`user_id`),
  KEY `fk_order_address1_idx` (`address_id`),
  CONSTRAINT `fk_order_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `created_at`)
VALUES
	(6,2,2,'2025-08-07 08:28:04'),
	(7,2,2,'2025-08-07 08:59:06'),
	(8,2,2,'2025-08-07 09:09:23'),
	(9,2,2,'2025-08-07 09:20:49'),
	(10,2,2,'2025-08-07 09:44:09'),
	(11,2,2,'2025-08-07 09:49:52'),
	(12,2,2,'2025-08-07 10:02:59'),
	(13,2,2,'2025-08-09 00:18:30'),
	(14,2,2,'2025-08-13 20:07:19'),
	(15,16,17,'2025-08-14 16:03:27');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `model_id` int NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `qty` int NOT NULL,
  `color_id` int NOT NULL,
  `storage_id` int NOT NULL,
  `quality_id` int NOT NULL,
  `status_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_model1_idx` (`model_id`),
  KEY `fk_product_color1_idx` (`color_id`),
  KEY `fk_product_storage1_idx` (`storage_id`),
  KEY `fk_product_quality1_idx` (`quality_id`),
  KEY `fk_product_status1_idx` (`status_id`),
  KEY `fk_product_user1_idx` (`user_id`),
  CONSTRAINT `fk_product_color1` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  CONSTRAINT `fk_product_model1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  CONSTRAINT `fk_product_quality1` FOREIGN KEY (`quality_id`) REFERENCES `quality` (`id`),
  CONSTRAINT `fk_product_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_product_storage1` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `fk_product_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `title`, `model_id`, `description`, `price`, `qty`, `color_id`, `storage_id`, `quality_id`, `status_id`, `user_id`, `created_at`)
VALUES
	(1,'iPhone 15 Pro Max 256GB',3,'Water resistanse budget smartphone',25000,20,5,4,1,2,1,'2025-07-23 00:58:50'),
	(2,'Samsung Galaxy S24 Ultra',2,'Water proof high quality phone',20000,20,5,2,1,2,1,'2025-07-23 00:00:00'),
	(3,'Sony Xperia 5 J9210 128GB',1,'The Sony Xperia 5 is a compatible budget phone',19000,20,1,3,2,2,2,'2025-07-20 11:21:43'),
	(4,'iPhone 16 Pro Max 256GB',8,'iPhone 16 Pro Max is a powerful one',27900,30,2,4,1,2,1,'2025-07-21 00:00:00'),
	(5,'iPhone 15 128GB',5,'iPhone 15 is a powerful line of Apple',30000,10,1,3,1,2,2,'2025-07-21 04:12:26'),
	(6,'iPhone 15 Pro 256GB',5,'iPhone 15 Pro is a premium phone',12700,14,5,4,2,2,2,'2025-07-21 00:00:00'),
	(7,'Samsung Galaxy Z Fold 6 128GB',2,'Samsung Galaxy Z Fold 6 is good',19500,25,2,3,1,2,2,'2025-07-21 00:00:00'),
	(8,'iPhone 16 128GB',8,'iPhone 16 is a good one',21000,25,4,3,1,2,2,'2025-07-21 00:00:00'),
	(9,'Samsung Galaxy S25 Ultra',2,'This is a good phone',31000,20,5,5,1,2,2,'2025-07-22 00:00:00'),
	(20,'Asus TUF Gaming A15',10,'- AMD Ryzen 7 7435HS Processor\r\n- 512GB NVMe M.2 SSD\r\n- 8GB DDR5-4800 RAM\r\n- 15.6, FHD (1920 x 1080), 144Hz Display\r\n- 4GB NVIDIA GeForce RTX 2050 Graphics\r\n- 1-Zone RGB Backlit Chiclet Keyboard',24500,14,1,5,1,2,2,'2025-08-01 00:00:00'),
	(21,'MSI Cyborg 15 A2RUDX',11,'- Intel Core 7 â 240H Processor\r\n- 1TB M.2 NVMe PCIe GEN4 SSD\r\n- 16GB DDR5 4800MHZ RAM\r\n- 15.6â³, FHD, 144Hz Refresh Rate Display\r\n- 6GB NVIDIA GeForce RTX 3050 Graphics\r\n- Single Backlit Keyboard',25000,25,1,6,1,2,2,'2025-08-05 00:00:00'),
	(22,'Lenovo IdeaPad Slim 3',12,'â Intel Core i7-13620H Processor\r\nâ 512GB M.2 2242 PCIe NVMe SSD\r\nâ 24GB DDR5-4800 RAM\r\nâ 15.3â³ WUXGA (1920Ã1200) IPS Display\r\nâ Intel UHD Graphics\r\nâ Luna Grey Color',11000,18,5,5,2,2,2,'2025-08-10 00:00:00'),
	(23,'Lenovo IdeaCentre Tower',13,'â Intel Core i3-13100 Processor\r\nâ 1TB M.2 PCIe 4.0Ã4 NVMe SSD\r\nâ 8GB UDIMM DDR5-4800 RAM\r\nâ 19.5â³ 1600Ã900 TN display, Anti-glare Monitor\r\nâ 260W 90% Power Supply\r\nâ Cloud Grey\r\nâ Windows 11 Pro',10000,15,5,6,2,2,2,'2025-08-10 00:00:00'),
	(24,'Asus Vivobook 14',14,'â Intel Core i5-1335U Processor\r\nâ 512GB M.2 NVM PCIe 4.0 SSD\r\nâ 8GB DDR4 RAM\r\nâ 14â³, FHD (1920 x 1080) IPS Display\r\nâ Intel UHD Graphics',14000,15,1,5,1,3,2,'2025-08-10 00:00:00'),
	(25,'MSI Modern 15 F13MG',15,'â Intel Core i3-1315U Processor\r\nâ 512GB GEN4 NVME M.2 SSD\r\nâ 8GB DDR4-3200MHz RAM\r\nâ 15.6â³, FHD (1920 x 1080) IPS Display\r\nâ Single Backlit Keyboard\r\nâ Intel graphics',11500,10,5,5,1,2,13,'2025-08-10 00:00:00'),
	(26,'MSI Modern 15 B12M',15,'â Intel Core i5 â 1235U Processor\r\nâ 8GB DDR4 3200MHZ RAM\r\nâ 512GB NVME M.2 SSD\r\nâ 15.6â, FHD, IPS-Level Display\r\nâ Intel Iris Xe Graphics\r\nâ Backlight Keyboard\r\nâ Windows 11 Home',10500,15,1,5,2,2,13,'2025-08-10 00:00:00'),
	(27,'MSI Cyborg 15 A13VE',11,'â Intel core i7 -13620H Processor\r\nâ 512GB M.2 NVMe Gen4 SSD\r\n   (Free 1TB Upgrade)\r\nâ 16GB DDR5 4800MHZ RAM\r\nâ 15.6â³, FHD, 144Hz Refresh Rate Display\r\nâ 6GB NVIDIA GeForce RTX 4050 Graphics\r\nâ Backlit Keyboard',14000,20,1,5,1,3,13,'2025-08-10 00:00:00'),
	(28,'Lenovo IdeaPad 1',12,'â AMD Ryzen 3 7320U Processor\r\nâ 512GB M.2 2242 PCIe NVMe SSD\r\nâ 16GB LPDDR5-5500 RAM\r\nâ 15.6â³ FHD (1920Ã1080) Display\r\nâ AMD Radeon 610M Graphics\r\nâ Cloud Grey Color\r\n',10400,10,1,5,1,2,16,'2025-08-14 00:00:00');

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table quality
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quality`;

CREATE TABLE `quality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `quality` WRITE;
/*!40000 ALTER TABLE `quality` DISABLE KEYS */;

INSERT INTO `quality` (`id`, `value`)
VALUES
	(1,'New'),
	(2,'Used');

/*!40000 ALTER TABLE `quality` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;

INSERT INTO `status` (`id`, `value`)
VALUES
	(1,'Pending'),
	(2,'Active'),
	(3,'Rejected');

/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table storage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `storage`;

CREATE TABLE `storage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;

INSERT INTO `storage` (`id`, `value`)
VALUES
	(1,'32GB'),
	(2,'64GB'),
	(3,'128GB'),
	(4,'256GB'),
	(5,'512GB'),
	(6,'1TB');

/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(20) NOT NULL,
  `verification` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `verification`, `created_at`)
VALUES
	(1,'Yomal','kavinda','kavinda12@gmail.com','Yomal123#123','Verified','2025-07-20 00:53:53'),
	(2,'Amiru','Upek','amiru@gmail.com','Amiru20040131$','Verified','2025-07-23 09:22:30'),
	(13,'Shehan','Minura','shehan@gmail.com','Sheshan123@4','Verified','2025-08-10 16:57:07'),
	(14,'Lasitha','Kumara','lasitha@gmail.com','Lasitha2004$','043790','2025-08-12 21:57:58'),
	(15,'Kanthi','Perera','kanthi@gmail.com','Kanthi2004@#','087198','2025-08-13 19:59:13'),
	(16,'kanthi','skehsn','amirupekw@gmail.com','Amiru20030131$','Verified','2025-08-14 16:00:15');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wishlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_user1_idx` (`user_id`),
  KEY `fk_cart_product1_idx` (`product_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
