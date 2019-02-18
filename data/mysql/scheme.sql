/*
 Navicat Premium Data Transfer

 Source Server         : 10.1.11.167
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : 10.1.11.167:3306
 Source Schema         : huntcms

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : 65001

 Date: 26/09/2018 16:31:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hc_article_article
-- ----------------------------
DROP TABLE IF EXISTS `hc_article_article`;
CREATE TABLE `hc_article_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  `updated` int(11) NULL DEFAULT NULL,
  `status` tinyint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_category`(`categories_id`) USING BTREE,
  CONSTRAINT `hc_article_article_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `hc_article_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_article_article
-- ----------------------------

-- ----------------------------
-- Table structure for hc_article_category
-- ----------------------------
DROP TABLE IF EXISTS `hc_article_category`;
CREATE TABLE `hc_article_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NULL DEFAULT NULL COMMENT '关联的商品类别',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` smallint(6) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  `updated` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_portal_banner
-- ----------------------------
DROP TABLE IF EXISTS `hc_portal_banner`;
CREATE TABLE `hc_portal_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `picurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 0,
  `deleted` int(11) NULL DEFAULT NULL,
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'banner管理' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_portal_menu
-- ----------------------------
DROP TABLE IF EXISTS `hc_portal_menu`;
CREATE TABLE `hc_portal_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `link_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_action` int(255) NULL DEFAULT NULL,
  `mca` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  `updated` int(11) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_shop_brand
-- ----------------------------
DROP TABLE IF EXISTS `hc_shop_brand`;
CREATE TABLE `hc_shop_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌介绍',
  `picurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌图片',
  `status` tinyint(2) NULL DEFAULT 0,
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hc_shop_product
-- ----------------------------
DROP TABLE IF EXISTS `hc_shop_product`;
CREATE TABLE `hc_shop_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称标题',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品介绍',
  `brand_id` int(11) NULL DEFAULT NULL COMMENT '关联品牌id',
  `min_price` int(11) NULL DEFAULT NULL COMMENT '商品sku最低价格（分）',
  `max_price` int(11) NULL DEFAULT NULL COMMENT '商品sku最高价格（分）',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品详情',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '1上架0下架',
  `pc_picurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'pc主图地址',
  `app_picurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'app主图地址',
  `wap_picurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'wap主图地址',
  `videourl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品视频展示地址',
  `picurls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品详情展示图json（多个）',
  `sort` int(11) NULL DEFAULT 0,
  `deleted` int(11) NULL DEFAULT 0,
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_shop_product_category
-- ----------------------------
DROP TABLE IF EXISTS `hc_shop_product_category`;
CREATE TABLE `hc_shop_product_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `introduction` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `picurl` varchar(521) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` smallint(6) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT 0,
  `level` tinyint(2) NULL DEFAULT 1,
  `type_id` int(11) NULL DEFAULT NULL COMMENT '关联商品类别表',
  `deleted` int(11) NULL DEFAULT 0,
  `created` int(11) NULL DEFAULT NULL,
  `updated` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_shop_product_relation_property
-- ----------------------------
DROP TABLE IF EXISTS `hc_shop_product_relation_property`;
CREATE TABLE `hc_shop_product_relation_property`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `property_id` int(11) NULL DEFAULT NULL,
  `property_option_id` int(11) NULL DEFAULT 0 COMMENT '选择的商品属性选项id',
  `property_input` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输入的商品属性值',
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品关联属性表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_shop_product_type
-- ----------------------------
DROP TABLE IF EXISTS `hc_shop_product_type`;
CREATE TABLE `hc_shop_product_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类别' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_shop_property
-- ----------------------------
DROP TABLE IF EXISTS `hc_shop_property`;
CREATE TABLE `hc_shop_property`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `introduce` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT 0,
  `option_type` tinyint(2) NULL DEFAULT 0 COMMENT '属性值类型0输入1单选2多选',
  `is_require` tinyint(1) NULL DEFAULT 0 COMMENT '是否必填',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性的特殊判断标识',
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性表(最多2层分级)' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_shop_property_filter
-- ----------------------------
DROP TABLE IF EXISTS `hc_shop_property_filter`;
CREATE TABLE `hc_shop_property_filter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示的文字',
  `property_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '配置的筛选值json列表[{\"id\":1,\"title\":\"百变布鲁可系列\"}]',
  `sort` int(11) NULL DEFAULT 0,
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类别对应的属性筛选配置表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_shop_property_option
-- ----------------------------
DROP TABLE IF EXISTS `hc_shop_property_option`;
CREATE TABLE `hc_shop_property_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 0,
  `status` tinyint(2) NULL DEFAULT 0,
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性值关联属性表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_shop_type_relation_property
-- ----------------------------
DROP TABLE IF EXISTS `hc_shop_type_relation_property`;
CREATE TABLE `hc_shop_type_relation_property`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类别表id',
  `property_id` int(11) NULL DEFAULT NULL COMMENT '商品属性表id',
  `sort` int(11) NULL DEFAULT 0,
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类别关联商品属性表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_system_file_info
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_file_info`;
CREATE TABLE `hc_system_file_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `filename` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `rename` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `sha1` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `size` bigint(20) NULL DEFAULT 0,
  `created` int(11) NULL DEFAULT 0,
  `updated` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_system_log_info
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_log_info`;
CREATE TABLE `hc_system_log_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `action` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `params` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_menu`;
CREATE TABLE `hc_system_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_action` tinyint(1) NULL DEFAULT 0,
  `mca` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 0,
  `created` int(11) NOT NULL DEFAULT 0,
  `updated` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hc_system_menu
-- ----------------------------
INSERT INTO `hc_system_menu` VALUES (1, 0, 'Portal', '', 0, '', '', 5, 1530015141, 1536635587, 1);
INSERT INTO `hc_system_menu` VALUES (2, 0, 'Article', 'ti-widget', 0, '', '', 1, 1530015141, 1530068152, 1);
INSERT INTO `hc_system_menu` VALUES (3, 0, 'System', 'ti-panel', 0, NULL, '#', 2, 0, 0, 1);
INSERT INTO `hc_system_menu` VALUES (4, 2, 'Articles', '', 1, 'article.article.list', '/article/articles', 1, 0, 1530157016, 1);
INSERT INTO `hc_system_menu` VALUES (5, 2, 'Categories', '', 1, 'article.category.list', '/article/categories', 0, 1530156969, 1530156969, 1);
INSERT INTO `hc_system_menu` VALUES (6, 3, 'Menus', NULL, 1, 'system.menu.list', '/system/menus', 0, 1530156969, 1530156969, 1);
INSERT INTO `hc_system_menu` VALUES (7, 3, 'Permissions', NULL, 1, 'system.permission.list', '/system/permissions', 0, 1530156969, 1530156969, 1);
INSERT INTO `hc_system_menu` VALUES (8, 3, 'Users', NULL, 1, 'system.user.list', '/system/users', 0, 1530156969, 1530156969, 1);
INSERT INTO `hc_system_menu` VALUES (9, 3, 'Role', '', 1, 'system.role.list', '/system/roles', 0, 1530190052, 1530190052, 1);
INSERT INTO `hc_system_menu` VALUES (10, 0, 'Tag', '', 1, 'tag.tag.list', '/tag/tag/list', 6, 1536491406, 1536655546, 1);
INSERT INTO `hc_system_menu` VALUES (11, 1, 'Banners', '', 1, 'portal.banner.list', '/portal/banners', 6, 1536491500, 1536650173, 1);
INSERT INTO `hc_system_menu` VALUES (12, 1, 'Menus', '', 1, 'portal.menu.list', '/portal/menu/list', 0, 1536491541, 1536650161, 1);
INSERT INTO `hc_system_menu` VALUES (13, 10, 'Tags', '', 1, 'tag.tag.list', '/tag/tag/list', 1, 1536656572, 1536656572, 1);
INSERT INTO `hc_system_menu` VALUES (14, 0, 'Shop', '', 0, NULL, '#', 0, 1536657181, 1536657357, 1);
INSERT INTO `hc_system_menu` VALUES (15, 14, 'Product', '', 1, 'shop.product.list', '/shop/products', 0, 1536657288, 1536657677, 1);
INSERT INTO `hc_system_menu` VALUES (16, 14, 'ProductCategory', '', 1, 'shop.productcategory.list', '/shop/productcategorys', 2, 1536817673, 1536817708, 1);
INSERT INTO `hc_system_menu` VALUES (19, 14, 'Type', '', 1, 'shop.type.list', '/shop/types', 0, 1536922355, 1536922355, 1);
INSERT INTO `hc_system_menu` VALUES (21, 14, 'Properties', '', 1, 'shop.property.list', '/shop/properties', 0, 1536922417, 1536922417, 1);
INSERT INTO `hc_system_menu` VALUES (22, 14, 'PropertyOptions', '', 1, 'shop.propertyoption.list', '/shop/propertyoptions', 0, 1536922477, 1536922477, 1);
INSERT INTO `hc_system_menu` VALUES (23, 14, 'Typeproperties', '', 1, 'shop.typerelationproperty.list', '/shop/typeproperties', 0, 1536922561, 1536922561, 1);
INSERT INTO `hc_system_menu` VALUES (24, 14, 'Typefilter', '', 1, 'shop.typefilter.list', '/shop/typefilters', 0, 1536922592, 1536922592, 1);

-- ----------------------------
-- Table structure for hc_system_permission
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_permission`;
CREATE TABLE `hc_system_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mca` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_action` tinyint(1) NOT NULL DEFAULT 0,
  `created` int(11) NOT NULL DEFAULT 0,
  `updated` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hc_system_permission
-- ----------------------------
INSERT INTO `hc_system_permission` VALUES (1, 'article.article.add', 'add article', 0, 0, 1530255142, 1);
INSERT INTO `hc_system_permission` VALUES (2, 'article.article.del', '删除 文章', 0, 0, 1530255338, 1);
INSERT INTO `hc_system_permission` VALUES (3, 'article.article.edit', '编辑文章', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (4, 'article.article.list', '文章列表', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (5, 'article.category.add', '添加分类', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (6, 'article.category.del', '删除分类', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (7, 'article.category.edit', '编辑分类', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (8, 'article.category.list', '分类列表', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (9, 'portal.banner.add', '横幅添加', 1, 1536650329, 1536650329, 1);
INSERT INTO `hc_system_permission` VALUES (10, 'portal.banner.del', '删除横幅', 1, 1536659784, 1536659784, 1);
INSERT INTO `hc_system_permission` VALUES (11, 'portal.banner.edit', '横幅编辑', 1, 1536650344, 1536650344, 1);
INSERT INTO `hc_system_permission` VALUES (12, 'portal.banner.list', '横幅列表', 1, 1536650315, 1536650315, 1);
INSERT INTO `hc_system_permission` VALUES (13, 'portal.menu.add', '前端菜单添加', 1, 1536650075, 1536650075, 1);
INSERT INTO `hc_system_permission` VALUES (14, 'portal.menu.del', '删除前端菜单', 1, 1536659756, 1536659756, 1);
INSERT INTO `hc_system_permission` VALUES (15, 'portal.menu.edit', '前端菜单编辑', 1, 1536650449, 1536650449, 1);
INSERT INTO `hc_system_permission` VALUES (16, 'portal.menu.list', '前端菜单列表', 1, 1536650042, 1536650042, 1);
INSERT INTO `hc_system_permission` VALUES (17, 'shop.product.add', '添加商城商品', 1, 1536743441, 1536743441, 1);
INSERT INTO `hc_system_permission` VALUES (18, 'shop.product.del', '删除商城商品', 1, 1536805177, 1536805177, 1);
INSERT INTO `hc_system_permission` VALUES (19, 'shop.product.edit', '修改商城商品', 1, 1536743457, 1536743457, 1);
INSERT INTO `hc_system_permission` VALUES (20, 'shop.product.list', '产品列表', 0, 1536657609, 1536657609, 1);
INSERT INTO `hc_system_permission` VALUES (21, 'shop.productcategory.add', '添加商品分类', 1, 1536821766, 1536821766, 1);
INSERT INTO `hc_system_permission` VALUES (22, 'shop.productcategory.del', '删除商品分类', 1, 1536821822, 1536821822, 1);
INSERT INTO `hc_system_permission` VALUES (23, 'shop.productcategory.edit', '修改商品分类', 1, 1536821808, 1536821808, 1);
INSERT INTO `hc_system_permission` VALUES (24, 'shop.productcategory.list', '商城商品分类', 1, 1536817758, 1536817758, 1);
INSERT INTO `hc_system_permission` VALUES (25, 'system.file.upload', '文件上传', 1, 1536806083, 1536806083, 1);
INSERT INTO `hc_system_permission` VALUES (26, 'system.log.del', '删除日志', 1, 1530168791, 1530168791, 1);
INSERT INTO `hc_system_permission` VALUES (27, 'system.log.list', '查看历史', 1, 1530168711, 1530168711, 1);
INSERT INTO `hc_system_permission` VALUES (28, 'system.menu.add', '添加菜单', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (29, 'system.menu.del', '删除菜单', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (30, 'system.menu.edit', '编辑菜单', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (31, 'system.menu.list', '菜单列表', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (32, 'system.permission.add', '添加权限', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (33, 'system.permission.del', '删除权限', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (34, 'system.permission.edit', '编辑权限', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (35, 'system.permission.list', '权限列表', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (36, 'system.role.add', '添加角色', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (37, 'system.role.del', '删除角色', 0, 0, 1530239428, 1);
INSERT INTO `hc_system_permission` VALUES (38, 'system.role.edit', '编辑角色', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (39, 'system.role.list', '角色列表', 0, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (40, 'system.user.add', '添加用户', 1, 1530081865, 1530081865, 1);
INSERT INTO `hc_system_permission` VALUES (41, 'system.user.del', '删除用户', 0, 1530081889, 1530081889, 1);
INSERT INTO `hc_system_permission` VALUES (42, 'system.user.edit', '编辑用户', 1, 1530069250, 1530069250, 1);
INSERT INTO `hc_system_permission` VALUES (43, 'system.user.list', '用户列表', 0, 1530065709, 1530065836, 1);
INSERT INTO `hc_system_permission` VALUES (44, 'system.user.profile', '个人信息', 1, 1530186832, 1530186832, 1);
INSERT INTO `hc_system_permission` VALUES (45, 'tag.tag.add', '标签添加', 1, 1536650375, 1536650375, 1);
INSERT INTO `hc_system_permission` VALUES (46, 'tag.tag.del', '删除标签', 1, 1536659800, 1536659800, 1);
INSERT INTO `hc_system_permission` VALUES (47, 'tag.tag.edit', '标签编辑', 1, 1536650392, 1536650392, 1);
INSERT INTO `hc_system_permission` VALUES (48, 'tag.tag.list', '标签列表', 1, 0, 0, 1);
INSERT INTO `hc_system_permission` VALUES (53, 'shop.type.add', '添加商品分类类别', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (54, 'shop.type.edit', '修改商品分类类别', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (55, 'shop.type.del', '删除商品分类类别', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (56, 'shop.property.list', '商品分类类别列表', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (57, 'shop.property.list', '商品属性列表', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (58, 'shop.property.add', '添加商品属性配置', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (59, 'shop.property.edit', '修改商品属性配置', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (60, 'shop.property.del', '删除商品属性配置', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (61, 'shop.propertyoption.list', '商品属性值列表', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (62, 'shop.propertyoption.add', '添加商品属性值', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (63, 'shop.propertyoption.edit', '修改商品属性值', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (64, 'shop.propertyoption.del', '删除商品属性值', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (65, 'shop.typerelationproperty.list', '类别关联属性列表', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (66, 'shop.typerelationproperty.add', '添加类别关联属性', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (67, 'shop.typerelationproperty.edit', '修改类别关联属性', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (68, 'shop.typerelationproperty.del', '删除类别关联属性', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (69, 'shop.typerelationproperty.listByType', '类别关联属性查询接口', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (70, 'shop.typefilter.list', '筛选器配置列表', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (71, 'shop.typefilter.add', '添加筛选器配置', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (72, 'shop.typefilter.edit', '修改筛选器配置', 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (73, 'shop.typefilter.del', '删除筛选器配置', 1, 1536920328, 1536920328, 1);

-- ----------------------------
-- Table structure for hc_system_role
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_role`;
CREATE TABLE `hc_system_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT 0,
  `updated` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hc_system_role
-- ----------------------------
INSERT INTO `hc_system_role` VALUES (1, 'test1', 0, 0, 1);
INSERT INTO `hc_system_role` VALUES (2, 'test2', 0, 0, 0);
INSERT INTO `hc_system_role` VALUES (3, 'Editor', 0, 0, 1);
INSERT INTO `hc_system_role` VALUES (4, 'test3', 1530191402, 1530191402, 1);
INSERT INTO `hc_system_role` VALUES (5, 'test4', 1530251695, 1530251695, 1);

-- ----------------------------
-- Table structure for hc_system_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_role_permission`;
CREATE TABLE `hc_system_role_permission`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NULL DEFAULT NULL,
  `permission_mca` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 289 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_role_permission
-- ----------------------------
INSERT INTO `hc_system_role_permission` VALUES (8, 4, 1, 'article.article.add');
INSERT INTO `hc_system_role_permission` VALUES (9, 4, 2, 'article.article.del');
INSERT INTO `hc_system_role_permission` VALUES (10, 4, 41, 'system.user.del');
INSERT INTO `hc_system_role_permission` VALUES (11, 4, 42, 'system.menu.edit');
INSERT INTO `hc_system_role_permission` VALUES (12, 4, 29, 'system.menu.del');
INSERT INTO `hc_system_role_permission` VALUES (13, 4, 42, 'system.user.edit');
INSERT INTO `hc_system_role_permission` VALUES (14, 5, 1, 'article.article.add');
INSERT INTO `hc_system_role_permission` VALUES (15, 5, 28, 'system.menu.add');
INSERT INTO `hc_system_role_permission` VALUES (16, 5, 40, 'system.user.add');
INSERT INTO `hc_system_role_permission` VALUES (20, 1, 1, 'article.article.add');
INSERT INTO `hc_system_role_permission` VALUES (21, 1, 28, 'system.menu.add');
INSERT INTO `hc_system_role_permission` VALUES (239, 3, 73, '');
INSERT INTO `hc_system_role_permission` VALUES (240, 3, 58, '');
INSERT INTO `hc_system_role_permission` VALUES (241, 3, 53, '');
INSERT INTO `hc_system_role_permission` VALUES (242, 3, 3, '');
INSERT INTO `hc_system_role_permission` VALUES (243, 3, 65, '');
INSERT INTO `hc_system_role_permission` VALUES (244, 3, 21, '');
INSERT INTO `hc_system_role_permission` VALUES (245, 3, 60, '');
INSERT INTO `hc_system_role_permission` VALUES (246, 3, 70, '');
INSERT INTO `hc_system_role_permission` VALUES (247, 3, 24, '');
INSERT INTO `hc_system_role_permission` VALUES (248, 3, 66, '');
INSERT INTO `hc_system_role_permission` VALUES (249, 3, 10, '');
INSERT INTO `hc_system_role_permission` VALUES (250, 3, 11, '');
INSERT INTO `hc_system_role_permission` VALUES (251, 3, 71, '');
INSERT INTO `hc_system_role_permission` VALUES (252, 3, 63, '');
INSERT INTO `hc_system_role_permission` VALUES (253, 3, 59, '');
INSERT INTO `hc_system_role_permission` VALUES (254, 3, 43, '');
INSERT INTO `hc_system_role_permission` VALUES (255, 3, 56, '');
INSERT INTO `hc_system_role_permission` VALUES (258, 3, 64, '');
INSERT INTO `hc_system_role_permission` VALUES (259, 3, 12, '');
INSERT INTO `hc_system_role_permission` VALUES (260, 3, 16, '');
INSERT INTO `hc_system_role_permission` VALUES (262, 3, 9, '');
INSERT INTO `hc_system_role_permission` VALUES (263, 3, 48, '');
INSERT INTO `hc_system_role_permission` VALUES (264, 3, 67, '');
INSERT INTO `hc_system_role_permission` VALUES (265, 3, 14, '');
INSERT INTO `hc_system_role_permission` VALUES (266, 3, 45, '');
INSERT INTO `hc_system_role_permission` VALUES (267, 3, 54, '');
INSERT INTO `hc_system_role_permission` VALUES (268, 3, 62, '');
INSERT INTO `hc_system_role_permission` VALUES (269, 3, 18, '');
INSERT INTO `hc_system_role_permission` VALUES (270, 3, 19, '');
INSERT INTO `hc_system_role_permission` VALUES (271, 3, 61, '');
INSERT INTO `hc_system_role_permission` VALUES (272, 3, 46, '');
INSERT INTO `hc_system_role_permission` VALUES (273, 3, 69, '');
INSERT INTO `hc_system_role_permission` VALUES (274, 3, 23, '');
INSERT INTO `hc_system_role_permission` VALUES (275, 3, 13, '');
INSERT INTO `hc_system_role_permission` VALUES (276, 3, 68, '');
INSERT INTO `hc_system_role_permission` VALUES (277, 3, 2, '');
INSERT INTO `hc_system_role_permission` VALUES (278, 3, 57, '');
INSERT INTO `hc_system_role_permission` VALUES (280, 3, 25, '');
INSERT INTO `hc_system_role_permission` VALUES (281, 3, 72, '');
INSERT INTO `hc_system_role_permission` VALUES (282, 3, 17, '');
INSERT INTO `hc_system_role_permission` VALUES (283, 3, 22, '');
INSERT INTO `hc_system_role_permission` VALUES (284, 3, 15, '');
INSERT INTO `hc_system_role_permission` VALUES (285, 3, 4, '');
INSERT INTO `hc_system_role_permission` VALUES (286, 3, 47, '');
INSERT INTO `hc_system_role_permission` VALUES (287, 3, 20, '');
INSERT INTO `hc_system_role_permission` VALUES (288, 3, 55, '');

-- ----------------------------
-- Table structure for hc_system_user
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_user`;
CREATE TABLE `hc_system_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `salt` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT 0,
  `updated` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `supered` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hc_system_user
-- ----------------------------
INSERT INTO `hc_system_user` VALUES (98, 'email@email.com', '62D18522B74D75B2A84776C91BA5498377441D4C4AF0CEA22CA7DE9E09475D3A', 'test', 'nickname', NULL, 1528879203, 1528879203, 1, 1);
INSERT INTO `hc_system_user` VALUES (99, 'admin@email.com', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', '', 'ds1', '', 1530081736, 1530081736, 1, 1);
INSERT INTO `hc_system_user` VALUES (101, 'tom@sina.com', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', NULL, 'tom', NULL, 0, 0, 1, 1);

-- ----------------------------
-- Table structure for hc_system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_user_role`;
CREATE TABLE `hc_system_user_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_id`(`user_id`) USING BTREE,
  INDEX `fk_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `hc_system_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `hc_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_user_role
-- ----------------------------
INSERT INTO `hc_system_user_role` VALUES (14, 99, 3);
INSERT INTO `hc_system_user_role` VALUES (16, 98, 3);
INSERT INTO `hc_system_user_role` VALUES (17, 98, 2);
INSERT INTO `hc_system_user_role` VALUES (37, 101, 3);

-- ----------------------------
-- Table structure for hc_tag_article
-- ----------------------------
DROP TABLE IF EXISTS `hc_tag_article`;
CREATE TABLE `hc_tag_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签关联文章' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_tag_product
-- ----------------------------
DROP TABLE IF EXISTS `hc_tag_product`;
CREATE TABLE `hc_tag_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签关联文章' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for hc_tag_tag
-- ----------------------------
DROP TABLE IF EXISTS `hc_tag_tag`;
CREATE TABLE `hc_tag_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(11) NULL DEFAULT 0,
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  `status` tinyint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签管理' ROW_FORMAT = Dynamic;


SET FOREIGN_KEY_CHECKS = 1;







ALTER TABLE `hc_system_permission` ADD COLUMN `group_id` int(0) NOT NULL DEFAULT 1 AFTER `title`;