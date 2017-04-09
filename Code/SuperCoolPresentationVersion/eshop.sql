drop database if exists eshop;
create database eshop;
use eshop;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Color`
--

DROP TABLE IF EXISTS `Color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Color` (
  `colorId` int(11) NOT NULL,
  `currencyRange` int(11) DEFAULT NULL,
  `currencyFrequence` int(11) DEFAULT NULL,
  `colorName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`colorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Favorite`
--

DROP TABLE IF EXISTS `Favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Favorite` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `user_uid` int(11) NOT NULL,
  `product_pid` int(11) NOT NULL,
  PRIMARY KEY (`fid`,`user_uid`,`product_pid`),
  KEY `fk_Favorite_user1_idx` (`user_uid`),
  KEY `fk_Favorite_product1_idx` (`product_pid`),
  CONSTRAINT `fk_Favorite_product1` FOREIGN KEY (`product_pid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Favorite_user1` FOREIGN KEY (`user_uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Feeling`
--

DROP TABLE IF EXISTS `Feeling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feeling` (
  `feelingId` int(11) NOT NULL,
  `product_pid` int(11) NOT NULL,
  `Color_colorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`feelingId`),
  KEY `fk_Feeling_product1_idx` (`product_pid`),
  KEY `fk_F_c_idx` (`Color_colorId`),
  CONSTRAINT `fk_F_c` FOREIGN KEY (`Color_colorId`) REFERENCES `Color` (`colorId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feeling_product1` FOREIGN KEY (`product_pid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Returnitem`
--

DROP TABLE IF EXISTS `Returnitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Returnitem` (
  `orderitem_pid` int(11) NOT NULL,
  `orderitem_orders_oid` int(11) NOT NULL,
  `user_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderitem_pid`),
  KEY `fk3_idx` (`user_uid`),
  KEY `fk2_oio_idx` (`orderitem_orders_oid`),
  CONSTRAINT `fk1` FOREIGN KEY (`orderitem_pid`) REFERENCES `orderitem` (`pid`),
  CONSTRAINT `fk2_oio` FOREIGN KEY (`orderitem_orders_oid`) REFERENCES `orderitem` (`oid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk3` FOREIGN KEY (`user_uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Shape`
--

DROP TABLE IF EXISTS `Shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shape` (
  `shapeId` int(11) NOT NULL,
  `currencyRange` int(11) DEFAULT NULL,
  `currencyFrequence` int(11) DEFAULT NULL,
  `ShapeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shapeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Smell`
--

DROP TABLE IF EXISTS `Smell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Smell` (
  `smellId` int(11) NOT NULL,
  `currencyRange` int(11) DEFAULT NULL,
  `currencyFrequence` int(11) DEFAULT NULL,
  `SmellName` varchar(45) DEFAULT NULL,
  `product_pid` int(11) NOT NULL,
  PRIMARY KEY (`smellId`,`product_pid`),
  KEY `fk_Smell_product1_idx` (`product_pid`),
  CONSTRAINT `fk_Smell_product1` FOREIGN KEY (`product_pid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Texture`
--

DROP TABLE IF EXISTS `Texture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Texture` (
  `textureId` int(11) NOT NULL,
  `currencyRange` int(11) DEFAULT NULL,
  `currencyFrequence` int(11) DEFAULT NULL,
  `TextureName` varchar(45) DEFAULT NULL,
  `rigidity` int(11) DEFAULT NULL,
  PRIMARY KEY (`textureId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Touching`
--

DROP TABLE IF EXISTS `Touching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Touching` (
  `touchingId` int(11) NOT NULL,
  `product_pid` int(11) DEFAULT NULL,
  `Shape_shapeId` int(11) DEFAULT NULL,
  `Texture_textureId` int(11) DEFAULT NULL,
  PRIMARY KEY (`touchingId`),
  KEY `fk_Touching_product1_idx` (`product_pid`),
  KEY `fk_Touching_Shape1_idx` (`Shape_shapeId`),
  KEY `fk_Touching_Texture1_idx` (`Texture_textureId`),
  CONSTRAINT `fk_Touching_Shape1` FOREIGN KEY (`Shape_shapeId`) REFERENCES `Shape` (`shapeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Touching_Texture1` FOREIGN KEY (`Texture_textureId`) REFERENCES `Texture` (`textureId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Touching_product1` FOREIGN KEY (`product_pid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `addressid` int(11) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `zipCode` varchar(45) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `receiver` varchar(45) NOT NULL,
  PRIMARY KEY (`addressid`),
  KEY `fk_address_user1_idx` (`uid`),
  CONSTRAINT `fk_address_user1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT '1',
  `checkout` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uid`,`pid`),
  KEY `pid_idx` (`pid`),
  CONSTRAINT `fk1_pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comid` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `product_pid` int(11) NOT NULL,
  `user_uid` int(11) NOT NULL,
  `pLevel` int(11) DEFAULT NULL,
  `sLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`comid`,`product_pid`,`user_uid`),
  KEY `fk_comment_product1_idx` (`product_pid`),
  KEY `fk_comment_user1_idx` (`user_uid`),
  CONSTRAINT `fk_comment_product1` FOREIGN KEY (`product_pid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dailysales`
--

DROP TABLE IF EXISTS `dailysales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dailysales` (
  `dailysalesId` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`dailysalesId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedbackid` int(11) NOT NULL AUTO_INCREMENT,
  `sLevel` int(11) NOT NULL,
  `user_uid` int(11) NOT NULL,
  PRIMARY KEY (`feedbackid`),
  KEY `user_uid_idx` (`user_uid`),
  CONSTRAINT `useruid` FOREIGN KEY (`user_uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `counts` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  PRIMARY KEY (`oid`,`pid`),
  KEY `FK_fesqehk2fei30hu4isqgmm36f` (`pid`),
  KEY `fk_orderitem_orders1_idx` (`oid`),
  CONSTRAINT `fk2-oip` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderitem_orders1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `ordertime` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `addressid` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_tk1pibf08nelmar48icf0w8jn` (`uid`),
  KEY `fk_orders_address1_idx` (`addressid`),
  CONSTRAINT `FK_tk1pibf08nelmar48icf0w8jn` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `fk_orders_address1` FOREIGN KEY (`addressid`) REFERENCES `address` (`addressid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_product_category1_idx` (`cid`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `authority` varchar(45) DEFAULT 'customer',
  `photoBytes` longblob,
  `photoContentType` varchar(255) DEFAULT NULL,
  `photoFilename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-08 17:39:27
