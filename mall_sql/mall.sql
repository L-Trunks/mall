/*
Navicat MySQL Data Transfer

Source Server         : Trunks
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-11-21 17:35:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `streets` varchar(255) NOT NULL,
  `village` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `achieve_name` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_address
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_info`;
CREATE TABLE `t_goods_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) NOT NULL,
  `goods_info` varchar(255) NOT NULL,
  `goods_img` varchar(255) DEFAULT NULL,
  `goods_bigimg` varchar(255) DEFAULT NULL,
  `price` decimal(18,2) NOT NULL,
  `now_price` decimal(18,2) NOT NULL,
  `user_id` int(10) NOT NULL,
  `sort_id` int(10) DEFAULT NULL,
  `sales_volume` int(10) DEFAULT NULL,
  `send_palce` varchar(255) NOT NULL,
  `shop_id` int(10) NOT NULL,
  `is_shop` int(2) NOT NULL DEFAULT '1',
  `shipping` decimal(18,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_goods_info
-- ----------------------------
INSERT INTO `t_goods_info` VALUES ('1', '女装 军旅式短茄克1', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574317562097.jpeg', 'http://localhost:3000/public/images/1574317562097.jpeg', '399.00', '234234.00', '9', '21', '233', '上海', '1', '0', '0.00');
INSERT INTO `t_goods_info` VALUES ('2', '女装 军旅式短茄克2', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326232032.jpeg', 'http://localhost:3000/public/images/1574326232032.jpeg', '399.00', '243.00', '9', '48', '243', '上海', '1', '0', '0.00');
INSERT INTO `t_goods_info` VALUES ('3', '女装 军旅式短茄克3', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326265934.jpeg', 'http://localhost:3000/public/images/1574326265934.jpeg', '399.00', '32.00', '9', '49', '32', '上海', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('4', '女装 军旅式短茄克4', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326279852.jpeg', 'http://localhost:3000/public/images/1574326279852.jpeg', '399.00', '235.00', '9', '50', '235', '上海', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('5', '女装 军旅式短茄克5', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326293085.jpeg', 'http://localhost:3000/public/images/1574326293085.jpeg', '399.00', '233.00', '9', '51', '233', '上海', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('6', '女装 军旅式短茄克6', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326314478.jpeg', 'http://localhost:3000/public/images/1574326314478.jpeg', '399.00', '122.00', '10', '52', '122', '上海', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('7', '女装 军旅式短茄克7', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326333927.jpeg', 'http://localhost:3000/public/images/1574326333927.jpeg', '399.00', '134.00', '10', '53', '134', '上海', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('8', '女装 军旅式短茄克8', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326344319.jpeg', 'http://localhost:3000/public/images/1574326344319.jpeg', '399.00', '134.00', '10', '54', '134', '上海', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('9', '女装 军旅式短茄克9', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326359209.jpeg', 'http://localhost:3000/public/images/1574326359209.jpeg', '399.00', '177.00', '10', '55', '177', '上海', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('10', '女装 军旅式短茄克10', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326372877.jpeg', 'http://localhost:3000/public/images/1574326372877.jpeg', '399.00', '177.00', '10', '56', '177', '上海', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('11', '女装 军旅式短茄克11', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326385954.jpeg', 'http://localhost:3000/public/images/1574326385954.jpeg', '399.00', '177.00', '10', '57', '177', '上海', '2', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('12', '女装 军旅式短茄克12', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326396188.jpeg', 'http://localhost:3000/public/images/1574326396188.jpeg', '399.00', '177.00', '11', '58', '177', '上海', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('13', '女装 军旅式短茄克13', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574317562097.jpeg', 'http://localhost:3000/public/images/1574317562097.jpeg', '200.00', '177.00', '11', '59', '177', '上海', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('14', '女装 军旅式短茄克14', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326232032.jpeg', 'http://localhost:3000/public/images/1574326232032.jpeg', '199.00', '177.00', '11', '60', '177', '上海', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('15', '女装 军旅式短茄克15', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326265934.jpeg', 'http://localhost:3000/public/images/1574326265934.jpeg', '222.00', '133.00', '11', '61', '133', '上海', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('16', '女装 军旅式短茄克16', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326279852.jpeg', 'http://localhost:3000/public/images/1574326279852.jpeg', '355.00', '211.00', '11', '62', '211', '上海', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('17', '女装 军旅式短茄克17', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326293085.jpeg', 'http://localhost:3000/public/images/1574326293085.jpeg', '123.00', '23.00', '11', '63', '23', '上海', '3', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('18', '女装 军旅式短茄克18', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326314478.jpeg', 'http://localhost:3000/public/images/1574326314478.jpeg', '35.00', '17.00', '9', '64', '17', '上海', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('19', '女装 军旅式短茄克19', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326333927.jpeg', 'http://localhost:3000/public/images/1574326333927.jpeg', '68.00', '23.00', '12', '65', '23', '上海', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('20', '马丁靴', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326344319.jpeg', 'http://localhost:3000/public/images/1574326344319.jpeg', '399.00', '177.00', '12', '66', '177', '上海', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('21', '女装 军旅式短茄克21', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326359209.jpeg', 'http://localhost:3000/public/images/1574326359209.jpeg', '399.00', '177.00', '12', '67', '177', '上海', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('22', '男装 军旅式短茄克22', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326372877.jpeg', 'http://localhost:3000/public/images/1574326372877.jpeg', '399.00', '177.00', '12', '68', '177', '上海', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('23', '男装 军旅式短茄克23', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326385954.jpeg', 'http://localhost:3000/public/images/1574326385954.jpeg', '233.00', '177.00', '12', '69', '177', '上海', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('24', '男装 军旅式短茄克24', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326396188.jpeg', 'http://localhost:3000/public/images/1574326396188.jpeg', '399.00', '177.00', '12', '70', '177', '上海', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('25', '男装 军旅式短茄克25', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574317562097.jpeg', 'http://localhost:3000/public/images/1574317562097.jpeg', '399.00', '177.00', '12', '71', '177', '上海', '4', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('26', '男装 军旅式短茄克26', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326232032.jpeg', 'http://localhost:3000/public/images/1574326232032.jpeg', '399.00', '177.00', '13', '72', '177', '上海', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('27', '男装 军旅式短茄克27', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326265934.jpeg', 'http://localhost:3000/public/images/1574326265934.jpeg', '399.00', '177.00', '13', '73', '177', '上海', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('28', '男装 军旅式短茄克28', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326279852.jpeg', 'http://localhost:3000/public/images/1574326279852.jpeg', '399.00', '177.00', '13', '74', '177', '上海', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('29', '男装 军旅式短茄克29', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326293085.jpeg', 'http://localhost:3000/public/images/1574326293085.jpeg', '399.00', '177.00', '13', '75', '177', '上海', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('30', '男装 军旅式短茄克30', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326314478.jpeg', 'http://localhost:3000/public/images/1574326314478.jpeg', '399.00', '177.00', '13', '21', '177', '上海', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('31', '男装 军旅式短茄克31', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326333927.jpeg', 'http://localhost:3000/public/images/1574326333927.jpeg', '399.00', '177.00', '13', '48', '177', '上海', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('32', '男装 军旅式短茄克32', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326344319.jpeg', 'http://localhost:3000/public/images/1574326344319.jpeg', '399.00', '177.00', '13', '49', '177', '上海', '5', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('33', '男装 军旅式短茄克33', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326359209.jpeg', 'http://localhost:3000/public/images/1574326359209.jpeg', '399.00', '177.00', '9', '50', '177', '上海', '1', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('34', '男装 军旅式短茄克34', '施有强水洗加工的军旅式外套。富有张力的面料，洋溢着十足的军旅气息。带盖口袋的金属圆形纽扣、兜帽口的锯齿形压线，彰显经典的军旅外套细节。大兜帽的样式，能适度修饰脸型。短款的设计，可与宽腿裤等宽松的下装搭配打造具有平衡感的造型。', 'http://localhost:3000/public/images/1574326372877.jpeg', 'http://localhost:3000/public/images/1574326372877.jpeg', '399.00', '177.00', '14', '51', '177', '上海', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('35', '榛子', '美味可口', 'http://localhost:3000/public/images/1574326385954.jpeg', 'http://localhost:3000/public/images/1574326385954.jpeg', '50.00', '177.00', '14', '52', '177', '上海', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('36', '女士内衣 新型收拢运动内衣', '纯棉超聚拢运动内衣，轻便贴身，显曲线，吸汗，穿着舒适', 'http://localhost:3000/public/images/1574326396188.jpeg', 'http://localhost:3000/public/images/1574326396188.jpeg', '123.00', '100.00', '14', '53', '100', '北京', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('37', '开口松子', '测试', 'http://localhost:3000/public/images/1574317562097.jpeg', 'http://localhost:3000/public/images/1574317562097.jpeg', '33.00', '222.00', '14', '54', '222', '测试', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('38', '松子', '囤货过冬', 'http://localhost:3000/public/images/1574326232032.jpeg', 'http://localhost:3000/public/images/1574326232032.jpeg', '30.00', '100.00', '14', '55', '100', '北京', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('39', '坚果2', '好吃！！', 'http://localhost:3000/public/images/1574326265934.jpeg', 'http://localhost:3000/public/images/1574326265934.jpeg', '30.00', '233.00', '14', '57', '233', '北京', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('40', '坚果3', '非常好吃', 'http://localhost:3000/public/images/1574326279852.jpeg', 'http://localhost:3000/public/images/1574326279852.jpeg', '99.00', '1000.00', '14', '58', '1000', '北京', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('41', '坚果1', '好吃', 'http://localhost:3000/public/images/1574326293085.jpeg', 'http://localhost:3000/public/images/1574326293085.jpeg', '45.00', '234.00', '14', '56', '234', '北京', '6', '1', '0.00');
INSERT INTO `t_goods_info` VALUES ('42', 'fgeewrwq', 'rwqerqwerwqerwqerwqertrwetqrwerwqrwe', 'http://localhost:3000/public/images/1574326314478.jpeg', 'http://localhost:3000/public/images/1574326314478.jpeg', '113.00', '113.00', '9', null, null, '213', '1', '1', '21.00');
INSERT INTO `t_goods_info` VALUES ('43', '1231', '1231', 'http://localhost:3000/public/images/1574326333927.jpeg', 'http://localhost:3000/public/images/1574326333927.jpeg', '1231.00', '1231.00', '9', '54', null, '123', '1', '1', '13.00');
INSERT INTO `t_goods_info` VALUES ('44', '123', '123', 'http://localhost:3000/public/images/1574326344319.jpeg', 'http://localhost:3000/public/images/1574326344319.jpeg', '12313124.00', '12313124.00', '9', '53', null, '412412', '1', '1', '1313.00');
INSERT INTO `t_goods_info` VALUES ('45', 'asadasdasd', 'asdasdqwdwer', 'http://localhost:3000/public/images/1574326359209.jpeg', 'http://localhost:3000/public/images/1574326359209.jpeg', '123.00', '123.00', '9', '54', null, '12131', '1', '1', '123.00');
INSERT INTO `t_goods_info` VALUES ('46', 'eqe', 'qweq', 'http://localhost:3000/public/images/1574326372877.jpeg', 'http://localhost:3000/public/images/1574326372877.jpeg', '123.00', '123.00', '9', '54', null, '21', '1', '1', '12.00');
INSERT INTO `t_goods_info` VALUES ('47', '123', '123', 'http://localhost:3000/public/images/1574326265934.jpeg', 'http://localhost:3000/public/images/1574326265934.jpeg', '1231.00', '1231.00', '9', '54', null, '123', '1', '1', '13.00');
INSERT INTO `t_goods_info` VALUES ('48', '123', '1231', 'http://localhost:3000/public/images/1574326279852.jpeg', 'http://localhost:3000/public/images/1574326279852.jpeg', '123.00', '123.00', '9', '59', null, '123', '1', '1', '13.00');
INSERT INTO `t_goods_info` VALUES ('49', '123', '123', 'http://localhost:3000/public/images/1574326293085.jpeg', 'http://localhost:3000/public/images/1574326293085.jpeg', '123.00', '123.00', '9', '58', null, '412', '1', '1', '412.00');
INSERT INTO `t_goods_info` VALUES ('50', '234', '2134', 'http://localhost:3000/public/images/1574326314478.jpeg', 'http://localhost:3000/public/images/1574326314478.jpeg', '1234.00', '1234.00', '9', '54', null, '2134', '1', '1', '14.00');
INSERT INTO `t_goods_info` VALUES ('51', '1234', '123', 'http://localhost:3000/public/images/1574326333927.jpeg', 'http://localhost:3000/public/images/1574326333927.jpeg', '456.00', '456.00', '9', '58', null, '45', '1', '1', '456.00');
INSERT INTO `t_goods_info` VALUES ('52', '456', '456', 'http://localhost:3000/public/images/1574326344319.jpeg', 'http://localhost:3000/public/images/1574326344319.jpeg', '456.00', '456.00', '9', '54', null, '456', '1', '1', '456.00');
INSERT INTO `t_goods_info` VALUES ('53', '456', '456', 'http://localhost:3000/public/images/1574326359209.jpeg', 'http://localhost:3000/public/images/1574326359209.jpeg', '456.00', '456.00', '9', '54', null, '456', '1', '1', '456.00');
INSERT INTO `t_goods_info` VALUES ('54', '456', '456', 'http://localhost:3000/public/images/1574326372877.jpeg', 'http://localhost:3000/public/images/1574326372877.jpeg', '456.00', '456.00', '9', '53', null, '456', '1', '1', '456.00');
INSERT INTO `t_goods_info` VALUES ('55', '456', '45656', 'http://localhost:3000/public/images/1574326385954.jpeg', 'http://localhost:3000/public/images/1574326385954.jpeg', '7567.00', '7567.00', '9', '55', null, '567', '1', '1', '567.00');
INSERT INTO `t_goods_info` VALUES ('56', '567', '567', 'http://localhost:3000/public/images/1574326396188.jpeg', 'http://localhost:3000/public/images/1574326396188.jpeg', '567.00', '567.00', '9', '54', null, '345', '1', '1', '345.00');
INSERT INTO `t_goods_info` VALUES ('57', '这是测试', '23423424', 'http://localhost:3000/public/images/1574328725445.jpeg', 'http://localhost:3000/public/images/1574328725445.jpeg', '23423.00', '23423.00', '9', '59', null, '234234', '1', '1', '234242.00');

-- ----------------------------
-- Table structure for t_order_info
-- ----------------------------
DROP TABLE IF EXISTS `t_order_info`;
CREATE TABLE `t_order_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_number` bigint(50) NOT NULL,
  `send_place` varchar(255) NOT NULL,
  `achieve_place` varchar(255) NOT NULL,
  `send_id` int(10) NOT NULL,
  `achieve_id` int(10) NOT NULL,
  `price_total` decimal(18,2) NOT NULL,
  `goods_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_order_info
-- ----------------------------
INSERT INTO `t_order_info` VALUES ('1', '1574259207694', '上海', 'hhhhhhhhhhhhhhh', '9', '9', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('2', '1574315711787', '412412', '123123124', '9', '9', '12313124.00', '44');
INSERT INTO `t_order_info` VALUES ('3', '1574316599095', '上海', '1231', '9', '9', '478.00', '2');
INSERT INTO `t_order_info` VALUES ('4', '1574316599099', '上海', '1231', '9', '9', '478.00', '4');
INSERT INTO `t_order_info` VALUES ('5', '1574316599099', '上海', '1231', '9', '9', '478.00', '4');
INSERT INTO `t_order_info` VALUES ('6', '1574316623540', '上海', '', '9', '9', '235.00', '4');
INSERT INTO `t_order_info` VALUES ('7', '1574316623543', '上海', '', '9', '9', '235.00', '4');
INSERT INTO `t_order_info` VALUES ('8', '1574316694884', '上海', '', '9', '9', '478.00', '2');
INSERT INTO `t_order_info` VALUES ('9', '1574316694888', '上海', '', '9', '9', '478.00', '4');
INSERT INTO `t_order_info` VALUES ('10', '1574316694889', '上海', '', '9', '9', '478.00', '4');
INSERT INTO `t_order_info` VALUES ('11', '1574317118837', '上海', '1231', '9', '9', '267.00', '4');
INSERT INTO `t_order_info` VALUES ('12', '1574317118841', '上海', '1231', '9', '9', '267.00', '3');
INSERT INTO `t_order_info` VALUES ('13', '1574317173273', '上海', 'qweq', '9', '9', '478.00', '2');
INSERT INTO `t_order_info` VALUES ('14', '1574317173275', '上海', 'qweq', '9', '9', '478.00', '4');
INSERT INTO `t_order_info` VALUES ('15', '1574317723038', '412412', '', '9', '9', '12313367.00', '2');
INSERT INTO `t_order_info` VALUES ('16', '1574317723041', '412412', '', '9', '9', '12313367.00', '44');
INSERT INTO `t_order_info` VALUES ('17', '1574317747662', '上海', 'wrwe', '9', '9', '12313367.00', '44');
INSERT INTO `t_order_info` VALUES ('18', '1574317747667', '上海', 'wrwe', '9', '9', '12313367.00', '2');
INSERT INTO `t_order_info` VALUES ('19', '1574317784931', '上海', '', '9', '9', '12313367.00', '44');
INSERT INTO `t_order_info` VALUES ('20', '1574317784932', '上海', '', '9', '9', '12313367.00', '2');
INSERT INTO `t_order_info` VALUES ('21', '1574319028085', '12131', '11', '9', '9', '12313490.00', '2');
INSERT INTO `t_order_info` VALUES ('22', '1574319028090', '12131', '11', '9', '9', '12313490.00', '44');
INSERT INTO `t_order_info` VALUES ('23', '1574319028096', '12131', '11', '9', '9', '12313490.00', '45');
INSERT INTO `t_order_info` VALUES ('24', '1574319165917', '上海', '232', '9', '9', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('25', '1574319745850', '12131', '321', '9', '9', '123.00', '45');
INSERT INTO `t_order_info` VALUES ('26', '1574327715915', '上海', 'sdsdg', '11', '16', '211.00', '16');
INSERT INTO `t_order_info` VALUES ('27', '1574327745669', '上海', 'werwrwerw', '9', '16', '243.00', '2');
INSERT INTO `t_order_info` VALUES ('28', '1574328590817', '上海', 'hio', '9', '17', '470.00', '4');
INSERT INTO `t_order_info` VALUES ('29', '1574328590825', '上海', 'hio', '9', '17', '470.00', '4');
INSERT INTO `t_order_info` VALUES ('30', '1574328597747', '上海', 'joil', '9', '17', '235.00', '4');

-- ----------------------------
-- Table structure for t_shop_info
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_info`;
CREATE TABLE `t_shop_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) NOT NULL,
  `shop_introduce` varchar(255) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `shop_state` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_shop_info
-- ----------------------------
INSERT INTO `t_shop_info` VALUES ('1', '111的店铺', '暂无', '9', '2');
INSERT INTO `t_shop_info` VALUES ('2', '122312的店铺', '暂无', '10', '2');
INSERT INTO `t_shop_info` VALUES ('3', '333的店铺', '暂无', '11', '2');
INSERT INTO `t_shop_info` VALUES ('4', '444的店铺', '暂无', '12', '2');
INSERT INTO `t_shop_info` VALUES ('5', '444的店铺', '暂无', '13', '2');
INSERT INTO `t_shop_info` VALUES ('6', '666的店铺', '暂无', '14', '2');
INSERT INTO `t_shop_info` VALUES ('7', '777的店铺', '暂无', '15', '2');
INSERT INTO `t_shop_info` VALUES ('8', '888的店铺', '暂无', '16', '2');
INSERT INTO `t_shop_info` VALUES ('9', '999的店铺', '暂无', '17', '2');

-- ----------------------------
-- Table structure for t_shoppingcart_info
-- ----------------------------
DROP TABLE IF EXISTS `t_shoppingcart_info`;
CREATE TABLE `t_shoppingcart_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `count` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_shoppingcart_info
-- ----------------------------
INSERT INTO `t_shoppingcart_info` VALUES ('1', '9', '2', '1');
INSERT INTO `t_shoppingcart_info` VALUES ('5', '9', '44', '1');
INSERT INTO `t_shoppingcart_info` VALUES ('6', '9', '45', '1');
INSERT INTO `t_shoppingcart_info` VALUES ('7', '16', '16', '1');
INSERT INTO `t_shoppingcart_info` VALUES ('8', '17', '4', '1');
INSERT INTO `t_shoppingcart_info` VALUES ('9', '17', '4', '1');

-- ----------------------------
-- Table structure for t_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_sort`;
CREATE TABLE `t_sort` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sort_name` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `is_have_child` int(2) DEFAULT '0',
  `parents_id` int(10) DEFAULT NULL,
  `level` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_sort
-- ----------------------------
INSERT INTO `t_sort` VALUES ('21', '国产水果', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('48', '优选蔬菜', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('49', '粮油副食', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('50', '肉禽蛋奶', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('51', '休闲食品', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('52', '各类套餐', '9', '0', '0', '0');
INSERT INTO `t_sort` VALUES ('53', '石榴', '9', '0', '21', '1');
INSERT INTO `t_sort` VALUES ('54', '柑橘', '9', '0', '21', '1');
INSERT INTO `t_sort` VALUES ('55', '梨类', '9', '0', '21', '1');
INSERT INTO `t_sort` VALUES ('56', '猕猴桃', '9', '0', '21', '1');
INSERT INTO `t_sort` VALUES ('57', '豆角类', '9', '0', '48', '1');
INSERT INTO `t_sort` VALUES ('58', '叶菜类', '9', '0', '48', '1');
INSERT INTO `t_sort` VALUES ('59', '瓜类', '9', '0', '48', '1');
INSERT INTO `t_sort` VALUES ('60', '菌菇类', '9', '0', '48', '1');
INSERT INTO `t_sort` VALUES ('61', '杂粮', '9', '0', '49', '1');
INSERT INTO `t_sort` VALUES ('62', '大米', '9', '0', '49', '1');
INSERT INTO `t_sort` VALUES ('63', '花生油', '9', '0', '49', '1');
INSERT INTO `t_sort` VALUES ('64', '干菜', '9', '0', '49', '1');
INSERT INTO `t_sort` VALUES ('65', '家禽', '9', '0', '50', '1');
INSERT INTO `t_sort` VALUES ('66', '猪肉', '9', '0', '50', '1');
INSERT INTO `t_sort` VALUES ('67', '蛋类', '9', '0', '50', '1');
INSERT INTO `t_sort` VALUES ('68', '牛肉', '9', '0', '50', '1');
INSERT INTO `t_sort` VALUES ('69', '零食', '9', '0', '51', '1');
INSERT INTO `t_sort` VALUES ('70', '肉干', '9', '0', '51', '1');
INSERT INTO `t_sort` VALUES ('71', '月饼', '9', '0', '51', '1');
INSERT INTO `t_sort` VALUES ('72', '坚果', '9', '0', '51', '1');
INSERT INTO `t_sort` VALUES ('73', '蔬菜礼盒', '9', '0', '52', '1');
INSERT INTO `t_sort` VALUES ('74', '节日礼盒', '9', '0', '52', '1');
INSERT INTO `t_sort` VALUES ('75', '水果组合', '9', '0', '52', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `permission` int(2) NOT NULL DEFAULT '0',
  `fans_count` int(10) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('9', '111', '111', '111', '2', null, '11111111111', '111');
INSERT INTO `t_user` VALUES ('10', '122312', '123', '123', '0', null, '22222222222', '123');
INSERT INTO `t_user` VALUES ('11', '333', '333', '333', '0', null, '33333333333', '333');
INSERT INTO `t_user` VALUES ('12', '444', '444', '444', '0', null, '44444444444', '444');
INSERT INTO `t_user` VALUES ('13', '444', '444', '44444', '0', null, '55555555555', '4444');
INSERT INTO `t_user` VALUES ('14', '666', '666', '666', '4', null, '66666666666', '666');
INSERT INTO `t_user` VALUES ('15', '777', '777', '77fgh', '4', null, '77777777777', '7777');
INSERT INTO `t_user` VALUES ('16', '888', '888', 'fdfhfgh', '0', null, '88888888888', '88888');
INSERT INTO `t_user` VALUES ('17', '999', '999', '4546456', '0', null, '99999999999', '9999999');
