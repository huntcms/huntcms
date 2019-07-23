/*
 Navicat Premium Data Transfer
 Date: 23/07/2019 16:20:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hc_app_app
-- ----------------------------
DROP TABLE IF EXISTS `hc_app_app`;
CREATE TABLE `hc_app_app`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用名称标题',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用一句话介绍',
  `support_device` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'id,id,id',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '应用简介',
  `other_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '应用属性内容',
  `hardware_problem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '硬件问题',
  `software_problem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '软件问题',
  `fit_problem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '适配问题',
  `picurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主图地址',
  `picurls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预览多图json',
  `download_picurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二维码下载图片地址',
  `sort` int(11) NULL DEFAULT 0,
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '1上架0下架',
  `deleted` int(11) NULL DEFAULT 0,
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_app_app
-- ----------------------------
INSERT INTO `hc_app_app` VALUES (1, '淘淘冲锋车', '淘淘冲锋车', NULL, '<blockquote style=\"margin-bottom: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left: 3px solid rgb(219, 219, 219); color: rgb(51, 51, 51); font-size: 17px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 0.544px; line-height: 27.2px; text-align: justify; widows: 1; word-wrap: break-word !important;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(136, 136, 136); word-wrap: break-word !important;\"><font face=\"Tahoma\">不知道有多少人想买车，几年摇号都没中奖，拍牌又觉得太贵，一直和车子处于“暗恋”阶段，心里OS总是觉得买车很难，但受罪的不止是我们，还有很多地方跟我们一样，连买车都是一件奢侈的事情。看完这篇文章，可能会刷新你对“买车难”的理解</font></span></p></blockquote>', NULL, NULL, NULL, NULL, NULL, '', '', 0, 1, 0, 0, 0);
INSERT INTO `hc_app_app` VALUES (2, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, '', '', 0, 0, 0, 0, 0);
INSERT INTO `hc_app_app` VALUES (3, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (4, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (5, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (6, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (7, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (8, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (9, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (10, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (11, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (12, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (13, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (14, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (15, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (16, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (17, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (18, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (19, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (20, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (21, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (22, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (23, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (24, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (25, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (26, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (27, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (28, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (29, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (30, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (31, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (32, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (33, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (34, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (35, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (36, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (37, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (38, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (39, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (40, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (41, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (42, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (43, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (44, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (45, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (46, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (47, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (48, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (49, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (50, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (51, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (52, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (53, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (54, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (55, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (56, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (57, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (58, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (59, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (60, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (61, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (62, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (63, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (64, '百变布鲁克', '遥控科技积木', NULL, '商品介绍', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL);
INSERT INTO `hc_app_app` VALUES (65, '1', '1', NULL, '<p>123</p>', NULL, NULL, NULL, NULL, NULL, '', '', 0, 0, 0, 0, 0);
INSERT INTO `hc_app_app` VALUES (66, '1', '1', NULL, '<p>123</p>', NULL, NULL, NULL, NULL, NULL, '', '', 0, 0, 0, 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_article_article
-- ----------------------------
INSERT INTO `hc_article_article` VALUES (7, 3, 'Vue+2.0+Hello+World', '简介简介简介简介简介', '作者', '<p><img+src=\"data:image+png;base64,ivborw0kggoaaaansuheugaaajyaaaaycamaaacjutioaaaagxrfwhrtb2z0d2fyzqbbzg9izsbjbwfnzvjlywr5ccllpaaaayzpvfh0we1momnvbs5hzg9izs54bxaaaaaaadw=\"\"+ehbhy2tldcbizwdpbj0i77u=\"\"+iibpzd0ivzvnme1wq2voauh6cmvtek5uy3pryzlkij8+idx4onhtcg1ldgegeg1sbnm6ed0iywrvymu6bnm6bwv0ys8iihg6eg1wdgs9ikfkb2jlifhnucbdb3jliduuni1jmtqyidc5lje2mdkyncwgmjaxny8wny8xmy0wmtownjozosagicagicagij4gphjkzjpsreygeg1sbnm6cmrmpsjodhrwoi8vd3d3lnczlm9yzy8xotk5lzaylziylxjkzi1zew50yxgtbnmjij4gphjkzjpezxnjcmlwdglvbibyzgy6ywjvdxq9iiigeg1sbnm6eg1wpsjodhrwoi8vbnmuywrvymuuy29tl3hhcc8xljaviib4bwxuczp4bxbntt0iahr0cdovl25zlmfkb2jllmnvbs94yxavms4wl21tlyigeg1sbnm6c3rszwy9imh0dha6ly9ucy5hzg9izs5jb20vegfwlzeumc9zvhlwzs9szxnvdxjjzvjlzimiihhtcdpdcmvhdg9yvg9vbd0iqwrvymugughvdg9zag9wiendidiwmtggkfdpbmrvd3mpiib4bxbnttpjbnn0yw5jzulepsj4bxauawlkoje5revcnjuwqtzdrdexrthcotuxoem0qku5rja3odbciib4bxbnttpeb2n1bwvudelepsj4bxauzglkoje5revcnjuxqtzdrdexrthcotuxoem0qku5rja3odbcij4gphhtce1nokrlcml2zwrgcm9tihn0umvmomluc3rhbmnlsuq9inhtcc5pawq6mtlerui2nevbnknemtffoei5nte4qzrcrtlgmdc4meiiihn0umvmomrvy3vtzw50suq9inhtcc5kawq6mtlerui2nezbnknemtffoei5nte4qzrcrtlgmdc4meiilz4gpc9yzgy6rgvzy3jpchrpb24+idwvcmrmoljerj4gpc94onhtcg1ldge+idw=\"\"+ehbhy2tldcblbmq9iniipz766tdqaaaaxvbmvew8yfvu1tjj5oxctbpmztgznqorr7phghzs1tw2tkj69fxxqkaip6vb3d7x4ec8v8lx8vl16+vex8nny8r4+pmplzvsnjnq6+zhwl=\"\"+mjovbcw2zt7ufjjkwoth=\"\"+8zhnffaaacleleqvr42uyxw7uqibcgmbasz+ddyp=\"\"+mrsgvgrh2v49e3cbf6mdng9z+cdev3igj+wxpjbh8lgey2n5ri9h0u86af4ga17ghjxtju5=\"\"+e8wctiyxhmddvdygxiqrm81plm4znm=\"\"+r=\"\"+w2sqbxb7izcmrnigxjvy0ni4a0sfpfx7e0skhdh05ilv7ncix+ilrjxoe+w7ryhk4tnayawwc=\"\"+vepy4sgbgxy+nsebtysuqcsrncnmlmjhj8dlbq2qxrbyz3regaqnvjwzgpyn4tcuju0mek4ge581wkcwkjy0fbuink5trxukkn6jg6hc83amimjgnrgcl8ruvcitds156f6owspiqzdmenux5k8ixgwslw4=\"\"+fsgiomkhhelcejvkzpxwq4adehppui59lsczw9gcwwlgixk3ocqwfcbvwcwfnjla8wbcstm7gahxm1hzfzwmr5tcwsmkt9cpyra6xkfnypxa=\"\"+ym0p7p5gerurd2nvzkcuotqvo8v5lzx3jhzez+flchdex2c13i1ftkxuket+igxuvjljl4mbiyj4lbpstuldscjj0txvk6xctmrjrc2re8fxzq+woiuwcvxy6qpk4bfiwh4wqwmhi5xylm7vqteosooizt91enwli6bxz7fspr9orgiv8rofsrtruor1y4raocchp5oow9dvifaewcuosfeahrwtb485nrfqfi2u3ezzjlqej1rdnp4glkir=\"\"+7cnwds95zdwouzba3maswwzwf4jnwnzvdva561sfnvxdpjglc2s2utalz0blcgd87z1shph4feeeuxr=\"\"+olqjkcjrp95lr=\"\"+neyg7hxvffhdwjpi6fne=\"\"+h3xtceww5v+e5f8neiyp5be8lsfywp9g=\"\"+bfgak4dphlbpgbvaaaaaelftksuqmcc\"+data-filename=\"dlangchina.png\"++style=\"width:+150px;\">噩噩噩噩噩噩噩噩噩</img+src=\"data:image><img+src=\"https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\"><img+src=\"data:image+png;base64,ivborw0kggoaaaansuheugaaajyaaaaycamaaacjutioaaaagxrfwhrtb2z0d2fyzqbbzg9izsbjbwfnzvjlywr5ccllpaaaayzpvfh0we1momnvbs5hzg9izs54bxaaaaaaadw=\"\"+ehbhy2tldcbizwdpbj0i77u=\"\"+iibpzd0ivzvnme1wq2voauh6cmvtek5uy3pryzlkij8+idx4onhtcg1ldgegeg1sbnm6ed0iywrvymu6bnm6bwv0ys8iihg6eg1wdgs9ikfkb2jlifhnucbdb3jliduuni1jmtqyidc5lje2mdkyncwgmjaxny8wny8xmy0wmtownjozosagicagicagij4gphjkzjpsreygeg1sbnm6cmrmpsjodhrwoi8vd3d3lnczlm9yzy8xotk5lzaylziylxjkzi1zew50yxgtbnmjij4gphjkzjpezxnjcmlwdglvbibyzgy6ywjvdxq9iiigeg1sbnm6eg1wpsjodhrwoi8vbnmuywrvymuuy29tl3hhcc8xljaviib4bwxuczp4bxbntt0iahr0cdovl25zlmfkb2jllmnvbs94yxavms4wl21tlyigeg1sbnm6c3rszwy9imh0dha6ly9ucy5hzg9izs5jb20vegfwlzeumc9zvhlwzs9szxnvdxjjzvjlzimiihhtcdpdcmvhdg9yvg9vbd0iqwrvymugughvdg9zag9wiendidiwmtggkfdpbmrvd3mpiib4bxbnttpjbnn0yw5jzulepsj4bxauawlkoje5revcnjuwqtzdrdexrthcotuxoem0qku5rja3odbciib4bxbnttpeb2n1bwvudelepsj4bxauzglkoje5revcnjuxqtzdrdexrthcotuxoem0qku5rja3odbcij4gphhtce1nokrlcml2zwrgcm9tihn0umvmomluc3rhbmnlsuq9inhtcc5pawq6mtlerui2nevbnknemtffoei5nte4qzrcrtlgmdc4meiiihn0umvmomrvy3vtzw50suq9inhtcc5kawq6mtlerui2nezbnknemtffoei5nte4qzrcrtlgmdc4meiilz4gpc9yzgy6rgvzy3jpchrpb24+idwvcmrmoljerj4gpc94onhtcg1ldge+idw=\"\"+ehbhy2tldcblbmq9iniipz766tdqaaaaxvbmvew8yfvu1tjj5oxctbpmztgznqorr7phghzs1tw2tkj69fxxqkaip6vb3d7x4ec8v8lx8vl16+vex8nny8r4+pmplzvsnjnq6+zhwl=\"\"+mjovbcw2zt7ufjjkwoth=\"\"+8zhnffaaacleleqvr42uyxw7uqibcgmbasz+ddyp=\"\"+mrsgvgrh2v49e3cbf6mdng9z+cdev3igj+wxpjbh8lgey2n5ri9h0u86af4ga17ghjxtju5=\"\"+e8wctiyxhmddvdygxiqrm81plm4znm=\"\"+r=\"\"+w2sqbxb7izcmrnigxjvy0ni4a0sfpfx7e0skhdh05ilv7ncix+ilrjxoe+w7ryhk4tnayawwc=\"\"+vepy4sgbgxy+nsebtysuqcsrncnmlmjhj8dlbq2qxrbyz3regaqnvjwzgpyn4tcuju0mek4ge581wkcwkjy0fbuink5trxukkn6jg6hc83amimjgnrgcl8ruvcitds156f6owspiqzdmenux5k8ixgwslw4=\"\"+fsgiomkhhelcejvkzpxwq4adehppui59lsczw9gcwwlgixk3ocqwfcbvwcwfnjla8wbcstm7gahxm1hzfzwmr5tcwsmkt9cpyra6xkfnypxa=\"\"+ym0p7p5gerurd2nvzkcuotqvo8v5lzx3jhzez+flchdex2c13i1ftkxuket+igxuvjljl4mbiyj4lbpstuldscjj0txvk6xctmrjrc2re8fxzq+woiuwcvxy6qpk4bfiwh4wqwmhi5xylm7vqteosooizt91enwli6bxz7fspr9orgiv8rofsrtruor1y4raocchp5oow9dvifaewcuosfeahrwtb485nrfqfi2u3ezzjlqej1rdnp4glkir=\"\"+7cnwds95zdwouzba3maswwzwf4jnwnzvdva561sfnvxdpjglc2s2utalz0blcgd87z1shph4feeeuxr=\"\"+olqjkcjrp95lr=\"\"+neyg7hxvffhdwjpi6fne=\"\"+h3xtceww5v+e5f8neiyp5be8lsfywp9g=\"\"+bfgak4dphlbpgbvaaaaaelftksuqmcc\"+data-filename=\"dlangchina.png\"++style=\"width:+150px;\"><img+src=\"data:image+png;base64,ivborw0kggoaaaansuheugaaajyaaaaycamaaacjutioaaaagxrfwhrtb2z0d2fyzqbbzg9izsbjbwfnzvjlywr5ccllpaaaayzpvfh0we1momnvbs5hzg9izs54bxaaaaaaadw=\"\"+ehbhy2tldcbizwdpbj0i77u=\"\"+iibpzd0ivzvnme1wq2voauh6cmvtek5uy3pryzlkij8+idx4onhtcg1ldgegeg1sbnm6ed0iywrvymu6bnm6bwv0ys8iihg6eg1wdgs9ikfkb2jlifhnucbdb3jliduuni1jmtqyidc5lje2mdkyncwgmjaxny8wny8xmy0wmtownjozosagicagicagij4gphjkzjpsreygeg1sbnm6cmrmpsjodhrwoi8vd3d3lnczlm9yzy8xotk5lzaylziylxjkzi1zew50yxgtbnmjij4gphjkzjpezxnjcmlwdglvbibyzgy6ywjvdxq9iiigeg1sbnm6eg1wpsjodhrwoi8vbnmuywrvymuuy29tl3hhcc8xljaviib4bwxuczp4bxbntt0iahr0cdovl25zlmfkb2jllmnvbs94yxavms4wl21tlyigeg1sbnm6c3rszwy9imh0dha6ly9ucy5hzg9izs5jb20vegfwlzeumc9zvhlwzs9szxnvdxjjzvjlzimiihhtcdpdcmvhdg9yvg9vbd0iqwrvymugughvdg9zag9wiendidiwmtggkfdpbmrvd3mpiib4bxbnttpjbnn0yw5jzulepsj4bxauawlkoje5revcnjuwqtzdrdexrthcotuxoem0qku5rja3odbciib4bxbnttpeb2n1bwvudelepsj4bxauzglkoje5revcnjuxqtzdrdexrthcotuxoem0qku5rja3odbcij4gphhtce1nokrlcml2zwrgcm9tihn0umvmomluc3rhbmnlsuq9inhtcc5pawq6mtlerui2nevbnknemtffoei5nte4qzrcrtlgmdc4meiiihn0umvmomrvy3vtzw50suq9inhtcc5kawq6mtlerui2nezbnknemtffoei5nte4qzrcrtlgmdc4meiilz4gpc9yzgy6rgvzy3jpchrpb24+idwvcmrmoljerj4gpc94onhtcg1ldge+idw=\"\"+ehbhy2tldcblbmq9iniipz766tdqaaaaxvbmvew8yfvu1tjj5oxctbpmztgznqorr7phghzs1tw2tkj69fxxqkaip6vb3d7x4ec8v8lx8vl16+vex8nny8r4+pmplzvsnjnq6+zhwl=\"\"+mjovbcw2zt7ufjjkwoth=\"\"+8zhnffaaacleleqvr42uyxw7uqibcgmbasz+ddyp=\"\"+mrsgvgrh2v49e3cbf6mdng9z+cdev3igj+wxpjbh8lgey2n5ri9h0u86af4ga17ghjxtju5=\"\"+e8wctiyxhmddvdygxiqrm81plm4znm=\"\"+r=\"\"+w2sqbxb7izcmrnigxjvy0ni4a0sfpfx7e0skhdh05ilv7ncix+ilrjxoe+w7ryhk4tnayawwc=\"\"+vepy4sgbgxy+nsebtysuqcsrncnmlmjhj8dlbq2qxrbyz3regaqnvjwzgpyn4tcuju0mek4ge581wkcwkjy0fbuink5trxukkn6jg6hc83amimjgnrgcl8ruvcitds156f6owspiqzdmenux5k8ixgwslw4=\"\"+fsgiomkhhelcejvkzpxwq4adehppui59lsczw9gcwwlgixk3ocqwfcbvwcwfnjla8wbcstm7gahxm1hzfzwmr5tcwsmkt9cpyra6xkfnypxa=\"\"+ym0p7p5gerurd2nvzkcuotqvo8v5lzx3jhzez+flchdex2c13i1ftkxuket+igxuvjljl4mbiyj4lbpstuldscjj0txvk6xctmrjrc2re8fxzq+woiuwcvxy6qpk4bfiwh4wqwmhi5xylm7vqteosooizt91enwli6bxz7fspr9orgiv8rofsrtruor1y4raocchp5oow9dvifaewcuosfeahrwtb485nrfqfi2u3ezzjlqej1rdnp4glkir=\"\"+7cnwds95zdwouzba3maswwzwf4jnwnzvdva561sfnvxdpjglc2s2utalz0blcgd87z1shph4feeeuxr=\"\"+olqjkcjrp95lr=\"\"+neyg7hxvffhdwjpi6fne=\"\"+h3xtceww5v+e5f8neiyp5be8lsfywp9g=\"\"+bfgak4dphlbpgbvaaaaaelftksuqmcc\"+data-filename=\"dlangchina.png\"++style=\"width:+150px;\"><img+src=\"data:image+png;base64,ivborw0kggoaaaansuheugaaajyaaaaycamaaacjutioaaaagxrfwhrtb2z0d2fyzqbbzg9izsbjbwfnzvjlywr5ccllpaaaayzpvfh0we1momnvbs5hzg9izs54bxaaaaaaadw=\"\"+ehbhy2tldcbizwdpbj0i77u=\"\"+iibpzd0ivzvnme1wq2voauh6cmvtek5uy3pryzlkij8+idx4onhtcg1ldgegeg1sbnm6ed0iywrvymu6bnm6bwv0ys8iihg6eg1wdgs9ikfkb2jlifhnucbdb3jliduuni1jmtqyidc5lje2mdkyncwgmjaxny8wny8xmy0wmtownjozosagicagicagij4gphjkzjpsreygeg1sbnm6cmrmpsjodhrwoi8vd3d3lnczlm9yzy8xotk5lzaylziylxjkzi1zew50yxgtbnmjij4gphjkzjpezxnjcmlwdglvbibyzgy6ywjvdxq9iiigeg1sbnm6eg1wpsjodhrwoi8vbnmuywrvymuuy29tl3hhcc8xljaviib4bwxuczp4bxbntt0iahr0cdovl25zlmfkb2jllmnvbs94yxavms4wl21tlyigeg1sbnm6c3rszwy9imh0dha6ly9ucy5hzg9izs5jb20vegfwlzeumc9zvhlwzs9szxnvdxjjzvjlzimiihhtcdpdcmvhdg9yvg9vbd0iqwrvymugughvdg9zag9wiendidiwmtggkfdpbmrvd3mpiib4bxbnttpjbnn0yw5jzulepsj4bxauawlkoje5revcnjuwqtzdrdexrthcotuxoem0qku5rja3odbciib4bxbnttpeb2n1bwvudelepsj4bxauzglkoje5revcnjuxqtzdrdexrthcotuxoem0qku5rja3odbcij4gphhtce1nokrlcml2zwrgcm9tihn0umvmomluc3rhbmnlsuq9inhtcc5pawq6mtlerui2nevbnknemtffoei5nte4qzrcrtlgmdc4meiiihn0umvmomrvy3vtzw50suq9inhtcc5kawq6mtlerui2nezbnknemtffoei5nte4qzrcrtlgmdc4meiilz4gpc9yzgy6rgvzy3jpchrpb24+idwvcmrmoljerj4gpc94onhtcg1ldge+idw=\"\"+ehbhy2tldcblbmq9iniipz766tdqaaaaxvbmvew8yfvu1tjj5oxctbpmztgznqorr7phghzs1tw2tkj69fxxqkaip6vb3d7x4ec8v8lx8vl16+vex8nny8r4+pmplzvsnjnq6+zhwl=\"\"+mjovbcw2zt7ufjjkwoth=\"\"+8zhnffaaacleleqvr42uyxw7uqibcgmbasz+ddyp=\"\"+mrsgvgrh2v49e3cbf6mdng9z+cdev3igj+wxpjbh8lgey2n5ri9h0u86af4ga17ghjxtju5=\"\"+e8wctiyxhmddvdygxiqrm81plm4znm=\"\"+r=\"\"+w2sqbxb7izcmrnigxjvy0ni4a0sfpfx7e0skhdh05ilv7ncix+ilrjxoe+w7ryhk4tnayawwc=\"\"+vepy4sgbgxy+nsebtysuqcsrncnmlmjhj8dlbq2qxrbyz3regaqnvjwzgpyn4tcuju0mek4ge581wkcwkjy0fbuink5trxukkn6jg6hc83amimjgnrgcl8ruvcitds156f6owspiqzdmenux5k8ixgwslw4=\"\"+fsgiomkhhelcejvkzpxwq4adehppui59lsczw9gcwwlgixk3ocqwfcbvwcwfnjla8wbcstm7gahxm1hzfzwmr5tcwsmkt9cpyra6xkfnypxa=\"\"+ym0p7p5gerurd2nvzkcuotqvo8v5lzx3jhzez+flchdex2c13i1ftkxuket+igxuvjljl4mbiyj4lbpstuldscjj0txvk6xctmrjrc2re8fxzq+woiuwcvxy6qpk4bfiwh4wqwmhi5xylm7vqteosooizt91enwli6bxz7fspr9orgiv8rofsrtruor1y4raocchp5oow9dvifaewcuosfeahrwtb485nrfqfi2u3ezzjlqej1rdnp4glkir=\"\"+7cnwds95zdwouzba3maswwzwf4jnwnzvdva561sfnvxdpjglc2s2utalz0blcgd87z1shph4feeeuxr=\"\"+olqjkcjrp95lr=\"\"+neyg7hxvffhdwjpi6fne=\"\"+h3xtceww5v+e5f8neiyp5be8lsfywp9g=\"\"+bfgak4dphlbpgbvaaaaaelftksuqmcc\"+data-filename=\"dlangchina.png\"++style=\"width:+150px;\"></img+src=\"data:image+png;base64,ivborw0kggoaaaansuheugaaajyaaaaycamaaacjutioaaaagxrfwhrtb2z0d2fyzqbbzg9izsbjbwfnzvjlywr5ccllpaaaayzpvfh0we1momnvbs5hzg9izs54bxaaaaaaadw=\"\"+ehbhy2tldcbizwdpbj0i77u=\"\"+iibpzd0ivzvnme1wq2voauh6cmvtek5uy3pryzlkij8+idx4onhtcg1ldgegeg1sbnm6ed0iywrvymu6bnm6bwv0ys8iihg6eg1wdgs9ikfkb2jlifhnucbdb3jliduuni1jmtqyidc5lje2mdkyncwgmjaxny8wny8xmy0wmtownjozosagicagicagij4gphjkzjpsreygeg1sbnm6cmrmpsjodhrwoi8vd3d3lnczlm9yzy8xotk5lzaylziylxjkzi1zew50yxgtbnmjij4gphjkzjpezxnjcmlwdglvbibyzgy6ywjvdxq9iiigeg1sbnm6eg1wpsjodhrwoi8vbnmuywrvymuuy29tl3hhcc8xljaviib4bwxuczp4bxbntt0iahr0cdovl25zlmfkb2jllmnvbs94yxavms4wl21tlyigeg1sbnm6c3rszwy9imh0dha6ly9ucy5hzg9izs5jb20vegfwlzeumc9zvhlwzs9szxnvdxjjzvjlzimiihhtcdpdcmvhdg9yvg9vbd0iqwrvymugughvdg9zag9wiendidiwmtggkfdpbmrvd3mpiib4bxbnttpjbnn0yw5jzulepsj4bxauawlkoje5revcnjuwqtzdrdexrthcotuxoem0qku5rja3odbciib4bxbnttpeb2n1bwvudelepsj4bxauzglkoje5revcnjuxqtzdrdexrthcotuxoem0qku5rja3odbcij4gphhtce1nokrlcml2zwrgcm9tihn0umvmomluc3rhbmnlsuq9inhtcc5pawq6mtlerui2nevbnknemtffoei5nte4qzrcrtlgmdc4meiiihn0umvmomrvy3vtzw50suq9inhtcc5kawq6mtlerui2nezbnknemtffoei5nte4qzrcrtlgmdc4meiilz4gpc9yzgy6rgvzy3jpchrpb24+idwvcmrmoljerj4gpc94onhtcg1ldge+idw=\"\"+ehbhy2tldcblbmq9iniipz766tdqaaaaxvbmvew8yfvu1tjj5oxctbpmztgznqorr7phghzs1tw2tkj69fxxqkaip6vb3d7x4ec8v8lx8vl16+vex8nny8r4+pmplzvsnjnq6+zhwl=\"\"+mjovbcw2zt7ufjjkwoth=\"\"+8zhnffaaacleleqvr42uyxw7uqibcgmbasz+ddyp=\"\"+mrsgvgrh2v49e3cbf6mdng9z+cdev3igj+wxpjbh8lgey2n5ri9h0u86af4ga17ghjxtju5=\"\"+e8wctiyxhmddvdygxiqrm81plm4znm=\"\"+r=\"\"+w2sqbxb7izcmrnigxjvy0ni4a0sfpfx7e0skhdh05ilv7ncix+ilrjxoe+w7ryhk4tnayawwc=\"\"+vepy4sgbgxy+nsebtysuqcsrncnmlmjhj8dlbq2qxrbyz3regaqnvjwzgpyn4tcuju0mek4ge581wkcwkjy0fbuink5trxukkn6jg6hc83amimjgnrgcl8ruvcitds156f6owspiqzdmenux5k8ixgwslw4=\"\"+fsgiomkhhelcejvkzpxwq4adehppui59lsczw9gcwwlgixk3ocqwfcbvwcwfnjla8wbcstm7gahxm1hzfzwmr5tcwsmkt9cpyra6xkfnypxa=\"\"+ym0p7p5gerurd2nvzkcuotqvo8v5lzx3jhzez+flchdex2c13i1ftkxuket+igxuvjljl4mbiyj4lbpstuldscjj0txvk6xctmrjrc2re8fxzq+woiuwcvxy6qpk4bfiwh4wqwmhi5xylm7vqteosooizt91enwli6bxz7fspr9orgiv8rofsrtruor1y4raocchp5oow9dvifaewcuosfeahrwtb485nrfqfi2u3ezzjlqej1rdnp4glkir=\"\"+7cnwds95zdwouzba3maswwzwf4jnwnzvdva561sfnvxdpjglc2s2utalz0blcgd87z1shph4feeeuxr=\"\"+olqjkcjrp95lr=\"\"+neyg7hxvffhdwjpi6fne=\"\"+h3xtceww5v+e5f8neiyp5be8lsfywp9g=\"\"+bfgak4dphlbpgbvaaaaaelftksuqmcc\"+data-filename=\"dlangchina.png\"++style=\"width:+150px;\"></img+src=\"data:image+png;base64,ivborw0kggoaaaansuheugaaajyaaaaycamaaacjutioaaaagxrfwhrtb2z0d2fyzqbbzg9izsbjbwfnzvjlywr5ccllpaaaayzpvfh0we1momnvbs5hzg9izs54bxaaaaaaadw=\"\"+ehbhy2tldcbizwdpbj0i77u=\"\"+iibpzd0ivzvnme1wq2voauh6cmvtek5uy3pryzlkij8+idx4onhtcg1ldgegeg1sbnm6ed0iywrvymu6bnm6bwv0ys8iihg6eg1wdgs9ikfkb2jlifhnucbdb3jliduuni1jmtqyidc5lje2mdkyncwgmjaxny8wny8xmy0wmtownjozosagicagicagij4gphjkzjpsreygeg1sbnm6cmrmpsjodhrwoi8vd3d3lnczlm9yzy8xotk5lzaylziylxjkzi1zew50yxgtbnmjij4gphjkzjpezxnjcmlwdglvbibyzgy6ywjvdxq9iiigeg1sbnm6eg1wpsjodhrwoi8vbnmuywrvymuuy29tl3hhcc8xljaviib4bwxuczp4bxbntt0iahr0cdovl25zlmfkb2jllmnvbs94yxavms4wl21tlyigeg1sbnm6c3rszwy9imh0dha6ly9ucy5hzg9izs5jb20vegfwlzeumc9zvhlwzs9szxnvdxjjzvjlzimiihhtcdpdcmvhdg9yvg9vbd0iqwrvymugughvdg9zag9wiendidiwmtggkfdpbmrvd3mpiib4bxbnttpjbnn0yw5jzulepsj4bxauawlkoje5revcnjuwqtzdrdexrthcotuxoem0qku5rja3odbciib4bxbnttpeb2n1bwvudelepsj4bxauzglkoje5revcnjuxqtzdrdexrthcotuxoem0qku5rja3odbcij4gphhtce1nokrlcml2zwrgcm9tihn0umvmomluc3rhbmnlsuq9inhtcc5pawq6mtlerui2nevbnknemtffoei5nte4qzrcrtlgmdc4meiiihn0umvmomrvy3vtzw50suq9inhtcc5kawq6mtlerui2nezbnknemtffoei5nte4qzrcrtlgmdc4meiilz4gpc9yzgy6rgvzy3jpchrpb24+idwvcmrmoljerj4gpc94onhtcg1ldge+idw=\"\"+ehbhy2tldcblbmq9iniipz766tdqaaaaxvbmvew8yfvu1tjj5oxctbpmztgznqorr7phghzs1tw2tkj69fxxqkaip6vb3d7x4ec8v8lx8vl16+vex8nny8r4+pmplzvsnjnq6+zhwl=\"\"+mjovbcw2zt7ufjjkwoth=\"\"+8zhnffaaacleleqvr42uyxw7uqibcgmbasz+ddyp=\"\"+mrsgvgrh2v49e3cbf6mdng9z+cdev3igj+wxpjbh8lgey2n5ri9h0u86af4ga17ghjxtju5=\"\"+e8wctiyxhmddvdygxiqrm81plm4znm=\"\"+r=\"\"+w2sqbxb7izcmrnigxjvy0ni4a0sfpfx7e0skhdh05ilv7ncix+ilrjxoe+w7ryhk4tnayawwc=\"\"+vepy4sgbgxy+nsebtysuqcsrncnmlmjhj8dlbq2qxrbyz3regaqnvjwzgpyn4tcuju0mek4ge581wkcwkjy0fbuink5trxukkn6jg6hc83amimjgnrgcl8ruvcitds156f6owspiqzdmenux5k8ixgwslw4=\"\"+fsgiomkhhelcejvkzpxwq4adehppui59lsczw9gcwwlgixk3ocqwfcbvwcwfnjla8wbcstm7gahxm1hzfzwmr5tcwsmkt9cpyra6xkfnypxa=\"\"+ym0p7p5gerurd2nvzkcuotqvo8v5lzx3jhzez+flchdex2c13i1ftkxuket+igxuvjljl4mbiyj4lbpstuldscjj0txvk6xctmrjrc2re8fxzq+woiuwcvxy6qpk4bfiwh4wqwmhi5xylm7vqteosooizt91enwli6bxz7fspr9orgiv8rofsrtruor1y4raocchp5oow9dvifaewcuosfeahrwtb485nrfqfi2u3ezzjlqej1rdnp4glkir=\"\"+7cnwds95zdwouzba3maswwzwf4jnwnzvdva561sfnvxdpjglc2s2utalz0blcgd87z1shph4feeeuxr=\"\"+olqjkcjrp95lr=\"\"+neyg7hxvffhdwjpi6fne=\"\"+h3xtceww5v+e5f8neiyp5be8lsfywp9g=\"\"+bfgak4dphlbpgbvaaaaaelftksuqmcc\"+data-filename=\"dlangchina.png\"++style=\"width:+150px;\"></img+src=\"data:image></p>', 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png', '', 1529992850, 1536894783, 1);
INSERT INTO `hc_article_article` VALUES (9, 3, '22222222222', '222222', '222', '<p><img+src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAAyCAMAAACJUtIoAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQyIDc5LjE2MDkyNCwgMjAxNy8wNy8xMy0wMTowNjozOSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTggKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjE5REVCNjUwQTZDRDExRThCOTUxOEM0QkU5RjA3ODBCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjE5REVCNjUxQTZDRDExRThCOTUxOEM0QkU5RjA3ODBCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MTlERUI2NEVBNkNEMTFFOEI5NTE4QzRCRTlGMDc4MEIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MTlERUI2NEZBNkNEMTFFOEI5NTE4QzRCRTlGMDc4MEIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz766TDQAAAAXVBMVEW8YFvU1tjj5OXctbPMztGZnqOrr7PHgHzs1tW2Tkj69fXXqKaip6vb3d7x4eC8v8Lx8vL16+vEx8nny8r4+PmPlZvSnJnq6+zhwL/MjovBcW2zt7uFjJKwOTH///8ZhnFfAAAClElEQVR42uyXW7uqIBCGMbASz+dDyP//mRsGVGRh2V49e3cBF6mDNG9z+CDEv3Igj+WxPJbH8lgey2N5rI9h0U86af4Ga17GhJXtJu5/E8WCtIyxhMDDVdyGxiQRM81pLM4zNM/R/W2sQbxb7izCMRNIgXJvY0ni4A0sfpfX7E0sKhdh05ILv7nCIx+IlrjXOE+w7rYhk4tNayAwWC/vepY4sGBGXy+nsEbtYsUqcSRNCNMlmJhj8dlBQ2QxrByz3ReGAqNVJWZgpYn4TCUJU0mEK4GE581WkCwkjY0FbuINK5tRxukkn6jG6hC83amimjGNrGCl8ruvCitdS156F6OwsPIQzDmENux5k8iXGwsLw4/fsGIomkHHELCEJVKzpXwq4adEhppUi59lSCzW9gCWWlgiXK3OcQWFCBVwcWFNJla8WBcstM7GahXM1hZFZWMR5TCwsMKt9CpYRA6xkFnypXa/Ym0p7p5gERurd2NVZkcUOtQvo8V5LZx3JhZeZ+FlChdEX2C13I1FTKxUKEt+iGXUVjlJl4MbiyJ4lBpstuLDSCJJ0tXvK6xCtmrjrC2rE8FxzQ+wOIUwCvXY6QPk4bFIWH4WqwmhI5xYlm7VqteOsOoIZT91ENwli6BXZ7FSpR9OrGiv8roFsRtrUOr1Y4RaoCChp5OoW9DVifaeWCuOSfeahRWtB485Nrfqfi2u3eZzJlqEJ1rdnp4glKIr/7cnWDs95ZdWOUzba3MaSwWZwf4jNwnzvDVa561SFnVXDpJgLC2s2uTalz0BlcgD87z1shPh4FEEEuxR/OLQjKcjrP95lr/NEYg7HXVFfhdWJpI6fNE/H3xTCeww5V+E5f8neiyP5bE8lsfyWP9g/BFgAK4dPHlbPgBVAAAAAElFTkSuQmCC\"+data-filename=\"dlangchina.png\"+style=\"width:+150px;\">222222</p>', NULL, NULL, 1529996936, 1536802876, 1);
INSERT INTO `hc_article_article` VALUES (11, 1, '管理员发起的设备、产品、物料报废申请+单', '简介简介简介简介简介', '作者6666', '的飒爽的的损失的555555', NULL, NULL, 1530008636, 1530252833, 0);
INSERT INTO `hc_article_article` VALUES (12, 2, 'cxy测试一次抽奖', '333', 'auto', '<p>content<srcipt>+alert(\'x\"xx\')+</srcipt></p>', NULL, NULL, 1530080695, 1530086255, 1);
INSERT INTO `hc_article_article` VALUES (13, 2, '管理员发起的设备、产品、物料报废申请单', '测试简介', '作者6666', '测试content', NULL, NULL, 1530087020, 1530087020, 1);
INSERT INTO `hc_article_article` VALUES (14, 4, '122777', '122777', '122777', '<p>122777www</p>', NULL, NULL, 1530087216, 1530087223, 0);
INSERT INTO `hc_article_article` VALUES (15, 1, '122222', '1111', '222', '<p>222</p>', NULL, NULL, 1530850618, 1530850618, 1);
INSERT INTO `hc_article_article` VALUES (18, 3, '啊啊啊', '啊啊啊', 'a', '<p>asdfasdfasdf</p>', NULL, NULL, 1536721158, 1536734296, 1);
INSERT INTO `hc_article_article` VALUES (19, 3, 'PaiBot（64G）+asdf', 'asdf', 'asdfas', '<p>afasdfas</p>', NULL, NULL, 1536721378, 1536721378, 1);
INSERT INTO `hc_article_article` VALUES (20, 3, 'asdf', 'asdfasd', 'asdfasdf', '<p>asdfasdf</p>', NULL, NULL, 1536721777, 1536721777, 1);
INSERT INTO `hc_article_article` VALUES (21, 2, 'asdf', 'asdf', 'asdfasdf', '<p>asdfas</p>', NULL, NULL, 1536721959, 1536721959, 1);
INSERT INTO `hc_article_article` VALUES (22, 4, 'PaiBot ', 'asdfasd', '阿道夫', '<p><img style=\"width: 150px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAAyCAMAAACJUtIoAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQyIDc5LjE2MDkyNCwgMjAxNy8wNy8xMy0wMTowNjozOSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTggKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjE5REVCNjUwQTZDRDExRThCOTUxOEM0QkU5RjA3ODBCIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjE5REVCNjUxQTZDRDExRThCOTUxOEM0QkU5RjA3ODBCIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MTlERUI2NEVBNkNEMTFFOEI5NTE4QzRCRTlGMDc4MEIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MTlERUI2NEZBNkNEMTFFOEI5NTE4QzRCRTlGMDc4MEIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz766TDQAAAAXVBMVEW8YFvU1tjj5OXctbPMztGZnqOrr7PHgHzs1tW2Tkj69fXXqKaip6vb3d7x4eC8v8Lx8vL16+vEx8nny8r4+PmPlZvSnJnq6+zhwL/MjovBcW2zt7uFjJKwOTH///8ZhnFfAAAClElEQVR42uyXW7uqIBCGMbASz+dDyP//mRsGVGRh2V49e3cBF6mDNG9z+CDEv3Igj+WxPJbH8lgey2N5rI9h0U86af4Ga17GhJXtJu5/E8WCtIyxhMDDVdyGxiQRM81pLM4zNM/R/W2sQbxb7izCMRNIgXJvY0ni4A0sfpfX7E0sKhdh05ILv7nCIx+IlrjXOE+w7rYhk4tNayAwWC/vepY4sGBGXy+nsEbtYsUqcSRNCNMlmJhj8dlBQ2QxrByz3ReGAqNVJWZgpYn4TCUJU0mEK4GE581WkCwkjY0FbuINK5tRxukkn6jG6hC83amimjGNrGCl8ruvCitdS156F6OwsPIQzDmENux5k8iXGwsLw4/fsGIomkHHELCEJVKzpXwq4adEhppUi59lSCzW9gCWWlgiXK3OcQWFCBVwcWFNJla8WBcstM7GahXM1hZFZWMR5TCwsMKt9CpYRA6xkFnypXa/Ym0p7p5gERurd2NVZkcUOtQvo8V5LZx3JhZeZ+FlChdEX2C13I1FTKxUKEt+iGXUVjlJl4MbiyJ4lBpstuLDSCJJ0tXvK6xCtmrjrC2rE8FxzQ+wOIUwCvXY6QPk4bFIWH4WqwmhI5xYlm7VqteOsOoIZT91ENwli6BXZ7FSpR9OrGiv8roFsRtrUOr1Y4RaoCChp5OoW9DVifaeWCuOSfeahRWtB485Nrfqfi2u3eZzJlqEJ1rdnp4glKIr/7cnWDs95ZdWOUzba3MaSwWZwf4jNwnzvDVa561SFnVXDpJgLC2s2uTalz0BlcgD87z1shPh4FEEEuxR/OLQjKcjrP95lr/NEYg7HXVFfhdWJpI6fNE/H3xTCeww5V+E5f8neiyP5bE8lsfyWP9g/BFgAK4dPHlbPgBVAAAAAElFTkSuQmCC\" data-filename=\"dlangchina.png\"><br></p>', NULL, NULL, 1536804426, 1536804426, 1);
INSERT INTO `hc_article_article` VALUES (26, 5, 'Hello编程 ', '啊啊啊', '俺的沙发', '<p><img src=\"/file/A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD.png\"><br></p>', NULL, NULL, 1536810232, 1536810232, 1);
INSERT INTO `hc_article_article` VALUES (27, 4, 'PaiBot（32G）+aa', 'asdfasd', 'adfasdf', '<p><img src=\"https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\"><img+src=\"https: mall-file.putaocdn.com=\"\" largefile=\"\" a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\"=\"\"><img+src=\"https:+mall-file.putaocdn.com=\"\"+largefile=\"\"+a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\"=\"\"><img+src=\"https:+mall-file.putaocdn.com=\"\"+largefile=\"\"+a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\"=\"\"><br></img+src=\"https:+mall-file.putaocdn.com=\"\"+largefile=\"\"+a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\"=\"\"></img+src=\"https:+mall-file.putaocdn.com=\"\"+largefile=\"\"+a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\"=\"\"></img+src=\"https:></p>', NULL, NULL, 1536840180, 1536842269, 1);
INSERT INTO `hc_article_article` VALUES (28, 6, 'Hello编程 ', '阿斯顿发生的', 'a', '<p><img><img src=\"https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\"><br></p>', NULL, NULL, 1536842301, 1536842301, 1);
INSERT INTO `hc_article_article` VALUES (35, 3, '动画片测试标题', '这是一条测试数据这是一条测试数据这是一条测试数据', '9999', '<p>dasdfasdfasdfasdfasd fasdfasdf asdf asdf asd fasd fasd fasd fasd fads f</p>', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709.jpg', '', 1543395507, 1543395507, 1);
INSERT INTO `hc_article_article` VALUES (36, 3, '动画片测试标题222', '这是一条测试数据这是一条测试数据这是一条测试数据', '', '<p>这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据这是一条测试数据<br></p>', '6738E49BCF95D67661D5AF6A1AEC434616D316F7.jpg', '', 1543478012, 1543478012, 1);
INSERT INTO `hc_article_article` VALUES (37, 3, '动画片测试标题', '这是一条测试数据这是一条测试数据这是一条测试数据', 'asdfasd fasdf', '<p>asd fasd fasdf asdf asdf&nbsp;</p>', '6738E49BCF95D67661D5AF6A1AEC434616D316F7.jpg', '', 1543481163, 1543481163, 1);
INSERT INTO `hc_article_article` VALUES (38, 3, '12', '这是一条测试数据这是一条测试数据这是一条测试数据', 'adsf asf sdf ', '<p>asdf asd fasdf asdf asd fsad fasd fasd asd asd asd asd asd&nbsp;</p>', 'https://mall-file.putaocdn.com/largefile/6738e49bcf95d67661d5af6a1aec434616d316f7.png', '', 1543481715, 1543481715, 1);
INSERT INTO `hc_article_article` VALUES (39, 3, '测试', '这是一条测试数据这是一条测试数据这是一条测试数据', '', '<p>sdfasdfsadfsadfsadf</p>', 'https://mall-file.putaocdn.com/largefile/6738e49bcf95d67661d5af6a1aec434616d316f7.png', '', 1543484709, 1543484709, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_article_category
-- ----------------------------
INSERT INTO `hc_article_category` VALUES (1, NULL, 'test33466666', 1, 1, 1530856697, 1);
INSERT INTO `hc_article_category` VALUES (2, NULL, 'qqq3', 2, 1529929603, 1530013983, 0);
INSERT INTO `hc_article_category` VALUES (3, NULL, '测试分类1', 2, 1529929695, 1529929695, 1);
INSERT INTO `hc_article_category` VALUES (4, NULL, '122777', 777, 1529931349, 1529931349, 1);
INSERT INTO `hc_article_category` VALUES (5, NULL, 'test', 1, 1530069472, 1530069472, 1);
INSERT INTO `hc_article_category` VALUES (6, NULL, '6666666', 3, 0, 1530857525, 0);

-- ----------------------------
-- Table structure for hc_comment_channel
-- ----------------------------
DROP TABLE IF EXISTS `hc_comment_channel`;
CREATE TABLE `hc_comment_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_sign` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '频道标识',
  `channel_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '频道名称',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态（0：不可用，1：可用）',
  `created` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updated` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `channel_sign`(`channel_sign`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_comment_channel
-- ----------------------------
INSERT INTO `hc_comment_channel` VALUES (1, 'acticle', '文章', 1, 0, 0);
INSERT INTO `hc_comment_channel` VALUES (2, 'shop', '店铺', 1, 0, 0);
INSERT INTO `hc_comment_channel` VALUES (3, 'product', '商品', 1, 0, 0);

-- ----------------------------
-- Table structure for hc_comment_comment
-- ----------------------------
DROP TABLE IF EXISTS `hc_comment_comment`;
CREATE TABLE `hc_comment_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `item_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论对象的频道(如:Acticle:文章;Shop:店铺;Product:商品;等)',
  `item_id` int(11) NOT NULL DEFAULT 0 COMMENT '评论对象的id(如:acticle_id:文章id;shop_id:店铺id;product_id:商品id;等)',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `author_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者名',
  `author_uid` int(11) NOT NULL COMMENT '作者ID',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '评论的状态（0，待审核；1，审核通过；2，审核不通过；9，草稿箱；）',
  `updated` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `created` int(11) NOT NULL DEFAULT 0 COMMENT '发表时间/创建时间',
  `is_top` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否需要置顶（0：COMMON，1：置顶）',
  `is_hot` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否需要热度标签（0：COMMON，1：热门）',
  `is_reply` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否已有回复（0：没有，1：有）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_type`(`item_type`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  CONSTRAINT `item_type` FOREIGN KEY (`item_type`) REFERENCES `hc_comment_channel` (`channel_sign`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_comment_comment
-- ----------------------------
INSERT INTO `hc_comment_comment` VALUES (1, 'acticle', 11, '这是对文章频道的测试评论22', '评论1', 100001, 1, 1540548133, 1540517642, 1, 0, 0);
INSERT INTO `hc_comment_comment` VALUES (2, 'acticle', 1, '这是对文章频道的测试评论2', '评论2', 100002, 2, 1540517817, 1540517817, 1, 0, 0);

-- ----------------------------
-- Table structure for hc_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `hc_comment_reply`;
CREATE TABLE `hc_comment_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL COMMENT '评论ID',
  `reply_type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '回复的类别（1：对评论直接回复，2：对回复的回复）',
  `reply_id` int(11) NOT NULL DEFAULT 0 COMMENT '回复的评论的id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复的内容',
  `reply_uid` int(11) NOT NULL COMMENT '被回复的UID',
  `reply_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '被回复的用户名',
  `author_uid` int(11) NOT NULL COMMENT '发表回复的UID',
  `author_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发表回复的用户名',
  `created` int(11) NOT NULL COMMENT '评论发表时间',
  `updated` int(11) NOT NULL COMMENT '评论更新时间',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '审核状态，0：待审核，1：审核通过，2：审核不通过',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_id`(`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_comment_reply
-- ----------------------------
INSERT INTO `hc_comment_reply` VALUES (1, 1, 1, 0, '测试回复数据1111', 0, '', 20001, '回复1', 1540779377, 1540782841, 1);
INSERT INTO `hc_comment_reply` VALUES (3, 1, 2, 1, '<p>测试回复1 update<br></p>', 20001, '回复1', 20003, '回复3', 1540783016, 1540791881, 0);

-- ----------------------------
-- Table structure for hc_document
-- ----------------------------
DROP TABLE IF EXISTS `hc_document`;
CREATE TABLE `hc_document`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT 0 COMMENT '项目id',
  `doc_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '版本号',
  `main_language` int(11) NULL DEFAULT NULL COMMENT '对应hc_language中的id 非外键约束',
  `currect` tinyint(1) NOT NULL DEFAULT 0 COMMENT '临时字段 为判断是否为当前推荐 1 currect 0 common',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '辅助排序值',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0 不现实 1显示 2 当前版本',
  `created` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updated` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_document
-- ----------------------------
INSERT INTO `hc_document` VALUES (1, 1, '1.0.X', 1, 0, 1, 1, 1545115383, 1545115383);
INSERT INTO `hc_document` VALUES (2, 1, '2.0', 1, 1, 2, 1, 1545115988, 1545115988);
INSERT INTO `hc_document` VALUES (3, 1, '2.2', 1, 0, 3, 0, 1545116355, 1545116355);
INSERT INTO `hc_document` VALUES (4, 2, '0.0.1', 1, 0, 1, 1, 1545115383, 1545115383);
INSERT INTO `hc_document` VALUES (5, 2, '0.0.7', 1, 0, 2, 0, 1545115988, 1545115988);
INSERT INTO `hc_document` VALUES (6, 2, '0.0.9', 1, 1, 3, 1, 1545116355, 1545116355);
INSERT INTO `hc_document` VALUES (7, 3, '0.10.1', 1, 0, 1, 0, 1545115383, 1545115383);
INSERT INTO `hc_document` VALUES (8, 3, '0.5.7', 1, 1, 2, 1, 1545115988, 1548066480);
INSERT INTO `hc_document` VALUES (9, 3, '0.3.9', 1, 0, 3, 0, 1545116355, 1548066480);
INSERT INTO `hc_document` VALUES (10, 1, 'v10.1', 1, 0, 0, 0, 1545902693, 1545902693);
INSERT INTO `hc_document` VALUES (11, 1, 'v100.1', 1, 0, 6, 0, 1547799261, 1547799261);
INSERT INTO `hc_document` VALUES (14, 1, '', 1, 0, 0, 0, 1548073323, 1548073323);
INSERT INTO `hc_document` VALUES (15, 4, 'v10.1sss', 1, 1, 333, 0, 1548073499, 1548074071);

-- ----------------------------
-- Table structure for hc_document_item
-- ----------------------------
DROP TABLE IF EXISTS `hc_document_item`;
CREATE TABLE `hc_document_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL DEFAULT 0 COMMENT '文档ID',
  `language_id` int(11) NULL DEFAULT NULL COMMENT '语言ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文档标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文档内容',
  `content_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 无效 1 有效',
  `created` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updated` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_document_item
-- ----------------------------
INSERT INTO `hc_document_item` VALUES (1, 1, 1, 'en title1', '[![Build Status](https://travis-ci.org/huntlabs/hunt.svg?branch=master)](https://travis-ci.org/huntlabs/hunt)\r\n\r\n# Hunt library\r\nA refined core library for D programming language.2222222\r\n\r\n## Modules\r\n * hunt.io ( TcpListener / TcpStream )\r\n * hunt.container (Java alike)\r\n * hunt.event ( kqueue / epoll / iocp )\r\n * hunt.lang\r\n * hunt.logging\r\n * hunt.math (BigIngeger etc.)\r\n * hunt.string\r\n * hunt.util (buffer configration memory radix-tree serialize timer etc.)\r\n * hunt.time (Compatible with Java java.time API design)\r\n\r\n## Platforms\r\n * FreeBSD\r\n * Windows\r\n * OSX\r\n * Linux\r\n\r\n## Libraries\r\n * [hunt-net](https://github.com/huntlabs/hunt-net) – An asynchronous event-driven network library written in D.\r\n\r\n## Frameworks\r\n * [hunt-framework](https://github.com/huntlabs/hunt-framework) – Hunt is a high-level D Programming Language Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.\r\n\r\n## Benchmarks\r\n![Benchmark](docs/images/benchmark.png)\r\n\r\nFor details, see [here](docs/benchmark.md).\r\n\r\n## Thanks\r\n * @shove70\r\n * @n8sh\r\n * @deviator\r\n * @jasonwhite\r\n * @Kripth\r\n\r\n## TODO\r\n- [ ] Improve performance\r\n- [ ] Stablize APIs\r\n- [ ] More friendly APIs\r\n- [ ] More examples\r\n- [ ] More common utils\r\n- [ ] Add concurrent modules\r\n\r\n', '<p><a href=\"https://travis-ci.org/huntlabs/hunt\"><img src=\"https://travis-ci.org/huntlabs/hunt.svg?branch=master\" alt=\"Build Status\"></a></p>\r\n<h1 id=\"hunt-library\">Hunt library</h1>\r\n<p>A refined core library for D programming language.2222222</p>\r\n<h2 id=\"modules\">Modules</h2>\r\n<ul>\r\n<li>hunt.io ( TcpListener / TcpStream )</li>\r\n<li>hunt.container (Java alike)</li>\r\n<li>hunt.event ( kqueue / epoll / iocp )</li>\r\n<li>hunt.lang</li>\r\n<li>hunt.logging</li>\r\n<li>hunt.math (BigIngeger etc.)</li>\r\n<li>hunt.string</li>\r\n<li>hunt.util (buffer configration memory radix-tree serialize timer etc.)</li>\r\n<li>hunt.time (Compatible with Java java.time API design)</li>\r\n</ul>\r\n<h2 id=\"platforms\">Platforms</h2>\r\n<ul>\r\n<li>FreeBSD</li>\r\n<li>Windows</li>\r\n<li>OSX</li>\r\n<li>Linux</li>\r\n</ul>\r\n<h2 id=\"libraries\">Libraries</h2>\r\n<ul>\r\n<li><a href=\"https://github.com/huntlabs/hunt-net\">hunt-net</a> – An asynchronous event-driven network library written in D.</li>\r\n</ul>\r\n<h2 id=\"frameworks\">Frameworks</h2>\r\n<ul>\r\n<li><a href=\"https://github.com/huntlabs/hunt-framework\">hunt-framework</a> – Hunt is a high-level D Programming Language Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.</li>\r\n</ul>\r\n<h2 id=\"benchmarks\">Benchmarks</h2>\r\n<p><img src=\"docs/images/benchmark.png\" alt=\"Benchmark\"></p>\r\n<p>For details, see <a href=\"docs/benchmark.md\">here</a>.</p>\r\n<h2 id=\"thanks\">Thanks</h2>\r\n<ul>\r\n<li>@shove70</li>\r\n<li>@n8sh</li>\r\n<li>@deviator</li>\r\n<li>@jasonwhite</li>\r\n<li>@Kripth</li>\r\n</ul>\r\n<h2 id=\"todo\">TODO</h2>\r\n<ul>\r\n<li>[ ] Improve performance</li>\r\n<li>[ ] Stablize APIs</li>\r\n<li>[ ] More friendly APIs</li>\r\n<li>[ ] More examples</li>\r\n<li>[ ] More common utils</li>\r\n<li>[ ] Add concurrent modules</li>\r\n</ul>\r\n', 1, 1545373366, 1547805360);
INSERT INTO `hc_document_item` VALUES (2, 2, 1, 'en title 2', ' ', 'sdfsdfsdf', 1, 1545373366, 1545373366);
INSERT INTO `hc_document_item` VALUES (3, 3, 1, 'en title3', 'content2 en', '<p>content2 en</p>\r\n', 1, 1545373366, 1547805132);
INSERT INTO `hc_document_item` VALUES (4, 4, 1, 'en title2-1', '[![Build Status](https://travis-ci.org/huntlabs/hunt.svg?branch=master)](https://travis-ci.org/huntlabs/hunt)\r\n\r\n# Hunt library\r\nA refined core library for D programming language.\r\n\r\n## Modules\r\n * hunt.io ( TcpListener / TcpStream )\r\n * hunt.container (Java alike)\r\n * hunt.event ( kqueue / epoll / iocp )\r\n * hunt.lang\r\n * hunt.logging\r\n * hunt.math (BigIngeger etc.)\r\n * hunt.string\r\n * hunt.util (buffer configration memory radix-tree serialize timer etc.)\r\n * hunt.time (Compatible with Java java.time API design)\r\n\r\n## Platforms\r\n * FreeBSD\r\n * Windows\r\n * OSX\r\n * Linux\r\n\r\n## Libraries\r\n * [hunt-net](https://github.com/huntlabs/hunt-net) – An asynchronous event-driven network library written in D.\r\n\r\n## Frameworks\r\n * [hunt-framework](https://github.com/huntlabs/hunt-framework) – Hunt is a high-level D Programming Language Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.\r\n\r\n## Benchmarks\r\n![Benchmark](docs/images/benchmark.png)\r\n\r\nFor details, see [here](docs/benchmark.md).\r\n\r\n## Thanks\r\n * @shove70\r\n * @n8sh\r\n * @deviator\r\n * @jasonwhite\r\n * @Kripth\r\n\r\n## TODO\r\n- [ ] Improve performance\r\n- [ ] Stablize APIs\r\n- [ ] More friendly APIs\r\n- [ ] More examples\r\n- [ ] More common utils\r\n- [ ] Add concurrent modules\r\n\r\n', '<p><a href=\"https://travis-ci.org/huntlabs/hunt\"><img src=\"https://travis-ci.org/huntlabs/hunt.svg?branch=master\" alt=\"Build Status\"></a></p>\r\n<h1 id=\"hunt-library\">Hunt library</h1>\r\n<p>A refined core library for D programming language.</p>\r\n<h2 id=\"modules\">Modules</h2>\r\n<ul>\r\n<li>hunt.io ( TcpListener / TcpStream )</li>\r\n<li>hunt.container (Java alike)</li>\r\n<li>hunt.event ( kqueue / epoll / iocp )</li>\r\n<li>hunt.lang</li>\r\n<li>hunt.logging</li>\r\n<li>hunt.math (BigIngeger etc.)</li>\r\n<li>hunt.string</li>\r\n<li>hunt.util (buffer configration memory radix-tree serialize timer etc.)</li>\r\n<li>hunt.time (Compatible with Java java.time API design)</li>\r\n</ul>\r\n<h2 id=\"platforms\">Platforms</h2>\r\n<ul>\r\n<li>FreeBSD</li>\r\n<li>Windows</li>\r\n<li>OSX</li>\r\n<li>Linux</li>\r\n</ul>\r\n<h2 id=\"libraries\">Libraries</h2>\r\n<ul>\r\n<li><a href=\"https://github.com/huntlabs/hunt-net\">hunt-net</a> – An asynchronous event-driven network library written in D.</li>\r\n</ul>\r\n<h2 id=\"frameworks\">Frameworks</h2>\r\n<ul>\r\n<li><a href=\"https://github.com/huntlabs/hunt-framework\">hunt-framework</a> – Hunt is a high-level D Programming Language Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.</li>\r\n</ul>\r\n<h2 id=\"benchmarks\">Benchmarks</h2>\r\n<p><img src=\"docs/images/benchmark.png\" alt=\"Benchmark\"></p>\r\n<p>For details, see <a href=\"docs/benchmark.md\">here</a>.</p>\r\n<h2 id=\"thanks\">Thanks</h2>\r\n<ul>\r\n<li>@shove70</li>\r\n<li>@n8sh</li>\r\n<li>@deviator</li>\r\n<li>@jasonwhite</li>\r\n<li>@Kripth</li>\r\n</ul>\r\n<h2 id=\"todo\">TODO</h2>\r\n<ul>\r\n<li>[ ] Improve performance</li>\r\n<li>[ ] Stablize APIs</li>\r\n<li>[ ] More friendly APIs</li>\r\n<li>[ ] More examples</li>\r\n<li>[ ] More common utils</li>\r\n<li>[ ] Add concurrent modules</li>\r\n</ul>\r\n', 1, 1545373366, 1546510505);
INSERT INTO `hc_document_item` VALUES (5, 2, 2, '中文标题', '中文内容', 'sdfsdfsdf', 1, 1545373366, 1545373366);
INSERT INTO `hc_document_item` VALUES (6, 5, 1, 'nnnnnn', 'xxxxxxxxxxxxxxxxxx', 'sdfsdfsdf', 1, 1545373366, 1545373366);
INSERT INTO `hc_document_item` VALUES (7, 6, 1, '4444444', 'rrrrrrrrrrrrrrrrrrrrrrrrrrrr士大夫士大夫撒地方撒地方阿斯顿法撒旦发士`大夫zcZczxczXczXczXC`\r\n# sdf asd fsadf sad fasdssdfsdf saadfdsd sd\r\n> sdf sd fsd fsdf dsf sf as fas \r\n* > ghfghfghfgh\r\n* * dfgdfgdgdfg\'\r\n* \'\'\'\'hgjhdfgsfg\r\n\r\n', '<p>rrrrrrrrrrrrrrrrrrrrrrrrrrrr士大夫士大夫撒地方撒地方阿斯顿法撒旦发士<code>大夫zcZczxczXczXczXC</code></p>\r\n<h1 id=\"sdf-asd-fsadf-sad-fasdssdfsdf-saadfdsd-sd\">sdf asd fsadf sad fasdssdfsdf saadfdsd sd</h1>\r\n<blockquote>\r\n<p>sdf sd fsd fsdf dsf sf as fas </p>\r\n<ul>\r\n<li><blockquote>\r\n<p>ghfghfghfgh</p>\r\n</blockquote>\r\n</li>\r\n<li><ul>\r\n<li>dfgdfgdgdfg&#39;</li>\r\n</ul>\r\n</li>\r\n<li>&#39;&#39;&#39;&#39;hgjhdfgsfg</li>\r\n</ul>\r\n</blockquote>\r\n', 1, 1545373366, 1546522605);
INSERT INTO `hc_document_item` VALUES (16, 10, 1, '新增/编辑主题', '> what\r\nsdfsadfasdfasdf asdfasd fasdf ', '<blockquote>\r\n<p>what<br>sdfsadfasdfasdf asdfasd fasdf </p>\r\n</blockquote>\r\n', 0, 1545901367, 1545901367);
INSERT INTO `hc_document_item` VALUES (17, 11, 1, '这是测试数据', '*斜体*\r\n~~123阿瑟帝国和~~\r\n# 方法发\r\n> 微软微软微软\r\n* 1111111\r\n* 2222222\r\n* 4444444\r\n1. aaaa\r\n2. bbbbbbbbbb', '<p><em>斜体</em><br><del>123阿瑟帝国和</del></p>\r\n<h1 id=\"-\">方法发</h1>\r\n<blockquote>\r\n<p>微软微软微软</p>\r\n<ul>\r\n<li>1111111</li>\r\n<li>2222222</li>\r\n<li>4444444</li>\r\n<li>aaaa</li>\r\n<li>bbbbbbbbbb</li>\r\n</ul>\r\n</blockquote>\r\n', 1, 1545987627, 1545987627);
INSERT INTO `hc_document_item` VALUES (29, 26, 1, 'nnnnnn', 'xxxxxxxxxxxxxxxxxx', '', 1, 1547802928, 1547802928);
INSERT INTO `hc_document_item` VALUES (30, 24, 1, 'en title3', 'content2 en', '', 1, 1547802928, 1547802928);
INSERT INTO `hc_document_item` VALUES (31, 28, 1, '新增/编辑主题', '> what\r\nsdfsadfasdfasdf asdfasd fasdf ', '', 0, 1547802928, 1547802928);
INSERT INTO `hc_document_item` VALUES (32, 27, 1, '4444444', 'rrrrrrrrrrrrrrrrrrrrrrrrrrrr士大夫士大夫撒地方撒地方阿斯顿法撒旦发士`大夫zcZczxczXczXczXC`\r\n# sdf asd fsadf sad fasdssdfsdf saadfdsd sd\r\n> sdf sd fsd fsdf dsf sf as fas \r\n* > ghfghfghfgh\r\n* * dfgdfgdgdfg\'\r\n* \'\'\'\'hgjhdfgsfg\r\n\r\n', '', 1, 1547802928, 1547802928);
INSERT INTO `hc_document_item` VALUES (33, 25, 1, 'en title2-1', '[![Build Status](https://travis-ci.org/huntlabs/hunt.svg?branch=master)](https://travis-ci.org/huntlabs/hunt)\r\n\r\n# Hunt library\r\nA refined core library for D programming language.\r\n\r\n## Modules\r\n * hunt.io ( TcpListener / TcpStream )\r\n * hunt.container (Java alike)\r\n * hunt.event ( kqueue / epoll / iocp )\r\n * hunt.lang\r\n * hunt.logging\r\n * hunt.math (BigIngeger etc.)\r\n * hunt.string\r\n * hunt.util (buffer configration memory radix-tree serialize timer etc.)\r\n * hunt.time (Compatible with Java java.time API design)\r\n\r\n## Platforms\r\n * FreeBSD\r\n * Windows\r\n * OSX\r\n * Linux\r\n\r\n## Libraries\r\n * [hunt-net](https://github.com/huntlabs/hunt-net) – An asynchronous event-driven network library written in D.\r\n\r\n## Frameworks\r\n * [hunt-framework](https://github.com/huntlabs/hunt-framework) – Hunt is a high-level D Programming Language Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.\r\n\r\n## Benchmarks\r\n![Benchmark](docs/images/benchmark.png)\r\n\r\nFor details, see [here](docs/benchmark.md).\r\n\r\n## Thanks\r\n * @shove70\r\n * @n8sh\r\n * @deviator\r\n * @jasonwhite\r\n * @Kripth\r\n\r\n## TODO\r\n- [ ] Improve performance\r\n- [ ] Stablize APIs\r\n- [ ] More friendly APIs\r\n- [ ] More examples\r\n- [ ] More common utils\r\n- [ ] Add concurrent modules\r\n\r\n', '', 1, 1547802928, 1547802928);
INSERT INTO `hc_document_item` VALUES (34, 23, 1, 'en title 2', ' ', '', 1, 1547802928, 1547802928);
INSERT INTO `hc_document_item` VALUES (35, 23, 2, '中文标题', '中文内容', '', 1, 1547802928, 1547802928);
INSERT INTO `hc_document_item` VALUES (36, 22, 1, 'en title1', '[![Build Status](https://travis-ci.org/huntlabs/hunt.svg?branch=master)](https://travis-ci.org/huntlabs/hunt)\r\n\r\n# Hunt library\r\nA refined core library for D programming language.2222222\r\n\r\n## Modules\r\n * hunt.io ( TcpListener / TcpStream )\r\n * hunt.container (Java alike)\r\n * hunt.event ( kqueue / epoll / iocp )\r\n * hunt.lang\r\n * hunt.logging\r\n * hunt.math (BigIngeger etc.)\r\n * hunt.string\r\n * hunt.util (buffer configration memory radix-tree serialize timer etc.)\r\n * hunt.time (Compatible with Java java.time API design)\r\n\r\n## Platforms\r\n * FreeBSD\r\n * Windows\r\n * OSX\r\n * Linux\r\n\r\n## Libraries\r\n * [hunt-net](https://github.com/huntlabs/hunt-net) – An asynchronous event-driven network library written in D.\r\n\r\n## Frameworks\r\n * [hunt-framework](https://github.com/huntlabs/hunt-framework) – Hunt is a high-level D Programming Language Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.\r\n\r\n## Benchmarks\r\n![Benchmark](docs/images/benchmark.png)\r\n\r\nFor details, see [here](docs/benchmark.md).\r\n\r\n## Thanks\r\n * @shove70\r\n * @n8sh\r\n * @deviator\r\n * @jasonwhite\r\n * @Kripth\r\n\r\n## TODO\r\n- [ ] Improve performance\r\n- [ ] Stablize APIs\r\n- [ ] More friendly APIs\r\n- [ ] More examples\r\n- [ ] More common utils\r\n- [ ] Add concurrent modules\r\n\r\n', '', 1, 1547802928, 1547802928);
INSERT INTO `hc_document_item` VALUES (37, 29, 1, '这是测试数据', '*斜体*\r\n~~123阿瑟帝国和~~\r\n# 方法发\r\n> 微软微软微软\r\n* 1111111\r\n* 2222222\r\n* 4444444\r\n1. aaaa\r\n2. bbbbbbbbbb', '', 1, 1548073323, 1548073323);
INSERT INTO `hc_document_item` VALUES (39, 31, 1, '这是第一个节点', '* 啊手动阀手动阀阿三法撒旦发士大夫撒旦阿斯顿\r\n* 阿斯顿法撒旦法撒旦f阿斯顿发士大夫\r\n* 啊发生的发生的发生\r\n* 阿迪斯发士大夫阿斯蒂芬\r\n\r\n# 阿斯蒂芬阿三发士大夫\r\n*撒打发士大夫阿斯蒂芬阿斯蒂芬阿斯顿f*\r\n', '<ul>\r\n<li>啊手动阀手动阀阿三法撒旦发士大夫撒旦阿斯顿</li>\r\n<li>阿斯顿法撒旦法撒旦f阿斯顿发士大夫</li>\r\n<li>啊发生的发生的发生</li>\r\n<li>阿迪斯发士大夫阿斯蒂芬</li>\r\n</ul>\r\n<h1 id=\"-\">阿斯蒂芬阿三发士大夫</h1>\r\n<p><em>撒打发士大夫阿斯蒂芬阿斯蒂芬阿斯顿f</em></p>\r\n', 1, 1548227137, 1548227137);
INSERT INTO `hc_document_item` VALUES (40, 32, 1, '测试一个子节点', '*  发士大夫阿斯顿法撒旦法撒旦十大\r\n*  阿斯顿法撒旦fsa撒旦发生f\r\n 啊的发射点发生阿三撒', '<ul>\r\n<li>发士大夫阿斯顿法撒旦法撒旦十大</li>\r\n<li>阿斯顿法撒旦fsa撒旦发生f<br>啊的发射点发生阿三撒</li>\r\n</ul>\r\n', 1, 1548228255, 1548228255);
INSERT INTO `hc_document_item` VALUES (41, 33, 1, '测试子节点2', '# 测试子节点2\r\n**测试子节点2**\r\n> 测试子节点2\r\n> 测试子节点2\r\n测试子节点2\r\n\r\n* 测试子节点2\r\n* 测试子节点2\r\n* 测试子节点2', '<h1 id=\"-2\">测试子节点2</h1>\r\n<p><strong>测试子节点2</strong></p>\r\n<blockquote>\r\n<p>测试子节点2<br>测试子节点2<br>测试子节点2</p>\r\n</blockquote>\r\n<ul>\r\n<li>测试子节点2</li>\r\n<li>测试子节点2</li>\r\n<li>测试子节点2</li>\r\n</ul>\r\n', 1, 1548233477, 1548233477);

-- ----------------------------
-- Table structure for hc_document_node
-- ----------------------------
DROP TABLE IF EXISTS `hc_document_node`;
CREATE TABLE `hc_document_node`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL DEFAULT 0 COMMENT '文档ID',
  `language_id` int(11) NOT NULL DEFAULT 0 COMMENT '对应语言ID',
  `parent_id` int(11) NOT NULL COMMENT '父级NODE ID',
  `sign_key` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'URL中的显示KEY',
  `is_node` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否为节点 0 仅标题 1 节点',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0 不显示 1 显示 2 推荐',
  `created` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updated` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_document_node
-- ----------------------------
INSERT INTO `hc_document_node` VALUES (1, 6, 1, 0, 'begin222111', 1, 1, 1, 1545373366, 1547805360);
INSERT INTO `hc_document_node` VALUES (2, 6, 1, 0, 'second', 0, 2, 1, 1545373366, 1545373366);
INSERT INTO `hc_document_node` VALUES (3, 6, 1, 0, 'third', 1, 3, 1, 1545373366, 1547805132);
INSERT INTO `hc_document_node` VALUES (4, 6, 1, 0, 'second-one', 0, 4, 1, 1545373366, 1546510505);
INSERT INTO `hc_document_node` VALUES (5, 6, 1, 2, 'second-2', 0, 5, 1, 1545373366, 1545373366);
INSERT INTO `hc_document_node` VALUES (6, 6, 1, 4, 'second-2-2', 1, 6, 1, 1545373366, 1546522605);
INSERT INTO `hc_document_node` VALUES (10, 6, 1, 4, 'ttttt', 0, 14, 1, 1545901367, 1545901367);
INSERT INTO `hc_document_node` VALUES (11, 2, 1, 0, 'test123', 0, 1, 1, 1545987627, 1545987627);
INSERT INTO `hc_document_node` VALUES (22, 6, 1, 0, 'begin222', 1, 1, 1, 1547802928, 1547802928);
INSERT INTO `hc_document_node` VALUES (23, 6, 1, 0, 'second', 0, 2, 1, 1547802928, 1547802928);
INSERT INTO `hc_document_node` VALUES (24, 6, 1, 0, 'third', 1, 3, 1, 1547802928, 1547802928);
INSERT INTO `hc_document_node` VALUES (25, 6, 1, 0, 'second-one', 0, 4, 1, 1547802928, 1547802928);
INSERT INTO `hc_document_node` VALUES (26, 6, 1, 2, 'second-2', 0, 5, 1, 1547802928, 1547802928);
INSERT INTO `hc_document_node` VALUES (27, 6, 1, 4, 'second-2-2', 1, 6, 1, 1547802928, 1547802928);
INSERT INTO `hc_document_node` VALUES (28, 6, 1, 4, 'ttttt', 0, 14, 1, 1547802928, 1547802928);
INSERT INTO `hc_document_node` VALUES (29, 14, 1, 0, 'test123', 1, 1, 1, 1548073323, 1548073323);
INSERT INTO `hc_document_node` VALUES (31, 15, 1, 0, '新节点0001', 0, 1, 1, 1548227137, 1548227137);
INSERT INTO `hc_document_node` VALUES (32, 15, 1, 31, 'kjljlkjlkj', 1, 2, 0, 1548228255, 1548228255);
INSERT INTO `hc_document_node` VALUES (33, 15, 1, 31, 'ask两地分居ask两地分居', 1, 3, 1, 1548233477, 1548233477);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'banner管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_portal_banner
-- ----------------------------
INSERT INTO `hc_portal_banner` VALUES (1, '/', '', NULL, NULL, 1, 0, NULL, NULL, NULL, 1, '', NULL);
INSERT INTO `hc_portal_banner` VALUES (2, 'Test', '23', '', '', 1, 0, 11, NULL, 11, 1, NULL, NULL);
INSERT INTO `hc_portal_banner` VALUES (3, 'PaiBot', 'test', 'http://192.168.32.129:8180/assets/admin/images/users/avatar-1.jpg', 'https://github.com/huntlabs/huntcms', 1, 0, 0, 1536658446, 1536651754, 1, '2', NULL);
INSERT INTO `hc_portal_banner` VALUES (4, '哈泥水族馆+', 'ads', 'http://192.168.32.129:8180/assets/admin/images/users/avatar-1.jpg', 'https://github.com/huntlabs/huntcms', 1, 1, 0, 1536657394, 1536657394, 2, 'PaiBot（64G）+', NULL);
INSERT INTO `hc_portal_banner` VALUES (5, 'abc', 'abd', 'http://192.168.32.129:8180/assets/admin/images/users/avatar-1.jpg', 'https://github.com/huntlabs/huntcms', 0, 5, 0, 1536741179, 1536741179, 1, '/', NULL);
INSERT INTO `hc_portal_banner` VALUES (6, 'PaiBot（64G）+aaa', 'aaaaaa', 'http://192.168.32.129:8180/assets/admin/images/users/avatar-1.jpg', 'https://github.com/huntlabs/huntcms', 0, 2, 0, 1536741196, 1536741196, 5, 'abc', NULL);
INSERT INTO `hc_portal_banner` VALUES (8, '哈泥水族馆+', 'abd', '', '1234', 0, 4, 0, 1536744711, 1536744711, 0, '', '123412');
INSERT INTO `hc_portal_banner` VALUES (9, 'test', 'test', '59.jpg', 'https://www.putao.com/product', 0, 2, 0, 1548321872, 1548321872, 0, '', 'test');
INSERT INTO `hc_portal_banner` VALUES (10, '动画片测试标题', '动画片测试子标题', '59.jpg', 'https://www.putao.com/product', 0, 4, 0, 1548658187, 1548658187, 0, '', 'test');

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_portal_menu
-- ----------------------------
INSERT INTO `hc_portal_menu` VALUES (1, '/', 1, NULL, NULL, NULL, '0', NULL, NULL, '1', NULL, NULL);
INSERT INTO `hc_portal_menu` VALUES (2, 'testg', 1, '/system/banners', 1, '', '1', 1530856697, 1530856697, '1', '', NULL);
INSERT INTO `hc_portal_menu` VALUES (3, 'Editor', 1, '/system/banners', 0, '', '2', 1536819320, 1536819320, '1', 'a', '');
INSERT INTO `hc_portal_menu` VALUES (4, 'banner', 1, '/system/tags', 0, '', '1', 1536819435, 1536819435, '1', 'aaa', '');
INSERT INTO `hc_portal_menu` VALUES (5, 'hello', 1, '/system/frontmenu/list', 0, '', '2', 1536819508, 1536824487, '1', 'ffffffffffff', '');
INSERT INTO `hc_portal_menu` VALUES (6, 'banner', 0, '/system/tags', 0, '', '1', 1536819720, 1536819720, '1', 'a', '');
INSERT INTO `hc_portal_menu` VALUES (17, 'Editor', 5, '/system/banners', 0, '', '4', 1536825177, 1536825177, '1', 'ffffffffffff', '');
INSERT INTO `hc_portal_menu` VALUES (19, 'banner', 3, '/system/banners', 0, '', '4', 1536835330, 1536835330, '1', 'a', 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png');
INSERT INTO `hc_portal_menu` VALUES (20, 'hello', 3, '/system/banners', 0, '', '3', 1536839871, 1536839871, '1', 'aaa', 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png');

-- ----------------------------
-- Table structure for hc_portal_promotion
-- ----------------------------
DROP TABLE IF EXISTS `hc_portal_promotion`;
CREATE TABLE `hc_portal_promotion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('type-one','type-two','type-three','type-four') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modules` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '子模块组',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `updated` int(11) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  `status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_portal_promotion
-- ----------------------------
INSERT INTO `hc_portal_promotion` VALUES (1, 'PaiBot?64G?+', 'asdfa', 'asdfasdfa', 'type-two', '[[\"isnew\":\"0\", \"subtitle\":\"asdfasdf\", \"title\":\"dafas\", \"link_url\":\"adsfasdf\", \"sort\":\"1\"],[\"isnew\":\"0\", \"subtitle\":\"asdfas\", \"title\":\"dfgaf\", \"link_url\":\"qwerqwe\", \"sort\":\"\"]]', '123412', 5, 1536927018, 1536927018, '1');
INSERT INTO `hc_portal_promotion` VALUES (2, 'Hello??+', 'ads', 'asdfasdfa', 'type-one', '[[\"isnew\":\"0\", \"subtitle\":\"asdfasdf\", \"title\":\"dafas\", \"link_url\":\"adsfasdf\", \"sort\":\"132\"],[\"isnew\":\"0\", \"subtitle\":\"asdfas\", \"title\":\"dfgaf\", \"link_url\":\"qwerqwe\", \"sort\":\"\"]]', '123412', 3, 1536927642, 1536927642, '1');
INSERT INTO `hc_portal_promotion` VALUES (3, 'Hello?? ', 'asdfa', 'asdfasdfa', 'type-two', '[[\"link_url\":\"adsfasdf\", \"isnew\":\"0\", \"sort\":\"1\", \"title\":\"dafas\", \"subtitle\":\"asdfasdf\", \"picurl_front\":\"https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\", \"picurl_back\":\"https://mall-file.putaocdn.com/largefil', '123412', 3, 1536927785, 1536927785, '1');
INSERT INTO `hc_portal_promotion` VALUES (4, 'PaiBot?64G? ', 'ads', 'asdfasdfa', 'type-four', '{\"submodule0\":{\"isnew\":\"\",\"link_url\":\"\",\"sort\":\"\",\"subtitle\":\"\",\"title\":\"\"},\"submodule1\":{\"isnew\":\"0\",\"link_url\":\"adsfasdf\",\"picurl_back\":\"https:\\/\\/mall-file.putaocdn.com\\/largefile\\/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\",\"sort\":\"1\",\"subtit', 'asdfas', 2, 1537001586, 1537001586, '1');
INSERT INTO `hc_portal_promotion` VALUES (5, 'PaiBot ', 'asdfa', 'asdfasdfa', 'type-three', '{\"submodule0\":{\"isnew\":\"\",\"link_url\":\"\",\"sort\":\"\",\"subtitle\":\"\",\"title\":\"\"},\"submodule1\":{\"isnew\":\"0\",\"link_url\":\"adsfasdf\",\"picurl_back\":\"https:\\/\\/mall-file.putaocdn.com\\/largefile\\/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\",\"sort\":\"1\",\"subtit', 'asdfas', 2, 1537001660, 1537001660, '1');
INSERT INTO `hc_portal_promotion` VALUES (6, '????? a', 'abd', 'asdfasdfa', 'type-three', '{\"submodule1\":{\"isnew\":\"0\",\"link_url\":\"adsfasdf\",\"picurl_back\":\"https:\\/\\/mall-file.putaocdn.com\\/largefile\\/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png\",\"sort\":\"12\",\"subtitle\":\"????\",\"title\":\"asd\"},\"submodule2\":{\"isnew\":\"0\",\"link_url\":\"qwerqwe\",\"', 'asdfas', 4, 1537001746, 1537001746, '1');

-- ----------------------------
-- Table structure for hc_project
-- ----------------------------
DROP TABLE IF EXISTS `hc_project`;
CREATE TABLE `hc_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '拼接在URL中的值',
  `logo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目LOGO图片地址',
  `main_language` int(11) NOT NULL DEFAULT 0 COMMENT '主要语言',
  `introduction` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目一句话简介',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目详细介绍 适用于单页',
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细介绍html',
  `git_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目GIT地址',
  `last_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后版本号',
  `release_date` date NULL DEFAULT NULL COMMENT '发布日期',
  `forum_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '对应论坛地址',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '显示排序',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态：1 可用 0 禁用',
  `created` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updated` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_project
-- ----------------------------
INSERT INTO `hc_project` VALUES (1, 'project_1', 'pro_test_11', 'https://mall-file.putaocdn.com/largefile/8e1e924341bd088e72aa8c392b54131867864b25.png', 1, 'Huntisahigh-levelDProgrammingLanguageWebframeworkthatencouragesrapiddevelopmentandclean,pragmaticdesign.Itletsyoubuildhigh-performanceWebapplicationsquicklyandeasily.', '[![Build Status](https://travis-ci.org/huntlabs/hunt.svg?branch=master)](https://travis-ci.org/huntlabs/hunt)\r\n\r\n# Hunt library\r\nA refined core library for D programming language.\r\n\r\n## Modules\r\n * hunt.io ( TcpListener / TcpStream )\r\n * hunt.container (Java alike)\r\n * hunt.event ( kqueue / epoll / iocp )\r\n * hunt.lang\r\n * hunt.logging\r\n * hunt.math (BigIngeger etc.)\r\n * hunt.string\r\n * hunt.util (buffer configration memory radix-tree serialize timer etc.)\r\n * hunt.time (Compatible with Java java.time API design)\r\n\r\n## Platforms\r\n * FreeBSD\r\n * Windows\r\n * OSX\r\n * Linux\r\n\r\n## Libraries\r\n * [hunt-net](https://github.com/huntlabs/hunt-net) – An asynchronous event-driven network library written in D.\r\n\r\n## Frameworks\r\n * [hunt-framework](https://github.com/huntlabs/hunt-framework) – Hunt is a high-level D Programming Language Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.\r\n\r\n## Benchmarks\r\n![Benchmark](docs44/images/benchmark.png)\r\n\r\nFor details, see [here](docs/benchmark.md).\r\n\r\n## Thanks\r\n * @shove70\r\n * @n8sh\r\n * @deviator\r\n * @jasonwhite\r\n * @Kripth\r\n\r\n## TODO\r\n- [ ] Improve performance\r\n- [ ] Stablize APIs\r\n- [ ] More friendly APIs\r\n- [ ] More examples\r\n- [ ] More common utils\r\n- [ ] Add concurrent modules\r\n\r\n', '<p><a href=\"https://travis-ci.org/huntlabs/hunt\"><img src=\"https://travis-ci.org/huntlabs/hunt.svg?branch=master\" alt=\"Build Status\"></a></p>\r\n<h1 id=\"hunt-library\">Hunt library</h1>\r\n<p>A refined core library for D programming language.</p>\r\n<h2 id=\"modules\">Modules</h2>\r\n<ul>\r\n<li>hunt.io ( TcpListener / TcpStream )</li>\r\n<li>hunt.container (Java alike)</li>\r\n<li>hunt.event ( kqueue / epoll / iocp )</li>\r\n<li>hunt.lang</li>\r\n<li>hunt.logging</li>\r\n<li>hunt.math (BigIngeger etc.)</li>\r\n<li>hunt.string</li>\r\n<li>hunt.util (buffer configration memory radix-tree serialize timer etc.)</li>\r\n<li>hunt.time (Compatible with Java java.time API design)</li>\r\n</ul>\r\n<h2 id=\"platforms\">Platforms</h2>\r\n<ul>\r\n<li>FreeBSD</li>\r\n<li>Windows</li>\r\n<li>OSX</li>\r\n<li>Linux</li>\r\n</ul>\r\n<h2 id=\"libraries\">Libraries</h2>\r\n<ul>\r\n<li><a href=\"https://github.com/huntlabs/hunt-net\">hunt-net</a> – An asynchronous event-driven network library written in D.</li>\r\n</ul>\r\n<h2 id=\"frameworks\">Frameworks</h2>\r\n<ul>\r\n<li><a href=\"https://github.com/huntlabs/hunt-framework\">hunt-framework</a> – Hunt is a high-level D Programming Language Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.</li>\r\n</ul>\r\n<h2 id=\"benchmarks\">Benchmarks</h2>\r\n<p><img src=\"docs44/images/benchmark.png\" alt=\"Benchmark\"></p>\r\n<p>For details, see <a href=\"docs/benchmark.md\">here</a>.</p>\r\n<h2 id=\"thanks\">Thanks</h2>\r\n<ul>\r\n<li>@shove70</li>\r\n<li>@n8sh</li>\r\n<li>@deviator</li>\r\n<li>@jasonwhite</li>\r\n<li>@Kripth</li>\r\n</ul>\r\n<h2 id=\"todo\">TODO</h2>\r\n<ul>\r\n<li>[ ] Improve performance</li>\r\n<li>[ ] Stablize APIs</li>\r\n<li>[ ] More friendly APIs</li>\r\n<li>[ ] More examples</li>\r\n<li>[ ] More common utils</li>\r\n<li>[ ] Add concurrent modules</li>\r\n</ul>\r\n', 'https://github.com/huntlabs', '1.0.1', '2018-12-18', 'xxxxxxxxxxx', 1, '1', 0, 1547795812);
INSERT INTO `hc_project` VALUES (2, '测试PROJECT_2', 'pro_test_2', 'https://avatars2.githubusercontent.com/u/17018949?s=200&v=4', 1, 'Hunt is a high-level D Programming Language Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.', '2222222222', '', 'https://github.com/huntlabs', '0.0.5', '2018-12-04', 'xxxxxx', 1, '1', 0, 0);
INSERT INTO `hc_project` VALUES (3, '测试PROJECT_3', 'pro_test_3', 'https://avatars2.githubusercontent.com/u/17018949?s=200&v=4', 1, 'Hunt is a high-level D Programming Language Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.', '3333333333', '', 'https://github.com/huntlabs', '0.0.5', '2018-12-04', 'xxxxxx', 1, '1', 0, 0);
INSERT INTO `hc_project` VALUES (4, '1111', '22222', 'https://mall-file.putaocdn.com/largefile/2228f65f794fe0519cbdf4adc022208162d8c895.png', 1, '44444', '44444', '<p>44444</p>\r\n', 'https://github.com/huntlabs/hunt-framework/wiki/Validation', '777775', '2019-02-28', 'https://github.com/huntlabs/hunt-framework/wiki/Validation', 2, '0', 1548041249, 1548063734);

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
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_shop_product
-- ----------------------------
INSERT INTO `hc_shop_product` VALUES (1, 2, 'pt1234', '淘淘冲锋车', '淘淘冲锋车', 0, 99, 299, '<blockquote style=\"margin-bottom: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left: 3px solid rgb(219, 219, 219); color: rgb(51, 51, 51); font-size: 17px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 0.544px; line-height: 27.2px; text-align: justify; widows: 1; word-wrap: break-word !important;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; color: rgb(136, 136, 136); word-wrap: break-word !important;\"><font face=\"Tahoma\">不知道有多少人想买车，几年摇号都没中奖，拍牌又觉得太贵，一直和车子处于“暗恋”阶段，心里OS总是觉得买车很难，但受罪的不止是我们，还有很多地方跟我们一样，连买车都是一件奢侈的事情。看完这篇文章，可能会刷新你对“买车难”的理解</font></span></p></blockquote>', 1, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (2, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (3, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (4, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (5, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (6, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (7, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (8, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (9, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (10, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (11, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (12, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (13, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (14, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (15, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (16, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (17, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (18, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (19, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (20, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (21, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (22, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (23, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (24, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (25, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (26, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (27, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (28, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (29, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (30, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (31, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (32, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (33, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (34, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (35, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (36, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (37, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (38, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (39, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (40, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (41, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (42, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (43, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (44, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (45, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (46, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (47, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (48, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (49, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (50, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (51, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (52, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (53, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (54, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (55, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (56, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (57, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (58, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (59, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (60, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (61, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (62, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (63, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (64, 2, 'pt1234', '百变布鲁克', '遥控科技积木', 0, 99, 299, '商品介绍', 0, '', '', '', '', '', 0, 0, NULL, NULL);
INSERT INTO `hc_shop_product` VALUES (66, 1, '1', '1', '1', 0, 100, 200, '<p>123</p>', 0, '', '', '', '', '', 0, 0, 0, 0);
INSERT INTO `hc_shop_product` VALUES (67, 2, '111', 'PaiBotï¼64Gï¼ ', '111111', 0, 100, 200, '', 0, 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png', '', '', '', '', 0, 0, 1536903447, 1536903447);
INSERT INTO `hc_shop_product` VALUES (68, 1, '2222222', 'aaaaaaaaaaaaaaaaaaaaaa', '14513', 0, 100, 300, '', 0, 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png', 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png', 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png', '', '', 0, 0, 1536904833, 1536904833);
INSERT INTO `hc_shop_product` VALUES (69, 1, '123', 'åæ³¥æ°´æé¦ ', 'adfasd', 0, 100, 200, '', 0, 'https://mall-file.putaocdn.com/largefile/2c0e727277fa8d99bd5a428a026e0d051d09158d_nodown.png', 'https://mall-file.putaocdn.com/largefile/f0a5c2f8461aa293f68cd009ba4a35bc0391a7df_nodown.png', 'https://mall-file.putaocdn.com/largefile/737363a50c82a7313654f8667a67d947b5d48225_nodown.png', '', '', 0, 0, 1536905414, 1536905414);
INSERT INTO `hc_shop_product` VALUES (71, 8, '111', 'PaiBot ', '111111', 0, 100, 300, '<p>123</p>', 0, 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png', 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png', 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png', '', '', 0, 0, 1536906782, 1536906782);
INSERT INTO `hc_shop_product` VALUES (72, 1, '2222222', 'Helloç¼ç¨ ', '123', 0, 100, 2300, '<p>1</p>', 0, 'https://mall-file.putaocdn.com/largefile/2c0e727277fa8d99bd5a428a026e0d051d09158d_nodown.png', 'https://mall-file.putaocdn.com/largefile/2c0e727277fa8d99bd5a428a026e0d051d09158d_nodown.png', 'https://mall-file.putaocdn.com/largefile/2c0e727277fa8d99bd5a428a026e0d051d09158d_nodown.png', '', '', 0, 0, 1536907316, 1536907316);
INSERT INTO `hc_shop_product` VALUES (73, 1, '111', 'Helloç¼ç¨ ', '14513', 0, 100, 2300, '<p>1233334</p>', 0, '', '', '', '', '', 0, 0, 1536907385, 1536907385);
INSERT INTO `hc_shop_product` VALUES (74, 1, 'aaa', 'PaiBotï¼64Gï¼ 1', '14513', 0, 12300, 333300, '<p>a</p>', 0, 'https://mall-file.putaocdn.com/largefile/a706556d9935d58e4b51b0af5a2b7fff3f0288bd_nodown.png', '', '', '', '', 0, 0, 1536911286, 1536911286);
INSERT INTO `hc_shop_product` VALUES (75, 1, 'aaa', 'Helloç¼ç¨ ', '14513', 0, 100, 2300, '', 0, '', '', '', '', '', 0, 0, 1536911372, 1536911372);
INSERT INTO `hc_shop_product` VALUES (76, 1, 'aaa', 'PaiBotï¼64Gï¼ 132', '1234', 0, 1230000, 5550000, '<p>aasdfasdf</p>', 0, '', '', '', '', '[\"https://mall-file.putaocdn.com/largefile/2c0e727277fa8d99bd5a428a026e0d051d09158d_nodown.png\", \"https://mall-file.putaocdn.com/largefile/f0a5c2f8461aa293f68cd009ba4a35bc0391a7df_nodown.png\", \"https://mall-file.putaocdn.com/largefile/e4a3fb02f68b16a0b113eafb9b7c0ad928d9cb20_nodown.png\", \"\", \"\"]', 0, 0, 1536912489, 1536912191);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_shop_product_category
-- ----------------------------
INSERT INTO `hc_shop_product_category` VALUES (1, '积木1', '', '', 1, 1, 0, 1, 1, 0, 1530856697, 1537003622);
INSERT INTO `hc_shop_product_category` VALUES (2, '科技积木1', '', '', 1, 1, 1, 2, 1, 0, 1530856697, 1536829762);
INSERT INTO `hc_shop_product_category` VALUES (3, '科技玩具', NULL, NULL, 1, 1, 1, 2, 1, 0, 1530856697, 1530856697);
INSERT INTO `hc_shop_product_category` VALUES (8, '遥控积木', '', '', 0, 1, 1, 2, 0, 0, 1536823618, 1536823618);
INSERT INTO `hc_shop_product_category` VALUES (11, '123123', '', '', 0, 0, 8, 3, 0, 0, 1536921001, 1536921001);
INSERT INTO `hc_shop_product_category` VALUES (13, 'tttttt', '', '', 1, 0, 0, 1, 1, 0, 1537003664, 1537003664);
INSERT INTO `hc_shop_product_category` VALUES (14, 'test', '', '', 0, 0, 1, 2, 1, 0, 1537003680, 1537003680);

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
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品关联属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_shop_product_relation_property
-- ----------------------------
INSERT INTO `hc_shop_product_relation_property` VALUES (23, 1, 3, 13, '', 1537003782, 1537003782);
INSERT INTO `hc_shop_product_relation_property` VALUES (24, 1, 3, 14, '', 1537003782, 1537003782);
INSERT INTO `hc_shop_product_relation_property` VALUES (25, 1, 3, 15, '', 1537003782, 1537003782);
INSERT INTO `hc_shop_product_relation_property` VALUES (26, 1, 1, 0, 'test1', 1537003782, 1537003782);
INSERT INTO `hc_shop_product_relation_property` VALUES (27, 1, 2, 6, '', 1537003782, 1537003782);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_shop_product_type
-- ----------------------------
INSERT INTO `hc_shop_product_type` VALUES (1, '科技积木玩具', 0, 1536738557, 1);
INSERT INTO `hc_shop_product_type` VALUES (4, '滴滴的', 0, 1536747857, 1);
INSERT INTO `hc_shop_product_type` VALUES (6, '12312', 0, 1536738015, 1536737950);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性表(最多2层分级)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_shop_property
-- ----------------------------
INSERT INTO `hc_shop_property` VALUES (1, '主题', '积木系列主题', 1, 0, 0, 1, NULL, 1536648677, 1536648677);
INSERT INTO `hc_shop_property` VALUES (2, '类型', '积木属于哪类物品', 1, 0, 1, 1, NULL, 1536648677, 1536648677);
INSERT INTO `hc_shop_property` VALUES (3, '适用年龄', '年龄段', 1, 0, 2, 1, NULL, 1536648677, 1536648677);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类别对应的属性筛选配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_shop_property_filter
-- ----------------------------
INSERT INTO `hc_shop_property_filter` VALUES (1, 1, '主题', '1,2,3,4', 1, 1536919627, 1536648677);
INSERT INTO `hc_shop_property_filter` VALUES (2, 1, '类型', '5,6,7', 2, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_filter` VALUES (3, 1, '试用年龄', '13,14,15,16', 3, 1536648677, 1536648677);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性值关联属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_shop_property_option
-- ----------------------------
INSERT INTO `hc_shop_property_option` VALUES (1, 1, '百变布鲁可系列', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (2, 1, '星际探索系列', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (3, 1, 'NOOVA系列', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (4, 1, '哆啦A梦系列', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (5, 2, '飞机', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (6, 2, '汽车', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (7, 2, '火箭', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (8, 2, '建筑', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (9, 2, '机器人', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (10, 2, '摩托车', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (11, 2, '动物', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (12, 2, '家具', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (13, 3, '1.5-3岁', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (14, 3, '3-4岁', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (15, 3, '4-6岁', 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_property_option` VALUES (16, 3, '6-9岁', 1, 1, 1536648677, 1536648677);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类别关联商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_shop_type_relation_property
-- ----------------------------
INSERT INTO `hc_shop_type_relation_property` VALUES (1, 1, 1, 1, 1536648677, 1536648677);
INSERT INTO `hc_shop_type_relation_property` VALUES (3, 1, 3, 3, 1536648677, 1536648677);
INSERT INTO `hc_shop_type_relation_property` VALUES (4, 1, 2, 1, 1536747470, 1536747470);

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
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_file_info
-- ----------------------------
INSERT INTO `hc_system_file_info` VALUES (1, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536809901, 1536809901);
INSERT INTO `hc_system_file_info` VALUES (2, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536810044, 1536810044);
INSERT INTO `hc_system_file_info` VALUES (3, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536810084, 1536810084);
INSERT INTO `hc_system_file_info` VALUES (4, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536810178, 1536810178);
INSERT INTO `hc_system_file_info` VALUES (5, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536823120, 1536823120);
INSERT INTO `hc_system_file_info` VALUES (6, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536824419, 1536824419);
INSERT INTO `hc_system_file_info` VALUES (7, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536824468, 1536824468);
INSERT INTO `hc_system_file_info` VALUES (8, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536824852, 1536824852);
INSERT INTO `hc_system_file_info` VALUES (9, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536825149, 1536825149);
INSERT INTO `hc_system_file_info` VALUES (10, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536829019, 1536829019);
INSERT INTO `hc_system_file_info` VALUES (11, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536833367, 1536833367);
INSERT INTO `hc_system_file_info` VALUES (12, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536835330, 1536835330);
INSERT INTO `hc_system_file_info` VALUES (13, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536839871, 1536839871);
INSERT INTO `hc_system_file_info` VALUES (14, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536840078, 1536840078);
INSERT INTO `hc_system_file_info` VALUES (15, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536840090, 1536840090);
INSERT INTO `hc_system_file_info` VALUES (16, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536840178, 1536840178);
INSERT INTO `hc_system_file_info` VALUES (17, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536842042, 1536842042);
INSERT INTO `hc_system_file_info` VALUES (18, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536842065, 1536842065);
INSERT INTO `hc_system_file_info` VALUES (19, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536842081, 1536842081);
INSERT INTO `hc_system_file_info` VALUES (20, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536842200, 1536842200);
INSERT INTO `hc_system_file_info` VALUES (21, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536842242, 1536842242);
INSERT INTO `hc_system_file_info` VALUES (22, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536842265, 1536842265);
INSERT INTO `hc_system_file_info` VALUES (23, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536842285, 1536842285);
INSERT INTO `hc_system_file_info` VALUES (24, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536842294, 1536842294);
INSERT INTO `hc_system_file_info` VALUES (25, 101, 'dlangchina.png', '', 'A706556D9935D58E4B51B0AF5A2B7FFF3F0288BD', '', 'image/png', 1677, 1536842298, 1536842298);
INSERT INTO `hc_system_file_info` VALUES (26, 99, 'pic1.jpg', '', '414A913D3BE928CC96DE73F5971F4F9FCBBBF2F1', '', 'image/jpeg', 40850, 1536846328, 1536846328);
INSERT INTO `hc_system_file_info` VALUES (27, 0, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543289413, 1543289413);
INSERT INTO `hc_system_file_info` VALUES (28, 0, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543289698, 1543289698);
INSERT INTO `hc_system_file_info` VALUES (29, 0, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543290018, 1543290018);
INSERT INTO `hc_system_file_info` VALUES (30, 0, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543298002, 1543298002);
INSERT INTO `hc_system_file_info` VALUES (31, 0, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543298313, 1543298313);
INSERT INTO `hc_system_file_info` VALUES (32, 0, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543298454, 1543298454);
INSERT INTO `hc_system_file_info` VALUES (33, 0, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543298755, 1543298755);
INSERT INTO `hc_system_file_info` VALUES (34, 0, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543301310, 1543301310);
INSERT INTO `hc_system_file_info` VALUES (35, 0, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543302052, 1543302052);
INSERT INTO `hc_system_file_info` VALUES (36, 0, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543302108, 1543302108);
INSERT INTO `hc_system_file_info` VALUES (37, 0, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543302183, 1543302183);
INSERT INTO `hc_system_file_info` VALUES (38, 0, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543302209, 1543302209);
INSERT INTO `hc_system_file_info` VALUES (39, 0, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543302635, 1543302635);
INSERT INTO `hc_system_file_info` VALUES (40, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543302983, 1543302983);
INSERT INTO `hc_system_file_info` VALUES (41, 99, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543303005, 1543303005);
INSERT INTO `hc_system_file_info` VALUES (42, 99, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543304349, 1543304349);
INSERT INTO `hc_system_file_info` VALUES (43, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543304367, 1543304367);
INSERT INTO `hc_system_file_info` VALUES (44, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543304402, 1543304402);
INSERT INTO `hc_system_file_info` VALUES (45, 99, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543304599, 1543304599);
INSERT INTO `hc_system_file_info` VALUES (46, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543304754, 1543304754);
INSERT INTO `hc_system_file_info` VALUES (47, 99, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543305250, 1543305250);
INSERT INTO `hc_system_file_info` VALUES (48, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543305270, 1543305270);
INSERT INTO `hc_system_file_info` VALUES (49, 99, '59.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 128674, 1543305343, 1543305343);
INSERT INTO `hc_system_file_info` VALUES (50, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543305475, 1543305475);
INSERT INTO `hc_system_file_info` VALUES (51, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543306069, 1543306069);
INSERT INTO `hc_system_file_info` VALUES (52, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543306270, 1543306270);
INSERT INTO `hc_system_file_info` VALUES (53, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543394282, 1543394282);
INSERT INTO `hc_system_file_info` VALUES (54, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543394497, 1543394497);
INSERT INTO `hc_system_file_info` VALUES (55, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543395501, 1543395501);
INSERT INTO `hc_system_file_info` VALUES (56, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543401067, 1543401067);
INSERT INTO `hc_system_file_info` VALUES (57, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543461743, 1543461743);
INSERT INTO `hc_system_file_info` VALUES (58, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543471450, 1543471450);
INSERT INTO `hc_system_file_info` VALUES (59, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543471488, 1543471488);
INSERT INTO `hc_system_file_info` VALUES (60, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543471702, 1543471702);
INSERT INTO `hc_system_file_info` VALUES (61, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543474488, 1543474488);
INSERT INTO `hc_system_file_info` VALUES (62, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543474721, 1543474721);
INSERT INTO `hc_system_file_info` VALUES (63, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543475005, 1543475005);
INSERT INTO `hc_system_file_info` VALUES (64, 99, '58.jpg', '', 'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', '', 'image/jpeg', 55000, 1543477519, 1543477519);
INSERT INTO `hc_system_file_info` VALUES (65, 99, '58.jpg', '', '6738E49BCF95D67661D5AF6A1AEC434616D316F7', '', 'image/jpeg', 55000, 1543477974, 1543477974);
INSERT INTO `hc_system_file_info` VALUES (66, 99, '58.jpg', '', '6738E49BCF95D67661D5AF6A1AEC434616D316F7', '', 'image/jpeg', 55000, 1543479106, 1543479106);
INSERT INTO `hc_system_file_info` VALUES (67, 99, '58.jpg', '', '6738E49BCF95D67661D5AF6A1AEC434616D316F7', '', 'image/jpeg', 55000, 1543481132, 1543481132);
INSERT INTO `hc_system_file_info` VALUES (68, 99, '58.jpg', '', '6738E49BCF95D67661D5AF6A1AEC434616D316F7', '', 'image/jpeg', 55000, 1543481449, 1543481449);
INSERT INTO `hc_system_file_info` VALUES (69, 99, '58.jpg', '', '6738E49BCF95D67661D5AF6A1AEC434616D316F7', '', 'image/jpeg', 55000, 1543481494, 1543481494);
INSERT INTO `hc_system_file_info` VALUES (70, 99, '58.jpg', '', '6738E49BCF95D67661D5AF6A1AEC434616D316F7', '', 'image/jpeg', 55000, 1543481539, 1543481539);
INSERT INTO `hc_system_file_info` VALUES (71, 99, '58.jpg', '', '6738E49BCF95D67661D5AF6A1AEC434616D316F7', '', 'image/jpeg', 55000, 1543481692, 1543481692);
INSERT INTO `hc_system_file_info` VALUES (72, 99, '58.jpg', '', '6738E49BCF95D67661D5AF6A1AEC434616D316F7', '', 'image/jpeg', 55000, 1543482544, 1543482544);
INSERT INTO `hc_system_file_info` VALUES (73, 99, '58.jpg', '', '6738E49BCF95D67661D5AF6A1AEC434616D316F7', '', 'image/jpeg', 55000, 1543482586, 1543482586);
INSERT INTO `hc_system_file_info` VALUES (74, 99, '58.jpg', '', '6738E49BCF95D67661D5AF6A1AEC434616D316F7', '', 'image/jpeg', 55000, 1543484688, 1543484688);

-- ----------------------------
-- Table structure for hc_system_lang_package
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_lang_package`;
CREATE TABLE `hc_system_lang_package`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  `updated` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_lang_package
-- ----------------------------
INSERT INTO `hc_system_lang_package` VALUES (1, 'zh-cn', 'TEST', '测试', 1557392339, 1557392339, 0);
INSERT INTO `hc_system_lang_package` VALUES (2, 'en', 'TEST', 'test123', 1557392352, 1557392816, 0);
INSERT INTO `hc_system_lang_package` VALUES (5, 'zh-cn', 'DEL', '删除', 1557399191, 1557399191, 0);
INSERT INTO `hc_system_lang_package` VALUES (7, 'zh-cn', '__SYSTEM_MENU_SYSTEM_LANGPACKAGE_LIST', '语言包系统定义TEST', 1557482466, 1557482466, 0);
INSERT INTO `hc_system_lang_package` VALUES (8, 'en', '__SYSTEM_MENU_SYSTEM_LANGPACKAGE_ADD', '语言包系统定义TEST', 1557714176, 1557714176, 0);
INSERT INTO `hc_system_lang_package` VALUES (9, 'en', '__SYSTEM_MENU_SYSTEM_LANGPACKAGE_ADD', '语言包系统定义TEST', 1558078734, 1558078734, 0);
INSERT INTO `hc_system_lang_package` VALUES (10, 'en', '__SYSTEM_MENU_38', '语言包系统定义TEST', 1558337985, 1558337985, 0);
INSERT INTO `hc_system_lang_package` VALUES (11, 'zh-cn', '__SYSTEM_MENU_38', '语言包系统定义TEST21', 1558344546, 1558344712, 0);
INSERT INTO `hc_system_lang_package` VALUES (13, 'zh-hk', '__SYSTEM_MENU_38', '語言包管理', 1558346385, 1558346385, 0);
INSERT INTO `hc_system_lang_package` VALUES (15, 'zh-cn', '__SYSTEM_MENU_36', '语言包管理', 1558347075, 1558347075, 0);

-- ----------------------------
-- Table structure for hc_system_language
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_language`;
CREATE TABLE `hc_system_language`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '语言显示名称 如：繁体中文 简体中文 English',
  `sign` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '语言标识 如：zh-hk zh-cn en',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态：1 可用 2 不可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_language
-- ----------------------------
INSERT INTO `hc_system_language` VALUES (1, 'English', 'en', 1);
INSERT INTO `hc_system_language` VALUES (2, '简体中文', 'zh-cn', 1);
INSERT INTO `hc_system_language` VALUES (3, '繁體中文', 'zh-hk', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 521 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_log_info
-- ----------------------------
INSERT INTO `hc_system_log_info` VALUES (1, 98, 'system.permission.list', 'null', 'GET', 1530096592);
INSERT INTO `hc_system_log_info` VALUES (2, 98, 'system.permission.edit', '{\"id\":\"components.article.add\"}', 'GET', 1530096625);
INSERT INTO `hc_system_log_info` VALUES (3, 98, 'system.permission.list', 'null', 'GET', 1530096652);
INSERT INTO `hc_system_log_info` VALUES (4, 98, 'system.permission.edit', '{\"id\":\"components.article.list\"}', 'GET', 1530096692);
INSERT INTO `hc_system_log_info` VALUES (5, 98, 'system.permission.list', 'null', 'GET', 1530100977);
INSERT INTO `hc_system_log_info` VALUES (6, 98, 'system.permission.list', 'null', 'GET', 1530100984);
INSERT INTO `hc_system_log_info` VALUES (7, 98, 'system.permission.list', 'null', 'GET', 1530101881);
INSERT INTO `hc_system_log_info` VALUES (9, 98, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530101903);
INSERT INTO `hc_system_log_info` VALUES (10, 98, 'system.permission.list', 'null', 'GET', 1530101301);
INSERT INTO `hc_system_log_info` VALUES (11, 98, 'system.permission.list', 'null', 'GET', 1530101922);
INSERT INTO `hc_system_log_info` VALUES (12, 98, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530101306);
INSERT INTO `hc_system_log_info` VALUES (13, 98, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add+article\"}', 'POST', 1530101321);
INSERT INTO `hc_system_log_info` VALUES (14, 98, 'system.permission.list', 'null', 'GET', 1530101322);
INSERT INTO `hc_system_log_info` VALUES (15, 98, 'system.permission.list', 'null', 'GET', 1530101981);
INSERT INTO `hc_system_log_info` VALUES (16, 98, 'system.permission.list', 'null', 'GET', 1530150245);
INSERT INTO `hc_system_log_info` VALUES (17, 98, 'system.permission.list', 'null', 'GET', 1530150250);
INSERT INTO `hc_system_log_info` VALUES (18, 98, 'system.permission.list', 'null', 'GET', 1530150256);
INSERT INTO `hc_system_log_info` VALUES (19, 98, 'system.permission.list', 'null', 'GET', 1530150321);
INSERT INTO `hc_system_log_info` VALUES (20, 98, 'system.permission.list', 'null', 'GET', 1530152506);
INSERT INTO `hc_system_log_info` VALUES (21, 98, 'system.permission.list', 'null', 'GET', 1530152521);
INSERT INTO `hc_system_log_info` VALUES (22, 98, 'system.permission.list', 'null', 'GET', 1530152543);
INSERT INTO `hc_system_log_info` VALUES (23, 98, 'system.permission.list', 'null', 'GET', 1530152552);
INSERT INTO `hc_system_log_info` VALUES (24, 98, 'system.permission.list', 'null', 'GET', 1530152554);
INSERT INTO `hc_system_log_info` VALUES (25, 98, 'system.permission.list', 'null', 'GET', 1530152560);
INSERT INTO `hc_system_log_info` VALUES (26, 98, 'system.permission.list', 'null', 'GET', 1530152571);
INSERT INTO `hc_system_log_info` VALUES (27, 98, 'system.permission.list', 'null', 'GET', 1530152577);
INSERT INTO `hc_system_log_info` VALUES (28, 98, 'system.permission.list', 'null', 'GET', 1530157137);
INSERT INTO `hc_system_log_info` VALUES (29, 98, 'system.permission.list', 'null', 'GET', 1530157154);
INSERT INTO `hc_system_log_info` VALUES (30, 98, 'system.permission.list', 'null', 'GET', 1530160336);
INSERT INTO `hc_system_log_info` VALUES (31, 98, 'system.permission.list', 'null', 'GET', 1530165778);
INSERT INTO `hc_system_log_info` VALUES (32, 98, 'system.permission.list', 'null', 'GET', 1530165815);
INSERT INTO `hc_system_log_info` VALUES (33, 98, 'system.permission.list', 'null', 'GET', 1530168638);
INSERT INTO `hc_system_log_info` VALUES (34, 98, 'system.permission.add', 'null', 'GET', 1530168682);
INSERT INTO `hc_system_log_info` VALUES (35, 98, 'system.permission.add', 'null', 'GET', 1530168692);
INSERT INTO `hc_system_log_info` VALUES (36, 98, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.log.list\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1530168711);
INSERT INTO `hc_system_log_info` VALUES (37, 98, 'system.permission.list', 'null', 'GET', 1530168711);
INSERT INTO `hc_system_log_info` VALUES (38, 98, 'system.permission.list', 'null', 'GET', 1530168772);
INSERT INTO `hc_system_log_info` VALUES (39, 98, 'system.permission.add', 'null', 'GET', 1530168774);
INSERT INTO `hc_system_log_info` VALUES (40, 98, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.log.del\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1530168791);
INSERT INTO `hc_system_log_info` VALUES (41, 98, 'system.permission.list', 'null', 'GET', 1530168791);
INSERT INTO `hc_system_log_info` VALUES (42, 98, 'system.permission.list', 'null', 'GET', 1530168963);
INSERT INTO `hc_system_log_info` VALUES (43, 98, 'system.permission.list', 'null', 'GET', 1530170352);
INSERT INTO `hc_system_log_info` VALUES (44, 98, 'system.permission.list', 'null', 'GET', 1530170369);
INSERT INTO `hc_system_log_info` VALUES (45, 98, 'system.permission.list', 'null', 'GET', 1530174223);
INSERT INTO `hc_system_log_info` VALUES (46, 98, 'system.permission.list', 'null', 'GET', 1530178984);
INSERT INTO `hc_system_log_info` VALUES (47, 98, 'system.permission.list', 'null', 'GET', 1530179251);
INSERT INTO `hc_system_log_info` VALUES (48, 98, 'system.permission.list', 'null', 'GET', 1530179324);
INSERT INTO `hc_system_log_info` VALUES (49, 99, 'system.permission.list', 'null', 'GET', 1530185469);
INSERT INTO `hc_system_log_info` VALUES (50, 98, 'system.permission.list', 'null', 'GET', 1530186038);
INSERT INTO `hc_system_log_info` VALUES (51, 99, 'system.permission.list', 'null', 'GET', 1530186789);
INSERT INTO `hc_system_log_info` VALUES (52, 99, 'system.permission.add', 'null', 'GET', 1530186801);
INSERT INTO `hc_system_log_info` VALUES (53, 99, 'system.permission.add', 'null', 'GET', 1530186811);
INSERT INTO `hc_system_log_info` VALUES (54, 99, 'system.permission.list', 'null', 'GET', 1530186832);
INSERT INTO `hc_system_log_info` VALUES (55, 0, 'system.permission.list', 'null', 'GET', 1530238712);
INSERT INTO `hc_system_log_info` VALUES (56, 0, 'system.permission.list', 'null', 'GET', 1530238726);
INSERT INTO `hc_system_log_info` VALUES (57, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530238728);
INSERT INTO `hc_system_log_info` VALUES (58, 0, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530238741);
INSERT INTO `hc_system_log_info` VALUES (59, 0, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530239559);
INSERT INTO `hc_system_log_info` VALUES (60, 0, 'system.permission.list', 'null', 'GET', 1530239566);
INSERT INTO `hc_system_log_info` VALUES (61, 0, 'system.permission.edit', '{\"id\":\"article.article.del\"}', 'GET', 1530239570);
INSERT INTO `hc_system_log_info` VALUES (62, 0, 'system.permission.list', 'null', 'GET', 1530239630);
INSERT INTO `hc_system_log_info` VALUES (63, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530239635);
INSERT INTO `hc_system_log_info` VALUES (64, 0, 'system.permission.list', 'null', 'GET', 1530239283);
INSERT INTO `hc_system_log_info` VALUES (65, 0, 'system.permission.list', 'null', 'GET', 1530239296);
INSERT INTO `hc_system_log_info` VALUES (66, 0, 'system.permission.edit', '{\"id\":\"system.role.add\"}', 'GET', 1530239304);
INSERT INTO `hc_system_log_info` VALUES (67, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530239328);
INSERT INTO `hc_system_log_info` VALUES (68, 0, 'system.permission.edit', '{\"id\":\"system.role.del\"}', 'GET', 1530239337);
INSERT INTO `hc_system_log_info` VALUES (69, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"system.role.del\",\"statusRadio\":\"1\",\"title\":\"????1\"}', 'POST', 1530239345);
INSERT INTO `hc_system_log_info` VALUES (70, 0, 'system.permission.list', 'null', 'GET', 1530239347);
INSERT INTO `hc_system_log_info` VALUES (71, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530239352);
INSERT INTO `hc_system_log_info` VALUES (72, 0, 'system.permission.edit', '{\"id\":\"system.role.del\"}', 'GET', 1530239355);
INSERT INTO `hc_system_log_info` VALUES (73, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"system.role.del\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1530239362);
INSERT INTO `hc_system_log_info` VALUES (74, 0, 'system.permission.list', 'null', 'GET', 1530239364);
INSERT INTO `hc_system_log_info` VALUES (75, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530239368);
INSERT INTO `hc_system_log_info` VALUES (76, 0, 'system.permission.edit', '{\"id\":\"system.role.del\"}', 'GET', 1530239374);
INSERT INTO `hc_system_log_info` VALUES (77, 0, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.role.del\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1530239383);
INSERT INTO `hc_system_log_info` VALUES (78, 0, 'system.permission.list', 'null', 'GET', 1530239384);
INSERT INTO `hc_system_log_info` VALUES (79, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530239392);
INSERT INTO `hc_system_log_info` VALUES (80, 0, 'system.permission.edit', '{\"id\":\"system.role.del\"}', 'GET', 1530239399);
INSERT INTO `hc_system_log_info` VALUES (81, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"system.role.del\",\"statusRadio\":\"0\",\"title\":\"????\"}', 'POST', 1530239408);
INSERT INTO `hc_system_log_info` VALUES (82, 0, 'system.permission.list', 'null', 'GET', 1530239409);
INSERT INTO `hc_system_log_info` VALUES (83, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530239414);
INSERT INTO `hc_system_log_info` VALUES (84, 0, 'system.permission.edit', '{\"id\":\"system.role.del\"}', 'GET', 1530239423);
INSERT INTO `hc_system_log_info` VALUES (85, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"system.role.del\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1530239427);
INSERT INTO `hc_system_log_info` VALUES (86, 0, 'system.permission.list', 'null', 'GET', 1530239429);
INSERT INTO `hc_system_log_info` VALUES (87, 0, 'system.permission.list', 'null', 'GET', 1530239443);
INSERT INTO `hc_system_log_info` VALUES (88, 0, 'system.permission.add', 'null', 'GET', 1530239447);
INSERT INTO `hc_system_log_info` VALUES (89, 0, 'system.permission.list', 'null', 'GET', 1530239486);
INSERT INTO `hc_system_log_info` VALUES (90, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530239494);
INSERT INTO `hc_system_log_info` VALUES (91, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add+article\"}', 'POST', 1530239501);
INSERT INTO `hc_system_log_info` VALUES (92, 0, 'system.permission.list', 'null', 'GET', 1530239503);
INSERT INTO `hc_system_log_info` VALUES (93, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530239515);
INSERT INTO `hc_system_log_info` VALUES (94, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add+article\"}', 'POST', 1530239537);
INSERT INTO `hc_system_log_info` VALUES (95, 0, 'system.permission.list', 'null', 'GET', 1530239539);
INSERT INTO `hc_system_log_info` VALUES (96, 0, 'system.permission.edit', '{\"id\":\"article.article.del\"}', 'GET', 1530239544);
INSERT INTO `hc_system_log_info` VALUES (97, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.del\",\"statusRadio\":\"1\",\"title\":\"??11??\"}', 'POST', 1530239548);
INSERT INTO `hc_system_log_info` VALUES (98, 0, 'system.permission.list', 'null', 'GET', 1530239549);
INSERT INTO `hc_system_log_info` VALUES (99, 0, 'system.permission.edit', '{\"id\":\"article.article.del\"}', 'GET', 1530239553);
INSERT INTO `hc_system_log_info` VALUES (100, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.del\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1530239559);
INSERT INTO `hc_system_log_info` VALUES (101, 0, 'system.permission.list', 'null', 'GET', 1530239561);
INSERT INTO `hc_system_log_info` VALUES (102, 0, 'system.permission.list', 'null', 'GET', 1530239601);
INSERT INTO `hc_system_log_info` VALUES (103, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530239604);
INSERT INTO `hc_system_log_info` VALUES (104, 0, 'system.permission.list', 'null', 'GET', 1530239905);
INSERT INTO `hc_system_log_info` VALUES (105, 0, 'system.permission.list', 'null', 'GET', 1530239934);
INSERT INTO `hc_system_log_info` VALUES (106, 0, 'system.permission.list', 'null', 'GET', 1530239957);
INSERT INTO `hc_system_log_info` VALUES (107, 0, 'system.permission.list', 'null', 'GET', 1530240006);
INSERT INTO `hc_system_log_info` VALUES (108, 0, 'system.permission.list', 'null', 'GET', 1530240029);
INSERT INTO `hc_system_log_info` VALUES (109, 0, 'system.permission.list', 'null', 'GET', 1530251740);
INSERT INTO `hc_system_log_info` VALUES (110, 0, 'system.permission.list', 'null', 'GET', 1530251884);
INSERT INTO `hc_system_log_info` VALUES (111, 0, 'system.permission.list', 'null', 'GET', 1530251887);
INSERT INTO `hc_system_log_info` VALUES (112, 0, 'system.permission.list', 'null', 'GET', 1530251981);
INSERT INTO `hc_system_log_info` VALUES (113, 0, 'system.permission.list', 'null', 'GET', 1530252043);
INSERT INTO `hc_system_log_info` VALUES (114, 0, 'system.permission.list', 'null', 'GET', 1530252098);
INSERT INTO `hc_system_log_info` VALUES (115, 0, 'system.permission.list', 'null', 'GET', 1530252577);
INSERT INTO `hc_system_log_info` VALUES (116, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530252584);
INSERT INTO `hc_system_log_info` VALUES (117, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add++++article\"}', 'POST', 1530252591);
INSERT INTO `hc_system_log_info` VALUES (118, 0, 'system.permission.list', 'null', 'GET', 1530252594);
INSERT INTO `hc_system_log_info` VALUES (119, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530252600);
INSERT INTO `hc_system_log_info` VALUES (120, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add+article\"}', 'POST', 1530252606);
INSERT INTO `hc_system_log_info` VALUES (121, 0, 'system.permission.list', 'null', 'GET', 1530252609);
INSERT INTO `hc_system_log_info` VALUES (122, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530252680);
INSERT INTO `hc_system_log_info` VALUES (123, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add+++++article\"}', 'POST', 1530252686);
INSERT INTO `hc_system_log_info` VALUES (124, 0, 'system.permission.list', 'null', 'GET', 1530252687);
INSERT INTO `hc_system_log_info` VALUES (125, 0, 'system.permission.list', 'null', 'GET', 1530252692);
INSERT INTO `hc_system_log_info` VALUES (126, 0, 'system.permission.list', 'null', 'GET', 1530252872);
INSERT INTO `hc_system_log_info` VALUES (127, 0, 'system.permission.list', 'null', 'GET', 1530252907);
INSERT INTO `hc_system_log_info` VALUES (128, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530252909);
INSERT INTO `hc_system_log_info` VALUES (129, 0, 'system.permission.list', 'null', 'GET', 1530254037);
INSERT INTO `hc_system_log_info` VALUES (130, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530254041);
INSERT INTO `hc_system_log_info` VALUES (131, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add article\"}', 'POST', 1530254044);
INSERT INTO `hc_system_log_info` VALUES (132, 0, 'system.permission.list', 'null', 'GET', 1530254044);
INSERT INTO `hc_system_log_info` VALUES (133, 0, 'system.permission.list', 'null', 'GET', 1530254092);
INSERT INTO `hc_system_log_info` VALUES (134, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530254097);
INSERT INTO `hc_system_log_info` VALUES (135, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add++article\"}', 'POST', 1530254100);
INSERT INTO `hc_system_log_info` VALUES (136, 0, 'system.permission.list', 'null', 'GET', 1530254102);
INSERT INTO `hc_system_log_info` VALUES (137, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530254109);
INSERT INTO `hc_system_log_info` VALUES (138, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add++article\"}', 'POST', 1530254117);
INSERT INTO `hc_system_log_info` VALUES (139, 0, 'system.permission.list', 'null', 'GET', 1530254119);
INSERT INTO `hc_system_log_info` VALUES (140, 0, 'system.permission.list', 'null', 'GET', 1530254381);
INSERT INTO `hc_system_log_info` VALUES (141, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530254385);
INSERT INTO `hc_system_log_info` VALUES (142, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add+article\"}', 'POST', 1530254389);
INSERT INTO `hc_system_log_info` VALUES (143, 0, 'system.permission.list', 'null', 'GET', 1530254390);
INSERT INTO `hc_system_log_info` VALUES (144, 0, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530254394);
INSERT INTO `hc_system_log_info` VALUES (145, 0, 'system.permission.list', 'null', 'GET', 1530255330);
INSERT INTO `hc_system_log_info` VALUES (146, 0, 'system.permission.edit', '{\"id\":\"article.article.del\"}', 'GET', 1530255333);
INSERT INTO `hc_system_log_info` VALUES (147, 0, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.del\",\"statusRadio\":\"1\",\"title\":\"?? ??\"}', 'POST', 1530255338);
INSERT INTO `hc_system_log_info` VALUES (148, 0, 'system.permission.list', 'null', 'GET', 1530255338);
INSERT INTO `hc_system_log_info` VALUES (149, 98, 'system.permission.list', 'null', 'GET', 1530254765);
INSERT INTO `hc_system_log_info` VALUES (150, 98, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530254769);
INSERT INTO `hc_system_log_info` VALUES (151, 98, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add++article\"}', 'POST', 1530254776);
INSERT INTO `hc_system_log_info` VALUES (152, 98, 'system.permission.list', 'null', 'GET', 1530254778);
INSERT INTO `hc_system_log_info` VALUES (153, 98, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530255134);
INSERT INTO `hc_system_log_info` VALUES (154, 98, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530255136);
INSERT INTO `hc_system_log_info` VALUES (155, 98, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"article.article.add\",\"statusRadio\":\"1\",\"title\":\"add article\"}', 'POST', 1530255141);
INSERT INTO `hc_system_log_info` VALUES (156, 98, 'system.permission.list', 'null', 'GET', 1530255142);
INSERT INTO `hc_system_log_info` VALUES (157, 98, 'system.permission.list', 'null', 'GET', 1530255786);
INSERT INTO `hc_system_log_info` VALUES (158, 98, 'system.permission.list', 'null', 'GET', 1530255977);
INSERT INTO `hc_system_log_info` VALUES (159, 98, 'system.permission.list', 'null', 'GET', 1530256005);
INSERT INTO `hc_system_log_info` VALUES (160, 0, 'system.permission.list', 'null', 'GET', 1530257341);
INSERT INTO `hc_system_log_info` VALUES (161, 0, 'system.permission.list', 'null', 'GET', 1530257347);
INSERT INTO `hc_system_log_info` VALUES (162, 0, 'system.permission.list', 'null', 'GET', 1530257453);
INSERT INTO `hc_system_log_info` VALUES (163, 0, 'system.permission.add', 'null', 'GET', 1530257482);
INSERT INTO `hc_system_log_info` VALUES (164, 0, 'system.permission.list', 'null', 'GET', 1530257536);
INSERT INTO `hc_system_log_info` VALUES (165, 0, 'system.permission.list', 'null', 'GET', 1530261158);
INSERT INTO `hc_system_log_info` VALUES (166, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530261161);
INSERT INTO `hc_system_log_info` VALUES (167, 0, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530261167);
INSERT INTO `hc_system_log_info` VALUES (168, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530261171);
INSERT INTO `hc_system_log_info` VALUES (169, 0, 'system.permission.list', 'null', 'GET', 1530261191);
INSERT INTO `hc_system_log_info` VALUES (170, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530261195);
INSERT INTO `hc_system_log_info` VALUES (171, 98, 'system.permission.list', 'null', 'GET', 1530262336);
INSERT INTO `hc_system_log_info` VALUES (172, 0, 'system.permission.list', 'null', 'GET', 1530265981);
INSERT INTO `hc_system_log_info` VALUES (173, 0, 'system.permission.list', 'null', 'GET', 1530266066);
INSERT INTO `hc_system_log_info` VALUES (174, 0, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530266070);
INSERT INTO `hc_system_log_info` VALUES (175, 0, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530266072);
INSERT INTO `hc_system_log_info` VALUES (176, 0, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267571);
INSERT INTO `hc_system_log_info` VALUES (177, 98, 'system.permission.list', 'null', 'GET', 1530267715);
INSERT INTO `hc_system_log_info` VALUES (178, 98, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530267718);
INSERT INTO `hc_system_log_info` VALUES (179, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267721);
INSERT INTO `hc_system_log_info` VALUES (180, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267765);
INSERT INTO `hc_system_log_info` VALUES (181, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267765);
INSERT INTO `hc_system_log_info` VALUES (182, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267766);
INSERT INTO `hc_system_log_info` VALUES (183, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267769);
INSERT INTO `hc_system_log_info` VALUES (184, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267770);
INSERT INTO `hc_system_log_info` VALUES (185, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267770);
INSERT INTO `hc_system_log_info` VALUES (186, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267771);
INSERT INTO `hc_system_log_info` VALUES (187, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267772);
INSERT INTO `hc_system_log_info` VALUES (188, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267772);
INSERT INTO `hc_system_log_info` VALUES (189, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267807);
INSERT INTO `hc_system_log_info` VALUES (190, 98, 'system.permission.list', '{\"page\":\"0\"}', 'GET', 1530267813);
INSERT INTO `hc_system_log_info` VALUES (191, 98, 'system.permission.list', 'null', 'GET', 1530513147);
INSERT INTO `hc_system_log_info` VALUES (192, 98, 'system.permission.list', 'null', 'GET', 1530528022);
INSERT INTO `hc_system_log_info` VALUES (193, 98, 'system.permission.list', 'null', 'GET', 1530528099);
INSERT INTO `hc_system_log_info` VALUES (194, 98, 'system.permission.list', 'null', 'GET', 1530536029);
INSERT INTO `hc_system_log_info` VALUES (195, 98, 'system.permission.list', 'null', 'GET', 1530536181);
INSERT INTO `hc_system_log_info` VALUES (196, 98, 'system.permission.list', 'null', 'GET', 1530844465);
INSERT INTO `hc_system_log_info` VALUES (197, 98, 'system.permission.list', 'null', 'GET', 1530844511);
INSERT INTO `hc_system_log_info` VALUES (198, 98, 'system.permission.list', 'null', 'GET', 1530844517);
INSERT INTO `hc_system_log_info` VALUES (199, 98, 'system.permission.list', 'null', 'GET', 1530845658);
INSERT INTO `hc_system_log_info` VALUES (200, 98, 'system.permission.list', 'null', 'GET', 1530845881);
INSERT INTO `hc_system_log_info` VALUES (201, 98, 'system.permission.list', 'null', 'GET', 1530845882);
INSERT INTO `hc_system_log_info` VALUES (202, 98, 'system.permission.list', 'null', 'GET', 1530845889);
INSERT INTO `hc_system_log_info` VALUES (203, 98, 'system.permission.list', 'null', 'GET', 1530845897);
INSERT INTO `hc_system_log_info` VALUES (204, 98, 'system.permission.list', 'null', 'GET', 1530845900);
INSERT INTO `hc_system_log_info` VALUES (205, 98, 'system.permission.list', 'null', 'GET', 1530846000);
INSERT INTO `hc_system_log_info` VALUES (206, 98, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1530846005);
INSERT INTO `hc_system_log_info` VALUES (207, 98, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530846009);
INSERT INTO `hc_system_log_info` VALUES (208, 98, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1530846012);
INSERT INTO `hc_system_log_info` VALUES (209, 98, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530846016);
INSERT INTO `hc_system_log_info` VALUES (210, 98, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1530846021);
INSERT INTO `hc_system_log_info` VALUES (211, 98, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530846027);
INSERT INTO `hc_system_log_info` VALUES (212, 98, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530846056);
INSERT INTO `hc_system_log_info` VALUES (213, 98, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530846064);
INSERT INTO `hc_system_log_info` VALUES (214, 98, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1530846067);
INSERT INTO `hc_system_log_info` VALUES (215, 98, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1530846070);
INSERT INTO `hc_system_log_info` VALUES (216, 98, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1530846074);
INSERT INTO `hc_system_log_info` VALUES (217, 98, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1530847413);
INSERT INTO `hc_system_log_info` VALUES (218, 98, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1530847418);
INSERT INTO `hc_system_log_info` VALUES (219, 98, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1530847442);
INSERT INTO `hc_system_log_info` VALUES (220, 98, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1530847463);
INSERT INTO `hc_system_log_info` VALUES (221, 98, 'system.permission.list', 'null', 'GET', 1530851318);
INSERT INTO `hc_system_log_info` VALUES (222, 98, 'system.permission.add', 'null', 'GET', 1530851324);
INSERT INTO `hc_system_log_info` VALUES (223, 98, 'system.permission.list', 'null', 'GET', 1530858721);
INSERT INTO `hc_system_log_info` VALUES (224, 98, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1530858732);
INSERT INTO `hc_system_log_info` VALUES (225, 101, 'system.permission.list', 'null', 'GET', 1536491209);
INSERT INTO `hc_system_log_info` VALUES (226, 101, 'system.permission.add', 'null', 'GET', 1536491253);
INSERT INTO `hc_system_log_info` VALUES (227, 101, 'system.permission.list', 'null', 'GET', 1536563042);
INSERT INTO `hc_system_log_info` VALUES (228, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536563051);
INSERT INTO `hc_system_log_info` VALUES (229, 101, 'system.permission.list', 'null', 'GET', 1536649268);
INSERT INTO `hc_system_log_info` VALUES (230, 101, 'system.permission.list', 'null', 'GET', 1536649904);
INSERT INTO `hc_system_log_info` VALUES (231, 101, 'system.permission.list', 'null', 'GET', 1536649939);
INSERT INTO `hc_system_log_info` VALUES (232, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536649946);
INSERT INTO `hc_system_log_info` VALUES (233, 101, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1536649950);
INSERT INTO `hc_system_log_info` VALUES (234, 101, 'system.permission.list', 'null', 'GET', 1536649997);
INSERT INTO `hc_system_log_info` VALUES (235, 101, 'system.permission.add', 'null', 'GET', 1536650009);
INSERT INTO `hc_system_log_info` VALUES (236, 101, 'system.permission.add', 'null', 'GET', 1536650016);
INSERT INTO `hc_system_log_info` VALUES (237, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.frontmenu.list\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536650042);
INSERT INTO `hc_system_log_info` VALUES (238, 101, 'system.permission.list', 'null', 'GET', 1536650042);
INSERT INTO `hc_system_log_info` VALUES (239, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536650046);
INSERT INTO `hc_system_log_info` VALUES (240, 101, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1536650050);
INSERT INTO `hc_system_log_info` VALUES (241, 101, 'system.permission.add', 'null', 'GET', 1536650054);
INSERT INTO `hc_system_log_info` VALUES (242, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.frontmenu.add\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536650075);
INSERT INTO `hc_system_log_info` VALUES (243, 101, 'system.permission.list', 'null', 'GET', 1536650075);
INSERT INTO `hc_system_log_info` VALUES (244, 101, 'system.permission.list', 'null', 'GET', 1536650279);
INSERT INTO `hc_system_log_info` VALUES (245, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536650286);
INSERT INTO `hc_system_log_info` VALUES (246, 101, 'system.permission.add', 'null', 'GET', 1536650292);
INSERT INTO `hc_system_log_info` VALUES (247, 101, 'system.permission.add', 'null', 'GET', 1536650298);
INSERT INTO `hc_system_log_info` VALUES (248, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.banner.list\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536650315);
INSERT INTO `hc_system_log_info` VALUES (249, 101, 'system.permission.list', 'null', 'GET', 1536650315);
INSERT INTO `hc_system_log_info` VALUES (250, 101, 'system.permission.add', 'null', 'GET', 1536650317);
INSERT INTO `hc_system_log_info` VALUES (251, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.banner.add\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536650329);
INSERT INTO `hc_system_log_info` VALUES (252, 101, 'system.permission.list', 'null', 'GET', 1536650329);
INSERT INTO `hc_system_log_info` VALUES (253, 101, 'system.permission.add', 'null', 'GET', 1536650333);
INSERT INTO `hc_system_log_info` VALUES (254, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.banner.edit\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536650344);
INSERT INTO `hc_system_log_info` VALUES (255, 101, 'system.permission.list', 'null', 'GET', 1536650344);
INSERT INTO `hc_system_log_info` VALUES (256, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536650354);
INSERT INTO `hc_system_log_info` VALUES (257, 101, 'system.permission.add', 'null', 'GET', 1536650363);
INSERT INTO `hc_system_log_info` VALUES (258, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.tag.add\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536650375);
INSERT INTO `hc_system_log_info` VALUES (259, 101, 'system.permission.list', 'null', 'GET', 1536650375);
INSERT INTO `hc_system_log_info` VALUES (260, 101, 'system.permission.add', 'null', 'GET', 1536650380);
INSERT INTO `hc_system_log_info` VALUES (261, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.tag.edit\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536650392);
INSERT INTO `hc_system_log_info` VALUES (262, 101, 'system.permission.list', 'null', 'GET', 1536650392);
INSERT INTO `hc_system_log_info` VALUES (263, 101, 'system.permission.list', 'null', 'GET', 1536650432);
INSERT INTO `hc_system_log_info` VALUES (264, 101, 'system.permission.add', 'null', 'GET', 1536650435);
INSERT INTO `hc_system_log_info` VALUES (265, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.frontmenu.edit\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536650449);
INSERT INTO `hc_system_log_info` VALUES (266, 101, 'system.permission.list', 'null', 'GET', 1536650449);
INSERT INTO `hc_system_log_info` VALUES (267, 101, 'system.permission.list', 'null', 'GET', 1536654642);
INSERT INTO `hc_system_log_info` VALUES (268, 101, 'system.permission.edit', '{\"id\":\"system.frontmenu.add\"}', 'GET', 1536654648);
INSERT INTO `hc_system_log_info` VALUES (269, 101, 'system.permission.edit', '{\"id\":\"system.menu.del\"}', 'GET', 1536654655);
INSERT INTO `hc_system_log_info` VALUES (270, 101, 'system.permission.list', 'null', 'GET', 1536654775);
INSERT INTO `hc_system_log_info` VALUES (271, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536654781);
INSERT INTO `hc_system_log_info` VALUES (272, 101, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1536654785);
INSERT INTO `hc_system_log_info` VALUES (273, 101, 'system.permission.list', 'null', 'GET', 1536655821);
INSERT INTO `hc_system_log_info` VALUES (274, 101, 'system.permission.list', 'null', 'GET', 1536655843);
INSERT INTO `hc_system_log_info` VALUES (275, 101, 'system.permission.list', 'null', 'GET', 1536655887);
INSERT INTO `hc_system_log_info` VALUES (276, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536655903);
INSERT INTO `hc_system_log_info` VALUES (277, 101, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1536655905);
INSERT INTO `hc_system_log_info` VALUES (278, 101, 'system.permission.list', 'null', 'GET', 1536655916);
INSERT INTO `hc_system_log_info` VALUES (279, 99, 'system.permission.list', 'null', 'GET', 1536657558);
INSERT INTO `hc_system_log_info` VALUES (280, 99, 'system.permission.add', 'null', 'GET', 1536657560);
INSERT INTO `hc_system_log_info` VALUES (281, 99, 'system.permission.list', 'null', 'GET', 1536657574);
INSERT INTO `hc_system_log_info` VALUES (282, 99, 'system.permission.list', 'null', 'GET', 1536657576);
INSERT INTO `hc_system_log_info` VALUES (283, 99, 'system.permission.add', 'null', 'GET', 1536657577);
INSERT INTO `hc_system_log_info` VALUES (284, 99, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"shop.product.list\",\"statusRadio\":\"1\",\"title\":\"shop+product+list\"}', 'POST', 1536657609);
INSERT INTO `hc_system_log_info` VALUES (285, 99, 'system.permission.list', 'null', 'GET', 1536657609);
INSERT INTO `hc_system_log_info` VALUES (286, 99, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536657616);
INSERT INTO `hc_system_log_info` VALUES (287, 99, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1536657618);
INSERT INTO `hc_system_log_info` VALUES (288, 101, 'system.permission.list', 'null', 'GET', 1536659717);
INSERT INTO `hc_system_log_info` VALUES (289, 101, 'system.permission.add', 'null', 'GET', 1536659726);
INSERT INTO `hc_system_log_info` VALUES (290, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"portal.menu.del\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536659756);
INSERT INTO `hc_system_log_info` VALUES (291, 101, 'system.permission.list', 'null', 'GET', 1536659756);
INSERT INTO `hc_system_log_info` VALUES (292, 101, 'system.permission.add', 'null', 'GET', 1536659765);
INSERT INTO `hc_system_log_info` VALUES (293, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"portal.banner.del\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536659784);
INSERT INTO `hc_system_log_info` VALUES (294, 101, 'system.permission.list', 'null', 'GET', 1536659784);
INSERT INTO `hc_system_log_info` VALUES (295, 101, 'system.permission.add', 'null', 'GET', 1536659787);
INSERT INTO `hc_system_log_info` VALUES (296, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"tag.tag.del\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536659800);
INSERT INTO `hc_system_log_info` VALUES (297, 101, 'system.permission.list', 'null', 'GET', 1536659800);
INSERT INTO `hc_system_log_info` VALUES (298, 101, 'system.permission.list', 'null', 'GET', 1536660344);
INSERT INTO `hc_system_log_info` VALUES (299, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536660347);
INSERT INTO `hc_system_log_info` VALUES (300, 101, 'system.permission.list', 'null', 'GET', 1536660374);
INSERT INTO `hc_system_log_info` VALUES (301, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536660378);
INSERT INTO `hc_system_log_info` VALUES (302, 101, 'system.permission.edit', '{\"id\":\"tag.tag.del\"}', 'GET', 1536660392);
INSERT INTO `hc_system_log_info` VALUES (303, 99, 'system.permission.list', 'null', 'GET', 1536735007);
INSERT INTO `hc_system_log_info` VALUES (304, 99, 'system.permission.list', 'null', 'GET', 1536735233);
INSERT INTO `hc_system_log_info` VALUES (305, 99, 'system.permission.list', 'null', 'GET', 1536735238);
INSERT INTO `hc_system_log_info` VALUES (306, 99, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536735244);
INSERT INTO `hc_system_log_info` VALUES (307, 99, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536735245);
INSERT INTO `hc_system_log_info` VALUES (308, 99, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536735247);
INSERT INTO `hc_system_log_info` VALUES (309, 99, 'system.permission.list', 'null', 'GET', 1536736556);
INSERT INTO `hc_system_log_info` VALUES (310, 99, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536736558);
INSERT INTO `hc_system_log_info` VALUES (311, 99, 'system.permission.add', 'null', 'GET', 1536736564);
INSERT INTO `hc_system_log_info` VALUES (312, 99, 'system.permission.add', 'null', 'GET', 1536736567);
INSERT INTO `hc_system_log_info` VALUES (313, 99, 'system.permission.list', 'null', 'GET', 1536737669);
INSERT INTO `hc_system_log_info` VALUES (314, 99, 'system.permission.add', 'null', 'GET', 1536737671);
INSERT INTO `hc_system_log_info` VALUES (315, 99, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"eee\",\"statusRadio\":\"1\",\"title\":\"eee\"}', 'POST', 1536737677);
INSERT INTO `hc_system_log_info` VALUES (316, 99, 'system.permission.list', 'null', 'GET', 1536737677);
INSERT INTO `hc_system_log_info` VALUES (317, 99, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536737680);
INSERT INTO `hc_system_log_info` VALUES (318, 99, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1536737682);
INSERT INTO `hc_system_log_info` VALUES (319, 99, 'system.permission.add', '{\"id\":\"3\",\"statusRadio\":\"1\",\"title\":\"4334\"}', 'POST', 1536737791);
INSERT INTO `hc_system_log_info` VALUES (320, 99, 'system.permission.list', 'null', 'GET', 1536737991);
INSERT INTO `hc_system_log_info` VALUES (321, 99, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536737994);
INSERT INTO `hc_system_log_info` VALUES (322, 99, 'system.permission.list', 'null', 'GET', 1536738176);
INSERT INTO `hc_system_log_info` VALUES (323, 99, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536738194);
INSERT INTO `hc_system_log_info` VALUES (324, 99, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536738210);
INSERT INTO `hc_system_log_info` VALUES (325, 99, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536738258);
INSERT INTO `hc_system_log_info` VALUES (326, 99, 'system.permission.list', 'null', 'GET', 1536738656);
INSERT INTO `hc_system_log_info` VALUES (327, 99, 'system.permission.list', 'null', 'GET', 1536739954);
INSERT INTO `hc_system_log_info` VALUES (328, 99, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536739957);
INSERT INTO `hc_system_log_info` VALUES (329, 99, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536739960);
INSERT INTO `hc_system_log_info` VALUES (330, 99, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536739962);
INSERT INTO `hc_system_log_info` VALUES (331, 99, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536739966);
INSERT INTO `hc_system_log_info` VALUES (332, 99, 'system.permission.list', 'null', 'GET', 1536739969);
INSERT INTO `hc_system_log_info` VALUES (333, 99, 'system.permission.list', 'null', 'GET', 1536743408);
INSERT INTO `hc_system_log_info` VALUES (334, 99, 'system.permission.add', 'null', 'GET', 1536743410);
INSERT INTO `hc_system_log_info` VALUES (335, 99, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"shop.product.add\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536743441);
INSERT INTO `hc_system_log_info` VALUES (336, 99, 'system.permission.list', 'null', 'GET', 1536743441);
INSERT INTO `hc_system_log_info` VALUES (337, 99, 'system.permission.list', 'null', 'GET', 1536743447);
INSERT INTO `hc_system_log_info` VALUES (338, 99, 'system.permission.add', 'null', 'GET', 1536743448);
INSERT INTO `hc_system_log_info` VALUES (339, 99, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"shop.produt.edit\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536743457);
INSERT INTO `hc_system_log_info` VALUES (340, 99, 'system.permission.list', 'null', 'GET', 1536743457);
INSERT INTO `hc_system_log_info` VALUES (341, 99, 'system.permission.list', 'null', 'GET', 1536753572);
INSERT INTO `hc_system_log_info` VALUES (342, 99, 'system.permission.edit', '{\"id\":\"shop.produt.edit\"}', 'GET', 1536753577);
INSERT INTO `hc_system_log_info` VALUES (343, 99, 'system.permission.edit', '{\"id\":\"portal.menu.list\"}', 'GET', 1536753582);
INSERT INTO `hc_system_log_info` VALUES (344, 99, 'system.permission.edit', '{\"id\":\"portal.menu.edit\"}', 'GET', 1536753594);
INSERT INTO `hc_system_log_info` VALUES (345, 99, 'system.permission.list', 'null', 'GET', 1536753604);
INSERT INTO `hc_system_log_info` VALUES (346, 99, 'system.permission.list', 'null', 'GET', 1536753680);
INSERT INTO `hc_system_log_info` VALUES (347, 99, 'system.permission.edit', '{\"id\":\"shop.produt.edit\"}', 'GET', 1536753688);
INSERT INTO `hc_system_log_info` VALUES (348, 99, 'system.permission.list', 'null', 'GET', 1536805152);
INSERT INTO `hc_system_log_info` VALUES (349, 99, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536805153);
INSERT INTO `hc_system_log_info` VALUES (350, 99, 'system.permission.add', 'null', 'GET', 1536805160);
INSERT INTO `hc_system_log_info` VALUES (351, 99, 'system.permission.add', '{\"actionRadio\":\"0\",\"id\":\"shop.product.del\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536805177);
INSERT INTO `hc_system_log_info` VALUES (352, 99, 'system.permission.list', 'null', 'GET', 1536805177);
INSERT INTO `hc_system_log_info` VALUES (353, 101, 'system.permission.list', 'null', 'GET', 1536805890);
INSERT INTO `hc_system_log_info` VALUES (354, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536805895);
INSERT INTO `hc_system_log_info` VALUES (355, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536805901);
INSERT INTO `hc_system_log_info` VALUES (356, 101, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1536805904);
INSERT INTO `hc_system_log_info` VALUES (357, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536805908);
INSERT INTO `hc_system_log_info` VALUES (358, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536805914);
INSERT INTO `hc_system_log_info` VALUES (359, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536805918);
INSERT INTO `hc_system_log_info` VALUES (360, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536806001);
INSERT INTO `hc_system_log_info` VALUES (361, 101, 'system.permission.list', 'null', 'GET', 1536806038);
INSERT INTO `hc_system_log_info` VALUES (362, 101, 'system.permission.list', 'null', 'GET', 1536806054);
INSERT INTO `hc_system_log_info` VALUES (363, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536806058);
INSERT INTO `hc_system_log_info` VALUES (364, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536806065);
INSERT INTO `hc_system_log_info` VALUES (365, 101, 'system.permission.add', 'null', 'GET', 1536806067);
INSERT INTO `hc_system_log_info` VALUES (366, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"system.file.upload\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536806083);
INSERT INTO `hc_system_log_info` VALUES (367, 101, 'system.permission.list', 'null', 'GET', 1536806083);
INSERT INTO `hc_system_log_info` VALUES (368, 99, 'system.permission.list', 'null', 'GET', 1536806396);
INSERT INTO `hc_system_log_info` VALUES (369, 99, 'system.permission.edit', '{\"id\":\"shop.product.del\"}', 'GET', 1536806404);
INSERT INTO `hc_system_log_info` VALUES (370, 99, 'system.permission.list', 'null', 'GET', 1536806423);
INSERT INTO `hc_system_log_info` VALUES (371, 101, 'system.permission.list', 'null', 'GET', 1536806871);
INSERT INTO `hc_system_log_info` VALUES (372, 101, 'system.permission.add', 'null', 'GET', 1536806872);
INSERT INTO `hc_system_log_info` VALUES (373, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"article.article.uploadimg\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536806889);
INSERT INTO `hc_system_log_info` VALUES (374, 101, 'system.permission.list', 'null', 'GET', 1536806889);
INSERT INTO `hc_system_log_info` VALUES (375, 99, 'system.permission.list', 'null', 'GET', 1536817679);
INSERT INTO `hc_system_log_info` VALUES (376, 99, 'system.permission.list', 'null', 'GET', 1536817741);
INSERT INTO `hc_system_log_info` VALUES (377, 99, 'system.permission.add', 'null', 'GET', 1536817743);
INSERT INTO `hc_system_log_info` VALUES (378, 99, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"shop.productcategory.list\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536817758);
INSERT INTO `hc_system_log_info` VALUES (379, 99, 'system.permission.list', 'null', 'GET', 1536817758);
INSERT INTO `hc_system_log_info` VALUES (380, 99, 'system.permission.list', 'null', 'GET', 1536818424);
INSERT INTO `hc_system_log_info` VALUES (381, 99, 'system.permission.add', 'null', 'GET', 1536818425);
INSERT INTO `hc_system_log_info` VALUES (382, 99, 'system.permission.list', 'null', 'GET', 1536821746);
INSERT INTO `hc_system_log_info` VALUES (383, 99, 'system.permission.add', 'null', 'GET', 1536821747);
INSERT INTO `hc_system_log_info` VALUES (384, 99, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"shop.productcategory.add\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536821766);
INSERT INTO `hc_system_log_info` VALUES (385, 99, 'system.permission.list', 'null', 'GET', 1536821766);
INSERT INTO `hc_system_log_info` VALUES (386, 99, 'system.permission.add', 'null', 'GET', 1536821792);
INSERT INTO `hc_system_log_info` VALUES (387, 99, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"shop.productcategory.edit\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536821808);
INSERT INTO `hc_system_log_info` VALUES (388, 99, 'system.permission.list', 'null', 'GET', 1536821808);
INSERT INTO `hc_system_log_info` VALUES (389, 99, 'system.permission.add', 'null', 'GET', 1536821813);
INSERT INTO `hc_system_log_info` VALUES (390, 99, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"shop.productcategory.del\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536821822);
INSERT INTO `hc_system_log_info` VALUES (391, 99, 'system.permission.list', 'null', 'GET', 1536821822);
INSERT INTO `hc_system_log_info` VALUES (392, 99, 'system.permission.list', 'null', 'GET', 1536821896);
INSERT INTO `hc_system_log_info` VALUES (393, 99, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536821899);
INSERT INTO `hc_system_log_info` VALUES (394, 99, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1536821904);
INSERT INTO `hc_system_log_info` VALUES (395, 99, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536821906);
INSERT INTO `hc_system_log_info` VALUES (396, 99, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536821929);
INSERT INTO `hc_system_log_info` VALUES (397, 99, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1536821930);
INSERT INTO `hc_system_log_info` VALUES (398, 99, 'system.permission.del', '{\"id\":\"eee\"}', 'GET', 1536821935);
INSERT INTO `hc_system_log_info` VALUES (399, 99, 'system.permission.del', '{\"id\":\"eee\"}', 'GET', 1536821947);
INSERT INTO `hc_system_log_info` VALUES (400, 99, 'system.permission.list', '{\"page\":\"1\"}', 'GET', 1536821956);
INSERT INTO `hc_system_log_info` VALUES (401, 99, 'system.permission.list', 'null', 'GET', 1536821974);
INSERT INTO `hc_system_log_info` VALUES (402, 99, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536821978);
INSERT INTO `hc_system_log_info` VALUES (403, 99, 'system.permission.edit', '{\"id\":\"shop.productcategory.add\"}', 'GET', 1536821983);
INSERT INTO `hc_system_log_info` VALUES (404, 101, 'system.permission.list', 'null', 'GET', 1536828961);
INSERT INTO `hc_system_log_info` VALUES (405, 101, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536828962);
INSERT INTO `hc_system_log_info` VALUES (406, 101, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536828978);
INSERT INTO `hc_system_log_info` VALUES (407, 101, 'system.permission.list', 'null', 'GET', 1536831113);
INSERT INTO `hc_system_log_info` VALUES (408, 101, 'system.permission.edit', '{\"id\":\"article.article.add\"}', 'GET', 1536831116);
INSERT INTO `hc_system_log_info` VALUES (409, 101, 'system.permission.list', 'null', 'GET', 1536831846);
INSERT INTO `hc_system_log_info` VALUES (410, 101, 'system.permission.list', 'null', 'GET', 1536831866);
INSERT INTO `hc_system_log_info` VALUES (411, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536831869);
INSERT INTO `hc_system_log_info` VALUES (412, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536831875);
INSERT INTO `hc_system_log_info` VALUES (413, 101, 'system.permission.list', 'null', 'GET', 1536831882);
INSERT INTO `hc_system_log_info` VALUES (414, 101, 'system.permission.list', 'null', 'GET', 1536831954);
INSERT INTO `hc_system_log_info` VALUES (415, 101, 'system.permission.list', 'null', 'GET', 1536832090);
INSERT INTO `hc_system_log_info` VALUES (416, 101, 'system.permission.list', 'null', 'GET', 1536840526);
INSERT INTO `hc_system_log_info` VALUES (417, 101, 'system.permission.edit', '{\"id\":\"1\"}', 'GET', 1536840528);
INSERT INTO `hc_system_log_info` VALUES (418, 101, 'system.permission.edit', '{\"id\":\"1\"}', 'GET', 1536840598);
INSERT INTO `hc_system_log_info` VALUES (419, 101, 'system.permission.edit', '{\"id\":\"1\"}', 'GET', 1536840598);
INSERT INTO `hc_system_log_info` VALUES (420, 101, 'system.permission.list', 'null', 'GET', 1536840601);
INSERT INTO `hc_system_log_info` VALUES (421, 101, 'system.permission.list', 'null', 'GET', 1536840602);
INSERT INTO `hc_system_log_info` VALUES (422, 101, 'system.permission.edit', '{\"id\":\"1\"}', 'GET', 1536840605);
INSERT INTO `hc_system_log_info` VALUES (423, 101, 'system.permission.list', 'null', 'GET', 1536840831);
INSERT INTO `hc_system_log_info` VALUES (424, 101, 'system.permission.edit', '{\"id\":\"1\"}', 'GET', 1536840832);
INSERT INTO `hc_system_log_info` VALUES (425, 101, 'system.permission.del', '{\"id\":\"10\"}', 'GET', 1536840843);
INSERT INTO `hc_system_log_info` VALUES (426, 101, 'system.permission.del', '{\"id\":\"5\"}', 'GET', 1536840851);
INSERT INTO `hc_system_log_info` VALUES (427, 101, 'system.permission.del', '{\"id\":\"5\"}', 'GET', 1536840910);
INSERT INTO `hc_system_log_info` VALUES (428, 101, 'system.permission.del', '{\"id\":\"5\"}', 'GET', 1536840910);
INSERT INTO `hc_system_log_info` VALUES (429, 101, 'system.permission.del', '{\"id\":\"5\"}', 'GET', 1536840911);
INSERT INTO `hc_system_log_info` VALUES (430, 101, 'system.permission.list', 'null', 'GET', 1536840913);
INSERT INTO `hc_system_log_info` VALUES (431, 101, 'system.permission.list', 'null', 'GET', 1536840914);
INSERT INTO `hc_system_log_info` VALUES (432, 101, 'system.permission.list', 'null', 'GET', 1536840914);
INSERT INTO `hc_system_log_info` VALUES (433, 101, 'system.permission.edit', '{\"id\":\"1\"}', 'GET', 1536840916);
INSERT INTO `hc_system_log_info` VALUES (434, 101, 'system.permission.edit', '{\"id\":\"1\"}', 'GET', 1536841540);
INSERT INTO `hc_system_log_info` VALUES (435, 101, 'system.permission.list', 'null', 'GET', 1536841546);
INSERT INTO `hc_system_log_info` VALUES (436, 101, 'system.permission.edit', '{\"id\":\"2\"}', 'GET', 1536841548);
INSERT INTO `hc_system_log_info` VALUES (437, 101, 'system.permission.edit', '{\"id\":\"1\"}', 'GET', 1536841582);
INSERT INTO `hc_system_log_info` VALUES (438, 101, 'system.permission.list', 'null', 'GET', 1536841933);
INSERT INTO `hc_system_log_info` VALUES (439, 101, 'system.permission.del', '{\"id\":\"5\"}', 'GET', 1536841938);
INSERT INTO `hc_system_log_info` VALUES (440, 101, 'system.permission.list', 'null', 'GET', 1536841938);
INSERT INTO `hc_system_log_info` VALUES (441, 101, 'system.permission.del', '{\"id\":\"10\"}', 'GET', 1536841942);
INSERT INTO `hc_system_log_info` VALUES (442, 101, 'system.permission.list', 'null', 'GET', 1536841942);
INSERT INTO `hc_system_log_info` VALUES (443, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536841945);
INSERT INTO `hc_system_log_info` VALUES (444, 101, 'system.permission.list', '{\"page\":\"2\"}', 'GET', 1536841947);
INSERT INTO `hc_system_log_info` VALUES (445, 99, 'system.permission.list', 'null', 'GET', 1536846246);
INSERT INTO `hc_system_log_info` VALUES (446, 99, 'system.permission.edit', '{\"id\":\"1\"}', 'GET', 1536846250);
INSERT INTO `hc_system_log_info` VALUES (447, 101, 'system.permission.list', 'null', 'GET', 1536919906);
INSERT INTO `hc_system_log_info` VALUES (448, 101, 'system.permission.add', 'null', 'GET', 1536919913);
INSERT INTO `hc_system_log_info` VALUES (449, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"mca\":\"promotion.promotion.list\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536919933);
INSERT INTO `hc_system_log_info` VALUES (450, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"mca\":\"promotion.promotion.list\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536919944);
INSERT INTO `hc_system_log_info` VALUES (451, 101, 'system.permission.list', 'null', 'GET', 1536920129);
INSERT INTO `hc_system_log_info` VALUES (452, 101, 'system.permission.list', 'null', 'GET', 1536920134);
INSERT INTO `hc_system_log_info` VALUES (453, 101, 'system.permission.add', 'null', 'GET', 1536920137);
INSERT INTO `hc_system_log_info` VALUES (454, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"mca\":\"promotion.promotion.list\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536920148);
INSERT INTO `hc_system_log_info` VALUES (455, 101, 'system.permission.list', 'null', 'GET', 1536920148);
INSERT INTO `hc_system_log_info` VALUES (456, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536920151);
INSERT INTO `hc_system_log_info` VALUES (457, 101, 'system.permission.edit', '{\"id\":\"50\"}', 'GET', 1536920160);
INSERT INTO `hc_system_log_info` VALUES (458, 101, 'system.permission.list', 'null', 'GET', 1536920198);
INSERT INTO `hc_system_log_info` VALUES (459, 101, 'system.permission.add', 'null', 'GET', 1536920199);
INSERT INTO `hc_system_log_info` VALUES (460, 101, 'system.permission.add', 'null', 'GET', 1536920277);
INSERT INTO `hc_system_log_info` VALUES (461, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536920281);
INSERT INTO `hc_system_log_info` VALUES (462, 101, 'system.permission.del', '{\"id\":\"50\"}', 'GET', 1536920283);
INSERT INTO `hc_system_log_info` VALUES (463, 101, 'system.permission.list', 'null', 'GET', 1536920283);
INSERT INTO `hc_system_log_info` VALUES (464, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536920285);
INSERT INTO `hc_system_log_info` VALUES (465, 101, 'system.permission.edit', '{\"id\":\"49\"}', 'GET', 1536920287);
INSERT INTO `hc_system_log_info` VALUES (466, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"49\",\"mca\":\"promotion.promotion.list\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536920290);
INSERT INTO `hc_system_log_info` VALUES (467, 101, 'system.permission.list', 'null', 'GET', 1536920290);
INSERT INTO `hc_system_log_info` VALUES (468, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536920292);
INSERT INTO `hc_system_log_info` VALUES (469, 101, 'system.permission.add', 'null', 'GET', 1536920298);
INSERT INTO `hc_system_log_info` VALUES (470, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"mca\":\"promotion.promotion.add\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536920309);
INSERT INTO `hc_system_log_info` VALUES (471, 101, 'system.permission.list', 'null', 'GET', 1536920309);
INSERT INTO `hc_system_log_info` VALUES (472, 101, 'system.permission.add', 'null', 'GET', 1536920312);
INSERT INTO `hc_system_log_info` VALUES (473, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"mca\":\"promotion.promotion.edit\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536920328);
INSERT INTO `hc_system_log_info` VALUES (474, 101, 'system.permission.list', 'null', 'GET', 1536920328);
INSERT INTO `hc_system_log_info` VALUES (475, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536920330);
INSERT INTO `hc_system_log_info` VALUES (476, 101, 'system.permission.list', 'null', 'GET', 1536922455);
INSERT INTO `hc_system_log_info` VALUES (477, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536922459);
INSERT INTO `hc_system_log_info` VALUES (478, 99, 'system.permission.list', 'null', 'GET', 1536922600);
INSERT INTO `hc_system_log_info` VALUES (479, 99, 'system.permission.add', 'null', 'GET', 1536922603);
INSERT INTO `hc_system_log_info` VALUES (480, 99, 'system.permission.add', '{\"actionRadio\":\"1\",\"mca\":\"shop.type.add\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536922643);
INSERT INTO `hc_system_log_info` VALUES (481, 99, 'system.permission.add', '{\"actionRadio\":\"1\",\"mca\":\"shop.type.add\",\"statusRadio\":\"1\",\"title\":\"??????\"}', 'POST', 1536923227);
INSERT INTO `hc_system_log_info` VALUES (482, 99, 'system.permission.add', 'null', 'GET', 1536923229);
INSERT INTO `hc_system_log_info` VALUES (483, 101, 'system.permission.list', 'null', 'GET', 1536923787);
INSERT INTO `hc_system_log_info` VALUES (484, 101, 'system.permission.list', '{\"page\":\"4\"}', 'GET', 1536923791);
INSERT INTO `hc_system_log_info` VALUES (485, 101, 'system.permission.edit', '{\"id\":\"74\"}', 'GET', 1536923801);
INSERT INTO `hc_system_log_info` VALUES (486, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"74\",\"mca\":\"portal.promotion.edit\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536923808);
INSERT INTO `hc_system_log_info` VALUES (487, 101, 'system.permission.list', 'null', 'GET', 1536923809);
INSERT INTO `hc_system_log_info` VALUES (488, 101, 'system.permission.list', '{\"page\":\"4\"}', 'GET', 1536923811);
INSERT INTO `hc_system_log_info` VALUES (489, 101, 'system.permission.edit', '{\"id\":\"75\"}', 'GET', 1536923813);
INSERT INTO `hc_system_log_info` VALUES (490, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"75\",\"mca\":\"portal.promotion.del\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536923818);
INSERT INTO `hc_system_log_info` VALUES (491, 101, 'system.permission.list', 'null', 'GET', 1536923819);
INSERT INTO `hc_system_log_info` VALUES (492, 101, 'system.permission.list', '{\"page\":\"4\"}', 'GET', 1536923821);
INSERT INTO `hc_system_log_info` VALUES (493, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536923825);
INSERT INTO `hc_system_log_info` VALUES (494, 101, 'system.permission.list', '{\"page\":\"4\"}', 'GET', 1536923831);
INSERT INTO `hc_system_log_info` VALUES (495, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536923835);
INSERT INTO `hc_system_log_info` VALUES (496, 101, 'system.permission.list', '{\"page\":\"4\"}', 'GET', 1536923841);
INSERT INTO `hc_system_log_info` VALUES (497, 101, 'system.permission.del', '{\"id\":\"74\"}', 'GET', 1536923845);
INSERT INTO `hc_system_log_info` VALUES (498, 101, 'system.permission.list', 'null', 'GET', 1536923845);
INSERT INTO `hc_system_log_info` VALUES (499, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536923847);
INSERT INTO `hc_system_log_info` VALUES (500, 101, 'system.permission.edit', '{\"id\":\"49\"}', 'GET', 1536923850);
INSERT INTO `hc_system_log_info` VALUES (501, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"49\",\"mca\":\"portal.promotion.list\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536923855);
INSERT INTO `hc_system_log_info` VALUES (502, 101, 'system.permission.list', 'null', 'GET', 1536923856);
INSERT INTO `hc_system_log_info` VALUES (503, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536923857);
INSERT INTO `hc_system_log_info` VALUES (504, 101, 'system.permission.edit', '{\"id\":\"51\"}', 'GET', 1536923860);
INSERT INTO `hc_system_log_info` VALUES (505, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"51\",\"mca\":\"portal.promotion.add\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536923865);
INSERT INTO `hc_system_log_info` VALUES (506, 101, 'system.permission.list', 'null', 'GET', 1536923865);
INSERT INTO `hc_system_log_info` VALUES (507, 101, 'system.permission.list', '{\"page\":\"3\"}', 'GET', 1536923866);
INSERT INTO `hc_system_log_info` VALUES (508, 101, 'system.permission.edit', '{\"id\":\"52\"}', 'GET', 1536923869);
INSERT INTO `hc_system_log_info` VALUES (509, 101, 'system.permission.add', '{\"actionRadio\":\"1\",\"id\":\"52\",\"mca\":\"portal.promotion.edit\",\"statusRadio\":\"1\",\"title\":\"????\"}', 'POST', 1536923874);
INSERT INTO `hc_system_log_info` VALUES (510, 101, 'system.permission.list', 'null', 'GET', 1536923874);
INSERT INTO `hc_system_log_info` VALUES (511, 101, 'system.permission.list', 'null', 'GET', 1536923878);
INSERT INTO `hc_system_log_info` VALUES (512, 101, 'system.permission.list', 'null', 'GET', 1536923884);
INSERT INTO `hc_system_log_info` VALUES (513, 101, 'system.permission.list', 'null', 'GET', 1536923949);
INSERT INTO `hc_system_log_info` VALUES (514, 101, 'system.permission.list', 'null', 'GET', 1536924195);
INSERT INTO `hc_system_log_info` VALUES (515, 101, 'system.permission.list', 'null', 'GET', 1536924747);
INSERT INTO `hc_system_log_info` VALUES (516, 101, 'system.permission.list', 'null', 'GET', 1539077795);
INSERT INTO `hc_system_log_info` VALUES (517, 99, 'system.permission.list', 'null', 'GET', 1545200440);
INSERT INTO `hc_system_log_info` VALUES (518, 1, 'system.permission.list', 'null', 'GET', 1549077788);
INSERT INTO `hc_system_log_info` VALUES (519, 1, 'system.permission.list', 'null', 'GET', 1550225952);
INSERT INTO `hc_system_log_info` VALUES (520, 1, 'system.permission.edit', '{\"id\":\"1\"}', 'GET', 1550225952);

-- ----------------------------
-- Table structure for hc_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_menu`;
CREATE TABLE `hc_system_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_action` tinyint(1) NULL DEFAULT 0,
  `mca` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 0,
  `created` int(11) NOT NULL DEFAULT 0,
  `updated` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hc_system_menu
-- ----------------------------
INSERT INTO `hc_system_menu` VALUES (1, 0, 'Portal', '', '', 0, '', '', 5, 1530015141, 1536635587, 1);
INSERT INTO `hc_system_menu` VALUES (2, 0, 'Article', '', 'ti-widget', 0, '', '', 1, 1530015141, 1530068152, 1);
INSERT INTO `hc_system_menu` VALUES (3, 0, 'System', '', 'ti-panel', 0, '', '#', 2, 0, 0, 1);
INSERT INTO `hc_system_menu` VALUES (4, 2, 'Articles', '', '', 1, 'article.article.list', '/article/articles', 1, 0, 1530157016, 1);
INSERT INTO `hc_system_menu` VALUES (5, 2, 'Categories', '', '', 1, 'article.category.list', '/article/categories', 0, 1530156969, 1530156969, 1);
INSERT INTO `hc_system_menu` VALUES (6, 3, '菜单管理', '', 'ti-menu', 1, 'system.menu.list', '/system/menus', 0, 1530156969, 1530156969, 1);
INSERT INTO `hc_system_menu` VALUES (7, 3, '权限管理', '', 'ti-settings', 1, 'system.permission.list', '/system/permissions', 0, 1530156969, 1530156969, 1);
INSERT INTO `hc_system_menu` VALUES (8, 3, '用户管理', '', 'ti-user', 1, 'system.user.list', '/system/users', 0, 1530156969, 1530156969, 1);
INSERT INTO `hc_system_menu` VALUES (9, 3, '角色管理', '', 'ti-bar-chart', 1, 'system.role.list', '/system/roles', 0, 1530190052, 1530190052, 1);
INSERT INTO `hc_system_menu` VALUES (10, 0, 'Tag', '', '', 1, 'tag.tag.list', '/tag/tag/list', 6, 1536491406, 1536655546, 1);
INSERT INTO `hc_system_menu` VALUES (11, 1, 'Banners管理', '', '', 1, 'portal.banner.list', '/portal/banners', 6, 1536491500, 1536650173, 1);
INSERT INTO `hc_system_menu` VALUES (12, 1, 'Menus', '', '', 1, 'portal.menu.list', '/portal/menu/list', 0, 1536491541, 1536650161, 1);
INSERT INTO `hc_system_menu` VALUES (13, 10, 'Tags', '', '', 1, 'tag.tag.list', '/tag/tag/list', 1, 1536656572, 1536656572, 1);
INSERT INTO `hc_system_menu` VALUES (14, 0, 'Shop', '', '', 0, '', '#', 0, 1536657181, 1536657357, 1);
INSERT INTO `hc_system_menu` VALUES (15, 14, 'Product', '', '', 1, 'shop.product.list', '/shop/products', 0, 1536657288, 1536657677, 1);
INSERT INTO `hc_system_menu` VALUES (16, 14, 'ProductCategory', '', '', 1, 'shop.productcategory.list', '/shop/productcategorys', 2, 1536817673, 1536817708, 1);
INSERT INTO `hc_system_menu` VALUES (18, 1, 'Promotions', '', '', 1, 'portal.promotion.list', '/portal/promotions', 1, 1536922252, 1536924790, 1);
INSERT INTO `hc_system_menu` VALUES (19, 14, 'Type', '', '', 1, 'shop.type.list', '/shop/types', 0, 1536922355, 1536922355, 1);
INSERT INTO `hc_system_menu` VALUES (21, 14, 'Properties', '', '', 1, 'shop.property.list', '/shop/properties', 0, 1536922417, 1536922417, 1);
INSERT INTO `hc_system_menu` VALUES (22, 14, 'PropertyOptions', '', '', 1, 'shop.propertyoption.list', '/shop/propertyoptions', 0, 1536922477, 1536922477, 1);
INSERT INTO `hc_system_menu` VALUES (23, 14, 'Typeproperties', '', '', 1, 'shop.typerelationproperty.list', '/shop/typeproperties', 0, 1536922561, 1536922561, 1);
INSERT INTO `hc_system_menu` VALUES (24, 14, 'Typefilter', '', '', 1, 'shop.typefilter.list', '/shop/typefilters', 0, 1536922592, 1536922592, 1);
INSERT INTO `hc_system_menu` VALUES (25, 0, 'Comment', '', '', 1, 'comment.comment.list', '/comment/comments', 14, 1540544497, 1540544497, 1);
INSERT INTO `hc_system_menu` VALUES (26, 3, 'Permission Group', '', '', 1, 'system.permissiongroup.list', '/system/permission/groups', 0, 1548668312, 1548668312, 1);
INSERT INTO `hc_system_menu` VALUES (27, 0, '项目管理', '', 'ti-light-bulb', 0, '', '', 0, 1545206026, 1545206026, 1);
INSERT INTO `hc_system_menu` VALUES (28, 0, '文档管理', '', 'ti-files', 0, '', '', 0, 1545206026, 1545206026, 1);
INSERT INTO `hc_system_menu` VALUES (29, 0, '系统管理', '', 'ti-panel', 0, '', '', 0, 1545206026, 1545206026, 1);
INSERT INTO `hc_system_menu` VALUES (30, 27, '项目列表', '', 'ti-list', 1, 'project.project.list', '/project/projects', 0, 1545206026, 1545206026, 1);
INSERT INTO `hc_system_menu` VALUES (35, 28, '文档列表', '', 'ti-view-list-alt', 1, 'document.document.list', '/document/documents', 0, 1545206026, 1545206026, 1);
INSERT INTO `hc_system_menu` VALUES (36, 3, '语言包管理', '__SYSTEM_MENU_36', '', 1, 'system.langpackage.list', '/language/package', 0, 1557369344, 1558347075, 1);

-- ----------------------------
-- Table structure for hc_system_permission
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_permission`;
CREATE TABLE `hc_system_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mca` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT 1,
  `is_action` tinyint(1) NOT NULL DEFAULT 0,
  `created` int(11) NOT NULL DEFAULT 0,
  `updated` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_permission
-- ----------------------------
INSERT INTO `hc_system_permission` VALUES (1, 'system.file.upload', '文件上传', 1, 1, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (2, 'system.log.del', '删除日志', 1, 1, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (3, 'system.log.list', '查看历史', 1, 1, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (4, 'system.menu.add', '添加菜单', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (5, 'system.menu.del', '删除菜单', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (6, 'system.menu.edit', '编辑菜单', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (7, 'system.menu.list', '菜单列表', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (8, 'system.permission.add', '添加权限', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (9, 'system.permission.del', '删除权限', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (10, 'system.permission.edit', '编辑权限', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (11, 'system.permission.list', '权限列表', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (12, 'system.role.add', '添加角色', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (13, 'system.role.del', '删除角色', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (14, 'system.role.edit', '编辑角色', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (15, 'system.role.list', '角色列表', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (16, 'system.user.add', '添加用户', 1, 1, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (17, 'system.user.del', '删除用户', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (18, 'system.user.edit', '编辑用户', 1, 1, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (19, 'system.user.list', '用户列表', 1, 0, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (20, 'system.user.profile', '个人信息', 1, 1, 1545206466, 1545206466, 1);
INSERT INTO `hc_system_permission` VALUES (21, 'project.project.list', '项目列表', 1, 1, 1545218607, 1545227180, 1);
INSERT INTO `hc_system_permission` VALUES (22, 'project.project.del', '删除/禁用项目', 1, 1, 1545227168, 1545227168, 1);
INSERT INTO `hc_system_permission` VALUES (23, 'project.project.edit', '新增/修改项目', 1, 1, 1545227343, 1545227343, 1);
INSERT INTO `hc_system_permission` VALUES (24, 'document.document.list', '文档列表', 1, 1, 1545287084, 1545287300, 1);
INSERT INTO `hc_system_permission` VALUES (25, 'document.document.edit', '新增/修改文档', 1, 1, 1545287118, 1545287118, 1);
INSERT INTO `hc_system_permission` VALUES (26, 'document.document.del', '删除/禁用文档', 1, 1, 1545287154, 1545287154, 1);
INSERT INTO `hc_system_permission` VALUES (27, 'document.document.history', '文档历史列表', 1, 1, 1545290031, 1545290031, 1);
INSERT INTO `hc_system_permission` VALUES (28, 'document.node.list', '文档节点管理', 1, 1, 1545360893, 1545360893, 1);
INSERT INTO `hc_system_permission` VALUES (29, 'document.node.edit', '新增/编辑文档节点', 1, 1, 1545360936, 1545360936, 1);
INSERT INTO `hc_system_permission` VALUES (30, 'document.node.del', '删除/禁用文档节点', 1, 1, 1545360968, 1545360968, 1);
INSERT INTO `hc_system_permission` VALUES (31, 'portal.banner.list', 'Banner管理', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (32, 'portal.banner.add', 'Banner添加', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (33, 'portal.banner.edit', 'Banner编辑', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (34, 'portal.banner.del', 'Banner删除', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (35, 'article.article.add', 'add article', 1, 0, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (36, 'article.article.del', '删除 文章', 1, 0, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (37, 'article.article.edit', '编辑文章', 1, 0, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (38, 'article.article.list', '文章列表', 1, 0, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (39, 'article.category.add', '添加分类', 1, 0, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (40, 'article.category.del', '删除分类', 1, 0, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (41, 'article.category.edit', '编辑分类', 1, 0, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (42, 'article.category.list', '分类列表', 1, 0, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (43, 'portal.menu.add', '前端菜单添加', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (44, 'portal.menu.del', '删除前端菜单', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (45, 'portal.menu.edit', '前端菜单编辑', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (46, 'portal.menu.list', '前端菜单列表', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (47, 'shop.product.add', '添加商城商品', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (48, 'shop.product.del', '删除商城商品', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (49, 'shop.product.edit', '修改商城商品', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (50, 'shop.product.list', '产品列表', 1, 0, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (51, 'shop.productcategory.add', '添加商品分类', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (52, 'shop.productcategory.del', '删除商品分类', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (53, 'shop.productcategory.edit', '修改商品分类', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (54, 'shop.productcategory.list', '商城商品分类', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (55, 'tag.tag.add', '标签添加', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (56, 'tag.tag.del', '删除标签', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (57, 'tag.tag.edit', '标签编辑', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (58, 'tag.tag.list', '标签列表', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (59, 'portal.promotion.list', '推荐列表', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (60, 'portal.promotion.add', '推荐添加', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (61, 'portal.promotion.edit', '推荐编辑', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (62, 'shop.type.add', '添加商品分类类别', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (63, 'shop.type.edit', '修改商品分类类别', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (64, 'shop.type.del', '删除商品分类类别', 1, 1, 1546435893, 1546435893, 1);
INSERT INTO `hc_system_permission` VALUES (65, 'shop.property.list', '商品分类类别列表', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (66, 'shop.property.list', '商品属性列表', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (67, 'shop.property.add', '添加商品属性配置', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (68, 'shop.property.edit', '修改商品属性配置', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (69, 'shop.property.del', '删除商品属性配置', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (70, 'shop.propertyoption.list', '商品属性值列表', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (71, 'shop.propertyoption.add', '添加商品属性值', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (72, 'shop.propertyoption.edit', '修改商品属性值', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (73, 'shop.propertyoption.del', '删除商品属性值', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (74, 'shop.typerelationproperty.list', '类别关联属性列表', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (75, 'shop.typerelationproperty.add', '添加类别关联属性', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (76, 'shop.typerelationproperty.edit', '修改类别关联属性', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (77, 'shop.typerelationproperty.del', '删除类别关联属性', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (78, 'shop.typerelationproperty.listByType', '类别关联属性查询接口', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (79, 'shop.typefilter.list', '筛选器配置列表', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (80, 'shop.typefilter.add', '添加筛选器配置', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (81, 'shop.typefilter.edit', '修改筛选器配置', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (82, 'shop.typefilter.del', '删除筛选器配置', 1, 1, 1536920328, 1536920328, 1);
INSERT INTO `hc_system_permission` VALUES (83, 'portal.promotion.del', '推荐删除', 1, 1, 1536920148, 1536923818, 1);
INSERT INTO `hc_system_permission` VALUES (84, 'system.permissiongroup.list', '权限组列表', 1, 1, 1548668312, 1548668312, 1);
INSERT INTO `hc_system_permission` VALUES (85, 'system.permissiongroup.add', '添加用户组', 2, 1, 1548668701, 1548670493, 1);
INSERT INTO `hc_system_permission` VALUES (86, 'system.langpackage.list', '语言包列表页', 2, 1, 1557221102, 1557221102, 1);
INSERT INTO `hc_system_permission` VALUES (87, 'system.langpackage.add', '语言包添加', 2, 1, 1557369210, 1557369210, 1);
INSERT INTO `hc_system_permission` VALUES (88, 'system.langpackage.edit', '语言包编辑', 2, 1, 1557369233, 1557369233, 1);
INSERT INTO `hc_system_permission` VALUES (89, 'system.langpackage.del', '语言包删除', 2, 1, 1557369252, 1557369252, 1);

-- ----------------------------
-- Table structure for hc_system_permission_group
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_permission_group`;
CREATE TABLE `hc_system_permission_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '中文显示名',
  `sign` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '英文标识组',
  `sort` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created` int(11) NOT NULL DEFAULT 0,
  `updated` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_permission_group
-- ----------------------------
INSERT INTO `hc_system_permission_group` VALUES (1, '未分组权限', 'no_group', 1, 1, 1548668701, 1548668701);
INSERT INTO `hc_system_permission_group` VALUES (2, '系统权限', 'system', 1, 1, 1548668701, 1548668701);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_role
-- ----------------------------
INSERT INTO `hc_system_role` VALUES (1, '超级管理员', 0, 0, 1);
INSERT INTO `hc_system_role` VALUES (2, '管理员', 0, 0, 1);
INSERT INTO `hc_system_role` VALUES (3, '内容编辑', 0, 0, 1);
INSERT INTO `hc_system_role` VALUES (4, '功能测试', 0, 0, 1);

-- ----------------------------
-- Table structure for hc_system_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `hc_system_role_permission`;
CREATE TABLE `hc_system_role_permission`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NULL DEFAULT NULL,
  `permission_mca` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 660 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_role_permission
-- ----------------------------
INSERT INTO `hc_system_role_permission` VALUES (571, 1, 63, '');
INSERT INTO `hc_system_role_permission` VALUES (572, 1, 52, '');
INSERT INTO `hc_system_role_permission` VALUES (573, 1, 12, '');
INSERT INTO `hc_system_role_permission` VALUES (574, 1, 28, '');
INSERT INTO `hc_system_role_permission` VALUES (575, 1, 38, '');
INSERT INTO `hc_system_role_permission` VALUES (576, 1, 41, '');
INSERT INTO `hc_system_role_permission` VALUES (577, 1, 58, '');
INSERT INTO `hc_system_role_permission` VALUES (578, 1, 25, '');
INSERT INTO `hc_system_role_permission` VALUES (579, 1, 76, '');
INSERT INTO `hc_system_role_permission` VALUES (580, 1, 71, '');
INSERT INTO `hc_system_role_permission` VALUES (581, 1, 34, '');
INSERT INTO `hc_system_role_permission` VALUES (582, 1, 48, '');
INSERT INTO `hc_system_role_permission` VALUES (583, 1, 36, '');
INSERT INTO `hc_system_role_permission` VALUES (584, 1, 59, '');
INSERT INTO `hc_system_role_permission` VALUES (585, 1, 7, '');
INSERT INTO `hc_system_role_permission` VALUES (586, 1, 68, '');
INSERT INTO `hc_system_role_permission` VALUES (587, 1, 83, '');
INSERT INTO `hc_system_role_permission` VALUES (588, 1, 89, '');
INSERT INTO `hc_system_role_permission` VALUES (589, 1, 80, '');
INSERT INTO `hc_system_role_permission` VALUES (590, 1, 13, '');
INSERT INTO `hc_system_role_permission` VALUES (591, 1, 32, '');
INSERT INTO `hc_system_role_permission` VALUES (592, 1, 39, '');
INSERT INTO `hc_system_role_permission` VALUES (593, 1, 33, '');
INSERT INTO `hc_system_role_permission` VALUES (594, 1, 26, '');
INSERT INTO `hc_system_role_permission` VALUES (595, 1, 55, '');
INSERT INTO `hc_system_role_permission` VALUES (596, 1, 10, '');
INSERT INTO `hc_system_role_permission` VALUES (597, 1, 49, '');
INSERT INTO `hc_system_role_permission` VALUES (598, 1, 18, '');
INSERT INTO `hc_system_role_permission` VALUES (599, 1, 20, '');
INSERT INTO `hc_system_role_permission` VALUES (600, 1, 17, '');
INSERT INTO `hc_system_role_permission` VALUES (601, 1, 4, '');
INSERT INTO `hc_system_role_permission` VALUES (602, 1, 1, '');
INSERT INTO `hc_system_role_permission` VALUES (603, 1, 40, '');
INSERT INTO `hc_system_role_permission` VALUES (604, 1, 66, '');
INSERT INTO `hc_system_role_permission` VALUES (605, 1, 77, '');
INSERT INTO `hc_system_role_permission` VALUES (606, 1, 19, '');
INSERT INTO `hc_system_role_permission` VALUES (607, 1, 69, '');
INSERT INTO `hc_system_role_permission` VALUES (608, 1, 54, '');
INSERT INTO `hc_system_role_permission` VALUES (609, 1, 61, '');
INSERT INTO `hc_system_role_permission` VALUES (610, 1, 35, '');
INSERT INTO `hc_system_role_permission` VALUES (611, 1, 46, '');
INSERT INTO `hc_system_role_permission` VALUES (612, 1, 5, '');
INSERT INTO `hc_system_role_permission` VALUES (613, 1, 23, '');
INSERT INTO `hc_system_role_permission` VALUES (614, 1, 2, '');
INSERT INTO `hc_system_role_permission` VALUES (615, 1, 30, '');
INSERT INTO `hc_system_role_permission` VALUES (616, 1, 9, '');
INSERT INTO `hc_system_role_permission` VALUES (617, 1, 44, '');
INSERT INTO `hc_system_role_permission` VALUES (618, 1, 21, '');
INSERT INTO `hc_system_role_permission` VALUES (619, 1, 8, '');
INSERT INTO `hc_system_role_permission` VALUES (620, 1, 37, '');
INSERT INTO `hc_system_role_permission` VALUES (621, 1, 75, '');
INSERT INTO `hc_system_role_permission` VALUES (622, 1, 51, '');
INSERT INTO `hc_system_role_permission` VALUES (623, 1, 50, '');
INSERT INTO `hc_system_role_permission` VALUES (624, 1, 60, '');
INSERT INTO `hc_system_role_permission` VALUES (625, 1, 3, '');
INSERT INTO `hc_system_role_permission` VALUES (626, 1, 42, '');
INSERT INTO `hc_system_role_permission` VALUES (627, 1, 29, '');
INSERT INTO `hc_system_role_permission` VALUES (628, 1, 6, '');
INSERT INTO `hc_system_role_permission` VALUES (629, 1, 86, '');
INSERT INTO `hc_system_role_permission` VALUES (630, 1, 85, '');
INSERT INTO `hc_system_role_permission` VALUES (631, 1, 65, '');
INSERT INTO `hc_system_role_permission` VALUES (632, 1, 11, '');
INSERT INTO `hc_system_role_permission` VALUES (633, 1, 78, '');
INSERT INTO `hc_system_role_permission` VALUES (634, 1, 87, '');
INSERT INTO `hc_system_role_permission` VALUES (635, 1, 27, '');
INSERT INTO `hc_system_role_permission` VALUES (636, 1, 45, '');
INSERT INTO `hc_system_role_permission` VALUES (637, 1, 57, '');
INSERT INTO `hc_system_role_permission` VALUES (638, 1, 31, '');
INSERT INTO `hc_system_role_permission` VALUES (639, 1, 56, '');
INSERT INTO `hc_system_role_permission` VALUES (640, 1, 15, '');
INSERT INTO `hc_system_role_permission` VALUES (641, 1, 81, '');
INSERT INTO `hc_system_role_permission` VALUES (642, 1, 79, '');
INSERT INTO `hc_system_role_permission` VALUES (643, 1, 24, '');
INSERT INTO `hc_system_role_permission` VALUES (644, 1, 73, '');
INSERT INTO `hc_system_role_permission` VALUES (645, 1, 67, '');
INSERT INTO `hc_system_role_permission` VALUES (646, 1, 88, '');
INSERT INTO `hc_system_role_permission` VALUES (647, 1, 14, '');
INSERT INTO `hc_system_role_permission` VALUES (648, 1, 72, '');
INSERT INTO `hc_system_role_permission` VALUES (649, 1, 64, '');
INSERT INTO `hc_system_role_permission` VALUES (650, 1, 84, '');
INSERT INTO `hc_system_role_permission` VALUES (651, 1, 82, '');
INSERT INTO `hc_system_role_permission` VALUES (652, 1, 43, '');
INSERT INTO `hc_system_role_permission` VALUES (653, 1, 53, '');
INSERT INTO `hc_system_role_permission` VALUES (654, 1, 74, '');
INSERT INTO `hc_system_role_permission` VALUES (655, 1, 16, '');
INSERT INTO `hc_system_role_permission` VALUES (656, 1, 70, '');
INSERT INTO `hc_system_role_permission` VALUES (657, 1, 22, '');
INSERT INTO `hc_system_role_permission` VALUES (658, 1, 47, '');
INSERT INTO `hc_system_role_permission` VALUES (659, 1, 62, '');

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
  `language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_user
-- ----------------------------
INSERT INTO `hc_system_user` VALUES (1, 'admin@putao.com', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', '', '超级管理员', '', 1545203856, 1545203856, 1, 1, 'zh-cn');
INSERT INTO `hc_system_user` VALUES (2, 'test@putao.com', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', '', '功能测试', '', 1545203856, 1545203856, 1, 0, 'zh-cn');

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
  CONSTRAINT `hc_system_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `hc_system_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hc_system_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `hc_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_system_user_role
-- ----------------------------
INSERT INTO `hc_system_user_role` VALUES (1, 1, 1);
INSERT INTO `hc_system_user_role` VALUES (2, 2, 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签关联文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_tag_article
-- ----------------------------
INSERT INTO `hc_tag_article` VALUES (1, 49, 16, 1536719438);
INSERT INTO `hc_tag_article` VALUES (2, 49, 17, 1536720301);
INSERT INTO `hc_tag_article` VALUES (4, 2, 19, 1536721378);
INSERT INTO `hc_tag_article` VALUES (5, 2, 20, 1536721777);
INSERT INTO `hc_tag_article` VALUES (6, 1, 21, 1536721959);
INSERT INTO `hc_tag_article` VALUES (7, 2, 21, 1536721959);
INSERT INTO `hc_tag_article` VALUES (12, 1, 18, 1536734296);
INSERT INTO `hc_tag_article` VALUES (13, 2, 18, 1536734296);
INSERT INTO `hc_tag_article` VALUES (22, 1, 9, 1536802876);
INSERT INTO `hc_tag_article` VALUES (23, 0, 9, 1536802876);
INSERT INTO `hc_tag_article` VALUES (24, 1, 22, 1536804426);
INSERT INTO `hc_tag_article` VALUES (25, 2, 22, 1536804426);
INSERT INTO `hc_tag_article` VALUES (26, 1, 26, 1536810232);
INSERT INTO `hc_tag_article` VALUES (27, 0, 26, 1536810232);
INSERT INTO `hc_tag_article` VALUES (44, 1, 27, 1536842269);
INSERT INTO `hc_tag_article` VALUES (45, 0, 27, 1536842269);
INSERT INTO `hc_tag_article` VALUES (46, 0, 28, 1536842301);
INSERT INTO `hc_tag_article` VALUES (47, 2, 28, 1536842301);
INSERT INTO `hc_tag_article` VALUES (48, 1, 7, 1536894783);
INSERT INTO `hc_tag_article` VALUES (49, 0, 7, 1536894783);
INSERT INTO `hc_tag_article` VALUES (50, 0, 35, 1543395507);
INSERT INTO `hc_tag_article` VALUES (51, 2, 35, 1543395507);
INSERT INTO `hc_tag_article` VALUES (52, 0, 36, 1543478012);
INSERT INTO `hc_tag_article` VALUES (53, 0, 36, 1543478012);
INSERT INTO `hc_tag_article` VALUES (54, 1, 37, 1543481163);
INSERT INTO `hc_tag_article` VALUES (55, 2, 37, 1543481163);
INSERT INTO `hc_tag_article` VALUES (56, 1, 38, 1543481715);
INSERT INTO `hc_tag_article` VALUES (57, 2, 38, 1543481715);
INSERT INTO `hc_tag_article` VALUES (58, 0, 39, 1543484709);
INSERT INTO `hc_tag_article` VALUES (59, 2, 39, 1543484709);

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签关联文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_tag_product
-- ----------------------------
INSERT INTO `hc_tag_product` VALUES (1, 0, 67, 1536903447);
INSERT INTO `hc_tag_product` VALUES (2, 2, 67, 1536903447);
INSERT INTO `hc_tag_product` VALUES (3, 0, 68, 1536904833);
INSERT INTO `hc_tag_product` VALUES (4, 2, 68, 1536904833);
INSERT INTO `hc_tag_product` VALUES (5, 0, 69, 1536905414);
INSERT INTO `hc_tag_product` VALUES (6, 2, 69, 1536905414);
INSERT INTO `hc_tag_product` VALUES (9, 0, 71, 1536906782);
INSERT INTO `hc_tag_product` VALUES (10, 2, 71, 1536906782);
INSERT INTO `hc_tag_product` VALUES (11, 0, 72, 1536907316);
INSERT INTO `hc_tag_product` VALUES (12, 2, 72, 1536907316);
INSERT INTO `hc_tag_product` VALUES (13, 0, 73, 1536907385);
INSERT INTO `hc_tag_product` VALUES (14, 2, 73, 1536907385);
INSERT INTO `hc_tag_product` VALUES (15, 0, 74, 1536911286);
INSERT INTO `hc_tag_product` VALUES (16, 2, 74, 1536911286);
INSERT INTO `hc_tag_product` VALUES (17, 0, 75, 1536911372);
INSERT INTO `hc_tag_product` VALUES (18, 2, 75, 1536911372);
INSERT INTO `hc_tag_product` VALUES (21, 0, 76, 1536912489);
INSERT INTO `hc_tag_product` VALUES (22, 2, 76, 1536912489);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hc_tag_tag
-- ----------------------------
INSERT INTO `hc_tag_tag` VALUES (1, 'abc', 0, 1536563714, 1536563714, 1);
INSERT INTO `hc_tag_tag` VALUES (2, 'bcd', 0, 1536563714, 1536563714, 1);

SET FOREIGN_KEY_CHECKS = 1;
