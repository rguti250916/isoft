/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : isoft_desarrollo

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-07-15 11:14:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for af_activos
-- ----------------------------
DROP TABLE IF EXISTS `af_activos`;
CREATE TABLE `af_activos` (
`acti_codigo`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`acti_placa`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`acti_establecimiento`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`acti_subgrupo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`acti_marca`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`acti_presentacion`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`acti_serial`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`acti_modelo`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`acti_ubicacion`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`acti_responsable`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`acti_conceptoingreso`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`acti_fcompra`  date NULL DEFAULT NULL ,
`acti_docusoporte`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`acti_proveedor`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`acti_costo`  double(12,2) UNSIGNED NULL DEFAULT NULL ,
`acti_depreciable`  enum('S','N') CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT 'N' ,
`acti_depreciacion`  char(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`acti_finiciodepreciacion`  date NULL DEFAULT NULL ,
`acti_vidautil`  int(3) UNSIGNED NULL DEFAULT NULL ,
`acti_vidautilrestante`  int(3) UNSIGNED NULL DEFAULT NULL ,
`acti_valorrescate`  double(12,2) NULL DEFAULT NULL ,
`acti_depracumulada`  double(12,2) UNSIGNED NULL DEFAULT NULL ,
`acti_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`acti_fcreacion`  datetime NOT NULL ,
`acti_estado`  enum('I','D','A') CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT 'A' ,
PRIMARY KEY (`acti_codigo`),
FOREIGN KEY (`acti_establecimiento`) REFERENCES `cfg_establecimientos` (`esta_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`acti_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`acti_subgrupo`) REFERENCES `af_subgrupos` (`subg_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`acti_marca`) REFERENCES `af_marcas` (`marc_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`acti_presentacion`) REFERENCES `af_presentaciones` (`pres_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`acti_ubicacion`) REFERENCES `af_ubicaciones` (`ubic_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`acti_responsable`) REFERENCES `publica`.`mae_personas` (`pers_nit`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`acti_conceptoingreso`) REFERENCES `af_conceptos` (`ccom_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`acti_proveedor`) REFERENCES `publica`.`mae_personas` (`pers_nit`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`acti_depreciacion`) REFERENCES `af_depreciaciones` (`depr_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `acti_establecimiento` (`acti_establecimiento`) USING BTREE ,
INDEX `acti_subgrupo` (`acti_subgrupo`) USING BTREE ,
INDEX `acti_marca` (`acti_marca`) USING BTREE ,
INDEX `acti_presentacion` (`acti_presentacion`) USING BTREE ,
INDEX `acti_ubicacion` (`acti_ubicacion`) USING BTREE ,
INDEX `acti_responsable` (`acti_responsable`) USING BTREE ,
INDEX `acti_conceptoingreso` (`acti_conceptoingreso`) USING BTREE ,
INDEX `acti_proveedor` (`acti_proveedor`) USING BTREE ,
INDEX `acti_depreciacion` (`acti_depreciacion`) USING BTREE ,
INDEX `acti_usrcreacion` (`acti_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of af_activos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for af_categorias
-- ----------------------------
DROP TABLE IF EXISTS `af_categorias`;
CREATE TABLE `af_categorias` (
`cate_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`cate_linea`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`cate_nombres`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`cate_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`cate_fcreacion`  datetime NULL DEFAULT NULL ,
`cate_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`cate_codigo`),
FOREIGN KEY (`cate_linea`) REFERENCES `af_lineas` (`line_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`cate_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `cate_linea` (`cate_linea`) USING BTREE ,
INDEX `cate_usrcreacion` (`cate_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of af_categorias
-- ----------------------------
BEGIN;
INSERT INTO `af_categorias` VALUES ('001', '001', 'COMPUTADORES', 'ADMIN', '2017-06-28 20:24:10', 'A'), ('002', '001', 'DISPOSITIVOS DE ALMACENAMIENTO', 'ADMIN', '2017-06-28 20:24:51', 'A');
COMMIT;

-- ----------------------------
-- Table structure for af_conceptos
-- ----------------------------
DROP TABLE IF EXISTS `af_conceptos`;
CREATE TABLE `af_conceptos` (
`ccom_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`ccom_nombre`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`ccom_tipo`  enum('C','D','M') CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL COMMENT 'C: Compra. D: dada de baja. M: Mantenimiento' ,
`ccom_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`ccom_fcreacion`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`ccom_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`ccom_codigo`),
FOREIGN KEY (`ccom_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `ccom_usrcreacion` (`ccom_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of af_conceptos
-- ----------------------------
BEGIN;
INSERT INTO `af_conceptos` VALUES ('001', 'COMPRA', 'C', 'ADMIN', '2017-07-13 16:19:44', 'A'), ('002', 'CONTRATO', 'C', 'ADMIN', '2017-07-13 16:19:55', 'A'), ('003', 'DONACION', 'C', 'ADMIN', '2017-07-13 16:20:05', 'A'), ('004', 'ORDEN DE SUMINISTRO', 'C', 'ADMIN', '2017-07-13 16:20:49', 'A'), ('005', 'TRASLADO', 'M', 'ADMIN', '2017-07-14 08:55:38', 'A');
COMMIT;

-- ----------------------------
-- Table structure for af_depreciaciones
-- ----------------------------
DROP TABLE IF EXISTS `af_depreciaciones`;
CREATE TABLE `af_depreciaciones` (
`depr_codigo`  char(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`depr_nombres`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`depr_metodo`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`depr_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`depr_fcreacion`  datetime NOT NULL ,
`depr_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`depr_codigo`),
FOREIGN KEY (`depr_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `depr_codigo` (`depr_codigo`) USING BTREE ,
INDEX `depr_usrcreacion` (`depr_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of af_depreciaciones
-- ----------------------------
BEGIN;
INSERT INTO `af_depreciaciones` VALUES ('01', 'LINEA RECTA', null, 'ADMIN', '2017-06-18 22:46:12', 'A');
COMMIT;

-- ----------------------------
-- Table structure for af_grupos
-- ----------------------------
DROP TABLE IF EXISTS `af_grupos`;
CREATE TABLE `af_grupos` (
`grup_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`grup_categoria`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`grup_nombres`  varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`grup_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`grup_fcreacion`  datetime NOT NULL ,
`grup_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT 'A' ,
PRIMARY KEY (`grup_codigo`),
FOREIGN KEY (`grup_categoria`) REFERENCES `af_categorias` (`cate_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`grup_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `grup_categoria` (`grup_categoria`) USING BTREE ,
INDEX `grup_usrcreacion` (`grup_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of af_grupos
-- ----------------------------
BEGIN;
INSERT INTO `af_grupos` VALUES ('001', '001', 'UNIDAD LEC Y/O ALMAC. EXTRAIBLE', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('002', '001', 'DISPOSITIVOS DE COMUNICACION', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('003', '001', 'MONITOR', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('004', '001', 'MOTHER BOARD', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('005', '001', 'PROCESADOR', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('006', '001', 'MEMORIA', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('007', '001', 'REGULADOR', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('008', '001', 'DISCO DURO', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('009', '001', 'ACCESORIOS                                                  ', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('010', '001', 'PORTATIL', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('011', '001', 'TODO EN UNO                                                 ', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('012', '001', 'IMPRESORAS', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('013', '001', 'SERVIDORES', 'ADMIN', '2017-07-06 21:29:53', 'A'), ('014', '001', 'SCANNER', 'ADMIN', '2017-07-06 21:32:31', 'A');
COMMIT;

-- ----------------------------
-- Table structure for af_lineas
-- ----------------------------
DROP TABLE IF EXISTS `af_lineas`;
CREATE TABLE `af_lineas` (
`line_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`line_nombres`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`line_descripcion`  text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`line_ctaactivo`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`line_ctadepreciacion`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`line_ctagasto`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`line_ctacorreccion`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`line_depreciacion`  char(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`line_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`line_fcreacion`  datetime NULL DEFAULT NULL ,
`line_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`line_codigo`),
FOREIGN KEY (`line_ctaactivo`) REFERENCES `cn_puc` (`puc_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`line_ctagasto`) REFERENCES `cn_puc` (`puc_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`line_ctacorreccion`) REFERENCES `cn_puc` (`puc_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`line_depreciacion`) REFERENCES `af_depreciaciones` (`depr_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`line_ctadepreciacion`) REFERENCES `cn_puc` (`puc_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`line_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `line_codigo` (`line_codigo`) USING BTREE ,
INDEX `line_ctaactivo` (`line_ctaactivo`) USING BTREE ,
INDEX `line_ctagasto` (`line_ctagasto`) USING BTREE ,
INDEX `line_ctacorreccion` (`line_ctacorreccion`) USING BTREE ,
INDEX `line_depreciacion` (`line_depreciacion`) USING BTREE ,
INDEX `line_ctadepreciacion` (`line_ctadepreciacion`) USING BTREE ,
INDEX `line_usrcreacion` (`line_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of af_lineas
-- ----------------------------
BEGIN;
INSERT INTO `af_lineas` VALUES ('001', 'EQUIPOS DE TECNOLOGIA                                       ', 'EQUIPOS DE TECNOLOGIA ', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-06-18 22:52:38', 'A'), ('002', 'SERVIDORES                                                  ', 'SERVIDORES                                                  ', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-06-18 22:52:38', 'I'), ('003', 'EQUIPOS DE TECNOLOGIA                                       ', 'EQUIPOS DE TECNOLOGIA                                       ', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-06-18 22:52:38', 'I'), ('004', 'EQUIPOS DE REFRIGERACION                                    ', 'EQUIPOS DE REFRIGERACION                                    ', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-06-18 22:52:38', 'A'), ('005', 'EQUIPOS DE TRANSPORTE', 'EQUIPOS DE TRANSPORTE', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-07-06 20:49:27', 'A'), ('006', 'MAQUINARIA', 'MAQUINARIA', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-07-06 20:49:52', 'A'), ('007', 'EQUIPOS ELECTRONICOS', 'EQUIPOS ELECTRONICOS', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-07-06 20:50:27', 'A'), ('008', 'EQUIPOS DE DEPOSITOS', 'EQUIPOS DE DEPOSITOS', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-07-06 20:50:49', 'A'), ('009', 'EQUIPOS DE CLIMATIZACION', 'EQUIPOS DE CLIMATIZACION', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-07-06 20:51:11', 'A');
COMMIT;

-- ----------------------------
-- Table structure for af_marcas
-- ----------------------------
DROP TABLE IF EXISTS `af_marcas`;
CREATE TABLE `af_marcas` (
`marc_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`marc_nombre`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`marc_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`marc_fcreacion`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`marc_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`marc_codigo`),
FOREIGN KEY (`marc_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `marc_usrcreacion` (`marc_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of af_marcas
-- ----------------------------
BEGIN;
INSERT INTO `af_marcas` VALUES ('001', 'MAXTOR', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('002', 'XEROX', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('003', 'QUEST', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('004', 'CNET', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('005', 'ENCORE', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('006', 'PLANET', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('007', 'LINKSYS', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('008', '3BUMEN', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('009', 'ADVANTEK', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('010', 'CARRIER', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('011', 'CIAC', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('012', 'CONFORTSTAR', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('013', 'RICOH', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('014', 'GENERAL ELECTRIC', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('015', 'MILLER', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('016', 'NEW LIFE', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('017', 'STARLIGHT', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('018', 'YORK', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('019', 'HONEYWELL', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('020', 'GRANDSTREAM', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('021', 'SHARP', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('022', 'TOSHIBA', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('023', 'MITSUBISHI ELECTRONICS', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('024', 'NEC', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('025', 'NOKIA', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('026', 'PANASONIC', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('027', 'SONY', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('028', 'LG', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('029', 'QUANTUM', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('030', 'AOC', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('031', 'QBEX', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('032', 'HP', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('033', 'PACKARD BELL', 'ADMIN', '2017-06-25 11:15:07', 'A'), ('034', 'DELL', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('035', 'IBM', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('036', 'ACER', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('037', 'INTEL', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('038', 'AMD', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('039', 'XEON', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('040', 'WESTERN DIGITAL', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('041', 'CIRIX', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('042', 'IBM', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('043', 'KINGSTON', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('044', 'SAMSUNG', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('045', 'MICRON', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('046', 'TITAN', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('047', 'MARKVISION', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('048', 'GENIUS', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('049', 'LOGITECH', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('050', 'FUJITSU', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('051', 'HITACHI', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('052', 'CREATIVE', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('053', 'MABE', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('054', 'HACEB', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('055', 'WHIRPOOL', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('056', 'CENTRALES', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('057', 'GENERICO', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('058', 'CHEVROLETH', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('059', 'DMG', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('060', 'HANNA MOTORS', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('061', 'DAEWOO', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('062', 'APPLE', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('063', 'AUDI SPARSA', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('064', 'PCCHIPS', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('065', 'PC SMART', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('066', 'CISCO', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('067', 'COMPAQ', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('068', 'A-DATA TECHNOLOGY', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('069', 'QIMONDA AG', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('070', 'INTEL PEARL CREEK', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('071', 'DELL POWER EDGE', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('072', 'INTEL XEON', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('073', 'CANNON', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('074', 'ESYSTOR', 'ADMIN', '2017-06-25 11:15:08', 'A'), ('075', 'SEAGATE', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('076', 'FOXCONN', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('077', 'ASROCK', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('078', 'ELITE GROUP', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('079', 'BIOSTAR', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('080', 'INTEL', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('081', 'MSI', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('082', 'ASUS', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('083', 'PATRIOT', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('084', 'EPSON', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('085', 'ADATA', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('086', 'NEON', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('087', 'HYNIX', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('088', 'SUPRAM', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('089', 'HANNSG', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('090', 'OPTIQUES', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('091', 'MUSTIFF', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('092', 'GENERICO', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('093', 'DEVICE', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('094', 'SOYO', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('095', 'LEXMARK', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('096', 'BELL', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('097', 'DIGITAL CITY', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('098', 'HANNSG', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('099', 'AVANT', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('100', 'GIGABYTE', 'ADMIN', '2017-06-25 11:15:09', 'A');
INSERT INTO `af_marcas` VALUES ('101', 'DESKTAR', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('102', 'VDATA', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('103', 'DEKING', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('104', 'RENDITION', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('105', 'MUSHKIN', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('106', 'OKIDATA ', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('107', 'EMACHINES', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('108', 'KYOCERA', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('109', 'DYNET', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('110', 'BLITZ', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('111', 'VIEW MAGIC', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('112', 'GRAND STREAM', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('113', 'TRENDNET', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('114', 'BOLIDE', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('115', 'POWER WARE', 'ADMIN', '2017-06-25 11:15:09', 'A'), ('116', 'DLINK', 'ADMIN', '2017-06-25 11:15:10', 'A'), ('117', 'CERVI FLEX', 'ADMIN', '2017-06-25 13:56:35', 'A'), ('118', 'HUAWEI PLUS', 'ADMIN', '2017-06-25 15:38:42', 'A');
COMMIT;

-- ----------------------------
-- Table structure for af_presentaciones
-- ----------------------------
DROP TABLE IF EXISTS `af_presentaciones`;
CREATE TABLE `af_presentaciones` (
`pres_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`pres_nombre`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`pres_abrevia`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`pres_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`pres_fcreacion`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`pres_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`pres_codigo`),
FOREIGN KEY (`pres_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `pres_codigo` (`pres_codigo`) USING BTREE ,
INDEX `pres_usrcreacion` (`pres_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of af_presentaciones
-- ----------------------------
BEGIN;
INSERT INTO `af_presentaciones` VALUES ('001', 'UNIDAD', 'UND', 'ADMIN', '2017-06-25 11:24:00', 'A'), ('002', 'GIGAHERTZ', 'GHZ', 'ADMIN', '2017-06-25 11:24:00', 'A'), ('003', 'GIGAS', 'G', 'ADMIN', '2017-06-25 11:24:00', 'A'), ('004', 'TERA', 'T', 'ADMIN', '2017-06-25 11:24:00', 'A'), ('005', 'MEGABYTES', 'MB', 'ADMIN', '2017-06-25 11:24:00', 'A'), ('006', 'PULGADAS', '\"', 'ADMIN', '2017-06-25 11:24:00', 'A'), ('007', 'MEGAHERTZ', 'MHZ', 'ADMIN', '2017-06-25 11:24:00', 'A'), ('008', 'BTU PLUS', 'BTU', 'ADMIN', '2017-06-25 11:24:00', 'A');
COMMIT;

-- ----------------------------
-- Table structure for af_subgrupos
-- ----------------------------
DROP TABLE IF EXISTS `af_subgrupos`;
CREATE TABLE `af_subgrupos` (
`subg_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`subg_grupo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`subg_nombres`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`subg_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`subg_fcreacion`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`subg_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`subg_codigo`),
FOREIGN KEY (`subg_grupo`) REFERENCES `af_grupos` (`grup_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`subg_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `subg_grupo` (`subg_grupo`) USING BTREE ,
INDEX `subg_usrcreacion` (`subg_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of af_subgrupos
-- ----------------------------
BEGIN;
INSERT INTO `af_subgrupos` VALUES ('001', '008', 'SATA', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('002', '008', 'USB', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('003', '003', 'CRT', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('004', '003', 'LCD', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('005', '005', 'PINES', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('006', '005', 'CONTACTO                                                    ', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('007', '005', 'SLOT', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('008', '006', 'SIMM', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('009', '006', 'DIMM', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('010', '006', 'DDR I', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('011', '006', 'DDR II', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('012', '006', 'USB', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('013', '001', 'CD ROM', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('014', '001', 'CD RW', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('015', '001', 'DVD ROM', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('016', '001', 'DVD RW', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('017', '001', 'CD ROM - CD RW', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('018', '001', 'DVD ROM - DVD RW', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('019', '001', 'TECLADO', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('020', '001', 'MOUSE', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('021', '001', 'ALTAVOCES', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('022', '001', 'WEBCAM', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('023', '001', 'MICROFONO', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('024', '002', 'SWITCH', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('025', '002', 'HUB', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('026', '002', 'ROUTER', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('027', '004', 'AT', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('028', '004', 'MINI AT', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('029', '004', 'XT', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('030', '004', 'ATX                                                         ', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('031', '007', 'DOMESTICO', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('032', '007', 'INDUSTRIAL', 'ADMIN', '2017-07-06 21:42:10', 'A'), ('033', '001', 'DISKETTE 3 1/4', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('034', '003', 'CRT2                                                        ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('035', '008', 'IDE                                                         ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('036', '004', 'MINI ATX                                                    ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('037', '006', 'DDR III                                                     ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('038', '003', 'LED                                                         ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('039', '010', 'LAPTOP                                                      ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('040', '010', 'MINI LAPTOP                                                 ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('041', '011', 'SOBRE MESA                                                  ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('042', '012', 'MONOCROMATICA                                               ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('043', '012', 'MULTIFUNCIONAL                                              ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('044', '012', 'IMPRESORA COLOR                                             ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('045', '013', 'TORRE                                                       ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('046', '013', 'PC                                                          ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('047', '002', 'GATEWAY                                                     ', 'ADMIN', '2017-07-06 21:42:11', 'A'), ('048', '012', 'MATRIZ DE PUNTO                                             ', 'ADMIN', '2017-07-06 21:42:11', 'A');
COMMIT;

-- ----------------------------
-- Table structure for af_ubicaciones
-- ----------------------------
DROP TABLE IF EXISTS `af_ubicaciones`;
CREATE TABLE `af_ubicaciones` (
`ubic_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Código de Ubicación' ,
`ubic_centrocosto`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Nit del Centro de Costos' ,
`ubic_descripcion`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Descripción de la Ubicación' ,
`ubic_sucursal`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Sucursal donde se encuentra la Ubicación' ,
`ubic_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`ubic_fcreacion`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`ubic_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Estado de la Ubicación' ,
PRIMARY KEY (`ubic_codigo`),
FOREIGN KEY (`ubic_centrocosto`) REFERENCES `cn_centroscosto` (`ccos_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`ubic_sucursal`) REFERENCES `cfg_sucursales` (`sucu_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`ubic_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `ubic_centrocosto` (`ubic_centrocosto`) USING BTREE ,
INDEX `ubic_sucursal` (`ubic_sucursal`) USING BTREE ,
INDEX `ubic_usrcreacion` (`ubic_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of af_ubicaciones
-- ----------------------------
BEGIN;
INSERT INTO `af_ubicaciones` VALUES ('001', '001', 'CARTERA', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('002', '001', 'VENTAS', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('003', '001', 'TESORERIA ', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('004', '001', 'ARCHIVO', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('005', '001', 'TALENTO HUMANO', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('006', '001', 'ALMACEN', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('007', '001', 'CONTABILIDAD', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('008', '001', 'MERCADEO', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('009', '001', 'COORDINACION', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('010', '001', 'TALENTO HUMANO ', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('011', '001', 'ATENCION AL CLIENTE', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('012', '001', 'JURIDICA', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('013', '001', 'COORDINACION', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('014', '001', 'GERENCIA', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('015', '001', 'GESTION Y  CONTROL', '001', 'ADMIN', '2017-06-25 12:13:36', 'A'), ('016', '001', 'SISTEMAS', '001', 'ADMIN', '2017-07-12 20:26:11', 'A');
COMMIT;

-- ----------------------------
-- Table structure for cfg_consecutivos
-- ----------------------------
DROP TABLE IF EXISTS `cfg_consecutivos`;
CREATE TABLE `cfg_consecutivos` (
`cons_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '' ,
`cons_nombre`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`cons_descripcion`  text CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL ,
`cons_valor`  int(12) NOT NULL ,
`cons_tipo`  enum('C','N','D') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'C' COMMENT 'Caracter o Numerico' ,
`cons_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`cons_codigo`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci
COMMENT='Guarda Todos los parametros contables y los consecutivos'

;

-- ----------------------------
-- Records of cfg_consecutivos
-- ----------------------------
BEGIN;
INSERT INTO `cfg_consecutivos` VALUES ('001', 'CONSECUTIVO CODIGO DE LINEA', 'CONSECUTIVO CODIGO DE LINEA', '9', 'N', 'A'), ('002', 'CONSECUTIVO DE DEPRECIACION', 'CONSECUTIVO DE DEPRECIACION', '1', 'N', 'A'), ('003', 'CONSECUTIVO DE MARCAS', 'CONSECUTIVO DE MARCAS', '118', 'N', 'A'), ('004', 'CONSECUTIVO DE PRESENTACIONES', 'CONSECUTIVO DE PRESENTACIONES', '8', 'N', 'A'), ('005', 'CONSECUTIVO CENTRO DE COSTOS', 'CONSECUTIVO CENTRO DE COSTOS', '1', 'N', 'A'), ('006', 'CONSECUTIVO DE UBICACIONES', 'CONSECUTIVO DE UBICACIONES', '16', 'N', 'A'), ('007', 'CONSECUTIVO DE SUCURSALES', 'CONSECUTIVO DE SUCURSALES', '1', 'N', 'A'), ('008', 'CONSECUTIVO DE CATEGORIAS', 'CONSECUTIVO DE CATEGORIAS', '2', 'N', 'A'), ('009', 'CONSECUTIVO DE GRUPOS', 'CONSECUTIVO DE GRUPOS', '13', 'N', 'A'), ('010', 'CONSECUTIVO DE SUBGRUPOS', 'CONSECUTIVO DE SUBGRUPOS', '48', 'N', 'A'), ('011', 'CONSECUTIVO CENTRO DE COSTOS', 'CONSECUTIVO CENTRO DE COSTOS', '2', 'N', 'A'), ('012', 'CONSECUTIVO SUCURSALES', 'CONSECUTIVO SUCURSALES', '1', 'N', 'A'), ('013', 'CONSECUTIVO ESTABLECIMIENTOS', 'CONSECUTIVOS ESTABLECIMIENTOS', '1', 'N', 'A'), ('014', 'CONSECUTIVO CONCEPTOS DE INGRESO ACTIVOS FIJO', 'CONSECUTIVO CONCEPTOS DE INGRESO ACTIVOS FIJO', '5', 'N', 'A');
COMMIT;

-- ----------------------------
-- Table structure for cfg_establecimientos
-- ----------------------------
DROP TABLE IF EXISTS `cfg_establecimientos`;
CREATE TABLE `cfg_establecimientos` (
`esta_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`esta_sociedad`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`esta_nit`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`esta_nombre`  varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`esta_cuenta`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`esta_prefijoactivofijo`  char(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`esta_prefijocredito`  char(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`esta_condesde`  int(10) NOT NULL ,
`esta_conhasta`  int(10) NOT NULL ,
`esta_rango`  int(3) NOT NULL ,
`esta_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`esta_codigo`),
FOREIGN KEY (`esta_cuenta`) REFERENCES `cn_puc` (`puc_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`esta_sociedad`) REFERENCES `publica`.`mae_empresas` (`empr_nit`) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`esta_nit`) REFERENCES `publica`.`mae_personas` (`pers_nit`) ON DELETE RESTRICT ON UPDATE CASCADE,
INDEX `esta_cuenta` (`esta_cuenta`) USING BTREE ,
INDEX `esta_codigo` (`esta_codigo`) USING BTREE ,
INDEX `cfg_establecimientos_ibfk_3` (`esta_sociedad`) USING BTREE ,
INDEX `esta_nit` (`esta_nit`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of cfg_establecimientos
-- ----------------------------
BEGIN;
INSERT INTO `cfg_establecimientos` VALUES ('001', '900102962', '900102962', 'COODOMINICANA', null, 'AF', 'CD', '1', '200000', '50', 'A');
COMMIT;

-- ----------------------------
-- Table structure for cfg_opcionesusuarios
-- ----------------------------
DROP TABLE IF EXISTS `cfg_opcionesusuarios`;
CREATE TABLE `cfg_opcionesusuarios` (
`usop_usuario`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`usop_idopcion`  smallint(5) UNSIGNED NOT NULL ,
`usop_buscar`  tinyint(1) UNSIGNED NOT NULL DEFAULT 1 ,
`usop_nuevo`  tinyint(1) UNSIGNED NOT NULL DEFAULT 1 ,
`usop_guardar`  tinyint(1) UNSIGNED NOT NULL DEFAULT 1 ,
`usop_cancelar`  tinyint(1) UNSIGNED NOT NULL DEFAULT 1 ,
`usop_modificar`  tinyint(1) UNSIGNED NOT NULL DEFAULT 1 ,
`usop_anular`  tinyint(1) UNSIGNED NOT NULL DEFAULT 1 ,
`usop_imprimir`  tinyint(1) UNSIGNED NOT NULL DEFAULT 1 ,
`usop_supervisar`  tinyint(1) UNSIGNED NOT NULL DEFAULT 1 ,
PRIMARY KEY (`usop_usuario`, `usop_idopcion`),
FOREIGN KEY (`usop_usuario`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`usop_idopcion`) REFERENCES `publica`.`mae_opciones` (`opci_idopcion`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `opus_idopcion` (`usop_idopcion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of cfg_opcionesusuarios
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cfg_parametros
-- ----------------------------
DROP TABLE IF EXISTS `cfg_parametros`;
CREATE TABLE `cfg_parametros` (
`para_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '' ,
`para_nombre`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`para_descripcion`  text CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL ,
`para_valor`  varchar(250) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '' ,
`para_tipo`  enum('C','N','D') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'C' COMMENT 'Caracter o Numerico' ,
`para_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`para_codigo`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci
COMMENT='Guarda Todos los parametros contables y los consecutivos'

;

-- ----------------------------
-- Records of cfg_parametros
-- ----------------------------
BEGIN;
INSERT INTO `cfg_parametros` VALUES ('001', 'CUENTA RETEIVA                                              ', ' ', '24470501', 'C', 'A'), ('002', 'CUENTA INTERES                                              ', 'CUENTA INTERES', '42100501                                          ', 'C', 'A'), ('003', 'CUENTA RETEICA                                              ', 'CUENTA RETEICA ', '24350101                                          ', 'C', 'A'), ('004', 'CUENTA RETEFUENTE                                           ', 'CUENTA RETEFUENTE  ', '24300101                                          ', 'C', 'A'), ('005', 'CUENTA DESCUENTOS', ' ', '41750505', 'C', 'A'), ('006', 'CUENTA DE CXP CAJA MENOR', ' ', '21051003', 'C', 'A'), ('007', 'CUENTA TOMA DE INVENTARIO', ' ', '61353601', 'C', 'A'), ('008', 'CUENTA IVA', ' ', '24080105', 'C', 'A'), ('009', 'CUENTA RETEIVA', ' ', '24470501', 'C', 'A'), ('010', 'PORCENTAJE DE IVA                                           ', 'PORCENTAJE DE IVA', '16', 'N', 'A'), ('011', 'CUENTA DE DESCUENTO INV', ' ', '42950505', 'C', 'A'), ('012', 'CUENTA RETEICA INV', ' ', '23680505', 'C', 'A'), ('013', 'CUENTA PROV. POR PAGAR', ' ', '22050505', 'C', 'A'), ('014', 'CUENTA DE INVENTARIO', ' ', '14350505', 'C', 'A'), ('015', 'CUENTA DE UTILIDADES', 'Cuenta de patrimonio para registrar la ultilidad al realizar el proceso de cierre del ejercio', '35050501', 'C', 'A'), ('016', 'CUENTA DE PERDIDA', 'Cuenta de patrimonio para registrar la perdida al realizar el proceso de cierre del ejercio', '35051001', 'C', 'A'), ('017', 'CUENTA DE AJUSTE', 'Cuenta de ajuste utilizada en el proceso de ciere del ejerccio, se recomienda una cuenta 5905', '59050501', 'C', 'A'), ('018', 'CUENTA DE IVA EN VENTAS', ' ', '51157005', 'C', 'A'), ('019', 'CUENTA DE DESCUENTOS EN VENTAS', ' ', '53053501', 'C', 'A'), ('020', 'CUENTAS POR COBRAR', 'Cuenta contable donde se reciben los dineros generados por otras cuentas pendientes por cobrar a terceros.', '16902501', 'C', 'A'), ('021', 'CUENTA RETEIVA EN VENTAS', ' ', '24470501', 'C', 'A'), ('022', 'CUENTA RETEICA EN VENTAS                                    ', 'CUENTA RETEICA EN VENTAS ', '16751001                                          ', 'C', 'A'), ('023', 'PORCENTAJE DE IVA EN VENTAS', ' ', '16', 'N', 'A'), ('024', 'CUENTA DE CAJA', ' ', '11050505', 'C', 'A'), ('025', 'CUENTA DE VENTAS???', ' ', '61353601', 'C', 'A'), ('026', 'CUENTA DE INGRESOS EN VENTAS', ' ', '41353601', 'C', 'A'), ('027', 'PORC. EN VENTAS AMBULANTES MAYOR', ' ', '10', 'N', 'A'), ('028', 'PORC. EN VENTAS AMBULANTES MENOR', ' ', '5', 'N', 'A'), ('029', 'VALOR LIQUIDACION VENTAS AMBULANTES', ' ', '500000', 'N', 'A'), ('030', 'PORCENTAJE POR VENTAS DE CONTADO', ' ', '5', 'N', 'A'), ('031', 'CUENTA CXP LIQUIDADAS', ' ', '23150501', 'C', 'A'), ('032', 'CUENTA GASTO LIQUIDADO', ' ', '51051805', 'C', 'A'), ('033', 'CUENTA DE DESCTO. ANTICIPADO', ' ', '41750505', 'C', 'A'), ('034', 'CUENTA DE DESCTO. POR DEVOLUCIONES', ' ', '42054501', 'C', 'A'), ('035', 'CUENTA DE INTERES EN PRESTAMOS', ' ', '42100501', 'C', 'A'), ('036', 'CUENTA DE DESCTO EN PRESTAMO', ' ', '42054501', 'C', 'A'), ('037', 'CUENTA DE INTERES X MORA EN PREST.', ' ', '42100501', 'C', 'A'), ('039', 'TASA', ' ', '5,4', 'N', 'A'), ('040', 'CUENTA DE LIBRANZAS                                         ', ' CUENTA LIBRANZAS', '14410501                                          ', 'C', 'A'), ('042', 'CUENTA DE DEVOLUCION                                        ', 'CONCEPTO 505-TESORERIA', '24953001', 'C', 'A'), ('043', 'CUENTA DE INTERES', ' ', '41851001', 'C', 'A'), ('044', 'CUENTA DE LIBRANZA INTERES', 'CUENTA DE LIBRANZA INTERES (YA NO SE UTILIZA)', '16551801', 'C', 'A'), ('045', 'PORCENTAJE DE AMPLIACION', ' ', '3,55555', 'N', 'A'), ('046', 'PORCENTAJE DE LIBRANZA RECOGE', ' ', '7,77777', 'N', 'A'), ('047', 'PORCENTAJE DE AMPLIACION MAYOR', ' ', '7,77777', 'N', 'A'), ('048', 'VALOR DE COMISION', ' ', '40000', 'N', 'A'), ('049', 'CUENTA DE CXP A VENDEDORES', ' ', '24150501', 'C', 'A'), ('050', 'CUENTA DE COMISION                                          ', 'CUENTA COMISION ', '51104801                                          ', 'C', 'A'), ('051', 'CUENTA DE INTERES X REFINANCIACION', ' ', '41750505', 'C', 'A'), ('052', 'CUENTA COSTO ENTREGADO', ' ', '61500501', 'C', 'A'), ('053', 'CUENTA DE CUENTAS X PAGAR', ' ', '27959501', 'C', 'A'), ('054', 'CUENTA DE CAJA', ' ', '', 'C', 'A'), ('055', 'CUENTA DE INTERES POR REFINANCIACION', ' ', '41750505', 'C', 'A'), ('056', 'CUENTA DE INTERES POR MORA', ' ', '42100502', 'C', 'A'), ('057', 'CUENTA DE COMISION (RESTITUCION DE LIBRANZ)', ' ', '51106201', 'C', 'A'), ('060', 'PORCENTAJE DE AMPLIACIÓN ELECTROD.', ' ', '3,5', 'N', 'A'), ('061', 'PORCENTAJE DE AMPLIACIÓN MAYOR ELECTROD.', ' ', '12', 'N', 'A'), ('062', 'PORCENTAJE DE RECOJE DE ELECTRODOMESTICO', ' ', '12', 'N', 'A'), ('063', 'CUENTA DE DESCUENTOS 4XMIL', ' ', '53050510', 'C', 'A'), ('064', 'CUENTA DE DESCUENTOS OTROS', ' ', '42950506', 'C', 'A'), ('065', 'CUENTA DE CXP DE LIBRANZAS DE ELECTRODOMESTICOS', ' ', '23050103', 'C', 'A'), ('066', 'CUENTA DE RECAUDO(PAGOS X RELACION)                         ', ' CUENTA DE RECAUDO(PAGOS X RELACION)                         ', '16501501                                          ', 'C', 'A'), ('074', 'CUENTA DE PAGONET', ' ', '11100590', 'C', 'A'), ('075', 'CUENTA DE CARTERA MOROSA(CARGOS X MORA)', ' ', '13050580', 'C', 'A'), ('076', 'CUENTA DE INTERESES POR MORA', ' ', '42100502', 'C', 'A'), ('077', 'CUENTA DE RECAUDOS DE TESORERIA(PAGOS DIRECTOS)', ' ', '28050520', 'C', 'A'), ('078', 'CUENTA DE RECAUDOS DE CERTIFICADOS', 'Cuenta para el recaudo de dineros por concepto de solicitud de certificados de saldo.', '42950502', 'C', 'A'), ('079', 'VALOR DE CONSIGNACION', ' ', '5000', 'N', 'A'), ('080', 'CUENTA DE RECAUDO DE GASTO', ' ', '42505005', 'C', 'A'), ('081', 'CUENTA DE INTERES', ' ', '', 'C', 'A'), ('082', 'CUENTA DE CXP COMISION CLIENTES NUEVOS', ' ', '24150501', 'C', 'A'), ('083', 'CUENTA DE COMISION CLIENTES NUEVOS', ' ', '51104801', 'C', 'A'), ('084', 'CUENTA DE RETENCION EN COMISION CLIENTES NUEVOS', ' ', '24452001', 'C', 'A'), ('089', 'FECHA DE INICIO CONTABLE', ' ', '0000-00-00', 'D', 'A'), ('091', 'PARAMETRO DE % POR VENTA DE MERCANCIA', ' ', '44.81657', 'N', 'A'), ('093', 'NIT PRONTOCREDITO LTDA', ' ', '900102962-3', 'C', 'A'), ('094', 'CUENTA DE CXP PRONTOCREDITO LTDA', ' ', '27959502', 'C', 'A'), ('096', 'CUENTA DEDUCCION PAGOS X RELACION', ' ', '24953003', 'C', 'A'), ('097', 'CUENTA DE CREDITOS A VENDEDORES', ' ', '16259501', 'C', 'A'), ('098', 'TASA EFECTIVA ANUAL                                         ', ' TASA EFECTIVA ANUAL', '22                                                                                                  ', 'N', 'A'), ('099', 'MAXIMO DESCUENTO EN VENTAS', ' ', '0', 'N', 'A'), ('100', 'CUENTA DE ANTICIPO A PROVEEDORES', ' ', '13300501', 'C', 'A'), ('101', 'CUENTA DE CHEQUES POSFECHADOS', ' ', '81100502', 'C', 'A'), ('102', 'CUENTA DE CHEQUES RECIBIDO EN GARANTIA CREDITO', ' ', '91100501', 'C', 'A'), ('103', 'CODIGO LISTA DE PRECIOS LIBRANZA', ' ', '001', 'C', 'A'), ('104', 'BODEGA DE OBSEQUIOS', ' ', '03', 'C', 'A'), ('105', 'CUENTA DE PRESTAMOS A EMPLEADOS', ' ', '13050505', 'C', 'A'), ('106', 'CUENTA DE CUENTAS X COBRAR CONVENIO', ' ', '0', 'C', 'A'), ('107', 'CUENTA DE INTERES PRESTAMOS PERSONALES', ' ', '41501003', 'C', 'A'), ('108', 'CUENTA DE INTERES VENTAS CREDICONTADO', ' ', '41502004', 'C', 'A'), ('109', 'CODIGO DE DESCUENTO GARANTIA DE VENTA', ' ', '01', 'C', 'A'), ('110', 'CUENTA DE VENTAS CREDICONTADO', ' ', '13050515', 'C', 'A'), ('111', 'CUENTA RECAUDO A EMPLEADOS', ' ', '0', 'C', 'A'), ('112', 'CUENTA RECAUDO A EMPLEADOS PRONTO', ' ', '0', 'C', 'A'), ('114', 'CODIGO DE DSCTO PRESTAMOS EMPRESA', ' ', '12', 'C', 'A'), ('115', 'CODIGO DE DSCTO ANTICIPOS', ' ', '13', 'C', 'A'), ('116', 'CUENTA DESCUENTOS EN PRESTAMOS', ' ', '51403501', 'C', 'A'), ('117', 'MAXIMO DIAS PARA PAGAR UNA LIBRANZA O COMISION', ' ', '30', 'N', 'A'), ('118', 'VR MAXIMO DE PAGONET X DIA', ' ', '40000000', 'N', 'A'), ('119', 'VR MAXIMO DE PAGONET X PAQUETE', ' ', '20000000', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('120', 'VR MINIMO DE PAGONET X CLIENTE                              ', ' VR MINIMO DE PAGONET X CLIENTE  ', '10000                                             ', 'N', 'A'), ('121', 'CUENTA DE TITULO VALOR RECIBIDO EN GARANTIA', ' ', '81100502', 'C', 'A'), ('122', 'CUENTA DE TITULO VALOR RECIBIDO EN GARANTIA(CREDITO)', ' ', '91100502', 'C', 'A'), ('123', 'CUENTA DE RETEFUENTE EN VENTAS', ' ', '24050101', 'C', 'A'), ('124', 'CUENTA DEVOLUCION BONOS PRONTOCREDITO', ' ', '0', 'C', 'A'), ('125', 'CUENTA DE APOYO A MERCADEO', ' ', '0', 'C', 'A'), ('126', 'CUENTA DESCUENTO A PIE DE FACTURA', ' ', '0', 'C', 'A'), ('128', 'PORCENTAJE DE C. INICIAL PLAN SEPARE', ' ', '30', 'N', 'A'), ('129', 'PORCENTAJE PARA COBRO JURIDICO', ' ', '6.2', 'N', 'A'), ('131', 'CUENTA DE APORTE INICIAL AFILIADOS                          ', ' CUENTA DE APORTE INICIAL AFILIADOS    ', '41900501                                          ', 'C', 'A'), ('132', 'CUENTA LIBRANZA COOPERATIVA CARTERA', 'CUENTA PARA EL RECAUDO (CARTERA)  (YA NO SE UTILIZA)', '14410501                                          ', 'C', 'A'), ('133', 'CUENTA DE CUENTAS X PAGAR COOPERATIVA', ' ', '24953005', 'C', 'A'), ('134', 'CUENTA INGRESO INTERESES', ' CUENTA INGRESO INTERES  (YA NO SE UTILIZA)', '41851001', 'C', 'A'), ('136', 'CUENTA DE AFILIACION', ' ', '31050501', 'C', 'A'), ('137', 'CUENTA CAJA PRIMAS', ' ', '41851004', 'C', 'A'), ('138', 'VIGENCIA DE LIB. PARA COMISION (DIAS)                       ', 'numero de dias hacia atras en los que se tendra en cuenta las libranzas para liquidacion de comisiones a vendedores ', '180', 'N', 'A'), ('139', 'TASAR                                                       ', 'Tasa utilizada para calcular la cuota del credito segun el sistema highlander', '3.30128                                           ', 'N', 'A'), ('140', 'FUENTE PARA CAUSACION DE GASTO', 'Fuente utilizada para la causacion de gasto', 'CG', 'C', 'A'), ('142', 'PARAMETRO DE PRUEBA                                ', 'ESTO ES UNA PRUEBA', 'NADA              ', 'C', 'A'), ('143', 'CUENTA RETEIVA                                     ', 'CUENTA RETEIVA', '24470501', 'C', 'A'), ('144', 'PORCENTAJE DE IVA                                  ', 'PORCENTAJE DE IVA  ', '16,0              ', 'N', 'A'), ('145', 'CUENTA DE COSTO DE VENTAS                                   ', 'CUENTA DE COSTO DE VENTAS', '61755001                                          ', 'C', 'A'), ('147', 'PRUEBA 28-02-2010', 'esto es una prueba', '5', 'N', 'A'), ('148', 'PRUEBA2- 28-01-2010', 'prueba', 'PB', 'C', 'A'), ('152', 'CUENTA GASTO COMISION DE VENDEDORES                ', 'Cuenta contable, correspondiente al gasto de comisiones de vendedores', '51104801', 'C', 'A'), ('153', 'CUENTA POR PAGAR COMISION DE VENDEDORES            ', 'Cuenta contable correspondiente a la cuenta por pagar de comisiones a vendedores', '24150501          ', 'C', 'A'), ('156', 'DIA DE LA SEMANA SIGUIENTE CUOTA                            ', 'Dia de la semana desde el cual se empieza a cobrar la siguiente cuota a un credito de un vendedor', '4', 'N', 'A'), ('157', 'NUMERO DE DIAS CUOTA VENDEDOR                      ', 'Cantidad de dias para descontar la cuota de un prestamo externo a un vendedor', '7', 'N', 'A'), ('159', 'CONCEPTO RETENCION EN LA FUENTE                             ', 'Codigo del concepto parametrizado en el modulo de asesores utilizado para descontar la retencion en la fuente de las liquidaciones por comision sobre ventas', '001                                               ', 'C', 'A'), ('161', 'VALOR META PARA COMISIONAR POR VENTAS                       ', 'Valor estipulado como meta en ventas mensuales, para que los vendedores puedan comisionar', '40000000                                          ', 'N', 'A'), ('163', 'VALOR META PARA BONIFICACION POR CARTERA                    ', 'Meta de ventas estipulada para bonificacion de cartera   ', '20000000                                          ', 'N', 'A'), ('164', 'NRO. MESES LIBRANZA ANTERIOR                                ', 'Cantidad mínima de meses para catalagar una libranza como \"vieja\", aplica para el proceso de bonificaciones a vendedores y saber cuando un cliente se considera nuevo o antiguo', '6                                                 ', 'N', 'A'), ('165', 'PORC. BONIFICACION CLIENTES NUEVOS                          ', 'porcentaje de bonificacion a los vendedores por clientes nuevos', '10                                                ', 'N', 'A'), ('166', 'PORC. RETEFUENTE BONIFICACION                               ', 'porcentaje retencion en la fuente para las bonificaciones a vendedores por clientes nuevos', '0                                                 ', 'N', 'A'), ('167', 'MAXIMO VECES CODEUDOR                                       ', 'Maximo de veces que un tercero puede ser codeudor', '6                                                 ', 'N', 'A'), ('168', 'LIMITE DE MESES LIBRANZA BONIFICACIONES            ', 'Numero de meses limite para el estado pendiente de una libranza que se ha clasificado en bonificaciones y colocarla en estado anulada para efectos de bonificacion por clientes nuevos ', '3', 'N', 'A'), ('169', 'LIMITE DE DIAS PARA LIQUIDACION DE CREDITO', 'Numero de Dias que se toman hacia adelante a partir de la fecha del sistema para calcular los Intereses x Causar en una Liquidacion de Credito', '30', 'N', 'A'), ('170', 'CUENTA CORRIENTE DE RECAUDOS                                ', 'Cuenta Corriente en donde se cancelan los saldos expedidos en los Certificados de Saldos', '21002714333                                       ', 'C', 'A'), ('171', 'CODIGO DE BANCO DE RECAUDOS PARA CERTIFICACIONES DE SALDO', 'Codigo de banco de recaudos para certificaciones de saldo', '32', 'N', 'A'), ('174', 'CUENTA PARA RECAUDO PARA LIQUIDACION DE CREDITOS            ', 'Recaudo para liquidación de crédito', '24959505', 'C', 'A'), ('175', 'CUENTA DE CHEQUES EN CUSTODIA', 'Cuenta de cheques en custodia', '28301501', 'C', 'A'), ('177', 'CUENTA INGRESO OBLIGACIONES COBRO JURIDICO', 'CUENTA INGRESO OBLIGACIONES COBRO JURIDICO', '41859801', 'C', 'A'), ('178', 'CUENTA OBLIGACIONES COBRO JURIDICO', 'Cuenta obligaciones en cobro jurídico', '14910501', 'C', 'A'), ('179', 'BASE DE DATOS NEMESIS', 'Nombre de la base de datos Némesis', 'nemesis', 'C', 'A'), ('180', 'CERRAR SESION DE CAJA CADA DIA', 'Obliga el cierre de la sesion de caja cuando la fecha de apertura no coincide con la fecha del sistema. Valores permitidos S/N', 'N', 'C', 'A'), ('181', 'CODIGO DEL MEDIO DE PAGO EFECTIVO', 'Medio de pago efectivo', 'EF', 'C', 'A'), ('182', 'CODIGO DEL MEDIO DE PAGO CHEQUES DE INGRESO', 'Medio de pago cheques de ingreso', 'CH', 'C', 'A'), ('186', 'CUENTA POR PAGAR LIQUIDACION APORTES               ', 'cuenta por pagar para la liquidacion de aportes a asociados', '24650501', 'C', 'A'), ('187', 'PERMITIR REIMPRIMIR CHEQUES                                 ', 'Establece si esta permitido reimprimir un cheque de un egreso S/N', 'N                                                                                                   ', 'C', 'A'), ('188', 'VALOR DE CONSIGNACION PARA CERTIFICADOS DE SALDO   ', 'VALOR DE CONSIGNACION PARA CERTIFICADOS DE SALDO.', '5000              ', 'N', 'A'), ('189', 'Nro. DE DIAS LIMITE PARA VIGENCIA DE LIBRANZAS CANCELADAS ', 'ESTE PARAMETRO INDICA EL Nro DE DIAS QUE SE TIENEN EN CUENTA PARA DETERMINAR QUE CREDITOS A PARTIR DE LA FECHA DE CANCELACION SE MUESTRAN EN LA CONSULTA DE PAZ Y SALVO Y ESTADO DE OBLIGACIONES', '10000', 'N', 'A'), ('191', 'CUENTA PARA PRESTAMOS RECIBIDOS', 'Cuenta contable donde se lleva el valor de los prestamos recibidos de otras empresas', '23051501', 'C', 'A'), ('192', 'MAXIMO DE CUOTAS CREDICONTADO COTIZACIONES', 'Numero maximo de cuotas a diferir en un credicontado (cotizaciones)', '12                ', 'N', 'A'), ('193', 'CONTABILIZAR DESCUENTO', 'Valor que define si contabilizar o no el descuento en las facturas por venta. \r\nValores posibles : \"S\"=Si \"N\"=No ', 'N', 'C', 'A'), ('194', 'CUENTA DINEROS RECIBIDOS PREPAGO DEUDUDA COOP', 'Cuenta para registrar los dineros que se reciben de otras entidades (coopro)', '24959506', 'C', 'A'), ('195', 'CUENTA DINEROS RECIBIDOS PAGOS POR RELACION DE COOP.	       ', 'Cuenta para registrar los dineros que se reciben de otras entidades (coopro) x concepto de relación de pagos.', '24603001                                          ', 'C', 'A'), ('196', 'TIPO DE REPORTE DE PROYECCION                               ', 'DETERMINA EL TIPO DE REPORTE QUE SE IMPRIME CUANDO SE ESTA EN LA VENTANA PROYECCION Y RECAUDO DE CREDITO.\r\nVALORES\r\n\r\nA - REPORTE TIPO 1 \r\nB - REPORTE TIPO 2', 'B                                               ', 'C', 'A'), ('197', 'NOMBRE GERENTE', 'Guarda el nombre del gerente, este aparecera en los informes de contabilidad como balance y p&g', '', 'C', 'A'), ('198', 'NOMBRE CONTADOR                                             ', 'Nombre del contador que aparecera en los informes financieros como balance y p&g', 'DANIEL ENRIQUE CASSIANI ARAGON', 'C', 'A'), ('199', 'TARJETA PROFESIONAL CONTADOR                                ', 'Número de la tarjeta profesional del contador, este se utilizará en los informes contables como balance y p&g', '85322', 'C', 'A'), ('200', 'NOMBRE REVISOR FISCAL', 'Nombre del revisor fiscal que aparecera en los informes financieros como balance y p&g', '', 'C', 'A'), ('201', 'TARJETA PROFESIONAL REVISOR FISCAL', 'Número de la tarjeta profesional del revisor fiscal, este se utilizará en los informes contables como balance y p&g', '', 'C', 'A'), ('203', 'CUENTA DE CTA X PAGAR SEGURO CARTERA', 'CTA X PAGAR SEGURO CARTERA', '24159501', 'C', 'A'), ('204', 'NIT DEL TERCERO PARA PAGO DE POLIZA DE SEGURO DE CARTERA', 'NIT DEL TERCERO PARA PAGO DE POLIZA DE SEGURO DE CARTERA', '860009174', 'C', 'A'), ('205', 'NOMBRE DE FACTURA                                  ', 'Nombre del reporte de factura', 'REPFACTURA        ', 'C', 'A'), ('206', 'RENTABILIDAD LISTA DE PRECIOS %                    ', 'Porcentaje de rentabilidad en el precio de venta al publico de los diferentes articulos del inventario', '10                ', 'C', 'A'), ('207', 'CUENTA CAPITAL SUSCRITO                            ', 'Cuenta capital suscrito', '31051001          ', 'C', 'A'), ('208', 'BUSQUEDA EN BASE DE DATOS                          ', 'INDICA SI SE VAN A RECORRER TODAS LAS BASES DE DATOS PARA VISUALIZAR LOS CREDITOS REALIZADOS EN LA VENTANA MOVIMIENTO DE ASOCIADO.\r\n\r\nVALORES \'S\' - \'N\'.', 'S                 ', 'C', 'A'), ('209', 'NUMERO DE MESES A VALIDAR EN LA CLASIFICACION DE VENDEDORES', 'NUMERO DE MESES A VALIDAR EN LA CLASIFICACION DE VENDEDORES', '3', 'N', 'A'), ('210', 'BASE PARA OBTENE TOTAL VENTA DE CLASIFICACION DE VENDEDOR', 'BASE PARA OBTENE TOTAL VENTA DE CLASIFICACION DE VENDEDOR', 'libr_vlrinversion', 'C', 'A'), ('211', 'CUENTA DE APORTES EXTRAORDINARIOS', 'CUENTA DE APORTES EXTRAORDINARIOS', '', 'C', 'A'), ('213', 'RANGO DIAS PARA PRELIQUIDACION SEGURO DE CARTERA   ', 'ESTABLECE EL RANGO DE DIAS QUE SE VALIDAN DE UNA LIQUIDACION A OTRA PARA LA OPCION DE SEGURO DE CARTERA.', '0', 'N', 'A'), ('214', 'LIMITE REEMBOLSO RETENCION                                  ', 'Dia del mes maximo para liquidar el reembolso de retenciones', '30                                                ', 'C', 'A'), ('215', 'CUENTA INGRESO POR HONORARIOS                      ', 'cuenta para el concepto de ingreso por tesoreria 599, ojo cambiar el numero de la cuenta', '42950503          ', 'C', 'A'), ('216', 'CUENTA OTROS INGRESOS', 'Cuenta para el concepto de recibo de caja 521-Otros ingresos\r\n**Modificacion de 42950503 a 16259502  2013-06-05   \r\n**Modificación de 16259502 a 31050501  2013-11-16 SOLICITADO POR MAIDEN GUTIERREZ \r\n**Modificación de 16259502 a 16259502  2013-11-19 SOLICITADO POR DENIS PERTUZ\r\n**Modificación de 31050101 A 16350501 2013-12-21 SOLICITADO POR DENIS PERTUZ PARA RC EN CARTAGENA\r\n**Modificación de 16350501 A 16909503 2014-01-30 SOLICITADO POR WILBERTO BLANCO\r\n**Modificación de 16909503 A 16259502 2014-05-31 SOLICITADO POR DENIS PERTUZ\r\n**Modificación de 16909503 A 42950503 2014-05-31 SOLICITADO POR DENIS PERTUZ\r\n', '16909503', 'C', 'A'), ('217', 'CUENTA RECAUDO HONORARIOS                          ', 'Cuenta recaudo honorarios concepto de tesoreria 522', '24603002', 'C', 'A'), ('218', 'CUENTA APORTES ORDINARIOS EMPLEADOS', 'Aportes ordinarios empleados concepto de tesoreria 508', '31050501', 'C', 'A'), ('219', 'RUTA EXPORTACION DE ARCHIVOS', 'Guarda la ruta en la que se exportan a excel las consultas del sistema', 'c:\\temp\\', 'C', 'A'), ('220', 'CODIGO CIFIN', 'GUARDA EL TIPO ENTIDAD Y CODIGO DE ENTIDAD ASIGNADO POR LA CIFIN', '050620', 'C', 'A'), ('224', 'CUENTA ANTICIPO COMISIONES                                  ', 'Cuenta de anticipo a comisiones  y bonificaciones a vendedores', '51104801                                          ', 'C', 'A'), ('225', 'EDAD MAXIMA ASOCIADO                               ', 'Edad maxima que debe tener el asociado para afiliarse a la cooperativa', '95', 'N', 'A'), ('226', 'NUMERO MAXIMO DE ENVIOS EN NOVEDAD', 'NUMERO DE VECES EN QUE SE PUEDE ENVIAR UNA LIBRANZA EN NOVEDAD ANTES DE IRSE A JURIDICA', '3', 'N', 'A'), ('227', 'LINEA DE CREDITO PARA RECUPERACION DE CARTERA', 'LINEA DE CREDITO PARA RECUPERACION DE CARTERA', '', 'C', 'A'), ('228', 'CALCULO VLR INV SEGURO DE CARTERA', 'Condicion que se evalua para tomar el valor inversion base para Liquidacion Seguro de cartera', 'saldoinversion', 'C', 'A'), ('229', 'TASA TEA A TOMAR EN RECUP. DE CARTERA', '1 TASA LIB. A MODIFICAR, 2 TASA ACTUAL', '2', 'C', 'A'), ('230', 'PERIODICIDAD A TOMAR EN RECUP. DE CARTERA', '1 PERIOD. LIB. A MODIFICAR, 2 PERIOD. DE LA LINEA DE RECUP.', '1', 'C', 'A'), ('234', 'CODIGO DE PLANO PREDETERMINADO EN NOVEDAD', 'CODIGO DE PLANO PREDETERMINADO PARA LAS PAGADURIAS NUEVAS SIN CONFIG. DE PLANO', '001', 'C', 'A'), ('236', 'NUMERO DE DIAS DE EXIGIBILIDAD DE PAGOS', 'NUMERO DE DIAS DE EXIGIBILIDAD DE PAGOS', '60', 'N', 'A'), ('238', 'NOMBRE FIRMANTE EN CARTAS DE COBRO', 'NOMBRE FIRMANTE EN CARTAS DE COBRO', '', 'C', 'A'), ('239', 'RUTA IMAGEN DE FIRMA EN CARTAS DE COBRO', 'RUTA IMAGEN DE FIRMA EN CARTAS DE COBRO', '', 'C', 'A'), ('240', 'FUENTE UTILIZADA EN LAS REVERSIONES DE DOC. CONTABLES', 'FUENTE UTILIZADA EN LAS REVERSIONES DE DOC. CONTABLES', 'RD', 'C', 'A'), ('241', 'CUENTA CONCEPTO 524 - CANCELACION DE INCAPACIDADES', 'CUENTA CONCEPTO 524 - CANCELACION DE INCAPACIDADES', '16909503', 'C', 'A'), ('242', 'COBRANZA-', 'IP,PUERTO,BD,USUARIO,CLAVE PARA CONSULTAR SI UN CLIENTE ESTA EN COBRANZA', '192.168.1.226,3307,dafin,root,3151AF8561DD1C0DE194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B37044A00A65D6F199', 'C', 'A'), ('243', 'PERMITIR EDITAR CAMPO DE CARGO POR SERVICIOS (S/N)', 'PERMITIR EDITAR CAMPO DE CARGO POR SERVICIOS (S/N)', 'N', 'C', 'A'), ('244', 'INT. ANTICIPADO SE CAPITALIZA (S/N)', 'INT. ANTICIPADO SE CAPITALIZA (S/N)', 'S', 'C', 'A'), ('246', 'CUENTA CXP DE CARGO POR SERVICIOS', 'CUENTA CXP DE CARGO POR SERVICIOS', '24959501', 'C', 'A'), ('247', 'NUMERO DE PERIODOS DISPONIBLES EN CONTRATOS POR SERV.', 'NUMERO DE PERIODOS DISPONIBLES EN CONTRATOS POR SERV.', '3', 'N', 'A'), ('248', 'PERMITIR EDITAR CAMPO DE PERIODO DE INT. ANTICIPADO', 'PERMITIR EDITAR CAMPO DE PERIODO DE INT. ANTICIPADO', 'S', 'C', 'A'), ('249', 'RUTA LOGO DE EMPRESA', 'RUTA LOGO DE EMPRESA', '\\\\192.168.1.104\\fenix\\coosuper.jpg', 'C', 'A'), ('250', 'PERMITIR REDONDEAR A TRES CIFRAS EL VALOR DE LA CUOTA (S/N)', 'PERMITIR REDONDEAR A TRES CIFRAS EL VALOR DE LA CUOTA (FORM. DE SOLICITUD DE CREDITO)', 'S', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('251', 'REPORTAR A CIFIN MES SGTE. AL CORTE DE CARTERA (S/N)', 'SI ESCOGE NO, SE REPORTA HASTA LA FECHA DE CORTE SIN ADELANTAR UN MES', 'S', 'C', 'A'), ('252', 'CONTRATOS POR SERVICIOS', 'RECIBIR DINEROS DE  CONTRATOS POR SERVICIOS', '41509805', 'C', 'A'), ('253', 'CORREO ARCHIVO PLANO', 'CORREO QUE SE COLOCA POR DEFECTO EN LA GENERACION DEL ARCHIVO PLANO DE BBVA.', 'tesoreria@coosupercredito.com', 'C', 'A'), ('255', 'PORCENTAJE SANCION PREPAGO', '% DE SANCION PREPAGO COBRADO EN LA LIQUIDACION DE UN CREDITO. SOBRE EL VALOR DE SALDO INVERSION.', '10', 'N', 'A'), ('256', 'VALOR BASE CUOTA CALCULO DE MORA', 'VALOR BASE CUOTA CALCULO DE MORA. 1: CUOTA LIBRANZA. 2: CUOTA DEL CREDITO', '1', 'C', 'A');
COMMIT;

-- ----------------------------
-- Table structure for cfg_roles
-- ----------------------------
DROP TABLE IF EXISTS `cfg_roles`;
CREATE TABLE `cfg_roles` (
`role_idrol`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`role_nombre`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'NombreRol' ,
`role_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
`role_fcreacion`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`role_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
PRIMARY KEY (`role_idrol`),
FOREIGN KEY (`role_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `role_usrcreacion` (`role_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of cfg_roles
-- ----------------------------
BEGIN;
INSERT INTO `cfg_roles` VALUES ('AD2', 'ADMINISTRADOR 2', 'A', '2015-07-19 17:23:22', 'ADMIN'), ('ADI', 'AUXILIAR DE AUDITORIA', 'A', '2015-07-19 17:22:03', 'ADMIN'), ('ADM', 'ADMINISTRADOR', 'A', '2015-01-18 15:25:51', 'ADMIN'), ('AU2', 'ROL DE PRUEBA', 'A', '2015-07-20 21:27:32', 'ADMIN'), ('AUD', 'COORDINADOR DE AUDITORIA', 'A', '2015-07-16 21:57:07', 'ADMIN'), ('AUX', 'AUXILIAR DE SOPORTE', 'A', '2015-07-24 21:45:17', 'ADMIN'), ('CON', 'CONTADOR PUBLICO', 'A', '2015-07-25 05:07:53', 'ADMIN'), ('SUP', 'SUPERVISOR', 'A', '2015-07-25 05:09:08', 'ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for cfg_rolesopciones
-- ----------------------------
DROP TABLE IF EXISTS `cfg_rolesopciones`;
CREATE TABLE `cfg_rolesopciones` (
`roop_idrol`  varchar(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`roop_idopcion`  smallint(5) UNSIGNED NOT NULL ,
`roop_buscar`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
`roop_nuevo`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
`roop_guardar`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
`roop_cancelar`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
`roop_modificar`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
`roop_anular`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
`roop_imprimir`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
`roop_supervisar`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`roop_idrol`, `roop_idopcion`),
FOREIGN KEY (`roop_idrol`) REFERENCES `cfg_roles` (`role_idrol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`roop_idopcion`) REFERENCES `publica`.`mae_opciones` (`opci_idopcion`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `roop_idopcion` (`roop_idopcion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of cfg_rolesopciones
-- ----------------------------
BEGIN;
INSERT INTO `cfg_rolesopciones` VALUES ('AD2', '7', '1', '1', '1', '1', '1', '1', '1', '1'), ('AD2', '8', '1', '1', '1', '1', '0', '1', '1', '1'), ('AD2', '9', '1', '1', '1', '1', '1', '1', '1', '1'), ('AD2', '10', '1', '1', '1', '1', '1', '1', '1', '1'), ('AD2', '14', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADI', '13', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADI', '17', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADI', '19', '0', '1', '0', '0', '1', '1', '1', '1'), ('ADI', '21', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADI', '22', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '3', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '4', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '5', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '7', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '8', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '9', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '10', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '12', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '13', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '14', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '17', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '19', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '21', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '22', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '23', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '24', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '25', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '28', '1', '1', '1', '1', '1', '1', '1', '1'), ('ADM', '29', '1', '1', '1', '1', '1', '1', '1', '1'), ('AU2', '17', '0', '1', '0', '0', '0', '1', '0', '1'), ('AUD', '19', '1', '1', '1', '1', '1', '1', '1', '1'), ('AUD', '21', '1', '1', '1', '1', '1', '1', '1', '1'), ('AUD', '22', '0', '0', '0', '0', '0', '0', '1', '0'), ('AUX', '7', '1', '1', '1', '1', '1', '1', '1', '1'), ('AUX', '8', '1', '1', '1', '1', '1', '1', '1', '1'), ('AUX', '9', '1', '1', '1', '1', '1', '1', '1', '1'), ('AUX', '10', '1', '1', '1', '1', '1', '1', '1', '1'), ('AUX', '14', '1', '1', '1', '1', '1', '1', '1', '1'), ('CON', '13', '1', '1', '1', '1', '1', '1', '1', '1'), ('CON', '17', '0', '1', '1', '1', '0', '1', '1', '1'), ('CON', '19', '1', '1', '1', '1', '1', '1', '1', '1'), ('CON', '21', '1', '1', '1', '1', '1', '1', '1', '1'), ('CON', '22', '1', '1', '1', '1', '1', '1', '1', '1'), ('SUP', '12', '0', '0', '0', '0', '0', '0', '1', '0'), ('SUP', '13', '1', '1', '1', '1', '1', '1', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for cfg_rolesusuarios
-- ----------------------------
DROP TABLE IF EXISTS `cfg_rolesusuarios`;
CREATE TABLE `cfg_rolesusuarios` (
`rous_usuario`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`rous_idrol`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`rous_fcreacion`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`rous_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
PRIMARY KEY (`rous_usuario`, `rous_idrol`),
FOREIGN KEY (`rous_usuario`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`rous_idrol`) REFERENCES `cfg_roles` (`role_idrol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `rous_idrol` (`rous_idrol`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of cfg_rolesusuarios
-- ----------------------------
BEGIN;
INSERT INTO `cfg_rolesusuarios` VALUES ('ADMIN', 'ADM', '2015-01-18 16:39:09', 'ADMIN'), ('ADMINII', 'ADM', '2017-07-14 15:10:38', 'ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for cfg_sucursales
-- ----------------------------
DROP TABLE IF EXISTS `cfg_sucursales`;
CREATE TABLE `cfg_sucursales` (
`sucu_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '0' ,
`sucu_nombre`  varchar(80) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '0' ,
`sucu_ubicacion`  char(8) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`sucu_direccion`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`sucu_telefono1`  varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`sucu_telefono2`  varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`sucu_email`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`sucu_rutafotos`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`sucu_rutahuellas`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`sucu_resolucionfactura`  varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`sucu_resolucionfecha`  date NULL DEFAULT NULL ,
`sucu_desde`  int(12) NULL DEFAULT NULL ,
`sucu_hasta`  int(12) NULL DEFAULT NULL ,
`sucu_fuente`  varchar(6) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`sucu_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`sucu_fcreacion`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
`sucu_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`sucu_codigo`),
FOREIGN KEY (`sucu_ubicacion`) REFERENCES `publica`.`mae_dptomunicipio` (`lug_idpdm`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`sucu_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`sucu_fuente`) REFERENCES `cn_fuentes` (`fuen_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `sucu_dpto` (`sucu_ubicacion`) USING BTREE ,
INDEX `sucu_usrcreacion` (`sucu_usrcreacion`) USING BTREE ,
INDEX `sucu_fuente` (`sucu_fuente`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of cfg_sucursales
-- ----------------------------
BEGIN;
INSERT INTO `cfg_sucursales` VALUES ('001', 'BARRANQUILLA - PRINCIPAL', '16908001', 'CALLE 41 NRO. 43-19', '3411808', null, null, null, null, null, null, null, null, null, 'ADMIN', '2015-01-15 21:18:08', 'A');
COMMIT;

-- ----------------------------
-- Table structure for cfg_sucursalesusuario
-- ----------------------------
DROP TABLE IF EXISTS `cfg_sucursalesusuario`;
CREATE TABLE `cfg_sucursalesusuario` (
`ussu_alias`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`ussu_sucursal`  char(6) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`ussu_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`ussu_fcreacion`  datetime NOT NULL ,
`ussu_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT 'A' ,
PRIMARY KEY (`ussu_alias`, `ussu_sucursal`),
FOREIGN KEY (`ussu_alias`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`ussu_sucursal`) REFERENCES `cfg_sucursales` (`sucu_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`ussu_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `ussu_sucursal` (`ussu_sucursal`) USING BTREE ,
INDEX `ussu_usrcreacion` (`ussu_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of cfg_sucursalesusuario
-- ----------------------------
BEGIN;
INSERT INTO `cfg_sucursalesusuario` VALUES ('ADMIN', '001', 'ADMIN', '2017-06-18 17:44:55', 'A'), ('ADMINII', '001', 'ADMIN', '2017-07-14 15:11:34', 'A');
COMMIT;

-- ----------------------------
-- Table structure for cn_centroscosto
-- ----------------------------
DROP TABLE IF EXISTS `cn_centroscosto`;
CREATE TABLE `cn_centroscosto` (
`ccos_codigo`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`ccos_nombre`  varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`ccos_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`ccos_fcreacion`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`ccos_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`ccos_codigo`),
FOREIGN KEY (`ccos_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `cn_centroscosto_ibfk_1` (`ccos_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of cn_centroscosto
-- ----------------------------
BEGIN;
INSERT INTO `cn_centroscosto` VALUES ('001', 'CENTRO DE PRUEBA', 'ADMIN', '2017-06-25 11:45:48', 'A'), ('002', 'CAJA', 'ADMIN', '2017-07-07 21:14:40', 'I');
COMMIT;

-- ----------------------------
-- Table structure for cn_comprobantes
-- ----------------------------
DROP TABLE IF EXISTS `cn_comprobantes`;
CREATE TABLE `cn_comprobantes` (
`comp_sucursal`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Sucursal' ,
`comp_fuente`  varchar(6) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Tipo de fuente contable' ,
`comp_consecutivo`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Consecutivo del comprobante' ,
`comp_consecutivoant`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '' ,
`comp_fecha`  date NOT NULL COMMENT 'Fecha del comprobante. DD/MM/AAAA' ,
`comp_descripcion`  text CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL COMMENT 'Descripción del comprobante' ,
`comp_anexo`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL COMMENT 'Anexos del comprobante' ,
`comp_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`comp_fcreacion`  datetime NOT NULL ,
`comp_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' COMMENT 'Estado del comprobante. A: ACTIVO, I:INACTIVO' ,
PRIMARY KEY (`comp_sucursal`, `comp_fuente`, `comp_consecutivo`),
FOREIGN KEY (`comp_sucursal`) REFERENCES `cfg_sucursales` (`sucu_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`comp_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`comp_fuente`) REFERENCES `cn_fuentes` (`fuen_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `comp_fuente` (`comp_fuente`) USING BTREE ,
INDEX `comp_usrcreacion` (`comp_usrcreacion`) USING BTREE ,
INDEX `comp_sucursal` (`comp_sucursal`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of cn_comprobantes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cn_comprobantesdetalle
-- ----------------------------
DROP TABLE IF EXISTS `cn_comprobantesdetalle`;
CREATE TABLE `cn_comprobantesdetalle` (
`deta_sucursal`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`deta_fuente`  varchar(6) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`deta_consecutivo`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`deta_item`  int(5) NOT NULL COMMENT ' ' ,
`deta_puc`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT ' ' ,
`deta_debito`  double(20,2) UNSIGNED NULL DEFAULT 0.00 COMMENT ' ' ,
`deta_credito`  double(20,2) UNSIGNED NULL DEFAULT 0.00 ,
`deta_nit`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT ' ' ,
`deta_concepto`  text CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL ,
`deta_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT ' ' ,
`deta_fcreacion`  datetime NOT NULL COMMENT '  ' ,
PRIMARY KEY (`deta_sucursal`, `deta_fuente`, `deta_consecutivo`, `deta_item`),
FOREIGN KEY (`deta_puc`) REFERENCES `cn_puc` (`puc_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`deta_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`deta_sucursal`, `deta_fuente`, `deta_consecutivo`) REFERENCES `cn_comprobantes` (`comp_sucursal`, `comp_fuente`, `comp_consecutivo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `deta_sucursal` (`deta_sucursal`, `deta_fuente`, `deta_consecutivo`, `deta_item`) USING BTREE ,
INDEX `deta_puc` (`deta_puc`) USING BTREE ,
INDEX `deta_usrcreacion` (`deta_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of cn_comprobantesdetalle
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cn_fuentes
-- ----------------------------
DROP TABLE IF EXISTS `cn_fuentes`;
CREATE TABLE `cn_fuentes` (
`fuen_codigo`  varchar(6) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`fuen_nombre`  varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`fuen_descripcion`  varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NULL DEFAULT NULL ,
`fuen_usrcreacion`  varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '' ,
`fuen_fcreacion`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`fuen_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`fuen_codigo`),
FOREIGN KEY (`fuen_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `cn_fuentes_ibfk_1` (`fuen_usrcreacion`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of cn_fuentes
-- ----------------------------
BEGIN;
INSERT INTO `cn_fuentes` VALUES ('AF', 'ACTIVO FIJO', 'CONTABILIZACION DE ACTIVO FIJO', 'ADMIN', '2017-06-18 20:06:45', 'A');
COMMIT;

-- ----------------------------
-- Table structure for cn_fuentesdet
-- ----------------------------
DROP TABLE IF EXISTS `cn_fuentesdet`;
CREATE TABLE `cn_fuentesdet` (
`fude_sucursal`  char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '' ,
`fude_fuente`  varchar(6) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '' ,
`fude_consecutivo`  enum('S','N') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'S' ,
`fude_numero`  varchar(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '0' ,
PRIMARY KEY (`fude_sucursal`, `fude_fuente`),
FOREIGN KEY (`fude_sucursal`) REFERENCES `cfg_sucursales` (`sucu_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`fude_fuente`) REFERENCES `cn_fuentes` (`fuen_codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `fud_fuente` (`fude_fuente`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of cn_fuentesdet
-- ----------------------------
BEGIN;
INSERT INTO `cn_fuentesdet` VALUES ('001', 'AF', 'S', '0');
COMMIT;

-- ----------------------------
-- Table structure for cn_puc
-- ----------------------------
DROP TABLE IF EXISTS `cn_puc`;
CREATE TABLE `cn_puc` (
`puc_codigo`  varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Codigo contable' ,
`puc_nombre`  varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Nombre de la cuenta contable' ,
`puc_naturaleza`  char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL ,
`puc_nivel`  int(2) UNSIGNED NOT NULL DEFAULT 0 ,
`puc_bloqueo`  int(1) NOT NULL DEFAULT 0 ,
`puc_estado`  enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' ,
PRIMARY KEY (`puc_codigo`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_spanish_ci

;

-- ----------------------------
-- Records of cn_puc
-- ----------------------------
BEGIN;
INSERT INTO `cn_puc` VALUES ('1', 'ACTIVO', 'D', '1', '0', 'A'), ('11', 'DISPONIBLE', 'D', '2', '1', 'A'), ('1105', 'CAJA', 'D', '3', '1', 'A'), ('110505', 'CAJA GENERAL', 'D', '4', '1', 'A'), ('11050501', 'CAJA BARRANQUILLA', 'D', '5', '1', 'A'), ('11050502', 'CAJA SANTAMARTA', 'D', '5', '1', 'A'), ('11050503', 'CAJA CARTAGENA', 'D', '5', '1', 'A'), ('11050504', 'CAJA MONTERIA', 'D', '5', '1', 'A'), ('11050505', 'CAJA SINCELEJO', 'D', '5', '1', 'A'), ('11050506', 'CAJA VALLEDUPAR', 'D', '5', '1', 'A'), ('110510', 'CAJA MENOR', 'D', '4', '1', 'A'), ('11051001', 'CAJA MENOR BARRANQUILLA', 'D', '5', '0', 'A'), ('11051002', 'CAJA MENOR SANTA MARTA', 'D', '5', '0', 'A'), ('11051003', 'CAJA MENOR CARTAGENA', 'D', '5', '0', 'A'), ('11051004', 'CAJA MENOR MONTERIA', 'D', '5', '0', 'A'), ('11051005', 'CAJA MENOR SINCELEJO', 'D', '5', '0', 'A'), ('11051006', 'CAJA MENOR BOGOTA', 'D', '5', '0', 'A'), ('1110', 'BANCOS Y OTRAS ENTIDADES', 'D', '3', '1', 'A'), ('111005', 'BANCOS COMERCIALES', 'D', '4', '1', 'A'), ('11100501', 'CAJA SOCIAL CTA 21002558982', 'D', '5', '0', 'A'), ('11100502', 'BANCO POPULAR 11022019743-2', 'D', '5', '0', 'A'), ('11100503', 'BANCO BBVA BARRANQUILLA 090011875', 'D', '5', '0', 'A'), ('11100504', 'BANCO BBVA 826015646', 'D', '5', '0', 'A'), ('11100505', 'BANCO CAJA SOCIAL 21002664957 CONV 1079', 'D', '5', '0', 'A'), ('11100520', 'CUENTA AHORRO CAJA SOCIAL 24018253407', 'D', '5', '0', 'A'), ('11100521', 'CUENTA AHORRO VISTA EMPRESARIAL 409 JURISCOOP', 'D', '5', '0', 'A'), ('11100590', 'PAGONET', 'D', '5', '0', 'A'), ('111010', 'BANCOS COOPERATIVOS', 'D', '4', '1', 'A'), ('111015', 'ENTIDADES SECTOR SOLIDARIO', 'D', '4', '1', 'A'), ('111020', 'ENTIDADES DEL EXTERIOR', 'D', '4', '1', 'A'), ('111025', 'OTRAS ENTIDADES', 'D', '4', '1', 'A'), ('1115', 'FONDOS ESPECIFICOS', 'D', '3', '1', 'A'), ('111505', 'FONDOS ESPECIALES', 'D', '4', '1', 'A'), ('111510', 'FONDOS DE CAMBIO', 'D', '4', '1', 'A'), ('1120', 'FONDO DE LIQUIDEZ', 'D', '3', '1', 'A'), ('112005', 'DEPOSITO DE AHORRO A LA VISTA', 'D', '4', '1', 'A'), ('112010', 'OTROS', 'D', '4', '1', 'A'), ('1130', 'REMESAS EN TRANSITO', 'D', '3', '1', 'A'), ('113005', 'REMESAS DEL PAÍS', 'D', '4', '1', 'A'), ('113010', 'REMESAS OTRO PAÍS', 'D', '4', '1', 'A'), ('12', 'INVERSIONES', 'D', '2', '1', 'A'), ('1201', 'COMPROMISOS DE  REVENTA DE  INVERSIONES', 'D', '3', '1', 'A'), ('120105', 'BANCOS', 'D', '4', '1', 'A'), ('120110', 'CORPORACIONES FINANCIERAS', 'D', '4', '1', 'A'), ('120115', 'COMPAÑIAS DE FINANCIAMIENTO COMERCIAL', 'D', '4', '1', 'A'), ('120116', 'SOCIEDADES FIDUCIARIAS', 'D', '4', '1', 'A'), ('120117', 'SOCIEDADES ADMINISTRADORAS DE FONDOS DE PENSIONES Y DE CESANTIAS', 'D', '4', '1', 'A'), ('120120', 'OTRAS ENTIDADES FINANCIERAS', 'D', '4', '1', 'A'), ('120125', 'BANCO DE LA REPÚBLICA', 'D', '4', '1', 'A'), ('120130', 'TESORERÍA GENERAL DE LA NACIÓN', 'D', '4', '1', 'A'), ('120135', 'ENTIDADES DEL SECTOR PÚBLICO', 'D', '4', '1', 'A'), ('120140', 'RESIDENTES DEL EXTERIOR', 'D', '4', '1', 'A'), ('120145', 'COOPERATIVAS', 'D', '4', '1', 'A'), ('120150', 'FONDOS DE EMPLEADOS', 'D', '4', '1', 'A'), ('120195', 'OTRAS', 'D', '4', '1', 'A'), ('1202', 'COMPROMISOS DE  REVENTA DE CARTERA', 'D', '3', '1', 'A'), ('120205', 'BANCOS', 'D', '4', '1', 'A'), ('120210', 'CORPORACIONES FINANCIERAS', 'D', '4', '1', 'A'), ('120220', 'COMPAÑIAS DE FINANCIAMIENTO COMERCIAL', 'D', '4', '1', 'A'), ('120225', 'OTRAS ENTIDADES FINANCIERAS', 'D', '4', '1', 'A'), ('120230', 'BANCO DE LA REPÚBLICA', 'D', '4', '1', 'A'), ('120235', 'TESORERÍA GENERAL DE LA NACIÓN', 'D', '4', '1', 'A'), ('120240', 'ENTIDADES DEL SECTOR PÚBLICO', 'D', '4', '1', 'A'), ('120245', 'RESIDENTES DEL EXTERIOR', 'D', '4', '1', 'A'), ('120250', 'COOPERATIVAS', 'D', '4', '1', 'A'), ('120255', 'FONDOS DE EMPLEADOS', 'D', '4', '1', 'A'), ('120295', 'OTRAS', 'D', '4', '1', 'A'), ('1203', 'FONDO DE LIQUIDEZ', 'D', '3', '1', 'A'), ('120305', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA  SUPERINTEND', 'D', '4', '1', 'A'), ('120310', 'CERTIFICADO DE DEPÓSITO DE AHORRO A TÉRMINO', 'D', '4', '1', 'A'), ('12031001', 'C.D.T. BANCO CAJA SOCIAL', 'D', '5', '0', 'A'), ('120320', 'FONDOS  FIDUCIARIOS', 'D', '4', '1', 'A'), ('120325', 'FONDOS DE VALORES', 'D', '4', '1', 'A'), ('120330', 'PATRIMONIO AUTONOMO', 'D', '4', '1', 'A'), ('1204', 'INVERSIONES NEGOCIABLES EN TITULOS DE DEUDA', 'D', '3', '1', 'A'), ('120401', 'TITULOS DE DEUDA PÚBLICA INTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A'), ('120402', 'TITULOS DE DEUDA PÚBLICA EXTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A'), ('120403', 'OTROS TITULOS DE DEUDA PÚBLICA', 'D', '4', '1', 'A'), ('120404', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGAFIN', 'D', '4', '1', 'A'), ('120405', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGACOOP', 'D', '4', '1', 'A'), ('120406', 'TITULOS EMITIDOS POR EL BANCO DE LA REPUBLICA', 'D', '4', '1', 'A'), ('120407', 'BONOS HIPOTECARIOS', 'D', '4', '1', 'A'), ('120408', 'TITULOS HIPOTECARIOS', 'D', '4', '1', 'A'), ('120409', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE CARTERA HIPOTECARIA', 'D', '4', '1', 'A'), ('120410', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE SUBYACENTES DISTINTOS DE ', 'D', '4', '1', 'A'), ('120411', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA SUPERINTENDE', 'D', '4', '1', 'A'), ('120414', 'TITULOS EMITIDOS POR ENTIDADES NO VIGILADAS POR LA SUPERINTENDENCIA BANCARIA (INCLUIDOS LOS BONOS OB', 'D', '4', '1', 'A'), ('120415', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR GOBIERNOS EXTRANJEROS', 'D', '4', '1', 'A'), ('120416', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR BANCOS CENTRALES EXTRANJEROS', 'D', '4', '1', 'A'), ('120417', 'TITULOS EMITIDOS, AVALADOS, GARANTIZADOS O ACEPTADOS POR BANCOS DEL EXTERIOR', 'D', '4', '1', 'A'), ('120418', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR ORGANISMOS MULTILATERALES DE CRÉDITO', 'D', '4', '1', 'A'), ('120442', 'TITULOS EMITIDOS POR RESIDENTES EN EL EXTERIOR', 'D', '4', '1', 'A'), ('120495', 'OTROS TITULOS', 'D', '4', '1', 'A'), ('1206', 'INVERSIONES NEGOCIABLES EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A'), ('120601', 'ACCIONES CON ALTA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A'), ('120602', 'ACCIONES CON MEDIA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A'), ('120605', 'PARTICIPACIONES EN FONDOS COMUNES ORDINARIOS', 'D', '4', '1', 'A'), ('120606', 'PARTICIPACIONES EN FONDOS COMUNES ESPECIALES', 'D', '4', '1', 'A'), ('120607', 'PARTICIPACIONES EN FONDOS DE VALORES', 'D', '4', '1', 'A'), ('120608', 'TITULOS PARTICIPATIVOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120609', 'TITULOS MIXTOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A'), ('120610', 'PARTICIPACIONES EN FONDOS MUTUOS DE INVERSION INTERNACIONALES QUE INVIERTAN EXCLUSIVAMENTE EN TITULO', 'D', '4', '1', 'A'), ('120611', 'PARTICIPACIONES EN FONDOS INDICE', 'D', '4', '1', 'A'), ('120612', 'PARTICIPACION EN FONDOS MUTUOS DE INVERSION INTERNACIONALES QUE INVIERTAN EXCLUSIVAMENTE EN RENTA VA', 'D', '4', '1', 'A'), ('120613', 'PARTICIPACION EN FONDOS DE INVERSION', 'D', '4', '1', 'A'), ('120614', 'PARTICIPACION EN FONDOS DE PENSIONES Y CESANTIAS', 'D', '4', '1', 'A'), ('1208', 'INVERSIONES PARA MANTENER HASTA EL VENCIMIENTO', 'D', '3', '1', 'A'), ('120801', 'TITULOS DE DEUDA PÚBLICA INTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A'), ('120802', 'TITULOS DE DEUDA PÚBLICA EXTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A'), ('120803', 'OTROS TITULOS DE DEUDA PÚBLICA', 'D', '4', '1', 'A'), ('120804', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGAFIN', 'D', '4', '1', 'A'), ('120805', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGACOOP', 'D', '4', '1', 'A'), ('120806', 'TITULOS EMITIDOS POR EL BANCO DE LA REPUBLICA', 'D', '4', '1', 'A'), ('120807', 'BONOS HIPOTECARIOS', 'D', '4', '1', 'A'), ('120808', 'TITULOS HIPOTECARIOS', 'D', '4', '1', 'A'), ('120809', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE CARTERA HIPOTECARIA', 'D', '4', '1', 'A'), ('120810', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE SUBYACENTES DISTINTOS DE ', 'D', '4', '1', 'A'), ('120811', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA SUPERINTENDE', 'D', '4', '1', 'A'), ('120814', 'TITULOS EMITIDOS POR ENTIDADES NO VIGILADAS POR LA SUPERINTENDENCIA BANCARIA (INCLUIDOS LOS BONOS OB', 'D', '4', '1', 'A'), ('120815', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR GOBIERNOS EXTRANJEROS', 'D', '4', '1', 'A'), ('120816', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR BANCOS CENTRALES EXTRANJEROS', 'D', '4', '1', 'A'), ('120817', 'TITULOS EMITIDOS, AVALADOS, GARANTIZADOS O ACEPTADOS POR BANCOS DEL EXTERIOR', 'D', '4', '1', 'A'), ('120818', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR ORGANISMOS MULTILATERALES DE CRÉDITO', 'D', '4', '1', 'A'), ('120842', 'TITULOS EMITIDOS POR RESIDENTES EN EL EXTERIOR', 'D', '4', '1', 'A'), ('120895', 'OTROS TITULOS', 'D', '4', '1', 'A'), ('1213', 'INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS DE DEUDA', 'D', '3', '1', 'A'), ('121301', 'TITULOS DE DEUDA PÚBLICA INTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A'), ('121302', 'TITULOS DE DEUDA PÚBLICA EXTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A'), ('121303', 'OTROS TITULOS DE DEUDA PÚBLICA', 'D', '4', '1', 'A'), ('121304', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGAFIN', 'D', '4', '1', 'A'), ('121305', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGACOOP', 'D', '4', '1', 'A'), ('121306', 'TITULOS EMITIDOS POR EL BANCO DE LA REPUBLICA', 'D', '4', '1', 'A'), ('121307', 'BONOS HIPOTECARIOS', 'D', '4', '1', 'A'), ('121308', 'TITULOS HIPOTECARIOS', 'D', '4', '1', 'A'), ('121309', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE CARTERA HIPOTECARIA', 'D', '4', '1', 'A'), ('121310', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE SUBYACENTES DISTINTOS DE ', 'D', '4', '1', 'A'), ('121311', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA SUPERINTENDE', 'D', '4', '1', 'A'), ('121314', 'TITULOS EMITIDOS POR ENTIDADES NO VIGILADAS POR LA SUPERINTENDENCIA BANCARIA (INCLUIDOS LOS BONOS OB', 'D', '4', '1', 'A'), ('121315', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR GOBIERNOS EXTRANJEROS', 'D', '4', '1', 'A'), ('121316', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR BANCOS CENTRALES EXTRANJEROS', 'D', '4', '1', 'A'), ('121317', 'TITULOS EMITIDOS, AVALADOS, GARANTIZADOS O ACEPTADOS POR BANCOS DEL EXTERIOR', 'D', '4', '1', 'A'), ('121318', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR ORGANISMOS MULTILATERALES DE CRÉDITO', 'D', '4', '1', 'A'), ('121342', 'TITULOS EMITIDOS POR RESIDENTES EN EL EXTERIOR', 'D', '4', '1', 'A'), ('121395', 'OTROS TITULOS', 'D', '4', '1', 'A'), ('1216', 'INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A'), ('121601', 'ACCIONES CON ALTA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A'), ('121602', 'ACCIONES CON MEDIA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A'), ('121604', 'ACCIONES CON BAJA Y MÍNIMA LIQUIDEZ BURSATIL O SIN COTIZACION EN BOLSA', 'D', '4', '1', 'A'), ('121608', 'TITULOS PARTICIPATIVOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A'), ('121609', 'TITULOS MIXTOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A'), ('121695', 'OTROS TITULOS', 'D', '4', '1', 'A'), ('1231', 'DERECHOS DE RECOMPRA DE INVERSIONES NEGOCIABLES EN TITULOS DE DEUDA', 'D', '3', '1', 'A'), ('123101', 'TITULOS DE DEUDA PUBLICA INTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A'), ('123102', 'TITULOS DE DEUDA PUBLICA EXTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A'), ('123103', 'OTROS TITULOS DE DEUDA PUBLICA', 'D', '4', '1', 'A'), ('123104', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGAFIN', 'D', '4', '1', 'A'), ('123105', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGACOOP', 'D', '4', '1', 'A'), ('123106', 'TITULOS EMITIDOS POR EL BANCO DE LA REPUBLICA', 'D', '4', '1', 'A'), ('123107', 'BONOS HIPOTECARIOS', 'D', '4', '1', 'A'), ('123108', 'TITULOS HIPOTECARIOS', 'D', '4', '1', 'A'), ('123109', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE CARTERA HIPOTECARIA', 'D', '4', '1', 'A'), ('123110', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE SUBYACENTES DISTINTOS DE ', 'D', '4', '1', 'A'), ('123111', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA SUPERINTENDE', 'D', '4', '1', 'A'), ('123114', 'TITULOS EMITIDOS POR ENTIDADES NO VIGILADAS POR LA SUPERINTENDENCIA BANCARIA', 'D', '4', '1', 'A'), ('123115', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR GOBIERNOS EXTRANJEROS', 'D', '4', '1', 'A'), ('123116', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR BANCOS CENTRALES EXTRANJEROS', 'D', '4', '1', 'A'), ('123117', 'TITULOS EMITIDOS, AVALADOS, GARANTIZADOS O ACEPTADOS POR BANCOS DEL EXTERIOR', 'D', '4', '1', 'A'), ('123118', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR ORGANISMOS MULTILATERALES DE CRÉDITO', 'D', '4', '1', 'A'), ('123142', 'TITULOS EMITIDOS POR RESIDENTES EN EL EXTERIOR', 'D', '4', '1', 'A'), ('123195', 'OTROS TITULOS', 'D', '4', '1', 'A'), ('1232', 'DERECHOS DE RECOMPRA DE INVERSIONES NEGOCIABLES EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A'), ('123201', 'ACCIONES CON ALTA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A'), ('123202', 'ACCIONES CON MEDIA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A'), ('123208', 'TITULOS PARTICIPATIVOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A'), ('123209', 'TITULOS MIXTOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A'), ('1235', 'DERECHOS DE RECOMPRA DE INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS DE DEUDA', 'D', '3', '1', 'A'), ('123501', 'TITULOS DE DEUDA PÚBLICA INTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A'), ('123502', 'TITULOS DE DEUDA PÚBLICA EXTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A'), ('123503', 'OTROS TITULOS DE DEUDA PÚBLICA', 'D', '4', '1', 'A'), ('123504', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGAFIN', 'D', '4', '1', 'A'), ('123505', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGACOOP', 'D', '4', '1', 'A'), ('123506', 'TITULOS EMITIDOS POR EL BANCO DE LA REPUBLICA', 'D', '4', '1', 'A'), ('123507', 'BONOS HIPOTECARIOS', 'D', '4', '1', 'A'), ('123508', 'TITULOS HIPOTECARIOS', 'D', '4', '1', 'A'), ('123509', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE CARTERA HIPOTECARIA', 'D', '4', '1', 'A'), ('123510', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE SUBYACENTES DISTINTOS DE ', 'D', '4', '1', 'A'), ('123511', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA SUPERINTENDE', 'D', '4', '1', 'A'), ('123514', 'TITULOS EMITIDOS POR ENTIDADES NO VIGILADAS POR LA SUPERINTENDENCIA BANCARIA (INCLUIDOS LOS BONOS OB', 'D', '4', '1', 'A'), ('123515', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR GOBIERNOS EXTRANJEROS', 'D', '4', '1', 'A'), ('123516', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR BANCOS CENTRALES EXTRANJEROS', 'D', '4', '1', 'A'), ('123517', 'TITULOS EMITIDOS, AVALADOS, GARANTIZADOS O ACEPTADOS POR BANCOS DEL EXTERIOR', 'D', '4', '1', 'A'), ('123518', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR ORGANISMOS MULTILATERALES DE CRÉDITO', 'D', '4', '1', 'A'), ('123542', 'TITULOS EMITIDOS POR RESIDENTES EN EL EXTERIOR', 'D', '4', '1', 'A'), ('123595', 'OTROS TITULOS', 'D', '4', '1', 'A'), ('1236', 'DERECHOS DE RECOMPRA DE INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A'), ('123601', 'ACCIONES CON ALTA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A'), ('123602', 'ACCIONES CON MEDIA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A'), ('123604', 'ACCIONES CON BAJA Y MÍNIMA LIQUIDEZ BURSATIL O SIN COTIZACION EN BOLSA', 'D', '4', '1', 'A'), ('123695', 'OTROS', 'D', '4', '1', 'A'), ('1286', 'PROVISION DE INVERSIONES NEGOCIABLES EN TITULOS DE DEUDA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128605', 'LARGO PLAZO BB+, BB, BB-', 'D', '4', '1', 'A'), ('128610', 'LARGO PLAZO B+, B, B-', 'D', '4', '1', 'A'), ('128615', 'LARGO PLAZO CCC', 'D', '4', '1', 'A'), ('128620', 'LARGO PLAZO DD, EE', 'D', '4', '1', 'A'), ('128625', 'CORTO PLAZO 3', 'D', '4', '1', 'A'), ('128630', 'CORTO PLAZO 4', 'D', '4', '1', 'A'), ('128635', 'CORTO PLAZO 5, 6', 'D', '4', '1', 'A'), ('128640', 'CATEGORIA B   RIESGO ACEPTABLE, SUPERIOR AL NORMAL', 'D', '4', '1', 'A'), ('128645', 'CATEGORIA C   RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('128650', 'CATEGORIA D   RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('128655', 'CATEGORIA E   INCOBRABLE', 'D', '4', '1', 'A'), ('128695', 'OTRAS PROVISIONES', 'D', '4', '1', 'A'), ('1287', 'PROVISION DE INVERSIONES NEGOCIABLES EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A'), ('128740', 'CATEGORIA B   RIESGO ACEPTABLE, SUPERIOR AL NORMAL', 'D', '4', '1', 'A'), ('128745', 'CATEGORIA C   RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('128750', 'CATEGORIA D   RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('128755', 'CATEGORIA E INCOBRABLE', 'D', '4', '1', 'A'), ('128795', 'OTRAS PROVISIONES', 'D', '4', '1', 'A'), ('1288', 'PROVISION DE INVERSIONES PARA MANTENER HASTA EL VENCIMIENTO', 'D', '3', '1', 'A'), ('128805', 'LARGO PLAZO BB+, BB, BB-', 'D', '4', '1', 'A'), ('128810', 'LARGO PLAZO B+, B, B-', 'D', '4', '1', 'A'), ('128815', 'LARGO PLAZO CCC', 'D', '4', '1', 'A'), ('128820', 'LARGO PLAZO DD, EE', 'D', '4', '1', 'A'), ('128825', 'CORTO PLAZO 3', 'D', '4', '1', 'A'), ('128830', 'CORTO PLAZO 4', 'D', '4', '1', 'A'), ('128835', 'CORTO PLAZO 5, 6', 'D', '4', '1', 'A'), ('128840', 'CATEGORIA B   RIESGO ACEPTABLE, SUPERIOR AL NORMAL', 'D', '4', '1', 'A'), ('128845', 'CATEGORIA C   RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('128850', 'CATEGORIA D   RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('128855', 'CATEGORIA E   INCOBRABLE', 'D', '4', '1', 'A'), ('128895', 'OTRAS PROVISIONES', 'D', '4', '1', 'A'), ('1289', 'PROVISION DE INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS DE DEUDA', 'D', '3', '1', 'A'), ('128905', 'LARGO PLAZO BB+, BB, BB-', 'D', '4', '1', 'A'), ('128910', 'LARGO PLAZO B+, B, B-', 'D', '4', '1', 'A'), ('128915', 'LARGO PLAZO CCC', 'D', '4', '1', 'A'), ('128920', 'LARGO PLAZO DD, EE', 'D', '4', '1', 'A'), ('128925', 'CORTO PLAZO 3', 'D', '4', '1', 'A'), ('128930', 'CORTO PLAZO 4', 'D', '4', '1', 'A'), ('128935', 'CORTO PLAZO 5, 6', 'D', '4', '1', 'A'), ('128940', 'CATEGORIA B   RIESGO ACEPTABLE, SUPERIOR AL NORMAL', 'D', '4', '1', 'A'), ('128945', 'CATEGORIA C   RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('128950', 'CATEGORIA D   RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('128955', 'CATEGORIA E   INCOBRABLE', 'D', '4', '1', 'A'), ('128995', 'OTRAS PROVISIONES', 'D', '4', '1', 'A'), ('1291', 'PROVISION DE INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A'), ('129105', 'LARGO PLAZO BB+, BB, BB-', 'D', '4', '1', 'A'), ('129110', 'LARGO PLAZO B+, B, B-', 'D', '4', '1', 'A'), ('129115', 'LARGO PLAZO CCC', 'D', '4', '1', 'A'), ('129120', 'LARGO PLAZO DD, EE', 'D', '4', '1', 'A'), ('129140', 'CATEGORIA B   RIESGO ACEPTABLE, SUPERIOR AL NORMAL', 'D', '4', '1', 'A'), ('129145', 'CATEGORIA C   RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('129150', 'CATEGORIA D   RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('129155', 'CATEGORIA E   INCOBRABLE', 'D', '4', '1', 'A'), ('129195', 'OTRAS PROVISIONES', 'D', '4', '1', 'A'), ('13', 'INVENTARIOS', 'D', '2', '1', 'A'), ('1305', 'BIENES NO TRANSFORMADOS POR LA ENTIDAD', 'D', '3', '1', 'A'), ('1310', 'MATERIAS  PRIMAS', 'D', '3', '1', 'A'), ('1315', 'PRODUCTOS EN PROCESO', 'D', '3', '1', 'A'), ('1320', 'PRODUCTOS TERMINADOS', 'D', '3', '1', 'A'), ('1325', 'MATERIALES Y SUMINISTROS', 'D', '3', '1', 'A'), ('1330', 'SEMOVIENTES', 'D', '3', '1', 'A'), ('1335', 'INVENTARIO EN TRANSITO', 'D', '3', '1', 'A'), ('1340', 'CONTRATOS EN  EJECUCION', 'D', '3', '1', 'A'), ('1345', 'CULTIVOS EN DESARROLLO', 'D', '3', '1', 'A'), ('1350', 'PLANTACIONES AGRICOLAS', 'D', '3', '1', 'A'), ('1355', 'BIENES RAICES PARA  LA VENTA', 'D', '3', '1', 'A'), ('1360', 'ENVASES Y EMPAQUES', 'D', '3', '1', 'A'), ('1365', 'OBRAS DE CONSTRUCCIÓN EN CURSO', 'D', '3', '1', 'A'), ('1380', 'INVENTARIOS EN CONSIGNACION', 'D', '3', '1', 'A'), ('1385', 'MAUSOLEOS', 'D', '3', '1', 'A'), ('1390', 'PROVISION', 'D', '3', '1', 'A'), ('139005', 'POR OBSOLESCENCIA', 'D', '4', '1', 'A'), ('139010', 'POR DIFERENCIA DE INVENTARIO FISICO', 'D', '4', '1', 'A'), ('139015', 'POR PÉRDIDA DE BIENES', 'D', '4', '1', 'A'), ('139085', 'POR OTROS CONCEPTOS', 'D', '4', '1', 'A'), ('14', 'CARTERA DE CREDITOS', 'D', '2', '1', 'A'), ('1404', 'CREDITOS DE VIVIENDA   CON LIBRANZA', 'D', '3', '1', 'A'), ('140405', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('140410', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('140415', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('140420', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('140425', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1405', 'CREDITOS DE VIVIENDA   SIN LIBRANZA', 'D', '3', '1', 'A'), ('140505', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('140510', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('140515', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('140520', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('140525', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1411', 'CREDITOS DE CONSUMO, GARANTIA ADMISIBLE    CON LIBRANZA', 'D', '3', '1', 'A'), ('141105', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '0', 'A'), ('14110501', 'CREDITO LIBRANZA', 'D', '5', '0', 'A'), ('141110', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('141115', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('141120', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('141125', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1412', 'CREDITOS DE CONSUMO, GARANTIA ADMISIBLE, - SIN LIBRANZA', 'D', '3', '1', 'A'), ('141205', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('141210', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('141215', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('141220', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('141225', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1441', 'CREDITOS DE CONSUMO, OTRAS GARANTIAS    CON  LIBRANZA', 'D', '3', '0', 'A'), ('144105', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '0', 'A'), ('14410501', 'CATEGORIA A RIESGO NORMAL', 'D', '5', '1', 'A'), ('144110', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '0', 'A'), ('14411001', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '5', '1', 'A'), ('144115', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '0', 'A'), ('14411501', 'CATEGORIA C RIESGO APRECIABLE', 'D', '5', '1', 'A'), ('144120', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '0', 'A'), ('14412001', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '5', '1', 'A'), ('144125', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '0', 'A'), ('14412501', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '5', '1', 'A'), ('1442', 'CREDITOS DE CONSUMO, OTRAS GARTANTÍAS   SIN LIBRANZA', 'D', '3', '1', 'A'), ('144205', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('144210', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('144215', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('144220', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('144225', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1454', 'MICROCREDITOS INMOBILIARIO - CON LIBRANZA', 'D', '3', '1', 'A'), ('145405', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('145410', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('145415', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('145420', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('145425', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1455', 'MICROCREDITOS INMOBILIARIO - SIN LIBRANZA', 'D', '3', '1', 'A'), ('145505', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('145510', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('145515', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('145520', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('145525', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1456', 'MICROCREDITOS, EMPRESARIAL - GARANTIA ADMISIBLE - CON LIBRANZA', 'D', '3', '1', 'A'), ('145605', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('145610', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('145615', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('145620', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('145625', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1457', 'MICROCREDITOS EMPRESARIAL -  GARANTIA ADMISIBLE   SIN LIBRANZA', 'D', '3', '1', 'A'), ('145705', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('145710', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('145715', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('145720', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('145725', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1458', 'MICROCREDITOS EMPRESARIAL- OTRAS GARANTIAS   CON LIBRANZA', 'D', '3', '1', 'A'), ('145805', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('145810', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('145815', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('145820', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('145825', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1459', 'MICROCREDITOS EMPRESARIAL- OTRAS GARANTIAS   SIN LIBRANZA', 'D', '3', '1', 'A'), ('145905', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('145910', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('145915', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('145920', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('145925', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1460', 'CREDITOS COMERCIALES, GARANTIA ADMISIBLE -  CON LIBRANZA', 'D', '3', '1', 'A'), ('146005', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('146010', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('146015', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('146020', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('146025', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1462', 'CREDITOS COMERCIALES,  GARANTIA ADMISIBLE -  SIN LIBRANZA', 'D', '3', '1', 'A'), ('146205', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('146210', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('146215', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('146220', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('146225', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1463', 'CREDITOS COMERCIALES, OTRAS GARANTIAS - CON LIBRANZA', 'D', '3', '1', 'A'), ('146315', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('146320', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('146325', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('146330', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('146335', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1465', 'CREDITOS COMERCIALES, OTRAS GARANTIAS   SIN LIBRANZA', 'D', '3', '1', 'A'), ('146515', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('146520', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('146525', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('146530', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('146535', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1488', 'DERECHOS DE RECOMPRA CARTERA NEGOCIADA', 'D', '3', '1', 'A'), ('148820', 'CREDITOS DE VIVIENDA', 'D', '4', '1', 'A'), ('148825', 'CREDITOS DE CONSUMO', 'D', '4', '1', 'A'), ('148830', 'MICROCREDITOS', 'D', '4', '1', 'A'), ('148835', 'CREDITOS COMERCIALES', 'D', '4', '1', 'A'), ('1489', 'PROVISION CREDITOS DE VIVIENDA', 'D', '3', '1', 'A'), ('148905', 'CATEGORIA A - CREDITO NORMAL, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('148910', 'CATEGORIA B - CREDITO ACEPTABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('148915', 'CATEGORIA C ? CREDITO APRECIABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('148920', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('148925', 'CATEGORIA E ? CREDITO IRRECUPERABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('1491', 'PROVISION CREDITOS DE CONSUMO', 'D', '3', '1', 'A'), ('149105', 'CATEGORIA A - CREDITO NORMAL, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149107', 'CATEGORIA A - CREDITO NORMAL, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149110', 'CATEGORIA B - CREDITO ACEPTABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149112', 'CATEGORIA B - CREDITO ACEPTABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('14911201', 'CATEGORIA B', 'C', '5', '0', 'A'), ('149115', 'CATEGORIA C ? CREDITO APRECIABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('14911501', 'CATEGORIA C CREDITO APRECIABLE', 'D', '5', '0', 'A'), ('149117', 'CATEGORIA C ? CREDITO APRECIABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('14911701', 'CATEGORIA C', 'C', '5', '0', 'A'), ('149120', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149122', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('14912201', 'CATEGORIA D CREDITO SIGNIFICATIVO', 'D', '5', '0', 'A'), ('149125', 'CATEGORIA E ? CREDITO IRRECUPERABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149127', 'CATEGORIA E ? CREDITO IRRECUPERABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('14912701', 'CATEGORIA E CREDITO IRRECUPERABLE', 'D', '5', '0', 'A'), ('1492', 'PROVISION MICROCREDITO INMOBILIARIO', 'D', '3', '1', 'A'), ('149205', 'CATEGORIA A - CREDITO NORMAL, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149207', 'CATEGORIA A - CREDITO NORMAL, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149210', 'CATEGORIA B - CREDITO ACEPTABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149212', 'CATEGORIA B - CREDITO ACEPTABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149215', 'CATEGORIA C ? CREDITO APRECIABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149217', 'CATEGORIA C ? CREDITO APRECIABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149220', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149222', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149225', 'CATEGORIA E ? CREDITO IRRECUPERABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149227', 'CATEGORIA E ? CREDITO IRRECUPERABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('1493', 'PROVISION MICROCREDITO EMPRESARIAL', 'D', '3', '1', 'A'), ('149305', 'CATEGORIA A - CREDITO NORMAL, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149307', 'CATEGORIA A - CREDITO NORMAL, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149310', 'CATEGORIA B - CREDITO ACEPTABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149312', 'CATEGORIA B - CREDITO ACEPTABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149315', 'CATEGORIA C ? CREDITO APRECIABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149317', 'CATEGORIA C ? CREDITO APRECIABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149320', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149322', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149325', 'CATEGORIA E ? CREDITO IRRECUPERABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149327', 'CATEGORIA E ? CREDITO IRRECUPERABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('1495', 'PROVISION CREDITOS COMERCIALES', 'D', '3', '1', 'A'), ('149505', 'CATEGORIA A - CREDITO NORMAL, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149507', 'CATEGORIA A - CREDITO NORMAL, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149510', 'CATEGORIA B - CREDITO ACEPTABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149512', 'CATEGORIA B - CREDITO ACEPTABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149515', 'CATEGORIA C ? CREDITO APRECIABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149517', 'CATEGORIA C ? CREDITO APRECIABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149520', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149522', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('149525', 'CATEGORIA E ? CREDITO IRRECUPERABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A'), ('149527', 'CATEGORIA E ? CREDITO IRRECUPERABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A'), ('1498', 'PROVISION GENERAL', 'D', '3', '1', 'A'), ('149805', 'PROVISION CREDITOS CON LIBRANZA', 'D', '4', '1', 'A'), ('14980501', 'PROVISION CREDITOS CON LIBRANZA', 'C', '5', '0', 'A'), ('149810', 'PROVISION CREDITOS SIN LIBRANZA', 'D', '4', '1', 'A'), ('16', 'CUENTAS POR COBRAR', 'D', '2', '1', 'A'), ('1605', 'CONVENIOS POR COBRAR', 'D', '3', '1', 'A'), ('160505', 'SERVICIOS MEDICOS Y HOSPITALARIOS', 'D', '4', '1', 'A'), ('160510', 'SERVICIOS ODONTOLÓGICOS', 'D', '4', '1', 'A'), ('160515', 'MEDICINA PREPAGADA', 'D', '4', '1', 'A'), ('160520', 'SERVICIOS FUNERARIOS', 'D', '4', '1', 'A'), ('160525', 'SEGURO VOLUNTARIO   VEHÍCULO', 'D', '4', '1', 'A'), ('160530', 'SEGURO OBLIGATORIO   SOAT', 'D', '4', '1', 'A'), ('160535', 'OTROS SERVICIOS', 'D', '4', '1', 'A'), ('160595', 'OTROS CONVENIOS', 'D', '4', '1', 'A'), ('16059501', 'OTROS CONVENIOS', 'D', '5', '0', 'A'), ('16059502', 'CONVENIOS AUTORIZACIONES', 'D', '5', '0', 'A'), ('16059503', 'CUENTAS POR COBRAR CONVENIOS', 'D', '5', '0', 'A'), ('16059504', 'DESARROLLAR CTA', 'D', '5', '0', 'A'), ('16059505', 'COOPERATIVA BUEN FUTURO', 'D', '5', '0', 'A'), ('16059506', 'CUOTAS A DEVOLVER A PAGADURIAS', 'D', '5', '0', 'A'), ('1620', 'PROMETIENTES VENDEDORES', 'D', '3', '1', 'A'), ('162005', 'BIENES INMUEBLES', 'D', '4', '1', 'A'), ('162010', 'BIENES MUEBLES', 'D', '4', '1', 'A'), ('1625', 'ANTICIPOS DE CONTRATOS Y PROVEEDORES', 'D', '3', '1', 'A'), ('162505', 'ANTICIPOS DE CONTRATOS', 'D', '4', '1', 'A'), ('16250501', 'ANTICIPOS DE CONTRATOS', 'D', '5', '0', 'A'), ('162510', 'PROVEEDORES', 'D', '4', '1', 'A'), ('16251001', 'PROVEEDORES                                                                      ', 'D', '5', '0', 'A'), ('162595', 'OTROS ANTICIPOS', 'D', '4', '1', 'A'), ('16259501', 'ANTICIPOS GESTORES DE VENTAS', 'D', '5', '0', 'A'), ('16259502', 'OTROS ANTICIPOS', 'D', '5', '0', 'A'), ('16259503', 'OTROS ANTICIPOS-GESTORES', 'D', '5', '0', 'A'), ('1635', 'ADELANTOS AL PERSONAL', 'D', '3', '1', 'A'), ('163505', 'ANTICIPOS LABORALES', 'D', '4', '1', 'A'), ('16350501', 'ANTICIPOS LABORALES', 'D', '5', '0', 'A'), ('163510', 'GASTOS DE VIAJE', 'D', '4', '1', 'A'), ('163595', 'OTROS', 'D', '4', '1', 'A'), ('1636', 'PAGOS POR CUENTA DE  ASOCIADOS, VIVIENDA', 'D', '3', '1', 'A'), ('163605', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('163610', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('163615', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('163620', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('163625', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1637', 'PAGOS POR CUENTA DE ASOCIADOS, CONSUMO', 'D', '3', '1', 'A'), ('163705', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('16370501', 'CATEGORIA A RIESGO NORMAL - POLIZAS JUDICIALES', 'D', '5', '0', 'A'), ('163710', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('16371001', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '5', '0', 'A'), ('163715', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('163720', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('163725', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1638', 'PAGOS POR CUENTA DE ASOCIADOS, MICROCREDITO', 'D', '3', '1', 'A'), ('163805', 'CATEGORIA A RIESGO NORMAL - INMOBILIARIO', 'D', '4', '1', 'A'), ('163810', 'CATEGORIA B RIESGO ACEPTABLE   INMOBILIARIO', 'D', '4', '1', 'A'), ('163815', 'CATEGORIA C RIESGO APRECIABLE - INMOILIARIO', 'D', '4', '1', 'A'), ('163820', 'CATEGORIA D RIESGO SIGNIFICATIVO - INMOBILIARIO', 'D', '4', '1', 'A'), ('163825', 'CATEGORIA E RIESGO DE INCOBRABILIDAD - INMOBILIARIO', 'D', '4', '1', 'A'), ('163830', 'CATEGORIA A RIESGO NORMAL - EMPRESARIAL', 'D', '4', '1', 'A'), ('163835', 'CATEGORIA B RIESGO ACEPTABLE - EMPRESARIAL', 'D', '4', '1', 'A'), ('163840', 'CATEGORIA C RIESGO APRECIABLE - EMPRESARIAL', 'D', '4', '1', 'A'), ('163845', 'CATEGORIA D RIESGO SIGNIFICATIVO - EMPRESARIAL', 'D', '4', '1', 'A'), ('163850', 'CATEGORIA E RIESGO DE INCOBRABILIDAD - EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1639', 'PAGOS POR CUENTA DE ASOCIADOS COMERCIAL', 'D', '3', '1', 'A'), ('163905', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A'), ('163910', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A'), ('163915', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A'), ('163920', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A'), ('163925', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A'), ('1640', 'CREDITOS A EMPLEADOS', 'D', '3', '1', 'A'), ('164020', 'CATEGORIA A RIESGO NORMAL, VIVIENDA', 'D', '4', '1', 'A'), ('164022', 'CATEGORIA B RIESGO ACEPTABLE, VIVIENDA', 'D', '4', '1', 'A'), ('164024', 'CATEGORIA C RIESGO APRECIABLE, VIVIENDA', 'D', '4', '1', 'A'), ('164026', 'CATEGORIA D RIESGO SIGNIFICATIVO, VIVIENDA', 'D', '4', '1', 'A'), ('164028', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, VIVIENDA', 'D', '4', '1', 'A'), ('164030', 'CATEGORIA A RIESGO NORMAL, CONSUMO', 'D', '4', '1', 'A'), ('16403001', 'CALAMIDAD DOMESTICA', 'D', '5', '0', 'A'), ('164032', 'CATEGORIA B RIESGO ACEPTABLE, CONSUMO', 'D', '4', '1', 'A'), ('164034', 'CATEGORIA C RIESGO APRECIABLE, CONSUMO', 'D', '4', '1', 'A'), ('164036', 'CATEGORIA D RIESGO SIGNIFICATIVO, CONSUMO', 'D', '4', '1', 'A'), ('164038', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, CONSUMO', 'D', '4', '1', 'A'), ('164095', 'OTROS', 'D', '4', '1', 'A'), ('1645', 'DEUDORES POR VENTA DE BIENES', 'D', '3', '1', 'A'), ('164502', 'VIGENTES', 'D', '4', '1', 'A'), ('164505', 'VENCIDA ENTRE 91 Y 180 DIAS', 'D', '4', '1', 'A'), ('164510', 'VENCIDA ENTRE 181 Y 360 DIAS', 'D', '4', '1', 'A'), ('164515', 'VENCIDA MAS DE 360 DIAS', 'D', '4', '1', 'A'), ('1648', 'DEUDORES POR PRESTACION DE SERVICIOS', 'D', '3', '1', 'A'), ('164802', 'VIGENTES', 'D', '4', '1', 'A'), ('164805', 'VENCIDA ENTRE 91 Y 180 DIAS', 'D', '4', '1', 'A'), ('164810', 'VENCIDA ENTRE 181 Y 360 DIAS', 'D', '4', '1', 'A'), ('164815', 'VENCIDA MAS DE 360 DÍAS', 'D', '4', '1', 'A'), ('1650', 'DEUDORES PATRONALES Y EMPRESAS', 'D', '3', '1', 'A'), ('165005', 'DESCUENTO DE NOMINA', 'D', '4', '1', 'A'), ('16500501', 'COOPERATIVA BUEN FUTURO', 'D', '5', '0', 'A'), ('165010', 'LIQUIDACIONES PRESTACIONALES', 'D', '4', '1', 'A'), ('165015', 'LIBRANZAS', 'D', '4', '1', 'A'), ('16501501', 'PAGADURIAS', 'D', '5', '0', 'A'), ('165020', 'APORTES Y CONTRIBUCIÓN EMPRESA', 'D', '4', '1', 'A'), ('165095', 'OTROS', 'D', '4', '1', 'A'), ('1655', 'INTERESES', 'D', '3', '1', 'A'), ('165505', 'PACTOS DE REVENTA', 'D', '4', '1', 'A'), ('165506', 'CATEGORIA A RIESGO NORMAL, VIVIENDA', 'D', '4', '1', 'A'), ('165508', 'CATEGORIA B RIESGO ACEPTABLE, VIVIENDA', 'D', '4', '1', 'A'), ('165512', 'CATEGORIA C RIESGO APRECIABLE, VIVIENDA', 'D', '4', '1', 'A'), ('165514', 'CATEGORIA D RIESGO SIGNIFICATIVO, VIVIENDA', 'D', '4', '1', 'A'), ('165516', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, VIVIENDA', 'D', '4', '1', 'A'), ('165518', 'CATEGORIA A RIESGO NORMAL, CONSUMO', 'D', '4', '1', 'A'), ('16551801', 'INTERESES CATEGORIA A RIESGO NORMAL, CONSUMO', 'D', '5', '1', 'A'), ('16551802', 'INTERESES CATEGORIA A RIESGO NORMAL, CONSUMO', 'D', '5', '1', 'A'), ('165522', 'CATEGORIA B RIESGO ACEPTABLE, CONSUMO', 'D', '4', '1', 'A'), ('16552201', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '5', '1', 'A'), ('16552202', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '5', '1', 'A'), ('165524', 'CATEGORIA C RIESGO APRECIABLE, CONSUMO', 'D', '4', '1', 'A'), ('16552401', 'CATEGORIA C RIESGO APRECIABLE', 'D', '5', '1', 'A'), ('165526', 'CATEGORIA D RIESGO SIGNIFICATIVO, CONSUMO', 'D', '4', '1', 'A'), ('16552601', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '5', '1', 'A'), ('165528', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, CONSUMO', 'D', '4', '1', 'A'), ('16552801', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '5', '1', 'A'), ('165532', 'CATEGORIA A RIESGO NORMAL, MICROCREDITO', 'D', '4', '1', 'A'), ('165534', 'CATEGORIA B RIESGO ACEPTABLE, MICROCREDITO', 'D', '4', '1', 'A'), ('165536', 'CATEGORIA C RIESGO APRECIABLE, MICROCREDITO', 'D', '4', '1', 'A'), ('165538', 'CATEGORIA D RIESGO SIGNIFICATIVO, MICROCREDITO', 'D', '4', '1', 'A'), ('165540', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, MICROCREDITO', 'D', '4', '1', 'A'), ('165542', 'CATEGORIA A RIESGO NORMAL, COMERCIAL', 'D', '4', '1', 'A'), ('165544', 'CATEGORIA B RIESGO ACEPTABLE, COMERCIAL', 'D', '4', '1', 'A'), ('165546', 'CATEGORIA C RIESGO APRECIABLE, COMERCIAL', 'D', '4', '1', 'A'), ('165548', 'CATEGORIA D RIESGO SIGNIFICATIVO, COMERCIAL', 'D', '4', '1', 'A'), ('165549', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, COMERCIAL', 'D', '4', '1', 'A'), ('165560', 'CATEGORIA A RIESGO NORMAL, MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A'), ('165561', 'CATEGORIA B RIESGO ACEPTABLE, MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A'), ('165563', 'CATEGORIA C RIESGO APRECIABLE, MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A'), ('165564', 'CATEGORIA D RIESGO SIGNIFICATIVO, MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A'), ('165565', 'CATEGORIA E RIESGO DE INCOBRABILIDFAD, MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A'), ('165595', 'OTROS', 'D', '4', '1', 'A'), ('1657', 'INTERESES DEUDORES POR VENTA DE BIENES', 'D', '3', '1', 'A'), ('165701', 'INTERESES VIGENTES', 'D', '4', '1', 'A'), ('165702', 'VENCIDOS ENTRE 91 Y 180 DIAS', 'D', '4', '1', 'A'), ('165704', 'VENCIDOS ENTRE 181 Y 360 DIAS', 'D', '4', '1', 'A'), ('165709', 'VENCIDOS MAS DE  360 DIAS', 'D', '4', '1', 'A'), ('1658', 'INTERESES DEUDORES POR PRESTACIÓN DE SERVICIOS', 'D', '3', '1', 'A'), ('165801', 'INTERESES VIGENTES', 'D', '4', '1', 'A'), ('165802', 'VENCIDOS ENTRE 91 Y 180 DIAS', 'D', '4', '1', 'A'), ('165804', 'VENCIDOS ENTRE 181 Y 360 DIAS', 'D', '4', '1', 'A'), ('165809', 'VENCIDOS MAS DE 360 DÍAS', 'D', '4', '1', 'A'), ('1660', 'INGRESOS  POR COBRAR', 'D', '3', '1', 'A'), ('166015', 'ARRENDAMIENTOS', 'D', '4', '1', 'A'), ('166020', 'HONORARIOS', 'D', '4', '1', 'A'), ('166025', 'COMISIONES', 'D', '4', '1', 'A'), ('166030', 'SERVICIOS VARIOS', 'D', '4', '1', 'A'), ('166035', 'CUOTAS DE ADMINISTRACIÓN', 'D', '4', '1', 'A'), ('166040', 'CUOTAS DE SOSTENIMIENTO', 'D', '4', '1', 'A'), ('166045', 'RODAMIENTO', 'D', '4', '1', 'A'), ('166095', 'OTRAS', 'D', '4', '1', 'A'), ('16609501', 'DACION EN PAGO', 'D', '5', '0', 'A'), ('1665', 'DIVIDENDOS, PARTICIPACIONES Y EXCEDENTES', 'D', '3', '1', 'A'), ('166505', 'DE SOCIEDADES ANÓNIMAS Y/O ASIMILADAS', 'D', '4', '1', 'A'), ('166510', 'DE SOCIEDADES LIMITADAS Y/O ASIMILADAS', 'D', '4', '1', 'A'), ('166515', 'DE ENTIDADES COOPERATIVAS', 'D', '4', '1', 'A'), ('1675', 'ANTICIPO DE IMPUESTOS', 'D', '3', '1', 'A'), ('167505', 'RENTA Y COMPLEMENTARIOS', 'D', '4', '1', 'A'), ('167510', 'INDUSTRIA Y COMERCIO', 'D', '4', '1', 'A'), ('16751001', 'INDUSTRIA Y COMERCIO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16751003', 'INDUSTRIA Y COMERCIO CARTAGENA', 'D', '5', '0', 'A'), ('16751004', 'INDUSTRIA Y COMERCIO SINCELEJO', 'D', '5', '0', 'A'), ('16751005', 'INDUSTRIA Y COMERCIO MONTERIA', 'D', '5', '0', 'A'), ('167515', 'RETENC ION EN LA FUENTE', 'D', '4', '1', 'A'), ('16751501', 'RETENCION RENDIMIENTOS FINANCIEROS', 'D', '5', '0', 'A'), ('167520', 'IMPUESTO A LAS VENTAS RETENIDO', 'D', '4', '1', 'A'), ('167530', 'IMPUESTO  DE INDUSTRIA Y COMERCIO RETENIDO', 'D', '4', '1', 'A'), ('167535', 'SOBRANTES EN LIQUIDACIÓN PRIVADA DE IMPUESTOS', 'D', '4', '1', 'A'), ('167540', 'CONTRIBUCIONES', 'D', '4', '1', 'A'), ('167545', 'IMPUESTOS DESCONTABLES', 'D', '4', '1', 'A'), ('167595', 'OTROS IMPUESTOS', 'D', '4', '1', 'A'), ('1690', 'OTRAS CUENTAS POR COBRAR', 'D', '3', '1', 'A'), ('169005', 'CUOTAS - PARTES PENSIONES DE JUBILACIÓN', 'D', '4', '1', 'A'), ('169010', 'RECLAMOS A COMPAÑIAS ASEGURADORAS', 'D', '4', '1', 'A'), ('16901001', 'SEGUROS DEL ESTADO', 'D', '5', '0', 'A'), ('169020', 'COSTOS JUDICIALES', 'D', '4', '1', 'A'), ('16902001', 'POLIZAS JUDICIALES', 'D', '5', '0', 'A'), ('16902002', 'ARANCELES JUDICIALES', 'D', '5', '0', 'A'), ('16902003', 'CURADOR - HONORARIOS PROCESOS JURIDICOS A ASOCIADOS', 'D', '5', '0', 'A'), ('16902005', 'EMBARGOS', 'D', '5', '0', 'A'), ('169025', 'CUENTAS POR COBRAR  DE TERCEROS', 'D', '4', '1', 'A'), ('16902501', 'CUENTAS POR COBRAR                                                                                  ', 'D', '5', '0', 'A'), ('16902502', 'CUENTAS POR COBRAR ASOCIADOS - SEGURO', 'D', '5', '0', 'A'), ('169030', 'COMISIONISTAS DE BOLSA', 'D', '4', '1', 'A'), ('169035', 'FONDO DE INVERSIÓN SOCIAL', 'D', '4', '1', 'A'), ('169040', 'DEPOSITOS', 'D', '4', '1', 'A'), ('16904001', 'APORTES SOCIALES CONFECOOP', 'D', '5', '0', 'A'), ('169045', 'TARJETAS DE CREDITO', 'D', '4', '1', 'A'), ('169095', 'OTRAS', 'D', '4', '1', 'A'), ('16909501', 'CUENTAS POR COBRAR A OTRAS ENTIDADES', 'D', '5', '0', 'A'), ('16909503', 'CUENTAS POR COBRAR EPS', 'D', '5', '0', 'A'), ('1691', 'PROVISION  DEUDORES VENTA DE BIENES Y SERVICIOS', 'D', '3', '1', 'A'), ('169106', 'DEUDORES POR VENTA DE BIENES', 'D', '4', '1', 'A'), ('169108', 'DEUDORES POR PRESTACIÓN DE SERVICIOS', 'D', '4', '1', 'A'), ('169112', 'INTERESES DEUDORES POR VENTA DE BIENES', 'D', '4', '1', 'A'), ('169116', 'INTERESES DEUDORES POR PRESTACIÓN DE SERVICIOS', 'D', '4', '1', 'A'), ('1692', 'PROVISION CUENTAS POR COBRAR, MICROCRÉDITO EMPRESARIAL', 'D', '3', '1', 'A'), ('169205', 'CATEGORIA A  CREDITO NORMAL   INTERESES MICROCREDITO EMPRESARIAL', 'D', '4', '1', 'A'), ('169210', 'CATEGORIA B - CREDITO ACEPTABLE   INTERESES MICROCREDITO EMPRESARIAL', 'D', '4', '1', 'A'), ('169215', 'CATEGORIA C ? CREDITO APRECIABLE   INTERESES MICROCREDITO EMPRESARIAL', 'D', '4', '1', 'A'), ('169220', 'CATEGORIA D ? CREDITO SIGNIFICATIVO   INTERESES MICROCREDITO EMPRESARIAL', 'D', '4', '1', 'A'), ('169225', 'CATEGORIA E ? CREDITO IRRECUPERABLE   INTERESES MICROCREDITO EMPRESARIAL', 'D', '4', '1', 'A'), ('169230', 'CATEGORIA A   CREDITO NORMAL, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169235', 'CATEGORIA B - CREDITO ACEPTABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169240', 'CATEGORIA C ? CREDITO APRECIABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169245', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169250', 'CATEGORIA E   CREDITO IRRECUPERABLE, POR CCUANTA DE ASOCADOS', 'D', '4', '1', 'A'), ('1693', 'PROVISION CUENTAS POR COBRAR   MICROCREDITO INMOBILIARIO', 'D', '3', '1', 'A'), ('169305', 'CATEGORIA A  CREDITO NORMAL   INTERESES MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A'), ('169310', 'CATEGORIA B - CREDITO ACEPTABLE   INTERESES MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A'), ('169315', 'CATEGORIA C ? CREDITO APRECIABLE   INTERESES MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A'), ('169320', 'CATEGORIA D ? CREDITO SIGNIFICATIVO   INTERESES MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A'), ('169325', 'CATEGORIA E ? CREDITO IRRECUPERABLE   INTERESES MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A'), ('169330', 'CATEGORIA A   CREDITO NORMAL, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169335', 'CATEGORIA B - CREDITO ACEPTABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169340', 'CATEGORIA C ? CREDITO APRECIABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169345', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169350', 'CATEGOIRA E   CREDITOS IRRECUPERABLES, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('1694', 'PROVISION CUENTAS POR COBRAR COMERCIALES', 'D', '3', '1', 'A'), ('169452', 'CATEGORIA A   CREDITO NORMAL, INTERESES', 'D', '4', '1', 'A'), ('169453', 'CATEGORIA B - CREDITO ACEPTABLE, INTERESES', 'D', '4', '1', 'A'), ('169454', 'CATEGORIA C ? CREDITO APRECIABLE, INTERESES', 'D', '4', '1', 'A'), ('169456', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, INTERESES', 'D', '4', '1', 'A'), ('169457', 'CATEGORIA E ? CREDITO IRRECUPERABLE, INTERESES', 'D', '4', '1', 'A'), ('169462', 'CATEGORIA A   CREDITO NORMAL, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169463', 'CATEGORIA B - CREDITO ACEPTABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169464', 'CATEGORIA C ? CREDITO APRECIABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169466', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169468', 'CATEGORIA E   CREDITO IRRECUPERABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169495', 'OTRAS', 'D', '4', '1', 'A'), ('1696', 'PROVISION CUENTAS POR COBRAR DE CONSUMO', 'D', '3', '1', 'A'), ('169652', 'CATEGORIA A   CREDITO NORMAL, INTERESES', 'D', '4', '1', 'A'), ('169653', 'CATEGORIA B   CREDITO ACEPTABLE, INTERESES', 'D', '4', '1', 'A'), ('16965301', 'CATEGORIA B', 'C', '5', '0', 'A'), ('169654', 'CATEGORIA C ? CREDITO APRECIABLE, INTERESES', 'D', '4', '1', 'A'), ('16965401', 'CATEGORIA C', 'C', '5', '0', 'A'), ('169656', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, INTERESES', 'D', '4', '1', 'A'), ('16965601', 'CATEGORIA D CREDITO SIGNIFICATIVO', 'D', '5', '0', 'A'), ('169657', 'CATEGORIA E ? CREDITO IRRECUPERABLE, INTERESES', 'D', '4', '1', 'A'), ('16965701', 'CATEGORIA E CREDITO IRRECUPERABLE', 'D', '5', '0', 'A'), ('169662', 'CATEGORIA A   CREDITONORMAL, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169663', 'CATEGORIA B   CREDITO ACEPTABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169664', 'CATEGORIA C ? CREDITO APRECIABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169666', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169667', 'CATEGORIA E ? CREDITO IRRECUPERABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169695', 'OTRAS', 'D', '4', '1', 'A'), ('1697', 'PROVISION CUENTAS POR COBRAR DE VIVIENDA', 'D', '3', '1', 'A'), ('169752', 'CATEGORIA A   CREDITO NORMAL, INTERESES', 'D', '4', '1', 'A'), ('169753', 'CATEGORIA B - CREDITO ACEPTABLE, INTERESES', 'D', '4', '1', 'A'), ('169754', 'CATEGORIA C ? CREDITO APRECIABLE, INTERESES', 'D', '4', '1', 'A'), ('169756', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, INTERESES', 'D', '4', '1', 'A'), ('169757', 'CATEGORIA E ? CREDITO IRRECUPERABLE, INTERESES', 'D', '4', '1', 'A'), ('169762', 'CATEGORIA A   CREDITO NORMAL, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169763', 'CATEGORIA B - CREDITO ACEPTABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169764', 'CATEGORIA C ? CREDITO APRECIABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169765', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('169766', 'CATEGORIA E ? CREDITO IRRECUPERABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A'), ('1698', 'OTRAS PROVISIONES CUENTAS POR COBRAR', 'D', '3', '1', 'A'), ('169805', 'CONVENIOS POR COBRAR', 'D', '4', '1', 'A'), ('16980501', 'CONVENIOS POR COBRAR', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169810', 'DIVIDENDOS, PARTICIPACIONES Y EXCEDENTES', 'D', '4', '1', 'A'), ('169815', 'ANTICIPOS DE CONTRATOS Y PROVEEDORES', 'D', '4', '1', 'A'), ('169820', 'ADELANTOS AL PERSONAL', 'D', '4', '1', 'A'), ('169830', 'DEUDORES PATRONALES Y EMPRESA', 'D', '4', '1', 'A'), ('16983001', 'DEUDORES PATRONALES Y EMPRESAS', 'D', '5', '0', 'A'), ('169840', 'PROMETIENTES VENDEDORES', 'D', '4', '1', 'A'), ('169845', 'CREDITOS A EMPLEADOS', 'D', '4', '1', 'A'), ('169855', 'INGRESOS POR COBRAR', 'D', '4', '1', 'A'), ('169895', 'DIVERSAS OTRAS', 'D', '4', '1', 'A'), ('16989501', 'DIVERSAS COSTOS JUDICIALES', 'D', '5', '0', 'A'), ('16989502', 'CUENTAS POR COBRAR EPS', 'D', '5', '0', 'A'), ('16989503', 'ARANCELES JUDICIALES', 'C', '5', '0', 'A'), ('17', 'PROPIEDADES PLANTA Y EQUIPO', 'D', '2', '1', 'A'), ('1705', 'TERRENOS', 'D', '3', '1', 'A'), ('170505', 'URBANOS', 'D', '4', '1', 'A'), ('170510', 'RURALES', 'D', '4', '1', 'A'), ('1710', 'CONSTRUCCIONES O MONTAJES  EN CURSO', 'D', '3', '1', 'A'), ('171005', 'CONSTRUCCIONES EN PROCESO', 'D', '4', '1', 'A'), ('171010', 'MAQUINARIA EN MONTAJE', 'D', '4', '1', 'A'), ('1715', 'EDIFICACIONES', 'D', '3', '1', 'A'), ('171505', 'EDIFICIOS', 'D', '4', '1', 'A'), ('171510', 'OFICINAS', 'D', '4', '1', 'A'), ('171515', 'BODEGAS', 'D', '4', '1', 'A'), ('171520', 'ALMACENES', 'D', '4', '1', 'A'), ('171525', 'INSTALACIONES AGROPECUARIAS', 'D', '4', '1', 'A'), ('171530', 'INSTALACIONES INDUSTRIALES', 'D', '4', '1', 'A'), ('171535', 'OTRAS', 'D', '4', '1', 'A'), ('1720', 'MUEBLES Y EQUIPO DE OFICINA', 'D', '3', '1', 'A'), ('172010', 'MUEBLES', 'D', '4', '1', 'A'), ('17201001', 'MUEBLES', 'D', '5', '0', 'A'), ('172015', 'EQUIPO', 'D', '4', '1', 'A'), ('17201501', 'ENFRIADOR DE AGUA', 'D', '5', '0', 'A'), ('17201502', 'EXTRACTORES DE AIRE', 'D', '5', '0', 'A'), ('17201503', 'EQUIPOS DE SEGRIDAD', 'D', '5', '0', 'A'), ('17201504', 'AIRES ACONDICIONADOS', 'D', '5', '0', 'A'), ('172020', 'OTROS EQUIPOS', 'D', '4', '0', 'A'), ('17202001', 'ENFRIADOR DE AGUA', 'D', '5', '0', 'A'), ('17202002', 'EXTRACTORES DE AIRE', 'D', '5', '0', 'A'), ('17202003', 'EQUIPOS DE SEGURIDAD', 'D', '5', '0', 'A'), ('17202004', 'AIRES ACONDICIONADOS', 'D', '5', '0', 'A'), ('1722', 'EQUIPO MEDICO - CIENTIFICO', 'D', '3', '1', 'A'), ('172205', 'MEDICO', 'D', '4', '1', 'A'), ('172210', 'ODONTOLOGICO', 'D', '4', '1', 'A'), ('172215', 'LABORATORIO', 'D', '4', '1', 'A'), ('172220', 'INSTRUMENTAL', 'D', '4', '1', 'A'), ('172295', 'OTROS', 'D', '4', '1', 'A'), ('1725', 'EQUIPO DE CÓMPUTO Y COMUNICACION', 'D', '3', '1', 'A'), ('172505', 'EQUIPOS DE CÓMPUTO', 'D', '4', '1', 'A'), ('17250501', 'EQUIPO DE COMPUTO                                                                ', 'D', '5', '0', 'A'), ('172510', 'EQUIPOS DE COMUNICACION', 'D', '4', '1', 'A'), ('17251001', 'EQUIPOS DE COMUNICACION', 'D', '5', '0', 'A'), ('172595', 'OTROS', 'D', '4', '1', 'A'), ('1728', 'EQUIPO DE HOTELES Y RESTAURANTES', 'D', '3', '1', 'A'), ('172805', 'DE HABITACIONES', 'D', '4', '1', 'A'), ('172810', 'DE COMESTIBLES', 'D', '4', '1', 'A'), ('172895', 'OTROS', 'D', '4', '1', 'A'), ('1730', 'VEHICULOS', 'D', '3', '1', 'A'), ('173005', 'AUTOS Y CAMPEROS', 'D', '4', '1', 'A'), ('173010', 'BUSES, BUSETAS, MICROBUSES Y COLECTIVOS', 'D', '4', '1', 'A'), ('173015', 'CAMIONES, TRACTOMULAS Y REMOLQUES', 'D', '4', '1', 'A'), ('173020', 'MOTOCICLETAS', 'D', '4', '1', 'A'), ('17302001', 'MOTOCICLETAS', 'D', '5', '0', 'A'), ('173025', 'MONTACARGAS', 'D', '4', '1', 'A'), ('173030', 'PALAS Y GRUAS', 'D', '4', '1', 'A'), ('173035', 'BANDAS TRANSPORTADORAS', 'D', '4', '1', 'A'), ('173040', 'FULGONES', 'D', '4', '1', 'A'), ('173095', 'OTROS', 'D', '4', '1', 'A'), ('1732', 'ENVASES Y EMPAQUES', 'D', '3', '1', 'A'), ('1735', 'ARMAMENTO DE VIGILANCIA', 'D', '3', '1', 'A'), ('1740', 'PLANTACIONES AGRÍCOLAS Y FORESTALES', 'D', '3', '1', 'A'), ('174005', 'CULTIVOS EN DESARROLLO', 'D', '4', '1', 'A'), ('174010', 'CULTIVOS AMORTIZABLES', 'D', '4', '1', 'A'), ('1745', 'MAQUINARIA Y EQUIPO', 'D', '3', '1', 'A'), ('174505', 'MAQUINARIA', 'D', '4', '1', 'A'), ('174510', 'EQUIPO', 'D', '4', '1', 'A'), ('1750', 'PROPIEDADES EN TRANSITO', 'D', '3', '1', 'A'), ('175005', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A'), ('175010', 'MUEBLES Y ENSERES DE OFICINA', 'D', '4', '1', 'A'), ('175015', 'EQUIPO DE COMPUTACIÓN Y COMUNICACIÓN', 'D', '4', '1', 'A'), ('175020', 'EQUIPOS DE LABORATORIOS Y ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A'), ('175025', 'VEHICULOS', 'D', '4', '1', 'A'), ('175030', 'ARMAMENTO DE VIGILANCIA', 'D', '4', '1', 'A'), ('175035', 'OTRAS PROPIEDADES', 'D', '4', '1', 'A'), ('1755', 'SEMOVIENTES', 'D', '3', '1', 'A'), ('175505', 'PRODUCTORES Y REPRODUCTORES', 'D', '4', '1', 'A'), ('175510', 'SEMOVIENTES EN SERVICIOS', 'D', '4', '1', 'A'), ('175595', 'OTROS', 'D', '4', '1', 'A'), ('1760', 'MAUSOLEOS', 'D', '3', '1', 'A'), ('176005', 'MAUSOLEOS', 'D', '4', '1', 'A'), ('1765', 'ELEMENTOS DIDACTICOS', 'D', '3', '1', 'A'), ('176505', 'ELEMENTOS DIDACTICOS', 'D', '4', '1', 'A'), ('176595', 'OTROS', 'D', '4', '1', 'A'), ('1770', 'BIENES DE FONDOS SOCIALES', 'D', '3', '1', 'A'), ('177005', 'BIENES MUEBLES', 'D', '4', '1', 'A'), ('177010', 'BIENES INMUEBLES', 'D', '4', '1', 'A'), ('1775', 'RECURSOS NATURALES', 'D', '3', '1', 'A'), ('177505', 'YACIMIENTOS', 'D', '4', '1', 'A'), ('177510', 'POZOS ARTESIANOS', 'D', '4', '1', 'A'), ('177515', 'MINAS Y CANTERAS', 'D', '4', '1', 'A'), ('1780', 'AMORTIZACION Y AGOTAMIENTO ACUMULADA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('178005', 'CULTIVOS', 'D', '4', '1', 'A'), ('178010', 'SEMOVIENTES', 'D', '4', '1', 'A'), ('178015', 'RECURSOS NATURALES', 'D', '4', '1', 'A'), ('1795', 'DEPRECIACION  ACUMULADA', 'D', '3', '1', 'A'), ('179505', 'EDIFICACIONES', 'D', '4', '1', 'A'), ('179510', 'MUEBLES Y EQUIPO DE OFICINA', 'D', '4', '1', 'A'), ('17951001', 'MUEBLES Y EQUIPOS DE OFICINA', 'D', '5', '0', 'A'), ('17951002', 'ENFRIADOR DE AGUA', 'D', '5', '0', 'A'), ('17951003', 'EXTRACTORES DE AIRE', 'D', '5', '0', 'A'), ('17951004', 'EQUIPOS DE SEGURIDAD', 'D', '5', '0', 'A'), ('17951005', 'AIRES ACONDICIONADOS', 'D', '5', '0', 'A'), ('179515', 'EQUIPOS DE HOTELES Y RESTAURANTES', 'D', '4', '1', 'A'), ('179520', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'D', '4', '1', 'A'), ('17952001', 'EQUIPOS DE COMPUTO', 'D', '5', '0', 'A'), ('17952002', 'EQUIPOS DE COMUNICACIONES', 'D', '5', '0', 'A'), ('179525', 'EQUIPOS MEDICOS - CIENTIFICO', 'D', '4', '1', 'A'), ('179530', 'VEHICULOS', 'D', '4', '1', 'A'), ('17953001', 'MOTOCICLETAS', 'D', '5', '0', 'A'), ('179535', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A'), ('179540', 'ARMAMENTO DE VIGILANCIA', 'D', '4', '1', 'A'), ('179545', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A'), ('179550', 'MAUSOLEOS', 'D', '4', '1', 'A'), ('179555', 'ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A'), ('179560', 'BIENES DE FONDOS SOCIALES', 'D', '4', '1', 'A'), ('179595', 'OTRAS DEPRECIACIONES', 'D', '4', '1', 'A'), ('1799', 'PROVISION', 'D', '3', '1', 'A'), ('179905', 'TERRENOS', 'D', '4', '1', 'A'), ('179910', 'EDIFICACIONES', 'D', '4', '1', 'A'), ('179915', 'VEHICULOS', 'D', '4', '1', 'A'), ('179920', 'MAUSOLEOS', 'D', '4', '1', 'A'), ('179925', 'EQUIPOS DE HOTELES Y RESTAURANTES', 'D', '4', '1', 'A'), ('179930', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A'), ('179935', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A'), ('179940', 'EQUIPOS MEDICOS - CIENTIFICO', 'D', '4', '1', 'A'), ('179945', 'CULTIVOS', 'D', '4', '1', 'A'), ('179950', 'EQUIPOS DE CÓMPUTO Y COMUNICACIÓN', 'D', '4', '1', 'A'), ('179955', 'ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A'), ('179960', 'PROVISION MUEBLES Y EQUIPOS DE OFICINA', 'D', '4', '1', 'A'), ('179965', 'RECURSOS NATURALES', 'D', '4', '1', 'A'), ('179970', 'SEMOVIENTES', 'D', '4', '1', 'A'), ('179975', 'PLANTACIONES  AGRÍCOLAS  Y  FORESTALES', 'D', '4', '1', 'A'), ('18', 'DIFERIDOS', 'D', '2', '1', 'A'), ('1810', 'GASTOS ANTICIPADOS', 'D', '3', '1', 'A'), ('181005', 'INTERESES', 'D', '4', '1', 'A'), ('181010', 'SEGUROS', 'D', '4', '1', 'A'), ('181015', 'ARRENDAMIENTOS', 'D', '4', '1', 'A'), ('181020', 'CONTRATO DE MANTENIMIENTO', 'D', '4', '1', 'A'), ('181025', 'HONORARIOS', 'D', '4', '1', 'A'), ('181030', 'COMISIONES', 'D', '4', '1', 'A'), ('181035', 'SERVICIOS', 'D', '4', '1', 'A'), ('181040', 'SUSCRIPCIONES', 'D', '4', '1', 'A'), ('181095', 'OTROS', 'D', '4', '1', 'A'), ('1820', 'CARGOS DIFERIDOS', 'D', '3', '1', 'A'), ('182005', 'ORGANIZACION Y PREOPERATIVOS', 'D', '4', '1', 'A'), ('182010', 'REMODELACION', 'D', '4', '1', 'A'), ('182015', 'ESTUDIOS Y PROYECTOS', 'D', '4', '1', 'A'), ('182020', 'PROGRAMAS PARA COMPUTADOR (SOFTWARE)', 'D', '4', '1', 'A'), ('182025', 'UTILES Y PAPELERIA', 'D', '4', '1', 'A'), ('18202501', 'UTILES Y PAPELERIA                                                                                  ', 'D', '5', '0', 'A'), ('182030', 'MEJORAS A PROPIEDADES TOMADAS EN ARRENDAMIENTO', 'D', '4', '1', 'A'), ('182035', 'DESCUENTO EN COLOCACION DE BONOS', 'D', '4', '1', 'A'), ('182040', 'PUBLICIDAD Y PROPAGANDA', 'D', '4', '1', 'A'), ('18204001', 'PUBLICIDAD Y PROPAGANDA                                                          ', 'D', '5', '0', 'A'), ('182045', 'IMPUESTOS', 'D', '4', '1', 'A'), ('18204501', 'IMPUESTO AL PATRIMONIO', 'D', '5', '0', 'A'), ('182050', 'CONTRIBUCIONES Y AFILIACIONES', 'D', '4', '1', 'A'), ('182055', 'ENTRENAMIENTOS AL PERSONAL', 'D', '4', '1', 'A'), ('182060', 'ELEMENTOS DE ASEO Y CAFETERIA', 'D', '4', '1', 'A'), ('182065', 'DOTACION Y SUMINISTRO A TRABAJADORES', 'D', '4', '1', 'A'), ('182095', 'OTROS', 'D', '4', '1', 'A'), ('18209501', 'ADECUACIONES LOCATIVAS                                                           ', 'D', '5', '0', 'A'), ('18209502', 'VIATICOS                                                                         ', 'D', '5', '0', 'A'), ('18209503', 'PASAJES AEREOS                                                                   ', 'D', '5', '0', 'A'), ('18209504', 'SEGURO DE MANEJO                                                                 ', 'D', '5', '0', 'A'), ('18209505', 'ARRENDAMIENTO                                                                    ', 'D', '5', '0', 'A'), ('18209506', 'MANTENIMIENTO                                                                    ', 'D', '5', '0', 'A'), ('18209507', 'ENERGIA ELECTRICA                                                                ', 'D', '5', '0', 'A'), ('18209508', 'TELEFONICO                                                                       ', 'D', '5', '0', 'A'), ('18209509', 'INTERESES                                                                        ', 'D', '5', '0', 'A'), ('18209510', 'GASTOS LEGALES                                                                   ', 'D', '5', '0', 'A'), ('18209511', 'SERVICIO DE AGUA POTABLE                                                         ', 'D', '5', '0', 'A'), ('18209512', 'HONORARIOS                                                                       ', 'D', '5', '0', 'A'), ('18209513', 'GASTOS DE ASAMBLEA                                                               ', 'D', '5', '0', 'A'), ('19', 'OTROS ACTIVOS', 'D', '2', '1', 'A'), ('1904', 'SUCURSALES Y AGENCIAS', 'D', '3', '1', 'A'), ('190405', 'TRASLADO DE FONDOS', 'D', '4', '1', 'A'), ('190410', 'TRASLADO DE INVENTARIOS', 'D', '4', '1', 'A'), ('190415', 'TRASLADO DE CARTERA DE CREDITO', 'D', '4', '1', 'A'), ('190420', 'TRASLADO DE CARTERA POR VENTA DE BIENES Y SERVICIOS', 'D', '4', '1', 'A'), ('190425', 'TRASLADO DE PROPIEDADES PLANTA Y EQUIPO', 'D', '4', '1', 'A'), ('190430', 'TRASLADO DE GASTOS', 'D', '4', '1', 'A'), ('190435', 'TRASLADO OTRAS CUENTAS POR COBRAR', 'D', '4', '1', 'A'), ('190440', 'TRASLADO DE OTROS ACTIVOS', 'D', '4', '1', 'A'), ('190495', 'OTROS TRASLADOS', 'D', '4', '1', 'A'), ('1910', 'ACTIVOS INTANGIBLES', 'D', '3', '1', 'A'), ('191005', 'MARCAS Y PATENTES', 'D', '4', '1', 'A'), ('191010', 'CONCESIONES Y FRANQUICIAS', 'D', '4', '1', 'A'), ('191015', 'FIDEICOMISO FONDO DE REPOSICION', 'D', '4', '1', 'A'), ('191020', 'DERECHOS', 'D', '4', '1', 'A'), ('191025', 'LICENCIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('191030', 'AMORTIZACION ACUMULADA  (CR)', 'D', '4', '1', 'A'), ('1930', 'ACTIVOS DE OPERACION', 'D', '3', '1', 'A'), ('193005', 'LENCERIA', 'D', '4', '1', 'A'), ('193010', 'VAJILLAS', 'D', '4', '1', 'A'), ('193015', 'CRISTALERIA', 'D', '4', '1', 'A'), ('193020', 'CUBIERTERIA', 'D', '4', '1', 'A'), ('193025', 'PLATERIA', 'D', '4', '1', 'A'), ('193030', 'OTROS', 'D', '4', '1', 'A'), ('1950', 'BIENES RECIBIDOS EN PAGO', 'D', '3', '1', 'A'), ('195005', 'BIENES INMUEBLES', 'D', '4', '1', 'A'), ('195010', 'BIENES MUEBLES', 'D', '4', '1', 'A'), ('195015', 'VALORES MOBILIARIOS', 'D', '4', '1', 'A'), ('195095', 'OTROS', 'D', '4', '1', 'A'), ('1960', 'DEPOSITOS', 'D', '3', '1', 'A'), ('196005', 'EN GARANTIA', 'D', '4', '1', 'A'), ('196010', 'JUDICIALES', 'D', '4', '1', 'A'), ('196095', 'OTROS', 'D', '4', '1', 'A'), ('1965', 'BIENES DE ARTE Y CULTURA', 'D', '3', '1', 'A'), ('196505', 'OBRAS DE ARTE', 'D', '4', '1', 'A'), ('196510', 'BIBLIOTECA', 'D', '4', '1', 'A'), ('1985', 'RESPONSABILIDADES PENDIENTES', 'D', '3', '1', 'A'), ('198505', 'DIRECTIVOS', 'D', '4', '1', 'A'), ('198510', 'EMPLEADOS', 'D', '4', '1', 'A'), ('198515', 'OTROS', 'D', '4', '1', 'A'), ('1987', 'OTRAS INVERSIONES', 'D', '3', '1', 'A'), ('198705', 'CLUBES', 'D', '4', '1', 'A'), ('198710', 'COOPERATIVAS', 'D', '4', '1', 'A'), ('198715', 'ENTIDADES SIN ÁNIMO DE LUCRO', 'D', '4', '1', 'A'), ('198795', 'OTRAS', 'D', '4', '1', 'A'), ('1990', 'DIVERSOS', 'D', '3', '1', 'A'), ('199015', 'MUEBLES, ENSERES Y EQUIPOS EN ALMACEN', 'D', '4', '1', 'A'), ('199045', 'DERECHOS SUCESORALES', 'D', '4', '1', 'A'), ('199050', 'BIENES ENTREGADOS EN COMODATO', 'D', '4', '1', 'A'), ('199095', 'OTROS', 'D', '4', '1', 'A'), ('199099', 'AMORTIZACION ACUMULADA (CR)', 'D', '4', '1', 'A'), ('1995', 'VALORIZACIONES', 'D', '3', '1', 'A'), ('199505', 'INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS PARTICIPATIVOS DE', 'D', '4', '1', 'A'), ('199510', 'PROPIEDADES PLANTA Y EQUIPO', 'D', '4', '1', 'A'), ('199520', 'SEMOVIENTES', 'D', '4', '1', 'A'), ('199525', 'BIENES DE ARTE Y CULTURA', 'D', '4', '1', 'A'), ('199530', 'PATRIMONIO AUTONOMO', 'D', '4', '1', 'A'), ('199595', 'OTRAS', 'D', '4', '1', 'A'), ('1999', 'PROVISION OTROS ACTIVOS', 'D', '3', '1', 'A'), ('199905', 'DEPOSITOS', 'D', '4', '1', 'A'), ('199910', 'BIENES DE ARTE Y CULTURA', 'D', '4', '1', 'A'), ('199915', 'ACTIVOS DE OPERACIÓN', 'D', '4', '1', 'A'), ('199920', 'BIENES RECIBIDOS EN PAGO', 'D', '4', '1', 'A'), ('199925', 'RESPONSABILIDADES PENDIENTES', 'D', '4', '1', 'A'), ('199930', 'INTANGIBLES', 'D', '4', '1', 'A'), ('199935', 'OTRAS INVERSIONES', 'D', '4', '1', 'A'), ('199995', 'ACTIVOS DIVERSOS', 'D', '4', '1', 'A'), ('2', 'PASIVO', 'C', '1', '0', 'A'), ('21', 'DEPOSITOS', 'C', '2', '1', 'A'), ('2105', 'DEPOSITOS DE AHORRO', 'C', '3', '1', 'A'), ('210505', 'ORDINARIOS ACTIVAS', 'C', '4', '1', 'A'), ('210510', 'ORDINARIOS INACTIVA', 'C', '4', '1', 'A'), ('2110', 'CERTIFICADOS DEPOSITOS DE AHORRO A TÉRMINO', 'C', '3', '1', 'A'), ('211005', 'EMITIDOS  MENOS DE 6 MSES', 'C', '4', '1', 'A'), ('211010', 'EMITIDOS IGUAL A 6 MESES Y MENOR E IGUAL DE 12 MESES', 'C', '4', '1', 'A'), ('211015', 'EMITIDOS MAYOR A 12 MESES Y MENOR DE 18 MESES', 'C', '4', '1', 'A'), ('211020', 'EMITIDOS IGUAL O SUPERIOR DE 18 MESES', 'C', '4', '1', 'A'), ('2125', 'DEPOSITOS  DE AHORRO CONTRACTUAL', 'C', '3', '1', 'A'), ('212505', 'DEPOSITOS A CORTO PLAZO -  ACTIVAS', 'C', '4', '1', 'A'), ('212510', 'DEPOSITOS A CORTO PLAZO   INACTIVAS', 'C', '4', '1', 'A'), ('212515', 'DEPOSITOS A LARGO PLAZO - ACTIVAS', 'C', '4', '1', 'A'), ('212520', 'DEPOSITOS A LARGO PLAZO - INACTIVAS', 'C', '4', '1', 'A'), ('2130', 'DEPOSITOS DE AHORRO PERMANENTE', 'C', '3', '1', 'A'), ('213005', 'DEPOSITOS A CORTO PLAZO', 'C', '4', '1', 'A'), ('213010', 'DEPOSITOS A LARGO PLAZO', 'C', '4', '1', 'A'), ('22', 'PACTOS DE RECOMPRA', 'C', '2', '1', 'A'), ('2205', 'COMPROMISOS DE RECOMPRA DE INVERSIONES', 'C', '3', '1', 'A'), ('220505', 'BANCOS', 'C', '4', '1', 'A'), ('220510', 'CORPORACIONES FINANCIERAS', 'C', '4', '1', 'A'), ('220515', 'COMPAÑIAS DE FINANCIAMIENTO COMERCIAL', 'C', '4', '1', 'A'), ('220520', 'SOCIEDADES FIDUCIARIAS', 'C', '4', '1', 'A'), ('220525', 'ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A'), ('220530', 'OTRAS ENTIDADES FINANCIERAS', 'C', '4', '1', 'A'), ('220595', 'OTROS', 'C', '4', '1', 'A'), ('2210', 'COMPROMISOS DE RECOMPRA CARTERA', 'C', '3', '1', 'A'), ('221005', 'BANCOS', 'C', '4', '1', 'A'), ('221010', 'CORPORACIONES FINANCIERAS', 'C', '4', '1', 'A'), ('221020', 'COMPAÑIAS DE FINANCIAMIENTO COMERCIAL', 'C', '4', '1', 'A'), ('221025', 'FONDO DE GARANTÍAS DE ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A'), ('221030', 'ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A'), ('221035', 'OTRAS ENTIDADES FINANCIERAS', 'C', '4', '1', 'A'), ('221095', 'OTROS', 'C', '4', '1', 'A'), ('23', 'CREDITOS DE BANCOS Y OTRAS OBLIGACIONES FINANCIERAS', 'C', '2', '1', 'A'), ('2305', 'CREDITOS ORDINARIOS CORTO PLAZO', 'C', '3', '1', 'A'), ('230505', 'BANCOS COMERCIALES', 'C', '4', '1', 'A'), ('230510', 'BANCOS COOPERATIVOS', 'C', '4', '1', 'A'), ('230515', 'ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A'), ('23051501', 'FINANCIERA JURISCOOP', 'C', '5', '0', 'A'), ('23051502', 'DESARROLLAR CTA', 'C', '5', '0', 'A'), ('230520', 'ENTIDADES DEL EXTERIOR', 'C', '4', '1', 'A'), ('230525', 'SOBREGIROS', 'C', '4', '1', 'A'), ('23052501', 'SOBEGIROS BANCARIOS', 'C', '5', '0', 'A'), ('230595', 'OTRAS ENTIDADES', 'C', '4', '1', 'A'), ('23059501', 'OTRAS ENTIDADES                                                                  ', 'C', '5', '0', 'A'), ('2308', 'CREDITOS ORDINARIOS  LARGO PLAZO', 'C', '3', '1', 'A'), ('230805', 'BANCOS COMERCIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('230810', 'BANCOS COOPERATIVOS', 'C', '4', '1', 'A'), ('230815', 'ENTIDADES DEL SECTOR SOLIDARIO', 'C', '4', '1', 'A'), ('230820', 'ENTIDADDES DEL EXTERIOR', 'C', '4', '1', 'A'), ('230895', 'OTRAS ENTIDADES', 'C', '4', '1', 'A'), ('2310', 'FONDO DE GARANTIAS DE ENTIDADES COOPERATIVAS', 'C', '3', '1', 'A'), ('231005', 'PARA SU LIQUIDEZ PATRIMONIAL A CORTO PLAZO', 'C', '4', '1', 'A'), ('231010', 'PARA SU SOLIDEZ PATRIMONIAL A LARGO PLAZO', 'C', '4', '1', 'A'), ('231095', 'OTROS', 'C', '4', '1', 'A'), ('2315', 'FINAGRO', 'C', '3', '1', 'A'), ('231505', 'CREDITOS  A CORTO PLAZO', 'C', '4', '1', 'A'), ('231510', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A'), ('2317', 'FINDETER', 'C', '3', '1', 'A'), ('231705', 'CREDITOS A CORTO PLAZO', 'C', '4', '1', 'A'), ('231710', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A'), ('2320', 'BANCO DE LA REPUBLICA', 'C', '3', '1', 'A'), ('232005', 'CREDITOS A CORTO PLAZO', 'C', '4', '1', 'A'), ('232010', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A'), ('2325', 'BANCO DE COMERCIO EXTERIOR', 'C', '3', '1', 'A'), ('232505', 'CREDITOS  A CORTO PLAZO', 'C', '4', '1', 'A'), ('232510', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A'), ('2340', 'INSTITUTO DE FOMENTO INDUSTRIAL - IFI', 'C', '3', '1', 'A'), ('234005', 'CREDITOS A CORTO PLAZO', 'C', '4', '1', 'A'), ('234010', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A'), ('2345', 'ORGANISMOS INTERNACIONALES', 'C', '3', '1', 'A'), ('234505', 'CREDITOS A CORTO PLAZO', 'C', '4', '1', 'A'), ('234510', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A'), ('2350', 'OTROS ORGANISMOS - PAIS', 'C', '3', '1', 'A'), ('235005', 'CREDITOS A CORTO PLAZO', 'C', '4', '1', 'A'), ('235010', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A'), ('24', 'CUENTAS POR PAGAR', 'C', '2', '1', 'A'), ('2405', 'INTERESES', 'C', '3', '1', 'A'), ('240505', 'DEPOSITOS DE AHORRO', 'C', '4', '1', 'A'), ('240510', 'CERTIFICADOS DEPOSITOS DE AHORRO A TÉRMINO', 'C', '4', '1', 'A'), ('240520', 'DEPOSITOS DE AHORRO CONTRACTUAL', 'C', '4', '1', 'A'), ('240525', 'DEPOSITOS DE AHORRO PERMANENTE', 'C', '4', '1', 'A'), ('240530', 'COMPROMISOS DE RECOMPRA', 'C', '4', '1', 'A'), ('240535', 'CREDITOS DE BANCOS Y OTRAS OBLIGACIONES FINANCIERAS', 'C', '4', '1', 'A'), ('240540', 'BONOS', 'C', '4', '1', 'A'), ('240545', 'POR MULTAS Y SANCIONES', 'C', '4', '1', 'A'), ('240595', 'OTROS', 'C', '4', '1', 'A'), ('2410', 'CONTRATISTAS', 'C', '3', '1', 'A'), ('2415', 'COSTOS Y GASTOS POR PAGAR', 'C', '3', '1', 'A'), ('241505', 'COMISIONES', 'C', '4', '1', 'A'), ('24150501', 'COMISIONES', 'C', '5', '0', 'A'), ('241510', 'HONORARIOS', 'C', '4', '1', 'A'), ('24151001', 'HONORARIOS                                                                       ', 'C', '5', '0', 'A'), ('241515', 'SERVICIOS PUBLICOS', 'C', '4', '1', 'A'), ('241520', 'SERVICIOS TEMPORALES', 'C', '4', '1', 'A'), ('24152001', 'SERVICIOS TEMPORALES', 'C', '5', '0', 'A'), ('241525', 'SERVICIOS  DE MANTENIMIENTO', 'C', '4', '1', 'A'), ('241530', 'SEGUROS', 'C', '4', '1', 'A'), ('24153002', 'SEGURO DE CARTERA', 'C', '5', '0', 'A'), ('241535', 'ARRENDAMIENTOS', 'C', '4', '1', 'A'), ('241540', 'GASTOS  DE  VIAJES', 'C', '4', '1', 'A'), ('241545', 'GASTOS LEGALES', 'C', '4', '1', 'A'), ('241550', 'GASTOS DE REPRESENTACION Y RELACIONES PÚBLICAS', 'C', '4', '1', 'A'), ('241555', 'SERVICIOS ADUANEROS', 'C', '4', '1', 'A'), ('241595', 'OTROS', 'C', '4', '1', 'A'), ('24159501', 'OTROS', 'C', '5', '0', 'A'), ('24159502', 'ESTUDIO DE CREDITO', 'C', '5', '0', 'A'), ('24159503', 'CONSULTA CENTRALES DE RIESGO', 'C', '5', '0', 'A'), ('2430', 'PROMETIENTES COMPRADORES', 'C', '3', '1', 'A'), ('243005', 'BIENES INMUEBLES', 'C', '4', '1', 'A'), ('243010', 'BIENES MUEBLES', 'C', '4', '1', 'A'), ('2435', 'PROVEEDORES', 'C', '3', '1', 'A'), ('243505', 'NACIONALES', 'C', '4', '1', 'A'), ('24350501', 'PRONTOCREDITO LTDA - SISTEMATIZACION', 'C', '5', '0', 'A'), ('243510', 'EXTRANJEROS', 'C', '4', '1', 'A'), ('2440', 'CONTRIBUCIONES Y AFILIACIONES', 'C', '3', '1', 'A'), ('244005', 'SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA', 'C', '4', '1', 'A'), ('24400501', 'SUPERSOLIDARIA', 'C', '5', '0', 'A'), ('244020', 'FONDO DE GARANTIAS DE ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A'), ('244045', 'CONFEDERACIONES', 'C', '4', '1', 'A'), ('244050', 'FEDERACIONES', 'C', '4', '1', 'A'), ('244055', 'ASOCIACIONES', 'C', '4', '1', 'A'), ('244095', 'OTRAS', 'C', '4', '1', 'A'), ('2442', 'GRAVAMEN DE LOS MOVIMIENTOS FINANCIEROS', 'C', '3', '1', 'A'), ('244205', 'SOBRE DEPÓSITOS DE AHORROS', 'C', '4', '1', 'A'), ('244210', 'SOBRE CERTIFICADOS DE DEPOSITOS DE AHORRO A TÉRMINO', 'C', '4', '1', 'A'), ('244215', 'SOBRE DEPÓSITOS DE AHORRO CONTRACTUAL', 'C', '4', '1', 'A'), ('244220', 'SOBRE DEPOSITOS DE AHORROS PERMANENTES', 'C', '4', '1', 'A'), ('244295', 'SOBRE OTRAS TRANSACCIONES', 'C', '4', '1', 'A'), ('2445', 'RETENCION EN LA FUENTE', 'C', '3', '1', 'A'), ('244505', 'SALARIOS Y PAGOS LABORALES', 'C', '4', '1', 'A'), ('24450501', 'SALARIOS Y PAGOS LABORALES', 'C', '5', '0', 'A'), ('244510', 'DIVIDENDOS Y/O PARTICIPACIONES', 'C', '4', '1', 'A'), ('244515', 'HONORARIOS', 'C', '4', '1', 'A'), ('24451501', 'HONORARIOS                                                                       ', 'C', '5', '0', 'A'), ('244520', 'COMISIONES', 'C', '4', '1', 'A'), ('24452001', 'COMISIONES', 'C', '5', '0', 'A'), ('24452002', 'OTRAS COMISIONES', 'C', '5', '0', 'A'), ('244525', 'SERVICIOS', 'C', '4', '1', 'A'), ('24452501', 'SERVICIOS                                                                        ', 'C', '5', '0', 'A'), ('244530', 'ARRENDAMIENTOS', 'C', '4', '1', 'A'), ('24453001', 'ARRENDAMIENTO                                                                    ', 'C', '5', '0', 'A'), ('244535', 'RENDIMIENTOS FINANCIEROS', 'C', '4', '1', 'A'), ('24453501', 'RENDIMIENTOS FINANCIEROS', 'C', '5', '0', 'A'), ('244540', 'COMPRAS', 'C', '4', '1', 'A'), ('24454001', 'COMPRAS                                                                          ', 'C', '5', '0', 'A'), ('244545', 'LOTERIAS, RIFAS, APUESTAS Y SIMILARES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244550', 'POR PAGOS AL EXTERIOR', 'C', '4', '1', 'A'), ('244560', 'ENAJENACION PROPIEDADES PLANTA Y EQUIPO PERSONAS NATURALES', 'C', '4', '1', 'A'), ('244565', 'POR IMPUESTO DE TIMBRE', 'C', '4', '1', 'A'), ('244570', 'OTRAS RETENCIONES Y PATRIMONIO', 'C', '4', '1', 'A'), ('24457001', 'RETENCIONES POR PAGAR                                                            ', 'C', '5', '0', 'A'), ('24457002', 'RETENCIONES CREE TARIFA 0.30%', 'C', '5', '0', 'A'), ('24457003', 'RETENCIONES CREE TARIFA 0.60%', 'C', '5', '0', 'A'), ('244575', 'AUTORRETENCIONES', 'C', '4', '1', 'A'), ('2446', 'RETENCIONES CREE', 'C', '3', '0', 'A'), ('244605', 'RETENCIONES CREE', 'C', '4', '0', 'A'), ('24460501', 'RETENCIONES CREE TARIFA 0.30%', 'C', '5', '0', 'A'), ('24460502', 'RETENCIONES CREE TARIFA 0.60%', 'C', '5', '0', 'A'), ('24460503', 'RETENCIONES CREE TARIFA 1.60%', 'C', '5', '0', 'A'), ('2447', 'IMPUESTO A LAS VENTAS RETENIDO', 'C', '3', '1', 'A'), ('244705', 'IMPUESTO A LAS VENTAS RETENIDO', 'C', '4', '0', 'A'), ('2448', 'IMPUESTO DE INDUSTRIA Y COMERCIO RETENIDO', 'C', '3', '1', 'A'), ('244805', 'IMPUESTO DE INDUSTRIA Y COMERCIO RETENIDO', 'C', '4', '1', 'A'), ('24480501', 'IMPUESTO DE INDUSTRIA Y COMERCIO RETENIDO', 'C', '5', '0', 'A'), ('2450', 'RETENCIONES Y APORTES DE NOMINA', 'C', '3', '1', 'A'), ('245005', 'APORTES A BIENESTAR PROMOTORAS DE SALUD EPS', 'C', '4', '1', 'A'), ('24500501', 'APORTES SALUD                                                                    ', 'C', '5', '0', 'A'), ('245010', 'APORTES A BIENESTAR PROMOTORAS DE  PENSION', 'C', '4', '1', 'A'), ('24501001', 'APORTES PENSION                                                                  ', 'C', '5', '0', 'A'), ('24501002', 'FONDO SOLIDARIDAD PENSIONAL', 'C', '5', '0', 'A'), ('245015', 'APORTES A ADMINISTRADORAS DE RIESGOS PROFESIONALES ARP', 'C', '4', '1', 'A'), ('24501501', 'ARP                                                                              ', 'C', '5', '0', 'A'), ('245020', 'APORTES AL I.C.B.F., SENA Y CAJAS DE COMPENSACION', 'C', '4', '1', 'A'), ('24502001', 'PARAFISCALES                                                                                        ', 'C', '5', '0', 'A'), ('245030', 'EMBARGOS JUDICIALES', 'C', '4', '1', 'A'), ('245035', 'LIBRANZAS', 'C', '4', '1', 'A'), ('24503501', 'LIBRANZA PRONTOCREDITO LTDA', 'C', '5', '0', 'A'), ('24503502', 'LIBRANZAS DAFIN', 'C', '5', '0', 'A'), ('24503503', 'OTRAS LIBRANZAS', 'C', '5', '0', 'A'), ('24503504', 'OTROS PAGOS PRONTOCREDITO LTDA', 'C', '5', '0', 'A'), ('24503505', 'BOUTIQUE CARLOS TUIRAN', 'C', '5', '0', 'A'), ('24503506', 'LIBRANZAS SOLFINANZAS', 'C', '5', '0', 'A'), ('245040', 'SINDICATOS O AGREMIACIONES', 'C', '4', '1', 'A'), ('245045', 'COOPERATIVAS', 'C', '4', '1', 'A'), ('24504501', 'DESCUENTOS COOPROEST (EMPLEADOS)', 'C', '5', '0', 'A'), ('24504502', 'DESCUENTOS VENDEDORES COPROEST', 'C', '5', '0', 'A'), ('24504503', 'OTRAS COOPERATIVAS', 'C', '5', '0', 'A'), ('245050', 'FONDOS DE EMPLEADOS', 'C', '4', '1', 'A'), ('245095', 'OTROS', 'C', '4', '1', 'A'), ('2455', 'MULTAS Y SANCIONES, LITIGIOS, INDEMNIZACIONES Y DEMANDAS', 'C', '3', '1', 'A'), ('245505', 'MULTAS Y SANCIONES   SUPERINTENDENCIA ECONOMIA SOLIDARIA', 'C', '4', '1', 'A'), ('24550501', 'SUPERSOLIDARIA', 'C', '5', '0', 'A'), ('245510', 'MULTAS Y SANCIONES OTRAS AUTORIDADES ADMINISTRATIVAS', 'C', '4', '1', 'A'), ('245515', 'INDEMNIZACIONES A CLIENTES Y ASOCIADOS', 'C', '4', '1', 'A'), ('245520', 'OTRAS INDEMNIZACIONES', 'C', '4', '1', 'A'), ('24552001', 'INDEMNIZACIONES', 'C', '5', '0', 'A'), ('245525', 'DEMANDAS LABORALES', 'C', '4', '1', 'A'), ('245530', 'DEMANDAS POR INCUMPLIMIENTO DE CONTRATOS', 'C', '4', '1', 'A'), ('245535', 'OTROS LITIGIOS FALLADOS CON OBLIGACIÓN  DE PAGO', 'C', '4', '1', 'A'), ('245595', 'OTRAS', 'C', '4', '1', 'A'), ('2460', 'EXIGIBILIDADES POR SERVICIOS DE  RECAUDO', 'C', '3', '1', 'A'), ('246005', 'SERVICIOS PUBLICOS MUNICIPALES', 'C', '4', '1', 'A'), ('246010', 'SERVICIOS DE GAS', 'C', '4', '1', 'A'), ('246015', 'PENSIONES Y MATRICULAS', 'C', '4', '1', 'A'), ('246020', 'NOMINAS DE BIENESTAR', 'C', '4', '1', 'A'), ('246025', 'IMPUESTOS', 'C', '4', '1', 'A'), ('246030', 'CONVENIOS PROGRAMADOS', 'C', '4', '1', 'A'), ('24603001', 'CONVENIOS PROGRAMADOS', 'C', '5', '0', 'A'), ('24603002', 'CONVENIOS DAFIN PREJURIDICOS', 'C', '5', '0', 'A'), ('24603003', 'CONVENIOS COOPROEST GESTORES', 'C', '5', '0', 'A'), ('24603004', 'CONVENIOS PROGRAMADOS COOPRONTOCREDITO', 'C', '5', '0', 'A'), ('24603005', 'CTA DESARROLLAR', 'C', '5', '0', 'A'), ('24603006', 'GESTORES DE VENTA (DAFIN)', 'C', '5', '0', 'A'), ('24603007', 'RECAUDO DACION', 'C', '5', '0', 'A'), ('246095', 'OTROS', 'C', '4', '1', 'A'), ('2462', 'SEGURO DE DEPÓSITO LIQUIDADO POR PAGAR', 'C', '3', '1', 'A'), ('2465', 'REMANENTES POR PAGAR', 'C', '3', '1', 'A'), ('246505', 'DE APORTES  EXASOCIADOS', 'C', '4', '1', 'A'), ('24650501', 'DE APORTES DE EXASOCIADOS', 'C', '5', '0', 'A'), ('246510', 'DE DEPOSITOS EXASOCIADOS', 'C', '4', '1', 'A'), ('246515', 'RETORNOS DECRETADOS', 'C', '4', '1', 'A'), ('246520', 'OTROS', 'C', '4', '1', 'A'), ('2470', 'ESTABLECIMIENTOS AFILIADOS', 'C', '3', '1', 'A'), ('2495', 'DIVERSAS', 'C', '3', '1', 'A'), ('249510', 'NOMINA', 'C', '4', '1', 'A'), ('24951001', 'LIQUIDACIONES DE NOMINA', 'C', '5', '0', 'A'), ('24951002', 'CUENTAS POR PAGAR NOMINA', 'C', '5', '0', 'A'), ('249520', 'VALORES POR REINTEGRAR   DACION EN PAGO', 'C', '4', '1', 'A'), ('249525', 'DONACIONES DE TERCEROS POR PAGAR', 'C', '4', '1', 'A'), ('249530', 'VALORES POR REINTEGRAR   MAYOR DESCUENTO', 'C', '4', '1', 'A'), ('24953001', 'DEVOLUCION CUOTAS DE LIBRANZAS POR PAGAR', 'C', '5', '0', 'A'), ('24953002', 'GARANTIA SOBRE COMISION DE VENTA', 'C', '5', '1', 'A'), ('24953003', 'DEDUCCIONES POR PAGAR CREDITOS OTORGADOS', 'C', '5', '0', 'A'), ('24953004', 'CUOTAS DE OTRAS ENTIDADES', 'C', '5', '0', 'A'), ('24953005', 'CUENTAS POR PAGAR LIBRANZA', 'C', '5', '1', 'A'), ('24953006', 'DINEROS RECIBIDOS PARA SU DEVOLUCION', 'C', '5', '1', 'A'), ('24953010', 'DEVOLUCION CUOTAS DE LIBRANZAS POR PAGAR', 'C', '5', '1', 'A'), ('249595', 'OTRAS', 'C', '4', '1', 'A'), ('24959501', 'OTRAS CUENTAS POR PAGAR                                                                             ', 'C', '5', '0', 'A'), ('24959502', 'APORTES SOCIALES ASOCIADOS COOPRONTOCREDITO', 'C', '5', '0', 'A'), ('24959503', 'PAGOS A CARTERA', 'C', '5', '0', 'A'), ('24959504', 'CUOTAS INCONSISTENTES LIQ. CREDITOS                                              ', 'C', '5', '0', 'A'), ('24959505', 'RECAUDO CANCELACION DE CREDITOS', 'C', '5', '1', 'A'), ('24959506', 'DINEROS RECIBIDOS PARA OTRAS ENTIDADES', 'C', '5', '0', 'A'), ('24959507', 'DINEROS RECIBIDOS POR RELACION DE PAGOS DE COOPRONTOCREDITO', 'C', '5', '0', 'A'), ('24959508', 'CUENTAS POR PAGAR OBLIGACIONES DESARROLLAR CTA.', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24959509', 'RECAUDO POR CANCELACION DE DEUDA', 'C', '5', '0', 'A'), ('25', 'IMPUESTOS, GRAVÁMENES Y TASAS', 'C', '2', '1', 'A'), ('2505', 'RENTA Y COMPLEMENTARIOS', 'C', '3', '1', 'A'), ('250505', 'VIGENCIA FISCAL CORRIENTE', 'C', '4', '1', 'A'), ('25050501', 'VIGENCIA FISCAL CORRIENTE', 'C', '5', '0', 'A'), ('250510', 'VIGENCIA FISCAL ANTERIOR', 'C', '4', '1', 'A'), ('25051001', 'VIGENCIA FISCAL ANTERIOR', 'C', '5', '0', 'A'), ('2510', 'IMPUESTO A LAS VENTAS POR PAGAR', 'C', '3', '1', 'A'), ('251001', 'IMPUESTO A LAS VENTAS POR PAGAR', 'C', '4', '0', 'A'), ('25100101', 'IMPUESTO A LAS VENTAS POR PAGAR', 'C', '5', '0', 'A'), ('2515', 'INDUSTRIA Y COMERCIO', 'C', '3', '1', 'A'), ('251505', 'VIGENCIA FISCAL CORRIENTE', 'C', '4', '1', 'A'), ('25150501', 'VIGENCIA FISCAL CORRIENTE', 'C', '5', '0', 'A'), ('25150502', 'VIGENCIA FISCAL CORRIENTE-SANTA MARTA', 'C', '5', '0', 'A'), ('25150503', 'VIGENCIA FISCAL CORRIENTE-CARTAGENA', 'C', '5', '0', 'A'), ('25150504', 'VIGENCIA FISCAL CORRIENTE-SINCELEJO', 'C', '5', '0', 'A'), ('25150505', 'VIGENCIA FISCAL CORRIENTE-MONTERIA', 'C', '5', '0', 'A'), ('25150506', 'VIGENCIA FISCAL CORRIENTE-VALLEDUPAR', 'C', '5', '0', 'A'), ('251510', 'VIGENCIA FISCAL ANTERIOR', 'C', '4', '1', 'A'), ('25151001', 'VIGENCIA FISCAL ANTERIOR-BARRANQUILLA', 'C', '5', '0', 'A'), ('25151002', 'VIGENCIA FISCAL ANTERIOR-SANTA MARTA', 'C', '5', '0', 'A'), ('25151003', 'VIGENCIA FISCAL ANTERIOR-CARATGENA', 'C', '5', '0', 'A'), ('25151004', 'VIGENCIA FISCAL ANTERIOR-SINCELEJO', 'C', '5', '0', 'A'), ('25151005', 'VIGENCIA FISCAL ANTERIOR-MONTERIA', 'C', '5', '0', 'A'), ('25151006', 'VIGENCIA FISCAL ANTERIOR-VALLEDUPAR', 'C', '5', '0', 'A'), ('2520', 'A LA PROPIEDAD RAIZ', 'C', '3', '1', 'A'), ('2525', 'DERECHOS SOBRE INSTRUMENTOS PUBLICOS', 'C', '3', '1', 'A'), ('2530', 'DE VALORIZACION', 'C', '3', '1', 'A'), ('253005', 'VIGENCIA FICAL CORRIENTE', 'C', '4', '1', 'A'), ('253010', 'VIGENCIAS FISCAL ANTERIORES', 'C', '4', '1', 'A'), ('2535', 'DE TURISMO', 'C', '3', '1', 'A'), ('2540', 'TASA POR UTILIZACIÓN DE PUERTOS', 'C', '3', '1', 'A'), ('2545', 'DE VEHICULOS', 'C', '3', '1', 'A'), ('254505', 'VIGENCIA FISCAL CORRIENTE', 'C', '4', '1', 'A'), ('254510', 'VIGENCIAS FISCALES  ANTERIORES', 'C', '4', '1', 'A'), ('2550', 'DE ESPETACULOS  PUBLICOS', 'C', '3', '1', 'A'), ('2555', 'DE HIDROCARBUROS Y MINAS', 'C', '3', '1', 'A'), ('255505', 'DE HIDROCARBUROS', 'C', '4', '1', 'A'), ('255510', 'DE MINAS', 'C', '4', '1', 'A'), ('2560', 'REGALIAS E IMPUESTOS A LA PEQUEÑA Y MEDIANA MINERIA', 'C', '3', '1', 'A'), ('2565', 'A LAS EXPORTACIONES CAFETERAS', 'C', '3', '1', 'A'), ('2570', 'A LAS IMPORTACIONES', 'C', '3', '1', 'A'), ('2575', 'CUOTAS DE FOMENTO', 'C', '3', '1', 'A'), ('2580', 'DE LICORES, CERVEZAS Y CIGARRILLOS', 'C', '3', '1', 'A'), ('258005', 'DE LICORES', 'C', '4', '1', 'A'), ('258010', 'DE CERVEZAS', 'C', '4', '1', 'A'), ('258015', 'DE CIGARRILLOS', 'C', '4', '1', 'A'), ('2585', 'AL SACRIFICIO DE GANADO', 'C', '3', '1', 'A'), ('2590', 'AL AZAR,  JUEGOS  Y SIMILARES', 'C', '3', '1', 'A'), ('2592', 'GRAVAMENES Y REGALIAS POR UTILIZACION DEL SUELO', 'C', '3', '1', 'A'), ('2595', 'OTROS', 'C', '3', '1', 'A'), ('25950501', 'OTROS IMPUESTOS Y GRAVAMENES', 'C', '5', '0', 'A'), ('26', 'FONDOS SOCIALES, MUTUALES Y OTROS', 'C', '2', '1', 'A'), ('2605', 'FONDO SOCIAL DE EDUCACIÓN', 'C', '3', '1', 'A'), ('260505', 'FONDO SOCIAL DE EDUCACION', 'C', '4', '0', 'A'), ('26050501', 'FONDO SOCIAL DE EDUCACION', 'C', '5', '0', 'A'), ('26050502', 'FONDO DE EDUCACION IVA DEDUCIBLE', 'C', '5', '0', 'A'), ('2610', 'FONDO SOCIAL DE  SOLIDARIDAD', 'C', '3', '1', 'A'), ('261005', 'FONDO SOCIAL DE SOLIDARIDAD', 'C', '4', '0', 'A'), ('26100501', 'FONDO SOCIAL DE SOLIDARIDAD', 'C', '5', '0', 'A'), ('2612', 'FONDO RESERVA TECNICA', 'C', '3', '1', 'A'), ('2615', 'FONDO SOCIAL DE RECREACION', 'C', '3', '1', 'A'), ('2620', 'FONDOS PARA IMPREVISTOS', 'C', '3', '1', 'A'), ('2625', 'FONDO DE BIENESTAR  SOCIAL', 'C', '3', '1', 'A'), ('262505', 'FONDO DE BIENESTAR SOCIAL', 'C', '4', '0', 'A'), ('26250501', 'FONDO DE BIENESTAR SOCIAL', 'C', '5', '0', 'A'), ('26250502', 'FONDO DE BIENESTAR SOCIAL-IVA NO DEDUCIBLE-', 'C', '5', '0', 'A'), ('2648', 'FONDO SOCIAL PARA OTROS FINES', 'C', '3', '1', 'A'), ('2655', 'FONDO MUTUAL DE  PREVISIÓN ASISTENCIA Y SOLIDARIDAD', 'C', '3', '1', 'A'), ('265505', 'FONDO MUTUAL DE PREVISION', 'C', '4', '0', 'A'), ('26550501', 'FONDO MUTUAL                                                                     ', 'C', '5', '1', 'A'), ('26550502', 'FONDO MUTUAL', 'C', '5', '0', 'A'), ('2658', 'FONDO MANTENIMIENTO CONJUNTO HABITACIONAL', 'C', '3', '1', 'A'), ('2660', 'FONDO REPOSICIÓN AUTOMOTOR', 'C', '3', '1', 'A'), ('2695', 'FONDO MUTUAL PARA OTROS FINES', 'C', '3', '1', 'A'), ('269505', 'FONDO EXEQUIAL.', 'C', '4', '0', 'A'), ('26950501', 'FONDO EXEQUIAL.', 'C', '5', '1', 'A'), ('26950502', 'FONDO EXEQUIAL', 'C', '5', '0', 'A'), ('27', 'OTROS PASIVOS', 'C', '2', '1', 'A'), ('2705', 'SUCURSALES Y AGENCIAS', 'C', '3', '1', 'A'), ('270505', 'DEPOSITOS DE AHORROS', 'C', '4', '1', 'A'), ('270510', 'CERTIFICADOS DEPOSITOS DE AHORRO A TÉRMINO', 'C', '4', '1', 'A'), ('270520', 'CUENTAS DE AHORRO ESPECIAL', 'C', '4', '1', 'A'), ('270525', 'DEPOSITOS CONTRACTUALES', 'C', '4', '1', 'A'), ('270530', 'DEPOSITOS DE AHORROS PERMANENTES', 'C', '4', '1', 'A'), ('270535', 'TRASLADO DE APORTES', 'C', '4', '1', 'A'), ('270540', 'TRASLADOS DE INGRESOS', 'C', '4', '1', 'A'), ('270545', 'TRASLADO DE RENTENCION EN LA FUENTE', 'C', '4', '1', 'A'), ('270550', 'TRASLADO CUENTAS POR PAGAR', 'C', '4', '1', 'A'), ('270595', 'OTROS TRASLADOS', 'C', '4', '1', 'A'), ('2710', 'OBLIGACIONES LABORALES', 'C', '3', '1', 'A'), ('271005', 'SALARIOS POR PAGAR', 'C', '4', '1', 'A'), ('27100501', 'SALARIO POR PAGAR', 'C', '5', '0', 'A'), ('271010', 'CESANTIAS CONSOLIDADAS', 'C', '4', '1', 'A'), ('27101001', 'CESANTIAS CONSOLIDADAS                                                           ', 'C', '5', '0', 'A'), ('271015', 'INTERESES SOBRE CESANTIAS', 'C', '4', '1', 'A'), ('27101501', 'INTERESES SOBRE CESANTIAS                                                        ', 'C', '5', '0', 'A'), ('271020', 'PRIMA DE SERVICIOS', 'C', '4', '1', 'A'), ('27102001', 'PRIMA DE SERVICIOS', 'C', '5', '0', 'A'), ('271025', 'VACACIONES CONSOLIDADAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27102501', 'VACACIONES CONSOLIDADAS                                                          ', 'C', '5', '0', 'A'), ('271030', 'COMPENSACION ANUAL DIFERIDA', 'C', '4', '1', 'A'), ('271035', 'COMPENSACION SEMESTRAL', 'C', '4', '1', 'A'), ('271040', 'DESCANSO ANUAL COMPENSADO', 'C', '4', '1', 'A'), ('271095', 'OTRAS PRESTACIONES SOCIALES', 'C', '4', '1', 'A'), ('2715', 'PENSIONES POR PAGAR', 'C', '3', '1', 'A'), ('2720', 'CUOTAS PARTES PENSIONES DE JUBILACION', 'C', '3', '1', 'A'), ('2725', 'INGRESOS ANTICIPADOS', 'C', '3', '1', 'A'), ('272505', 'INTERESES', 'C', '4', '1', 'A'), ('272510', 'COMISIONES', 'C', '4', '1', 'A'), ('272515', 'ARRENDAMIENTOS', 'C', '4', '1', 'A'), ('272520', 'HONORARIOS', 'C', '4', '1', 'A'), ('272525', 'SERVICIOS', 'C', '4', '1', 'A'), ('272595', 'OTROS', 'C', '4', '1', 'A'), ('2730', 'ABONOS DIFERIDOS', 'C', '3', '1', 'A'), ('273005', 'PRIMA EN COLOCACION TITULOS DE INVERSION', 'C', '4', '1', 'A'), ('273015', 'POR VENTA DE BIENES', 'C', '4', '1', 'A'), ('273020', 'UTILIDAD DIFERIDA EN VENTAS A PLAZOS', 'C', '4', '1', 'A'), ('273025', 'RETENCIONES O ANTICIPOS PENDIENTE DE APLICAR', 'C', '4', '1', 'A'), ('27302501', 'RETENCIONES PENDIENTES DE APLICAR', 'C', '5', '0', 'A'), ('273030', 'AUXILIOS Y DONACIONES', 'C', '4', '1', 'A'), ('273035', 'INTERESES ORIGINADOS EN PROCESO DE REESTRUCTURACION', 'C', '4', '1', 'A'), ('273095', 'OTROS', 'C', '4', '1', 'A'), ('2735', 'CUENTAS EN PARTICIPACION', 'C', '3', '1', 'A'), ('2740', 'INGRESOS RECIBIDOS PARA TERCEROS', 'C', '3', '1', 'A'), ('274005', 'VALORES RECIBIDOS PARA TERCEROS', 'C', '4', '1', 'A'), ('27400501', 'VALORES RECIBIDOS PARA TERCEROS', 'C', '5', '1', 'A'), ('274010', 'VENTA POR  CUENTA DE TERCEROS', 'C', '4', '1', 'A'), ('2745', 'ANTICIPOS Y AVANCES RECIBIDOS', 'C', '3', '1', 'A'), ('274505', 'PARA VIVIENDA', 'C', '4', '1', 'A'), ('274510', 'PARA IMPORTACIONES', 'C', '4', '1', 'A'), ('274515', 'PARA SERVICIOS', 'C', '4', '1', 'A'), ('27451501', 'RECAUDO DE CLIENTES                                                              ', 'C', '5', '0', 'A'), ('274598', 'OTROS', 'C', '4', '1', 'A'), ('2795', 'DIVERSOS', 'C', '3', '1', 'A'), ('279505', 'ABONOS PARA APLICAR A OBLIGACIONES', 'C', '4', '1', 'A'), ('279510', 'SOBRANTES EN CAJA', 'C', '4', '1', 'A'), ('279595', 'OTROS', 'C', '4', '1', 'A'), ('27959501', 'CUENTAS POR PAGAR LIBRANZAS                                                      ', 'C', '5', '0', 'A'), ('27959502', 'CONVENIOS AUTORIZADOS DE PAGOS', 'C', '5', '0', 'A'), ('27959503', 'CHEQUES DE CLIENTES RECIBIDOS POR PAGAR', 'C', '5', '1', 'A'), ('27959505', 'CONVENIOS TRASLADOS CARTERA', 'C', '5', '1', 'A'), ('27959506', 'CUENTAS POR PAGAR LIBRANZAS KREDISOFT', 'C', '5', '0', 'A'), ('28', 'PASIVOS ESTIMADOS Y PROVISIONES', 'C', '2', '1', 'A'), ('2805', 'INTERESES', 'C', '3', '1', 'A'), ('280505', 'DEPOSITOS DE AHORRO', 'C', '4', '1', 'A'), ('280510', 'CERTIFICADOS DE AHORRO A TÉRMINO', 'C', '4', '1', 'A'), ('280515', 'DEPOSITOS DE AHORROS CONTRACTUAL', 'C', '4', '1', 'A'), ('280520', 'DEPOSITOS DE AHORRO PERMANENTE', 'C', '4', '1', 'A'), ('2810', 'PARA COSTOS Y GASTOS', 'C', '3', '1', 'A'), ('281005', 'OTROS  INTERESES', 'C', '4', '1', 'A'), ('281010', 'COMISIONES', 'C', '4', '1', 'A'), ('281015', 'HONORARIOS', 'C', '4', '1', 'A'), ('281020', 'SERVICIOS TECNICOS', 'C', '4', '1', 'A'), ('281025', 'TRANSPORTES, FLETES Y ACARREOS', 'C', '4', '1', 'A'), ('281030', 'GASTOS DE VIAJE', 'C', '4', '1', 'A'), ('281035', 'SERVICIOS PUBLICOS', 'C', '4', '1', 'A'), ('281040', 'REGALIAS', 'C', '4', '1', 'A'), ('281045', 'GARANTIAS', 'C', '4', '1', 'A'), ('281050', 'MATERIALES Y REPUESTOS', 'C', '4', '1', 'A'), ('281055', 'ARRENDAMIENTOS', 'C', '4', '1', 'A'), ('281060', 'CONTRIBUCIONES Y AFILIACIONES', 'C', '4', '1', 'A'), ('281065', 'SERVICIOS VARIOS', 'C', '4', '1', 'A'), ('281095', 'OTROS', 'C', '4', '1', 'A'), ('2820', 'PARA MANTENIMIENTO Y REPARACIONES', 'C', '3', '1', 'A'), ('282005', 'TERRENOS', 'C', '4', '1', 'A'), ('282010', 'EDIFICACIONES', 'C', '4', '1', 'A'), ('282015', 'MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A'), ('282020', 'MUEBLES Y EQUIPO DE OFICINA', 'C', '4', '1', 'A'), ('282025', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'C', '4', '1', 'A'), ('282030', 'LABORATORIOS Y EQUIPOS DIDACTICOS', 'C', '4', '1', 'A'), ('282035', 'VEHICULOS', 'C', '4', '1', 'A'), ('282040', 'MAUSOLEOS', 'C', '4', '1', 'A'), ('282045', 'BIENES DE FONDOS SOCIALES', 'C', '4', '1', 'A'), ('282050', 'ACUEDUCTOS PLANTAS Y REDES', 'C', '4', '1', 'A'), ('282055', 'ARMAMENTO DE VIGILANCIA', 'C', '4', '1', 'A'), ('282060', 'PLANTACIONES AGRICOLAS Y FORESTALES', 'C', '4', '1', 'A'), ('282065', 'POZOS ARTESIANOS', 'C', '4', '1', 'A'), ('282095', 'OTROS', 'C', '4', '1', 'A'), ('2825', 'OBLIGACIONES LABORALES', 'C', '3', '1', 'A'), ('282505', 'CESANTIAS', 'C', '4', '1', 'A'), ('28250501', 'CESANTIAS                                                                        ', 'C', '5', '0', 'A'), ('282510', 'INTERESES SOBRE CESANTIAS', 'C', '4', '1', 'A'), ('28251001', 'INTERESES SOBRE CESANTIAS                                                        ', 'C', '5', '0', 'A'), ('282515', 'VACACIONES', 'C', '4', '1', 'A'), ('28251501', 'VACACIONES                                                                       ', 'C', '5', '0', 'A'), ('282520', 'PRIMA LEGAL', 'C', '4', '1', 'A'), ('28252001', 'PRIMA LEGAL                                                                      ', 'C', '5', '0', 'A'), ('282525', 'PRIMA EXTRALEGAL', 'C', '4', '1', 'A'), ('282530', 'PRIMA DE VACACIONES', 'C', '4', '1', 'A'), ('282535', 'BONIFICACIONES', 'C', '4', '1', 'A'), ('282540', 'PRIMA DE ANTIGÜEDAD', 'C', '4', '1', 'A'), ('282545', 'SEGURIDAD SOCIAL', 'C', '4', '1', 'A'), ('282550', 'COMPENSACION ANUAL DIFERIDA', 'C', '4', '1', 'A'), ('282555', 'COMPENSACION SEMESTRAL', 'C', '4', '1', 'A'), ('282560', 'DESCANSO ANUAL COMPENSADO', 'C', '4', '1', 'A'), ('282565', 'COMPENSACION EXTRAORDINARIA', 'C', '4', '1', 'A'), ('282595', 'OTRAS PRESTACIONES', 'C', '4', '1', 'A'), ('2827', 'PENSIONES DE JUBILACION', 'C', '3', '1', 'A'), ('282705', 'CALCULO ACTUARIAL PENSIONES DE JUBILACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282710', 'PENSIONES DE JUBILACION POR AMORTIZAR (DB)', 'C', '4', '1', 'A'), ('2830', 'IMPUESTOS', 'C', '3', '1', 'A'), ('283005', 'RENTA Y COMPLEMENTARIOS', 'C', '4', '1', 'A'), ('28300501', 'RENTA Y COMPLEMENTARIOS', 'C', '5', '0', 'A'), ('283010', 'INDUSTRIA Y COMERCIO', 'C', '4', '1', 'A'), ('283015', 'PREDIAL', 'C', '4', '1', 'A'), ('283020', 'VEHICULOS', 'C', '4', '1', 'A'), ('283025', 'VALORIZACION', 'C', '4', '1', 'A'), ('283030', 'DERECHOS SOBRE INSTRUMENTOS PUBLICOS', 'C', '4', '1', 'A'), ('283035', 'TURISMO', 'C', '4', '1', 'A'), ('283040', 'DE HIDROCARBUROS Y MINAS', 'C', '4', '1', 'A'), ('283045', 'DE LICORES, CERVEZAS Y CIGARRILLO', 'C', '4', '1', 'A'), ('283050', 'AL AZAR Y JEGOS', 'C', '4', '1', 'A'), ('283095', 'OTROS', 'C', '4', '1', 'A'), ('2835', 'CONTRIBUCIONES Y AFILIACIONES', 'C', '3', '1', 'A'), ('283505', 'SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA', 'C', '4', '1', 'A'), ('28350501', 'SUPERSOLIDARIA', 'C', '5', '0', 'A'), ('283520', 'FONDO DE GARANTIAS DE ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A'), ('283545', 'CONFEDERACIONES', 'C', '4', '1', 'A'), ('283550', 'FEDERACIONES', 'C', '4', '1', 'A'), ('283555', 'ASOCIACIONES', 'C', '4', '1', 'A'), ('283595', 'OTRAS', 'C', '4', '1', 'A'), ('2840', 'MULTAS Y SANCIONES   SUPERINTENDENCIA ECONOMIA SOLIDARIA', 'C', '3', '1', 'A'), ('284005', 'RELACION ACTIVOS PONDERADOS POR RIESGO', 'C', '4', '1', 'A'), ('284010', 'EXCESOS (DEFECTOS) DE COLOCACIONES DE CARTERA', 'C', '4', '1', 'A'), ('284015', 'EXCESOS EN ADQUISICIÓN DE INVERSIONES  O ACTIVOS FIJOS', 'C', '4', '1', 'A'), ('284020', 'DEFECTOS DE INVERSIONES', 'C', '4', '1', 'A'), ('284025', 'DEFECTO FONDO DE LIQUIDEZ', 'C', '4', '1', 'A'), ('284030', 'MARGEN DE SOLVENCIA', 'C', '4', '1', 'A'), ('284095', 'OTRAS', 'C', '4', '1', 'A'), ('28409501', 'OTRAS', 'C', '5', '0', 'A'), ('2845', 'MULTAS Y SANCIONES, LITIGIOS, INDEMNIZACIONES Y DEMANDAS', 'C', '3', '1', 'A'), ('284510', 'AUTORIDADES ADMINISTRATIVAS', 'C', '4', '1', 'A'), ('284515', 'INDEMNIZACIONES A ASOCIADOS', 'C', '4', '1', 'A'), ('284520', 'OTRAS INDEMNIZACIONES', 'C', '4', '1', 'A'), ('284525', 'DEMANDAS LABORALES', 'C', '4', '1', 'A'), ('284530', 'DEMANDAS POR INCUMPLIMIENTO DE CONTRATOS', 'C', '4', '1', 'A'), ('284535', 'LITIGIOS EN PROCESO EJECUTIVO', 'C', '4', '1', 'A'), ('284540', 'OTROS LITIGIOS EN PROCESO ADMINISTRATIVO JUDICIAL O ARBITRAL', 'C', '4', '1', 'A'), ('284595', 'OTRAS', 'C', '4', '1', 'A'), ('2890', 'OTROS PASIVOS ESTIMADOS', 'C', '3', '1', 'A'), ('289005', 'PARA CONTINGENCIAS', 'C', '4', '1', 'A'), ('2895', 'PROVISIONES DIVERSAS', 'C', '3', '1', 'A'), ('289505', 'PARA BENEFICIENCA', 'C', '4', '1', 'A'), ('289510', 'PARA COMUNICACIONES', 'C', '4', '1', 'A'), ('289595', 'OTRAS', 'C', '4', '1', 'A'), ('29', 'TITULOS DE INVERSION EN CIRCULACION', 'C', '2', '1', 'A'), ('2905', 'BONOS POR PAGAR', 'C', '3', '1', 'A'), ('290540', 'DE GARANTIA GENERAL MENOR DE 18 MESES', 'C', '4', '1', 'A'), ('290545', 'DE GARANTIA GENERAL IGUAL O SUPERIOR A 18 MESES', 'C', '4', '1', 'A'), ('290580', 'OTROS MENOR DE 18 MESES', 'C', '4', '1', 'A'), ('290585', 'OTROS IGUAL O SUPERIOR A 18 MESES', 'C', '4', '1', 'A'), ('3', 'PATRIMONIO', 'C', '1', '1', 'A'), ('31', 'CAPITAL SOCIAL', 'C', '2', '1', 'A'), ('3105', 'APORTES SOCIALES', 'C', '3', '1', 'A'), ('310505', 'APORTES ORDINARIOS', 'C', '4', '1', 'A'), ('31050501', 'APORTES ORDINARIOS', 'C', '5', '1', 'A'), ('31050502', 'APORTES ORDINARIOS ADICIONALES', 'C', '5', '0', 'A'), ('31050503', 'APORTES INICIALES', 'C', '5', '1', 'A'), ('31050504', 'SALDOS INICIALES MIGRACION', 'C', '5', '1', 'A'), ('310510', 'APORTES EXTRAORDINARIOS', 'C', '4', '1', 'A'), ('31051001', 'APORTES EXTRAORDINARIOS', 'C', '5', '1', 'A'), ('31051002', 'APORTES EXTRAORDINARIOS 2', 'C', '5', '0', 'A'), ('310515', 'APORTES AMORTIZADOS', 'C', '4', '1', 'A'), ('310520', 'APORTES VOLUNTARIOS', 'C', '4', '1', 'A'), ('3110', 'FONDO SOCIAL MUTUAL', 'C', '3', '1', 'A'), ('311005', 'CUOTAS O CONTRIBUCIONES SOCIALES', 'C', '4', '1', 'A'), ('311010', 'RESULTADO SOCIAL POSITIVO', 'C', '4', '1', 'A'), ('32', 'RESERVAS', 'C', '2', '1', 'A'), ('3205', 'RESERVA PROTECCIÓN DE APORTES', 'C', '3', '1', 'A'), ('320505', 'RESERVA PROTECCION DE APORTES', 'C', '4', '1', 'A'), ('32050501', 'RESERVA PROTECCION DE APORTES', 'C', '5', '0', 'A'), ('3210', 'RESERVA DE INVERSIÓN SOCIAL', 'C', '3', '1', 'A'), ('3215', 'RESERVA DE ASAMBLEA', 'C', '3', '1', 'A'), ('3220', 'RESERVA PROTECCIÓN CARTERA', 'C', '3', '1', 'A'), ('322005', 'RESERVA CREDITOS CON LIBRANZA', 'C', '4', '1', 'A'), ('322010', 'RESERVA  CREDITOS SIN LIBRANZA', 'C', '4', '1', 'A'), ('3225', 'RESERVAS ESTATUTARIAS', 'C', '3', '1', 'A'), ('322505', 'RESERVA PARA CAPITAL DE TRABAJO', 'C', '4', '1', 'A'), ('322510', 'RESERVA REPOSICIÓN DE ACTIVOS', 'C', '4', '1', 'A'), ('322515', 'RESERVA FUTUROS ENSANCHES', 'C', '4', '1', 'A'), ('322590', 'OTRAS', 'C', '4', '1', 'A'), ('3230', 'RESERVA PROTECCION FONDO MUTUAL', 'C', '3', '1', 'A'), ('3235', 'POR DISPOSICIONES FISCALES', 'C', '3', '1', 'A'), ('323505', 'POR VALORIZACIÓN DE INVERSIONES NEGOCIABLES', 'C', '4', '1', 'A'), ('323595', 'OTRAS', 'C', '4', '1', 'A'), ('3280', 'OTRAS RESERVAS', 'C', '3', '1', 'A'), ('33', 'FONDOS DE DESTINACION ESPECÍFICA', 'C', '2', '1', 'A'), ('3305', 'FONDO PARA AMORTIZACION DE APORTES', 'C', '3', '1', 'A'), ('330505', 'FONDO PARA AMORTIZACIÓN DE APORTES', 'C', '4', '1', 'A'), ('3310', 'FONDO PARA REVALORIZACION DE APORTES', 'C', '3', '1', 'A'), ('331005', 'FONDO PARA REVALORIZACION DE APORTES', 'C', '4', '1', 'A'), ('33100501', 'FONDO PARA REVALORIZACION DE APORTES', 'C', '5', '0', 'A'), ('331010', 'FONDO DE MANTENIMIENTO DEL PODER ADQUISITIVO DE LOS APORTES', 'C', '4', '1', 'A'), ('3315', 'FONDO MERCADEO DE PRODUCTOS', 'C', '3', '1', 'A'), ('331505', 'FONDO MERCADEO DE  PRODUCTOS', 'C', '4', '1', 'A'), ('3320', 'FONDO PARA INFRAESTRUCTURA FISICA', 'C', '3', '1', 'A'), ('332005', 'FONDO PARA INFRAESTRUCTURA FISICA', 'C', '4', '1', 'A'), ('3325', 'FONDO ESPECIAL', 'C', '3', '1', 'A'), ('332505', 'FONDO ESPECIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('33250501', 'FONDO ESPECIAL', 'C', '5', '0', 'A'), ('3330', 'FONDO SOCIALES CAPITALIZADOS', 'C', '3', '1', 'A'), ('333005', 'FONDO SOCIALES CAPITALIZADOS', 'C', '4', '1', 'A'), ('3335', 'FONDOS DE INVERSION', 'C', '3', '1', 'A'), ('333505', 'FONDOS DE INVERSION', 'C', '4', '1', 'A'), ('33350501', 'FONDOS DE INVERSION', 'C', '5', '0', 'A'), ('3340', 'OTROS FONDOS', 'C', '3', '1', 'A'), ('334005', 'OTROS FONDOS', 'C', '4', '1', 'A'), ('33400502', 'FONDO DE BIENESTAR SOCIAL', 'C', '5', '0', 'A'), ('34', 'SUPERAVIT', 'C', '2', '1', 'A'), ('3405', 'AUXILIOS Y DONACIONES', 'C', '3', '1', 'A'), ('340505', 'ENTIDADES PARTICULARES', 'C', '4', '1', 'A'), ('340510', 'ENTIDADES EXTRANJERAS', 'C', '4', '1', 'A'), ('340595', 'OTRAS', 'C', '4', '1', 'A'), ('3415', 'VALORIZACIONES', 'C', '3', '1', 'A'), ('341505', 'INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS PARTICIPATIVOS DE BAJA', 'C', '4', '1', 'A'), ('341510', 'PROPIEDADES PLANTA  Y EQUIPO', 'C', '4', '1', 'A'), ('341520', 'SEMOVIENTES', 'C', '4', '1', 'A'), ('341525', 'BIENES DE ARTE Y CULTURA', 'C', '4', '1', 'A'), ('341530', 'PATRIMONIO AUTÓNOMO   SANEAMIENTO FOGACOOP', 'C', '4', '1', 'A'), ('341595', 'OTRAS', 'C', '4', '1', 'A'), ('3420', 'GANANCIAS O PÉRDIDAS ACUMULADAS NO REALIZADAS EN INVERSIONES DISPONIBLES PARA LA VENTA', 'C', '3', '1', 'A'), ('342005', 'TITULOS DE DEUDA', 'C', '4', '1', 'A'), ('342010', 'TITULOS PARTICIPATIVOS DE ALTA O MEDIA BURSATILIDAD', 'C', '4', '1', 'A'), ('342015', 'TITULOS PARTICIPATIVOS O MIXTOS DE PROCESOS DE TITULARIZACION', 'C', '4', '1', 'A'), ('35', 'RESULTADOS DEL EJERCICIO', 'C', '2', '1', 'A'), ('3505', 'EXCEDENTES Y/O PÉRDIDAS', 'C', '3', '1', 'A'), ('350505', 'EXCEDENTES', 'C', '4', '1', 'A'), ('35050501', 'EXCEDENTES', 'C', '5', '0', 'A'), ('350510', 'PERDIDAS (DB)', 'C', '4', '1', 'A'), ('35051001', 'PERDIDAS', 'C', '5', '0', 'A'), ('36', 'RESULTADOS DE EJERCICIOS ANTERIORES', 'C', '2', '1', 'A'), ('3605', 'EXCEDENTES Y/O PÉRDIDAS', 'C', '3', '1', 'A'), ('360505', 'EXCEDENTES', 'C', '4', '1', 'A'), ('36050501', 'EXCEDENTES', 'C', '5', '0', 'A'), ('360510', 'PERDIDAS (DB)', 'C', '4', '1', 'A'), ('36051001', 'PERDIDAS', 'C', '5', '1', 'A'), ('4', 'INGRESOS', 'C', '1', '1', 'A'), ('41', 'OPERACIONALES', 'C', '2', '1', 'A'), ('4105', 'AGRICULTURA, GANADERIA, CAZA Y SILVICULTURA', 'C', '3', '1', 'A'), ('410505', 'CULTIVO DE CEREALES', 'C', '4', '1', 'A'), ('410510', 'CULTIVOS DE HORTALIZAS, LEGUMBRES Y PLANTAS ORNAMENTALES', 'C', '4', '1', 'A'), ('410515', 'CULTIVOS DE FRUTAS, NUECES Y PLANTAS AROMATICAS', 'C', '4', '1', 'A'), ('410520', 'CULTIVO DE CAFE', 'C', '4', '1', 'A'), ('410525', 'CULTIVO DE FLORES', 'C', '4', '1', 'A'), ('410530', 'CULTIVO DE CAÑA DE AZUCAR', 'C', '4', '1', 'A'), ('410535', 'CULTIVO DE ALGODON Y PLANTAS PARA MATERIAL TEXTIL', 'C', '4', '1', 'A'), ('410540', 'CULTIVO DE BANANO', 'C', '4', '1', 'A'), ('410545', 'OTROS CULTIVOS AGRICOLAS', 'C', '4', '1', 'A'), ('410550', 'CRIA DE OVEJAS, CABRAS, ASNOS, MULAS Y BURDEGANOS', 'C', '4', '1', 'A'), ('410555', 'CRIA DE GANADO CABALLAR Y VACUNO.', 'C', '4', '1', 'A'), ('410560', 'PRODUCCION AVICOLA', 'C', '4', '1', 'A'), ('410565', 'CRIA DE OTROS ANIMALES', 'C', '4', '1', 'A'), ('410570', 'SERVICIOS AGRICOLAS Y GANADEROS', 'C', '4', '1', 'A'), ('410575', 'ACTIVIDAD DE CAZA', 'C', '4', '1', 'A'), ('410580', 'ACTIVIDAD DE SILVICULTURA', 'C', '4', '1', 'A'), ('4110', 'PESCA', 'C', '3', '1', 'A'), ('411005', 'ACTIVIDAD DE PESCA', 'C', '4', '1', 'A'), ('411010', 'EXPLOTACION DE CRIADEROS DE PECES', 'C', '4', '1', 'A'), ('411095', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A'), ('4115', 'EXPLOTACION DE MINAS Y CANTERAS', 'C', '3', '1', 'A'), ('411505', 'CARBON', 'C', '4', '1', 'A'), ('411510', 'PETROLEO CRUDO', 'C', '4', '1', 'A'), ('411512', 'GAS NATURAL', 'C', '4', '1', 'A'), ('411514', 'SERVICIOS RELACIONADOS CON EXTRACCION DE PETROLEO Y GAS', 'C', '4', '1', 'A'), ('411515', 'MINERALES DE HIERRO', 'C', '4', '1', 'A'), ('411520', 'MINERALES METALIFEROS NO FERROSOS', 'C', '4', '1', 'A'), ('411525', 'PIEDRA, ARENA Y ARCILLA', 'C', '4', '1', 'A'), ('411527', 'PIEDRAS PRECIOSAS', 'C', '4', '1', 'A'), ('411528', 'ORO', 'C', '4', '1', 'A'), ('411530', 'OTRAS MINAS Y CANTERAS', 'C', '4', '1', 'A'), ('411532', 'PRESTACION DE SERVICIOS SECTOR MINERO', 'C', '4', '1', 'A'), ('411595', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A'), ('4120', 'INDUSTRIAS MANUFACTURERAS', 'C', '3', '1', 'A'), ('412001', 'PRODUCCION Y PROCESAMIENTO DE CARNES Y PRODUCTOS CARNICOS', 'C', '4', '1', 'A'), ('412002', 'PRODUCTOS DE PESCADO', 'C', '4', '1', 'A'), ('412003', 'PRODUCTOS DE FRUTAS, LEGUMBRES Y HORTALIZAS', 'C', '4', '1', 'A'), ('412004', 'ELABORACION DE ACEITES Y GRASAS', 'C', '4', '1', 'A'), ('412005', 'ELABORACION DE PRODUCTOS LACTEOS', 'C', '4', '1', 'A'), ('412006', 'ELABORACION DE PRODUCTOS DE MOLINERIA', 'C', '4', '1', 'A'), ('412007', 'ELABORACION DE ALMIDONES Y DERIVADOS', 'C', '4', '1', 'A'), ('412008', 'ELABORACION DE ALIMENTOS PARA ANIMALES', 'C', '4', '1', 'A'), ('412009', 'ELABORACION DE PRODUCTOS PARA PANADERIA', 'C', '4', '1', 'A'), ('412010', 'ELABORACION DE AZUCAR Y MELAZAS', 'C', '4', '1', 'A'), ('412011', 'ELABORACION DE CACAO, CHOCOLATE Y CONFITERIA', 'C', '4', '1', 'A'), ('412012', 'ELABORACION DE PASTAS  Y PRODUCTOS FARINACEOS', 'C', '4', '1', 'A'), ('412013', 'ELABORACION DE PRODUCTOS DE CAFE', 'C', '4', '1', 'A'), ('412014', 'ELABORACION DE OTROS PRODUCTOS ALIMENTICIOS', 'C', '4', '1', 'A'), ('412015', 'ELABORACION DE BEBIDAS ALCOHOLICAS Y ALCOHOL ETILICO', 'C', '4', '1', 'A'), ('412016', 'ELABORACION DE VINOS', 'C', '4', '1', 'A'), ('412017', 'ELABORACION DE BEBIDAS MALTEADAS Y DE MALTA', 'C', '4', '1', 'A'), ('412018', 'ELABORACION DE BEBIDAS NO ALCOHOLICAS', 'C', '4', '1', 'A'), ('412019', 'ELABORACION DE PRODUCTOS DE TABACO', 'C', '4', '1', 'A'), ('412020', 'PREPARACION E HILATURA DE FIBRAS TEXTILES Y TEJEDURIA', 'C', '4', '1', 'A'), ('412021', 'ACABADO DE PRODUCTOS TEXTILES', 'C', '4', '1', 'A'), ('412022', 'ELABORACION DE ARTICULOS DE MATERIALES TEXTILES', 'C', '4', '1', 'A'), ('412023', 'ELABORACION DE TAPICES Y ALFOMBRAS', 'C', '4', '1', 'A'), ('412024', 'ELABORACION DE CUERDAS, CORDELES, BRAMANTES Y REDES', 'C', '4', '1', 'A'), ('412025', 'ELABORACION DE OTROS PRODUCTOS TEXTILES', 'C', '4', '1', 'A'), ('412026', 'ELABORACION DE TEJIDOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412027', 'ELABORACION DE PRENDAS DE VESTIR', 'C', '4', '1', 'A'), ('412028', 'PREPARACION, ADOBO Y TEÑIDO DE PIELES', 'C', '4', '1', 'A'), ('412029', 'CURTIDO, ADOBO O PREPARACION DE CUERO', 'C', '4', '1', 'A'), ('412030', 'ELABORACION DE MALETAS, BOLSOS Y SIMILARES', 'C', '4', '1', 'A'), ('412031', 'ELABORACION DE CALZADO', 'C', '4', '1', 'A'), ('412032', 'PRODUCCION DE MADERA, ARTICULOS DE MADERA Y CORCHO', 'C', '4', '1', 'A'), ('412033', 'ELABORACION DE PASTA Y PRODUCTOS DE MADERA, PAPEL Y CARTON', 'C', '4', '1', 'A'), ('412034', 'EDICIONES Y PUBLICACIONES', 'C', '4', '1', 'A'), ('412035', 'IMPRESION', 'C', '4', '1', 'A'), ('412036', 'SERVICIOS RELACIONADOS CON LA EDICION Y LA IMPRESION', 'C', '4', '1', 'A'), ('412037', 'REPRODUCCION DE GRABACIONES', 'C', '4', '1', 'A'), ('412038', 'ELABORACION DE PRODUCTOS DE HORNO DE COQUE', 'C', '4', '1', 'A'), ('412039', 'ELABORACION DE PRODUCTOS DE LA REFINACION DE PETROLEO', 'C', '4', '1', 'A'), ('412040', 'ELABORACION DE SUSTANCIAS QUIMICAS BASICAS', 'C', '4', '1', 'A'), ('412041', 'ELABORACION DE ABONOS Y COMPUESTOS DE NITROGENO', 'C', '4', '1', 'A'), ('412042', 'ELABORACION DE PLASTICO Y CAUCHO SINTETICO', 'C', '4', '1', 'A'), ('412043', 'ELABORACION DE PRODUCTOS QUIMICOS DE USO AGROPECUARIO', 'C', '4', '1', 'A'), ('412044', 'ELABORACION DE PINTURAS, TINTAS Y MASILLAS', 'C', '4', '1', 'A'), ('412045', 'ELABORACION DE PRODUCTOS FARMACEUTICOS Y BOTANICOS', 'C', '4', '1', 'A'), ('412046', 'ELABORACION DE JABONES, DETERGENTES Y PREPARADOS DE TOCADOR', 'C', '4', '1', 'A'), ('412047', 'ELABORACION DE OTROS PRODUCTOS QUIMICOS', 'C', '4', '1', 'A'), ('412048', 'ELABORACION DE FIBRAS', 'C', '4', '1', 'A'), ('412049', 'ELABORACION DE OTROS PRODUCTOS DE CAUCHO', 'C', '4', '1', 'A'), ('412050', 'ELABORACION DE PRODUCTOS DE PLASTICO', 'C', '4', '1', 'A'), ('412051', 'ELABORACION DE VIDRIO Y PRODUCTOS DE VIDRIO', 'C', '4', '1', 'A'), ('412052', 'ELABORACION DE PRODUCTOS DE CERAMICA, LOZA, PIEDRA, ARCILLA Y PORCELANA', 'C', '4', '1', 'A'), ('412053', 'ELABORACION DE CEMENTO, CAL Y YESO', 'C', '4', '1', 'A'), ('412054', 'ELABORACION DE ARTICULOS DE HORMIGON, CEMENTO Y YESO', 'C', '4', '1', 'A'), ('412055', 'CORTE, TALLADO Y ACABADO DE LA PIEDRA', 'C', '4', '1', 'A'), ('412056', 'ELABORACION DE OTROS PRODUCTOS MINERALES NO METALICOS', 'C', '4', '1', 'A'), ('412057', 'INDUSTRIAS BASICAS Y FUNDICION DE HIERRO Y ACERO', 'C', '4', '1', 'A'), ('412058', 'PRODUCTOS PRIMARIOS DE METALES PRECIOSOS Y DE METALES NO  FERROSOS', 'C', '4', '1', 'A'), ('412059', 'FUNDICION DE METALES NO FERROSOS', 'C', '4', '1', 'A'), ('412060', 'FABRICACION DE PRODUCTOS METALICOS PARA USO ESTRUCTURAL', 'C', '4', '1', 'A'), ('412061', 'FORJA, PRENSADO, ESTAMPADO, LAMINADO DE METAL Y PULVIMETALURGIA', 'C', '4', '1', 'A'), ('412062', 'REVESTIMIENTO DE METALES Y OBRAS DE INGENIERIA MECANICA', 'C', '4', '1', 'A'), ('412063', 'FABRICACION DE ARTICULOS DE FERRETERIA', 'C', '4', '1', 'A'), ('412064', 'ELABORACION DE OTROS PRODUCTOS DE METAL', 'C', '4', '1', 'A'), ('412065', 'FABRICACION DE MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A'), ('412066', 'FABRICACION DE EQUIPOS DE ELEVACION Y MANIPULACION', 'C', '4', '1', 'A'), ('412067', 'ELABORACION DE APARATOS DE USO DOMESTICO', 'C', '4', '1', 'A'), ('412068', 'ELABORACION DE EQUIPO DE OFICINA', 'C', '4', '1', 'A'), ('412069', 'ELABORACION DE PILAS Y BATERIAS PRIMARIAS', 'C', '4', '1', 'A'), ('412070', 'ELABORACION DE EQUIPO DE ILUMINACION', 'C', '4', '1', 'A'), ('412071', 'ELABORACION DE OTROS TIPOS DE EQUIPO ELECTRICO', 'C', '4', '1', 'A'), ('412072', 'FABRICACION DE EQUIPOS DE RADIO, TELEVISION Y COMUNICACIONES', 'C', '4', '1', 'A'), ('412073', 'FABRICACION DE APARATOS E INSTRUMENTOS MEDICOS', 'C', '4', '1', 'A'), ('412074', 'FABRICACION DE INSTRUMENTOS DE MEDICION Y CONTROL', 'C', '4', '1', 'A'), ('412075', 'FABRICACION DE INSTRUMENTOS DE OPTICA Y EQUIPO FOTOGRAFICO', 'C', '4', '1', 'A'), ('412076', 'FABRICACION DE RELOJES', 'C', '4', '1', 'A'), ('412077', 'FABRICACION DE VEHICULOS AUTOMOTORES', 'C', '4', '1', 'A'), ('412078', 'FABRICACION DE CARROCERIAS PARA AUTOMOTORES', 'C', '4', '1', 'A'), ('412079', 'FABRICACION DE PARTES PIEZAS Y ACCESORIOS PARA AUTOMOTORES', 'C', '4', '1', 'A'), ('412080', 'FABRICACION Y REPARACION DE BUQUES Y OTRAS EMBARCACIONES', 'C', '4', '1', 'A'), ('412081', 'FABRICACION DE LOCOMOTORAS Y MATERIAL RODANTE PARA  FERROCARRILES', 'C', '4', '1', 'A'), ('412082', 'FABRICACION DE AERONAVES', 'C', '4', '1', 'A'), ('412083', 'FABRICACION DE MOTOCICLETAS', 'C', '4', '1', 'A'), ('412084', 'FABRICACION DE BICICLETAS Y SILLAS DE RUEDAS', 'C', '4', '1', 'A'), ('412085', 'FABRICACION DE OTROS TIPOS DE TRANSPORTE', 'C', '4', '1', 'A'), ('412086', 'FABRICACION DE MUEBLES', 'C', '4', '1', 'A'), ('412087', 'FABRICACION DE JOYAS Y ARTICULOS CONEXOS', 'C', '4', '1', 'A'), ('412088', 'FABRICACION DE INSTRUMENTOS DE MUSICA', 'C', '4', '1', 'A'), ('412089', 'FABRICACION DE ARTICULOS Y EQUIPO PARA DEPORTE', 'C', '4', '1', 'A'), ('412090', 'FABRICACION DE JUEGOS Y JUGUETES', 'C', '4', '1', 'A'), ('412091', 'RECICLAMIENTO DE DESPERDICIOS', 'C', '4', '1', 'A'), ('412095', 'PRODUCTOS DE OTRAS INDUSTRIAS MANUFACTURERAS', 'C', '4', '1', 'A'), ('4125', 'SUMINISTRO DE ELECTRICIDAD, GAS Y AGUA', 'C', '3', '1', 'A'), ('412505', 'GENERACION, CAPTACION Y DISTRIBUCION DE ENERGIA ELECTRICA', 'C', '4', '1', 'A'), ('412510', 'FABRICACION DE GAS Y DISTRIBUCION DE COMBUSTIBLES GASEOSOS', 'C', '4', '1', 'A'), ('412515', 'CAPTACION, DEPURACION Y DISTRIBUCION DE AGUA', 'C', '4', '1', 'A'), ('412595', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A'), ('4130', 'CONSTRUCCION', 'C', '3', '1', 'A'), ('413005', 'PREPARACION DE TERRENOS', 'C', '4', '1', 'A'), ('413010', 'CONSTRUCCION DE EDIFICIOS Y OBRAS DE INGENIERIA CIVIL', 'C', '4', '1', 'A'), ('413015', 'ACONDICIONAMIENTO DE EDIFICIOS', 'C', '4', '1', 'A'), ('413020', 'TERMINACION DE EDIFICACIONES', 'C', '4', '1', 'A'), ('413025', 'ALQUILER DE EQUIPO CON OPERARIOS', 'C', '4', '1', 'A'), ('413095', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A'), ('4135', 'COMERCIO AL POR MAYOR Y AL POR MENOR', 'C', '3', '1', 'A'), ('413502', 'VENTA DE VEHICULOS AUTOMOTORES', 'C', '4', '1', 'A'), ('413504', 'MANTENIMIENTO, REPARACION Y LAVADO DE VEHICULOS AUTOMOTORES', 'C', '4', '1', 'A'), ('413506', 'VENTA DE PARTES, PIEZAS Y ACCESORIOS DE VEHICULOS AUTOMOTORES', 'C', '4', '1', 'A'), ('413508', 'VENTA DE COMBUSTIBLES SÓLIDOS, LIQUIDOS, GASEOSOS', 'C', '4', '1', 'A'), ('413510', 'VENTA DE LUBRICANTES, ADITIVOS, LLANTAS Y LUJOS PARA AUTOMOTORES', 'C', '4', '1', 'A'), ('413512', 'VENTA A CAMBIO DE RETRIBUCION O POR CONTRATA', 'C', '4', '1', 'A'), ('413514', 'VENTA DE INSUMOS, MATERIAS PRIMAS AGROPECUARIAS Y FLORES', 'C', '4', '1', 'A'), ('413516', 'VENTA DE OTROS INSUMOS Y MATERIAS PRIMAS NO AGROPECUARIAS', 'C', '4', '1', 'A'), ('413518', 'VENTA DE ANIMALES VIVOS Y CUEROS', 'C', '4', '1', 'A'), ('413520', 'VENTA DE PRODUCTOS EN ALMACENES NO ESPECIALIZADOS', 'C', '4', '1', 'A'), ('413522', 'VENTA DE PRODUCTOS AGROPECUARIOS', 'C', '4', '1', 'A'), ('413524', 'VENTA DE PRODUCTOS TEXTILES, DE VESTIR, DE CUERO Y CALZADO', 'C', '4', '1', 'A'), ('413526', 'VENTA DE PAPEL Y CARTON', 'C', '4', '1', 'A'), ('413528', 'VENTA DE LIBROS, REVISTAS, ELEMENTOS DE PAPELERIA, UTILES Y TEXTOS  ESCOLARES', 'C', '4', '1', 'A'), ('413530', 'VENTA DE JUEGOS, JUGUETES Y ARTICULOS DEPORTIVOS', 'C', '4', '1', 'A'), ('413532', 'VENTA DE INSTRUMENTOS QUIRURGICOS Y ORTOPEDICOS', 'C', '4', '1', 'A'), ('413534', 'VENTA DE ARTICULOS EN RELOJERIAS Y JOYERIAS', 'C', '4', '1', 'A'), ('413536', 'VENTA DE ELECTRODOMESTICOS Y MUEBLES', 'C', '4', '1', 'A'), ('413538', 'VENTA DE PRODUCTOS DE ASEO, FARMACEUTICOS, MEDICINALES, Y ARTICULOS DE TOCADOR', 'C', '4', '1', 'A'), ('413540', 'VENTA DE CUBIERTOS, VAJILLAS, CRISTALERIA, PORCELANAS, CERAMICAS Y  OTROS ARTICULOS DE', 'C', '4', '1', 'A'), ('413542', 'VENTA DE MATERIALES DE CONSTRUCCION, FONTANERIA Y CALEFACCIÓN.', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413544', 'VENTA DE PINTURAS Y LACAS', 'C', '4', '1', 'A'), ('413546', 'VENTA DE PRODUCTOS DE VIDRIOS Y MARQUETERIA', 'C', '4', '1', 'A'), ('413548', 'VENTA DE HERRAMIENTAS Y ARTICULOS DE FERRETERIA', 'C', '4', '1', 'A'), ('413550', 'VENTA DE QUIMICOS', 'C', '4', '1', 'A'), ('413552', 'VENTA DE PRODUCTOS INTERMEDIOS, DESPERDICIOS Y DESECHOS', 'C', '4', '1', 'A'), ('413554', 'VENTA DE MAQUINARIA, EQUIPO DE OFICINA Y PROGRAMAS DE COMPUTADOR', 'C', '4', '1', 'A'), ('413556', 'VENTA DE ARTICULOS EN CACHARRERIAS Y MISCELANEAS', 'C', '4', '1', 'A'), ('413558', 'VENTA DE INSTRUMENTOS MUSICALES', 'C', '4', '1', 'A'), ('413560', 'VENTA DE ARTICULOS EN CASAS DE EMPEÑO Y PRENDERIAS', 'C', '4', '1', 'A'), ('413562', 'VENTA DE EQUIPO FOTOGRAFICO', 'C', '4', '1', 'A'), ('413564', 'VENTA DE EQUIPO OPTICO Y DE PRECISION', 'C', '4', '1', 'A'), ('413566', 'VENTA DE EMPAQUES', 'C', '4', '1', 'A'), ('413568', 'VENTA DE EQUIPO PROFESIONAL Y CIENTIFICO', 'C', '4', '1', 'A'), ('413570', 'VENTA DE LOTERIAS, RIFAS, CHANCE, APUESTAS Y SIMILARES', 'C', '4', '1', 'A'), ('413572', 'REPARACION DE EFECTOS PERSONALES Y ELECTRODOMESTICOS', 'C', '4', '1', 'A'), ('413595', 'VENTA DE OTROS PRODUCTOS', 'C', '4', '1', 'A'), ('4140', 'HOTELES Y RESTAURANTES', 'C', '3', '1', 'A'), ('414005', 'HOTELERIA', 'C', '4', '1', 'A'), ('414010', 'CAMPAMENTO Y OTROS TIPOS DE HOSPEDAJE', 'C', '4', '1', 'A'), ('414015', 'RESTAURANTES', 'C', '4', '1', 'A'), ('414020', 'BARES Y CANTINAS', 'C', '4', '1', 'A'), ('414095', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A'), ('4145', 'TRANSPORTE, ALMACENAMIENTO Y COMUNICACIONES', 'C', '3', '1', 'A'), ('414505', 'SERVICIO DE TRANSPORTE POR CARRETERA', 'C', '4', '1', 'A'), ('414510', 'SERVICIO DE TRANSPORTE POR VIA FERREA', 'C', '4', '1', 'A'), ('414515', 'SERVICIO DE TRANSPORTE POR VIA ACUATICA', 'C', '4', '1', 'A'), ('414520', 'SERVICIO DE TRANSPORTE POR VIA AEREA', 'C', '4', '1', 'A'), ('414525', 'SERVICIO DE TRANSPORTE POR TUBERIAS', 'C', '4', '1', 'A'), ('414530', 'MANIPULACION DE CARGA', 'C', '4', '1', 'A'), ('414535', 'ALMACENAMIENTO Y DEPÓSITO', 'C', '4', '1', 'A'), ('414540', 'SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE', 'C', '4', '1', 'A'), ('414545', 'AGENCIAS DE VIAJE', 'C', '4', '1', 'A'), ('414550', 'OTRAS AGENCIAS DE TRANSPORTE', 'C', '4', '1', 'A'), ('414555', 'SERVICIO POSTAL Y DE CORREO', 'C', '4', '1', 'A'), ('414560', 'SERVICIO TELEFONICO', 'C', '4', '1', 'A'), ('414565', 'SERVICIO DE TELEGRAFO', 'C', '4', '1', 'A'), ('414570', 'SERVICIO DE TRANSMISION DE DATOS', 'C', '4', '1', 'A'), ('414575', 'SERVICIO DE RADIO Y TELEVISION POR CABLE', 'C', '4', '1', 'A'), ('414580', 'TRANSMISION DE SONIDO E IMAGENES POR CONTRATO', 'C', '4', '1', 'A'), ('414595', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A'), ('4150', 'ACTIVIDAD FINANCIERA', 'C', '3', '1', 'A'), ('415005', 'INTERESES CREDITOS COMERCIALES', 'C', '4', '1', 'A'), ('415010', 'INTERESES CREDITOS CONSUMO', 'C', '4', '1', 'A'), ('415015', 'INTERESES CREDITOS VIVIENDA', 'C', '4', '1', 'A'), ('415016', 'INTERESES MICROCREDITO INMOBILIARIO', 'C', '4', '1', 'A'), ('415017', 'INTERESES MICROCREDITO EMPRESARIAL', 'C', '4', '1', 'A'), ('415018', 'REAJUSTE MONETARIO VIVIENDA (U.V.R.)', 'C', '4', '1', 'A'), ('415020', 'UTILIDAD EN VENTA TITULOS NEGOCIABLES DE DEUDA', 'C', '4', '1', 'A'), ('415022', 'UTILIDAD EN VENTA TITULOS NEGOCIABLES  DE PATICIPACIÓN', 'C', '4', '1', 'A'), ('415024', 'UTILIDAD EN VENTA TITULOS PARA MANTENER HASTA EL VENCIMIENTO', 'C', '4', '1', 'A'), ('415025', 'UTILIDAD EN VENTA DE INVERSIONES DISP0NIBLE PARA LA VENTA', 'C', '4', '1', 'A'), ('415026', 'UTILIDAD EN VENTA EN INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE DEUDA.', 'C', '4', '1', 'A'), ('415028', 'UTILIDAD EN VENTA EN INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE  PARTICIPACIÓN.', 'C', '4', '1', 'A'), ('415040', 'INTERESES TITULO E INVERSIÓN EN CIRCULACION', 'C', '4', '1', 'A'), ('415045', 'INTERESES GANADOS FOGACOOP', 'C', '4', '1', 'A'), ('415046', 'INTERESES FONDO DE LIQUIDEZ', 'C', '4', '1', 'A'), ('415048', 'DIVIDENDOS, PARTICIPACIONES Y RETORNOS', 'C', '4', '1', 'A'), ('415060', 'COMISIONES Y/O HONORARIOS', 'C', '4', '1', 'A'), ('415070', 'UTILIDAD EN VENTA DE CARTERA', 'C', '4', '1', 'A'), ('415075', 'DIFERENCIA EN CAMBIO', 'C', '4', '1', 'A'), ('415080', 'PACTO DE REAJUSTE', 'C', '4', '1', 'A'), ('415081', 'INTERESES COMPROMISOS REVENTA DE INVERSIONES', 'C', '4', '1', 'A'), ('415082', 'INTERESES COMPROMISOS REVENTA DE CARTERA', 'C', '4', '1', 'A'), ('415083', 'INTERESES DE INVERSIONES', 'C', '4', '1', 'A'), ('415098', 'OTROS INGRESOS FINANCIEROS', 'C', '4', '1', 'A'), ('4151', 'UTILIDAD EN VALORACION DE INVERSIONES NEGOCIABLES EN TITULOS DE DEUDA', 'C', '3', '1', 'A'), ('415106', 'POR INCREMENTO EN EL VALOR DE MERCADO (CR)', 'C', '4', '1', 'A'), ('415112', 'POR DISMINUCION EN EL VALOR DE MERCADO (DB)', 'C', '4', '1', 'A'), ('4152', 'UTILIDAD EN VALORACION DE INVERSIONES NEGOCIABLES EN TITULOS PARTICIPATIVOS', 'C', '3', '1', 'A'), ('415206', 'POR INCREMENTO EN EL VALOR DE MERCADO (CR)', 'C', '4', '1', 'A'), ('415211', 'POR DISMINUCION EN EL VALOR DE MERCADO (DB)', 'C', '4', '1', 'A'), ('4153', 'UTILIDAD EN VALORACION DE INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS DE DEUDA', 'C', '3', '1', 'A'), ('415306', 'POR INCREMENTO EN EL VALOR PRESENTE (CR)', 'C', '4', '1', 'A'), ('415312', 'POR DISMINUCION EN EL VALOR PRESENTE (DB)', 'C', '4', '1', 'A'), ('4154', 'UTILIDAD EN VALORACION INVERSIONES PARA MANTENER HASTA EL VENCIMIENTO', 'C', '3', '1', 'A'), ('415406', 'POR INCREMENTO EN EL VALOR PRESENTE (CR)', 'C', '4', '1', 'A'), ('415412', 'POR DISMINUCION EN EL VALOR PRESENTE (DB)', 'C', '4', '1', 'A'), ('4155', 'ACTIVIDADES INMOBILIARIAS, EMPRESARIALES Y DE ALQUILER', 'C', '3', '1', 'A'), ('415505', 'ARRENDAMIENTOS DE BIENES INMUEBLES', 'C', '4', '1', 'A'), ('415510', 'INMOBILIARIAS POR RETRIBUCION O CONTRATA', 'C', '4', '1', 'A'), ('415515', 'ALQUILER EQUIPO DE TRANSPORTE', 'C', '4', '1', 'A'), ('415520', 'ALQUILER MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A'), ('415525', 'ALQUILER DE EFECTOS PERSONALES Y ENSERES DOMESTICOS', 'C', '4', '1', 'A'), ('415530', 'CONSULTORIA EN EQUIPO Y PROGRAMAS DE INFORMATICA', 'C', '4', '1', 'A'), ('415535', 'PROCESAMIENTO DE DATOS', 'C', '4', '1', 'A'), ('415540', 'MANTENIMIENTO Y REPARACION DE MAQUINARIA DE OFICINA', 'C', '4', '1', 'A'), ('415545', 'INVESTIGACIONES CIENTIFICAS Y DE DESARROLLO', 'C', '4', '1', 'A'), ('415550', 'ACTIVIDADES EMPRESARIALES DE CONSULTORIA', 'C', '4', '1', 'A'), ('415555', 'PUBLICIDAD', 'C', '4', '1', 'A'), ('415560', 'DOTACION DE PERSONAL', 'C', '4', '1', 'A'), ('415565', 'INVESTIGACION Y SEGURIDAD', 'C', '4', '1', 'A'), ('415570', 'ASEO, LIMPIEZA DE INMUEBLES', 'C', '4', '1', 'A'), ('415575', 'FOTOGRAFIA', 'C', '4', '1', 'A'), ('415580', 'ENVASE Y EMPAQUE', 'C', '4', '1', 'A'), ('415585', 'FOTOCOPIADO Y MICROFILMACION', 'C', '4', '1', 'A'), ('415590', 'MANTENIMIENTO Y REPARACION DE MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A'), ('415595', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A'), ('4160', 'ENSEÑANZA', 'C', '3', '1', 'A'), ('416005', 'ACTIVIDADES RELACIONADAS CON LA EDUCACIÓN', 'C', '4', '1', 'A'), ('416010', 'CERTIFICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416015', 'FORMULARIOS', 'C', '4', '1', 'A'), ('416020', 'VALOR DERECHOS', 'C', '4', '1', 'A'), ('416025', 'PAZ Y SALVO', 'C', '4', '1', 'A'), ('416095', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A'), ('4165', 'SERVICIOS SOCIALES Y DE SALUD', 'C', '3', '1', 'A'), ('416505', 'SERVICIO HOSPITALARIO', 'C', '4', '1', 'A'), ('416510', 'SERVICIO MEDICO', 'C', '4', '1', 'A'), ('416515', 'SERVICIO ODONTOLOGICO', 'C', '4', '1', 'A'), ('416520', 'SERVICIO DE LABORATORIO', 'C', '4', '1', 'A'), ('416525', 'ACTIVIDADES VETERINARIAS', 'C', '4', '1', 'A'), ('416530', 'ACTIVIDADES DE SERVICIOS SOCIALES', 'C', '4', '1', 'A'), ('416535', 'CUOTAS DE ADMINISTRACIÓN Y/O ASOCIACION', 'C', '4', '1', 'A'), ('416540', 'CUOTAS DE ADMINISTRACIÓN Y SOSTENIMIENTO', 'C', '4', '1', 'A'), ('416545', 'SERVICIOS DE PREVISIÓN Y SEGURIDAD SOCIAL', 'C', '4', '1', 'A'), ('416595', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A'), ('4170', 'OTRAS ACTIVIDADES DE SERVICIOS COMUNES, SOCIALES Y PERSONALES.', 'C', '3', '1', 'A'), ('417005', 'ELIMINACION DE DESPERDICIOS Y AGUAS RESIDUALES', 'C', '4', '1', 'A'), ('417010', 'ACTIVIDADES DE ASOCIACION', 'C', '4', '1', 'A'), ('417015', 'PRODUCCION Y DISTRIBUCION DE FILMES Y VIDEOCINTAS', 'C', '4', '1', 'A'), ('417020', 'EXHIBICION DE FILMES Y VIDEOCINTAS', 'C', '4', '1', 'A'), ('417025', 'ACTIVIDAD DE RADIO Y TELEVISION', 'C', '4', '1', 'A'), ('417030', 'ACTIVIDAD TEATRAL, MUSICAL Y ARTISTICA', 'C', '4', '1', 'A'), ('417035', 'GRABACION Y PRODUCCION DE DISCOS', 'C', '4', '1', 'A'), ('417040', 'ENTRETENIMIENTO Y ESPARCIMIENTO', 'C', '4', '1', 'A'), ('417045', 'AGENCIAS DE NOTICIAS', 'C', '4', '1', 'A'), ('417050', 'LAVANDERIAS Y SIMILARES', 'C', '4', '1', 'A'), ('417055', 'PELUQUERIAS Y SIMILARES', 'C', '4', '1', 'A'), ('417060', 'SERVICIOS FUNERARIOS', 'C', '4', '1', 'A'), ('417062', 'VIGILANCIA Y SEGURIDAD PRIVADA', 'C', '4', '1', 'A'), ('417065', 'ZONAS FRANCAS', 'C', '4', '1', 'A'), ('417070', 'SERVICIOS DE ASISTENCIA TÉCNICA', 'C', '4', '1', 'A'), ('417072', 'SERVICIOS EN SISTEMAS O COMPUTACIÓN', 'C', '4', '1', 'A'), ('417075', 'SERVICIO DE ASESORIAS FINANCIERAS', 'C', '4', '1', 'A'), ('417080', 'SERVICIO DE REVISORIAS Y AUDITORIAS', 'C', '4', '1', 'A'), ('417082', 'SERVICIO DE ASESORIA JURÍDICA', 'C', '4', '1', 'A'), ('417085', 'SERVICIO DE BÁSCULA', 'C', '4', '1', 'A'), ('417088', 'SERVICIO DE TRILLA', 'C', '4', '1', 'A'), ('417089', 'SERVICIO DE ARCHIVO', 'C', '4', '1', 'A'), ('417095', 'OTROS SERVICIOS', 'C', '4', '1', 'A'), ('41709501', 'OTROS SERVICIOS MANDATOS COOPERATIVOS', 'C', '5', '0', 'A'), ('4175', 'DEVOLUCIONES, REBAJAS Y DESCUENTOS EN VENTAS (DB)', 'C', '3', '1', 'A'), ('417501', 'DEVOLUCIONES REBAJAS Y DESCUENTOS', 'C', '4', '0', 'A'), ('41750101', 'DEVOLUCIONES, REBAJAS Y DESCUENTOS', 'C', '5', '0', 'A'), ('41750105', 'DEVOLUCIONES, REBAJAS Y DESCUENTOS INT.CESANTIAS', 'C', '5', '1', 'A'), ('4180', 'RECUPERACIONES', 'C', '3', '1', 'A'), ('418015', 'REINTEGRO PROVISIÓN CARTERA DE CREDITO- COMERCIAL', 'C', '4', '1', 'A'), ('418016', 'REINTEGRO PROVISIÓN CARTERA DE CREDITO- CONSUMO', 'C', '4', '1', 'A'), ('41801601', 'REINTEGRO PROVISION CARTERA DE CONSUMO', 'C', '5', '0', 'A'), ('418017', 'REINTEGRO PROVISIÓN CARTERA DE CREDITO - VIVIENDA', 'C', '4', '1', 'A'), ('418018', 'REINTEGRO PROVISIÓN CARTERA DE CREDITO - MICROCREDITO', 'C', '4', '1', 'A'), ('418020', 'REINTEGRO PROVISION DEUDORES POR VENTA DE BIENES', 'C', '4', '1', 'A'), ('418025', 'REINTEGRO PROVISIÓN DEUDORES POR PRESTACIÓN DE SERVICIOS', 'C', '4', '1', 'A'), ('418027', 'REINTEGRO PROVISIÓN BIENES RECIBIDOS EN PAGO', 'C', '4', '1', 'A'), ('418028', 'PROVISION DE INTERESES', 'C', '4', '0', 'A'), ('41802801', 'PROVISION DE INTERESES', 'C', '5', '0', 'A'), ('4185', 'SERVICIO DE CREDITO', 'C', '3', '1', 'A'), ('418505', 'INTERESES CREDITOS COMERCIAL', 'C', '4', '1', 'A'), ('418510', 'INTERESES CREDITOS CONSUMO', 'C', '4', '1', 'A'), ('41851001', 'INTERESES CREDITO CONSUMO', 'C', '5', '0', 'A'), ('41851004', 'INTERES LIBRANZAS COOP', 'C', '5', '0', 'A'), ('418515', 'INTERESES CREDITOS DE VIVIENDA', 'C', '4', '1', 'A'), ('418516', 'INTERESES MICROCREDITO EMPRESARIAL', 'C', '4', '1', 'A'), ('418517', 'INTERESES MICROCREDITO INMOBILIARIO', 'C', '4', '1', 'A'), ('418518', 'REAJUSTE MONETARIO VIVIENDA ( U.V.R.)', 'C', '4', '1', 'A'), ('418519', 'INTERESES INVERSIONES NEGOCIABLES EN TITULOS DE DEUDA', 'C', '4', '1', 'A'), ('418521', 'INTERESES INVERSIONES NEGOCIABLES EN TITULOS PARTICIPATIVOS', 'C', '4', '1', 'A'), ('418522', 'INTERESES INVERSIONES DISPONIBLES PARA LA VENTA', 'C', '4', '1', 'A'), ('418523', 'INTERESES INVERSIONES PARA MANTENER HASTA EL VENCIMIENTO', 'C', '4', '1', 'A'), ('418525', 'INTERESES COMPROMISOS DE REVENTA DE INVERSIONES', 'C', '4', '1', 'A'), ('418530', 'INTERESES COMPROMISOS DE REVENTA DE CARTERA', 'C', '4', '1', 'A'), ('418540', 'INTERESES GANADOS FOGACOOP', 'C', '4', '1', 'A'), ('418542', 'INTERESES DEUDORES POR VENTA DE BIENES', 'C', '4', '1', 'A'), ('418543', 'INTERESES DEUDORES POR PRESTACIÓN DE SERVICIOS', 'C', '4', '1', 'A'), ('418545', 'INTERESES VARIOS', 'C', '4', '1', 'A'), ('418546', 'INTERESES FONDO DE LIQUIDEZ', 'C', '4', '1', 'A'), ('418550', 'VALORACION INVERSIONES TEMPORALES', 'C', '4', '1', 'A'), ('418555', 'VALORACION INVERSIONES PERMANENTES', 'C', '4', '1', 'A'), ('418560', 'COMISIONES Y/O HONORARIOS', 'C', '4', '1', 'A'), ('41856001', 'COMISIONES 5*%', 'C', '5', '0', 'A'), ('418565', 'UTILIDAD EN VENTAS DE INVERSIONES', 'C', '4', '1', 'A'), ('418570', 'UTILIDAD EN VENTA DE CARTERA', 'C', '4', '1', 'A'), ('418575', 'DIFERENCIA EN CAMBIOS', 'C', '4', '1', 'A'), ('418580', 'PACTO DE REAJUSTE', 'C', '4', '1', 'A'), ('418598', 'OTROS INGRESOS DE SERVICIO DE CREDITO', 'C', '4', '1', 'A'), ('41859801', 'OTROS INGRESOS SERVICIO DE CREDITO SANCION PREPAGO', 'C', '5', '0', 'A'), ('41859802', 'INTERES POR MORA', 'C', '5', '0', 'A'), ('4190', 'ADMINISTRATIVOS Y SOCIALES', 'C', '3', '1', 'A'), ('419005', 'CUOTAS DE ADMISIÓN Y/O AFILIACION', 'C', '4', '1', 'A'), ('41900501', 'CUOTAS DE ADMISION Y/O AFILIACION', 'C', '5', '0', 'A'), ('419010', 'CUOTAS DE ADMINISTRACIÓN Y SOSTENIMIENTO', 'C', '4', '1', 'A'), ('419015', 'CUOTAS POR SERVICIOS DE PREVISIÓN Y SEGURIDAD SOCIAL', 'C', '4', '1', 'A'), ('41901501', 'PREVISION Y SEG. SOCIAL                                                          ', 'C', '5', '1', 'A'), ('41901502', 'SERVICIOS SALUD ORAL', 'C', '5', '0', 'A'), ('41901503', 'SERVICIO DE SALUD ORAL', 'C', '5', '0', 'A'), ('41901504', 'SERVICIO DE RECREACION Y CULTURA', 'C', '5', '0', 'A'), ('41901505', 'SERVICIO DE TURISMO', 'C', '5', '0', 'A'), ('419090', 'OTROS INGRESOS ADMINISTRATIVOS', 'C', '4', '1', 'A'), ('42', 'NO OPERACIONALES', 'C', '2', '1', 'A'), ('4205', 'OTRAS VENTAS', 'C', '3', '1', 'A'), ('420505', 'MATERIA PRIMA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420510', 'MATERIAL DE DESECHO', 'C', '4', '1', 'A'), ('420515', 'MATERIALES VARIOS', 'C', '4', '1', 'A'), ('420520', 'PRODUCTOS DE DIVERSIFICACION', 'C', '4', '1', 'A'), ('420525', 'EXCEDENTES DE EXPORTACION', 'C', '4', '1', 'A'), ('420530', 'ENVASES Y EMPAQUES', 'C', '4', '1', 'A'), ('420535', 'PRODUCTOS AGRICOLAS', 'C', '4', '1', 'A'), ('420540', 'DE PROPAGANDA', 'C', '4', '1', 'A'), ('420545', 'PRODUCTOS EN REMATE', 'C', '4', '1', 'A'), ('420550', 'COMBUSTIBLES Y LUBRICANTES', 'C', '4', '1', 'A'), ('4210', 'FINANCIEROS', 'C', '3', '1', 'A'), ('421005', 'INTERESES VARIOS', 'C', '4', '1', 'A'), ('42100501', 'INTERESES VARIOS                                                                 ', 'C', '5', '0', 'A'), ('42100502', 'INTERESES POR MORA                                                               ', 'C', '5', '0', 'A'), ('42100503', 'RENDIMIENTOS FINANCIEROS', 'C', '5', '0', 'A'), ('421010', 'REAJUSTE MONETARIO    UVR', 'C', '4', '1', 'A'), ('421015', 'DESCUENTOS AMORTIZADOS', 'C', '4', '1', 'A'), ('421020', 'DIFERENCIA EN CAMBIO', 'C', '4', '1', 'A'), ('421025', 'FINANCIACION VEHICULOS', 'C', '4', '1', 'A'), ('421030', 'FINANCIACION SISTEMAS DE VIAJES', 'C', '4', '1', 'A'), ('421035', 'FINANCIACIÓN VENTAS A CREDITO', 'C', '4', '1', 'A'), ('421040', 'COMISIONES VARIAS', 'C', '4', '1', 'A'), ('421045', 'PACTO DE  REAJUSTE', 'C', '4', '1', 'A'), ('421050', 'INTERESES CARTERA DE  POR VENTA DE BIENES Y SERVICIOS', 'C', '4', '1', 'A'), ('421098', 'OTROS', 'C', '4', '1', 'A'), ('4215', 'DIVIDENDOS, PARTICIPACIONES Y EXCEDENTES', 'C', '3', '1', 'A'), ('421505', 'DE SOCIEDADES ANONIMAS Y/O ASIMILADAS', 'C', '4', '1', 'A'), ('421510', 'DE SOCIEDADES LIMITADAS Y/O ASIMILADAS', 'C', '4', '1', 'A'), ('421515', 'DE ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A'), ('4220', 'ARRENDAMIENTOS', 'C', '3', '1', 'A'), ('422005', 'TERRENOS', 'C', '4', '1', 'A'), ('422010', 'EDIFICACIONES', 'C', '4', '1', 'A'), ('422015', 'MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A'), ('422020', 'MUEBLES Y EQUIPO DE OFICINA', 'C', '4', '1', 'A'), ('422025', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'C', '4', '1', 'A'), ('422030', 'EQUIPO MEDICO - CIENTIFICO', 'C', '4', '1', 'A'), ('422035', 'EQUIPO DE HOTELES Y RESTAURANTES', 'C', '4', '1', 'A'), ('422040', 'ENVASES Y EMPAQUES', 'C', '4', '1', 'A'), ('422045', 'VEHICULOS', 'C', '4', '1', 'A'), ('422050', 'ARTICULOS DE VIGILANCIA', 'C', '4', '1', 'A'), ('422055', 'ELEMENTOS DIDÁCTICOS', 'C', '4', '1', 'A'), ('422060', 'MAUSOLEOS', 'C', '4', '1', 'A'), ('422065', 'SEMOVIENTES', 'C', '4', '1', 'A'), ('422070', 'OTROS BIENES', 'C', '4', '1', 'A'), ('4225', 'COMISIONES', 'C', '3', '1', 'A'), ('422505', 'SOBRE  INVERSIONES', 'C', '4', '1', 'A'), ('422510', 'DE CONCESIONARIOS', 'C', '4', '1', 'A'), ('422515', 'DE ACTIVIDADES FINANCIERAS', 'C', '4', '1', 'A'), ('422520', 'POR VENTA DE SERVICIOS DE TALLER', 'C', '4', '1', 'A'), ('422525', 'POR VENTA DE SEGUROS', 'C', '4', '1', 'A'), ('422530', 'POR INGRESOS PARA TERCEROS', 'C', '4', '1', 'A'), ('422535', 'POR DISTRIBUCION DE PELICULAS', 'C', '4', '1', 'A'), ('422540', 'DERECHOS DE AUTOR', 'C', '4', '1', 'A'), ('422545', 'DERECHOS DE PROGRAMACION', 'C', '4', '1', 'A'), ('4230', 'HONORARIOS', 'C', '3', '1', 'A'), ('423005', 'ASESORIAS', 'C', '4', '1', 'A'), ('423010', 'ASISTENCIA TECNICA', 'C', '4', '1', 'A'), ('423015', 'ADMINISTRACION DE VINCULADAS', 'C', '4', '1', 'A'), ('4235', 'SERVICIOS', 'C', '3', '1', 'A'), ('423505', 'DE BÁSCULA', 'C', '4', '1', 'A'), ('423510', 'DE TRANSPORTE', 'C', '4', '1', 'A'), ('423515', 'DE PRENSA', 'C', '4', '1', 'A'), ('423520', 'ADMINISTRATIVOS', 'C', '4', '1', 'A'), ('423525', 'TECNICOS', 'C', '4', '1', 'A'), ('423530', 'DE COMPUTACION', 'C', '4', '1', 'A'), ('423535', 'DE TELEFAX', 'C', '4', '1', 'A'), ('423540', 'TALLER DE VEHICULOS', 'C', '4', '1', 'A'), ('423545', 'DE RECEPCION DE AERONAVES', 'C', '4', '1', 'A'), ('423550', 'DE TRANSPORTE PROGRAMA GAS NATURAL', 'C', '4', '1', 'A'), ('423555', 'POR CONTRATOS', 'C', '4', '1', 'A'), ('423560', 'DE TRILLLA', 'C', '4', '1', 'A'), ('423565', 'DE MANTENIMIENTO', 'C', '4', '1', 'A'), ('423570', 'AL PERSONAL', 'C', '4', '1', 'A'), ('423575', 'DE CASINO', 'C', '4', '1', 'A'), ('423580', 'FLETES', 'C', '4', '1', 'A'), ('423585', 'ENTRE COMPAÑIAS', 'C', '4', '1', 'A'), ('423595', 'OTROS', 'C', '4', '1', 'A'), ('4240', 'UTILIDAD EN VENTA DE INVERSIONES', 'C', '3', '1', 'A'), ('424010', 'FONDO DE LIQUIDEZ', 'C', '4', '1', 'A'), ('424019', 'UTILIDAD EN VENTA TITULOS NEGOCIABLES DE DEUDA', 'C', '4', '1', 'A'), ('424021', 'UTILIDAD EN VENTA TITULOS NEGOCIABLES  DE PATICIPACIÓN', 'C', '4', '1', 'A'), ('424022', 'UTILIDAD EN VENTA TITULOS PARA MANTENER HASTA EL VENCIMIENTO', 'C', '4', '1', 'A'), ('424023', 'UTILIDAD EN VENTA DE INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE DEUDA.', 'C', '4', '1', 'A'), ('424024', 'UTILIDAD EN VENTA DE INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE  PARTICIPACIÓN.', 'C', '4', '1', 'A'), ('424095', 'OTRAS', 'C', '4', '1', 'A'), ('4245', 'UTILIDAD EN VENTA DE PROPIEDADES PLANTA Y EQUIPO', 'C', '3', '1', 'A'), ('424504', 'TERRENOS', 'C', '4', '1', 'A'), ('424508', 'CONSTRUCCIONES  O MONTAJES EN  CURSO', 'C', '4', '1', 'A'), ('424516', 'EDIFICACIONES', 'C', '4', '1', 'A'), ('424524', 'MUEBLES Y EQUIPO DE OFICINA', 'C', '4', '1', 'A'), ('424528', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'C', '4', '1', 'A'), ('424532', 'VEHICULOS', 'C', '4', '1', 'A'), ('424536', 'ARMAMENTO DE VIGILANCIA', 'C', '4', '1', 'A'), ('424540', 'PLANTACIONES AGRÍCOLAS Y FORESTALES', 'C', '4', '1', 'A'), ('424545', 'MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A'), ('424548', 'PROPIEDADES EN TRANSITO', 'C', '4', '1', 'A'), ('424552', 'SEMOVIENTES', 'C', '4', '1', 'A'), ('424556', 'MAUSOLEOS', 'C', '4', '1', 'A'), ('424558', 'ENVASES Y EMPAQUES', 'C', '4', '1', 'A'), ('424560', 'ELEMENTOS DIDACTICOS', 'C', '4', '1', 'A'), ('424564', 'RECURSOS NATURALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424565', 'EQUIPO MEDICOS - CIENTIFICOS', 'C', '4', '1', 'A'), ('4248', 'UTILIDAD EN VENTA DE OTROS BIENES', 'C', '3', '1', 'A'), ('424805', 'INTANGIBLES', 'C', '4', '1', 'A'), ('424810', 'BIENES RECIBIDOS EN PAGO', 'C', '4', '1', 'A'), ('424815', 'OTROS ACTIVOS', 'C', '4', '1', 'A'), ('4250', 'RECUPERACIONES', 'C', '3', '1', 'A'), ('425005', 'DEUDAS CASTIGADAS', 'C', '4', '1', 'A'), ('42500501', 'DEUDAS CASTIGADAS', 'C', '5', '1', 'A'), ('425010', 'SEGUROS', 'C', '4', '1', 'A'), ('425015', 'RECLAMOS', 'C', '4', '1', 'A'), ('425020', 'REINTEGRO POR PERSONAL EN COMISION', 'C', '4', '1', 'A'), ('425025', 'REINTEGRO GARANTIAS', 'C', '4', '1', 'A'), ('425030', 'DESCUENTOS CONCEDIDOS', 'C', '4', '1', 'A'), ('425035', 'REINTEGRO PROVISIONES DE INVERSIONES', 'C', '4', '1', 'A'), ('425036', 'EINTEGRO PROVISIONES DE CARTERA', 'C', '4', '1', 'A'), ('425037', 'REINTEGRO PROVISIONES DE CUENTAS POR COBRAR', 'C', '4', '1', 'A'), ('425038', 'REINTEGRO PROVISIONES DE BIENES RECIBIDOS EN PAGO', 'C', '4', '1', 'A'), ('425040', 'GASTOS BANCARIOS', 'C', '4', '1', 'A'), ('425045', 'REINTEGRO DE DEPRECIACION', 'C', '4', '1', 'A'), ('425050', 'REINTEGRO DE OTROS COSTOS Y GASTOS', 'C', '4', '1', 'A'), ('42505001', 'REINTEGRO DE OTROS COSTOS Y GASTOS', 'C', '5', '0', 'A'), ('425055', 'REINTEGRO PROVISIONES DE CAPITAL GARANTIA', 'C', '4', '1', 'A'), ('4255', 'INDEMNIZACIONES', 'C', '3', '1', 'A'), ('425505', 'POR SINIESTRO', 'C', '4', '1', 'A'), ('42550501', 'SEGUROS DEL ESTADO', 'C', '5', '0', 'A'), ('425510', 'POR SUMINISTROS', 'C', '4', '1', 'A'), ('425515', 'LUCRO CESANTE COMPAÑIAS DE SEGUROS', 'C', '4', '1', 'A'), ('425520', 'DAÑO EMERGENTE COMPAÑIAS DE SEGUROS', 'C', '4', '1', 'A'), ('425525', 'POR PERDIDA DE MERCANCIA', 'C', '4', '1', 'A'), ('425530', 'POR INCUMPLIMIENTO DE CONTRATOS', 'C', '4', '1', 'A'), ('425535', 'DE TERCEROS', 'C', '4', '1', 'A'), ('425540', 'POR INCAPACIDADES.', 'C', '4', '1', 'A'), ('425595', 'OTRAS', 'C', '4', '1', 'A'), ('4260', 'PARTICIPACIONES EN CONCESIONES', 'C', '3', '1', 'A'), ('4275', 'DEVOLUCIONES, REBAJAS Y DESCUENTOS EN OTRAS VENTAS (DB)', 'C', '3', '1', 'A'), ('4295', 'DIVERSOS', 'C', '3', '1', 'A'), ('429503', 'CERT', 'C', '4', '1', 'A'), ('429505', 'APROVECHAMIENTOS', 'C', '4', '1', 'A'), ('42950501', 'APROVECHAMIENTOS                                                                 ', 'C', '5', '0', 'A'), ('42950502', 'CERTIFICADOS                                                                     ', 'C', '5', '0', 'A'), ('42950503', 'OTROS INGRESOS', 'C', '5', '0', 'A'), ('42950504', 'OTROS INGRESOS EN LIBRANZAS', 'C', '5', '0', 'A'), ('42950505', 'INCENTIVO EN PAGO PUNTUAL - SINCELEJO', 'C', '5', '0', 'A'), ('42950506', 'DEVOLUCIONES DESCUENTOS Y REBAJAS', 'C', '5', '0', 'A'), ('42950507', 'OTROS INGRESOS EN CONVENIOS', 'C', '5', '0', 'A'), ('42950508', 'INCENTIVO PAGO PUNTUAL CARTAGENA', 'C', '5', '0', 'A'), ('42950509', 'DESCUENTOS RECIBIDOS EN CUOTAS DE ADMINISTRACION', 'C', '5', '0', 'A'), ('429507', 'AUXILIOS', 'C', '4', '1', 'A'), ('429509', 'DONACIONES O SUBVENCIONES', 'C', '4', '1', 'A'), ('429511', 'INGRESOS POR INVESTIGACION Y DESARROLLO', 'C', '4', '1', 'A'), ('429513', 'POR TRABAJOS EJECUTADOS', 'C', '4', '1', 'A'), ('429515', 'REGALIAS', 'C', '4', '1', 'A'), ('429517', 'DERIVADOS DE LAS EXPORTACIONES', 'C', '4', '1', 'A'), ('429519', 'OTROS INGRESOS DE EXPLOTACION', 'C', '4', '1', 'A'), ('429521', 'DE LA ACTIVIDAD GANADERA', 'C', '4', '1', 'A'), ('429525', 'DERECHOS Y LICITACIONES', 'C', '4', '1', 'A'), ('429530', 'INGRESOS POR ELEMENTOS PERDIDOS', 'C', '4', '1', 'A'), ('429533', 'MULTAS Y RECARGOS', 'C', '4', '1', 'A'), ('429535', 'PREAVISOS DESCONTADOS', 'C', '4', '1', 'A'), ('429537', 'RECLAMOS', 'C', '4', '1', 'A'), ('429540', 'RECOBRO DE DAÑOS', 'C', '4', '1', 'A'), ('429543', 'PREMIOS', 'C', '4', '1', 'A'), ('429545', 'BONIFICACIONES', 'C', '4', '1', 'A'), ('429547', 'PRODUCTOS DESCONTADOS', 'C', '4', '1', 'A'), ('429549', 'RECONOCIMIENTOS  EPS.', 'C', '4', '1', 'A'), ('429551', 'EXCEDENTES', 'C', '4', '1', 'A'), ('429553', 'SOBRANTES DE CAJA MENOR', 'C', '4', '1', 'A'), ('429555', 'SOBRANTES EN LIQUIDACION FLETES', 'C', '4', '1', 'A'), ('429557', 'SUBSIDIOS ESTATALES', 'C', '4', '1', 'A'), ('429559', 'CAPACITACION DISTRIBUIDORES', 'C', '4', '1', 'A'), ('429561', 'DE ESCRITURACION', 'C', '4', '1', 'A'), ('429563', 'REGISTRO PROMESAS DE VENTA', 'C', '4', '1', 'A'), ('429567', 'UTILES, PAPELERIA Y FOTOCOPIAS', 'C', '4', '1', 'A'), ('429571', 'RESULTADOS MATRICULAS Y TRASPASOS', 'C', '4', '1', 'A'), ('429573', 'DECORACIONES', 'C', '4', '1', 'A'), ('429575', 'MANEJO DE CARGA', 'C', '4', '1', 'A'), ('429579', 'HISTORIA CLINICA', 'C', '4', '1', 'A'), ('429581', 'AJUSTE AL PESO', 'C', '4', '1', 'A'), ('42958101', 'AJUSTE AL PESO', 'C', '5', '0', 'A'), ('429583', 'LLAMADAS TELEFONICAS', 'C', '4', '1', 'A'), ('43', 'INGRESOS DE EJERCICIOS ANTERIORES', 'C', '2', '1', 'A'), ('4305', 'INGRESOS DE EJERCICIOS ANTERIORES', 'C', '3', '1', 'A'), ('5', 'GASTOS', 'D', '1', '0', 'A'), ('51', 'GASTOS DE ADMINISTRACION', 'D', '2', '1', 'A'), ('5105', 'GASTOS DE PERSONAL', 'D', '3', '1', 'A'), ('510503', 'SALARIO INTEGRAL', 'D', '4', '1', 'A'), ('510506', 'SUELDOS', 'D', '4', '1', 'A'), ('51050601', 'SUELDOS                                                                          ', 'D', '5', '0', 'A'), ('510512', 'JORNALES', 'D', '4', '1', 'A'), ('510513', 'COMPENSACION ORDINARIA', 'D', '4', '1', 'A'), ('510515', 'HORAS EXTRAS Y RECARGOS', 'D', '4', '1', 'A'), ('51051501', 'HORAS EXTRAS Y RECARGOS', 'D', '5', '0', 'A'), ('510516', 'TIEMPO SUPLEMENTARIO', 'D', '4', '1', 'A'), ('510518', 'COMISIONES', 'D', '4', '1', 'A'), ('51051801', 'COMISIONES', 'D', '5', '0', 'A'), ('510520', 'COMPENSACION VARIABLE', 'D', '4', '1', 'A'), ('510521', 'VIATICOS', 'D', '4', '1', 'A'), ('51052101', 'VIATICOS', 'D', '5', '0', 'A'), ('510524', 'INCAPACIDADES', 'D', '4', '1', 'A'), ('510527', 'AUXILIO DE TRANSPORTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51052701', 'AUXILIO DE TRANSPORTE                                                            ', 'D', '5', '0', 'A'), ('510528', 'AYUDA PARA EL TRANSPORTE', 'D', '4', '1', 'A'), ('510530', 'CESANTIAS', 'D', '4', '1', 'A'), ('51053001', 'CESANTIAS                                                                        ', 'D', '5', '0', 'A'), ('510532', 'COMPENSACION ANUAL DIFERIDA', 'D', '4', '1', 'A'), ('510533', 'INTERESES SOBRE CESANTIAS', 'D', '4', '1', 'A'), ('51053301', 'INTERESES SOBRE CESANTIAS                                                        ', 'D', '5', '0', 'A'), ('510536', 'PRIMA DE SERVICIOS', 'D', '4', '1', 'A'), ('51053601', 'PRIMA LEGAL                                                                      ', 'D', '5', '0', 'A'), ('510537', 'COMPENSACION SEMESTRAL', 'D', '4', '1', 'A'), ('510539', 'VACACIONES', 'D', '4', '1', 'A'), ('51053901', 'VACACIONES                                                                       ', 'D', '5', '0', 'A'), ('510540', 'DESCANSO ANUAL COMPENSADO', 'D', '4', '1', 'A'), ('510542', 'PRIMAS EXTRALEGALES', 'D', '4', '1', 'A'), ('510545', 'AUXILIOS', 'D', '4', '1', 'A'), ('510548', 'BONIFICACIONES', 'D', '4', '1', 'A'), ('51054801', 'BONIFICACIONES POR GESTION DE VENTAS', 'D', '5', '0', 'A'), ('51054802', 'BONIFICACIONES', 'D', '5', '0', 'A'), ('510550', 'COMPENSACION EXTRAORDINARIA', 'D', '4', '1', 'A'), ('510551', 'DOTACION Y SUMINISTRO A TRABAJADORES', 'D', '4', '1', 'A'), ('51055101', 'UNIFORMES-DOTACION', 'D', '5', '0', 'A'), ('51055102', 'UNIFORMES DOTACIONES - IVA NO DEDUCIBLE', 'D', '5', '0', 'A'), ('510554', 'SEGUROS', 'D', '4', '1', 'A'), ('510557', 'CUOTAS PARTES PENSIONES DE JUBILACION', 'D', '4', '1', 'A'), ('510558', 'AMORTIZACION CALCULO ACTUARIAL PENSIONES DE JUBILACION', 'D', '4', '1', 'A'), ('510559', 'PENSIONES DE JUBILACION', 'D', '4', '1', 'A'), ('510560', 'INDEMNIZACIONES LABORALES', 'D', '4', '1', 'A'), ('51056001', 'INDEMNIZACIONES LABORALES', 'D', '5', '0', 'A'), ('510563', 'CAPACITACION AL PERSONAL', 'D', '4', '1', 'A'), ('51056301', 'CAPACITACION AL PERSONAL', 'D', '5', '0', 'A'), ('510566', 'GASTOS DEPORTIVOS Y DE RECREACION', 'D', '4', '1', 'A'), ('510569', 'APORTES SALUD', 'D', '4', '1', 'A'), ('51056901', 'APORTES SALUD                                                                    ', 'D', '5', '0', 'A'), ('510570', 'APORTES PENSION', 'D', '4', '1', 'A'), ('51057001', 'APORTES PENSION                                                                  ', 'D', '5', '0', 'A'), ('510571', 'APORTES A.R.P.', 'D', '4', '1', 'A'), ('51057101', 'ARP                                                                              ', 'D', '5', '0', 'A'), ('510572', 'APORTES CAJAS DE COMPENSACION FAMILIAR', 'D', '4', '1', 'A'), ('51057201', 'CAJA DE COMPRENSACION FAMILIAR                                                   ', 'D', '5', '0', 'A'), ('510575', 'APORTES I.C.B.F.', 'D', '4', '1', 'A'), ('51057501', 'ICBF                                                                             ', 'D', '5', '0', 'A'), ('510578', 'SENA', 'D', '4', '1', 'A'), ('51057801', 'SENA                                                                             ', 'D', '5', '0', 'A'), ('510581', 'APORTES SINDICALES', 'D', '4', '1', 'A'), ('510584', 'GASTOS MEDICOS Y DROGAS', 'D', '4', '1', 'A'), ('51058401', 'GASTOS MEDICOS Y DROGAS', 'D', '5', '0', 'A'), ('51058402', 'GASTOS MEDICOS Y DROGAS-IVA DEDUCIBLE', 'D', '5', '0', 'A'), ('510595', 'OTROS', 'D', '4', '1', 'A'), ('5110', 'GASTOS  GENERALES', 'D', '3', '1', 'A'), ('511001', 'HONORARIOS', 'D', '4', '1', 'A'), ('51100101', 'REVISORIA FISCAL', 'D', '5', '0', 'A'), ('51100102', 'ASESORÍA TÉCNICA', 'D', '5', '0', 'A'), ('51100103', 'ASESORIA JURIDICA', 'D', '5', '0', 'A'), ('51100104', 'HONORARIOS CONTADOR PUBLICO', 'D', '5', '0', 'A'), ('51100105', 'HONORARIOS -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A'), ('51100190', 'OTROS HONORARIOS', 'D', '5', '0', 'A'), ('511002', 'IMPUESTOS', 'D', '4', '1', 'A'), ('51100201', 'IMPUESTOS                                                                        ', 'D', '5', '0', 'A'), ('51100203', 'INDUSTRIA Y COMERCIO', 'D', '5', '0', 'A'), ('51100204', 'IMPUESTO PROHOSPITAL', 'D', '5', '0', 'A'), ('51100205', 'AVISOS Y TABLEROS', 'D', '5', '0', 'A'), ('51100206', 'SOBRETASA BOMBERIL', 'D', '5', '0', 'A'), ('51100207', 'SOBRETASA CON DESTINO AL DEPORTE', 'D', '5', '0', 'A'), ('51100210', 'INDUSTRIA Y COMERCIO, AVISOS Y TABLEROS Y SOBRETASA BOMBERIL', 'D', '5', '0', 'I'), ('51100215', 'ESTAMPILLA PROHOSPITAL UNIVERSITARIO CARI E.S.E.', 'D', '5', '0', 'A'), ('511004', 'ARRENDAMIENTOS', 'D', '4', '1', 'A'), ('51100401', 'BIENES INMUEBLES', 'D', '5', '0', 'A'), ('51100402', 'BIENES INMUEBLE-IVA NO DEDUCIBLE', 'D', '5', '0', 'A'), ('51100403', 'CUOTA ADMINISTRACION EDIFICIO', 'D', '5', '0', 'A'), ('51100404', 'ESTUDIO DEL ARRENDAMIENTO', 'D', '5', '0', 'A'), ('51100502', 'POLIZAS JUDICIALES', 'D', '5', '0', 'A'), ('51100507', 'SOBRETASA CON DESTINO AL DEPORTE', 'D', '5', '0', 'A'), ('511006', 'ADMINISTRACION DE BIENES', 'D', '4', '1', 'A'), ('511008', 'SEGUROS', 'D', '4', '1', 'A'), ('51100801', 'POLIZA SEGURO DE MANEJO', 'D', '5', '0', 'A'), ('51100802', 'POLIZA DE SEGURO DE MANEJO', 'D', '5', '0', 'A'), ('51100803', 'SEGUROS GENERALES POLIZA INFRAESTRUCTURA', 'D', '5', '0', 'A'), ('51100804', 'SEGURO OBLIGATORIO S.O.A.T. MOTOCICLETAS', 'D', '5', '0', 'A'), ('511010', 'MANTENIMIENTO Y REPARACIONES', 'D', '4', '1', 'A'), ('51101001', 'MANTENIMIENTO PREVENTIVO EQUIPOS DE OFICINA', 'D', '5', '0', 'A'), ('51101002', 'MANTENIMIENTO PREVENTIVO-IVA NO DEDUCIBLE', 'D', '5', '0', 'A'), ('51101003', 'MANTENIMIENTO Y REPARACIONES DE VEHICULO', 'D', '5', '0', 'A'), ('51101004', 'MANTENIMIENTO Y REP VEHICULO IVA-DEDUCIBLE', 'D', '5', '0', 'A'), ('511012', 'MEJORAS A BIENES AJENOS', 'D', '4', '1', 'A'), ('511014', 'CUOTAS DE ADMINISTRACION', 'D', '4', '1', 'A'), ('511016', 'REPARACIONES LOCATIVAS', 'D', '4', '1', 'A'), ('51101601', 'REPARACIONES Y ADECUACIONES', 'D', '5', '0', 'A'), ('511018', 'ASEO Y ELEMENTOS', 'D', '4', '1', 'A'), ('51101801', 'ELEMENTOS DE ASEO', 'D', '5', '0', 'A'), ('51101802', 'ELEMENTOS DE ASEO-IVA NO DEDUCIBLE', 'D', '5', '0', 'A'), ('511020', 'CAFETERIA', 'D', '4', '1', 'A'), ('51102001', 'CAFETERIA', 'D', '5', '0', 'A'), ('51102002', 'AGUA-ASEO-ALCANTARILLADO', 'D', '5', '0', 'I'), ('51102003', 'CAFETERIA-IVA NO DEDUCIBLE-', 'D', '5', '0', 'A'), ('511022', 'SERVICIOS PUBLICOS', 'D', '4', '1', 'A'), ('51102201', 'ENERGIA ELECTRICA', 'D', '5', '0', 'A'), ('51102202', 'ENERGIA ELECTRICA', 'D', '5', '0', 'A'), ('51102203', 'AGUA, ASEO Y ALCANTARILLADO', 'D', '5', '0', 'A'), ('51102204', 'TELEFONO', 'D', '5', '0', 'A'), ('51102205', 'TELEFONO-IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511024', 'PORTES, CABLES, FAX Y TELEX', 'D', '4', '1', 'A'), ('51102401', 'PORTES CALBES FAX Y TELEX', 'D', '5', '0', 'A'), ('511026', 'TRANSPORTE,  FLETES Y ACARREOS', 'D', '4', '1', 'A'), ('51102601', 'TRANSPORTE, FLETES Y ACARREOS', 'D', '5', '0', 'A'), ('51102602', 'TAXIS Y BUSES', 'D', '5', '0', 'A'), ('511028', 'PAPELERIA Y UTILES DE OFICINA', 'D', '4', '1', 'A'), ('51102801', 'CERTIFICADOS DE CAMARA Y COMERCIO', 'D', '5', '0', 'A'), ('51102802', 'PAPELERIA Y UTILES VARIOS', 'D', '5', '0', 'A'), ('51102803', 'PAPELERIA Y UTILES DE OFICINA -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A'), ('511030', 'FOTOCOPIAS', 'D', '4', '1', 'A'), ('511032', 'SUMINISTROS', 'D', '4', '1', 'A'), ('511034', 'PUBLICIDAD Y PROPAGANDA', 'D', '4', '1', 'A'), ('51103401', 'PUBLICIDAD Y PROPAGANDA', 'D', '5', '0', 'A'), ('51103402', 'PUBLICIDAD Y PROPAGANDA IVA NO DESCONTABLE', 'D', '5', '0', 'A'), ('511036', 'CONTRIBUCIONES Y AFILIACIONES', 'D', '4', '1', 'A'), ('51103601', 'TASA DE CONTRIBUCION', 'D', '5', '0', 'A'), ('51103602', 'AFILIACIONES VARIAS', 'D', '5', '0', 'A'), ('51103603', 'CAMARA DE COMERCIO DE BARRANQUILLA', 'D', '5', '0', 'A'), ('51103604', 'ARANCELES JUDICIALES', 'D', '5', '0', 'A'), ('511038', 'GASTOS DE ASAMBLEA', 'D', '4', '1', 'A'), ('51103801', 'GASTOS DE ASAMBLEA', 'D', '5', '0', 'A'), ('511040', 'GASTOS DE DIRECTIVOS', 'D', '4', '1', 'A'), ('511042', 'GASTOS DE COMITES', 'D', '4', '1', 'A'), ('511044', 'REUNIONES Y CONFERENCIAS', 'D', '4', '1', 'A'), ('51104401', 'REUNIONES Y CONFERENCIAS', 'D', '5', '0', 'A'), ('51104402', 'REUNIONES Y CONFERENCIA - IVA NO DEDUCIBLE', 'D', '5', '0', 'A'), ('511046', 'GASTOS LEGALES', 'D', '4', '1', 'A'), ('51104601', 'GASTOS LEGALES', 'D', '5', '0', 'A'), ('51104602', 'TRAMITES Y LICENCIAS', 'D', '5', '0', 'A'), ('51104603', 'MULTAS Y SANCIONES', 'D', '5', '0', 'A'), ('51104604', 'TRAMITES Y LICENCIAS-IVA NO DEDUCIBLE', 'D', '5', '0', 'A'), ('51104605', 'GASTOS LEGALES-IVA DEDUCIBLE', 'D', '5', '0', 'A'), ('511048', 'INFORMACION COMERCIAL', 'D', '4', '1', 'A'), ('51104801', 'COMISION DE VENDEDORES', 'D', '5', '0', 'A'), ('51104802', 'OTRAS COMISIONES', 'D', '5', '0', 'A'), ('511050', 'GASTOS DE  REPRESENTACION', 'D', '4', '1', 'A'), ('51105001', 'GASTOS DE REPRESENTACION', 'D', '5', '0', 'A'), ('511052', 'GASTOS DE VIAJES', 'D', '4', '1', 'A'), ('51105201', 'GASTOS DE VIAJE', 'D', '5', '0', 'A'), ('51105202', 'TIQUETES AEREOS', 'D', '5', '0', 'A'), ('51105203', 'TIQUETEA AEREOS-IVA NO DEDUCIBLE-', 'D', '5', '0', 'A'), ('51105204', 'GASTOS DE VIAJE -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A'), ('511054', 'SERVICIOS TEMPORALES', 'D', '4', '1', 'A'), ('51105401', 'SERVICIOS TEMPORALES', 'D', '5', '0', 'A'), ('51105402', 'SERVICIOS TEMPORALES-IVA DEDUCIBLE', 'D', '5', '0', 'A'), ('511056', 'VIGILANCIA PRIVADA', 'D', '4', '1', 'A'), ('511058', 'SISTEMATIZACION', 'D', '4', '1', 'A'), ('51105801', 'LICENCIA DE SOFTWARE', 'D', '5', '0', 'A'), ('51105802', 'ANTIVIRUS', 'D', '5', '0', 'A'), ('51105803', 'SISTEMATIZACION', 'D', '5', '0', 'A'), ('51105804', 'SITEMATIZACION-IVA NO DEDUCIBLE', 'D', '5', '0', 'A'), ('511060', 'CUOTAS DE SOSTENIMIENTO', 'D', '4', '1', 'A'), ('51106001', 'CUOTA DE SOSTENIMIENTO', 'D', '5', '0', 'A'), ('511062', 'SUSCRIPCIONES', 'D', '4', '1', 'A'), ('51106201', 'SUSCRIPCION CODIGO MINDEFENSA', 'D', '5', '0', 'A'), ('51106202', 'CERTICAMARAS S.A.', 'D', '5', '0', 'A'), ('51106203', 'SUSCRIPCION - IVA NO DEDUCIBLE', 'D', '5', '0', 'A'), ('511064', 'AUXILIOS Y DONACIONES', 'D', '4', '1', 'A'), ('51106401', 'AUXILIOS Y DONACIONES', 'D', '5', '0', 'A'), ('511066', 'ADECUACION E INSTALACION', 'D', '4', '1', 'A'), ('51106601', 'ADECUACION E INSTALACION', 'D', '5', '0', 'A'), ('51106602', 'ADECUACION E INSTALACIONES -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A'), ('511068', 'ASISTENCIA TÉCNICA', 'D', '4', '1', 'A'), ('51106801', 'ASISTENCIA TECNICA CIFIN', 'D', '5', '0', 'A'), ('51106802', 'ASISTENCIA TECNICA CIFIN -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A'), ('511070', 'GASTOS FONDO DE EDUCACIÓN', 'D', '4', '1', 'A'), ('511072', 'GASTOS FONDOS SOLIDARIDAD', 'D', '4', '1', 'A'), ('511075', 'GASTOS FONDOS RESERVA TÉCNICA', 'D', '4', '1', 'A'), ('511078', 'GASTOS FONDO BIENESTAR SOCIAL', 'D', '4', '1', 'A'), ('51107801', 'GASTOS FONDO DE BIENESTAR SOCIAL', 'D', '5', '0', 'A'), ('511080', 'GASTOS OTROS FONDOS', 'D', '4', '1', 'A'), ('51108002', 'GASTOS FONDOS MUTUALES', 'D', '5', '0', 'A'), ('511095', 'GASTOS VARIOS', 'D', '4', '1', 'A'), ('51109501', 'GASTOS VARIOS                                                                    ', 'D', '5', '0', 'A'), ('51109502', 'TAXIS Y BUSES', 'D', '5', '0', 'A'), ('51109503', 'MUEBLES Y ENSERES', 'D', '5', '0', 'A'), ('51109504', 'EQUIPOS DE OFICINA', 'D', '5', '0', 'A'), ('51109505', 'SEGUROS DE VIDA COLECTIVO', 'D', '5', '0', 'A'), ('51109506', 'GASTOS VARIOS -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A'), ('51109507', 'ALOJAMIENTO Y MANUTENCION', 'D', '5', '0', 'A'), ('5115', 'PROVISIONES', 'D', '3', '1', 'A'), ('511501', 'INVERSIONES  TITULOS NEGOCIABLES DE DEUDA', 'D', '4', '1', 'A'), ('511502', 'INVERSIONES TITULOS NEGOCIABLES  DE PATICIPACIÓN', 'D', '4', '1', 'A'), ('511503', 'INVERSIONES TITULOS PARA MANTENER HASTA EL VENCIMIENTO', 'D', '4', '1', 'A'), ('511504', 'INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE DEUDA.', 'D', '4', '1', 'A'), ('511505', 'INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE  PARTICIPACIÓN.', 'D', '4', '1', 'A'), ('511510', 'CREDITOS COMERCIALES', 'D', '4', '1', 'A'), ('511515', 'CREDITOS  CONSUMO', 'D', '4', '1', 'A'), ('51151501', 'CREDITOS DE CONSUMO', 'D', '5', '0', 'A'), ('511520', 'CREDITOS VIVIENDA', 'D', '4', '1', 'A'), ('511522', 'MICROCREDITOS INMOBILIARIO', 'D', '4', '1', 'A'), ('511523', 'MICROCREDITOS EMPRESARIAL', 'D', '4', '1', 'A'), ('511524', 'PROVISION GENERAL DE CARTERA', 'D', '4', '1', 'A'), ('51152401', 'PROVISION GENERAL DE CARTERA', 'D', '5', '0', 'A'), ('511525', 'DEUDORES POR VENTA DE BIENES', 'D', '4', '1', 'A'), ('511528', 'DEUDORES POR PRESTACION DE SERVICIOS', 'D', '4', '1', 'A'), ('511530', 'CUENTAS POR COBRAR', 'D', '4', '1', 'A'), ('51153001', 'CUENTAS POR COBRAR', 'D', '5', '0', 'A'), ('511535', 'INVENTARIOS', 'D', '4', '1', 'A'), ('511540', 'BIENES RECIBIDOS EN PAGO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511545', 'PROPIEDADES PLANTA  Y EQUIPO', 'D', '4', '1', 'A'), ('511550', 'PARA PROTECCIÓN DE SEMOVIENTES', 'D', '4', '1', 'A'), ('511555', 'FONDO DE LIQUIDEZ', 'D', '4', '1', 'A'), ('511560', 'OTROS ACTIVOS', 'D', '4', '1', 'A'), ('511565', 'OTRAS  PROVISIONES', 'D', '4', '1', 'A'), ('51156501', 'OTRAS PROVISIONES-IMPUESTO DE RENTA Y COMPLEMENTARIOS', 'D', '5', '0', 'A'), ('5120', 'AMORTIZACION Y AGOTAMIENTO', 'D', '3', '1', 'A'), ('512005', 'INTANGIBLES', 'D', '4', '1', 'A'), ('512010', 'CARGOS DIFERIDOS', 'D', '4', '1', 'A'), ('51201001', 'IMPUESTO AL PATRIMONIO', 'D', '5', '0', 'A'), ('512015', 'PLANTACIONES AGRÍCOLAS Y FORESTALES', 'D', '4', '1', 'A'), ('512020', 'SEMOVIENTES', 'D', '4', '1', 'A'), ('512025', 'RECURSOS NATURALES', 'D', '4', '1', 'A'), ('512095', 'OTRAS', 'D', '4', '1', 'A'), ('5125', 'DEPRECIACIONES', 'D', '3', '1', 'A'), ('512515', 'EDIFICACIONES', 'D', '4', '1', 'A'), ('512520', 'MUEBLES Y EQUIPOS DE OFICINA', 'D', '4', '1', 'A'), ('51252001', 'MUEBLES Y EQUIPOS DE OFICINA', 'D', '5', '0', 'A'), ('512522', 'EQUIPO MEDICO Y CIENTÍFICO', 'D', '4', '1', 'A'), ('512525', 'EQUIPO DE CÓMPUTO Y COMUNICACION', 'D', '4', '1', 'A'), ('51252501', 'EQUIPOS DE COMPUTO Y COMUNICACIONES', 'D', '5', '0', 'A'), ('512528', 'EQUIPO DE HOTELES Y RESTAURANTES', 'D', '4', '1', 'A'), ('512530', 'VEHICULOS', 'D', '4', '1', 'A'), ('51253001', 'MOTOCICLETAS', 'D', '5', '0', 'A'), ('512532', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A'), ('512535', 'ARMAMENTO DE  VIGILANCIA', 'D', '4', '1', 'A'), ('512540', 'PLANTACIONES AGRÍCOLAS Y FORESTALES', 'D', '4', '1', 'A'), ('512545', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A'), ('512550', 'MAUSOLEOS', 'D', '4', '1', 'A'), ('512555', 'ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A'), ('512560', 'BIENES DE FONDOS SOCIALES', 'D', '4', '1', 'A'), ('5140', 'GASTOS FINANCIEROS', 'D', '3', '1', 'A'), ('514005', 'GASTOS BANCARIOS', 'D', '4', '1', 'A'), ('51400501 ', 'GRAVAMEN MOVIMIENTO FINANCIERO 4*1000                                                               ', 'D', '5', '0', 'I'), ('51400502', 'GRAVAMEN MOVIMIENTOS FINANCIEROS                                                 ', 'D', '5', '0', 'A'), ('514010', 'REAJUSTE MONETARIO    UVR', 'D', '4', '1', 'A'), ('514015', 'COMISIONES', 'D', '4', '1', 'A'), ('51401501', 'COMISIONES                                                                       ', 'D', '5', '0', 'A'), ('514020', 'INTERESES', 'D', '4', '1', 'A'), ('51402001', 'INTERESES VARIOS', 'D', '5', '0', 'A'), ('514025', 'DIFERENCIA EN CAMBIO', 'D', '4', '1', 'A'), ('514030', 'GASTOS EN NEGOCIACION CERTIFICADOS DE CAMBIO', 'D', '4', '1', 'A'), ('514035', 'DESCUENTOS COMERCIALES CONDICIONADOS', 'D', '4', '1', 'A'), ('514040', 'GASTOS MANEJO Y EMISION DE BONOS', 'D', '4', '1', 'A'), ('514045', 'PRIMA AMORTIZADA', 'D', '4', '1', 'A'), ('514050', 'PÉRDIDA EN VENTA DE INVERSIONES', 'D', '4', '1', 'A'), ('514051', 'PÉRDIDA EN VENTA TITULOS NEGOCIABLES DE DEUDA', 'D', '4', '1', 'A'), ('514052', 'PERDIDA EN VENTA TITULOS NEGOCIABLES  DE PARTICIPACIÓN', 'D', '4', '1', 'A'), ('514053', 'PÉRDIDA EN VENTA TITULOS PARA MANTENER HASTA EL VENCIMIENTO', 'D', '4', '1', 'A'), ('514054', 'PERDIDA EN VENTA EN INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE DEUDA.', 'D', '4', '1', 'A'), ('514055', 'PERDIDA EN VENTA EN INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE  PARTICIPACIÓN.', 'D', '4', '1', 'A'), ('514095', 'OTROS', 'D', '4', '1', 'A'), ('51409501', 'OTROS GASTOS                                                                     ', 'D', '5', '0', 'A'), ('5141', 'PERDIDA EN VALORACION INVERSIONES NEGOCIABLES', 'D', '3', '1', 'A'), ('514105', 'EN TITULOS DE DEUDA', 'D', '4', '1', 'A'), ('514110', 'EN TITULOS PARTICIPATIVOS', 'D', '4', '1', 'A'), ('5142', 'PERDIDA EN VALORACION DE INVERSIONES DISPONIBLES PARA LA VENTA', 'D', '3', '1', 'A'), ('514205', 'EN TITULOS DE DEUDA', 'D', '4', '1', 'A'), ('514210', 'EN TITULOS PARTICIPATIVOS', 'D', '4', '1', 'A'), ('5143', 'PERDIDA EN VALORACION DE INVERSIONES PARA MANTENER HASTA EL VENCIMIENTO', 'D', '3', '1', 'A'), ('514305', 'EN TITULOS DE DEUDA', 'D', '4', '1', 'A'), ('514310', 'EN TITULOS  PARTICIPATIVOS', 'D', '4', '1', 'A'), ('52', 'GASTOS  DE VENTAS', 'D', '2', '1', 'A'), ('5205', 'GASTOS DE PERSONAL', 'D', '3', '1', 'A'), ('520503', 'SALARIO INTEGRAL', 'D', '4', '1', 'A'), ('520506', 'SUELDOS', 'D', '4', '1', 'A'), ('520512', 'JORNALES', 'D', '4', '1', 'A'), ('520513', 'COMPENSACION ORDINARIA', 'D', '4', '1', 'A'), ('520515', 'HORAS EXTRAS Y RECARGOS', 'D', '4', '1', 'A'), ('520516', 'TIEMPO SUPLEMENTARIO', 'D', '4', '1', 'A'), ('520518', 'COMISIONES', 'D', '4', '1', 'A'), ('520520', 'COMPENSACION VARIABLE', 'D', '4', '1', 'A'), ('520521', 'VIATICOS', 'D', '4', '1', 'A'), ('520524', 'INCAPACIDADES', 'D', '4', '1', 'A'), ('520527', 'AUXILIO DE TRANSPORTE', 'D', '4', '1', 'A'), ('520528', 'AYUDA AL TRANSPORTE', 'D', '4', '1', 'A'), ('520530', 'CESANTIAS', 'D', '4', '1', 'A'), ('520532', 'COMPENSACION ANUAL', 'D', '4', '1', 'A'), ('520533', 'INTERESES SOBRE CESANTIAS', 'D', '4', '1', 'A'), ('520536', 'PRIMA DE SERVICIOS', 'D', '4', '1', 'A'), ('520537', 'COMPENSACION SEMESTRAL', 'D', '4', '1', 'A'), ('520539', 'VACACIONES', 'D', '4', '1', 'A'), ('520540', 'DESCANSO ANUAL COMPENSADO', 'D', '4', '1', 'A'), ('520542', 'PRIMAS EXTRALEGALES', 'D', '4', '1', 'A'), ('520545', 'AUXILIOS', 'D', '4', '1', 'A'), ('520548', 'BONIFICACIONES', 'D', '4', '1', 'A'), ('520550', 'COMPENSACION EXTRAORDINARIA', 'D', '4', '1', 'A'), ('520551', 'DOTACION Y SUMINISTRO A TRABAJADORES', 'D', '4', '1', 'A'), ('520554', 'SEGUROS', 'D', '4', '1', 'A'), ('520557', 'CUOTAS PARTES PENSIONES DE JUBILACION', 'D', '4', '1', 'A'), ('520558', 'AMORTIZACION CALCULO ACTUARIAL PENSIONES DE JUBILACION', 'D', '4', '1', 'A'), ('520559', 'PENSIONES DE JUBILACION', 'D', '4', '1', 'A'), ('520560', 'INDEMNIZACIONES LABORALES', 'D', '4', '1', 'A'), ('520563', 'CAPACITACION AL PERSONAL', 'D', '4', '1', 'A'), ('520566', 'GASTOS DEPORTIVOS Y DE RECREACION', 'D', '4', '1', 'A'), ('520569', 'APORTES SALUD', 'D', '4', '1', 'A'), ('520570', 'APORTES PENSION', 'D', '4', '1', 'A'), ('520571', 'APORTES A.R.P.', 'D', '4', '1', 'A'), ('520572', 'APORTES CAJAS DE COMPENSACION FAMILIAR', 'D', '4', '1', 'A'), ('520575', 'APORTES I.C.B.F.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520578', 'SENA', 'D', '4', '1', 'A'), ('520581', 'APORTES SINDICALES', 'D', '4', '1', 'A'), ('520584', 'GASTOS MEDICOS Y DROGAS', 'D', '4', '1', 'A'), ('520595', 'OTROS', 'D', '4', '1', 'A'), ('5210', 'HONORARIOS', 'D', '3', '1', 'A'), ('521005', 'JUNTA DIRECTIVA', 'D', '4', '1', 'A'), ('521010', 'REVISORIA FISCAL', 'D', '4', '1', 'A'), ('521015', 'AUDITORIA EXTERNA', 'D', '4', '1', 'A'), ('521020', 'AVALUOS', 'D', '4', '1', 'A'), ('521025', 'ASESORIA JURIDICA', 'D', '4', '1', 'A'), ('521030', 'ASESORIA FINANCIERA', 'D', '4', '1', 'A'), ('521035', 'ASESORIA TECNICA', 'D', '4', '1', 'A'), ('521095', 'OTROS', 'D', '4', '1', 'A'), ('5215', 'IMPUESTOS', 'D', '3', '1', 'A'), ('521505', 'INDUSTRIA Y COMERCIO', 'D', '4', '1', 'A'), ('52150501', 'INDUSTRIA Y COMERCIO                                                             ', 'D', '5', '0', 'A'), ('521510', 'DE TIMBRES', 'D', '4', '1', 'A'), ('521515', 'A LA PROPIEDAD RAIZ', 'D', '4', '1', 'A'), ('521520', 'DERECHOS SOBRE INSTRUMENTOS PUBLICOS', 'D', '4', '1', 'A'), ('521525', 'DE VALORIZACION', 'D', '4', '1', 'A'), ('521530', 'DE TURISMO', 'D', '4', '1', 'A'), ('521535', 'TASA POR UTILIZACION DE PUERTOS', 'D', '4', '1', 'A'), ('521540', 'DE VEHICULOS', 'D', '4', '1', 'A'), ('521545', 'DE ESPECTACULOS PUBLICOS', 'D', '4', '1', 'A'), ('521550', 'CUOTAS DE FOMENTO', 'D', '4', '1', 'A'), ('521555', 'LICORES', 'D', '4', '1', 'A'), ('521560', 'CERVEZAS', 'D', '4', '1', 'A'), ('521565', 'CIGARRILLOS', 'D', '4', '1', 'A'), ('521570', 'IVA DESCONTABLE', 'D', '4', '1', 'A'), ('521575', '3X1000', 'D', '4', '1', 'A'), ('521595', 'OTROS', 'D', '4', '1', 'A'), ('52159501', 'ESTAMPILLA PRO-HOSPITAL                                                          ', 'D', '5', '0', 'A'), ('52159502', 'AVISOS Y TABLEROS', 'D', '5', '0', 'A'), ('52159503', 'SOBRETASA BOMBERIL', 'D', '5', '0', 'A'), ('5220', 'ARRENDAMIENTOS', 'D', '3', '1', 'A'), ('522005', 'TERRENOS', 'D', '4', '1', 'A'), ('522010', 'EDIFICACIONES', 'D', '4', '1', 'A'), ('522015', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A'), ('522020', 'MUEBLES Y EQUIPO DE OFICINA', 'D', '4', '1', 'A'), ('522025', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'D', '4', '1', 'A'), ('522030', 'ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A'), ('522035', 'EQUIPO DE HOTELES Y RESTAURANTES', 'D', '4', '1', 'A'), ('522040', 'MAUSOLEOS', 'D', '4', '1', 'A'), ('522045', 'VEHICULOS', 'D', '4', '1', 'A'), ('522050', 'EQUIPOS MEDICOS - CIENTIFICOS', 'D', '4', '1', 'A'), ('522060', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A'), ('522065', 'SEMOVIENTES', 'D', '4', '1', 'A'), ('522070', 'ARMAMENTO DE VIGILANCIA', 'D', '4', '1', 'A'), ('522075', 'BIENES DE FONDOS SOCIALES', 'D', '4', '1', 'A'), ('522095', 'OTROS', 'D', '4', '1', 'A'), ('5225', 'CONTRIBUCIONES Y AFILIACIONES', 'D', '3', '1', 'A'), ('522505', 'CONTRIBUCIONES', 'D', '4', '1', 'A'), ('522510', 'AFILIACIONES Y SOSTENIMIENTO', 'D', '4', '1', 'A'), ('5230', 'SEGUROS', 'D', '3', '1', 'A'), ('523005', 'MANEJO', 'D', '4', '1', 'A'), ('523010', 'CUMPLIMIENTO', 'D', '4', '1', 'A'), ('523015', 'CORRIENTE DEBIL', 'D', '4', '1', 'A'), ('523020', 'VIDA COLECTIVA', 'D', '4', '1', 'A'), ('523025', 'INCENDIO', 'D', '4', '1', 'A'), ('523030', 'TERREMOTO', 'D', '4', '1', 'A'), ('523035', 'SUSTRACCION Y HURTO', 'D', '4', '1', 'A'), ('523040', 'VEHICULO - RODAMIENTO', 'D', '4', '1', 'A'), ('523045', 'RESPONSABILIDAD CIVIL Y EXTRACONTRACTUAL', 'D', '4', '1', 'A'), ('523050', 'ROTURA DE MAQUINARIA', 'D', '4', '1', 'A'), ('523055', 'OBLIGATORIO ACCIDENTE DE TRANSITO', 'D', '4', '1', 'A'), ('523060', 'LUCRO CESANTE', 'D', '4', '1', 'A'), ('523095', 'OTROS', 'D', '4', '1', 'A'), ('5235', 'SERVICIOS', 'D', '3', '1', 'A'), ('523505', 'ASEO Y VIGILANCIA', 'D', '4', '1', 'A'), ('523510', 'TEMPORALES', 'D', '4', '1', 'A'), ('523515', 'ASISTENCIA TECNICA', 'D', '4', '1', 'A'), ('52351501', 'ASISTENCIA TECNICA CIFIN', 'D', '5', '1', 'A'), ('523520', 'PROCESAMIENTO ELECTRONICO DE DATOS', 'D', '4', '1', 'A'), ('523525', 'ACUEDUCTO Y ALCANTARILLADO', 'D', '4', '1', 'A'), ('523530', 'ENERGIA ELECTRICA', 'D', '4', '1', 'A'), ('523535', 'TELEFONO', 'D', '4', '1', 'A'), ('523540', 'CORREO, PORTES Y TELEGRAMAS', 'D', '4', '1', 'A'), ('523545', 'FAX Y TELEX', 'D', '4', '1', 'A'), ('523550', 'TRANSPORTE, FLETES Y ACARREOS', 'D', '4', '1', 'A'), ('523555', 'GAS', 'D', '4', '1', 'A'), ('523560', 'PUBLICIDAD, PROPAGANDA Y PROMOCION', 'D', '4', '1', 'A'), ('523595', 'OTROS', 'D', '4', '1', 'A'), ('5240', 'GASTOS LEGALES', 'D', '3', '1', 'A'), ('524005', 'NOTARIALES', 'D', '4', '1', 'A'), ('524010', 'REGISTRO MERCANTIL', 'D', '4', '1', 'A'), ('524015', 'TRAMITES Y LICENCIAS', 'D', '4', '1', 'A'), ('524020', 'ADUANEROS', 'D', '4', '1', 'A'), ('524025', 'CONSULARES', 'D', '4', '1', 'A'), ('524095', 'OTROS', 'D', '4', '1', 'A'), ('5245', 'MANTENIMIENTO Y REPARACIONES', 'D', '3', '1', 'A'), ('524505', 'TERRENOS', 'D', '4', '1', 'A'), ('524510', 'EDIFICACIONES', 'D', '4', '1', 'A'), ('524515', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A'), ('524520', 'MUEBLES Y EQUIPO DE OFICINA', 'D', '4', '1', 'A'), ('524525', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'D', '4', '1', 'A'), ('524530', 'ELEMENTOS DIDACTICOS', 'D', '4', '1', 'A'), ('524535', 'VEHICULOS', 'D', '4', '1', 'A'), ('524540', 'MAUSOLEOS', 'D', '4', '1', 'A'), ('524545', 'BIENES FONDOS SOCIALES', 'D', '4', '1', 'A'), ('524550', 'ARMAMENTO DE VIGILANCIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524555', 'VIAS DE COMUNICACION', 'D', '4', '1', 'A'), ('5250', 'ADECUACION E INSTALACION', 'D', '3', '1', 'A'), ('525005', 'INSTALACIONES ELECTRICAS', 'D', '4', '1', 'A'), ('525010', 'ARREGLOS ORNAMENTALES', 'D', '4', '1', 'A'), ('525015', 'REPARACIONES LOCATIVAS', 'D', '4', '1', 'A'), ('525095', 'OTROS', 'D', '4', '1', 'A'), ('5255', 'GASTOS DE VIAJE', 'D', '3', '1', 'A'), ('525505', 'ALOJAMIENTO Y MANUTENCION', 'D', '4', '1', 'A'), ('525510', 'PASAJES FLUVIALES Y/O MARITIMOS', 'D', '4', '1', 'A'), ('525515', 'PASAJES AEREOS', 'D', '4', '1', 'A'), ('52551501', 'PASAJES AEREOS', 'D', '5', '1', 'A'), ('525520', 'PASAJES TERRESTRES', 'D', '4', '1', 'A'), ('525525', 'PASAJES FERREOS', 'D', '4', '1', 'A'), ('525595', 'OTROS', 'D', '4', '1', 'A'), ('5260', 'DEPRECIACIONES', 'D', '3', '1', 'A'), ('526005', 'EDIFICACIONES', 'D', '4', '1', 'A'), ('526010', 'EQUIPO DE HOTELES Y RESTAURANTES', 'D', '4', '1', 'A'), ('526015', 'MUEBLES Y EQUIPOS DE OFICINA', 'D', '4', '1', 'A'), ('526020', 'EQUIPO DE COMPUTO Y COMUNICACIÓN', 'D', '4', '1', 'A'), ('526025', 'VEHICULOS', 'D', '4', '1', 'A'), ('526030', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A'), ('526035', 'EQUIPOS MEDICOS  - CIENTIFICOS', 'D', '4', '1', 'A'), ('526040', 'ARMAMENTO DE  VIGILANCIA', 'D', '4', '1', 'A'), ('526045', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A'), ('526050', 'MAUSOLEOS', 'D', '4', '1', 'A'), ('526055', 'ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A'), ('526060', 'BIENES DE FONDOS SOCIALES', 'D', '4', '1', 'A'), ('5265', 'AMORTIZACIONES Y AGOTAMIENTO', 'D', '3', '1', 'A'), ('526505', 'RECURSOS NATURALES', 'D', '4', '1', 'A'), ('526510', 'SEMOVIENTES', 'D', '4', '1', 'A'), ('526515', 'INTANGIBLES', 'D', '4', '1', 'A'), ('526520', 'CARGOS DIFERIDOS', 'D', '4', '1', 'A'), ('526595', 'OTRAS', 'D', '4', '1', 'A'), ('5295', 'DIVERSOS', 'D', '3', '1', 'A'), ('529505', 'COMISIONES', 'D', '4', '1', 'A'), ('52950501', 'COMISIONES DE VENTAS', 'D', '5', '0', 'A'), ('52950503', 'PAGADURIAS', 'D', '5', '0', 'A'), ('529510', 'LIBROS, SUSCRIPCIONES, PERIODICOS Y REVISTAS', 'D', '4', '1', 'A'), ('529515', 'MUSICA AMBIENTAL', 'D', '4', '1', 'A'), ('529520', 'GASTOS DE REPRESENTACION Y RELACIONES PUBLICAS', 'D', '4', '1', 'A'), ('529525', 'ELEMENTOS DE ASEO Y CAFETERIA', 'D', '4', '1', 'A'), ('529530', 'UTILES, PAPELERIA Y FOTOCOPIAS', 'D', '4', '1', 'A'), ('529535', 'COMBUSTIBLES Y LUBRICANTES', 'D', '4', '1', 'A'), ('529540', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A'), ('529545', 'TAXIS Y BUSES', 'D', '4', '1', 'A'), ('529550', 'ESTAMPILLAS', 'D', '4', '1', 'A'), ('529555', 'MICROFILMACION', 'D', '4', '1', 'A'), ('529560', 'CASINO Y RESTAURANTE', 'D', '4', '1', 'A'), ('529562', 'GASTOS REUNIONES Y CONFERENCIAS', 'D', '4', '1', 'A'), ('529565', 'PARQUEADEROS', 'D', '4', '1', 'A'), ('529570', 'INDEMNIZACION POR DAÑOS A TERCEROS', 'D', '4', '1', 'A'), ('529575', 'POLVORA Y SIMILARES', 'D', '4', '1', 'A'), ('529595', 'OTROS', 'D', '4', '1', 'A'), ('52959504', 'OTRAS COMISIONES', 'D', '5', '0', 'A'), ('5299', 'PROVISIONES', 'D', '3', '1', 'A'), ('529905', 'INVERSIONES', 'D', '4', '1', 'A'), ('529910', 'INVENTARIOS', 'D', '4', '1', 'A'), ('529915', 'BIENES RECIBIDOS EN PAGO', 'D', '4', '1', 'A'), ('529920', 'CARTERA POR VENTA DE BIENES Y SERVICIOS', 'D', '4', '1', 'A'), ('529925', 'CUENTAS POR COBRAR', 'D', '4', '1', 'A'), ('529930', 'PROPIEDADES, PLANTA Y EQUIPO', 'D', '4', '1', 'A'), ('529995', 'OTROS ACTIVOS', 'D', '4', '1', 'A'), ('53', 'GASTOS NO OPERACIONALES', 'D', '2', '1', 'A'), ('5305', 'GASTOS FINANCIEROS', 'D', '3', '1', 'A'), ('530505', 'GASTOS BANCARIOS', 'D', '4', '1', 'A'), ('530510', 'REAJUSTE MONETARIO    UVR', 'D', '4', '1', 'A'), ('530515', 'COMISIONES', 'D', '4', '1', 'A'), ('530520', 'INTERESES', 'D', '4', '1', 'A'), ('530525', 'DIFERENCIA EN CAMBIO', 'D', '4', '1', 'A'), ('530530', 'GASTOS EN NEGOCIACION CERTIFICADOS DE CAMBIO', 'D', '4', '1', 'A'), ('530535', 'DESCUENTOS COMERCIALES CONDICIONADOS', 'D', '4', '1', 'A'), ('53053501', 'DESCUENTOS COMERCIALES ASOCIADOS                                                 ', 'D', '5', '0', 'A'), ('530540', 'GASTOS MANEJO Y EMISION DE BONOS', 'D', '4', '1', 'A'), ('530545', 'PRIMA AMORTIZADA', 'D', '4', '1', 'A'), ('530550', 'IMPUESTO 3X1000', 'D', '4', '1', 'A'), ('530595', 'OTROS', 'D', '4', '1', 'A'), ('5310', 'PERDIDA EN VENTA Y RETIRO DE BIENES', 'D', '3', '1', 'A'), ('531005', 'VENTA DE INVERSIONES', 'D', '4', '1', 'A'), ('531010', 'VENTA DE CARTERA', 'D', '4', '1', 'A'), ('53101001', 'VENTA DE CARTERA                                                                 ', 'D', '5', '0', 'A'), ('531015', 'VENTA DE PROPIEDADES PLANTA Y EQUIPO', 'D', '4', '1', 'A'), ('531020', 'VENTA DE INTANGIBLES', 'D', '4', '1', 'A'), ('531025', 'VENTA DE OTROS ACTIVOS', 'D', '4', '1', 'A'), ('531027', 'RETIRO DE INVENTARIOS', 'D', '4', '1', 'A'), ('531030', 'RETIRO DE PROPIEDADES PLANTA Y EQUIPO', 'D', '4', '1', 'A'), ('531035', 'RETIRO DE OTROS ACTIVOS', 'D', '4', '1', 'A'), ('531040', 'PERDIDAS POR SINIESTROS', 'D', '4', '1', 'A'), ('53104001', 'PERDIDA EN EFECTIVO', 'D', '5', '0', 'A'), ('53104002', 'PERDIDA POR SINIESTRO FRAUDE', 'D', '5', '0', 'A'), ('531095', 'OTROS', 'D', '4', '1', 'A'), ('5315', 'GASTOS EXTRAORDINARIOS', 'D', '3', '1', 'A'), ('531505', 'COSTAS Y PROCESOS JUDICIALES', 'D', '4', '1', 'A'), ('531510', 'ACTIVIDADES CULTURALES Y CIVICAS', 'D', '4', '1', 'A'), ('53151001', 'ACTIVIDADES CULTURALES Y CIVICAS', 'D', '5', '0', 'A'), ('53151002', 'ACTIVIDADES CULTURALES Y CIVICAS-IVA NO DEDUCIBLE', 'D', '5', '0', 'A'), ('531520', 'IMPUESTOS ASUMIDOS', 'D', '4', '1', 'A'), ('53152001', 'IMPUESTOS ASUMIDOS RETENCION CREE', 'D', '5', '0', 'A'), ('531595', 'OTROS', 'D', '4', '1', 'A'), ('5395', 'GASTOS DIVERSOS', 'D', '3', '1', 'A'), ('539505', 'DEMANDAS LABORALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539510', 'DEMANDAS POR INCUMPLIMIENTO DE CONTRATOS', 'D', '4', '1', 'A'), ('539515', 'INDEMNIZACIONES', 'D', '4', '1', 'A'), ('539520', 'MULTAS, SANCIONES Y LITIGIOS', 'D', '4', '1', 'A'), ('53952001', 'SANCIONES IMPUESTOS MUNICIPALES', 'D', '5', '0', 'A'), ('53952002', 'MULTAS, SANCIONES SUPERSOLIDARIA', 'D', '5', '0', 'A'), ('53952003', 'MULTAS SECRETARIA DISTRITAL DE MOVILIDAD', 'D', '5', '0', 'A'), ('53952004', 'MULTAS - IVA DEUCIBLE', 'D', '5', '0', 'A'), ('539525', 'INTERESES SOBRE MULTAS, SANCIONES Y LITIGIOS.', 'D', '4', '1', 'A'), ('53952501', 'INTERESES SOBRE MULTAS, SANCIONES Y LITIGIOS', 'D', '5', '0', 'A'), ('539530', 'DONACIONES', 'D', '4', '1', 'A'), ('539535', 'CONSTITUCION DE GARANTIAS', 'D', '4', '1', 'A'), ('539540', 'AMORTIZACION DE BIENES ENTREGADOS EN COMODATO', 'D', '4', '1', 'A'), ('539545', 'GASTOS DE DIRECTIVOS', 'D', '4', '1', 'A'), ('539550', 'REUNIONES Y CONFERENCIAS', 'D', '4', '1', 'A'), ('539555', 'ARRENDAMIENTOS Y ALQUILERES', 'D', '4', '1', 'A'), ('539595', 'OTROS', 'D', '4', '1', 'A'), ('53959501', 'ADECUACIONES FESTIVAS', 'D', '5', '0', 'A'), ('53959503', 'IMPUESTOS', 'D', '5', '0', 'A'), ('53959510', 'AJUSTE AL PESO', 'D', '5', '0', 'A'), ('53959511', 'GASTOS DE VIAJE', 'D', '5', '0', 'A'), ('53959514', 'CASINO Y RESTAURANTE', 'D', '5', '0', 'A'), ('53959515', 'GASTOS ASUMIDOS RETEFUENTE VENDEDORES', 'D', '5', '0', 'A'), ('53959520', 'OTROS GASTOS', 'D', '5', '0', 'A'), ('53959521', 'GASTOS ASUMIDOS SALDOS EN LIBRANZAS                                              ', 'D', '5', '0', 'A'), ('53959522', 'IMPUESTOS SINCELEJO', 'D', '5', '0', 'A'), ('54', 'GASTOS EJERCICIOS ANTERIORES', 'D', '2', '1', 'A'), ('5405', 'GASTOS EJERCICIOS ANTERIORES', 'D', '3', '1', 'A'), ('540505', 'GASTOS EJERCICIOS ANTERIORES', 'D', '4', '0', 'A'), ('54050501', 'GASTOS EJERCICIOS ANTERIORES', 'D', '5', '0', 'A'), ('58', 'IM PUESTO DE  RENTA Y COMPLEMENTARIOS', 'D', '2', '1', 'A'), ('5805', 'IM PUESTO DE  RENTA Y COMPLEMENTARIOS', 'D', '3', '1', 'A'), ('580505', 'IMPUESTO DE RENTA Y COMPLEMENTARIOS', 'D', '4', '0', 'A'), ('58050501', 'IMPUESTO DE RENTA Y COMPLEMENTARIOS', 'D', '5', '0', 'A'), ('59', 'EXCEDENTES Y/O PÉRDIDAS', 'D', '2', '1', 'A'), ('5905', 'EXCEDENTES Y/O PÉRDIDAS', 'D', '3', '1', 'A'), ('590505', 'EXCEDENTES Y/O PÈRDIDAS', 'D', '4', '1', 'A'), ('59050501', 'EXCEDENTES Y/O PERDIDAS', 'D', '5', '0', 'A'), ('6', 'COSTOS DE VENTAS', 'D', '1', '1', 'A'), ('61', 'COSTO DE VENTAS Y DE PRESTACION DE SERVICIOS', 'D', '2', '1', 'A'), ('6105', 'AGRICULTURA, GANADERIA, CAZA Y SILVICULTURA', 'D', '3', '1', 'A'), ('610505', 'CULTIVO DE CEREALES', 'D', '4', '1', 'A'), ('610510', 'CULTIVOS DE HORTALIZAS, LEGUMBRES Y PLANTAS ORNAMENTALES', 'D', '4', '1', 'A'), ('610515', 'CULTIVOS DE FRUTAS, NUECES Y PLANTAS AROMATICAS', 'D', '4', '1', 'A'), ('610520', 'CULTIVO DE CAFE', 'D', '4', '1', 'A'), ('610525', 'CULTIVO DE FLORES', 'D', '4', '1', 'A'), ('610530', 'CULTIVO DE CAÑA DE AZUCAR', 'D', '4', '1', 'A'), ('610535', 'CULTIVO DE ALGODON Y PLANTAS PARA MATERIAL TEXTIL', 'D', '4', '1', 'A'), ('610540', 'CULTIVO DE BANANO', 'D', '4', '1', 'A'), ('610545', 'OTROS CULTIVOS AGRICOLAS', 'D', '4', '1', 'A'), ('610550', 'CRIA DE OVEJAS, CABRAS, ASNOS, MULAS Y BURDEGANOS', 'D', '4', '1', 'A'), ('610555', 'CRIA DE GANADO CABALLAR Y VACUNO.', 'D', '4', '1', 'A'), ('610560', 'PRODUCCION AVICOLA', 'D', '4', '1', 'A'), ('610565', 'CRIA DE OTROS ANIMALES', 'D', '4', '1', 'A'), ('610570', 'SERVICIOS AGRICOLAS Y GANADEROS', 'D', '4', '1', 'A'), ('610575', 'ACTIVIDAD DE CAZA', 'D', '4', '1', 'A'), ('610580', 'ACTIVIDAD DE SILVICULTURA', 'D', '4', '1', 'A'), ('6110', 'PESCA', 'D', '3', '1', 'A'), ('611005', 'ACTIVIDAD DE PESCA', 'D', '4', '1', 'A'), ('611010', 'EXPLOTACION DE CRIADEROS DE PECES', 'D', '4', '1', 'A'), ('611095', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A'), ('6115', 'EXPLOTACION DE MINAS Y CANTERAS', 'D', '3', '1', 'A'), ('611505', 'CARBON', 'D', '4', '1', 'A'), ('611510', 'PETROLEO CRUDO', 'D', '4', '1', 'A'), ('611512', 'GAS NATURAL', 'D', '4', '1', 'A'), ('611514', 'SERVICIOS RELACIONADOS CON EXTRACCION DE PETROLEO Y GAS', 'D', '4', '1', 'A'), ('611515', 'MINERALES DE HIERRO', 'D', '4', '1', 'A'), ('611520', 'MINERALES METALIFEROS NO FERROSOS', 'D', '4', '1', 'A'), ('611525', 'PIEDRA, ARENA Y ARCILLA', 'D', '4', '1', 'A'), ('611527', 'PIEDRAS PRECIOSAS', 'D', '4', '1', 'A'), ('611528', 'ORO', 'D', '4', '1', 'A'), ('611530', 'OTRAS MINAS Y CANTERAS', 'D', '4', '1', 'A'), ('611532', 'PRESTACION DE SERVICIOS SECTOR MINERO', 'D', '4', '1', 'A'), ('611595', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A'), ('6120', 'INDUSTRIAS MANUFACTURERAS', 'D', '3', '1', 'A'), ('612001', 'PRODUCCION Y PROCESAMIENTO DE CARNES Y PRODUCTOS CARNICOS', 'D', '4', '1', 'A'), ('612002', 'PRODUCTOS DE PESCADO', 'D', '4', '1', 'A'), ('612003', 'PRODUCTOS DE FRUTAS, LEGUMBRES Y HORTALIZAS', 'D', '4', '1', 'A'), ('612004', 'ELABORACION DE ACEITES Y GRASAS', 'D', '4', '1', 'A'), ('612005', 'ELABORACION DE PRODUCTOS LACTEOS', 'D', '4', '1', 'A'), ('612006', 'ELABORACION DE PRODUCTOS DE MOLINERIA', 'D', '4', '1', 'A'), ('612007', 'ELABORACION DE ALMIDONES Y DERIVADOS', 'D', '4', '1', 'A'), ('612008', 'ELABORACION DE ALIMENTOS PARA ANIMALES', 'D', '4', '1', 'A'), ('612009', 'ELABORACION DE PRODUCTOS PARA PANADERIA', 'D', '4', '1', 'A'), ('612010', 'ELABORACION DE AZUCAR Y MELAZAS', 'D', '4', '1', 'A'), ('612011', 'ELABORACION DE CACAO, CHOCOLATE Y CONFITERIA', 'D', '4', '1', 'A'), ('612012', 'ELABORACION DE PASTAS  Y PRODUCTOS FARINACEOS', 'D', '4', '1', 'A'), ('612013', 'ELABORACION DE PRODUCTOS DE CAFE', 'D', '4', '1', 'A'), ('612014', 'ELABORACION DE OTROS PRODUCTOS ALIMENTICIOS', 'D', '4', '1', 'A'), ('612015', 'ELABORACION DE BEBIDAS ALCOHOLICAS Y ALCOHOL ETILICO', 'D', '4', '1', 'A'), ('612016', 'ELABORACION DE VINOS', 'D', '4', '1', 'A'), ('612017', 'ELABORACION DE BEBIDAS MALTEADAS Y DE MALTA', 'D', '4', '1', 'A'), ('612018', 'ELABORACION DE BEBIDAS NO ALCOHOLICAS', 'D', '4', '1', 'A'), ('612019', 'ELABORACION DE PRODUCTOS DE TABACO', 'D', '4', '1', 'A'), ('612020', 'PREPARACION E HILATURA DE FIBRAS TEXTILES Y TEJEDURIA', 'D', '4', '1', 'A'), ('612021', 'ACABADO DE PRODUCTOS TEXTILES', 'D', '4', '1', 'A'), ('612022', 'ELABORACION DE ARTICULOS DE MATERIALES TEXTILES', 'D', '4', '1', 'A'), ('612023', 'ELABORACION DE TAPICES Y ALFOMBRAS', 'D', '4', '1', 'A'), ('612024', 'ELABORACION DE CUERDAS, CORDELES, BRAMANTES Y REDES', 'D', '4', '1', 'A'), ('612025', 'ELABORACION DE OTROS PRODUCTOS TEXTILES', 'D', '4', '1', 'A'), ('612026', 'ELABORACION DE TEJIDOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612027', 'ELABORACION DE PRENDAS DE VESTIR', 'D', '4', '1', 'A'), ('612028', 'PREPARACION, ADOBO Y TEÑIDO DE PIELES', 'D', '4', '1', 'A'), ('612029', 'CURTIDO, ADOBO O PREPARACION DE CUERO', 'D', '4', '1', 'A'), ('612030', 'ELABORACION DE MALETAS, BOLSOS Y SIMILARES', 'D', '4', '1', 'A'), ('612031', 'ELABORACION DE CALZADO', 'D', '4', '1', 'A'), ('612032', 'PRODUCCION DE MADERA, ARTICULOS DE MADERA Y CORCHO', 'D', '4', '1', 'A'), ('612033', 'ELABORACION DE PASTA Y PRODUCTOS DE MADERA, PAPEL Y CARTON', 'D', '4', '1', 'A'), ('612034', 'EDICIONES Y PUBLICACIONES', 'D', '4', '1', 'A'), ('612035', 'IMPRESION', 'D', '4', '1', 'A'), ('612036', 'SERVICIOS RELACIONADOS CON LA EDICION Y LA IMPRESION', 'D', '4', '1', 'A'), ('612037', 'REPRODUCCION DE GRABACIONES', 'D', '4', '1', 'A'), ('612038', 'ELABORACION DE PRODUCTOS DE HORNO DE COQUE', 'D', '4', '1', 'A'), ('612039', 'ELABORACION DE PRODUCTOS DE LA REFINACION DE PETROLEO', 'D', '4', '1', 'A'), ('612040', 'ELABORACION DE SUSTANCIAS QUIMICAS BASICAS', 'D', '4', '1', 'A'), ('612041', 'ELABORACION DE ABONOS Y COMPUESTOS DE NITROGENO', 'D', '4', '1', 'A'), ('612042', 'ELABORACION DE PLASTICO Y CAUCHO SINTETICO', 'D', '4', '1', 'A'), ('612043', 'ELABORACION DE PRODUCTOS QUIMICOS DE USO AGROPECUARIO', 'D', '4', '1', 'A'), ('612044', 'ELABORACION DE PINTURAS, TINTAS Y MASILLAS', 'D', '4', '1', 'A'), ('612045', 'ELABORACION DE PRODUCTOS FARMACEUTICOS Y BOTANICOS', 'D', '4', '1', 'A'), ('612046', 'ELABORACION DE JABONES, DETERGENTES Y PREPARADOS DE TOCADOR', 'D', '4', '1', 'A'), ('612047', 'ELABORACION DE OTROS PRODUCTOS QUIMICOS', 'D', '4', '1', 'A'), ('612048', 'ELABORACION DE FIBRAS', 'D', '4', '1', 'A'), ('612049', 'ELABORACION DE OTROS PRODUCTOS DE CAUCHO', 'D', '4', '1', 'A'), ('612050', 'ELABORACION DE PRODUCTOS DE PLASTICO', 'D', '4', '1', 'A'), ('612051', 'ELABORACION DE VIDRIO Y PRODUCTOS DE VIDRIO', 'D', '4', '1', 'A'), ('612052', 'ELABORACION DE PRODUCTOS DE CERAMICA, LOZA, PIEDRA, ARCILLA Y PORCELANA', 'D', '4', '1', 'A'), ('612053', 'ELABORACION DE CEMENTO, CAL Y YESO', 'D', '4', '1', 'A'), ('612054', 'ELABORACION DE ARTICULOS DE HORMIGON, CEMENTO Y YESO', 'D', '4', '1', 'A'), ('612055', 'CORTE, TALLADO Y ACABADO DE LA PIEDRA', 'D', '4', '1', 'A'), ('612056', 'ELABORACION DE OTROS PRODUCTOS MINERALES NO METALICOS', 'D', '4', '1', 'A'), ('612057', 'INDUSTRIAS BASICAS Y FUNDICION DE HIERRO Y ACERO', 'D', '4', '1', 'A'), ('612058', 'PRODUCTOS PRIMARIOS DE METALES PRECIOSOS Y DE METALES NO  FERROSOS', 'D', '4', '1', 'A'), ('612059', 'FUNDICION DE METALES NO FERROSOS', 'D', '4', '1', 'A'), ('612060', 'FABRICACION DE PRODUCTOS METALICOS PARA USO ESTRUCTURAL', 'D', '4', '1', 'A'), ('612061', 'FORJA, PRENSADO, ESTAMPADO, LAMINADO DE METAL YPULVIMETALURGIA', 'D', '4', '1', 'A'), ('612062', 'REVESTIMIENTO DE METALES Y OBRAS DE INGENIERIA MECANICA', 'D', '4', '1', 'A'), ('612063', 'FABRICACION DE ARTICULOS DE FERRETERIA', 'D', '4', '1', 'A'), ('612064', 'ELABORACION DE OTROS PRODUCTOS DE METAL', 'D', '4', '1', 'A'), ('612065', 'FABRICACION DE MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A'), ('612066', 'FABRICACION DE EQUIPOS DE ELEVACION Y MANIPULACION', 'D', '4', '1', 'A'), ('612067', 'ELABORACION DE APARATOS DE USO DOMESTICO', 'D', '4', '1', 'A'), ('612068', 'ELABORACION DE EQUIPO DE OFICINA', 'D', '4', '1', 'A'), ('612069', 'ELABORACION DE PILAS Y BATERIAS PRIMARIAS', 'D', '4', '1', 'A'), ('612070', 'ELABORACION DE EQUIPO DE ILUMINACION', 'D', '4', '1', 'A'), ('612071', 'ELABORACION DE OTROS TIPOS DE EQUIPO ELECTRICO', 'D', '4', '1', 'A'), ('612072', 'FABRICACION DE EQUIPOS DE RADIO, TELEVISION Y COMUNICACIONES', 'D', '4', '1', 'A'), ('612073', 'FABRICACION DE APARATOS E INSTRUMENTOS MEDICOS', 'D', '4', '1', 'A'), ('612074', 'FABRICACION DE INSTRUMENTOS DE MEDICION Y CONTROL', 'D', '4', '1', 'A'), ('612075', 'FABRICACION DE INSTRUMENTOS DE OPTICA Y EQUIPO FOTOGRAFICO', 'D', '4', '1', 'A'), ('612076', 'FABRICACION DE RELOJES', 'D', '4', '1', 'A'), ('612077', 'FABRICACION DE VEHICULOS AUTOMOTORES', 'D', '4', '1', 'A'), ('612078', 'FABRICACION DE CARROCERIAS PARA AUTOMOTORES', 'D', '4', '1', 'A'), ('612079', 'FABRICACION DE PARTES PIEZAS Y ACCESORIOS PARA AUTOMOTORES', 'D', '4', '1', 'A'), ('612080', 'FABRICACION Y REPARACION DE BUQUES Y OTRAS EMBARCACIONES', 'D', '4', '1', 'A'), ('612081', 'FABRICACION DE LOCOMOTORAS Y MATERIAL RODANTE PARA  FERROCARRILES', 'D', '4', '1', 'A'), ('612082', 'FABRICACION DE AERONAVES', 'D', '4', '1', 'A'), ('612083', 'FABRICACION DE MOTOCICLETAS', 'D', '4', '1', 'A'), ('612084', 'FABRICACION DE BICICLETAS Y SILLAS DE RUEDAS', 'D', '4', '1', 'A'), ('612085', 'FABRICACION DE OTROS TIPOS DE TRANSPORTE', 'D', '4', '1', 'A'), ('612086', 'FABRICACION DE MUEBLES', 'D', '4', '1', 'A'), ('612087', 'FABRICACION DE JOYAS Y ARTICULOS CONEXOS', 'D', '4', '1', 'A'), ('612088', 'FABRICACION DE INSTRUMENTOS DE MUSICA', 'D', '4', '1', 'A'), ('612089', 'FABRICACION DE ARTICULOS Y EQUIPO PARA DEPORTE', 'D', '4', '1', 'A'), ('612090', 'FABRICACION DE JUEGOS Y JUGUETES', 'D', '4', '1', 'A'), ('612091', 'RECICLAMIENTO DE DESPERDICIOS', 'D', '4', '1', 'A'), ('612095', 'PRODUCTOS DE OTRAS INDUSTRIAS MANUFACTURERAS', 'D', '4', '1', 'A'), ('6125', 'SUMINISTRO DE ELECTRICIDAD, GAS Y AGUA', 'D', '3', '1', 'A'), ('612505', 'GENERACION, CAPTACION Y DISTRIBUCION DE ENERGIA ELECTRICA', 'D', '4', '1', 'A'), ('612510', 'FABRICACION DE GAS Y DISTRIBUCION DE COMBUSTIBLES GASEOSOS', 'D', '4', '1', 'A'), ('612515', 'CAPTACION, DEPURACION Y DISTRIBUCION DE AGUA', 'D', '4', '1', 'A'), ('612595', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A'), ('6130', 'CONSTRUCCION', 'D', '3', '1', 'A'), ('613005', 'PREPARACION DE TERRENOS', 'D', '4', '1', 'A'), ('613010', 'CONSTRUCCION DE EDIFICIOS Y OBRAS DE INGENIERIA CIVIL', 'D', '4', '1', 'A'), ('613015', 'ACONDICIONAMIENTO DE EDIFICIOS', 'D', '4', '1', 'A'), ('613020', 'TERMINACION DE EDIFICACIONES', 'D', '4', '1', 'A'), ('613025', 'ALQUILER DE EQUIPO CON OPERARIO', 'D', '4', '1', 'A'), ('613095', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A'), ('6135', 'COMERCIO AL POR MAYOR Y AL POR MENOR', 'D', '3', '1', 'A'), ('613502', 'VENTA DE VEHICULOS AUTOMOTORES', 'D', '4', '1', 'A'), ('613504', 'MANTENIMIENTO, REPARACION Y LAVADO DE VEHICULOS AUTOMOTORES', 'D', '4', '1', 'A'), ('613506', 'VENTA DE PARTES, PIEZAS Y ACCESORIOS DE VEHICULOS AUTOMOTORES', 'D', '4', '1', 'A'), ('613508', 'VENTA DE COMBUSTIBLES SÓLIDOS, LIQUIDOS, GASEOSOS', 'D', '4', '1', 'A'), ('613510', 'VENTA DE LUBRICANTES, ADITIVOS, LLANTAS Y LUJOS PARA AUTOMOTORES', 'D', '4', '1', 'A'), ('613512', 'VENTA A CAMBIO DE RETRIBUCION O POR CONTRATA', 'D', '4', '1', 'A'), ('613514', 'VENTA DE INSUMOS, MATERIAS PRIMAS AGROPECUARIAS Y FLORES', 'D', '4', '1', 'A'), ('613516', 'VENTA DE OTROS INSUMOS Y MATERIAS PRIMAS NO AGROPECUARIAS', 'D', '4', '1', 'A'), ('613518', 'VENTA DE ANIMALES VIVOS Y CUEROS', 'D', '4', '1', 'A'), ('613520', 'VENTA DE PRODUCTOS EN ALMACENES NO ESPECIALIZADOS', 'D', '4', '1', 'A'), ('613522', 'VENTA DE PRODUCTOS AGROPECUARIOS', 'D', '4', '1', 'A'), ('613524', 'VENTA DE PRODUCTOS TEXTILES, DE VESTIR, DE CUERO Y CALZADO', 'D', '4', '1', 'A'), ('613526', 'VENTA DE PAPEL Y CARTON', 'D', '4', '1', 'A'), ('613528', 'VENTA DE LIBROS, REVISTAS, ELEMENTOS DE PAPELERIA, UTILES Y TEXTOS  ESCOLARES', 'D', '4', '1', 'A'), ('613530', 'VENTA DE JUEGOS, JUGUETES Y ARTICULOS DEPORTIVOS', 'D', '4', '1', 'A'), ('613532', 'VENTA DE INSTRUMENTOS QUIRURGICOS Y ORTOPEDICOS', 'D', '4', '1', 'A'), ('613534', 'VENTA DE ARTICULOS EN RELOJERIAS Y JOYERIAS', 'D', '4', '1', 'A'), ('613536', 'VENTA DE ELECTRODOMESTICOS Y MUEBLES', 'D', '4', '1', 'A'), ('613538', 'VENTA DE PRODUCTOS DE ASEO, FARMACEUTICOS, MEDICINALES, Y ARTICULOS DE TOCADOR', 'D', '4', '1', 'A'), ('613540', 'VENTA DE CUBIERTOS, VAJILLAS, CRISTALERIA, PORCELANAS, CERAMICAS Y OTROS', 'D', '4', '1', 'A'), ('613542', 'VENTA DE MATERIALES DE CONSTRUCCION, FONTANERIA Y CALEFACCIÓN.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613544', 'VENTA DE PINTURAS Y LACAS', 'D', '4', '1', 'A'), ('613546', 'VENTA DE PRODUCTOS DE VIDRIOS Y MARQUETERIA', 'D', '4', '1', 'A'), ('613548', 'VENTA DE HERRAMIENTAS Y ARTICULOS DE FERRETERIA', 'D', '4', '1', 'A'), ('613550', 'VENTA DE QUIMICOS', 'D', '4', '1', 'A'), ('613552', 'VENTA DE PRODUCTOS INTERMEDIOS, DESPERDICIOS Y DESECHOS', 'D', '4', '1', 'A'), ('613554', 'VENTA DE MAQUINARIA, EQUIPO DE OFICINA Y PROGRAMAS DE COMPUTADOR', 'D', '4', '1', 'A'), ('613556', 'VENTA DE ARTICULOS EN CACHARRERIAS Y MISCELANEAS', 'D', '4', '1', 'A'), ('613558', 'VENTA DE INSTRUMENTOS MUSICALES', 'D', '4', '1', 'A'), ('613560', 'VENTA DE ARTICULOS EN CASAS DE EMPEÑO Y PRENDERIAS', 'D', '4', '1', 'A'), ('613562', 'VENTA DE EQUIPO FOTOGRAFICO', 'D', '4', '1', 'A'), ('613564', 'VENTA DE EQUIPO OPTICO Y DE PRECISION', 'D', '4', '1', 'A'), ('613566', 'VENTA DE EMPAQUES', 'D', '4', '1', 'A'), ('613568', 'VENTA DE EQUIPO PROFESIONAL Y CIENTIFICO', 'D', '4', '1', 'A'), ('613572', 'REPARACION DE EFECTOS PERSONALES Y ELECTRODOMESTICOS', 'D', '4', '1', 'A'), ('613595', 'VENTA DE OTROS PRODUCTOS', 'D', '4', '1', 'A'), ('6140', 'HOTELES Y RESTAURANTES', 'D', '3', '1', 'A'), ('614005', 'HOTELERIA', 'D', '4', '1', 'A'), ('614010', 'CAMPAMENTO Y OTROS TIPOS DE HOSPEDAJE', 'D', '4', '1', 'A'), ('614015', 'RESTAURANTES', 'D', '4', '1', 'A'), ('614020', 'BARES Y CANTINAS', 'D', '4', '1', 'A'), ('614095', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A'), ('6145', 'TRANSPORTE, ALMACENAMIENTO Y COMUNICACIONES', 'D', '3', '1', 'A'), ('614505', 'SERVICIO DE TRANSPORTE POR CARRETERA', 'D', '4', '1', 'A'), ('614510', 'SERVICIO DE TRANSPORTE POR VIA FERREA', 'D', '4', '1', 'A'), ('614515', 'SERVICIO DE TRANSPORTE POR VIA ACUATICA', 'D', '4', '1', 'A'), ('614520', 'SERVICIO DE TRANSPORTE POR VIA AEREA', 'D', '4', '1', 'A'), ('614525', 'SERVICIO DE TRANSPORTE POR TUBERIAS', 'D', '4', '1', 'A'), ('614530', 'MANIPULACION DE CARGA', 'D', '4', '1', 'A'), ('614535', 'ALMACENAMIENTO Y DEPÓSITO', 'D', '4', '1', 'A'), ('614540', 'SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE', 'D', '4', '1', 'A'), ('614545', 'AGENCIAS DE VIAJE', 'D', '4', '1', 'A'), ('614550', 'OTRAS AGENCIAS DE TRANSPORTE', 'D', '4', '1', 'A'), ('614555', 'SERVICIO POSTAL Y DE CORREO', 'D', '4', '1', 'A'), ('614560', 'SERVICIO TELEFONICO', 'D', '4', '1', 'A'), ('614565', 'SERVICIO DE TELEGRAFO', 'D', '4', '1', 'A'), ('614570', 'SERVICIO DE TRANSMISION DE DATOS', 'D', '4', '1', 'A'), ('614575', 'SERVICIO DE RADIO Y TELEVISION POR CABLE', 'D', '4', '1', 'A'), ('614580', 'TRANSMISION DE SONIDO E IMAGENES POR CONTRATO', 'D', '4', '1', 'A'), ('614595', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A'), ('6150', 'ACTIVIDAD FINANCIERA', 'D', '3', '1', 'A'), ('615005', 'INTERESES DEPOSITOS DE AHORRO ORDINARIO', 'D', '4', '1', 'A'), ('615010', 'INTERESES DEPOSITOS DE AHORRO A TÉRMINO', 'D', '4', '1', 'A'), ('615015', 'INTERESES AHORRO CONTRACTUAL', 'D', '4', '1', 'A'), ('615020', 'INTERESES AHORRO PERMANENTE', 'D', '4', '1', 'A'), ('615035', 'CONTRIBUCION EMERGENCIA  ECONOMICA', 'D', '4', '1', 'A'), ('615040', 'DIFERENCIA EN CAMBIO', 'D', '4', '1', 'A'), ('615045', 'PACTO DE REAJUSTE', 'D', '4', '1', 'A'), ('615050', 'INTERESES COMPROMISOS DE RECOMPRA INVERSIONES', 'D', '4', '1', 'A'), ('615055', 'INTERESES COMPROMISOS DE RECOMPRA DE CARTERA', 'D', '4', '1', 'A'), ('615060', 'INTERESES DE CREDITOS BANCARIOS Y FINANCIEROS', 'D', '4', '1', 'A'), ('615095', 'OTROS', 'D', '4', '1', 'A'), ('6155', 'ACTIVIDADES INMOBILIARIAS, EMPRESARIALES Y DE ALQUILER', 'D', '3', '1', 'A'), ('615505', 'ARRENDAMIENTOS DE BIENES INMUEBLES', 'D', '4', '1', 'A'), ('615510', 'INMOBILIARIAS POR RETRIBUCION O CONTRATA', 'D', '4', '1', 'A'), ('615515', 'ALQUILER EQUIPO DE TRANSPORTE', 'D', '4', '1', 'A'), ('615520', 'ALQUILER MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A'), ('615525', 'ALQUILER DE EFECTOS PERSONALES Y ENSERES DOMESTICOS', 'D', '4', '1', 'A'), ('615530', 'CONSULTORIA EN EQUIPO Y PROGRAMAS DE INFORMATICA', 'D', '4', '1', 'A'), ('615535', 'PROCESAMIENTO DE DATOS', 'D', '4', '1', 'A'), ('615540', 'MANTENIMIENTO Y REPARACION DE MAQUINARIA DE OFICINA', 'D', '4', '1', 'A'), ('615545', 'INVESTIGACIONES CIENTIFICAS Y DE DESARROLLO', 'D', '4', '1', 'A'), ('615550', 'ACTIVIDADES EMPRESARIALES DE CONSULTORIA', 'D', '4', '1', 'A'), ('615555', 'PUBLICIDAD', 'D', '4', '1', 'A'), ('615560', 'DOTACION DE PERSONAL', 'D', '4', '1', 'A'), ('615565', 'INVESTIGACION Y SEGURIDAD', 'D', '4', '1', 'A'), ('615570', 'LIMPIEZA DE INMUEBLES', 'D', '4', '1', 'A'), ('615575', 'FOTOGRAFIA', 'D', '4', '1', 'A'), ('615580', 'ENVASE Y EMPAQUE', 'D', '4', '1', 'A'), ('615585', 'FOTOCOPIADO', 'D', '4', '1', 'A'), ('615590', 'MANTENIMIENTO Y REPARACION DE MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A'), ('615595', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A'), ('6160', 'ENSEÑANZA', 'D', '3', '1', 'A'), ('616005', 'ACTIVIDADES RELACIONADAS CON LA EDUCACIÓN', 'D', '4', '1', 'A'), ('616010', 'CERTIFICACIONES', 'D', '4', '1', 'A'), ('616015', 'FORMULARIOS', 'D', '4', '1', 'A'), ('616020', 'VALOR DE DERECHOS', 'D', '4', '1', 'A'), ('616025', 'PAZ Y SALVO', 'D', '4', '1', 'A'), ('616095', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A'), ('6165', 'SERVICIOS SOCIALES Y DE SALUD', 'D', '3', '1', 'A'), ('616505', 'SERVICIO HOSPITALARIO', 'D', '4', '1', 'A'), ('616510', 'SERVICIO MEDICO', 'D', '4', '1', 'A'), ('616515', 'SERVICIO ODONTOLOGICO', 'D', '4', '1', 'A'), ('616520', 'SERVICIO DE LABORATORIO', 'D', '4', '1', 'A'), ('616525', 'ACTIVIDADES VETERINARIAS', 'D', '4', '1', 'A'), ('616530', 'ACTIVIDADES DE SERVICIOS SOCIALES', 'D', '4', '1', 'A'), ('616595', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A'), ('6170', 'OTRAS ACTIVIDADES DE SERVICIOS COMUNES, SOCIALES Y PERSONALES', 'D', '3', '1', 'A'), ('617005', 'ELIMINACION DE DESPERDICIOS Y AGUAS RESIDUALES', 'D', '4', '1', 'A'), ('617010', 'ACTIVIDADES DE ASOCIACION', 'D', '4', '1', 'A'), ('617015', 'PRODUCCION Y DISTRIBUCION DE FILMES Y VIDEOCINTAS', 'D', '4', '1', 'A'), ('617020', 'EXHIBICION DE FILMES Y VIDEOCINTAS', 'D', '4', '1', 'A'), ('617025', 'ACTIVIDAD DE RADIO Y TELEVISION', 'D', '4', '1', 'A'), ('617030', 'ACTIVIDAD TEATRAL, MUSICAL Y ARTISTICA', 'D', '4', '1', 'A'), ('617035', 'GRABACION Y PRODUCCION DE DISCOS', 'D', '4', '1', 'A'), ('617040', 'ENTRETENIMIENTO Y ESPARCIMIENTO', 'D', '4', '1', 'A'), ('617045', 'AGENCIAS DE NOTICIAS', 'D', '4', '1', 'A'), ('617050', 'LAVANDERIAS Y SIMILARES', 'D', '4', '1', 'A'), ('617055', 'PELUQUERIAS Y SIMILARES', 'D', '4', '1', 'A'), ('617060', 'SERVICIOS FUNERARIOS', 'D', '4', '1', 'A'), ('617062', 'VIGILANCIA Y SEGURIDAD PRIVADA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617065', 'ZONAS FRANCAS', 'D', '4', '1', 'A'), ('617070', 'SERVICIOS DE ASISTENCIA TÉCNICA', 'D', '4', '1', 'A'), ('617072', 'SERVICIO DE SISTEMAS  Y COMPUTACION', 'D', '4', '1', 'A'), ('617075', 'SERVICIO DE ASESORIAS EN GENERAL', 'D', '4', '1', 'A'), ('617080', 'SERVICIO DE REVISORIAS Y AUDITORIAS', 'D', '4', '1', 'A'), ('617085', 'SERVICIO DE ASESORIA JURÍDICA', 'D', '4', '1', 'A'), ('617090', 'SERVICIOS VARIOS', 'D', '4', '1', 'A'), ('617095', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A'), ('6175', 'SERVICIO  DE CREDITO', 'D', '3', '1', 'A'), ('617505', 'INTERESES DEPOSITOS DE AHORRO ORDINARIO', 'D', '4', '1', 'A'), ('617510', 'INTERESES CERTIFICADOS DE DEPOSITOS DE AHORRO A TÉRMINO', 'D', '4', '1', 'A'), ('617515', 'INTERESES AHORRO CONTRACTUAL', 'D', '4', '1', 'A'), ('617520', 'INTERESES AHORRO PERMANENTE', 'D', '4', '1', 'A'), ('617525', 'INTERESES COMROMISOS DE RECOMRA INVERSIONES', 'D', '4', '1', 'A'), ('617530', 'INTERESES COMROMISOS DE RECOMPRA DE CARTERA', 'D', '4', '1', 'A'), ('617535', 'IMPUESTO 3x1000', 'D', '4', '1', 'A'), ('617540', 'DIFERENCIA EN CAMBIO', 'D', '4', '1', 'A'), ('617545', 'PACTO DE REAJUSTE', 'D', '4', '1', 'A'), ('617550', 'INTERESES CREDITOS BANCARIOS Y FINANCIEROS', 'D', '4', '1', 'A'), ('61755001', 'INTERESES CREDITOS BANCARIOS Y FINANCIEROS', 'D', '5', '0', 'A'), ('61755002', 'INTERESES DE MORA CREDITOS BANCARIOS Y FINANCIEROS', 'D', '5', '0', 'A'), ('617595', 'OTROS', 'D', '4', '1', 'A'), ('61759501', 'OTROS INTERESES SERVICIOS DE CREDITO', 'D', '5', '0', 'A'), ('62', 'COMPRAS', 'D', '2', '1', 'A'), ('6205', 'DE MERCANCIAS', 'D', '3', '1', 'A'), ('6210', 'DE MATERIAS PRIMAS', 'D', '3', '1', 'A'), ('6215', 'DE MATERIALES INDIRECTOS', 'D', '3', '1', 'A'), ('6220', 'COMPRA DE ENERGIA', 'D', '3', '1', 'A'), ('6225', 'DEVOLUCIONES REBAJAS Y DESCUENTOS EN COMPRAS (CR)', 'D', '3', '1', 'A'), ('7', 'COSTOS DE PRODUCCION O DE OPERACION', 'C', '1', '1', 'A'), ('71', 'MATERIA PRIMA', 'C', '2', '1', 'A'), ('72', 'MANO DE OBRA DIRECTA', 'C', '2', '1', 'A'), ('73', 'COSTOS INDIRECTOS', 'C', '2', '1', 'A'), ('74', 'CONTRATOS DE SERVICIOS', 'C', '2', '1', 'A'), ('8', 'CUENTAS DE ORDEN DEUDORAS', 'C', '1', '1', 'A'), ('81', 'DEUDORAS CONTINGENTES', 'C', '2', '1', 'A'), ('8105', 'BIENES Y VALORES ENTREGADOS EN CUSTODIA', 'C', '3', '1', 'A'), ('810505', 'BIENES MUEBLES', 'C', '4', '1', 'A'), ('810510', 'VALORES MOBILIARIOS', 'C', '4', '1', 'A'), ('810595', 'OTROS BIENES', 'C', '4', '1', 'A'), ('8110', 'BIENES Y VALORES ENTREGADOS EN GARANTIA', 'C', '3', '1', 'A'), ('811005', 'BIENES INMUEBLES', 'C', '4', '1', 'A'), ('811010', 'VALORES MOBILIARIOS', 'C', '4', '1', 'A'), ('811020', 'OTROS BIENES', 'C', '4', '1', 'A'), ('8112', 'BIENES Y VALORES EN PODER  DE TERCEROS', 'C', '3', '1', 'A'), ('811205', 'EN ARRENDAMIENTO', 'C', '4', '1', 'A'), ('811210', 'EN PRÉSTAMOS', 'C', '4', '1', 'A'), ('811215', 'EN DEPÓSITO', 'C', '4', '1', 'A'), ('811220', 'EN CONSIGNACIÓN', 'C', '4', '1', 'A'), ('8115', 'LITIGIOS Y/O DEMANDAS', 'C', '3', '1', 'A'), ('811505', 'LITIGIOS Y/O DEMANDAS', 'C', '4', '1', 'A'), ('81150501', 'LITIGIOS Y/O DEMANDAS', 'D', '5', '0', 'A'), ('8120', 'INTERESES CARTERA DE CREDITO', 'C', '3', '1', 'A'), ('812020', 'CATEGORIA C RIESGO APRECIABLE, VIVIENDA', 'C', '4', '1', 'A'), ('812022', 'CATEGORIA D RIESGO SIGNIFICATIVO, VIVIENDA', 'C', '4', '1', 'A'), ('812024', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, VIVIENDA', 'C', '4', '1', 'A'), ('812026', 'CATEGORIA C RIESGO APRECIABLE, CONSUMO', 'C', '4', '1', 'A'), ('81202601', 'CATEGORIA C RIESGO APRECIABLE', 'D', '5', '0', 'A'), ('812028', 'CATEGORIA D RIESGO SIGNIFICATIVO, CONSUMO', 'C', '4', '1', 'A'), ('81202801', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '5', '0', 'A'), ('812030', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, CONSUMO', 'C', '4', '1', 'A'), ('81203001', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '5', '0', 'A'), ('812032', 'CATEGORIA C RIESGO APRECIABLE, MICROCREDITOS', 'C', '4', '1', 'A'), ('812034', 'CATEGORIA D RIESGO SIGNIFICATIVO, MICROCREDITOS', 'C', '4', '1', 'A'), ('812036', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, MICROCREDITOS', 'C', '4', '1', 'A'), ('812038', 'CATEGORIA C RIESGO APRECIABLE, COMERCIAL', 'C', '4', '1', 'A'), ('812040', 'CATEGORIA D RIESGO SIGNIFICATIVO, COMERCIAL', 'C', '4', '1', 'A'), ('812042', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, COMERCIAL', 'C', '4', '1', 'A'), ('8125', 'BIENES Y VALORES EN ADMINISTRACION', 'C', '3', '1', 'A'), ('8185', 'OTRAS DEUDORAS CONTINGENTES', 'C', '3', '1', 'A'), ('818505', 'BIENES ADQUIRIDOS POR RECIBIR', 'C', '4', '1', 'A'), ('818510', 'VALORES ADQUIRIDOS POR RECIBIR', 'C', '4', '1', 'A'), ('818595', 'OTRAS', 'C', '4', '1', 'A'), ('83', 'DEUDORAS DE CONTROL', 'C', '2', '1', 'A'), ('8305', 'CREDITOS A FAVOR NO UTILIZADOS', 'C', '3', '1', 'A'), ('830505', 'PAÍS', 'C', '4', '1', 'A'), ('830510', 'EXTERIOR', 'C', '4', '1', 'A'), ('8310', 'ACTIVOS CASTIGADOS', 'C', '3', '1', 'A'), ('831005', 'INVERSIONES', 'C', '4', '1', 'A'), ('831010', 'INVENTARIOS', 'C', '4', '1', 'A'), ('831015', 'CARTERA DE CRÉDITO', 'C', '4', '1', 'A'), ('83101501', 'CARTERA DE CREDITO', 'D', '5', '0', 'A'), ('831020', 'CARTERA POR VENTA DE BIENES Y SERVICIOS', 'C', '4', '1', 'A'), ('831025', 'CUENTAS POR COBRAR', 'C', '4', '1', 'A'), ('831030', 'PROPIEDADES PLANTA Y EQUIPOS', 'C', '4', '1', 'A'), ('831095', 'OTROS ACTIVOS', 'C', '4', '1', 'A'), ('8320', 'PROPIEDADES, PLANTA Y EQUIPO TOTALMENTE  DEPRECIADOS', 'C', '3', '1', 'A'), ('832005', 'MAUSOLEOS', 'C', '4', '1', 'A'), ('832010', 'EDIFICACIONES', 'C', '4', '1', 'A'), ('832015', 'MUEBLES Y EQUIPO DE OFICINA', 'C', '4', '1', 'A'), ('832020', 'EQUIPO DE CÓMPUTO Y COMUNICACIÓN', 'C', '4', '1', 'A'), ('832025', 'MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A'), ('832030', 'VEHICULOS', 'C', '4', '1', 'A'), ('832035', 'LABORATORIO Y ELEMENTOS DIDÁCTICOS', 'C', '4', '1', 'A'), ('832040', 'SEMOVIENTES', 'C', '4', '1', 'A'), ('832045', 'EQUIPO HOTELES Y RESTAURANTES', 'C', '4', '1', 'A'), ('832050', 'EQUIPO MEDICO   CIENTÍFICO', 'C', '4', '1', 'A'), ('832055', 'ENVASES Y EMPAQUES', 'C', '4', '1', 'A'), ('832060', 'ARMAMENTO DE VIGILANCIA', 'C', '4', '1', 'A'), ('8325', 'APORTES SUSCRITOS POR COBRAR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832505', 'APORTES SUSCRITOS POR COBRAR', 'C', '4', '1', 'A'), ('8330', 'AJUSTES POR INFLACION ACTIVOS', 'C', '3', '1', 'A'), ('833015', 'PROPIEDADES, PLANTA Y EQUIPOS', 'C', '4', '1', 'A'), ('833020', 'CARGOS DIFERIDOS', 'C', '4', '1', 'A'), ('833025', 'OTROS ACTIVOS', 'C', '4', '1', 'A'), ('8385', 'OTRAS DEUDORAS DE CONTROL', 'C', '3', '1', 'A'), ('838505', 'CHEQUES DEVUELTOS', 'C', '4', '1', 'A'), ('838510', 'CHEQUES POSFECHADOS', 'C', '4', '1', 'A'), ('838585', 'OTRAS.', 'C', '4', '1', 'A'), ('86', 'DEUDORAS CONTINGENTES POR CONTRA', 'C', '2', '1', 'A'), ('8605', 'DEUDORAS CONTINGENTES POR EL CONTRARIO (CR)', 'C', '3', '1', 'A'), ('860505', 'DEUDORAS CONTINGENTES POR EL CONTRARIO (CR)', 'C', '4', '0', 'A'), ('86050501', 'DEUDORAS CONTINGENTES POR EL CONTRARIO', 'D', '5', '0', 'A'), ('88', 'DEUDORAS DE CONTROL POR CONTRA', 'C', '2', '1', 'A'), ('8805', 'DEUDORAS DE CONTROL POR CONTRA', 'C', '3', '1', 'A'), ('880505', 'DEUDORAS DE CONTROL POR CONTRA', 'D', '4', '0', 'A'), ('88050501', 'DEUDORAS DE CONTROL POR CONTRA', 'D', '5', '0', 'A'), ('9', 'CUENTAS DE ORDEN ACREEDORAS', 'C', '1', '1', 'A'), ('91', 'ACREEDORAS CONTINGENTES', 'C', '2', '1', 'A'), ('9105', 'BIENES Y VALORES RECIBIDOS EN CUSTODIA', 'C', '3', '1', 'A'), ('910505', 'BIENES MUEBLES', 'C', '4', '1', 'A'), ('91050501', 'BIENES Y VALORES RECIBIDOS EN GUSTODIA', 'C', '5', '0', 'A'), ('910510', 'VALORES MOBILIARIOS', 'C', '4', '1', 'A'), ('9110', 'BIENES Y VALORES RECIBIDOS EN GARANTIA   GARANTIA ADMISIBLE', 'C', '3', '1', 'A'), ('911005', 'DE CREDITOS COMERCIALES', 'C', '4', '1', 'A'), ('911010', 'DE CREDITOS CONSUMO', 'C', '4', '1', 'A'), ('911015', 'DE CREDITOS VIVIENDA', 'C', '4', '1', 'A'), ('911020', 'DE MICROCREDITO', 'C', '4', '1', 'A'), ('911025', 'DE CUENTAS POR COBRAR', 'C', '4', '1', 'A'), ('911095', 'DE OTROS ACTIVOS', 'C', '4', '1', 'A'), ('9115', 'BIENES Y VALORES RECIBIDOS EN GARANTIA   OTRAS GARANTIAS', 'C', '3', '1', 'A'), ('911505', 'DE CREDITOS COMERCIALES', 'C', '4', '1', 'A'), ('911510', 'DE CREDITOS CONSUMO', 'C', '4', '1', 'A'), ('91151001', 'DE CREDITO DE CONSUMO (PAGARES ASOCIADOS)', 'C', '5', '0', 'A'), ('911515', 'DE CREDITOS DE VIVIENDA', 'C', '4', '1', 'A'), ('911520', 'DE MICROCREDITO', 'C', '4', '1', 'A'), ('911595', 'DE OTROS ACTIVOS', 'C', '4', '1', 'A'), ('9120', 'BIENES Y VALORES  EN ADMINISTRACIÓN', 'C', '3', '1', 'A'), ('912005', 'CARTERA FOGACOOP', 'C', '4', '1', 'A'), ('91200501', 'BIENES Y VALORES EN ADMINISTRACION', 'C', '5', '0', 'A'), ('91201001', 'BIENES Y VALORES RECIBIDOS EN ADMINISTRACION', 'D', '5', '0', 'A'), ('9125', 'CREDITOS APROBADOS NO DESEMBOLSADOS', 'C', '3', '1', 'A'), ('912505', 'CRÉDITOS APROBADOS NO DESEMBOLSADOS', 'C', '4', '1', 'A'), ('9130', 'APERTURA DE CREDITO', 'C', '3', '1', 'A'), ('913005', 'CREDITOS', 'C', '4', '1', 'A'), ('913095', 'OTRAS', 'C', '4', '1', 'A'), ('9140', 'BIENES Y VALORES RECIBIDOS DE TERCEROS', 'C', '3', '1', 'A'), ('914005', 'EN ARRENDAMIENTOS', 'C', '4', '1', 'A'), ('914010', 'EN PRÉSTAMOS', 'C', '4', '1', 'A'), ('914015', 'EN DEPÓSITO', 'C', '4', '1', 'A'), ('914020', 'EN CONSIGNACIÓN', 'C', '4', '1', 'A'), ('91402001', 'BIENES Y VALORES RECIBIDOS DE TERCEROS EN CONSIGNACION', 'D', '5', '0', 'A'), ('914025', 'EN COMODATO', 'C', '4', '1', 'A'), ('9145', 'LITIGIOS Y/O DEMANDAS', 'C', '3', '1', 'A'), ('914505', 'LITIGIOS Y/O DEMANDAS', 'C', '4', '1', 'A'), ('9155', 'DERECHOS CEDIDOS POR AHORRADORES EN ENTIDADES EN LIQUIDACION', 'C', '3', '1', 'A'), ('915505', 'DERECHOS CEDIDOS POR AHORRADORES EN ENTIDADES EN LIQUIDACION', 'C', '4', '1', 'A'), ('9185', 'OTRAS CUENTAS ACREEDORAS CONTINGENTES', 'C', '3', '1', 'A'), ('918505', 'SUSTITUCIÓN DE CARTERA', 'C', '4', '1', 'A'), ('918510', 'SEGURO DE CRÉDITO', 'C', '4', '1', 'A'), ('918585', 'OTRAS', 'C', '4', '1', 'A'), ('91858501', 'OTRAS', 'D', '5', '0', 'A'), ('91858502', 'OTRAS-INTERESES', 'D', '5', '0', 'A'), ('91858503', 'DACION PAGO CAPITAL', 'D', '5', '0', 'A'), ('91858504', 'DACION PAGO CAPITAL POR CONTRA', 'D', '5', '0', 'A'), ('91858505', 'INTERESES POR CONTRA', 'D', '5', '0', 'A'), ('91858506', 'CARTERA CASTIGADA', 'D', '5', '0', 'A'), ('91858507', 'INTERESES CASTIGADOS', 'C', '5', '0', 'A'), ('92', 'CUENTAS DE ORDEN ACREEDORAS', 'D', '2', '0', 'A'), ('9205', 'CUENTAS DE ORDEN ACREEDORAS', 'D', '3', '0', 'A'), ('920505', 'CUENTAS DE ORDEN DACION PAGO', 'D', '4', '0', 'A'), ('92050501', 'ACREED CONT. DACION EN PAGO 001 CAPITAL', 'D', '5', '0', 'A'), ('92050502', 'ACREEDORA CONT.001 DACION EN PAGO INTERESES', 'D', '5', '0', 'A'), ('93', 'ACREEDORAS DE CONTROL', 'C', '2', '1', 'A'), ('9305', 'CONTRATOS DE ARRENDAMIENTOS FINANCIEROS', 'C', '3', '1', 'A'), ('930505', 'BIENES MUEBLES', 'C', '4', '1', 'A'), ('930510', 'BIENES INMUEBLES', 'C', '4', '1', 'A'), ('9312', 'CAPITAL MINIMO IRREDUCIBLE', 'C', '3', '1', 'A'), ('931205', 'CAPITAL MINIMO IRREDUCIBLE', 'C', '4', '1', 'A'), ('93120501', 'CAPITAL MINIMO IRREDUCIBLE', 'C', '5', '0', 'A'), ('9315', 'CAPITALIZACION REVALORIZACION DEL PATRIMONIO', 'C', '3', '1', 'A'), ('931505', 'CAPITALIZACIÓN REVALORIZACIÓN DEL PATRIMONIO', 'C', '4', '1', 'A'), ('9350', 'OTRAS ACREEDORAS DE CONTROL', 'C', '3', '1', 'A'), ('94', 'CUENTAS DE ORDEN', 'D', '2', '0', 'A'), ('9405', 'CUENTA DE ORDEN', 'D', '3', '0', 'A'), ('940505', 'CUENTAS DE ORDEN', 'D', '4', '0', 'A'), ('94050501', 'CUENTA DE ORDEN CONTRATO 001 DACION EN PAGO CAPITAL', 'D', '5', '0', 'A'), ('94050502', 'CUENTA DE ORDEN CONTRATO 001 DACION EN PAGO INTERESES', 'D', '5', '0', 'A'), ('96', 'ACREEDORAS CONTINGENTES POR CONTRA', 'C', '2', '1', 'A'), ('9605', 'ACREEDORAS CONTINGENTES POR CONTRA (DB)', 'C', '3', '1', 'A'), ('960505', 'ACREEDORAS CONTINGENTES POR CONTRA (DB)', 'D', '4', '0', 'A'), ('96050501', 'ACRREDORAS CONTIGENTES POR CONTRA', 'D', '5', '0', 'A'), ('96050502', 'ACREEDORAS CONTINGENTES POR CONTRA-INTERES CARTERA', 'D', '5', '0', 'A'), ('96050503', 'ACREEDORAS CONTINGENTES', 'D', '5', '0', 'A'), ('96050504', 'INTERESES', 'D', '5', '0', 'A'), ('96050505', 'INTERESES POR CONTRA', 'C', '5', '0', 'A'), ('96050506', 'CARTERA CASTIGADA', 'D', '5', '0', 'A'), ('96050507', 'INTERESES CASTIGADOS', 'D', '5', '0', 'A'), ('9615', 'ACREEDORES CONTIGENTES POR CONTRA', 'D', '3', '0', 'A'), ('961510', 'ACREEDORES CONTIGENTES POR CONTRA', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('96151001', 'ACREEDORES CONTIGENTES POR CONTRA', 'D', '5', '0', 'A'), ('98', 'ACREEDORAS DE CONTROL POR CONTRA', 'C', '2', '1', 'A'), ('9805', 'ACREEDORAS DE CONTROL POR CONTRA (DB)', 'C', '3', '1', 'A'), ('980505', 'ACREEDORAS DE CONTROL POR EL CONTRARIO', 'D', '4', '0', 'A'), ('98050501', 'CAPITAL MINIMO IRREDUCIBLE', 'D', '5', '0', 'A');
COMMIT;

-- ----------------------------
-- Procedure structure for ObtenerCentrosCostos
-- ----------------------------
DROP PROCEDURE IF EXISTS `ObtenerCentrosCostos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCentrosCostos`(PcCodigo CHAR(3))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT 
			*
	FROM
		cn_centroscosto
	WHERE 
		IF(LENGTH(PcCodigo) = 0, ccos_codigo <> '', ccos_codigo = PcCodigo)
	ORDER BY 
		ccos_codigo ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ObtenerConceptos
-- ----------------------------
DROP PROCEDURE IF EXISTS `ObtenerConceptos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerConceptos`(PcCodigo CHAR(3))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT 
		ccom_codigo, ccom_nombre, IFNULL(ccom_tipo,'') AS ccom_tipo, ccom_usrcreacion, ccom_fcreacion, ccom_estado
	FROM
		af_conceptos
	WHERE 
		IF(LENGTH(PcCodigo) = 0, ccom_codigo <> '', ccom_codigo = PcCodigo)
	ORDER BY 
		ccom_codigo ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ObtenerDepreciacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `ObtenerDepreciacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDepreciacion`(pcCodDepreciacion CHAR(2))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT	
			depr_codigo, depr_nombres, IFNULL(depr_metodo,'') AS depr_metodo, depr_usrcreacion, depr_fcreacion, depr_estado
	FROM
		af_depreciaciones
	WHERE 
		IF(LENGTH(pcCodDepreciacion) = 0, depr_codigo <> '', depr_codigo = pcCodDepreciacion)
	ORDER BY 
		depr_codigo ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ObtenerEstablecimientos
-- ----------------------------
DROP PROCEDURE IF EXISTS `ObtenerEstablecimientos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerEstablecimientos`(PcCodigo CHAR(3))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT 
		esta_codigo, esta_nombre, esta_sociedad, ObtenerNombrePersona(esta_sociedad) AS esta_nombresociedad,
		esta_nit, IFNULL(esta_cuenta,'') AS esta_cuenta, IFNULL(puc_nombre,'') AS esta_nombrecuenta,
		IFNULL(esta_prefijoactivofijo,'') AS esta_prefijoactivofijo, IFNULL(esta_prefijocredito,'') AS esta_prefijocredito, 
		IFNULL(esta_condesde,0) AS esta_condesde, IFNULL(esta_conhasta,0) AS esta_conhasta,  IFNULL(esta_rango,0) AS esta_rango, esta_estado
	FROM
		cfg_establecimientos
	LEFT JOIN 
		cn_puc ON puc_codigo = esta_cuenta
	WHERE 
		IF(LENGTH(PcCodigo) = 0, esta_codigo <> '', esta_codigo = PcCodigo)
	ORDER BY 
		esta_codigo ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ObtenerLineas
-- ----------------------------
DROP PROCEDURE IF EXISTS `ObtenerLineas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerLineas`(PcLinea CHAR(3))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT 
		line_codigo, line_nombres, IFNULL(line_descripcion,'') AS line_descripcion, 
		IFNULL(line_ctaactivo,'') AS line_ctaactivo, IFNULL((SELECT puc_nombre FROM cn_puc WHERE puc_codigo = af_lineas.line_ctaactivo),'') AS line_nombrecuentaactivo,
		IFNULL(line_ctadepreciacion,'') AS line_ctadepreciacion, IFNULL((SELECT puc_nombre FROM cn_puc WHERE puc_codigo = af_lineas.line_ctadepreciacion),'') AS line_nombrectadepreciacion,
		IFNULL(line_ctagasto,'') AS line_ctagasto, IFNULL((SELECT puc_nombre FROM cn_puc WHERE puc_codigo = af_lineas.line_ctagasto),'') AS line_nombrectagasto,
		IFNULL(line_ctacorreccion,'') AS line_ctacorreccion, IFNULL((SELECT puc_nombre FROM cn_puc WHERE puc_codigo = af_lineas.line_ctacorreccion),'') AS line_nombrectacorreccion,
		IFNULL(line_depreciacion,'') AS line_depreciacion, IFNULL(depr_nombres,'') AS line_nombredepreciacion, line_usrcreacion, line_estado
	FROM
		af_lineas
	LEFT JOIN
		af_depreciaciones ON depr_codigo = line_depreciacion
	WHERE 
		IF(LENGTH(PcLinea) = 0, line_codigo <> '', line_codigo = PcLinea)
	ORDER BY 
		line_codigo ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ObtenerMarcas
-- ----------------------------
DROP PROCEDURE IF EXISTS `ObtenerMarcas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerMarcas`(PcMarca CHAR(3))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT 
		*
	FROM
		af_marcas	
	WHERE 
		IF(LENGTH(PcMarca) = 0, marc_codigo <> '', marc_codigo = PcMarca)
	ORDER BY 
		marc_codigo ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ObtenerPresentaciones
-- ----------------------------
DROP PROCEDURE IF EXISTS `ObtenerPresentaciones`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPresentaciones`(PcCodigo CHAR(3))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT 
		*
	FROM
		af_presentaciones
	WHERE 
		IF(LENGTH(PcCodigo) = 0, pres_codigo <> '', pres_codigo = PcCodigo)
	ORDER BY 
		pres_codigo ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ObtenerSucursales
-- ----------------------------
DROP PROCEDURE IF EXISTS `ObtenerSucursales`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSucursales`(PcCodigo CHAR(3))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT 
		sucu_codigo,
		IFNULL(sucu_nombre,'') AS sucu_nombre,
		IFNULL(sucu_ubicacion,'') AS sucu_ubicacion,
		IFNULL(lug_nommun,'') AS sucu_ubicacionnombre,
		IFNULL(sucu_direccion,'') AS sucu_direccion,
		IFNULL(sucu_telefono1,'') AS sucu_telefono1,
		IFNULL(sucu_telefono2,'') AS sucu_telefono2,
		IFNULL(sucu_email,'') AS sucu_email,
		IFNULL(sucu_rutafotos,'') AS sucu_rutafotos,
		IFNULL(sucu_rutahuellas,'') AS sucu_rutahuellas,
		IFNULL(sucu_resolucionfactura,'') AS sucu_resolucionfactura,
		IFNULL(sucu_resolucionfecha,'') AS sucu_resolucionfecha,
		IFNULL(sucu_desde,0) AS sucu_desde,
		IFNULL(sucu_hasta,0) AS sucu_hasta,
		IFNULL(sucu_fuente,'') AS sucu_fuente,
		IFNULL(fuen_descripcion,'') AS sucu_nombrefuente,
		sucu_usrcreacion,
		sucu_fcreacion,
		sucu_estado
	FROM
		cfg_sucursales
	LEFT JOIN 
		cn_fuentes ON fuen_codigo = sucu_fuente
	LEFT JOIN
		publica.mae_dptomunicipio ON lug_idpdm = sucu_ubicacion
	WHERE 
		IF(LENGTH(PcCodigo) = 0, sucu_codigo <> '', sucu_codigo = PcCodigo)
	ORDER BY 
		sucu_codigo ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ObtenerUbicaciones
-- ----------------------------
DROP PROCEDURE IF EXISTS `ObtenerUbicaciones`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerUbicaciones`(PcCodigo CHAR(3))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT 
		ubic_codigo, ubic_centrocosto, IFNULL(ccos_nombre,"") AS ubic_nombrecentrocosto, ubic_descripcion, ubic_sucursal, sucu_nombre AS ubic_sucursalnombre,
		ubic_usrcreacion, ubic_fcreacion, ubic_estado
	FROM
		af_ubicaciones
	INNER JOIN 
		cn_centroscosto ON ccos_codigo = ubic_centrocosto
	INNER JOIN 
		cfg_sucursales ON sucu_codigo = ubic_sucursal
	WHERE 
		IF(LENGTH(PcCodigo) = 0, ubic_codigo <> '', ubic_codigo = PcCodigo)
	ORDER BY 
		ubic_codigo ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GuardarCentroCosto
-- ----------------------------
DROP FUNCTION IF EXISTS `GuardarCentroCosto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GuardarCentroCosto`(pcCodigo CHAR(3), pcNombre VARCHAR(50), pcUsuario VARCHAR(30), pcEstado CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN	

	DECLARE lnCantidadCentros INT(2) DEFAULT 0;	
	DECLARE lnConsecutivo INT(12) DEFAULT 0;
	DECLARE lcConsecutivo CHAR(3) DEFAULT '';
	
	/* ************************************************
		VERIFICO SI EL CODIGO DE CENTRO DE COSTOS RECIBIDO EXISTE
	*************************************************/
	SET lnCantidadCentros = (SELECT COUNT(0) FROM cn_centroscosto WHERE ccos_codigo = pcCodigo);	
	
	IF lnCantidadCentros = 0 THEN
			/*************************************************
				EL CENTRO DE COSTO NO EXISTE. ENTONCES TOMO EL CONSECUTIVO
				E INSERTO EL REGISTRO
			*************************************************/			
			SET lnConsecutivo = (SELECT ObtenerConsecutivo('011'));

			SET lcConsecutivo = (SELECT LPAD(CONVERT(lnConsecutivo, CHAR(3)),3, '0'));

			INSERT INTO cn_centroscosto (ccos_codigo,
									ccos_nombre,
									ccos_usrcreacion,
									ccos_fcreacion,
									ccos_estado)
									VALUES(lcConsecutivo, 
												pcNombre, 
												pcUsuario, 
												NOW(), 
												pcEstado); 
	ELSE
			/*************************************************
				EL CENTRO DE COSTO EXISTE. ENTONCES ACTUALIZO
			*************************************************/
			UPDATE cn_centroscosto
					SET ccos_nombre = pcNombre, ccos_estado = pcEstado
			WHERE
				ccos_codigo = pcCodigo;
	END IF;
	
	RETURN ROW_COUNT();

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GuardarConcepto
-- ----------------------------
DROP FUNCTION IF EXISTS `GuardarConcepto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GuardarConcepto`(pcCodigo CHAR(3), pcNombre VARCHAR(60), pcTipo CHAR(1), pcUsuario VARCHAR(30), pcEstado CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN	

	DECLARE lnCantidadConcepto INT(2) DEFAULT 0;	
	DECLARE lnConsecutivo INT(12) DEFAULT 0;
	DECLARE lcConsecutivo CHAR(3) DEFAULT '';
	
	/* ************************************************
		VERIFICO SI EL CODIGO DE CONCEPTO RECIBIDO EXISTE
	*************************************************/
	SET lnCantidadConcepto = (SELECT COUNT(0) FROM af_conceptos WHERE ccom_codigo = pcCodigo);	
	
	IF lnCantidadConcepto = 0 THEN
			/*************************************************
				EL CONCEPTO NO EXISTE. ENTONCES TOMO EL CONSECUTIVO
				E INSERTO EL REGISTRO
			*************************************************/			
			SET lnConsecutivo = (SELECT ObtenerConsecutivo('014'));

			SET lcConsecutivo = (SELECT LPAD(CONVERT(lnConsecutivo, CHAR(3)),3, '0'));

			INSERT INTO af_conceptos (ccom_codigo,
									ccom_nombre,
									ccom_tipo,
									ccom_usrcreacion,
									ccom_fcreacion,
									ccom_estado)
									VALUES(lcConsecutivo, 
												pcNombre,
												pcTipo,
												pcUsuario,
												NOW(),
												pcEstado); 
	ELSE
			/*************************************************
				EL CONCEPTO EXISTE. ENTONCES ACTUALIZO
			*************************************************/
			UPDATE af_conceptos
					SET ccom_nombre = pcNombre ,
							ccom_tipo = pcTipo, 							
							ccom_estado = pcEstado
			WHERE
				ccom_codigo = pcCodigo;
	END IF;
	
	RETURN ROW_COUNT();

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GuardarDepreciacion
-- ----------------------------
DROP FUNCTION IF EXISTS `GuardarDepreciacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GuardarDepreciacion`(pcCodigo CHAR(2), pcNombres VARCHAR(30), pcMetodo VARCHAR(60), pcUsuario VARCHAR(30), pcEstado CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN	

	DECLARE lnCantidadDepreciacion INT(2) DEFAULT 0;	
	DECLARE lnConsecutivo INT(12) DEFAULT 0;
	DECLARE lcConsecutivo CHAR(2) DEFAULT '';
	
	/* ************************************************
		VERIFICO SI EL CODIGO DE LINEA RECIBIDO EXISTE
	*************************************************/
	SET lnCantidadDepreciacion = (SELECT COUNT(0) FROM af_depreciaciones WHERE depr_codigo = pcCodigo);	
	
	IF lnCantidadDepreciacion = 0 THEN
			/*************************************************
				LA DEPRECIACION NO EXISTE. ENTONCES TOMO EL CONSECUTIVO 
				E INSERTO EL REGISTRO
			*************************************************/
			SET lnConsecutivo = (SELECT ObtenerConsecutivo('002'));

			SET lcConsecutivo = (SELECT LPAD(CONVERT(lnConsecutivo, CHAR(2)),2, '0'));

			INSERT INTO af_depreciaciones (depr_codigo,
																		depr_nombres,
																		depr_metodo,
																		depr_usrcreacion,
																		depr_fcreacion,
																		depr_estado)
									VALUES(lcConsecutivo, 
												 pcNombres,
												 pcMetodo,
												 pcUsuario,
												 NOW(),
												 pcEstado);
	ELSE
			/*************************************************
				LA DEPRECIACION EXISTE. ENTONCES ACTUALIZO
			*************************************************/
			UPDATE af_depreciaciones
			SET depr_nombres = pcNombres,
					depr_metodo = pcMetodo,
					depr_estado = pcEstado
			WHERE 
				depr_codigo = pcCodigo;

	END IF;
	
	RETURN ROW_COUNT();

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GuardarEstablecimiento
-- ----------------------------
DROP FUNCTION IF EXISTS `GuardarEstablecimiento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GuardarEstablecimiento`(pcCodigo CHAR(3), pcSociedad VARCHAR(12), pcNit VARCHAR(12), pcNombre VARCHAR(50), pcCuenta VARCHAR(12),pcActivo CHAR(2), pcCredito CHAR(2),pcDesde INT(10), pcHasta INT(10), pcRango INT(3), pcEstado CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN	

	DECLARE lnCantidadEstablecimiento INT(2) DEFAULT 0;
	DECLARE lnConsecutivo INT(12) DEFAULT 0;
	DECLARE lcConsecutivo CHAR(3) DEFAULT '';
	
	/* ************************************************
		VERIFICO SI EL CODIGO DE ESTABLECIMIENTO RECIBIDO EXISTE
	*************************************************/
	SET lnCantidadEstablecimiento = (SELECT COUNT(0) FROM cfg_establecimientos WHERE esta_codigo = pcCodigo);	
	
	IF lnCantidadEstablecimiento = 0 THEN
			/*************************************************
				EL ESTABLECIMIENTO NO EXISTE. ENTONCES TOMO EL CONSECUTIVO
				E INSERTO EL REGISTRO
			*************************************************/			
			SET lnConsecutivo = (SELECT ObtenerConsecutivo('013'));

			SET lcConsecutivo = (SELECT LPAD(CONVERT(lnConsecutivo, CHAR(3)),3, '0'));

			INSERT INTO cfg_establecimientos (esta_codigo,
									esta_sociedad,
									esta_nit,
									esta_nombre,
									esta_cuenta,
									esta_prefijoactivofijo,
									esta_prefijocredito,
									esta_condesde,
									esta_conhasta,
									esta_rango,
									esta_estado)
									VALUES(lcConsecutivo, 
									pcCodigo,
									pcSociedad, 
									pcNit, 
									pcNombre, 
									pcCuenta,
									pcActivo, 
									pcCredito,
									pcDesde, 
									pcHasta, 
									pcRango, 
									pcEstado); 
	ELSE
			/*************************************************
			EL ESTABLECIMIENTO EXISTE. ENTONCES ACTUALIZO
			*************************************************/
			UPDATE cfg_establecimientos
					SET	esta_sociedad = pcSociedad,
							esta_nit = pcNit,
							esta_nombre = pcNombre,
							esta_cuenta = pcCuenta,
							esta_prefijoactivofijo = pcActivo,
							esta_prefijocredito = pcCredito,
							esta_condesde = pcDesde,
							esta_conhasta = pcHasta,
							esta_rango = pcRango,
							esta_estado = pcEstado
			WHERE
				esta_codigo = pcCodigo;
	END IF;
	
	RETURN ROW_COUNT();
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GuardarLineas
-- ----------------------------
DROP FUNCTION IF EXISTS `GuardarLineas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GuardarLineas`(pcCodigo CHAR(3), pcNombres VARCHAR(60), pcDescripcion VARCHAR(200), pcCuentaActivo VARCHAR(12), pcCuentaDepreciacion VARCHAR(12), pcCuentaGasto VARCHAR(12), pcCuentaCorrecccion VARCHAR(12), pcCodDepreciacion  CHAR(2), pcUsuario VARCHAR(30), pcEstado CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN	

	DECLARE lnCantidadLinea INT(2) DEFAULT 0;	
	DECLARE lnConsecutivo INT(12) DEFAULT 0;
	DECLARE lcConsecutivo CHAR(3) DEFAULT '';
	
	/* ************************************************
		VERIFICO SI EL CODIGO DE LINEA RECIBIDO EXISTE
	*************************************************/
	SET lnCantidadLinea = (SELECT COUNT(0) FROM af_lineas WHERE line_codigo = pcCodigo);	
	
	IF lnCantidadLinea = 0 THEN
			/*************************************************
				LA LINEA NO EXISTE. ENTONCES TOMO EL CONSECUTIVO 
				E INSERTO EL REGISTRO
			*************************************************/			
			SET lnConsecutivo = (SELECT ObtenerConsecutivo('001'));

			SET lcConsecutivo = (SELECT LPAD(CONVERT(lnConsecutivo, CHAR(3)),3, '0'));

			INSERT INTO af_lineas (line_codigo,
														line_nombres,
														line_descripcion,
														line_ctaactivo,
														line_ctadepreciacion,
														line_ctagasto,
														line_ctacorreccion,
														line_depreciacion,
														line_usrcreacion,
														line_fcreacion,
														line_estado)
									VALUES(lcConsecutivo, 
												pcNombres, 
												pcDescripcion, 
												pcCuentaActivo, 
												pcCuentaDepreciacion, 
												pcCuentaGasto, 
												pcCuentaCorrecccion, 
												pcCodDepreciacion,	
												pcUsuario, 
												NOW(),
												pcEstado);
	ELSE
			/*************************************************
				LA LINEA EXISTE. ENTONCES ACTUALIZO
			*************************************************/
			UPDATE af_lineas 
					SET line_nombres = pcNombres, 
							line_descripcion = pcDescripcion,
							line_ctaactivo = pcCuentaActivo,
							line_ctadepreciacion = pcCuentaDepreciacion,
							line_ctagasto = pcCuentaGasto,
							line_ctacorreccion = pcCuentaCorrecccion,
							line_depreciacion = pcCodDepreciacion,
							line_estado = pcEstado
			WHERE 
				line_codigo = pcCodigo;
	END IF;
	
	RETURN ROW_COUNT();

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GuardarMarcas
-- ----------------------------
DROP FUNCTION IF EXISTS `GuardarMarcas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GuardarMarcas`(pcCodigo CHAR(3), pcNombre VARCHAR(60), pcUsuario VARCHAR(30), pcEstado CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN	

	DECLARE lnCantidadMarcas INT(2) DEFAULT 0;	
	DECLARE lnConsecutivo INT(12) DEFAULT 0;
	DECLARE lcConsecutivo CHAR(3) DEFAULT '';
	
	/* ************************************************
		VERIFICO SI EL CODIGO DE LINEA RECIBIDO EXISTE
	*************************************************/
	SET lnCantidadMarcas = (SELECT COUNT(0) FROM af_marcas WHERE marc_codigo = pcCodigo);	
	
	IF lnCantidadMarcas = 0 THEN
			/*************************************************
				LA MARCA NO EXISTE. ENTONCES TOMO EL CONSECUTIVO
				E INSERTO EL REGISTRO
			*************************************************/			
			SET lnConsecutivo = (SELECT ObtenerConsecutivo('003'));

			SET lcConsecutivo = (SELECT LPAD(CONVERT(lnConsecutivo, CHAR(3)),3, '0'));

			INSERT INTO af_marcas (marc_codigo,
														marc_nombre,
														marc_usrcreacion,
														marc_fcreacion,
														marc_estado)
									VALUES(lcConsecutivo, 
												pcNombre, 
												pcUsuario, 
												NOW(), 
												pcEstado);
	ELSE
			/*************************************************
				LA MARCA EXISTE. ENTONCES ACTUALIZO
			*************************************************/
			UPDATE af_marcas
					SET marc_nombre = pcNombre, 
							marc_estado = pcEstado
			WHERE
				marc_codigo = pcCodigo;
	END IF;
	
	RETURN ROW_COUNT();

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GuardarPresentaciones
-- ----------------------------
DROP FUNCTION IF EXISTS `GuardarPresentaciones`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GuardarPresentaciones`(pcCodigo CHAR(3), pcNombre VARCHAR(60), pcAbrevia VARCHAR(3), pcUsuario VARCHAR(30), pcEstado CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN	

	DECLARE lnCantidadPresentacion INT(2) DEFAULT 0;	
	DECLARE lnConsecutivo INT(12) DEFAULT 0;
	DECLARE lcConsecutivo CHAR(3) DEFAULT '';
	
	/* ************************************************
		VERIFICO SI EL CODIGO DE LINEA RECIBIDO EXISTE
	*************************************************/
	SET lnCantidadPresentacion = (SELECT COUNT(0) FROM af_presentaciones WHERE pres_codigo = pcCodigo);	
	
	IF lnCantidadPresentacion = 0 THEN
			/*************************************************
				LA MARCA NO EXISTE. ENTONCES TOMO EL CONSECUTIVO
				E INSERTO EL REGISTRO
			*************************************************/			
			SET lnConsecutivo = (SELECT ObtenerConsecutivo('004'));

			SET lcConsecutivo = (SELECT LPAD(CONVERT(lnConsecutivo, CHAR(3)),3, '0'));

			INSERT INTO af_presentaciones (pres_codigo,
												pres_nombre,
												pres_abrevia,
												pres_usrcreacion,
												pres_fcreacion,
												pres_estado)
									VALUES(lcConsecutivo, 
												pcNombre, 
												pcAbrevia,
												pcUsuario, 
												NOW(), 
												pcEstado);
	ELSE
			/*************************************************
				LA MARCA EXISTE. ENTONCES ACTUALIZO
			*************************************************/
			UPDATE af_presentaciones
					SET pres_nombre = pcNombre, 
							pres_abrevia = pcAbrevia,
							pres_estado = pcEstado
			WHERE
				pres_codigo = pcCodigo;
	END IF;
	
	RETURN ROW_COUNT();

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GuardarSucursales
-- ----------------------------
DROP FUNCTION IF EXISTS `GuardarSucursales`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GuardarSucursales`(pcCodigo CHAR(3), pcNombre VARCHAR(80), pcUbicacion CHAR(8), pcDireccion VARCHAR(60), pcTelefono1 VARCHAR(20), pcTelefono2 VARCHAR(20), pcEmail VARCHAR(60), pcRutaFotos VARCHAR(60), pcRutaHuella VARCHAR(60), pcResolucion VARCHAR(60), pcFecha DATE, pcDesde INT(12), pcHasta INT(12), pcFuente VARCHAR(6), pcUsuario VARCHAR(30), pcEstado CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN	

	DECLARE lnCantidadSucursal INT(2) DEFAULT 0;	
	DECLARE lnConsecutivo INT(12) DEFAULT 0;
	DECLARE lcConsecutivo CHAR(3) DEFAULT '';
	
	/* ************************************************
		VERIFICO SI EL CODIGO DE SUCURSAL EXISTE
	*************************************************/
	SET lnCantidadSucursal = (SELECT COUNT(0) FROM cfg_sucursales WHERE sucu_codigo = pcCodigo);	
	
	IF lnCantidadSucursal = 0 THEN
			/*************************************************
				LA SUCURSAL NO EXISTE. ENTONCES TOMO EL CONSECUTIVO
				E INSERTO EL REGISTRO
			*************************************************/			
			SET lnConsecutivo = (SELECT ObtenerConsecutivo('012'));

			SET lcConsecutivo = (SELECT LPAD(CONVERT(lnConsecutivo, CHAR(3)),3, '0'));

			INSERT INTO cfg_sucursales (sucu_codigo,
									sucu_nombre,
									sucu_ubicacion,
									sucu_direccion,
									sucu_telefono1,
									sucu_telefono2,
									sucu_email,
									sucu_rutafotos,
									sucu_rutahuellas,
									sucu_resolucionfactura,
									sucu_resolucionfecha,
									sucu_desde,
									sucu_hasta,
									sucu_fuente,
									sucu_usrcreacion,
									sucu_fcreacion,
									sucu_estado)
									VALUES(lcConsecutivo, 
									pcNombre, 
									pcUbicacion, 
									pcDireccion,
									pcTelefono1, 
									pcTelefono2, 
									pcEmail, 
									pcRutaFotos, 
									pcRutaHuella, 
									pcResolucion, 
									pcFecha, 
									pcDesde, 
									pcHasta, 
									pcFuente, 
									pcUsuario,
									NOW(),
									pcEstado); 
	ELSE
			/*************************************************
				LA SUCURSAL EXISTE. ENTONCES ACTUALIZO
			*************************************************/
			UPDATE cfg_sucursales
					SET sucu_nombre = pcNombre ,
							sucu_ubicacion = pcUbicacion,
							sucu_direccion = pcDireccion,
							sucu_telefono1 = pcTelefono1,
							sucu_telefono2 = pcTelefono2,
							sucu_email = pcEmail,
							sucu_rutafotos = pcRutaFotos,
							sucu_rutahuellas = pcRutaHuella,
							sucu_resolucionfactura = pcResolucion,
							sucu_resolucionfecha = pcFecha,
							sucu_desde = pcDesde,
							sucu_hasta = pcHasta,
							sucu_fuente = pcFuente,
						  sucu_estado = pcEstado
			WHERE
				sucu_codigo = pcCodigo;
	END IF;
	
	RETURN ROW_COUNT();

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GuardarUbicaciones
-- ----------------------------
DROP FUNCTION IF EXISTS `GuardarUbicaciones`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GuardarUbicaciones`(pcCodigo CHAR(3), pcCentro CHAR(3), pcNombre VARCHAR(60), pcSucursal CHAR(3), pcUsuario VARCHAR(30), pcEstado CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN	

	DECLARE lnCantidadUbicacion INT(2) DEFAULT 0;	
	DECLARE lnConsecutivo INT(12) DEFAULT 0;
	DECLARE lcConsecutivo CHAR(3) DEFAULT '';
	
	/* ************************************************
		VERIFICO SI EL CODIGO DE UBICACION RECIBIDO EXISTE
	*************************************************/
	SET lnCantidadUbicacion = (SELECT COUNT(0) FROM af_ubicaciones WHERE ubic_codigo = pcCodigo);	
	
	IF lnCantidadUbicacion = 0 THEN
			/*************************************************
				LA UBICACION NO EXISTE. ENTONCES TOMO EL CONSECUTIVO
				E INSERTO EL REGISTRO
			*************************************************/			
			SET lnConsecutivo = (SELECT ObtenerConsecutivo('006'));

			SET lcConsecutivo = (SELECT LPAD(CONVERT(lnConsecutivo, CHAR(3)),3, '0'));

			INSERT INTO af_ubicaciones (ubic_codigo,
									ubic_centrocosto,
									ubic_descripcion,
									ubic_sucursal,
									ubic_usrcreacion,
									ubic_fcreacion,
									ubic_estado)
									VALUES(lcConsecutivo, 
												pcCentro,
												pcNombre, 
												pcSucursal,
												pcUsuario, 
												NOW(), 
												pcEstado); 
	ELSE
			/*************************************************
				LA MARCA EXISTE. ENTONCES ACTUALIZO
			*************************************************/
			UPDATE af_ubicaciones
					SET ubic_centrocosto = pcCentro,
							ubic_descripcion = pcNombre, 
							ubic_sucursal = pcSucursal,
							ubic_estado = pcEstado
			WHERE
				ubic_codigo = pcCodigo;
	END IF;
	
	RETURN ROW_COUNT();

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for ObtenerConsecFuente
-- ----------------------------
DROP FUNCTION IF EXISTS `ObtenerConsecFuente`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `ObtenerConsecFuente`(`PcFuente` CHAR(2), `PcSucursal` CHAR(3), `PdFecha` DATE) RETURNS varchar(12) CHARSET latin1
    MODIFIES SQL DATA
    DETERMINISTIC
    COMMENT 'Obtiene el sgte. consec. de una fuente.'
BEGIN
	DECLARE lcVlrRet VARCHAR(12) DEFAULT '';
	DECLARE lcTipo CHAR(1) DEFAULT '';
	DECLARE lnAnio INT(4) DEFAULT 0;
	DECLARE lnMes INT(2) DEFAULT 0;
	DECLARE lnConsec INT(7) DEFAULT 0;
	DECLARE lnLong INT(1) default 7;
	DECLARE lnCant INT(1) default 0;
	
	# Valido que exista la fuente en el maestro de fuentes
	SET lnCant = (SELECT COUNT(*) FROM con_fuentes WHERE fuen_codigo = PcFuente);
	IF lnCant = 0 THEN 
		RETURN '';
	END IF;
	
	# Valido que exista la sucursal
	SET lnCant = (SELECT COUNT(*) FROM cfg_sucursales WHERE sucu_codigo = PcSucursal);
	IF lnCant = 0 THEN 
		RETURN '';
	END IF;
	
	# Obtengo el anio
	SET lnAnio = (SELECT YEAR(PdFecha));

	# Obtengo el tipo de fuente (Unica, Anual, Mensual)
	SET lcTipo = (SELECT fuen_tipo FROM con_fuentes WHERE fuen_codigo = PcFuente);
	CASE
		WHEN lcTipo = 'U' THEN 
			# Obtengo el ultimo consecutivo independientemente de que anio sea (Si es Unico no lleva anio)
			SET lnConsec = IFNULL((SELECT fude_numero + 1 FROM con_fuentesdet WHERE fude_fuente = PcFuente AND fude_sucursal = PcSucursal), 1);
			# Si el valor es 1 significa que regreso NULL porque el consecutivo no se ha ingresado nunca
			IF lnConsec = 1 THEN 
				INSERT INTO con_fuentesdet (fude_fuente, fude_sucursal, fude_anio, fude_mes, fude_numero) VALUES (PcFuente, PcSucursal, '', '', lnConsec);
			ELSE 
				# Actualizo el consecutivo de la fuente
				UPDATE con_fuentesdet SET fude_numero = lnConsec WHERE fude_fuente = PcFuente AND fude_sucursal = PcSucursal; 
			END IF;
			
		WHEN lcTipo = 'A' THEN 
			# Obtengo el ultimo consecutivo de la sucursal y anio parametrizadas
			SET lnConsec = IFNULL((SELECT fude_numero + 1 FROM con_fuentesdet WHERE fude_fuente = PcFuente AND fude_sucursal = PcSucursal AND fude_anio = lnAnio), 1);
			# Si el valor es 1 significa que regreso NULL porque el año no tiene consecutivo ingresado
			IF lnConsec = 1 THEN 
				INSERT INTO con_fuentesdet (fude_fuente, fude_sucursal, fude_anio, fude_mes, fude_numero) VALUES (PcFuente, PcSucursal, lnAnio, '', lnConsec);
			ELSE
				# Actualizo el consecutivo de la fuente
				UPDATE con_fuentesdet SET fude_numero = lnConsec WHERE fude_fuente = PcFuente AND fude_sucursal = PcSucursal AND fude_anio = lnAnio;
			END IF;

		WHEN lcTipo = 'M' THEN 
			SET lnMes = (SELECT MONTH(PdFecha));
			SET lnLong = 4;
			# Obtengo el ultimo consecutivo de la sucursal, anio y mes parametrizadas
			SET lnConsec = IFNULL((SELECT fude_numero + 1 
												FROM con_fuentesdet 
												WHERE fude_fuente = PcFuente AND fude_sucursal = PcSucursal AND fude_anio = lnAnio AND fude_mes = lnMes), 1);
			# Si el valor es 1 significa que regreso NULL porque la suc/año/mes no tiene consecutivo ingresado
			IF lnConsec = 1 THEN 
				INSERT INTO con_fuentesdet (fude_fuente, fude_sucursal, fude_anio, fude_mes, fude_numero) VALUES (PcFuente, PcSucursal, lnAnio, lnMes, 1);
			ELSE
				# Actualizo el consecutivo de la fuente
				UPDATE con_fuentesdet SET fude_numero = lnConsec WHERE fude_fuente = PcFuente AND fude_sucursal = PcSucursal AND fude_anio = lnAnio;
			END IF;
		
	END CASE;
	
	SET lcVlrRet = CONCAT(lnAnio, '-', IF(lnMes = 0, '', LPAD(lnMes, 2, '0')), IF(lnMes = 0, '', '-'), LPAD(lnConsec, lnLong, '0'));
	
	RETURN lcVlrRet;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for ObtenerConsecutivo
-- ----------------------------
DROP FUNCTION IF EXISTS `ObtenerConsecutivo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerConsecutivo`(PcCodigo CHAR(3)) RETURNS varchar(12) CHARSET latin1 COLLATE latin1_spanish_ci
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Obtiene el consecutivo.'
BEGIN
	DECLARE lnNext INT(12) DEFAULT 0;

	# Obtengo el consecutivo siguiente
	SELECT
		cons_valor 
	FROM
		cfg_consecutivos 
	WHERE
		cons_codigo = PcCodigo 
	INTO 
		lnNext;

	# Actualizo el consecutivo
	UPDATE cfg_consecutivos
		SET cons_valor = lnNext + 1
	WHERE
		cons_codigo = PcCodigo;
	
	RETURN lnNext + 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for ObtenerNombrePersona
-- ----------------------------
DROP FUNCTION IF EXISTS `ObtenerNombrePersona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerNombrePersona`(pcCodigo VARCHAR(12)) RETURNS varchar(200) CHARSET latin1 COLLATE latin1_spanish_ci
    READS SQL DATA
    DETERMINISTIC
BEGIN
	
	DECLARE lcNombre VARCHAR(200) DEFAULT "";

	SET lcNombre = 
			(SELECT 
				IF(LENGTH(pers_razonsocial) = 0,CONCAT_WS(" ",pers_apellido1,IFNULL(pers_apellido2,''),pers_nombre1,IFNULL(pers_nombre2,'')),IFNULL(pers_razonsocial,'')) 
			FROM
				publica.mae_personas
			WHERE 
				pers_nit = PcCodigo);

	RETURN lcNombre;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for ObtenerParametro
-- ----------------------------
DROP FUNCTION IF EXISTS `ObtenerParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `ObtenerParametro`(`cCodParam` char(3)) RETURNS varchar(250) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Obtiene el valor de un parametro.'
BEGIN
	DECLARE lcValor VARCHAR(250) DEFAULT '';
	
	SET lcValor = (SELECT para_valor FROM cfg_parametros WHERE para_codigo = cCodParam);
	
	RETURN lcValor;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `historicocambiosparam`;
DELIMITER ;;
CREATE TRIGGER `historicocambiosparam` AFTER UPDATE ON `cfg_parametros` FOR EACH ROW BEGIN
	INSERT INTO historicos (hist_tabla,hist_historial,hist_usuario,hist_fecha) 
	VALUES ('cf_parametros',CONCAT_WS(',',trim(ifnull(old.para_codigo,'')),trim(ifnull(old.para_nombre,'')),trim(ifnull(old.para_descripcion,'')),trim(ifnull(old.para_valor,'')),trim(ifnull(old.para_tipo,'')),trim(ifnull(old.para_estado,''))),user(),now());
END
;;
DELIMITER ;
