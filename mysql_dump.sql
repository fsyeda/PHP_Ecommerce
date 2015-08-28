-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2015 at 03:38 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `city`, `state`, `country`, `zipcode`) VALUES
(1, '8 Peacock ct', 'san jose', 'CA', 'USA', 95069),
(2, '3434 Warburton ave', 'santa clara', 'CA', 'USA', 95051),
(3, '4343 Granada ave', 'Sunnyvale', 'CA', 'USA', 95051),
(4, '6543 calabazaz st', 'Santa Clara ', 'CA', 'USA', 95040),
(5, '3456 monroe st', 'San Jose', 'CA', 'USA', 95093);

-- --------------------------------------------------------

--
-- Table structure for table `billings`
--

CREATE TABLE IF NOT EXISTS `billings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_billings_users1_idx` (`user_id`),
  KEY `fk_billings_addresses1_idx` (`address_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `billings`
--

INSERT INTO `billings` (`id`, `user_id`, `address_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_carts_users1_idx` (`user_id`),
  KEY `fk_carts_products1_idx` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(1, 1, 5, NULL),
(21, 5, 44, NULL),
(22, 5, 44, NULL),
(23, 5, 44, NULL),
(24, 5, 41, 2),
(25, 5, 12, 1),
(26, 7, 44, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Accessories'),
(2, 'Perfumes'),
(3, 'Dresses'),
(4, 'Bags'),
(5, 'Shoes');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_users_idx` (`user_id`),
  KEY `fk_orders_products1_idx` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 1, 'order-in-process', '2015-04-23 00:00:00', NULL),
(2, 1, 8, 1, 'shipped', '2015-04-23 20:10:00', NULL),
(3, 2, 6, 2, 'shipped', '2015-04-23 20:10:00', NULL),
(4, 3, 4, 2, 'shipped', '2015-04-23 20:10:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `image` longblob,
  `image_left` longblob,
  `image_right` longblob,
  `image_top` longblob,
  `image_bottom` longblob,
  `image_thumbnail` longblob,
  `price` decimal(15,2) DEFAULT NULL,
  `inventory` int(11) DEFAULT NULL,
  `quantity_sold` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_categories1_idx` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `image`, `image_left`, `image_right`, `image_top`, `image_bottom`, `image_thumbnail`, `price`, `inventory`, `quantity_sold`) VALUES
(2, 1, '925 Sterling Silver Cubic Zirconia Stud Earrings', '925 Sterling Silver Cubic Zirconia Stud Earrings', 0x2f6173736574732f6163636573736f726965735f65617272696e67735f312e6a7067, 0x2f6173736574732f6163636573736f726965735f65617272696e67735f322e6a7067, 0x2f6173736574732f6163636573736f726965735f65617272696e67735f332e6a7067, 0x2f6173736574732f6163636573736f726965735f65617272696e67735f342e6a7067, 0x2f6173736574732f6163636573736f726965735f65617272696e67735f352e6a7067, 0x2f6173736574732f6163636573736f726965735f65617272696e67735f312e6a7067, '100.00', 100, 5),
(3, 1, 'Fun Daisy Grand UK Princess Kate Middleton Hot Fashion Necklace – xl00941', 'Fun Daisy Grand UK Princess Kate Middleton Hot Fashion Necklace', 0x2f6173736574732f6163636573736f726965735f6e65636b70696563655f312e6a7067, 0x2f6173736574732f6163636573736f726965735f6e65636b70696563655f322e6a7067, 0x2f6173736574732f6163636573736f726965735f6e65636b70696563655f332e6a7067, 0x2f6173736574732f6163636573736f726965735f6e65636b70696563655f342e6a7067, 0x2f6173736574732f6163636573736f726965735f6e65636b70696563655f352e6a7067, 0x2f6173736574732f6163636573736f726965735f6e65636b70696563655f312e6a7067, '25.00', 100, 6),
(4, 1, 'Bamoer Valentine''s Gift Luxury Rose Gold Plated Bracelet for Women with Sparkling Clear Cubic Zirconia inlaid', 'Material: 18K rose gold plated + AAA Cubic zirconia.\nLength: 19cm, Width: 0.7cm.\nSuitable for any occasion, easy to match the clothes, a good choice for you to wear every day.\nPopular in ladies, want to pick a gift for girlfriend or Mom? This beauty will undoubtedly catch her heart.\nTips of opening the bracelet clasp: 1. Open the clip; 2. Hold both two ends of the clasp; 3. Pull the clasp. New bracelet clasp might be tight, if you find the clasp hard to pull off, please try to shake the clasp up and down with your fingers, then pull more harder.', 0x2f6173736574732f6163636573736f726965735f62726163656c65745f312e6a7067, 0x2f6173736574732f6163636573736f726965735f62726163656c65745f322e6a7067, 0x2f6173736574732f6163636573736f726965735f62726163656c65745f332e6a7067, 0x2f6173736574732f6163636573736f726965735f62726163656c65745f342e6a7067, 0x2f6173736574732f6163636573736f726965735f62726163656c65745f352e6a7067, 0x2f6173736574732f6163636573736f726965735f62726163656c65745f312e6a7067, '91.99', 100, 8),
(5, 1, 'Women''s Party Wedding Jewellery Sets Elegant Rose Gold Plated Faux Pearl Crystal Collar Necklace Earrings Set', 'Material: Alloy, Faux Pearl, Crystal', 0x2f6173736574732f6163636573736f726965735f7365745f312e6a7067, 0x2f6173736574732f6163636573736f726965735f7365745f322e6a7067, 0x2f6173736574732f6163636573736f726965735f7365745f332e6a7067, 0x2f6173736574732f6163636573736f726965735f7365745f342e6a7067, 0x2f6173736574732f6163636573736f726965735f7365745f352e6a7067, 0x2f6173736574732f6163636573736f726965735f7365745f312e6a7067, '5.39', 100, 7),
(6, 1, 'Little Star Women Chain Ankle Bracelet Barefoot Sandal Beach Foot Jewelry', 'Susenstone(TM) is a registered trademark and the only authorized seller of susenstone branded products.\nGender: Women, Girl Material: Alloy\nLength: 25cm/9.84ʺ Nice accessories to integrate jewelry case for girls and collectors.\nMatch with suitable apparel for different occasion.\nWonderful gift for you and your female friends.', 0x2f6173736574732f6163636573736f726965735f616e6b6c65745f312e6a7067, 0x2f6173736574732f6163636573736f726965735f616e6b6c65745f322e6a7067, 0x2f6173736574732f6163636573736f726965735f616e6b6c65745f332e6a7067, 0x2f6173736574732f6163636573736f726965735f616e6b6c65745f342e6a7067, 0x2f6173736574732f6163636573736f726965735f616e6b6c65745f352e6a7067, 0x2f6173736574732f6163636573736f726965735f616e6b6c65745f312e6a7067, '9.00', 100, 0),
(7, 1, 'ANDI ROSE Fashion Jewelry Gold Plated Crystal Pearl Pendant Necklace Earrings Set', 'Material: Gold Plated & Pearl & Rhinestone', 0x2f6173736574732f6163636573736f726965735f616e64695f312e6a7067, 0x2f6173736574732f6163636573736f726965735f616e6b6c65745f322e6a7067, 0x2f6173736574732f6163636573736f726965735f616e64695f322e6a7067, 0x2f6173736574732f6163636573736f726965735f616e64695f332e6a7067, 0x2f6173736574732f6163636573736f726965735f616e64695f342e6a7067, 0x2f6173736574732f6163636573736f726965735f616e64695f312e6a7067, '5.99', 100, 13),
(8, 1, 'Golden Butterfly Hair Clip Headband Hair Accessories', 'Size: 5cm*3.5cm\nNew Fashion Design, Very Popular\nMaterial:Alloy\n100% GUARANTEE Love it !\nMatch with suitable apparel for different occasion', 0x2f6173736574732f6163636573736f726965735f686169725f312e6a7067, 0x2f6173736574732f6163636573736f726965735f686169725f322e6a7067, 0x2f6173736574732f6163636573736f726965735f686169725f332e6a7067, 0x2f6173736574732f6163636573736f726965735f686169725f342e6a7067, 0x2f6173736574732f6163636573736f726965735f686169725f352e6a7067, 0x2f6173736574732f6163636573736f726965735f686169725f312e6a7067, '2.99', 100, 14),
(9, 1, 'Women''s Sheer Chiffon Scarf', 'Add a fun scarf to your Poodle Skirt and you have the finishing touch for your Fifties look.\nScarf is 21" x 21" square sheer polyester fabric with finished hem.\nWear it tied around your ponytail, as a headband, or as a neck scarf.\nBright color, quality made 50''s style\nPretty accessory scarf, for a 50s costume, everyday wear, church or as a team color', 0x2f6173736574732f6163636573736f726965735f73636172665f312e6a7067, 0x2f6173736574732f6163636573736f726965735f73636172665f322e6a7067, 0x2f6173736574732f6163636573736f726965735f73636172665f332e6a7067, 0x2f6173736574732f6163636573736f726965735f73636172665f342e6a7067, 0x2f6173736574732f6163636573736f726965735f73636172665f352e6a7067, 0x2f6173736574732f6163636573736f726965735f73636172665f312e6a7067, '5.99', 100, 57),
(10, 1, 'Women Gold Silver Leaf Shaped Casual Joker Belt', 'Metal\nMaterial: Matel\nColour: Gold, Silver\nSize: Length 70cm, Wide 1cm\nGolden bling metal showing fashion and stylish\nWell matched for your clothes especially dress ,loose batwing blouse, large coat, bottoming skirt, long shirt', 0x2f6173736574732f6163636573736f726965735f62656c745f312e6a7067, 0x2f6173736574732f6163636573736f726965735f62656c745f322e6a7067, 0x2f6173736574732f6163636573736f726965735f62656c745f332e6a7067, 0x2f6173736574732f6163636573736f726965735f62656c745f342e6a7067, 0x2f6173736574732f6163636573736f726965735f62656c745f352e6a7067, 0x2f6173736574732f6163636573736f726965735f62656c745f312e6a7067, '4.02', 100, 57),
(11, 2, 'Guess Eau de Parfum Spray for Women, 2.5 Fluid Ounce', 'Design House: Guess\nFragrance Notes: amber, freesia, tangerine, muguet, green apple, peach, peony, and musk.\nRecommended Use: casual', 0x2f6173736574732f70657266756d655f67756573735f312e6a7067, 0x2f6173736574732f70657266756d655f67756573735f322e6a7067, 0x2f6173736574732f70657266756d655f67756573735f332e6a7067, 0x2f6173736574732f70657266756d655f67756573735f342e6a7067, 0x2f6173736574732f70657266756d655f67756573735f352e6a7067, 0x2f6173736574732f70657266756d655f67756573735f312e6a7067, '55.00', 100, 34),
(12, 2, 'Can Can by Paris Hilton for Women - 3.4 Ounce EDP Spray', 'Packaging for this product may vary from that shown in the image above', 0x2f6173736574732f70657266756d655f63616e5f312e6a7067, 0x2f6173736574732f70657266756d655f63616e5f322e6a7067, 0x2f6173736574732f70657266756d655f63616e5f332e6a7067, 0x2f6173736574732f70657266756d655f63616e5f342e6a7067, 0x2f6173736574732f70657266756d655f63616e5f352e6a7067, 0x2f6173736574732f70657266756d655f63616e5f312e6a7067, '55.00', 100, 45),
(13, 2, 'TOMMY GIRL by Tommy Hilfiger COLOGNE .25 OZ MINI', 'Design House: Tommy Hilfiger\nFragrance Notes: a refreshing and energetic floral, with low notes of sandalwood and heather.\nRecommended Use: daytime', 0x2f6173736574732f70657266756d655f746f6d6d795f312e6a7067, 0x2f6173736574732f70657266756d655f746f6d6d795f322e6a7067, 0x2f6173736574732f70657266756d655f746f6d6d795f332e6a7067, 0x2f6173736574732f70657266756d655f746f6d6d795f342e6a7067, 0x2f6173736574732f70657266756d655f746f6d6d795f352e6a7067, 0x2f6173736574732f70657266756d655f746f6d6d795f312e6a7067, '20.00', 100, 56),
(14, 2, 'Victoria''s Secret Fantasies Love Spell Fragrance Mist 8.4 oz', 'VICTORIAS SECRETS FRAGRANCE MIST\nSize:8.4 OZ', 0x2f6173736574732f70657266756d655f766963746f7269615f312e6a7067, 0x2f6173736574732f70657266756d655f766963746f7269615f322e6a7067, 0x2f6173736574732f70657266756d655f766963746f7269615f332e6a7067, 0x2f6173736574732f70657266756d655f766963746f7269615f342e6a7067, 0x2f6173736574732f70657266756d655f766963746f7269615f352e6a7067, 0x2f6173736574732f70657266756d655f766963746f7269615f312e6a7067, '12.00', 100, 87),
(15, 2, 'Lovely by Sarah Jessica Parker for Women, Eau de Parfum, 3.4-Ounce Spray Bottle', 'Packaging for this product may vary from that shown in the image above', 0x2f6173736574732f70657266756d655f6c6f76656c795f312e6a7067, 0x2f6173736574732f70657266756d655f6c6f76656c795f322e6a7067, 0x2f6173736574732f70657266756d655f6c6f76656c795f332e6a7067, 0x2f6173736574732f70657266756d655f6c6f76656c795f342e6a7067, 0x2f6173736574732f70657266756d655f6c6f76656c795f352e6a7067, 0x2f6173736574732f70657266756d655f6c6f76656c795f312e6a7067, '68.00', 100, 12),
(16, 2, 'Mambo by Liz Claiborne for Women, Eau De Parfum Spray, 3.4-Ounce', 'Mambo by Liz Claiborne for Women, Eau De Parfum Spray, 3.4-Ounce', 0x2f6173736574732f70657266756d655f6d616d626f5f312e6a7067, 0x2f6173736574732f70657266756d655f6d616d626f5f322e6a7067, 0x2f6173736574732f70657266756d655f6d616d626f5f332e6a7067, 0x2f6173736574732f70657266756d655f6d616d626f5f342e6a7067, 0x2f6173736574732f70657266756d655f6d616d626f5f352e6a7067, 0x2f6173736574732f70657266756d655f6d616d626f5f312e6a7067, '47.50', 100, 13),
(17, 2, 'Cool Water By Zino Davidoff For Women. Deodorant Spray 3.4 Oz', 'Cool Water By Zino Davidoff For Women. Deodorant Spray 3.4 Oz', 0x2f6173736574732f70657266756d655f64617669645f312e6a7067, 0x2f6173736574732f70657266756d655f64617669645f322e6a7067, 0x2f6173736574732f70657266756d655f64617669645f332e6a7067, 0x2f6173736574732f70657266756d655f64617669645f342e6a7067, 0x2f6173736574732f70657266756d655f64617669645f352e6a7067, 0x2f6173736574732f70657266756d655f64617669645f312e6a7067, '28.00', 100, 14),
(18, 2, 'Styles For Less women''s Crush by SFL Perfume', 'Styles For Less women''s Crush by SFL Perfume', 0x2f6173736574732f70657266756d655f7374796c65735f312e6a7067, 0x2f6173736574732f70657266756d655f7374796c65735f322e6a7067, 0x2f6173736574732f70657266756d655f7374796c65735f332e6a7067, 0x2f6173736574732f70657266756d655f7374796c65735f342e6a7067, 0x2f6173736574732f70657266756d655f7374796c65735f352e6a7067, 0x2f6173736574732f70657266756d655f7374796c65735f312e6a7067, '9.99', 100, 15),
(19, 2, 'Jessica Simpson I Fancy You Women Eau De Parfum Spray, 3.4 Ounce', 'Jessica Simpson I Fancy You Women Eau De Parfum Spray, 3.4 Ounce', 0x2f6173736574732f70657266756d655f6a6573736963615f312e6a7067, 0x2f6173736574732f70657266756d655f6a6573736963615f322e6a7067, 0x2f6173736574732f70657266756d655f6a6573736963615f332e6a7067, 0x2f6173736574732f70657266756d655f6a6573736963615f342e6a7067, 0x2f6173736574732f70657266756d655f6a6573736963615f352e6a7067, 0x2f6173736574732f70657266756d655f6a6573736963615f312e6a7067, '55.00', 100, 16),
(20, 2, 'Arden Beauty By Elizabeth Arden For Women. Eau De Parfum Spray 3.3 Ounces', 'Arden Beauty By Elizabeth Arden For Women. Eau De Parfum Spray 3.3 Ounces', 0x2f6173736574732f70657266756d655f617264656e5f312e6a7067, 0x2f6173736574732f70657266756d655f617264656e5f322e6a7067, 0x2f6173736574732f70657266756d655f617264656e5f332e6a7067, 0x2f6173736574732f70657266756d655f617264656e5f342e6a7067, 0x2f6173736574732f70657266756d655f617264656e5f352e6a7067, 0x2f6173736574732f70657266756d655f617264656e5f312e6a7067, '60.00', 100, 14),
(22, 3, 'MUXXN Women 1950s Vintage Retro Capshoulder Party Swing Dress', 'Imported\nClassy 1950''s style inspired black dress\nThis dress has a pleated bodice and adorable cap sleeves\nThe swing skirt is the perfect look for any event\nPLS See the detail size information in description', 0x2f6173736574732f647265737365735f315f312e6a7067, 0x2f6173736574732f647265737365735f315f322e6a7067, 0x2f6173736574732f647265737365735f315f332e6a7067, 0x2f6173736574732f647265737365735f315f342e6a7067, 0x2f6173736574732f647265737365735f315f352e6a7067, 0x2f6173736574732f647265737365735f315f312e6a7067, '59.99', 100, 3),
(23, 3, 'Women 1950s Vintage Retro Capshoulder Party Swing Dress', 'Imported\nClassy 1950''s style inspired black dress\nThis dress has a pleated bodice and adorable cap sleeves\nThe swing skirt is the perfect look for any event\nPLS See the detail size information in description', 0x2f6173736574732f647265737365735f325f312e6a7067, 0x2f6173736574732f647265737365735f325f322e6a7067, 0x2f6173736574732f647265737365735f325f332e6a7067, 0x2f6173736574732f647265737365735f325f342e6a7067, 0x2f6173736574732f647265737365735f325f352e6a7067, 0x2f6173736574732f647265737365735f325f312e6a7067, '59.99', 100, 2),
(24, 3, 'OSA Women''s Vintage Fit Flare Casual Embroidery Chiffon Lace Maxi Dress', 'Surface material: 100% polyester; Contrast color material: 100% nylon;embroidery thread: 100% cotton; Lining: 100% polyester\nLace braces skirt summer dress,rechange dress size\nComfortable to wear. Fashionable and durable. Very convenient to match with other clothes\nDrip line drying in the shade; Iron at maximum sole plate temperature of 110 degree centigrade; Hand wash; Normal dry cleaning\nIt is Asian size,Please pls noted the size is runs small than US size and see the detailed size chart to select the fit size', 0x2f6173736574732f647265737365735f335f312e6a7067, 0x2f6173736574732f647265737365735f335f322e6a7067, 0x2f6173736574732f647265737365735f335f332e6a7067, 0x2f6173736574732f647265737365735f335f342e6a7067, 0x2f6173736574732f647265737365735f335f352e6a7067, 0x2f6173736574732f647265737365735f335f312e6a7067, '44.69', 100, 2),
(25, 3, 'Ever Pretty One Shoulder Rhinestones Hi-Lo Chiffon Party Dress 08100', 'Surface material: 100% polyester; Contrast color material: 100% nylon;embroidery thread: 100% cotton; Lining: 100% polyester\nLace braces skirt summer dress,rechange dress size\nComfortable to wear. Fashionable and durable. Very convenient to match with other clothes\nDrip line drying in the shade; Iron at maximum sole plate temperature of 110 degree centigrade; Hand wash; Normal dry cleaning\nIt is Asian size,Please pls noted the size is runs small than US size and see the detailed size chart to select the fit size', 0x2f6173736574732f647265737365735f345f312e6a7067, 0x2f6173736574732f647265737365735f345f322e6a7067, 0x2f6173736574732f647265737365735f345f332e6a7067, 0x2f6173736574732f647265737365735f345f342e6a7067, 0x2f6173736574732f647265737365735f345f352e6a7067, 0x2f6173736574732f647265737365735f345f312e6a7067, '84.99', 100, 2),
(26, 3, 'Ever Pretty One Shoulder Flowers Padded Ruffles Short Bridesmaid Dress 03535', 'Concealed zipper up the back\nNon-adjustable one shoulder strap\nLining, no stretch\nPadded enough for "no bra" option', 0x2f6173736574732f647265737365735f355f312e6a7067, 0x2f6173736574732f647265737365735f355f322e6a7067, 0x2f6173736574732f647265737365735f355f332e6a7067, 0x2f6173736574732f647265737365735f355f342e6a7067, 0x2f6173736574732f647265737365735f355f352e6a7067, 0x2f6173736574732f647265737365735f355f312e6a7067, '69.99', 100, 1),
(27, 3, 'LaSuiveur Womens Crop Top Midi Skirt Outfit Two Piece Bodycon Bandage Dress', 'Imported\nFabric:cotton blends+elastane\nSize:small/medium/large\nDesign:crop top+midi skirt/2 pieces set/slim-fit\nGreat for casual wear, parties, night out or clubs', 0x2f6173736574732f647265737365735f365f312e6a7067, 0x2f6173736574732f647265737365735f365f322e6a7067, 0x2f6173736574732f647265737365735f365f332e6a7067, 0x2f6173736574732f647265737365735f365f342e6a7067, 0x2f6173736574732f647265737365735f365f352e6a7067, 0x2f6173736574732f647265737365735f365f312e6a7067, '19.90', 100, 0),
(28, 3, 'PAKULA Women Sexy Backless Lace Crochet Chiffon Summer Beach Mini Dress', 'PAKULA Women Sexy Backless Lace Crochet Chiffon Summer Beach Mini Dress', 0x2f6173736574732f647265737365735f375f312e6a7067, 0x2f6173736574732f647265737365735f375f322e6a7067, 0x2f6173736574732f647265737365735f375f332e6a7067, 0x2f6173736574732f647265737365735f375f342e6a7067, 0x2f6173736574732f647265737365735f375f352e6a7067, 0x2f6173736574732f647265737365735f375f312e6a7067, '33.99', 100, 8),
(29, 3, 'Ever Pretty 3/4 Sleeve Ruched Waist Classy V-Neck Casual Cocktail Dress 03632', 'Ever Pretty 3/4 Sleeve Ruched Waist Classy V-Neck Casual Cocktail Dress 03632', 0x2f6173736574732f647265737365735f385f312e6a7067, 0x2f6173736574732f647265737365735f385f322e6a7067, 0x2f6173736574732f647265737365735f385f332e6a7067, 0x2f6173736574732f647265737365735f385f342e6a7067, 0x2f6173736574732f647265737365735f385f352e6a7067, 0x2f6173736574732f647265737365735f385f312e6a7067, '39.99', 100, 80),
(30, 3, 'DEARCASE Women''s Lace Maxi Dresses Bodycon Midi Dress', 'Cut-out back\nSlip dress lining\nGuava lace scalloped trim\nUS size S/M/L/XL,buy with confidence\nSuit for casual,bridesmaid,cocktail,evening,party,wedding', 0x2f6173736574732f647265737365735f395f312e6a7067, 0x2f6173736574732f647265737365735f395f322e6a7067, 0x2f6173736574732f647265737365735f395f332e6a7067, 0x2f6173736574732f647265737365735f395f342e6a7067, 0x2f6173736574732f647265737365735f395f352e6a7067, 0x2f6173736574732f647265737365735f395f312e6a7067, '49.99', 100, 66),
(31, 3, 'Babyonline Black Fake Two Pieces OL Fishtail Party Business Midi Dress', 'Material: 75%Cotton + 20%Nylon + 5%Spandex\nSuit for Business Occasion,Evening Party,Prom and Wedding', 0x2f6173736574732f647265737365735f31305f312e6a7067, 0x2f6173736574732f647265737365735f31305f322e6a7067, 0x2f6173736574732f647265737365735f31305f332e6a7067, 0x2f6173736574732f647265737365735f31305f342e6a7067, 0x2f6173736574732f647265737365735f31305f352e6a7067, 0x2f6173736574732f647265737365735f31305f312e6a7067, '59.99', 100, 3),
(32, 4, 'Calvin Klein 4 BQ Novelty Cross Body Bag', '100% Polyvinyl Chloride\nImported\npolyester lining\nturn-lock closure\n24" shoulder drop\n5.5" high\n6.5" wide', 0x2f6173736574732f626167735f63616c76696e5f312e6a7067, 0x2f6173736574732f626167735f63616c76696e5f312e6a7067, 0x2f6173736574732f626167735f63616c76696e5f312e6a7067, 0x2f6173736574732f626167735f63616c76696e5f312e6a7067, 0x2f6173736574732f626167735f63616c76696e5f312e6a7067, 0x2f6173736574732f626167735f63616c76696e5f312e6a7067, '148.00', 100, 43),
(33, 4, 'Anne Klein Double Trouble Tote Shoulder Bag', '100% Polyvinyl Chloride\nImported\nFabric lining\nMagnetic snap closure\n10" shoulder drop\n11" high\n12" wide', 0x2f6173736574732f626167735f616e6e655f312e6a7067, 0x2f6173736574732f626167735f616e6e655f322e6a7067, 0x2f6173736574732f626167735f616e6e655f332e6a7067, 0x2f6173736574732f626167735f616e6e655f342e6a7067, 0x2f6173736574732f626167735f616e6e655f352e6a7067, 0x2f6173736574732f626167735f616e6e655f312e6a7067, '89.00', 100, 2),
(34, 4, 'Aldo Drymon Clutch', 'Polyurethane\nImported\nPolyester lining\nmagnetic closure\n24" shoulder drop\n7.5" high\n10.5" wide', 0x2f6173736574732f626167735f616c646f5f312e6a7067, 0x2f6173736574732f626167735f616c646f5f322e6a7067, 0x2f6173736574732f626167735f616c646f5f332e6a7067, 0x2f6173736574732f626167735f616c646f5f342e6a7067, 0x2f6173736574732f626167735f616c646f5f352e6a7067, 0x2f6173736574732f626167735f616c646f5f312e6a7067, '40.00', 100, 13),
(35, 4, 'MG Collection Carlota Satchel Travel Cross Body Bag', '100% Man-made-materilas\nImported\n100% Man-made-materials lining\nClasp closure\n21" shoulder drop\n11" high\n10.5" wide', 0x2f6173736574732f626167735f6d675f312e6a7067, 0x2f6173736574732f626167735f6d675f322e6a7067, 0x2f6173736574732f626167735f6d675f332e6a7067, 0x2f6173736574732f626167735f6d675f342e6a7067, 0x2f6173736574732f626167735f6d675f352e6a7067, 0x2f6173736574732f626167735f6d675f312e6a7067, '52.00', 100, 0),
(36, 4, 'Tommy Hilfiger Ashley Med Travel Tote', '100% Man-made-materials\nImported\n100% Man-made-materials lining\nZipper closure\n7.5" shoulder drop\n14" high\n15" wide\nMade in China', 0x2f6173736574732f626167735f746f6d6d795f312e6a7067, 0x2f6173736574732f626167735f746f6d6d795f322e6a7067, 0x2f6173736574732f626167735f746f6d6d795f332e6a7067, 0x2f6173736574732f626167735f746f6d6d795f342e6a7067, 0x2f6173736574732f626167735f746f6d6d795f352e6a7067, 0x2f6173736574732f626167735f746f6d6d795f312e6a7067, '98.00', 100, 9),
(37, 4, 'Nine West Track-Tion ACTN Cross Body Bag', '100% Polyvinyl Chloride\nImported\nFabric lining\nMagnetic snap closure\n23" shoulder drop\n8" high\n10" wide', 0x2f6173736574732f626167735f6e696e655f312e6a7067, 0x2f6173736574732f626167735f6e696e655f322e6a7067, 0x2f6173736574732f626167735f6e696e655f332e6a7067, 0x2f6173736574732f626167735f6e696e655f342e6a7067, 0x2f6173736574732f626167735f6e696e655f352e6a7067, 0x2f6173736574732f626167735f6e696e655f312e6a7067, '65.00', 100, 0),
(38, 4, 'Jack&Chris Ladies'' Genuine Leather Tote Bag Shoulder Bag Top Handle Handbags,EN5509', '1.Size:15.35"(Length)*10.23"(Height)*5.9"(Width)\n2.Material:Wax oil leather\n3.1* zipper compartment,2* zipper pocket,1* phone pocket,1* card pocket\n4.High quality handicraft, it''s deserved', 0x2f6173736574732f626167735f6a61636b5f312e6a7067, 0x2f6173736574732f626167735f6a61636b5f322e6a7067, 0x2f6173736574732f626167735f6a61636b5f332e6a7067, 0x2f6173736574732f626167735f6a61636b5f342e6a7067, 0x2f6173736574732f626167735f6a61636b5f352e6a7067, 0x2f6173736574732f626167735f6a61636b5f312e6a7067, '79.00', 100, 65),
(39, 4, 'Fossil Explorer Straw Cross Body Bag', 'Man Made\nImported\nTextile lining\nZipper closure\n23.5" shoulder drop\n9.5" high\n10.5" wide', 0x2f6173736574732f626167735f666f7373696c5f312e6a7067, 0x2f6173736574732f626167735f666f7373696c5f322e6a7067, 0x2f6173736574732f626167735f666f7373696c5f332e6a7067, 0x2f6173736574732f626167735f666f7373696c5f342e6a7067, 0x2f6173736574732f626167735f666f7373696c5f352e6a7067, 0x2f6173736574732f626167735f666f7373696c5f312e6a7067, '138.00', 100, 74),
(40, 4, 'Madden Girl TRVLR Weekender Shoulder Bag', 'Polyester/Polyvinyl Chloride\nImported\nfabric lining\nzipper closure\nMade in China', 0x2f6173736574732f626167735f6d616464656e5f312e6a7067, 0x2f6173736574732f626167735f6d616464656e5f322e6a7067, 0x2f6173736574732f626167735f6d616464656e5f332e6a7067, 0x2f6173736574732f626167735f6d616464656e5f342e6a7067, 0x2f6173736574732f626167735f6d616464656e5f352e6a7067, 0x2f6173736574732f626167735f6d616464656e5f312e6a7067, '64.00', 100, 3),
(41, 4, 'Marc Jacobs Silicone Valley Satchel Top-Handle Bag', '100% Cow Leather\nImported\nFabric lining\nMagnetic snap closure\n8" shoulder drop\n12" high\n14" wide', 0x2f6173736574732f626167735f6d6172635f312e6a7067, 0x2f6173736574732f626167735f6d6172635f322e6a7067, 0x2f6173736574732f626167735f6d6172635f332e6a7067, 0x2f6173736574732f626167735f6d6172635f342e6a7067, 0x2f6173736574732f626167735f6d6172635f352e6a7067, 0x2f6173736574732f626167735f6d6172635f312e6a7067, '528.00', 100, 19),
(42, 5, 'Eileen Fisher Women''s Slew Boot', 'Satin\nImported\nleather sole\nHeel measures approximately 2', 0x2f6173736574732f73686f65735f626164676c65795f312e6a7067, 0x2f6173736574732f73686f65735f626164676c65795f322e6a7067, 0x2f6173736574732f73686f65735f626164676c65795f332e6a7067, 0x2f6173736574732f73686f65735f626164676c65795f342e6a7067, 0x2f6173736574732f73686f65735f626164676c65795f352e6a7067, 0x2f6173736574732f73686f65735f626164676c65795f312e6a7067, '215.00', 100, 17),
(43, 5, 'Donald J Pliner Women''s Malta-OL06 Boot', '100% Leather\nImported\nrubber sole\nSporty rubber unit bottom with stacked heel\n3 inch stacked heel with 1 inch platform\nUpper is perforated oily suede\nDouble side zipper detail\nMade in China', 0x2f6173736574732f73686f65735f646f6e616c645f312e6a7067, 0x2f6173736574732f73686f65735f646f6e616c645f322e6a7067, 0x2f6173736574732f73686f65735f646f6e616c645f332e6a7067, 0x2f6173736574732f73686f65735f646f6e616c645f342e6a7067, 0x2f6173736574732f73686f65735f646f6e616c645f352e6a7067, 0x2f6173736574732f73686f65735f646f6e616c645f312e6a7067, '278.00', 100, 25),
(44, 5, 'Sperry Top-Sider Women''s Angelfish Metallic Python Boat Shoe', '75% Leather/25% Synthetic\nImported\nrubber sole\nBreathable leather lining', 0x2f6173736574732f73686f65735f7370657272795f312e6a7067, 0x2f6173736574732f73686f65735f7370657272795f322e6a7067, 0x2f6173736574732f73686f65735f7370657272795f332e6a7067, 0x2f6173736574732f73686f65735f7370657272795f342e6a7067, 0x2f6173736574732f73686f65735f7370657272795f352e6a7067, 0x2f6173736574732f73686f65735f7370657272795f312e6a7067, '90.00', 100, 34),
(45, 5, 'L.A.M.B. Women''s Enforce Dress Pump', 'Leather/Suede\nImported\nLeather sole\nHeel measures approximately 4"\nMade in China', 0x2f6173736574732f73686f65735f6c616d625f312e6a7067, 0x2f6173736574732f73686f65735f6c616d625f322e6a7067, 0x2f6173736574732f73686f65735f6c616d625f332e6a7067, 0x2f6173736574732f73686f65735f6c616d625f342e6a7067, 0x2f6173736574732f73686f65735f6c616d625f352e6a7067, 0x2f6173736574732f73686f65735f6c616d625f312e6a7067, '285.00', 100, 33),
(46, 5, 'Nine West Women''s Xrisxros Leather Dress Pump', 'Leather\nImported\nManmade sole\nHeel measures approximately 2.5"\nMade in China', 0x2f6173736574732f73686f65735f6e696e655f312e6a7067, 0x2f6173736574732f73686f65735f6e696e655f322e6a7067, 0x2f6173736574732f73686f65735f6e696e655f332e6a7067, 0x2f6173736574732f73686f65735f6e696e655f342e6a7067, 0x2f6173736574732f73686f65735f6e696e655f352e6a7067, 0x2f6173736574732f73686f65735f6e696e655f312e6a7067, '89.00', 100, 21),
(47, 5, 'AK Anne Klein Sport Women''s Bryony Fabric Wedge Pump', 'Textile\nImported\nManmade sole\nHeel measures approximately 1.5"\nAnne klein iflex technology allows for a flexible fit that can bend up to 90 degrees\nLogo-detailed hardware at vamp\nSynthetic sole', 0x2f6173736574732f73686f65735f616b5f312e6a7067, 0x2f6173736574732f73686f65735f616b5f322e6a7067, 0x2f6173736574732f73686f65735f616b5f332e6a7067, 0x2f6173736574732f73686f65735f616b5f342e6a7067, 0x2f6173736574732f73686f65735f616b5f352e6a7067, 0x2f6173736574732f73686f65735f616b5f312e6a7067, '69.00', 100, 11),
(48, 5, 'kate spade new york Women''s Dani Dress Pump', '100% Leather\nImported\nLeather sole\nHeel measures approximately 4"\nCowhide', 0x2f6173736574732f73686f65735f6b6174655f312e6a7067, 0x2f6173736574732f73686f65735f6b6174655f322e6a7067, 0x2f6173736574732f73686f65735f6b6174655f332e6a7067, 0x2f6173736574732f73686f65735f6b6174655f342e6a7067, 0x2f6173736574732f73686f65735f6b6174655f352e6a7067, 0x2f6173736574732f73686f65735f6b6174655f312e6a7067, '298.00', 100, 11),
(49, 5, 'Calvin Klein Women''s Lina Slide Pump', '100% Leather\nImported\nManmade sole\nHeel measures approximately 4.5"\nPlatform measures approximately 0.50"\nMade in China', 0x2f6173736574732f73686f65735f63616c76696e5f312e6a7067, 0x2f6173736574732f73686f65735f63616c76696e5f322e6a7067, 0x2f6173736574732f73686f65735f63616c76696e5f332e6a7067, 0x2f6173736574732f73686f65735f63616c76696e5f342e6a7067, 0x2f6173736574732f73686f65735f63616c76696e5f352e6a7067, 0x2f6173736574732f73686f65735f63616c76696e5f312e6a7067, '129.00', 100, 13),
(50, 5, 'Cynthia Vincent Women''s Nailed Boot', '90% Kid Suede/10% Cow Leather\nImported\nLeather sole\nPeep-toe bootie featuring stacked heel and lace-up vamp', 0x2f6173736574732f73686f65735f63796e746869615f312e6a7067, 0x2f6173736574732f73686f65735f63796e746869615f322e6a7067, 0x2f6173736574732f73686f65735f63796e746869615f332e6a7067, 0x2f6173736574732f73686f65735f63796e746869615f342e6a7067, 0x2f6173736574732f73686f65735f63796e746869615f352e6a7067, 0x2f6173736574732f73686f65735f63796e746869615f312e6a7067, '264.00', 100, 45),
(51, 5, 'Rebecca Minkoff Women''s Ivy Dress Pump', 'Leather\nImported\nLeather sole\nHeel measures approximately 4.25"\nPlatform measures approximately 0.5"\nMade in China', 0x2f6173736574732f73686f65735f726562656363615f312e6a7067, 0x2f6173736574732f73686f65735f726562656363615f322e6a7067, 0x2f6173736574732f73686f65735f726562656363615f332e6a7067, 0x2f6173736574732f73686f65735f726562656363615f342e6a7067, 0x2f6173736574732f73686f65735f726562656363615f352e6a7067, 0x2f6173736574732f73686f65735f726562656363615f312e6a7067, '275.00', 100, 13);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE IF NOT EXISTS `shippings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shippings_users1_idx` (`user_id`),
  KEY `fk_shippings_addresses1_idx` (`address_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `address_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_level` varchar(45) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `user_level`, `created_at`) VALUES
(1, 'meera', 'chandrasekaran', 'c.meera@gmail.com', 'password', 'admin', NULL),
(2, 'farzana', 'syeda', 'farzana@gmail.com', 'password', 'user', NULL),
(3, 'mona', 'rajhans', 'mona@gmail.com', 'password', 'user', NULL),
(4, 'farzana s', 'syed', 'farzana.syeda@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', '2015-07-24 14:48:36'),
(5, 'meera c', 'chandra', 'meera@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, '2015-07-24 14:59:27'),
(6, 'Mona', 'Rajhans', 'mahi@raj.com', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, '2015-07-24 15:52:35'),
(7, 'guest', 'G', 'guest@gmail.com', '482c811da5d5b4bc6d497ffa98491e38', NULL, '2015-08-27 16:51:51');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billings`
--
ALTER TABLE `billings`
  ADD CONSTRAINT `fk_billings_addresses1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_billings_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_carts_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carts_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `fk_shippings_addresses1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_shippings_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
