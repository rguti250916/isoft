/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : isoft_desarrollo

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-22 20:59:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for af_depreciaciones
-- ----------------------------
DROP TABLE IF EXISTS `af_depreciaciones`;
CREATE TABLE `af_depreciaciones` (
  `depr_codigo` char(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `depr_nombres` varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `depr_metodo` varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `depr_usrcreacion` varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `depr_fcreacion` datetime NOT NULL,
  `depr_estado` enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`depr_codigo`),
  KEY `depr_codigo` (`depr_codigo`),
  KEY `depr_usrcreacion` (`depr_usrcreacion`),
  CONSTRAINT `af_depreciaciones_ibfk_1` FOREIGN KEY (`depr_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of af_depreciaciones
-- ----------------------------
INSERT INTO `af_depreciaciones` VALUES ('01', 'LINEA RECTA', null, 'ADMIN', '2017-06-18 22:46:12', 'A');

-- ----------------------------
-- Table structure for af_lineas
-- ----------------------------
DROP TABLE IF EXISTS `af_lineas`;
CREATE TABLE `af_lineas` (
  `line_codigo` char(3) COLLATE latin1_spanish_ci NOT NULL,
  `line_nombres` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `line_descripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `line_ctaactivo` varchar(12) COLLATE latin1_spanish_ci DEFAULT NULL,
  `line_ctadepreciacion` varchar(12) COLLATE latin1_spanish_ci DEFAULT NULL,
  `line_ctagasto` varchar(12) COLLATE latin1_spanish_ci DEFAULT NULL,
  `line_ctacorreccion` varchar(12) COLLATE latin1_spanish_ci DEFAULT NULL,
  `line_depreciacion` char(2) COLLATE latin1_spanish_ci DEFAULT NULL,
  `line_usrcreacion` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `line_fcreacion` datetime DEFAULT NULL,
  `line_estado` enum('A','I') CHARACTER SET latin1 NOT NULL DEFAULT 'A',
  PRIMARY KEY (`line_codigo`),
  KEY `line_codigo` (`line_codigo`),
  KEY `line_ctaactivo` (`line_ctaactivo`),
  KEY `line_ctagasto` (`line_ctagasto`),
  KEY `line_ctacorreccion` (`line_ctacorreccion`),
  KEY `line_depreciacion` (`line_depreciacion`),
  KEY `line_ctadepreciacion` (`line_ctadepreciacion`),
  KEY `line_usrcreacion` (`line_usrcreacion`),
  CONSTRAINT `af_lineas_ibfk_1` FOREIGN KEY (`line_ctaactivo`) REFERENCES `cn_puc` (`puc_codigo`),
  CONSTRAINT `af_lineas_ibfk_2` FOREIGN KEY (`line_ctagasto`) REFERENCES `cn_puc` (`puc_codigo`),
  CONSTRAINT `af_lineas_ibfk_3` FOREIGN KEY (`line_ctacorreccion`) REFERENCES `cn_puc` (`puc_codigo`),
  CONSTRAINT `af_lineas_ibfk_4` FOREIGN KEY (`line_depreciacion`) REFERENCES `af_depreciaciones` (`depr_codigo`),
  CONSTRAINT `af_lineas_ibfk_5` FOREIGN KEY (`line_ctadepreciacion`) REFERENCES `cn_puc` (`puc_codigo`),
  CONSTRAINT `af_lineas_ibfk_6` FOREIGN KEY (`line_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of af_lineas
-- ----------------------------
INSERT INTO `af_lineas` VALUES ('001', 'EQUIPOS DE TECNOLOGIA                                       ', 'EQUIPOS DE TECNOLOGIA ', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-06-18 22:52:38', 'A');
INSERT INTO `af_lineas` VALUES ('002', 'SERVIDORES                                                  ', 'SERVIDORES                                                  ', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-06-18 22:52:38', 'I');
INSERT INTO `af_lineas` VALUES ('003', 'EQUIPOS DE TECNOLOGIA                                       ', 'EQUIPOS DE TECNOLOGIA                                       ', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-06-18 22:52:38', 'A');
INSERT INTO `af_lineas` VALUES ('004', 'EQUIPOS DE REFRIGERACION                                    ', 'EQUIPOS DE REFRIGERACION                                    ', '11100502', '86050501', '51107801', null, '01', 'ADMIN', '2017-06-18 22:52:38', 'A');

-- ----------------------------
-- Table structure for cfg_consecutivos
-- ----------------------------
DROP TABLE IF EXISTS `cfg_consecutivos`;
CREATE TABLE `cfg_consecutivos` (
  `cons_codigo` char(3) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `cons_nombre` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `cons_descripcion` text COLLATE latin1_spanish_ci,
  `cons_valor` int(12) NOT NULL,
  `cons_tipo` enum('C','N','D') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'C' COMMENT 'Caracter o Numerico',
  `cons_estado` enum('A','I') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`cons_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Guarda Todos los parametros contables y los consecutivos';

-- ----------------------------
-- Records of cfg_consecutivos
-- ----------------------------
INSERT INTO `cfg_consecutivos` VALUES ('001', 'CONSECUTIVO CODIGO DE LINEA', 'CONSECUTIVO CODIGO DE LINEA', '4', 'N', 'A');
INSERT INTO `cfg_consecutivos` VALUES ('002', 'CONSECUTIVO DE DEPRECIACION', 'CONSECUTIVO DE DEPRECIACION', '0', 'C', 'A');

-- ----------------------------
-- Table structure for cfg_opcionesusuarios
-- ----------------------------
DROP TABLE IF EXISTS `cfg_opcionesusuarios`;
CREATE TABLE `cfg_opcionesusuarios` (
  `usop_usuario` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `usop_idopcion` smallint(5) unsigned NOT NULL,
  `usop_buscar` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `usop_nuevo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `usop_guardar` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `usop_cancelar` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `usop_modificar` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `usop_anular` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `usop_imprimir` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `usop_supervisar` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`usop_usuario`,`usop_idopcion`),
  KEY `opus_idopcion` (`usop_idopcion`),
  CONSTRAINT `cfg_opcionesusuarios_ibfk_1` FOREIGN KEY (`usop_usuario`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`),
  CONSTRAINT `cfg_opcionesusuarios_ibfk_2` FOREIGN KEY (`usop_idopcion`) REFERENCES `publica`.`mae_opciones` (`opci_idopcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cfg_opcionesusuarios
-- ----------------------------

-- ----------------------------
-- Table structure for cfg_parametros
-- ----------------------------
DROP TABLE IF EXISTS `cfg_parametros`;
CREATE TABLE `cfg_parametros` (
  `para_codigo` char(3) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `para_nombre` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `para_descripcion` text COLLATE latin1_spanish_ci,
  `para_valor` varchar(250) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `para_tipo` enum('C','N','D') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'C' COMMENT 'Caracter o Numerico',
  `para_estado` enum('A','I') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`para_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Guarda Todos los parametros contables y los consecutivos';

-- ----------------------------
-- Records of cfg_parametros
-- ----------------------------
INSERT INTO `cfg_parametros` VALUES ('001', 'CUENTA RETEIVA                                              ', ' ', '24470501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('002', 'CUENTA INTERES                                              ', 'CUENTA INTERES', '42100501                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('003', 'CUENTA RETEICA                                              ', 'CUENTA RETEICA ', '24350101                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('004', 'CUENTA RETEFUENTE                                           ', 'CUENTA RETEFUENTE  ', '24300101                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('005', 'CUENTA DESCUENTOS', ' ', '41750505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('006', 'CUENTA DE CXP CAJA MENOR', ' ', '21051003', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('007', 'CUENTA TOMA DE INVENTARIO', ' ', '61353601', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('008', 'CUENTA IVA', ' ', '24080105', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('009', 'CUENTA RETEIVA', ' ', '24470501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('010', 'PORCENTAJE DE IVA                                           ', 'PORCENTAJE DE IVA', '16', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('011', 'CUENTA DE DESCUENTO INV', ' ', '42950505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('012', 'CUENTA RETEICA INV', ' ', '23680505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('013', 'CUENTA PROV. POR PAGAR', ' ', '22050505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('014', 'CUENTA DE INVENTARIO', ' ', '14350505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('015', 'CUENTA DE UTILIDADES', 'Cuenta de patrimonio para registrar la ultilidad al realizar el proceso de cierre del ejercio', '35050501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('016', 'CUENTA DE PERDIDA', 'Cuenta de patrimonio para registrar la perdida al realizar el proceso de cierre del ejercio', '35051001', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('017', 'CUENTA DE AJUSTE', 'Cuenta de ajuste utilizada en el proceso de ciere del ejerccio, se recomienda una cuenta 5905', '59050501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('018', 'CUENTA DE IVA EN VENTAS', ' ', '51157005', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('019', 'CUENTA DE DESCUENTOS EN VENTAS', ' ', '53053501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('020', 'CUENTAS POR COBRAR', 'Cuenta contable donde se reciben los dineros generados por otras cuentas pendientes por cobrar a terceros.', '16902501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('021', 'CUENTA RETEIVA EN VENTAS', ' ', '24470501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('022', 'CUENTA RETEICA EN VENTAS                                    ', 'CUENTA RETEICA EN VENTAS ', '16751001                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('023', 'PORCENTAJE DE IVA EN VENTAS', ' ', '16', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('024', 'CUENTA DE CAJA', ' ', '11050505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('025', 'CUENTA DE VENTAS???', ' ', '61353601', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('026', 'CUENTA DE INGRESOS EN VENTAS', ' ', '41353601', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('027', 'PORC. EN VENTAS AMBULANTES MAYOR', ' ', '10', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('028', 'PORC. EN VENTAS AMBULANTES MENOR', ' ', '5', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('029', 'VALOR LIQUIDACION VENTAS AMBULANTES', ' ', '500000', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('030', 'PORCENTAJE POR VENTAS DE CONTADO', ' ', '5', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('031', 'CUENTA CXP LIQUIDADAS', ' ', '23150501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('032', 'CUENTA GASTO LIQUIDADO', ' ', '51051805', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('033', 'CUENTA DE DESCTO. ANTICIPADO', ' ', '41750505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('034', 'CUENTA DE DESCTO. POR DEVOLUCIONES', ' ', '42054501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('035', 'CUENTA DE INTERES EN PRESTAMOS', ' ', '42100501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('036', 'CUENTA DE DESCTO EN PRESTAMO', ' ', '42054501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('037', 'CUENTA DE INTERES X MORA EN PREST.', ' ', '42100501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('039', 'TASA', ' ', '5,4', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('040', 'CUENTA DE LIBRANZAS                                         ', ' CUENTA LIBRANZAS', '14410501                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('042', 'CUENTA DE DEVOLUCION                                        ', 'CONCEPTO 505-TESORERIA', '24953001', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('043', 'CUENTA DE INTERES', ' ', '41851001', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('044', 'CUENTA DE LIBRANZA INTERES', 'CUENTA DE LIBRANZA INTERES (YA NO SE UTILIZA)', '16551801', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('045', 'PORCENTAJE DE AMPLIACION', ' ', '3,55555', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('046', 'PORCENTAJE DE LIBRANZA RECOGE', ' ', '7,77777', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('047', 'PORCENTAJE DE AMPLIACION MAYOR', ' ', '7,77777', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('048', 'VALOR DE COMISION', ' ', '40000', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('049', 'CUENTA DE CXP A VENDEDORES', ' ', '24150501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('050', 'CUENTA DE COMISION                                          ', 'CUENTA COMISION ', '51104801                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('051', 'CUENTA DE INTERES X REFINANCIACION', ' ', '41750505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('052', 'CUENTA COSTO ENTREGADO', ' ', '61500501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('053', 'CUENTA DE CUENTAS X PAGAR', ' ', '27959501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('054', 'CUENTA DE CAJA', ' ', '', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('055', 'CUENTA DE INTERES POR REFINANCIACION', ' ', '41750505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('056', 'CUENTA DE INTERES POR MORA', ' ', '42100502', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('057', 'CUENTA DE COMISION (RESTITUCION DE LIBRANZ)', ' ', '51106201', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('060', 'PORCENTAJE DE AMPLIACIÓN ELECTROD.', ' ', '3,5', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('061', 'PORCENTAJE DE AMPLIACIÓN MAYOR ELECTROD.', ' ', '12', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('062', 'PORCENTAJE DE RECOJE DE ELECTRODOMESTICO', ' ', '12', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('063', 'CUENTA DE DESCUENTOS 4XMIL', ' ', '53050510', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('064', 'CUENTA DE DESCUENTOS OTROS', ' ', '42950506', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('065', 'CUENTA DE CXP DE LIBRANZAS DE ELECTRODOMESTICOS', ' ', '23050103', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('066', 'CUENTA DE RECAUDO(PAGOS X RELACION)                         ', ' CUENTA DE RECAUDO(PAGOS X RELACION)                         ', '16501501                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('074', 'CUENTA DE PAGONET', ' ', '11100590', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('075', 'CUENTA DE CARTERA MOROSA(CARGOS X MORA)', ' ', '13050580', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('076', 'CUENTA DE INTERESES POR MORA', ' ', '42100502', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('077', 'CUENTA DE RECAUDOS DE TESORERIA(PAGOS DIRECTOS)', ' ', '28050520', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('078', 'CUENTA DE RECAUDOS DE CERTIFICADOS', 'Cuenta para el recaudo de dineros por concepto de solicitud de certificados de saldo.', '42950502', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('079', 'VALOR DE CONSIGNACION', ' ', '5000', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('080', 'CUENTA DE RECAUDO DE GASTO', ' ', '42505005', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('081', 'CUENTA DE INTERES', ' ', '', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('082', 'CUENTA DE CXP COMISION CLIENTES NUEVOS', ' ', '24150501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('083', 'CUENTA DE COMISION CLIENTES NUEVOS', ' ', '51104801', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('084', 'CUENTA DE RETENCION EN COMISION CLIENTES NUEVOS', ' ', '24452001', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('089', 'FECHA DE INICIO CONTABLE', ' ', '0000-00-00', 'D', 'A');
INSERT INTO `cfg_parametros` VALUES ('091', 'PARAMETRO DE % POR VENTA DE MERCANCIA', ' ', '44.81657', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('093', 'NIT PRONTOCREDITO LTDA', ' ', '900102962-3', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('094', 'CUENTA DE CXP PRONTOCREDITO LTDA', ' ', '27959502', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('096', 'CUENTA DEDUCCION PAGOS X RELACION', ' ', '24953003', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('097', 'CUENTA DE CREDITOS A VENDEDORES', ' ', '16259501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('098', 'TASA EFECTIVA ANUAL                                         ', ' TASA EFECTIVA ANUAL', '22                                                                                                  ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('099', 'MAXIMO DESCUENTO EN VENTAS', ' ', '0', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('100', 'CUENTA DE ANTICIPO A PROVEEDORES', ' ', '13300501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('101', 'CUENTA DE CHEQUES POSFECHADOS', ' ', '81100502', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('102', 'CUENTA DE CHEQUES RECIBIDO EN GARANTIA CREDITO', ' ', '91100501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('103', 'CODIGO LISTA DE PRECIOS LIBRANZA', ' ', '001', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('104', 'BODEGA DE OBSEQUIOS', ' ', '03', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('105', 'CUENTA DE PRESTAMOS A EMPLEADOS', ' ', '13050505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('106', 'CUENTA DE CUENTAS X COBRAR CONVENIO', ' ', '0', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('107', 'CUENTA DE INTERES PRESTAMOS PERSONALES', ' ', '41501003', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('108', 'CUENTA DE INTERES VENTAS CREDICONTADO', ' ', '41502004', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('109', 'CODIGO DE DESCUENTO GARANTIA DE VENTA', ' ', '01', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('110', 'CUENTA DE VENTAS CREDICONTADO', ' ', '13050515', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('111', 'CUENTA RECAUDO A EMPLEADOS', ' ', '0', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('112', 'CUENTA RECAUDO A EMPLEADOS PRONTO', ' ', '0', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('114', 'CODIGO DE DSCTO PRESTAMOS EMPRESA', ' ', '12', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('115', 'CODIGO DE DSCTO ANTICIPOS', ' ', '13', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('116', 'CUENTA DESCUENTOS EN PRESTAMOS', ' ', '51403501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('117', 'MAXIMO DIAS PARA PAGAR UNA LIBRANZA O COMISION', ' ', '30', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('118', 'VR MAXIMO DE PAGONET X DIA', ' ', '40000000', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('119', 'VR MAXIMO DE PAGONET X PAQUETE', ' ', '20000000', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('120', 'VR MINIMO DE PAGONET X CLIENTE                              ', ' VR MINIMO DE PAGONET X CLIENTE  ', '10000                                             ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('121', 'CUENTA DE TITULO VALOR RECIBIDO EN GARANTIA', ' ', '81100502', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('122', 'CUENTA DE TITULO VALOR RECIBIDO EN GARANTIA(CREDITO)', ' ', '91100502', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('123', 'CUENTA DE RETEFUENTE EN VENTAS', ' ', '24050101', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('124', 'CUENTA DEVOLUCION BONOS PRONTOCREDITO', ' ', '0', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('125', 'CUENTA DE APOYO A MERCADEO', ' ', '0', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('126', 'CUENTA DESCUENTO A PIE DE FACTURA', ' ', '0', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('128', 'PORCENTAJE DE C. INICIAL PLAN SEPARE', ' ', '30', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('129', 'PORCENTAJE PARA COBRO JURIDICO', ' ', '6.2', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('131', 'CUENTA DE APORTE INICIAL AFILIADOS                          ', ' CUENTA DE APORTE INICIAL AFILIADOS    ', '41900501                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('132', 'CUENTA LIBRANZA COOPERATIVA CARTERA', 'CUENTA PARA EL RECAUDO (CARTERA)  (YA NO SE UTILIZA)', '14410501                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('133', 'CUENTA DE CUENTAS X PAGAR COOPERATIVA', ' ', '24953005', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('134', 'CUENTA INGRESO INTERESES', ' CUENTA INGRESO INTERES  (YA NO SE UTILIZA)', '41851001', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('136', 'CUENTA DE AFILIACION', ' ', '31050501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('137', 'CUENTA CAJA PRIMAS', ' ', '41851004', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('138', 'VIGENCIA DE LIB. PARA COMISION (DIAS)                       ', 'numero de dias hacia atras en los que se tendra en cuenta las libranzas para liquidacion de comisiones a vendedores ', '180', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('139', 'TASAR                                                       ', 'Tasa utilizada para calcular la cuota del credito segun el sistema highlander', '3.30128                                           ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('140', 'FUENTE PARA CAUSACION DE GASTO', 'Fuente utilizada para la causacion de gasto', 'CG', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('142', 'PARAMETRO DE PRUEBA                                ', 'ESTO ES UNA PRUEBA', 'NADA              ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('143', 'CUENTA RETEIVA                                     ', 'CUENTA RETEIVA', '24470501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('144', 'PORCENTAJE DE IVA                                  ', 'PORCENTAJE DE IVA  ', '16,0              ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('145', 'CUENTA DE COSTO DE VENTAS                                   ', 'CUENTA DE COSTO DE VENTAS', '61755001                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('147', 'PRUEBA 28-02-2010', 'esto es una prueba', '5', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('148', 'PRUEBA2- 28-01-2010', 'prueba', 'PB', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('152', 'CUENTA GASTO COMISION DE VENDEDORES                ', 'Cuenta contable, correspondiente al gasto de comisiones de vendedores', '51104801', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('153', 'CUENTA POR PAGAR COMISION DE VENDEDORES            ', 'Cuenta contable correspondiente a la cuenta por pagar de comisiones a vendedores', '24150501          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('156', 'DIA DE LA SEMANA SIGUIENTE CUOTA                            ', 'Dia de la semana desde el cual se empieza a cobrar la siguiente cuota a un credito de un vendedor', '4', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('157', 'NUMERO DE DIAS CUOTA VENDEDOR                      ', 'Cantidad de dias para descontar la cuota de un prestamo externo a un vendedor', '7', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('159', 'CONCEPTO RETENCION EN LA FUENTE                             ', 'Codigo del concepto parametrizado en el modulo de asesores utilizado para descontar la retencion en la fuente de las liquidaciones por comision sobre ventas', '001                                               ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('161', 'VALOR META PARA COMISIONAR POR VENTAS                       ', 'Valor estipulado como meta en ventas mensuales, para que los vendedores puedan comisionar', '40000000                                          ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('163', 'VALOR META PARA BONIFICACION POR CARTERA                    ', 'Meta de ventas estipulada para bonificacion de cartera   ', '20000000                                          ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('164', 'NRO. MESES LIBRANZA ANTERIOR                                ', 'Cantidad mínima de meses para catalagar una libranza como \"vieja\", aplica para el proceso de bonificaciones a vendedores y saber cuando un cliente se considera nuevo o antiguo', '6                                                 ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('165', 'PORC. BONIFICACION CLIENTES NUEVOS                          ', 'porcentaje de bonificacion a los vendedores por clientes nuevos', '10                                                ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('166', 'PORC. RETEFUENTE BONIFICACION                               ', 'porcentaje retencion en la fuente para las bonificaciones a vendedores por clientes nuevos', '0                                                 ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('167', 'MAXIMO VECES CODEUDOR                                       ', 'Maximo de veces que un tercero puede ser codeudor', '6                                                 ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('168', 'LIMITE DE MESES LIBRANZA BONIFICACIONES            ', 'Numero de meses limite para el estado pendiente de una libranza que se ha clasificado en bonificaciones y colocarla en estado anulada para efectos de bonificacion por clientes nuevos ', '3', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('169', 'LIMITE DE DIAS PARA LIQUIDACION DE CREDITO', 'Numero de Dias que se toman hacia adelante a partir de la fecha del sistema para calcular los Intereses x Causar en una Liquidacion de Credito', '30', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('170', 'CUENTA CORRIENTE DE RECAUDOS                                ', 'Cuenta Corriente en donde se cancelan los saldos expedidos en los Certificados de Saldos', '21002714333                                       ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('171', 'CODIGO DE BANCO DE RECAUDOS PARA CERTIFICACIONES DE SALDO', 'Codigo de banco de recaudos para certificaciones de saldo', '32', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('174', 'CUENTA PARA RECAUDO PARA LIQUIDACION DE CREDITOS            ', 'Recaudo para liquidación de crédito', '24959505', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('175', 'CUENTA DE CHEQUES EN CUSTODIA', 'Cuenta de cheques en custodia', '28301501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('177', 'CUENTA INGRESO OBLIGACIONES COBRO JURIDICO', 'CUENTA INGRESO OBLIGACIONES COBRO JURIDICO', '41859801', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('178', 'CUENTA OBLIGACIONES COBRO JURIDICO', 'Cuenta obligaciones en cobro jurídico', '14910501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('179', 'BASE DE DATOS NEMESIS', 'Nombre de la base de datos Némesis', 'nemesis', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('180', 'CERRAR SESION DE CAJA CADA DIA', 'Obliga el cierre de la sesion de caja cuando la fecha de apertura no coincide con la fecha del sistema. Valores permitidos S/N', 'N', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('181', 'CODIGO DEL MEDIO DE PAGO EFECTIVO', 'Medio de pago efectivo', 'EF', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('182', 'CODIGO DEL MEDIO DE PAGO CHEQUES DE INGRESO', 'Medio de pago cheques de ingreso', 'CH', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('186', 'CUENTA POR PAGAR LIQUIDACION APORTES               ', 'cuenta por pagar para la liquidacion de aportes a asociados', '24650501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('187', 'PERMITIR REIMPRIMIR CHEQUES                                 ', 'Establece si esta permitido reimprimir un cheque de un egreso S/N', 'N                                                                                                   ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('188', 'VALOR DE CONSIGNACION PARA CERTIFICADOS DE SALDO   ', 'VALOR DE CONSIGNACION PARA CERTIFICADOS DE SALDO.', '5000              ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('189', 'Nro. DE DIAS LIMITE PARA VIGENCIA DE LIBRANZAS CANCELADAS ', 'ESTE PARAMETRO INDICA EL Nro DE DIAS QUE SE TIENEN EN CUENTA PARA DETERMINAR QUE CREDITOS A PARTIR DE LA FECHA DE CANCELACION SE MUESTRAN EN LA CONSULTA DE PAZ Y SALVO Y ESTADO DE OBLIGACIONES', '10000', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('191', 'CUENTA PARA PRESTAMOS RECIBIDOS', 'Cuenta contable donde se lleva el valor de los prestamos recibidos de otras empresas', '23051501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('192', 'MAXIMO DE CUOTAS CREDICONTADO COTIZACIONES', 'Numero maximo de cuotas a diferir en un credicontado (cotizaciones)', '12                ', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('193', 'CONTABILIZAR DESCUENTO', 'Valor que define si contabilizar o no el descuento en las facturas por venta. \r\nValores posibles : \"S\"=Si \"N\"=No ', 'N', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('194', 'CUENTA DINEROS RECIBIDOS PREPAGO DEUDUDA COOP', 'Cuenta para registrar los dineros que se reciben de otras entidades (coopro)', '24959506', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('195', 'CUENTA DINEROS RECIBIDOS PAGOS POR RELACION DE COOP.	       ', 'Cuenta para registrar los dineros que se reciben de otras entidades (coopro) x concepto de relación de pagos.', '24603001                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('196', 'TIPO DE REPORTE DE PROYECCION                               ', 'DETERMINA EL TIPO DE REPORTE QUE SE IMPRIME CUANDO SE ESTA EN LA VENTANA PROYECCION Y RECAUDO DE CREDITO.\r\nVALORES\r\n\r\nA - REPORTE TIPO 1 \r\nB - REPORTE TIPO 2', 'B                                               ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('197', 'NOMBRE GERENTE', 'Guarda el nombre del gerente, este aparecera en los informes de contabilidad como balance y p&g', '', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('198', 'NOMBRE CONTADOR                                             ', 'Nombre del contador que aparecera en los informes financieros como balance y p&g', 'DANIEL ENRIQUE CASSIANI ARAGON', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('199', 'TARJETA PROFESIONAL CONTADOR                                ', 'Número de la tarjeta profesional del contador, este se utilizará en los informes contables como balance y p&g', '85322', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('200', 'NOMBRE REVISOR FISCAL', 'Nombre del revisor fiscal que aparecera en los informes financieros como balance y p&g', '', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('201', 'TARJETA PROFESIONAL REVISOR FISCAL', 'Número de la tarjeta profesional del revisor fiscal, este se utilizará en los informes contables como balance y p&g', '', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('203', 'CUENTA DE CTA X PAGAR SEGURO CARTERA', 'CTA X PAGAR SEGURO CARTERA', '24159501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('204', 'NIT DEL TERCERO PARA PAGO DE POLIZA DE SEGURO DE CARTERA', 'NIT DEL TERCERO PARA PAGO DE POLIZA DE SEGURO DE CARTERA', '860009174', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('205', 'NOMBRE DE FACTURA                                  ', 'Nombre del reporte de factura', 'REPFACTURA        ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('206', 'RENTABILIDAD LISTA DE PRECIOS %                    ', 'Porcentaje de rentabilidad en el precio de venta al publico de los diferentes articulos del inventario', '10                ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('207', 'CUENTA CAPITAL SUSCRITO                            ', 'Cuenta capital suscrito', '31051001          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('208', 'BUSQUEDA EN BASE DE DATOS                          ', 'INDICA SI SE VAN A RECORRER TODAS LAS BASES DE DATOS PARA VISUALIZAR LOS CREDITOS REALIZADOS EN LA VENTANA MOVIMIENTO DE ASOCIADO.\r\n\r\nVALORES \'S\' - \'N\'.', 'S                 ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('209', 'NUMERO DE MESES A VALIDAR EN LA CLASIFICACION DE VENDEDORES', 'NUMERO DE MESES A VALIDAR EN LA CLASIFICACION DE VENDEDORES', '3', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('210', 'BASE PARA OBTENE TOTAL VENTA DE CLASIFICACION DE VENDEDOR', 'BASE PARA OBTENE TOTAL VENTA DE CLASIFICACION DE VENDEDOR', 'libr_vlrinversion', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('211', 'CUENTA DE APORTES EXTRAORDINARIOS', 'CUENTA DE APORTES EXTRAORDINARIOS', '', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('213', 'RANGO DIAS PARA PRELIQUIDACION SEGURO DE CARTERA   ', 'ESTABLECE EL RANGO DE DIAS QUE SE VALIDAN DE UNA LIQUIDACION A OTRA PARA LA OPCION DE SEGURO DE CARTERA.', '0', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('214', 'LIMITE REEMBOLSO RETENCION                                  ', 'Dia del mes maximo para liquidar el reembolso de retenciones', '30                                                ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('215', 'CUENTA INGRESO POR HONORARIOS                      ', 'cuenta para el concepto de ingreso por tesoreria 599, ojo cambiar el numero de la cuenta', '42950503          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('216', 'CUENTA OTROS INGRESOS', 'Cuenta para el concepto de recibo de caja 521-Otros ingresos\r\n**Modificacion de 42950503 a 16259502  2013-06-05   \r\n**Modificación de 16259502 a 31050501  2013-11-16 SOLICITADO POR MAIDEN GUTIERREZ \r\n**Modificación de 16259502 a 16259502  2013-11-19 SOLICITADO POR DENIS PERTUZ\r\n**Modificación de 31050101 A 16350501 2013-12-21 SOLICITADO POR DENIS PERTUZ PARA RC EN CARTAGENA\r\n**Modificación de 16350501 A 16909503 2014-01-30 SOLICITADO POR WILBERTO BLANCO\r\n**Modificación de 16909503 A 16259502 2014-05-31 SOLICITADO POR DENIS PERTUZ\r\n**Modificación de 16909503 A 42950503 2014-05-31 SOLICITADO POR DENIS PERTUZ\r\n', '16909503', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('217', 'CUENTA RECAUDO HONORARIOS                          ', 'Cuenta recaudo honorarios concepto de tesoreria 522', '24603002', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('218', 'CUENTA APORTES ORDINARIOS EMPLEADOS', 'Aportes ordinarios empleados concepto de tesoreria 508', '31050501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('219', 'RUTA EXPORTACION DE ARCHIVOS', 'Guarda la ruta en la que se exportan a excel las consultas del sistema', 'c:\\temp\\', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('220', 'CODIGO CIFIN', 'GUARDA EL TIPO ENTIDAD Y CODIGO DE ENTIDAD ASIGNADO POR LA CIFIN', '050620', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('224', 'CUENTA ANTICIPO COMISIONES                                  ', 'Cuenta de anticipo a comisiones  y bonificaciones a vendedores', '51104801                                          ', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('225', 'EDAD MAXIMA ASOCIADO                               ', 'Edad maxima que debe tener el asociado para afiliarse a la cooperativa', '95', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('226', 'NUMERO MAXIMO DE ENVIOS EN NOVEDAD', 'NUMERO DE VECES EN QUE SE PUEDE ENVIAR UNA LIBRANZA EN NOVEDAD ANTES DE IRSE A JURIDICA', '3', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('227', 'LINEA DE CREDITO PARA RECUPERACION DE CARTERA', 'LINEA DE CREDITO PARA RECUPERACION DE CARTERA', '', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('228', 'CALCULO VLR INV SEGURO DE CARTERA', 'Condicion que se evalua para tomar el valor inversion base para Liquidacion Seguro de cartera', 'saldoinversion', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('229', 'TASA TEA A TOMAR EN RECUP. DE CARTERA', '1 TASA LIB. A MODIFICAR, 2 TASA ACTUAL', '2', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('230', 'PERIODICIDAD A TOMAR EN RECUP. DE CARTERA', '1 PERIOD. LIB. A MODIFICAR, 2 PERIOD. DE LA LINEA DE RECUP.', '1', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('234', 'CODIGO DE PLANO PREDETERMINADO EN NOVEDAD', 'CODIGO DE PLANO PREDETERMINADO PARA LAS PAGADURIAS NUEVAS SIN CONFIG. DE PLANO', '001', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('236', 'NUMERO DE DIAS DE EXIGIBILIDAD DE PAGOS', 'NUMERO DE DIAS DE EXIGIBILIDAD DE PAGOS', '60', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('238', 'NOMBRE FIRMANTE EN CARTAS DE COBRO', 'NOMBRE FIRMANTE EN CARTAS DE COBRO', '', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('239', 'RUTA IMAGEN DE FIRMA EN CARTAS DE COBRO', 'RUTA IMAGEN DE FIRMA EN CARTAS DE COBRO', '', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('240', 'FUENTE UTILIZADA EN LAS REVERSIONES DE DOC. CONTABLES', 'FUENTE UTILIZADA EN LAS REVERSIONES DE DOC. CONTABLES', 'RD', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('241', 'CUENTA CONCEPTO 524 - CANCELACION DE INCAPACIDADES', 'CUENTA CONCEPTO 524 - CANCELACION DE INCAPACIDADES', '16909503', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('242', 'COBRANZA-', 'IP,PUERTO,BD,USUARIO,CLAVE PARA CONSULTAR SI UN CLIENTE ESTA EN COBRANZA', '192.168.1.226,3307,dafin,root,3151AF8561DD1C0DE194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B3E194215F539E57B37044A00A65D6F199', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('243', 'PERMITIR EDITAR CAMPO DE CARGO POR SERVICIOS (S/N)', 'PERMITIR EDITAR CAMPO DE CARGO POR SERVICIOS (S/N)', 'N', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('244', 'INT. ANTICIPADO SE CAPITALIZA (S/N)', 'INT. ANTICIPADO SE CAPITALIZA (S/N)', 'S', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('246', 'CUENTA CXP DE CARGO POR SERVICIOS', 'CUENTA CXP DE CARGO POR SERVICIOS', '24959501', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('247', 'NUMERO DE PERIODOS DISPONIBLES EN CONTRATOS POR SERV.', 'NUMERO DE PERIODOS DISPONIBLES EN CONTRATOS POR SERV.', '3', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('248', 'PERMITIR EDITAR CAMPO DE PERIODO DE INT. ANTICIPADO', 'PERMITIR EDITAR CAMPO DE PERIODO DE INT. ANTICIPADO', 'S', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('249', 'RUTA LOGO DE EMPRESA', 'RUTA LOGO DE EMPRESA', '\\\\192.168.1.104\\fenix\\coosuper.jpg', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('250', 'PERMITIR REDONDEAR A TRES CIFRAS EL VALOR DE LA CUOTA (S/N)', 'PERMITIR REDONDEAR A TRES CIFRAS EL VALOR DE LA CUOTA (FORM. DE SOLICITUD DE CREDITO)', 'S', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('251', 'REPORTAR A CIFIN MES SGTE. AL CORTE DE CARTERA (S/N)', 'SI ESCOGE NO, SE REPORTA HASTA LA FECHA DE CORTE SIN ADELANTAR UN MES', 'S', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('252', 'CONTRATOS POR SERVICIOS', 'RECIBIR DINEROS DE  CONTRATOS POR SERVICIOS', '41509805', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('253', 'CORREO ARCHIVO PLANO', 'CORREO QUE SE COLOCA POR DEFECTO EN LA GENERACION DEL ARCHIVO PLANO DE BBVA.', 'tesoreria@coosupercredito.com', 'C', 'A');
INSERT INTO `cfg_parametros` VALUES ('255', 'PORCENTAJE SANCION PREPAGO', '% DE SANCION PREPAGO COBRADO EN LA LIQUIDACION DE UN CREDITO. SOBRE EL VALOR DE SALDO INVERSION.', '10', 'N', 'A');
INSERT INTO `cfg_parametros` VALUES ('256', 'VALOR BASE CUOTA CALCULO DE MORA', 'VALOR BASE CUOTA CALCULO DE MORA. 1: CUOTA LIBRANZA. 2: CUOTA DEL CREDITO', '1', 'C', 'A');

-- ----------------------------
-- Table structure for cfg_roles
-- ----------------------------
DROP TABLE IF EXISTS `cfg_roles`;
CREATE TABLE `cfg_roles` (
  `role_idrol` char(3) COLLATE latin1_spanish_ci NOT NULL,
  `role_nombre` varchar(60) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'NombreRol',
  `role_estado` enum('A','I') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A',
  `role_fcreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_usrcreacion` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`role_idrol`),
  KEY `role_usrcreacion` (`role_usrcreacion`),
  CONSTRAINT `cfg_roles_ibfk_1` FOREIGN KEY (`role_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of cfg_roles
-- ----------------------------
INSERT INTO `cfg_roles` VALUES ('AD2', 'ADMINISTRADOR 2', 'A', '2015-07-19 17:23:22', 'ADMIN');
INSERT INTO `cfg_roles` VALUES ('ADI', 'AUXILIAR DE AUDITORIA', 'A', '2015-07-19 17:22:03', 'ADMIN');
INSERT INTO `cfg_roles` VALUES ('ADM', 'ADMINISTRADOR', 'A', '2015-01-18 15:25:51', 'ADMIN');
INSERT INTO `cfg_roles` VALUES ('AU2', 'ROL DE PRUEBA', 'A', '2015-07-20 21:27:32', 'ADMIN');
INSERT INTO `cfg_roles` VALUES ('AUD', 'COORDINADOR DE AUDITORIA', 'A', '2015-07-16 21:57:07', 'ADMIN');
INSERT INTO `cfg_roles` VALUES ('AUX', 'AUXILIAR DE SOPORTE', 'A', '2015-07-24 21:45:17', 'ADMIN');
INSERT INTO `cfg_roles` VALUES ('CON', 'CONTADOR PUBLICO', 'A', '2015-07-25 05:07:53', 'ADMIN');
INSERT INTO `cfg_roles` VALUES ('SUP', 'SUPERVISOR', 'A', '2015-07-25 05:09:08', 'ADMIN');

-- ----------------------------
-- Table structure for cfg_rolesopciones
-- ----------------------------
DROP TABLE IF EXISTS `cfg_rolesopciones`;
CREATE TABLE `cfg_rolesopciones` (
  `roop_idrol` varchar(3) COLLATE latin1_spanish_ci NOT NULL,
  `roop_idopcion` smallint(5) unsigned NOT NULL,
  `roop_buscar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `roop_nuevo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `roop_guardar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `roop_cancelar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `roop_modificar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `roop_anular` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `roop_imprimir` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `roop_supervisar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roop_idrol`,`roop_idopcion`),
  KEY `roop_idopcion` (`roop_idopcion`),
  CONSTRAINT `cfg_rolesopciones_ibfk_1` FOREIGN KEY (`roop_idrol`) REFERENCES `cfg_roles` (`role_idrol`),
  CONSTRAINT `cfg_rolesopciones_ibfk_2` FOREIGN KEY (`roop_idopcion`) REFERENCES `publica`.`mae_opciones` (`opci_idopcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of cfg_rolesopciones
-- ----------------------------
INSERT INTO `cfg_rolesopciones` VALUES ('AD2', '7', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AD2', '8', '1', '1', '1', '1', '0', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AD2', '9', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AD2', '10', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AD2', '14', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADI', '13', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADI', '17', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADI', '19', '0', '1', '0', '0', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADI', '21', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADI', '22', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '3', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '4', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '5', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '7', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '8', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '9', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '10', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '12', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '13', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '14', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '17', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '19', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '21', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('ADM', '22', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AU2', '17', '0', '1', '0', '0', '0', '1', '0', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AUD', '19', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AUD', '21', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AUD', '22', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `cfg_rolesopciones` VALUES ('AUX', '7', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AUX', '8', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AUX', '9', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AUX', '10', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('AUX', '14', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('CON', '13', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('CON', '17', '0', '1', '1', '1', '0', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('CON', '19', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('CON', '21', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('CON', '22', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cfg_rolesopciones` VALUES ('SUP', '12', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `cfg_rolesopciones` VALUES ('SUP', '13', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for cfg_rolesusuarios
-- ----------------------------
DROP TABLE IF EXISTS `cfg_rolesusuarios`;
CREATE TABLE `cfg_rolesusuarios` (
  `rous_usuario` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `rous_idrol` char(3) COLLATE latin1_spanish_ci NOT NULL,
  `rous_fcreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rous_usrcreacion` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`rous_usuario`,`rous_idrol`),
  KEY `rous_idrol` (`rous_idrol`),
  CONSTRAINT `cfg_rolesusuarios_ibfk_1` FOREIGN KEY (`rous_usuario`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`),
  CONSTRAINT `cfg_rolesusuarios_ibfk_2` FOREIGN KEY (`rous_idrol`) REFERENCES `cfg_roles` (`role_idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of cfg_rolesusuarios
-- ----------------------------
INSERT INTO `cfg_rolesusuarios` VALUES ('ADMIN', 'ADM', '2015-01-18 16:39:09', 'ADMIN');

-- ----------------------------
-- Table structure for cfg_sucursales
-- ----------------------------
DROP TABLE IF EXISTS `cfg_sucursales`;
CREATE TABLE `cfg_sucursales` (
  `sucu_codigo` char(3) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `sucu_nombre` varchar(80) COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  `sucu_ubicacion` char(8) COLLATE latin1_spanish_ci NOT NULL,
  `sucu_direccion` varchar(60) COLLATE latin1_spanish_ci DEFAULT NULL,
  `sucu_telefono1` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `sucu_telefono2` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `sucu_email` varchar(60) COLLATE latin1_spanish_ci DEFAULT NULL,
  `sucu_estado` enum('A','I') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A',
  `sucu_usrcreacion` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `sucu_fcreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sucu_codigo`),
  KEY `sucu_dpto` (`sucu_ubicacion`),
  KEY `sucu_usrcreacion` (`sucu_usrcreacion`),
  CONSTRAINT `cfg_sucursales_ibfk_1` FOREIGN KEY (`sucu_ubicacion`) REFERENCES `publica`.`mae_dptomunicipio` (`lug_idpdm`),
  CONSTRAINT `cfg_sucursales_ibfk_2` FOREIGN KEY (`sucu_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of cfg_sucursales
-- ----------------------------
INSERT INTO `cfg_sucursales` VALUES ('001', 'BARRANQUILLA - PRINCIPAL', '16908001', 'CALLE 41 NRO. 43-19', '3411808', null, null, 'A', 'ADMIN', '2015-01-15 21:18:08');

-- ----------------------------
-- Table structure for cfg_sucursalesusuario
-- ----------------------------
DROP TABLE IF EXISTS `cfg_sucursalesusuario`;
CREATE TABLE `cfg_sucursalesusuario` (
  `ussu_alias` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `ussu_sucursal` char(6) COLLATE latin1_spanish_ci NOT NULL,
  `ussu_usrcreacion` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `ussu_fcreacion` datetime NOT NULL,
  `ussu_estado` enum('A','I') COLLATE latin1_spanish_ci DEFAULT 'A',
  PRIMARY KEY (`ussu_alias`,`ussu_sucursal`),
  KEY `ussu_sucursal` (`ussu_sucursal`),
  KEY `ussu_usrcreacion` (`ussu_usrcreacion`),
  CONSTRAINT `cfg_sucursalesusuario_ibfk_1` FOREIGN KEY (`ussu_alias`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`),
  CONSTRAINT `cfg_sucursalesusuario_ibfk_2` FOREIGN KEY (`ussu_sucursal`) REFERENCES `cfg_sucursales` (`sucu_codigo`),
  CONSTRAINT `cfg_sucursalesusuario_ibfk_3` FOREIGN KEY (`ussu_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of cfg_sucursalesusuario
-- ----------------------------
INSERT INTO `cfg_sucursalesusuario` VALUES ('ADMIN', '001', 'ADMIN', '2017-06-18 17:44:55', 'A');

-- ----------------------------
-- Table structure for cn_comprobantes
-- ----------------------------
DROP TABLE IF EXISTS `cn_comprobantes`;
CREATE TABLE `cn_comprobantes` (
  `comp_sucursal` char(3) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Sucursal',
  `comp_fuente` char(2) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Tipo de fuente contable',
  `comp_consecutivo` varchar(12) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Consecutivo del comprobante',
  `comp_consecutivoant` varchar(12) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `comp_fecha` date NOT NULL COMMENT 'Fecha del comprobante. DD/MM/AAAA',
  `comp_descripcion` text COLLATE latin1_spanish_ci COMMENT 'Descripción del comprobante',
  `comp_anexo` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Anexos del comprobante',
  `comp_usrcreacion` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `comp_fcreacion` datetime NOT NULL,
  `comp_estado` enum('A','I') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A' COMMENT 'Estado del comprobante. A: ACTIVO, I:INACTIVO',
  PRIMARY KEY (`comp_sucursal`,`comp_fuente`,`comp_consecutivo`),
  KEY `comp_fuente` (`comp_fuente`),
  KEY `comp_usrcreacion` (`comp_usrcreacion`),
  KEY `comp_sucursal` (`comp_sucursal`),
  CONSTRAINT `cn_comprobantes_ibfk_1` FOREIGN KEY (`comp_sucursal`) REFERENCES `cfg_sucursales` (`sucu_codigo`),
  CONSTRAINT `cn_comprobantes_ibfk_2` FOREIGN KEY (`comp_fuente`) REFERENCES `cn_fuentes` (`fuen_codigo`),
  CONSTRAINT `cn_comprobantes_ibfk_3` FOREIGN KEY (`comp_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of cn_comprobantes
-- ----------------------------

-- ----------------------------
-- Table structure for cn_comprobantesdetalle
-- ----------------------------
DROP TABLE IF EXISTS `cn_comprobantesdetalle`;
CREATE TABLE `cn_comprobantesdetalle` (
  `deta_sucursal` char(3) COLLATE latin1_spanish_ci NOT NULL,
  `deta_fuente` char(2) COLLATE latin1_spanish_ci NOT NULL,
  `deta_consecutivo` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `deta_item` int(5) NOT NULL COMMENT ' ',
  `deta_puc` varchar(12) COLLATE latin1_spanish_ci NOT NULL COMMENT ' ',
  `deta_debito` double(20,2) unsigned DEFAULT '0.00' COMMENT ' ',
  `deta_credito` double(20,2) unsigned DEFAULT '0.00',
  `deta_nit` varchar(12) COLLATE latin1_spanish_ci NOT NULL COMMENT ' ',
  `deta_concepto` text COLLATE latin1_spanish_ci,
  `deta_usrcreacion` varchar(30) COLLATE latin1_spanish_ci NOT NULL COMMENT ' ',
  `deta_fcreacion` datetime NOT NULL COMMENT '  ',
  PRIMARY KEY (`deta_sucursal`,`deta_fuente`,`deta_consecutivo`,`deta_item`),
  KEY `deta_sucursal` (`deta_sucursal`,`deta_fuente`,`deta_consecutivo`,`deta_item`),
  KEY `deta_puc` (`deta_puc`),
  KEY `deta_usrcreacion` (`deta_usrcreacion`),
  CONSTRAINT `cn_comprobantesdetalle_ibfk_1` FOREIGN KEY (`deta_sucursal`, `deta_fuente`, `deta_consecutivo`) REFERENCES `cn_comprobantes` (`comp_sucursal`, `comp_fuente`, `comp_consecutivo`),
  CONSTRAINT `cn_comprobantesdetalle_ibfk_2` FOREIGN KEY (`deta_puc`) REFERENCES `cn_puc` (`puc_codigo`),
  CONSTRAINT `cn_comprobantesdetalle_ibfk_3` FOREIGN KEY (`deta_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of cn_comprobantesdetalle
-- ----------------------------

-- ----------------------------
-- Table structure for cn_fuentes
-- ----------------------------
DROP TABLE IF EXISTS `cn_fuentes`;
CREATE TABLE `cn_fuentes` (
  `fuen_codigo` char(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `fuen_nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `fuen_descripcion` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `fuen_estado` enum('A','I') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A',
  `fuen_usrcreacion` varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `fuen_fcreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fuen_codigo`),
  KEY `cn_fuentes_ibfk_1` (`fuen_usrcreacion`),
  CONSTRAINT `cn_fuentes_ibfk_1` FOREIGN KEY (`fuen_usrcreacion`) REFERENCES `publica`.`mae_usuarios` (`usua_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cn_fuentes
-- ----------------------------
INSERT INTO `cn_fuentes` VALUES ('AF', 'ACTIVO FIJO', 'CONTABILIZACION DE ACTIVO FIJO', 'A', 'ADMIN', '2017-06-18 20:06:45');

-- ----------------------------
-- Table structure for cn_fuentesdet
-- ----------------------------
DROP TABLE IF EXISTS `cn_fuentesdet`;
CREATE TABLE `cn_fuentesdet` (
  `fude_sucursal` char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `fude_fuente` char(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `fude_consecutivo` enum('S','N') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'S',
  `fude_numero` varchar(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`fude_sucursal`,`fude_fuente`),
  KEY `fud_fuente` (`fude_fuente`),
  CONSTRAINT `cn_fuentesdet_ibfk_1` FOREIGN KEY (`fude_sucursal`) REFERENCES `cfg_sucursales` (`sucu_codigo`),
  CONSTRAINT `cn_fuentesdet_ibfk_2` FOREIGN KEY (`fude_fuente`) REFERENCES `cn_fuentes` (`fuen_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cn_fuentesdet
-- ----------------------------
INSERT INTO `cn_fuentesdet` VALUES ('001', 'AF', 'S', '0');

-- ----------------------------
-- Table structure for cn_puc
-- ----------------------------
DROP TABLE IF EXISTS `cn_puc`;
CREATE TABLE `cn_puc` (
  `puc_codigo` varchar(12) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Codigo contable',
  `puc_nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Nombre de la cuenta contable',
  `puc_naturaleza` char(1) COLLATE latin1_spanish_ci NOT NULL,
  `puc_nivel` int(2) unsigned NOT NULL DEFAULT '0',
  `puc_bloqueo` int(1) NOT NULL DEFAULT '0',
  `puc_estado` enum('A','I') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`puc_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of cn_puc
-- ----------------------------
INSERT INTO `cn_puc` VALUES ('1', 'ACTIVO', 'D', '1', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11', 'DISPONIBLE', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1105', 'CAJA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('110505', 'CAJA GENERAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('11050501', 'CAJA BARRANQUILLA', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('11050502', 'CAJA SANTAMARTA', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('11050503', 'CAJA CARTAGENA', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('11050504', 'CAJA MONTERIA', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('11050505', 'CAJA SINCELEJO', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('11050506', 'CAJA VALLEDUPAR', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('110510', 'CAJA MENOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('11051001', 'CAJA MENOR BARRANQUILLA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11051002', 'CAJA MENOR SANTA MARTA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11051003', 'CAJA MENOR CARTAGENA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11051004', 'CAJA MENOR MONTERIA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11051005', 'CAJA MENOR SINCELEJO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11051006', 'CAJA MENOR BOGOTA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('1110', 'BANCOS Y OTRAS ENTIDADES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('111005', 'BANCOS COMERCIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('11100501', 'CAJA SOCIAL CTA 21002558982', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11100502', 'BANCO POPULAR 11022019743-2', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11100503', 'BANCO BBVA BARRANQUILLA 090011875', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11100504', 'BANCO BBVA 826015646', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11100505', 'BANCO CAJA SOCIAL 21002664957 CONV 1079', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11100520', 'CUENTA AHORRO CAJA SOCIAL 24018253407', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11100521', 'CUENTA AHORRO VISTA EMPRESARIAL 409 JURISCOOP', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('11100590', 'PAGONET', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('111010', 'BANCOS COOPERATIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('111015', 'ENTIDADES SECTOR SOLIDARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('111020', 'ENTIDADES DEL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('111025', 'OTRAS ENTIDADES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1115', 'FONDOS ESPECIFICOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('111505', 'FONDOS ESPECIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('111510', 'FONDOS DE CAMBIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1120', 'FONDO DE LIQUIDEZ', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('112005', 'DEPOSITO DE AHORRO A LA VISTA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('112010', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1130', 'REMESAS EN TRANSITO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('113005', 'REMESAS DEL PAÍS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('113010', 'REMESAS OTRO PAÍS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('12', 'INVERSIONES', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1201', 'COMPROMISOS DE  REVENTA DE  INVERSIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120105', 'BANCOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120110', 'CORPORACIONES FINANCIERAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120115', 'COMPAÑIAS DE FINANCIAMIENTO COMERCIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120116', 'SOCIEDADES FIDUCIARIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120117', 'SOCIEDADES ADMINISTRADORAS DE FONDOS DE PENSIONES Y DE CESANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120120', 'OTRAS ENTIDADES FINANCIERAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120125', 'BANCO DE LA REPÚBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120130', 'TESORERÍA GENERAL DE LA NACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120135', 'ENTIDADES DEL SECTOR PÚBLICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120140', 'RESIDENTES DEL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120145', 'COOPERATIVAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120150', 'FONDOS DE EMPLEADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120195', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1202', 'COMPROMISOS DE  REVENTA DE CARTERA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120205', 'BANCOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120210', 'CORPORACIONES FINANCIERAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120220', 'COMPAÑIAS DE FINANCIAMIENTO COMERCIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120225', 'OTRAS ENTIDADES FINANCIERAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120230', 'BANCO DE LA REPÚBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120235', 'TESORERÍA GENERAL DE LA NACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120240', 'ENTIDADES DEL SECTOR PÚBLICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120245', 'RESIDENTES DEL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120250', 'COOPERATIVAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120255', 'FONDOS DE EMPLEADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120295', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1203', 'FONDO DE LIQUIDEZ', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120305', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA  SUPERINTEND', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120310', 'CERTIFICADO DE DEPÓSITO DE AHORRO A TÉRMINO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('12031001', 'C.D.T. BANCO CAJA SOCIAL', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('120320', 'FONDOS  FIDUCIARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120325', 'FONDOS DE VALORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120330', 'PATRIMONIO AUTONOMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1204', 'INVERSIONES NEGOCIABLES EN TITULOS DE DEUDA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120401', 'TITULOS DE DEUDA PÚBLICA INTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120402', 'TITULOS DE DEUDA PÚBLICA EXTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120403', 'OTROS TITULOS DE DEUDA PÚBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120404', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGAFIN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120405', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGACOOP', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120406', 'TITULOS EMITIDOS POR EL BANCO DE LA REPUBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120407', 'BONOS HIPOTECARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120408', 'TITULOS HIPOTECARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120409', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE CARTERA HIPOTECARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120410', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE SUBYACENTES DISTINTOS DE ', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120411', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA SUPERINTENDE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120414', 'TITULOS EMITIDOS POR ENTIDADES NO VIGILADAS POR LA SUPERINTENDENCIA BANCARIA (INCLUIDOS LOS BONOS OB', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120415', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR GOBIERNOS EXTRANJEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120416', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR BANCOS CENTRALES EXTRANJEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120417', 'TITULOS EMITIDOS, AVALADOS, GARANTIZADOS O ACEPTADOS POR BANCOS DEL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120418', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR ORGANISMOS MULTILATERALES DE CRÉDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120442', 'TITULOS EMITIDOS POR RESIDENTES EN EL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120495', 'OTROS TITULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1206', 'INVERSIONES NEGOCIABLES EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120601', 'ACCIONES CON ALTA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120602', 'ACCIONES CON MEDIA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120605', 'PARTICIPACIONES EN FONDOS COMUNES ORDINARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120606', 'PARTICIPACIONES EN FONDOS COMUNES ESPECIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120607', 'PARTICIPACIONES EN FONDOS DE VALORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120608', 'TITULOS PARTICIPATIVOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120609', 'TITULOS MIXTOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120610', 'PARTICIPACIONES EN FONDOS MUTUOS DE INVERSION INTERNACIONALES QUE INVIERTAN EXCLUSIVAMENTE EN TITULO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120611', 'PARTICIPACIONES EN FONDOS INDICE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120612', 'PARTICIPACION EN FONDOS MUTUOS DE INVERSION INTERNACIONALES QUE INVIERTAN EXCLUSIVAMENTE EN RENTA VA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120613', 'PARTICIPACION EN FONDOS DE INVERSION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120614', 'PARTICIPACION EN FONDOS DE PENSIONES Y CESANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1208', 'INVERSIONES PARA MANTENER HASTA EL VENCIMIENTO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120801', 'TITULOS DE DEUDA PÚBLICA INTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120802', 'TITULOS DE DEUDA PÚBLICA EXTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120803', 'OTROS TITULOS DE DEUDA PÚBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120804', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGAFIN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120805', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGACOOP', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120806', 'TITULOS EMITIDOS POR EL BANCO DE LA REPUBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120807', 'BONOS HIPOTECARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120808', 'TITULOS HIPOTECARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120809', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE CARTERA HIPOTECARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120810', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE SUBYACENTES DISTINTOS DE ', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120811', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA SUPERINTENDE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120814', 'TITULOS EMITIDOS POR ENTIDADES NO VIGILADAS POR LA SUPERINTENDENCIA BANCARIA (INCLUIDOS LOS BONOS OB', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120815', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR GOBIERNOS EXTRANJEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120816', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR BANCOS CENTRALES EXTRANJEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120817', 'TITULOS EMITIDOS, AVALADOS, GARANTIZADOS O ACEPTADOS POR BANCOS DEL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120818', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR ORGANISMOS MULTILATERALES DE CRÉDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120842', 'TITULOS EMITIDOS POR RESIDENTES EN EL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('120895', 'OTROS TITULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1213', 'INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS DE DEUDA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121301', 'TITULOS DE DEUDA PÚBLICA INTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121302', 'TITULOS DE DEUDA PÚBLICA EXTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121303', 'OTROS TITULOS DE DEUDA PÚBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121304', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGAFIN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121305', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGACOOP', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121306', 'TITULOS EMITIDOS POR EL BANCO DE LA REPUBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121307', 'BONOS HIPOTECARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121308', 'TITULOS HIPOTECARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121309', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE CARTERA HIPOTECARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121310', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE SUBYACENTES DISTINTOS DE ', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121311', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA SUPERINTENDE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121314', 'TITULOS EMITIDOS POR ENTIDADES NO VIGILADAS POR LA SUPERINTENDENCIA BANCARIA (INCLUIDOS LOS BONOS OB', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121315', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR GOBIERNOS EXTRANJEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121316', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR BANCOS CENTRALES EXTRANJEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121317', 'TITULOS EMITIDOS, AVALADOS, GARANTIZADOS O ACEPTADOS POR BANCOS DEL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121318', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR ORGANISMOS MULTILATERALES DE CRÉDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121342', 'TITULOS EMITIDOS POR RESIDENTES EN EL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121395', 'OTROS TITULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1216', 'INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121601', 'ACCIONES CON ALTA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121602', 'ACCIONES CON MEDIA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121604', 'ACCIONES CON BAJA Y MÍNIMA LIQUIDEZ BURSATIL O SIN COTIZACION EN BOLSA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121608', 'TITULOS PARTICIPATIVOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121609', 'TITULOS MIXTOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('121695', 'OTROS TITULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1231', 'DERECHOS DE RECOMPRA DE INVERSIONES NEGOCIABLES EN TITULOS DE DEUDA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123101', 'TITULOS DE DEUDA PUBLICA INTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123102', 'TITULOS DE DEUDA PUBLICA EXTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123103', 'OTROS TITULOS DE DEUDA PUBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123104', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGAFIN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123105', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGACOOP', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123106', 'TITULOS EMITIDOS POR EL BANCO DE LA REPUBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123107', 'BONOS HIPOTECARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123108', 'TITULOS HIPOTECARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123109', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE CARTERA HIPOTECARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123110', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE SUBYACENTES DISTINTOS DE ', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123111', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA SUPERINTENDE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123114', 'TITULOS EMITIDOS POR ENTIDADES NO VIGILADAS POR LA SUPERINTENDENCIA BANCARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123115', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR GOBIERNOS EXTRANJEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123116', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR BANCOS CENTRALES EXTRANJEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123117', 'TITULOS EMITIDOS, AVALADOS, GARANTIZADOS O ACEPTADOS POR BANCOS DEL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123118', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR ORGANISMOS MULTILATERALES DE CRÉDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123142', 'TITULOS EMITIDOS POR RESIDENTES EN EL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123195', 'OTROS TITULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1232', 'DERECHOS DE RECOMPRA DE INVERSIONES NEGOCIABLES EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123201', 'ACCIONES CON ALTA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123202', 'ACCIONES CON MEDIA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123208', 'TITULOS PARTICIPATIVOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123209', 'TITULOS MIXTOS DERIVADOS DE PROCESOS DE TITULARIZACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1235', 'DERECHOS DE RECOMPRA DE INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS DE DEUDA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123501', 'TITULOS DE DEUDA PÚBLICA INTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123502', 'TITULOS DE DEUDA PÚBLICA EXTERNA EMITIDOS O GARANTIZADOS POR LA NACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123503', 'OTROS TITULOS DE DEUDA PÚBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123504', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGAFIN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123505', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR EL FOGACOOP', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123506', 'TITULOS EMITIDOS POR EL BANCO DE LA REPUBLICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123507', 'BONOS HIPOTECARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123508', 'TITULOS HIPOTECARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123509', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE CARTERA HIPOTECARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123510', 'TITULOS DE CONTENIDO CREDITICIO DERIVADOS DE PROCESOS DE TITULARIZACION DE SUBYACENTES DISTINTOS DE ', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123511', 'TITULOS EMITIDOS, AVALADOS, ACEPTADOS O GARANTIZADOS POR INSTITUCIONES VIGILADAS POR LA SUPERINTENDE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123514', 'TITULOS EMITIDOS POR ENTIDADES NO VIGILADAS POR LA SUPERINTENDENCIA BANCARIA (INCLUIDOS LOS BONOS OB', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123515', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR GOBIERNOS EXTRANJEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123516', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR BANCOS CENTRALES EXTRANJEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123517', 'TITULOS EMITIDOS, AVALADOS, GARANTIZADOS O ACEPTADOS POR BANCOS DEL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123518', 'TITULOS EMITIDOS, AVALADOS O GARANTIZADOS POR ORGANISMOS MULTILATERALES DE CRÉDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123542', 'TITULOS EMITIDOS POR RESIDENTES EN EL EXTERIOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123595', 'OTROS TITULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1236', 'DERECHOS DE RECOMPRA DE INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123601', 'ACCIONES CON ALTA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123602', 'ACCIONES CON MEDIA LIQUIDEZ BURSATIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123604', 'ACCIONES CON BAJA Y MÍNIMA LIQUIDEZ BURSATIL O SIN COTIZACION EN BOLSA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('123695', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1286', 'PROVISION DE INVERSIONES NEGOCIABLES EN TITULOS DE DEUDA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128605', 'LARGO PLAZO BB+, BB, BB-', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128610', 'LARGO PLAZO B+, B, B-', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128615', 'LARGO PLAZO CCC', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128620', 'LARGO PLAZO DD, EE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128625', 'CORTO PLAZO 3', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128630', 'CORTO PLAZO 4', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128635', 'CORTO PLAZO 5, 6', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128640', 'CATEGORIA B   RIESGO ACEPTABLE, SUPERIOR AL NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128645', 'CATEGORIA C   RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128650', 'CATEGORIA D   RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128655', 'CATEGORIA E   INCOBRABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128695', 'OTRAS PROVISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1287', 'PROVISION DE INVERSIONES NEGOCIABLES EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128740', 'CATEGORIA B   RIESGO ACEPTABLE, SUPERIOR AL NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128745', 'CATEGORIA C   RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128750', 'CATEGORIA D   RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128755', 'CATEGORIA E INCOBRABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128795', 'OTRAS PROVISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1288', 'PROVISION DE INVERSIONES PARA MANTENER HASTA EL VENCIMIENTO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128805', 'LARGO PLAZO BB+, BB, BB-', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128810', 'LARGO PLAZO B+, B, B-', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128815', 'LARGO PLAZO CCC', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128820', 'LARGO PLAZO DD, EE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128825', 'CORTO PLAZO 3', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128830', 'CORTO PLAZO 4', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128835', 'CORTO PLAZO 5, 6', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128840', 'CATEGORIA B   RIESGO ACEPTABLE, SUPERIOR AL NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128845', 'CATEGORIA C   RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128850', 'CATEGORIA D   RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128855', 'CATEGORIA E   INCOBRABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128895', 'OTRAS PROVISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1289', 'PROVISION DE INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS DE DEUDA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128905', 'LARGO PLAZO BB+, BB, BB-', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128910', 'LARGO PLAZO B+, B, B-', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128915', 'LARGO PLAZO CCC', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128920', 'LARGO PLAZO DD, EE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128925', 'CORTO PLAZO 3', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128930', 'CORTO PLAZO 4', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128935', 'CORTO PLAZO 5, 6', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128940', 'CATEGORIA B   RIESGO ACEPTABLE, SUPERIOR AL NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128945', 'CATEGORIA C   RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128950', 'CATEGORIA D   RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128955', 'CATEGORIA E   INCOBRABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('128995', 'OTRAS PROVISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1291', 'PROVISION DE INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS PARTICIPATIVOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('129105', 'LARGO PLAZO BB+, BB, BB-', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('129110', 'LARGO PLAZO B+, B, B-', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('129115', 'LARGO PLAZO CCC', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('129120', 'LARGO PLAZO DD, EE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('129140', 'CATEGORIA B   RIESGO ACEPTABLE, SUPERIOR AL NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('129145', 'CATEGORIA C   RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('129150', 'CATEGORIA D   RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('129155', 'CATEGORIA E   INCOBRABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('129195', 'OTRAS PROVISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('13', 'INVENTARIOS', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1305', 'BIENES NO TRANSFORMADOS POR LA ENTIDAD', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1310', 'MATERIAS  PRIMAS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1315', 'PRODUCTOS EN PROCESO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1320', 'PRODUCTOS TERMINADOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1325', 'MATERIALES Y SUMINISTROS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1330', 'SEMOVIENTES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1335', 'INVENTARIO EN TRANSITO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1340', 'CONTRATOS EN  EJECUCION', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1345', 'CULTIVOS EN DESARROLLO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1350', 'PLANTACIONES AGRICOLAS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1355', 'BIENES RAICES PARA  LA VENTA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1360', 'ENVASES Y EMPAQUES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1365', 'OBRAS DE CONSTRUCCIÓN EN CURSO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1380', 'INVENTARIOS EN CONSIGNACION', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1385', 'MAUSOLEOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1390', 'PROVISION', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('139005', 'POR OBSOLESCENCIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('139010', 'POR DIFERENCIA DE INVENTARIO FISICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('139015', 'POR PÉRDIDA DE BIENES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('139085', 'POR OTROS CONCEPTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('14', 'CARTERA DE CREDITOS', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1404', 'CREDITOS DE VIVIENDA   CON LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('140405', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('140410', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('140415', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('140420', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('140425', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1405', 'CREDITOS DE VIVIENDA   SIN LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('140505', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('140510', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('140515', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('140520', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('140525', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1411', 'CREDITOS DE CONSUMO, GARANTIA ADMISIBLE    CON LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('141105', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('14110501', 'CREDITO LIBRANZA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('141110', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('141115', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('141120', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('141125', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1412', 'CREDITOS DE CONSUMO, GARANTIA ADMISIBLE, - SIN LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('141205', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('141210', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('141215', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('141220', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('141225', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1441', 'CREDITOS DE CONSUMO, OTRAS GARANTIAS    CON  LIBRANZA', 'D', '3', '0', 'A');
INSERT INTO `cn_puc` VALUES ('144105', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('14410501', 'CATEGORIA A RIESGO NORMAL', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('144110', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('14411001', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('144115', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('14411501', 'CATEGORIA C RIESGO APRECIABLE', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('144120', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('14412001', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('144125', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('14412501', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1442', 'CREDITOS DE CONSUMO, OTRAS GARTANTÍAS   SIN LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('144205', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('144210', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('144215', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('144220', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('144225', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1454', 'MICROCREDITOS INMOBILIARIO - CON LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145405', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145410', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145415', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145420', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145425', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1455', 'MICROCREDITOS INMOBILIARIO - SIN LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145505', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145510', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145515', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145520', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145525', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1456', 'MICROCREDITOS, EMPRESARIAL - GARANTIA ADMISIBLE - CON LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145605', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145610', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145615', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145620', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145625', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1457', 'MICROCREDITOS EMPRESARIAL -  GARANTIA ADMISIBLE   SIN LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145705', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145710', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145715', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145720', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145725', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1458', 'MICROCREDITOS EMPRESARIAL- OTRAS GARANTIAS   CON LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145805', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145810', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145815', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145820', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145825', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1459', 'MICROCREDITOS EMPRESARIAL- OTRAS GARANTIAS   SIN LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145905', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145910', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145915', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145920', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('145925', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1460', 'CREDITOS COMERCIALES, GARANTIA ADMISIBLE -  CON LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146005', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146010', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146015', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146020', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146025', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1462', 'CREDITOS COMERCIALES,  GARANTIA ADMISIBLE -  SIN LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146205', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146210', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146215', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146220', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146225', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1463', 'CREDITOS COMERCIALES, OTRAS GARANTIAS - CON LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146315', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146320', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146325', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146330', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146335', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1465', 'CREDITOS COMERCIALES, OTRAS GARANTIAS   SIN LIBRANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146515', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146520', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146525', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146530', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('146535', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1488', 'DERECHOS DE RECOMPRA CARTERA NEGOCIADA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('148820', 'CREDITOS DE VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('148825', 'CREDITOS DE CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('148830', 'MICROCREDITOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('148835', 'CREDITOS COMERCIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1489', 'PROVISION CREDITOS DE VIVIENDA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('148905', 'CATEGORIA A - CREDITO NORMAL, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('148910', 'CATEGORIA B - CREDITO ACEPTABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('148915', 'CATEGORIA C ? CREDITO APRECIABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('148920', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('148925', 'CATEGORIA E ? CREDITO IRRECUPERABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1491', 'PROVISION CREDITOS DE CONSUMO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149105', 'CATEGORIA A - CREDITO NORMAL, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149107', 'CATEGORIA A - CREDITO NORMAL, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149110', 'CATEGORIA B - CREDITO ACEPTABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149112', 'CATEGORIA B - CREDITO ACEPTABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('14911201', 'CATEGORIA B', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('149115', 'CATEGORIA C ? CREDITO APRECIABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('14911501', 'CATEGORIA C CREDITO APRECIABLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('149117', 'CATEGORIA C ? CREDITO APRECIABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('14911701', 'CATEGORIA C', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('149120', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149122', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('14912201', 'CATEGORIA D CREDITO SIGNIFICATIVO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('149125', 'CATEGORIA E ? CREDITO IRRECUPERABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149127', 'CATEGORIA E ? CREDITO IRRECUPERABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('14912701', 'CATEGORIA E CREDITO IRRECUPERABLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('1492', 'PROVISION MICROCREDITO INMOBILIARIO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149205', 'CATEGORIA A - CREDITO NORMAL, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149207', 'CATEGORIA A - CREDITO NORMAL, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149210', 'CATEGORIA B - CREDITO ACEPTABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149212', 'CATEGORIA B - CREDITO ACEPTABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149215', 'CATEGORIA C ? CREDITO APRECIABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149217', 'CATEGORIA C ? CREDITO APRECIABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149220', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149222', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149225', 'CATEGORIA E ? CREDITO IRRECUPERABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149227', 'CATEGORIA E ? CREDITO IRRECUPERABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1493', 'PROVISION MICROCREDITO EMPRESARIAL', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149305', 'CATEGORIA A - CREDITO NORMAL, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149307', 'CATEGORIA A - CREDITO NORMAL, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149310', 'CATEGORIA B - CREDITO ACEPTABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149312', 'CATEGORIA B - CREDITO ACEPTABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149315', 'CATEGORIA C ? CREDITO APRECIABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149317', 'CATEGORIA C ? CREDITO APRECIABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149320', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149322', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149325', 'CATEGORIA E ? CREDITO IRRECUPERABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149327', 'CATEGORIA E ? CREDITO IRRECUPERABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1495', 'PROVISION CREDITOS COMERCIALES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149505', 'CATEGORIA A - CREDITO NORMAL, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149507', 'CATEGORIA A - CREDITO NORMAL, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149510', 'CATEGORIA B - CREDITO ACEPTABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149512', 'CATEGORIA B - CREDITO ACEPTABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149515', 'CATEGORIA C ? CREDITO APRECIABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149517', 'CATEGORIA C ? CREDITO APRECIABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149520', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149522', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149525', 'CATEGORIA E ? CREDITO IRRECUPERABLE, GARANTIA ADMISIBLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149527', 'CATEGORIA E ? CREDITO IRRECUPERABLE, OTRAS GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1498', 'PROVISION GENERAL', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('149805', 'PROVISION CREDITOS CON LIBRANZA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('14980501', 'PROVISION CREDITOS CON LIBRANZA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('149810', 'PROVISION CREDITOS SIN LIBRANZA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16', 'CUENTAS POR COBRAR', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1605', 'CONVENIOS POR COBRAR', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('160505', 'SERVICIOS MEDICOS Y HOSPITALARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('160510', 'SERVICIOS ODONTOLÓGICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('160515', 'MEDICINA PREPAGADA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('160520', 'SERVICIOS FUNERARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('160525', 'SEGURO VOLUNTARIO   VEHÍCULO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('160530', 'SEGURO OBLIGATORIO   SOAT', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('160535', 'OTROS SERVICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('160595', 'OTROS CONVENIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16059501', 'OTROS CONVENIOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16059502', 'CONVENIOS AUTORIZACIONES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16059503', 'CUENTAS POR COBRAR CONVENIOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16059504', 'DESARROLLAR CTA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16059505', 'COOPERATIVA BUEN FUTURO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16059506', 'CUOTAS A DEVOLVER A PAGADURIAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('1620', 'PROMETIENTES VENDEDORES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('162005', 'BIENES INMUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('162010', 'BIENES MUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1625', 'ANTICIPOS DE CONTRATOS Y PROVEEDORES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('162505', 'ANTICIPOS DE CONTRATOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16250501', 'ANTICIPOS DE CONTRATOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('162510', 'PROVEEDORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16251001', 'PROVEEDORES                                                                      ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('162595', 'OTROS ANTICIPOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16259501', 'ANTICIPOS GESTORES DE VENTAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16259502', 'OTROS ANTICIPOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16259503', 'OTROS ANTICIPOS-GESTORES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('1635', 'ADELANTOS AL PERSONAL', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163505', 'ANTICIPOS LABORALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16350501', 'ANTICIPOS LABORALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('163510', 'GASTOS DE VIAJE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1636', 'PAGOS POR CUENTA DE  ASOCIADOS, VIVIENDA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163605', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163610', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163615', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163620', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163625', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1637', 'PAGOS POR CUENTA DE ASOCIADOS, CONSUMO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163705', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16370501', 'CATEGORIA A RIESGO NORMAL - POLIZAS JUDICIALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('163710', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16371001', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('163715', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163720', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163725', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1638', 'PAGOS POR CUENTA DE ASOCIADOS, MICROCREDITO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163805', 'CATEGORIA A RIESGO NORMAL - INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163810', 'CATEGORIA B RIESGO ACEPTABLE   INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163815', 'CATEGORIA C RIESGO APRECIABLE - INMOILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163820', 'CATEGORIA D RIESGO SIGNIFICATIVO - INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163825', 'CATEGORIA E RIESGO DE INCOBRABILIDAD - INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163830', 'CATEGORIA A RIESGO NORMAL - EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163835', 'CATEGORIA B RIESGO ACEPTABLE - EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163840', 'CATEGORIA C RIESGO APRECIABLE - EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163845', 'CATEGORIA D RIESGO SIGNIFICATIVO - EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163850', 'CATEGORIA E RIESGO DE INCOBRABILIDAD - EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1639', 'PAGOS POR CUENTA DE ASOCIADOS COMERCIAL', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163905', 'CATEGORIA A RIESGO NORMAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163910', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163915', 'CATEGORIA C RIESGO APRECIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163920', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('163925', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1640', 'CREDITOS A EMPLEADOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164020', 'CATEGORIA A RIESGO NORMAL, VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164022', 'CATEGORIA B RIESGO ACEPTABLE, VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164024', 'CATEGORIA C RIESGO APRECIABLE, VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164026', 'CATEGORIA D RIESGO SIGNIFICATIVO, VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164028', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164030', 'CATEGORIA A RIESGO NORMAL, CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16403001', 'CALAMIDAD DOMESTICA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('164032', 'CATEGORIA B RIESGO ACEPTABLE, CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164034', 'CATEGORIA C RIESGO APRECIABLE, CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164036', 'CATEGORIA D RIESGO SIGNIFICATIVO, CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164038', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1645', 'DEUDORES POR VENTA DE BIENES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164502', 'VIGENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164505', 'VENCIDA ENTRE 91 Y 180 DIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164510', 'VENCIDA ENTRE 181 Y 360 DIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164515', 'VENCIDA MAS DE 360 DIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1648', 'DEUDORES POR PRESTACION DE SERVICIOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164802', 'VIGENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164805', 'VENCIDA ENTRE 91 Y 180 DIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164810', 'VENCIDA ENTRE 181 Y 360 DIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('164815', 'VENCIDA MAS DE 360 DÍAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1650', 'DEUDORES PATRONALES Y EMPRESAS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165005', 'DESCUENTO DE NOMINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16500501', 'COOPERATIVA BUEN FUTURO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('165010', 'LIQUIDACIONES PRESTACIONALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165015', 'LIBRANZAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16501501', 'PAGADURIAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('165020', 'APORTES Y CONTRIBUCIÓN EMPRESA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1655', 'INTERESES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165505', 'PACTOS DE REVENTA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165506', 'CATEGORIA A RIESGO NORMAL, VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165508', 'CATEGORIA B RIESGO ACEPTABLE, VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165512', 'CATEGORIA C RIESGO APRECIABLE, VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165514', 'CATEGORIA D RIESGO SIGNIFICATIVO, VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165516', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165518', 'CATEGORIA A RIESGO NORMAL, CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16551801', 'INTERESES CATEGORIA A RIESGO NORMAL, CONSUMO', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16551802', 'INTERESES CATEGORIA A RIESGO NORMAL, CONSUMO', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165522', 'CATEGORIA B RIESGO ACEPTABLE, CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16552201', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16552202', 'CATEGORIA B RIESGO ACEPTABLE', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165524', 'CATEGORIA C RIESGO APRECIABLE, CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16552401', 'CATEGORIA C RIESGO APRECIABLE', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165526', 'CATEGORIA D RIESGO SIGNIFICATIVO, CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16552601', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165528', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16552801', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165532', 'CATEGORIA A RIESGO NORMAL, MICROCREDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165534', 'CATEGORIA B RIESGO ACEPTABLE, MICROCREDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165536', 'CATEGORIA C RIESGO APRECIABLE, MICROCREDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165538', 'CATEGORIA D RIESGO SIGNIFICATIVO, MICROCREDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165540', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, MICROCREDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165542', 'CATEGORIA A RIESGO NORMAL, COMERCIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165544', 'CATEGORIA B RIESGO ACEPTABLE, COMERCIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165546', 'CATEGORIA C RIESGO APRECIABLE, COMERCIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165548', 'CATEGORIA D RIESGO SIGNIFICATIVO, COMERCIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165549', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, COMERCIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165560', 'CATEGORIA A RIESGO NORMAL, MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165561', 'CATEGORIA B RIESGO ACEPTABLE, MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165563', 'CATEGORIA C RIESGO APRECIABLE, MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165564', 'CATEGORIA D RIESGO SIGNIFICATIVO, MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165565', 'CATEGORIA E RIESGO DE INCOBRABILIDFAD, MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1657', 'INTERESES DEUDORES POR VENTA DE BIENES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165701', 'INTERESES VIGENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165702', 'VENCIDOS ENTRE 91 Y 180 DIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165704', 'VENCIDOS ENTRE 181 Y 360 DIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165709', 'VENCIDOS MAS DE  360 DIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1658', 'INTERESES DEUDORES POR PRESTACIÓN DE SERVICIOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165801', 'INTERESES VIGENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165802', 'VENCIDOS ENTRE 91 Y 180 DIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165804', 'VENCIDOS ENTRE 181 Y 360 DIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('165809', 'VENCIDOS MAS DE 360 DÍAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1660', 'INGRESOS  POR COBRAR', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166015', 'ARRENDAMIENTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166020', 'HONORARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166025', 'COMISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166030', 'SERVICIOS VARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166035', 'CUOTAS DE ADMINISTRACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166040', 'CUOTAS DE SOSTENIMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166045', 'RODAMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166095', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16609501', 'DACION EN PAGO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('1665', 'DIVIDENDOS, PARTICIPACIONES Y EXCEDENTES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166505', 'DE SOCIEDADES ANÓNIMAS Y/O ASIMILADAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166510', 'DE SOCIEDADES LIMITADAS Y/O ASIMILADAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('166515', 'DE ENTIDADES COOPERATIVAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1675', 'ANTICIPO DE IMPUESTOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('167505', 'RENTA Y COMPLEMENTARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('167510', 'INDUSTRIA Y COMERCIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16751001', 'INDUSTRIA Y COMERCIO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16751003', 'INDUSTRIA Y COMERCIO CARTAGENA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16751004', 'INDUSTRIA Y COMERCIO SINCELEJO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16751005', 'INDUSTRIA Y COMERCIO MONTERIA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('167515', 'RETENC ION EN LA FUENTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16751501', 'RETENCION RENDIMIENTOS FINANCIEROS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('167520', 'IMPUESTO A LAS VENTAS RETENIDO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('167530', 'IMPUESTO  DE INDUSTRIA Y COMERCIO RETENIDO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('167535', 'SOBRANTES EN LIQUIDACIÓN PRIVADA DE IMPUESTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('167540', 'CONTRIBUCIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('167545', 'IMPUESTOS DESCONTABLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('167595', 'OTROS IMPUESTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1690', 'OTRAS CUENTAS POR COBRAR', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169005', 'CUOTAS - PARTES PENSIONES DE JUBILACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169010', 'RECLAMOS A COMPAÑIAS ASEGURADORAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16901001', 'SEGUROS DEL ESTADO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169020', 'COSTOS JUDICIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16902001', 'POLIZAS JUDICIALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16902002', 'ARANCELES JUDICIALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16902003', 'CURADOR - HONORARIOS PROCESOS JURIDICOS A ASOCIADOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16902005', 'EMBARGOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169025', 'CUENTAS POR COBRAR  DE TERCEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16902501', 'CUENTAS POR COBRAR                                                                                  ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16902502', 'CUENTAS POR COBRAR ASOCIADOS - SEGURO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169030', 'COMISIONISTAS DE BOLSA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169035', 'FONDO DE INVERSIÓN SOCIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169040', 'DEPOSITOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16904001', 'APORTES SOCIALES CONFECOOP', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169045', 'TARJETAS DE CREDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169095', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16909501', 'CUENTAS POR COBRAR A OTRAS ENTIDADES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16909503', 'CUENTAS POR COBRAR EPS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('1691', 'PROVISION  DEUDORES VENTA DE BIENES Y SERVICIOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169106', 'DEUDORES POR VENTA DE BIENES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169108', 'DEUDORES POR PRESTACIÓN DE SERVICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169112', 'INTERESES DEUDORES POR VENTA DE BIENES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169116', 'INTERESES DEUDORES POR PRESTACIÓN DE SERVICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1692', 'PROVISION CUENTAS POR COBRAR, MICROCRÉDITO EMPRESARIAL', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169205', 'CATEGORIA A  CREDITO NORMAL   INTERESES MICROCREDITO EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169210', 'CATEGORIA B - CREDITO ACEPTABLE   INTERESES MICROCREDITO EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169215', 'CATEGORIA C ? CREDITO APRECIABLE   INTERESES MICROCREDITO EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169220', 'CATEGORIA D ? CREDITO SIGNIFICATIVO   INTERESES MICROCREDITO EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169225', 'CATEGORIA E ? CREDITO IRRECUPERABLE   INTERESES MICROCREDITO EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169230', 'CATEGORIA A   CREDITO NORMAL, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169235', 'CATEGORIA B - CREDITO ACEPTABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169240', 'CATEGORIA C ? CREDITO APRECIABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169245', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169250', 'CATEGORIA E   CREDITO IRRECUPERABLE, POR CCUANTA DE ASOCADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1693', 'PROVISION CUENTAS POR COBRAR   MICROCREDITO INMOBILIARIO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169305', 'CATEGORIA A  CREDITO NORMAL   INTERESES MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169310', 'CATEGORIA B - CREDITO ACEPTABLE   INTERESES MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169315', 'CATEGORIA C ? CREDITO APRECIABLE   INTERESES MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169320', 'CATEGORIA D ? CREDITO SIGNIFICATIVO   INTERESES MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169325', 'CATEGORIA E ? CREDITO IRRECUPERABLE   INTERESES MICROCREDITO INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169330', 'CATEGORIA A   CREDITO NORMAL, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169335', 'CATEGORIA B - CREDITO ACEPTABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169340', 'CATEGORIA C ? CREDITO APRECIABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169345', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169350', 'CATEGOIRA E   CREDITOS IRRECUPERABLES, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1694', 'PROVISION CUENTAS POR COBRAR COMERCIALES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169452', 'CATEGORIA A   CREDITO NORMAL, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169453', 'CATEGORIA B - CREDITO ACEPTABLE, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169454', 'CATEGORIA C ? CREDITO APRECIABLE, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169456', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169457', 'CATEGORIA E ? CREDITO IRRECUPERABLE, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169462', 'CATEGORIA A   CREDITO NORMAL, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169463', 'CATEGORIA B - CREDITO ACEPTABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169464', 'CATEGORIA C ? CREDITO APRECIABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169466', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169468', 'CATEGORIA E   CREDITO IRRECUPERABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169495', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1696', 'PROVISION CUENTAS POR COBRAR DE CONSUMO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169652', 'CATEGORIA A   CREDITO NORMAL, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169653', 'CATEGORIA B   CREDITO ACEPTABLE, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16965301', 'CATEGORIA B', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169654', 'CATEGORIA C ? CREDITO APRECIABLE, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16965401', 'CATEGORIA C', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169656', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16965601', 'CATEGORIA D CREDITO SIGNIFICATIVO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169657', 'CATEGORIA E ? CREDITO IRRECUPERABLE, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16965701', 'CATEGORIA E CREDITO IRRECUPERABLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169662', 'CATEGORIA A   CREDITONORMAL, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169663', 'CATEGORIA B   CREDITO ACEPTABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169664', 'CATEGORIA C ? CREDITO APRECIABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169666', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169667', 'CATEGORIA E ? CREDITO IRRECUPERABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169695', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1697', 'PROVISION CUENTAS POR COBRAR DE VIVIENDA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169752', 'CATEGORIA A   CREDITO NORMAL, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169753', 'CATEGORIA B - CREDITO ACEPTABLE, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169754', 'CATEGORIA C ? CREDITO APRECIABLE, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169756', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169757', 'CATEGORIA E ? CREDITO IRRECUPERABLE, INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169762', 'CATEGORIA A   CREDITO NORMAL, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169763', 'CATEGORIA B - CREDITO ACEPTABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169764', 'CATEGORIA C ? CREDITO APRECIABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169765', 'CATEGORIA D ? CREDITO SIGNIFICATIVO, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169766', 'CATEGORIA E ? CREDITO IRRECUPERABLE, POR CUENTA DE ASOCIADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1698', 'OTRAS PROVISIONES CUENTAS POR COBRAR', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169805', 'CONVENIOS POR COBRAR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16980501', 'CONVENIOS POR COBRAR', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169810', 'DIVIDENDOS, PARTICIPACIONES Y EXCEDENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169815', 'ANTICIPOS DE CONTRATOS Y PROVEEDORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169820', 'ADELANTOS AL PERSONAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169830', 'DEUDORES PATRONALES Y EMPRESA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16983001', 'DEUDORES PATRONALES Y EMPRESAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('169840', 'PROMETIENTES VENDEDORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169845', 'CREDITOS A EMPLEADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169855', 'INGRESOS POR COBRAR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('169895', 'DIVERSAS OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('16989501', 'DIVERSAS COSTOS JUDICIALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16989502', 'CUENTAS POR COBRAR EPS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('16989503', 'ARANCELES JUDICIALES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17', 'PROPIEDADES PLANTA Y EQUIPO', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1705', 'TERRENOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('170505', 'URBANOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('170510', 'RURALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1710', 'CONSTRUCCIONES O MONTAJES  EN CURSO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('171005', 'CONSTRUCCIONES EN PROCESO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('171010', 'MAQUINARIA EN MONTAJE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1715', 'EDIFICACIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('171505', 'EDIFICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('171510', 'OFICINAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('171515', 'BODEGAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('171520', 'ALMACENES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('171525', 'INSTALACIONES AGROPECUARIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('171530', 'INSTALACIONES INDUSTRIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('171535', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1720', 'MUEBLES Y EQUIPO DE OFICINA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('172010', 'MUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('17201001', 'MUEBLES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('172015', 'EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('17201501', 'ENFRIADOR DE AGUA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17201502', 'EXTRACTORES DE AIRE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17201503', 'EQUIPOS DE SEGRIDAD', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17201504', 'AIRES ACONDICIONADOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('172020', 'OTROS EQUIPOS', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17202001', 'ENFRIADOR DE AGUA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17202002', 'EXTRACTORES DE AIRE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17202003', 'EQUIPOS DE SEGURIDAD', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17202004', 'AIRES ACONDICIONADOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('1722', 'EQUIPO MEDICO - CIENTIFICO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('172205', 'MEDICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('172210', 'ODONTOLOGICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('172215', 'LABORATORIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('172220', 'INSTRUMENTAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('172295', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1725', 'EQUIPO DE CÓMPUTO Y COMUNICACION', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('172505', 'EQUIPOS DE CÓMPUTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('17250501', 'EQUIPO DE COMPUTO                                                                ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('172510', 'EQUIPOS DE COMUNICACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('17251001', 'EQUIPOS DE COMUNICACION', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('172595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1728', 'EQUIPO DE HOTELES Y RESTAURANTES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('172805', 'DE HABITACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('172810', 'DE COMESTIBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('172895', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1730', 'VEHICULOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('173005', 'AUTOS Y CAMPEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('173010', 'BUSES, BUSETAS, MICROBUSES Y COLECTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('173015', 'CAMIONES, TRACTOMULAS Y REMOLQUES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('173020', 'MOTOCICLETAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('17302001', 'MOTOCICLETAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('173025', 'MONTACARGAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('173030', 'PALAS Y GRUAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('173035', 'BANDAS TRANSPORTADORAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('173040', 'FULGONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('173095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1732', 'ENVASES Y EMPAQUES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1735', 'ARMAMENTO DE VIGILANCIA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1740', 'PLANTACIONES AGRÍCOLAS Y FORESTALES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('174005', 'CULTIVOS EN DESARROLLO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('174010', 'CULTIVOS AMORTIZABLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1745', 'MAQUINARIA Y EQUIPO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('174505', 'MAQUINARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('174510', 'EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1750', 'PROPIEDADES EN TRANSITO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('175005', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('175010', 'MUEBLES Y ENSERES DE OFICINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('175015', 'EQUIPO DE COMPUTACIÓN Y COMUNICACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('175020', 'EQUIPOS DE LABORATORIOS Y ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('175025', 'VEHICULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('175030', 'ARMAMENTO DE VIGILANCIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('175035', 'OTRAS PROPIEDADES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1755', 'SEMOVIENTES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('175505', 'PRODUCTORES Y REPRODUCTORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('175510', 'SEMOVIENTES EN SERVICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('175595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1760', 'MAUSOLEOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('176005', 'MAUSOLEOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1765', 'ELEMENTOS DIDACTICOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('176505', 'ELEMENTOS DIDACTICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('176595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1770', 'BIENES DE FONDOS SOCIALES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('177005', 'BIENES MUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('177010', 'BIENES INMUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1775', 'RECURSOS NATURALES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('177505', 'YACIMIENTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('177510', 'POZOS ARTESIANOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('177515', 'MINAS Y CANTERAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1780', 'AMORTIZACION Y AGOTAMIENTO ACUMULADA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('178005', 'CULTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('178010', 'SEMOVIENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('178015', 'RECURSOS NATURALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1795', 'DEPRECIACION  ACUMULADA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179505', 'EDIFICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179510', 'MUEBLES Y EQUIPO DE OFICINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('17951001', 'MUEBLES Y EQUIPOS DE OFICINA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17951002', 'ENFRIADOR DE AGUA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17951003', 'EXTRACTORES DE AIRE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17951004', 'EQUIPOS DE SEGURIDAD', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17951005', 'AIRES ACONDICIONADOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('179515', 'EQUIPOS DE HOTELES Y RESTAURANTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179520', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('17952001', 'EQUIPOS DE COMPUTO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('17952002', 'EQUIPOS DE COMUNICACIONES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('179525', 'EQUIPOS MEDICOS - CIENTIFICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179530', 'VEHICULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('17953001', 'MOTOCICLETAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('179535', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179540', 'ARMAMENTO DE VIGILANCIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179545', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179550', 'MAUSOLEOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179555', 'ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179560', 'BIENES DE FONDOS SOCIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179595', 'OTRAS DEPRECIACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1799', 'PROVISION', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179905', 'TERRENOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179910', 'EDIFICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179915', 'VEHICULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179920', 'MAUSOLEOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179925', 'EQUIPOS DE HOTELES Y RESTAURANTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179930', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179935', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179940', 'EQUIPOS MEDICOS - CIENTIFICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179945', 'CULTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179950', 'EQUIPOS DE CÓMPUTO Y COMUNICACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179955', 'ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179960', 'PROVISION MUEBLES Y EQUIPOS DE OFICINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179965', 'RECURSOS NATURALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179970', 'SEMOVIENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('179975', 'PLANTACIONES  AGRÍCOLAS  Y  FORESTALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('18', 'DIFERIDOS', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1810', 'GASTOS ANTICIPADOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('181005', 'INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('181010', 'SEGUROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('181015', 'ARRENDAMIENTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('181020', 'CONTRATO DE MANTENIMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('181025', 'HONORARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('181030', 'COMISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('181035', 'SERVICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('181040', 'SUSCRIPCIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('181095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1820', 'CARGOS DIFERIDOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182005', 'ORGANIZACION Y PREOPERATIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182010', 'REMODELACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182015', 'ESTUDIOS Y PROYECTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182020', 'PROGRAMAS PARA COMPUTADOR (SOFTWARE)', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182025', 'UTILES Y PAPELERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('18202501', 'UTILES Y PAPELERIA                                                                                  ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('182030', 'MEJORAS A PROPIEDADES TOMADAS EN ARRENDAMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182035', 'DESCUENTO EN COLOCACION DE BONOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182040', 'PUBLICIDAD Y PROPAGANDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('18204001', 'PUBLICIDAD Y PROPAGANDA                                                          ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('182045', 'IMPUESTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('18204501', 'IMPUESTO AL PATRIMONIO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('182050', 'CONTRIBUCIONES Y AFILIACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182055', 'ENTRENAMIENTOS AL PERSONAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182060', 'ELEMENTOS DE ASEO Y CAFETERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182065', 'DOTACION Y SUMINISTRO A TRABAJADORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('182095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('18209501', 'ADECUACIONES LOCATIVAS                                                           ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209502', 'VIATICOS                                                                         ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209503', 'PASAJES AEREOS                                                                   ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209504', 'SEGURO DE MANEJO                                                                 ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209505', 'ARRENDAMIENTO                                                                    ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209506', 'MANTENIMIENTO                                                                    ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209507', 'ENERGIA ELECTRICA                                                                ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209508', 'TELEFONICO                                                                       ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209509', 'INTERESES                                                                        ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209510', 'GASTOS LEGALES                                                                   ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209511', 'SERVICIO DE AGUA POTABLE                                                         ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209512', 'HONORARIOS                                                                       ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('18209513', 'GASTOS DE ASAMBLEA                                                               ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('19', 'OTROS ACTIVOS', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1904', 'SUCURSALES Y AGENCIAS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('190405', 'TRASLADO DE FONDOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('190410', 'TRASLADO DE INVENTARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('190415', 'TRASLADO DE CARTERA DE CREDITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('190420', 'TRASLADO DE CARTERA POR VENTA DE BIENES Y SERVICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('190425', 'TRASLADO DE PROPIEDADES PLANTA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('190430', 'TRASLADO DE GASTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('190435', 'TRASLADO OTRAS CUENTAS POR COBRAR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('190440', 'TRASLADO DE OTROS ACTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('190495', 'OTROS TRASLADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1910', 'ACTIVOS INTANGIBLES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('191005', 'MARCAS Y PATENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('191010', 'CONCESIONES Y FRANQUICIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('191015', 'FIDEICOMISO FONDO DE REPOSICION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('191020', 'DERECHOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('191025', 'LICENCIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('191030', 'AMORTIZACION ACUMULADA  (CR)', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1930', 'ACTIVOS DE OPERACION', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('193005', 'LENCERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('193010', 'VAJILLAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('193015', 'CRISTALERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('193020', 'CUBIERTERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('193025', 'PLATERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('193030', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1950', 'BIENES RECIBIDOS EN PAGO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('195005', 'BIENES INMUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('195010', 'BIENES MUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('195015', 'VALORES MOBILIARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('195095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1960', 'DEPOSITOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('196005', 'EN GARANTIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('196010', 'JUDICIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('196095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1965', 'BIENES DE ARTE Y CULTURA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('196505', 'OBRAS DE ARTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('196510', 'BIBLIOTECA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1985', 'RESPONSABILIDADES PENDIENTES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('198505', 'DIRECTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('198510', 'EMPLEADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('198515', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1987', 'OTRAS INVERSIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('198705', 'CLUBES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('198710', 'COOPERATIVAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('198715', 'ENTIDADES SIN ÁNIMO DE LUCRO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('198795', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1990', 'DIVERSOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199015', 'MUEBLES, ENSERES Y EQUIPOS EN ALMACEN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199045', 'DERECHOS SUCESORALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199050', 'BIENES ENTREGADOS EN COMODATO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199099', 'AMORTIZACION ACUMULADA (CR)', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1995', 'VALORIZACIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199505', 'INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS PARTICIPATIVOS DE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199510', 'PROPIEDADES PLANTA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199520', 'SEMOVIENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199525', 'BIENES DE ARTE Y CULTURA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199530', 'PATRIMONIO AUTONOMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199595', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('1999', 'PROVISION OTROS ACTIVOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199905', 'DEPOSITOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199910', 'BIENES DE ARTE Y CULTURA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199915', 'ACTIVOS DE OPERACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199920', 'BIENES RECIBIDOS EN PAGO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199925', 'RESPONSABILIDADES PENDIENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199930', 'INTANGIBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199935', 'OTRAS INVERSIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('199995', 'ACTIVOS DIVERSOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2', 'PASIVO', 'C', '1', '0', 'A');
INSERT INTO `cn_puc` VALUES ('21', 'DEPOSITOS', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2105', 'DEPOSITOS DE AHORRO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('210505', 'ORDINARIOS ACTIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('210510', 'ORDINARIOS INACTIVA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2110', 'CERTIFICADOS DEPOSITOS DE AHORRO A TÉRMINO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('211005', 'EMITIDOS  MENOS DE 6 MSES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('211010', 'EMITIDOS IGUAL A 6 MESES Y MENOR E IGUAL DE 12 MESES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('211015', 'EMITIDOS MAYOR A 12 MESES Y MENOR DE 18 MESES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('211020', 'EMITIDOS IGUAL O SUPERIOR DE 18 MESES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2125', 'DEPOSITOS  DE AHORRO CONTRACTUAL', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('212505', 'DEPOSITOS A CORTO PLAZO -  ACTIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('212510', 'DEPOSITOS A CORTO PLAZO   INACTIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('212515', 'DEPOSITOS A LARGO PLAZO - ACTIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('212520', 'DEPOSITOS A LARGO PLAZO - INACTIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2130', 'DEPOSITOS DE AHORRO PERMANENTE', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('213005', 'DEPOSITOS A CORTO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('213010', 'DEPOSITOS A LARGO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('22', 'PACTOS DE RECOMPRA', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2205', 'COMPROMISOS DE RECOMPRA DE INVERSIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('220505', 'BANCOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('220510', 'CORPORACIONES FINANCIERAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('220515', 'COMPAÑIAS DE FINANCIAMIENTO COMERCIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('220520', 'SOCIEDADES FIDUCIARIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('220525', 'ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('220530', 'OTRAS ENTIDADES FINANCIERAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('220595', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2210', 'COMPROMISOS DE RECOMPRA CARTERA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('221005', 'BANCOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('221010', 'CORPORACIONES FINANCIERAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('221020', 'COMPAÑIAS DE FINANCIAMIENTO COMERCIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('221025', 'FONDO DE GARANTÍAS DE ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('221030', 'ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('221035', 'OTRAS ENTIDADES FINANCIERAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('221095', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('23', 'CREDITOS DE BANCOS Y OTRAS OBLIGACIONES FINANCIERAS', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2305', 'CREDITOS ORDINARIOS CORTO PLAZO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('230505', 'BANCOS COMERCIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('230510', 'BANCOS COOPERATIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('230515', 'ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('23051501', 'FINANCIERA JURISCOOP', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('23051502', 'DESARROLLAR CTA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('230520', 'ENTIDADES DEL EXTERIOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('230525', 'SOBREGIROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('23052501', 'SOBEGIROS BANCARIOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('230595', 'OTRAS ENTIDADES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('23059501', 'OTRAS ENTIDADES                                                                  ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2308', 'CREDITOS ORDINARIOS  LARGO PLAZO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('230805', 'BANCOS COMERCIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('230810', 'BANCOS COOPERATIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('230815', 'ENTIDADES DEL SECTOR SOLIDARIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('230820', 'ENTIDADDES DEL EXTERIOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('230895', 'OTRAS ENTIDADES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2310', 'FONDO DE GARANTIAS DE ENTIDADES COOPERATIVAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('231005', 'PARA SU LIQUIDEZ PATRIMONIAL A CORTO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('231010', 'PARA SU SOLIDEZ PATRIMONIAL A LARGO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('231095', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2315', 'FINAGRO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('231505', 'CREDITOS  A CORTO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('231510', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2317', 'FINDETER', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('231705', 'CREDITOS A CORTO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('231710', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2320', 'BANCO DE LA REPUBLICA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('232005', 'CREDITOS A CORTO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('232010', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2325', 'BANCO DE COMERCIO EXTERIOR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('232505', 'CREDITOS  A CORTO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('232510', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2340', 'INSTITUTO DE FOMENTO INDUSTRIAL - IFI', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('234005', 'CREDITOS A CORTO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('234010', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2345', 'ORGANISMOS INTERNACIONALES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('234505', 'CREDITOS A CORTO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('234510', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2350', 'OTROS ORGANISMOS - PAIS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('235005', 'CREDITOS A CORTO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('235010', 'CREDITOS A LARGO PLAZO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24', 'CUENTAS POR PAGAR', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2405', 'INTERESES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('240505', 'DEPOSITOS DE AHORRO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('240510', 'CERTIFICADOS DEPOSITOS DE AHORRO A TÉRMINO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('240520', 'DEPOSITOS DE AHORRO CONTRACTUAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('240525', 'DEPOSITOS DE AHORRO PERMANENTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('240530', 'COMPROMISOS DE RECOMPRA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('240535', 'CREDITOS DE BANCOS Y OTRAS OBLIGACIONES FINANCIERAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('240540', 'BONOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('240545', 'POR MULTAS Y SANCIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('240595', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2410', 'CONTRATISTAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2415', 'COSTOS Y GASTOS POR PAGAR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('241505', 'COMISIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24150501', 'COMISIONES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('241510', 'HONORARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24151001', 'HONORARIOS                                                                       ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('241515', 'SERVICIOS PUBLICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('241520', 'SERVICIOS TEMPORALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24152001', 'SERVICIOS TEMPORALES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('241525', 'SERVICIOS  DE MANTENIMIENTO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('241530', 'SEGUROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24153002', 'SEGURO DE CARTERA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('241535', 'ARRENDAMIENTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('241540', 'GASTOS  DE  VIAJES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('241545', 'GASTOS LEGALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('241550', 'GASTOS DE REPRESENTACION Y RELACIONES PÚBLICAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('241555', 'SERVICIOS ADUANEROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('241595', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24159501', 'OTROS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24159502', 'ESTUDIO DE CREDITO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24159503', 'CONSULTA CENTRALES DE RIESGO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2430', 'PROMETIENTES COMPRADORES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('243005', 'BIENES INMUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('243010', 'BIENES MUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2435', 'PROVEEDORES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('243505', 'NACIONALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24350501', 'PRONTOCREDITO LTDA - SISTEMATIZACION', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('243510', 'EXTRANJEROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2440', 'CONTRIBUCIONES Y AFILIACIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244005', 'SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24400501', 'SUPERSOLIDARIA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('244020', 'FONDO DE GARANTIAS DE ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244045', 'CONFEDERACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244050', 'FEDERACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244055', 'ASOCIACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244095', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2442', 'GRAVAMEN DE LOS MOVIMIENTOS FINANCIEROS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244205', 'SOBRE DEPÓSITOS DE AHORROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244210', 'SOBRE CERTIFICADOS DE DEPOSITOS DE AHORRO A TÉRMINO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244215', 'SOBRE DEPÓSITOS DE AHORRO CONTRACTUAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244220', 'SOBRE DEPOSITOS DE AHORROS PERMANENTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244295', 'SOBRE OTRAS TRANSACCIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2445', 'RETENCION EN LA FUENTE', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244505', 'SALARIOS Y PAGOS LABORALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24450501', 'SALARIOS Y PAGOS LABORALES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('244510', 'DIVIDENDOS Y/O PARTICIPACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244515', 'HONORARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24451501', 'HONORARIOS                                                                       ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('244520', 'COMISIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24452001', 'COMISIONES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24452002', 'OTRAS COMISIONES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('244525', 'SERVICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24452501', 'SERVICIOS                                                                        ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('244530', 'ARRENDAMIENTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24453001', 'ARRENDAMIENTO                                                                    ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('244535', 'RENDIMIENTOS FINANCIEROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24453501', 'RENDIMIENTOS FINANCIEROS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('244540', 'COMPRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24454001', 'COMPRAS                                                                          ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('244545', 'LOTERIAS, RIFAS, APUESTAS Y SIMILARES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244550', 'POR PAGOS AL EXTERIOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244560', 'ENAJENACION PROPIEDADES PLANTA Y EQUIPO PERSONAS NATURALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244565', 'POR IMPUESTO DE TIMBRE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244570', 'OTRAS RETENCIONES Y PATRIMONIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24457001', 'RETENCIONES POR PAGAR                                                            ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24457002', 'RETENCIONES CREE TARIFA 0.30%', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24457003', 'RETENCIONES CREE TARIFA 0.60%', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('244575', 'AUTORRETENCIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2446', 'RETENCIONES CREE', 'C', '3', '0', 'A');
INSERT INTO `cn_puc` VALUES ('244605', 'RETENCIONES CREE', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24460501', 'RETENCIONES CREE TARIFA 0.30%', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24460502', 'RETENCIONES CREE TARIFA 0.60%', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24460503', 'RETENCIONES CREE TARIFA 1.60%', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2447', 'IMPUESTO A LAS VENTAS RETENIDO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244705', 'IMPUESTO A LAS VENTAS RETENIDO', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2448', 'IMPUESTO DE INDUSTRIA Y COMERCIO RETENIDO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('244805', 'IMPUESTO DE INDUSTRIA Y COMERCIO RETENIDO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24480501', 'IMPUESTO DE INDUSTRIA Y COMERCIO RETENIDO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2450', 'RETENCIONES Y APORTES DE NOMINA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('245005', 'APORTES A BIENESTAR PROMOTORAS DE SALUD EPS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24500501', 'APORTES SALUD                                                                    ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('245010', 'APORTES A BIENESTAR PROMOTORAS DE  PENSION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24501001', 'APORTES PENSION                                                                  ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24501002', 'FONDO SOLIDARIDAD PENSIONAL', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('245015', 'APORTES A ADMINISTRADORAS DE RIESGOS PROFESIONALES ARP', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24501501', 'ARP                                                                              ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('245020', 'APORTES AL I.C.B.F., SENA Y CAJAS DE COMPENSACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24502001', 'PARAFISCALES                                                                                        ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('245030', 'EMBARGOS JUDICIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('245035', 'LIBRANZAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24503501', 'LIBRANZA PRONTOCREDITO LTDA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24503502', 'LIBRANZAS DAFIN', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24503503', 'OTRAS LIBRANZAS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24503504', 'OTROS PAGOS PRONTOCREDITO LTDA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24503505', 'BOUTIQUE CARLOS TUIRAN', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24503506', 'LIBRANZAS SOLFINANZAS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('245040', 'SINDICATOS O AGREMIACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('245045', 'COOPERATIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24504501', 'DESCUENTOS COOPROEST (EMPLEADOS)', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24504502', 'DESCUENTOS VENDEDORES COPROEST', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24504503', 'OTRAS COOPERATIVAS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('245050', 'FONDOS DE EMPLEADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('245095', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2455', 'MULTAS Y SANCIONES, LITIGIOS, INDEMNIZACIONES Y DEMANDAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('245505', 'MULTAS Y SANCIONES   SUPERINTENDENCIA ECONOMIA SOLIDARIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24550501', 'SUPERSOLIDARIA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('245510', 'MULTAS Y SANCIONES OTRAS AUTORIDADES ADMINISTRATIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('245515', 'INDEMNIZACIONES A CLIENTES Y ASOCIADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('245520', 'OTRAS INDEMNIZACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24552001', 'INDEMNIZACIONES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('245525', 'DEMANDAS LABORALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('245530', 'DEMANDAS POR INCUMPLIMIENTO DE CONTRATOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('245535', 'OTROS LITIGIOS FALLADOS CON OBLIGACIÓN  DE PAGO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('245595', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2460', 'EXIGIBILIDADES POR SERVICIOS DE  RECAUDO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('246005', 'SERVICIOS PUBLICOS MUNICIPALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('246010', 'SERVICIOS DE GAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('246015', 'PENSIONES Y MATRICULAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('246020', 'NOMINAS DE BIENESTAR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('246025', 'IMPUESTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('246030', 'CONVENIOS PROGRAMADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24603001', 'CONVENIOS PROGRAMADOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24603002', 'CONVENIOS DAFIN PREJURIDICOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24603003', 'CONVENIOS COOPROEST GESTORES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24603004', 'CONVENIOS PROGRAMADOS COOPRONTOCREDITO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24603005', 'CTA DESARROLLAR', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24603006', 'GESTORES DE VENTA (DAFIN)', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24603007', 'RECAUDO DACION', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('246095', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2462', 'SEGURO DE DEPÓSITO LIQUIDADO POR PAGAR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2465', 'REMANENTES POR PAGAR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('246505', 'DE APORTES  EXASOCIADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24650501', 'DE APORTES DE EXASOCIADOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('246510', 'DE DEPOSITOS EXASOCIADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('246515', 'RETORNOS DECRETADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('246520', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2470', 'ESTABLECIMIENTOS AFILIADOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2495', 'DIVERSAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('249510', 'NOMINA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24951001', 'LIQUIDACIONES DE NOMINA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24951002', 'CUENTAS POR PAGAR NOMINA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('249520', 'VALORES POR REINTEGRAR   DACION EN PAGO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('249525', 'DONACIONES DE TERCEROS POR PAGAR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('249530', 'VALORES POR REINTEGRAR   MAYOR DESCUENTO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24953001', 'DEVOLUCION CUOTAS DE LIBRANZAS POR PAGAR', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24953002', 'GARANTIA SOBRE COMISION DE VENTA', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24953003', 'DEDUCCIONES POR PAGAR CREDITOS OTORGADOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24953004', 'CUOTAS DE OTRAS ENTIDADES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24953005', 'CUENTAS POR PAGAR LIBRANZA', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24953006', 'DINEROS RECIBIDOS PARA SU DEVOLUCION', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24953010', 'DEVOLUCION CUOTAS DE LIBRANZAS POR PAGAR', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('249595', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24959501', 'OTRAS CUENTAS POR PAGAR                                                                             ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24959502', 'APORTES SOCIALES ASOCIADOS COOPRONTOCREDITO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24959503', 'PAGOS A CARTERA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24959504', 'CUOTAS INCONSISTENTES LIQ. CREDITOS                                              ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24959505', 'RECAUDO CANCELACION DE CREDITOS', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('24959506', 'DINEROS RECIBIDOS PARA OTRAS ENTIDADES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24959507', 'DINEROS RECIBIDOS POR RELACION DE PAGOS DE COOPRONTOCREDITO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24959508', 'CUENTAS POR PAGAR OBLIGACIONES DESARROLLAR CTA.', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('24959509', 'RECAUDO POR CANCELACION DE DEUDA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25', 'IMPUESTOS, GRAVÁMENES Y TASAS', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2505', 'RENTA Y COMPLEMENTARIOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('250505', 'VIGENCIA FISCAL CORRIENTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('25050501', 'VIGENCIA FISCAL CORRIENTE', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('250510', 'VIGENCIA FISCAL ANTERIOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('25051001', 'VIGENCIA FISCAL ANTERIOR', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2510', 'IMPUESTO A LAS VENTAS POR PAGAR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('251001', 'IMPUESTO A LAS VENTAS POR PAGAR', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25100101', 'IMPUESTO A LAS VENTAS POR PAGAR', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2515', 'INDUSTRIA Y COMERCIO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('251505', 'VIGENCIA FISCAL CORRIENTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('25150501', 'VIGENCIA FISCAL CORRIENTE', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25150502', 'VIGENCIA FISCAL CORRIENTE-SANTA MARTA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25150503', 'VIGENCIA FISCAL CORRIENTE-CARTAGENA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25150504', 'VIGENCIA FISCAL CORRIENTE-SINCELEJO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25150505', 'VIGENCIA FISCAL CORRIENTE-MONTERIA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25150506', 'VIGENCIA FISCAL CORRIENTE-VALLEDUPAR', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('251510', 'VIGENCIA FISCAL ANTERIOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('25151001', 'VIGENCIA FISCAL ANTERIOR-BARRANQUILLA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25151002', 'VIGENCIA FISCAL ANTERIOR-SANTA MARTA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25151003', 'VIGENCIA FISCAL ANTERIOR-CARATGENA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25151004', 'VIGENCIA FISCAL ANTERIOR-SINCELEJO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25151005', 'VIGENCIA FISCAL ANTERIOR-MONTERIA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('25151006', 'VIGENCIA FISCAL ANTERIOR-VALLEDUPAR', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2520', 'A LA PROPIEDAD RAIZ', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2525', 'DERECHOS SOBRE INSTRUMENTOS PUBLICOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2530', 'DE VALORIZACION', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('253005', 'VIGENCIA FICAL CORRIENTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('253010', 'VIGENCIAS FISCAL ANTERIORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2535', 'DE TURISMO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2540', 'TASA POR UTILIZACIÓN DE PUERTOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2545', 'DE VEHICULOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('254505', 'VIGENCIA FISCAL CORRIENTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('254510', 'VIGENCIAS FISCALES  ANTERIORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2550', 'DE ESPETACULOS  PUBLICOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2555', 'DE HIDROCARBUROS Y MINAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('255505', 'DE HIDROCARBUROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('255510', 'DE MINAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2560', 'REGALIAS E IMPUESTOS A LA PEQUEÑA Y MEDIANA MINERIA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2565', 'A LAS EXPORTACIONES CAFETERAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2570', 'A LAS IMPORTACIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2575', 'CUOTAS DE FOMENTO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2580', 'DE LICORES, CERVEZAS Y CIGARRILLOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('258005', 'DE LICORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('258010', 'DE CERVEZAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('258015', 'DE CIGARRILLOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2585', 'AL SACRIFICIO DE GANADO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2590', 'AL AZAR,  JUEGOS  Y SIMILARES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2592', 'GRAVAMENES Y REGALIAS POR UTILIZACION DEL SUELO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2595', 'OTROS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('25950501', 'OTROS IMPUESTOS Y GRAVAMENES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('26', 'FONDOS SOCIALES, MUTUALES Y OTROS', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2605', 'FONDO SOCIAL DE EDUCACIÓN', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('260505', 'FONDO SOCIAL DE EDUCACION', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('26050501', 'FONDO SOCIAL DE EDUCACION', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('26050502', 'FONDO DE EDUCACION IVA DEDUCIBLE', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2610', 'FONDO SOCIAL DE  SOLIDARIDAD', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('261005', 'FONDO SOCIAL DE SOLIDARIDAD', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('26100501', 'FONDO SOCIAL DE SOLIDARIDAD', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2612', 'FONDO RESERVA TECNICA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2615', 'FONDO SOCIAL DE RECREACION', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2620', 'FONDOS PARA IMPREVISTOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2625', 'FONDO DE BIENESTAR  SOCIAL', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('262505', 'FONDO DE BIENESTAR SOCIAL', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('26250501', 'FONDO DE BIENESTAR SOCIAL', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('26250502', 'FONDO DE BIENESTAR SOCIAL-IVA NO DEDUCIBLE-', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2648', 'FONDO SOCIAL PARA OTROS FINES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2655', 'FONDO MUTUAL DE  PREVISIÓN ASISTENCIA Y SOLIDARIDAD', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('265505', 'FONDO MUTUAL DE PREVISION', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('26550501', 'FONDO MUTUAL                                                                     ', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('26550502', 'FONDO MUTUAL', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2658', 'FONDO MANTENIMIENTO CONJUNTO HABITACIONAL', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2660', 'FONDO REPOSICIÓN AUTOMOTOR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2695', 'FONDO MUTUAL PARA OTROS FINES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('269505', 'FONDO EXEQUIAL.', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('26950501', 'FONDO EXEQUIAL.', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('26950502', 'FONDO EXEQUIAL', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('27', 'OTROS PASIVOS', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2705', 'SUCURSALES Y AGENCIAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('270505', 'DEPOSITOS DE AHORROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('270510', 'CERTIFICADOS DEPOSITOS DE AHORRO A TÉRMINO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('270520', 'CUENTAS DE AHORRO ESPECIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('270525', 'DEPOSITOS CONTRACTUALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('270530', 'DEPOSITOS DE AHORROS PERMANENTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('270535', 'TRASLADO DE APORTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('270540', 'TRASLADOS DE INGRESOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('270545', 'TRASLADO DE RENTENCION EN LA FUENTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('270550', 'TRASLADO CUENTAS POR PAGAR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('270595', 'OTROS TRASLADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2710', 'OBLIGACIONES LABORALES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('271005', 'SALARIOS POR PAGAR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27100501', 'SALARIO POR PAGAR', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('271010', 'CESANTIAS CONSOLIDADAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27101001', 'CESANTIAS CONSOLIDADAS                                                           ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('271015', 'INTERESES SOBRE CESANTIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27101501', 'INTERESES SOBRE CESANTIAS                                                        ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('271020', 'PRIMA DE SERVICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27102001', 'PRIMA DE SERVICIOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('271025', 'VACACIONES CONSOLIDADAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27102501', 'VACACIONES CONSOLIDADAS                                                          ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('271030', 'COMPENSACION ANUAL DIFERIDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('271035', 'COMPENSACION SEMESTRAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('271040', 'DESCANSO ANUAL COMPENSADO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('271095', 'OTRAS PRESTACIONES SOCIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2715', 'PENSIONES POR PAGAR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2720', 'CUOTAS PARTES PENSIONES DE JUBILACION', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2725', 'INGRESOS ANTICIPADOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('272505', 'INTERESES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('272510', 'COMISIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('272515', 'ARRENDAMIENTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('272520', 'HONORARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('272525', 'SERVICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('272595', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2730', 'ABONOS DIFERIDOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('273005', 'PRIMA EN COLOCACION TITULOS DE INVERSION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('273015', 'POR VENTA DE BIENES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('273020', 'UTILIDAD DIFERIDA EN VENTAS A PLAZOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('273025', 'RETENCIONES O ANTICIPOS PENDIENTE DE APLICAR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27302501', 'RETENCIONES PENDIENTES DE APLICAR', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('273030', 'AUXILIOS Y DONACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('273035', 'INTERESES ORIGINADOS EN PROCESO DE REESTRUCTURACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('273095', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2735', 'CUENTAS EN PARTICIPACION', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2740', 'INGRESOS RECIBIDOS PARA TERCEROS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('274005', 'VALORES RECIBIDOS PARA TERCEROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27400501', 'VALORES RECIBIDOS PARA TERCEROS', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('274010', 'VENTA POR  CUENTA DE TERCEROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2745', 'ANTICIPOS Y AVANCES RECIBIDOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('274505', 'PARA VIVIENDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('274510', 'PARA IMPORTACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('274515', 'PARA SERVICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27451501', 'RECAUDO DE CLIENTES                                                              ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('274598', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2795', 'DIVERSOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('279505', 'ABONOS PARA APLICAR A OBLIGACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('279510', 'SOBRANTES EN CAJA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('279595', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27959501', 'CUENTAS POR PAGAR LIBRANZAS                                                      ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('27959502', 'CONVENIOS AUTORIZADOS DE PAGOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('27959503', 'CHEQUES DE CLIENTES RECIBIDOS POR PAGAR', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27959505', 'CONVENIOS TRASLADOS CARTERA', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('27959506', 'CUENTAS POR PAGAR LIBRANZAS KREDISOFT', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('28', 'PASIVOS ESTIMADOS Y PROVISIONES', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2805', 'INTERESES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('280505', 'DEPOSITOS DE AHORRO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('280510', 'CERTIFICADOS DE AHORRO A TÉRMINO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('280515', 'DEPOSITOS DE AHORROS CONTRACTUAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('280520', 'DEPOSITOS DE AHORRO PERMANENTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2810', 'PARA COSTOS Y GASTOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281005', 'OTROS  INTERESES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281010', 'COMISIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281015', 'HONORARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281020', 'SERVICIOS TECNICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281025', 'TRANSPORTES, FLETES Y ACARREOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281030', 'GASTOS DE VIAJE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281035', 'SERVICIOS PUBLICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281040', 'REGALIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281045', 'GARANTIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281050', 'MATERIALES Y REPUESTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281055', 'ARRENDAMIENTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281060', 'CONTRIBUCIONES Y AFILIACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281065', 'SERVICIOS VARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('281095', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2820', 'PARA MANTENIMIENTO Y REPARACIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282005', 'TERRENOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282010', 'EDIFICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282015', 'MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282020', 'MUEBLES Y EQUIPO DE OFICINA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282025', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282030', 'LABORATORIOS Y EQUIPOS DIDACTICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282035', 'VEHICULOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282040', 'MAUSOLEOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282045', 'BIENES DE FONDOS SOCIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282050', 'ACUEDUCTOS PLANTAS Y REDES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282055', 'ARMAMENTO DE VIGILANCIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282060', 'PLANTACIONES AGRICOLAS Y FORESTALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282065', 'POZOS ARTESIANOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282095', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2825', 'OBLIGACIONES LABORALES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282505', 'CESANTIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('28250501', 'CESANTIAS                                                                        ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('282510', 'INTERESES SOBRE CESANTIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('28251001', 'INTERESES SOBRE CESANTIAS                                                        ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('282515', 'VACACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('28251501', 'VACACIONES                                                                       ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('282520', 'PRIMA LEGAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('28252001', 'PRIMA LEGAL                                                                      ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('282525', 'PRIMA EXTRALEGAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282530', 'PRIMA DE VACACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282535', 'BONIFICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282540', 'PRIMA DE ANTIGÜEDAD', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282545', 'SEGURIDAD SOCIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282550', 'COMPENSACION ANUAL DIFERIDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282555', 'COMPENSACION SEMESTRAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282560', 'DESCANSO ANUAL COMPENSADO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282565', 'COMPENSACION EXTRAORDINARIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282595', 'OTRAS PRESTACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2827', 'PENSIONES DE JUBILACION', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282705', 'CALCULO ACTUARIAL PENSIONES DE JUBILACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('282710', 'PENSIONES DE JUBILACION POR AMORTIZAR (DB)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2830', 'IMPUESTOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283005', 'RENTA Y COMPLEMENTARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('28300501', 'RENTA Y COMPLEMENTARIOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('283010', 'INDUSTRIA Y COMERCIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283015', 'PREDIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283020', 'VEHICULOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283025', 'VALORIZACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283030', 'DERECHOS SOBRE INSTRUMENTOS PUBLICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283035', 'TURISMO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283040', 'DE HIDROCARBUROS Y MINAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283045', 'DE LICORES, CERVEZAS Y CIGARRILLO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283050', 'AL AZAR Y JEGOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283095', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2835', 'CONTRIBUCIONES Y AFILIACIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283505', 'SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('28350501', 'SUPERSOLIDARIA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('283520', 'FONDO DE GARANTIAS DE ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283545', 'CONFEDERACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283550', 'FEDERACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283555', 'ASOCIACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('283595', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2840', 'MULTAS Y SANCIONES   SUPERINTENDENCIA ECONOMIA SOLIDARIA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284005', 'RELACION ACTIVOS PONDERADOS POR RIESGO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284010', 'EXCESOS (DEFECTOS) DE COLOCACIONES DE CARTERA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284015', 'EXCESOS EN ADQUISICIÓN DE INVERSIONES  O ACTIVOS FIJOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284020', 'DEFECTOS DE INVERSIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284025', 'DEFECTO FONDO DE LIQUIDEZ', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284030', 'MARGEN DE SOLVENCIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284095', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('28409501', 'OTRAS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('2845', 'MULTAS Y SANCIONES, LITIGIOS, INDEMNIZACIONES Y DEMANDAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284510', 'AUTORIDADES ADMINISTRATIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284515', 'INDEMNIZACIONES A ASOCIADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284520', 'OTRAS INDEMNIZACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284525', 'DEMANDAS LABORALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284530', 'DEMANDAS POR INCUMPLIMIENTO DE CONTRATOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284535', 'LITIGIOS EN PROCESO EJECUTIVO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284540', 'OTROS LITIGIOS EN PROCESO ADMINISTRATIVO JUDICIAL O ARBITRAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('284595', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2890', 'OTROS PASIVOS ESTIMADOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('289005', 'PARA CONTINGENCIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2895', 'PROVISIONES DIVERSAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('289505', 'PARA BENEFICIENCA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('289510', 'PARA COMUNICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('289595', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('29', 'TITULOS DE INVERSION EN CIRCULACION', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('2905', 'BONOS POR PAGAR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('290540', 'DE GARANTIA GENERAL MENOR DE 18 MESES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('290545', 'DE GARANTIA GENERAL IGUAL O SUPERIOR A 18 MESES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('290580', 'OTROS MENOR DE 18 MESES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('290585', 'OTROS IGUAL O SUPERIOR A 18 MESES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3', 'PATRIMONIO', 'C', '1', '1', 'A');
INSERT INTO `cn_puc` VALUES ('31', 'CAPITAL SOCIAL', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3105', 'APORTES SOCIALES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('310505', 'APORTES ORDINARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('31050501', 'APORTES ORDINARIOS', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('31050502', 'APORTES ORDINARIOS ADICIONALES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('31050503', 'APORTES INICIALES', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('31050504', 'SALDOS INICIALES MIGRACION', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('310510', 'APORTES EXTRAORDINARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('31051001', 'APORTES EXTRAORDINARIOS', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('31051002', 'APORTES EXTRAORDINARIOS 2', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('310515', 'APORTES AMORTIZADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('310520', 'APORTES VOLUNTARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3110', 'FONDO SOCIAL MUTUAL', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('311005', 'CUOTAS O CONTRIBUCIONES SOCIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('311010', 'RESULTADO SOCIAL POSITIVO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('32', 'RESERVAS', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3205', 'RESERVA PROTECCIÓN DE APORTES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('320505', 'RESERVA PROTECCION DE APORTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('32050501', 'RESERVA PROTECCION DE APORTES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('3210', 'RESERVA DE INVERSIÓN SOCIAL', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3215', 'RESERVA DE ASAMBLEA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3220', 'RESERVA PROTECCIÓN CARTERA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('322005', 'RESERVA CREDITOS CON LIBRANZA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('322010', 'RESERVA  CREDITOS SIN LIBRANZA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3225', 'RESERVAS ESTATUTARIAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('322505', 'RESERVA PARA CAPITAL DE TRABAJO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('322510', 'RESERVA REPOSICIÓN DE ACTIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('322515', 'RESERVA FUTUROS ENSANCHES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('322590', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3230', 'RESERVA PROTECCION FONDO MUTUAL', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3235', 'POR DISPOSICIONES FISCALES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('323505', 'POR VALORIZACIÓN DE INVERSIONES NEGOCIABLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('323595', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3280', 'OTRAS RESERVAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('33', 'FONDOS DE DESTINACION ESPECÍFICA', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3305', 'FONDO PARA AMORTIZACION DE APORTES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('330505', 'FONDO PARA AMORTIZACIÓN DE APORTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3310', 'FONDO PARA REVALORIZACION DE APORTES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('331005', 'FONDO PARA REVALORIZACION DE APORTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('33100501', 'FONDO PARA REVALORIZACION DE APORTES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('331010', 'FONDO DE MANTENIMIENTO DEL PODER ADQUISITIVO DE LOS APORTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3315', 'FONDO MERCADEO DE PRODUCTOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('331505', 'FONDO MERCADEO DE  PRODUCTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3320', 'FONDO PARA INFRAESTRUCTURA FISICA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('332005', 'FONDO PARA INFRAESTRUCTURA FISICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3325', 'FONDO ESPECIAL', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('332505', 'FONDO ESPECIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('33250501', 'FONDO ESPECIAL', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('3330', 'FONDO SOCIALES CAPITALIZADOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('333005', 'FONDO SOCIALES CAPITALIZADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3335', 'FONDOS DE INVERSION', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('333505', 'FONDOS DE INVERSION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('33350501', 'FONDOS DE INVERSION', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('3340', 'OTROS FONDOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('334005', 'OTROS FONDOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('33400502', 'FONDO DE BIENESTAR SOCIAL', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('34', 'SUPERAVIT', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3405', 'AUXILIOS Y DONACIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('340505', 'ENTIDADES PARTICULARES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('340510', 'ENTIDADES EXTRANJERAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('340595', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3415', 'VALORIZACIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('341505', 'INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS PARTICIPATIVOS DE BAJA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('341510', 'PROPIEDADES PLANTA  Y EQUIPO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('341520', 'SEMOVIENTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('341525', 'BIENES DE ARTE Y CULTURA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('341530', 'PATRIMONIO AUTÓNOMO   SANEAMIENTO FOGACOOP', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('341595', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3420', 'GANANCIAS O PÉRDIDAS ACUMULADAS NO REALIZADAS EN INVERSIONES DISPONIBLES PARA LA VENTA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('342005', 'TITULOS DE DEUDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('342010', 'TITULOS PARTICIPATIVOS DE ALTA O MEDIA BURSATILIDAD', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('342015', 'TITULOS PARTICIPATIVOS O MIXTOS DE PROCESOS DE TITULARIZACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('35', 'RESULTADOS DEL EJERCICIO', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3505', 'EXCEDENTES Y/O PÉRDIDAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('350505', 'EXCEDENTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('35050501', 'EXCEDENTES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('350510', 'PERDIDAS (DB)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('35051001', 'PERDIDAS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('36', 'RESULTADOS DE EJERCICIOS ANTERIORES', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('3605', 'EXCEDENTES Y/O PÉRDIDAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('360505', 'EXCEDENTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('36050501', 'EXCEDENTES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('360510', 'PERDIDAS (DB)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('36051001', 'PERDIDAS', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4', 'INGRESOS', 'C', '1', '1', 'A');
INSERT INTO `cn_puc` VALUES ('41', 'OPERACIONALES', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4105', 'AGRICULTURA, GANADERIA, CAZA Y SILVICULTURA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410505', 'CULTIVO DE CEREALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410510', 'CULTIVOS DE HORTALIZAS, LEGUMBRES Y PLANTAS ORNAMENTALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410515', 'CULTIVOS DE FRUTAS, NUECES Y PLANTAS AROMATICAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410520', 'CULTIVO DE CAFE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410525', 'CULTIVO DE FLORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410530', 'CULTIVO DE CAÑA DE AZUCAR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410535', 'CULTIVO DE ALGODON Y PLANTAS PARA MATERIAL TEXTIL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410540', 'CULTIVO DE BANANO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410545', 'OTROS CULTIVOS AGRICOLAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410550', 'CRIA DE OVEJAS, CABRAS, ASNOS, MULAS Y BURDEGANOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410555', 'CRIA DE GANADO CABALLAR Y VACUNO.', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410560', 'PRODUCCION AVICOLA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410565', 'CRIA DE OTROS ANIMALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410570', 'SERVICIOS AGRICOLAS Y GANADEROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410575', 'ACTIVIDAD DE CAZA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('410580', 'ACTIVIDAD DE SILVICULTURA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4110', 'PESCA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411005', 'ACTIVIDAD DE PESCA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411010', 'EXPLOTACION DE CRIADEROS DE PECES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411095', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4115', 'EXPLOTACION DE MINAS Y CANTERAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411505', 'CARBON', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411510', 'PETROLEO CRUDO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411512', 'GAS NATURAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411514', 'SERVICIOS RELACIONADOS CON EXTRACCION DE PETROLEO Y GAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411515', 'MINERALES DE HIERRO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411520', 'MINERALES METALIFEROS NO FERROSOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411525', 'PIEDRA, ARENA Y ARCILLA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411527', 'PIEDRAS PRECIOSAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411528', 'ORO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411530', 'OTRAS MINAS Y CANTERAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411532', 'PRESTACION DE SERVICIOS SECTOR MINERO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('411595', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4120', 'INDUSTRIAS MANUFACTURERAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412001', 'PRODUCCION Y PROCESAMIENTO DE CARNES Y PRODUCTOS CARNICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412002', 'PRODUCTOS DE PESCADO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412003', 'PRODUCTOS DE FRUTAS, LEGUMBRES Y HORTALIZAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412004', 'ELABORACION DE ACEITES Y GRASAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412005', 'ELABORACION DE PRODUCTOS LACTEOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412006', 'ELABORACION DE PRODUCTOS DE MOLINERIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412007', 'ELABORACION DE ALMIDONES Y DERIVADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412008', 'ELABORACION DE ALIMENTOS PARA ANIMALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412009', 'ELABORACION DE PRODUCTOS PARA PANADERIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412010', 'ELABORACION DE AZUCAR Y MELAZAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412011', 'ELABORACION DE CACAO, CHOCOLATE Y CONFITERIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412012', 'ELABORACION DE PASTAS  Y PRODUCTOS FARINACEOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412013', 'ELABORACION DE PRODUCTOS DE CAFE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412014', 'ELABORACION DE OTROS PRODUCTOS ALIMENTICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412015', 'ELABORACION DE BEBIDAS ALCOHOLICAS Y ALCOHOL ETILICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412016', 'ELABORACION DE VINOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412017', 'ELABORACION DE BEBIDAS MALTEADAS Y DE MALTA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412018', 'ELABORACION DE BEBIDAS NO ALCOHOLICAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412019', 'ELABORACION DE PRODUCTOS DE TABACO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412020', 'PREPARACION E HILATURA DE FIBRAS TEXTILES Y TEJEDURIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412021', 'ACABADO DE PRODUCTOS TEXTILES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412022', 'ELABORACION DE ARTICULOS DE MATERIALES TEXTILES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412023', 'ELABORACION DE TAPICES Y ALFOMBRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412024', 'ELABORACION DE CUERDAS, CORDELES, BRAMANTES Y REDES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412025', 'ELABORACION DE OTROS PRODUCTOS TEXTILES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412026', 'ELABORACION DE TEJIDOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412027', 'ELABORACION DE PRENDAS DE VESTIR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412028', 'PREPARACION, ADOBO Y TEÑIDO DE PIELES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412029', 'CURTIDO, ADOBO O PREPARACION DE CUERO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412030', 'ELABORACION DE MALETAS, BOLSOS Y SIMILARES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412031', 'ELABORACION DE CALZADO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412032', 'PRODUCCION DE MADERA, ARTICULOS DE MADERA Y CORCHO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412033', 'ELABORACION DE PASTA Y PRODUCTOS DE MADERA, PAPEL Y CARTON', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412034', 'EDICIONES Y PUBLICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412035', 'IMPRESION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412036', 'SERVICIOS RELACIONADOS CON LA EDICION Y LA IMPRESION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412037', 'REPRODUCCION DE GRABACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412038', 'ELABORACION DE PRODUCTOS DE HORNO DE COQUE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412039', 'ELABORACION DE PRODUCTOS DE LA REFINACION DE PETROLEO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412040', 'ELABORACION DE SUSTANCIAS QUIMICAS BASICAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412041', 'ELABORACION DE ABONOS Y COMPUESTOS DE NITROGENO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412042', 'ELABORACION DE PLASTICO Y CAUCHO SINTETICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412043', 'ELABORACION DE PRODUCTOS QUIMICOS DE USO AGROPECUARIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412044', 'ELABORACION DE PINTURAS, TINTAS Y MASILLAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412045', 'ELABORACION DE PRODUCTOS FARMACEUTICOS Y BOTANICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412046', 'ELABORACION DE JABONES, DETERGENTES Y PREPARADOS DE TOCADOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412047', 'ELABORACION DE OTROS PRODUCTOS QUIMICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412048', 'ELABORACION DE FIBRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412049', 'ELABORACION DE OTROS PRODUCTOS DE CAUCHO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412050', 'ELABORACION DE PRODUCTOS DE PLASTICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412051', 'ELABORACION DE VIDRIO Y PRODUCTOS DE VIDRIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412052', 'ELABORACION DE PRODUCTOS DE CERAMICA, LOZA, PIEDRA, ARCILLA Y PORCELANA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412053', 'ELABORACION DE CEMENTO, CAL Y YESO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412054', 'ELABORACION DE ARTICULOS DE HORMIGON, CEMENTO Y YESO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412055', 'CORTE, TALLADO Y ACABADO DE LA PIEDRA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412056', 'ELABORACION DE OTROS PRODUCTOS MINERALES NO METALICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412057', 'INDUSTRIAS BASICAS Y FUNDICION DE HIERRO Y ACERO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412058', 'PRODUCTOS PRIMARIOS DE METALES PRECIOSOS Y DE METALES NO  FERROSOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412059', 'FUNDICION DE METALES NO FERROSOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412060', 'FABRICACION DE PRODUCTOS METALICOS PARA USO ESTRUCTURAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412061', 'FORJA, PRENSADO, ESTAMPADO, LAMINADO DE METAL Y PULVIMETALURGIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412062', 'REVESTIMIENTO DE METALES Y OBRAS DE INGENIERIA MECANICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412063', 'FABRICACION DE ARTICULOS DE FERRETERIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412064', 'ELABORACION DE OTROS PRODUCTOS DE METAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412065', 'FABRICACION DE MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412066', 'FABRICACION DE EQUIPOS DE ELEVACION Y MANIPULACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412067', 'ELABORACION DE APARATOS DE USO DOMESTICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412068', 'ELABORACION DE EQUIPO DE OFICINA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412069', 'ELABORACION DE PILAS Y BATERIAS PRIMARIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412070', 'ELABORACION DE EQUIPO DE ILUMINACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412071', 'ELABORACION DE OTROS TIPOS DE EQUIPO ELECTRICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412072', 'FABRICACION DE EQUIPOS DE RADIO, TELEVISION Y COMUNICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412073', 'FABRICACION DE APARATOS E INSTRUMENTOS MEDICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412074', 'FABRICACION DE INSTRUMENTOS DE MEDICION Y CONTROL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412075', 'FABRICACION DE INSTRUMENTOS DE OPTICA Y EQUIPO FOTOGRAFICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412076', 'FABRICACION DE RELOJES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412077', 'FABRICACION DE VEHICULOS AUTOMOTORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412078', 'FABRICACION DE CARROCERIAS PARA AUTOMOTORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412079', 'FABRICACION DE PARTES PIEZAS Y ACCESORIOS PARA AUTOMOTORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412080', 'FABRICACION Y REPARACION DE BUQUES Y OTRAS EMBARCACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412081', 'FABRICACION DE LOCOMOTORAS Y MATERIAL RODANTE PARA  FERROCARRILES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412082', 'FABRICACION DE AERONAVES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412083', 'FABRICACION DE MOTOCICLETAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412084', 'FABRICACION DE BICICLETAS Y SILLAS DE RUEDAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412085', 'FABRICACION DE OTROS TIPOS DE TRANSPORTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412086', 'FABRICACION DE MUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412087', 'FABRICACION DE JOYAS Y ARTICULOS CONEXOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412088', 'FABRICACION DE INSTRUMENTOS DE MUSICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412089', 'FABRICACION DE ARTICULOS Y EQUIPO PARA DEPORTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412090', 'FABRICACION DE JUEGOS Y JUGUETES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412091', 'RECICLAMIENTO DE DESPERDICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412095', 'PRODUCTOS DE OTRAS INDUSTRIAS MANUFACTURERAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4125', 'SUMINISTRO DE ELECTRICIDAD, GAS Y AGUA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412505', 'GENERACION, CAPTACION Y DISTRIBUCION DE ENERGIA ELECTRICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412510', 'FABRICACION DE GAS Y DISTRIBUCION DE COMBUSTIBLES GASEOSOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412515', 'CAPTACION, DEPURACION Y DISTRIBUCION DE AGUA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('412595', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4130', 'CONSTRUCCION', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413005', 'PREPARACION DE TERRENOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413010', 'CONSTRUCCION DE EDIFICIOS Y OBRAS DE INGENIERIA CIVIL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413015', 'ACONDICIONAMIENTO DE EDIFICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413020', 'TERMINACION DE EDIFICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413025', 'ALQUILER DE EQUIPO CON OPERARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413095', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4135', 'COMERCIO AL POR MAYOR Y AL POR MENOR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413502', 'VENTA DE VEHICULOS AUTOMOTORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413504', 'MANTENIMIENTO, REPARACION Y LAVADO DE VEHICULOS AUTOMOTORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413506', 'VENTA DE PARTES, PIEZAS Y ACCESORIOS DE VEHICULOS AUTOMOTORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413508', 'VENTA DE COMBUSTIBLES SÓLIDOS, LIQUIDOS, GASEOSOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413510', 'VENTA DE LUBRICANTES, ADITIVOS, LLANTAS Y LUJOS PARA AUTOMOTORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413512', 'VENTA A CAMBIO DE RETRIBUCION O POR CONTRATA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413514', 'VENTA DE INSUMOS, MATERIAS PRIMAS AGROPECUARIAS Y FLORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413516', 'VENTA DE OTROS INSUMOS Y MATERIAS PRIMAS NO AGROPECUARIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413518', 'VENTA DE ANIMALES VIVOS Y CUEROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413520', 'VENTA DE PRODUCTOS EN ALMACENES NO ESPECIALIZADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413522', 'VENTA DE PRODUCTOS AGROPECUARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413524', 'VENTA DE PRODUCTOS TEXTILES, DE VESTIR, DE CUERO Y CALZADO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413526', 'VENTA DE PAPEL Y CARTON', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413528', 'VENTA DE LIBROS, REVISTAS, ELEMENTOS DE PAPELERIA, UTILES Y TEXTOS  ESCOLARES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413530', 'VENTA DE JUEGOS, JUGUETES Y ARTICULOS DEPORTIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413532', 'VENTA DE INSTRUMENTOS QUIRURGICOS Y ORTOPEDICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413534', 'VENTA DE ARTICULOS EN RELOJERIAS Y JOYERIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413536', 'VENTA DE ELECTRODOMESTICOS Y MUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413538', 'VENTA DE PRODUCTOS DE ASEO, FARMACEUTICOS, MEDICINALES, Y ARTICULOS DE TOCADOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413540', 'VENTA DE CUBIERTOS, VAJILLAS, CRISTALERIA, PORCELANAS, CERAMICAS Y  OTROS ARTICULOS DE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413542', 'VENTA DE MATERIALES DE CONSTRUCCION, FONTANERIA Y CALEFACCIÓN.', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413544', 'VENTA DE PINTURAS Y LACAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413546', 'VENTA DE PRODUCTOS DE VIDRIOS Y MARQUETERIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413548', 'VENTA DE HERRAMIENTAS Y ARTICULOS DE FERRETERIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413550', 'VENTA DE QUIMICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413552', 'VENTA DE PRODUCTOS INTERMEDIOS, DESPERDICIOS Y DESECHOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413554', 'VENTA DE MAQUINARIA, EQUIPO DE OFICINA Y PROGRAMAS DE COMPUTADOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413556', 'VENTA DE ARTICULOS EN CACHARRERIAS Y MISCELANEAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413558', 'VENTA DE INSTRUMENTOS MUSICALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413560', 'VENTA DE ARTICULOS EN CASAS DE EMPEÑO Y PRENDERIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413562', 'VENTA DE EQUIPO FOTOGRAFICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413564', 'VENTA DE EQUIPO OPTICO Y DE PRECISION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413566', 'VENTA DE EMPAQUES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413568', 'VENTA DE EQUIPO PROFESIONAL Y CIENTIFICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413570', 'VENTA DE LOTERIAS, RIFAS, CHANCE, APUESTAS Y SIMILARES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413572', 'REPARACION DE EFECTOS PERSONALES Y ELECTRODOMESTICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('413595', 'VENTA DE OTROS PRODUCTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4140', 'HOTELES Y RESTAURANTES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414005', 'HOTELERIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414010', 'CAMPAMENTO Y OTROS TIPOS DE HOSPEDAJE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414015', 'RESTAURANTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414020', 'BARES Y CANTINAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414095', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4145', 'TRANSPORTE, ALMACENAMIENTO Y COMUNICACIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414505', 'SERVICIO DE TRANSPORTE POR CARRETERA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414510', 'SERVICIO DE TRANSPORTE POR VIA FERREA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414515', 'SERVICIO DE TRANSPORTE POR VIA ACUATICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414520', 'SERVICIO DE TRANSPORTE POR VIA AEREA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414525', 'SERVICIO DE TRANSPORTE POR TUBERIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414530', 'MANIPULACION DE CARGA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414535', 'ALMACENAMIENTO Y DEPÓSITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414540', 'SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414545', 'AGENCIAS DE VIAJE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414550', 'OTRAS AGENCIAS DE TRANSPORTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414555', 'SERVICIO POSTAL Y DE CORREO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414560', 'SERVICIO TELEFONICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414565', 'SERVICIO DE TELEGRAFO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414570', 'SERVICIO DE TRANSMISION DE DATOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414575', 'SERVICIO DE RADIO Y TELEVISION POR CABLE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414580', 'TRANSMISION DE SONIDO E IMAGENES POR CONTRATO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('414595', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4150', 'ACTIVIDAD FINANCIERA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415005', 'INTERESES CREDITOS COMERCIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415010', 'INTERESES CREDITOS CONSUMO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415015', 'INTERESES CREDITOS VIVIENDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415016', 'INTERESES MICROCREDITO INMOBILIARIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415017', 'INTERESES MICROCREDITO EMPRESARIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415018', 'REAJUSTE MONETARIO VIVIENDA (U.V.R.)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415020', 'UTILIDAD EN VENTA TITULOS NEGOCIABLES DE DEUDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415022', 'UTILIDAD EN VENTA TITULOS NEGOCIABLES  DE PATICIPACIÓN', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415024', 'UTILIDAD EN VENTA TITULOS PARA MANTENER HASTA EL VENCIMIENTO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415025', 'UTILIDAD EN VENTA DE INVERSIONES DISP0NIBLE PARA LA VENTA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415026', 'UTILIDAD EN VENTA EN INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE DEUDA.', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415028', 'UTILIDAD EN VENTA EN INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE  PARTICIPACIÓN.', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415040', 'INTERESES TITULO E INVERSIÓN EN CIRCULACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415045', 'INTERESES GANADOS FOGACOOP', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415046', 'INTERESES FONDO DE LIQUIDEZ', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415048', 'DIVIDENDOS, PARTICIPACIONES Y RETORNOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415060', 'COMISIONES Y/O HONORARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415070', 'UTILIDAD EN VENTA DE CARTERA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415075', 'DIFERENCIA EN CAMBIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415080', 'PACTO DE REAJUSTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415081', 'INTERESES COMPROMISOS REVENTA DE INVERSIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415082', 'INTERESES COMPROMISOS REVENTA DE CARTERA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415083', 'INTERESES DE INVERSIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415098', 'OTROS INGRESOS FINANCIEROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4151', 'UTILIDAD EN VALORACION DE INVERSIONES NEGOCIABLES EN TITULOS DE DEUDA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415106', 'POR INCREMENTO EN EL VALOR DE MERCADO (CR)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415112', 'POR DISMINUCION EN EL VALOR DE MERCADO (DB)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4152', 'UTILIDAD EN VALORACION DE INVERSIONES NEGOCIABLES EN TITULOS PARTICIPATIVOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415206', 'POR INCREMENTO EN EL VALOR DE MERCADO (CR)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415211', 'POR DISMINUCION EN EL VALOR DE MERCADO (DB)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4153', 'UTILIDAD EN VALORACION DE INVERSIONES DISPONIBLES PARA LA VENTA EN TITULOS DE DEUDA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415306', 'POR INCREMENTO EN EL VALOR PRESENTE (CR)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415312', 'POR DISMINUCION EN EL VALOR PRESENTE (DB)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4154', 'UTILIDAD EN VALORACION INVERSIONES PARA MANTENER HASTA EL VENCIMIENTO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415406', 'POR INCREMENTO EN EL VALOR PRESENTE (CR)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415412', 'POR DISMINUCION EN EL VALOR PRESENTE (DB)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4155', 'ACTIVIDADES INMOBILIARIAS, EMPRESARIALES Y DE ALQUILER', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415505', 'ARRENDAMIENTOS DE BIENES INMUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415510', 'INMOBILIARIAS POR RETRIBUCION O CONTRATA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415515', 'ALQUILER EQUIPO DE TRANSPORTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415520', 'ALQUILER MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415525', 'ALQUILER DE EFECTOS PERSONALES Y ENSERES DOMESTICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415530', 'CONSULTORIA EN EQUIPO Y PROGRAMAS DE INFORMATICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415535', 'PROCESAMIENTO DE DATOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415540', 'MANTENIMIENTO Y REPARACION DE MAQUINARIA DE OFICINA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415545', 'INVESTIGACIONES CIENTIFICAS Y DE DESARROLLO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415550', 'ACTIVIDADES EMPRESARIALES DE CONSULTORIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415555', 'PUBLICIDAD', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415560', 'DOTACION DE PERSONAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415565', 'INVESTIGACION Y SEGURIDAD', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415570', 'ASEO, LIMPIEZA DE INMUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415575', 'FOTOGRAFIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415580', 'ENVASE Y EMPAQUE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415585', 'FOTOCOPIADO Y MICROFILMACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415590', 'MANTENIMIENTO Y REPARACION DE MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('415595', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4160', 'ENSEÑANZA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416005', 'ACTIVIDADES RELACIONADAS CON LA EDUCACIÓN', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416010', 'CERTIFICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416015', 'FORMULARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416020', 'VALOR DERECHOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416025', 'PAZ Y SALVO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416095', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4165', 'SERVICIOS SOCIALES Y DE SALUD', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416505', 'SERVICIO HOSPITALARIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416510', 'SERVICIO MEDICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416515', 'SERVICIO ODONTOLOGICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416520', 'SERVICIO DE LABORATORIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416525', 'ACTIVIDADES VETERINARIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416530', 'ACTIVIDADES DE SERVICIOS SOCIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416535', 'CUOTAS DE ADMINISTRACIÓN Y/O ASOCIACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416540', 'CUOTAS DE ADMINISTRACIÓN Y SOSTENIMIENTO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416545', 'SERVICIOS DE PREVISIÓN Y SEGURIDAD SOCIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('416595', 'ACTIVIDADES CONEXAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4170', 'OTRAS ACTIVIDADES DE SERVICIOS COMUNES, SOCIALES Y PERSONALES.', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417005', 'ELIMINACION DE DESPERDICIOS Y AGUAS RESIDUALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417010', 'ACTIVIDADES DE ASOCIACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417015', 'PRODUCCION Y DISTRIBUCION DE FILMES Y VIDEOCINTAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417020', 'EXHIBICION DE FILMES Y VIDEOCINTAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417025', 'ACTIVIDAD DE RADIO Y TELEVISION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417030', 'ACTIVIDAD TEATRAL, MUSICAL Y ARTISTICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417035', 'GRABACION Y PRODUCCION DE DISCOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417040', 'ENTRETENIMIENTO Y ESPARCIMIENTO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417045', 'AGENCIAS DE NOTICIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417050', 'LAVANDERIAS Y SIMILARES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417055', 'PELUQUERIAS Y SIMILARES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417060', 'SERVICIOS FUNERARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417062', 'VIGILANCIA Y SEGURIDAD PRIVADA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417065', 'ZONAS FRANCAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417070', 'SERVICIOS DE ASISTENCIA TÉCNICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417072', 'SERVICIOS EN SISTEMAS O COMPUTACIÓN', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417075', 'SERVICIO DE ASESORIAS FINANCIERAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417080', 'SERVICIO DE REVISORIAS Y AUDITORIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417082', 'SERVICIO DE ASESORIA JURÍDICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417085', 'SERVICIO DE BÁSCULA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417088', 'SERVICIO DE TRILLA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417089', 'SERVICIO DE ARCHIVO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417095', 'OTROS SERVICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('41709501', 'OTROS SERVICIOS MANDATOS COOPERATIVOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('4175', 'DEVOLUCIONES, REBAJAS Y DESCUENTOS EN VENTAS (DB)', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('417501', 'DEVOLUCIONES REBAJAS Y DESCUENTOS', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('41750101', 'DEVOLUCIONES, REBAJAS Y DESCUENTOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('41750105', 'DEVOLUCIONES, REBAJAS Y DESCUENTOS INT.CESANTIAS', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4180', 'RECUPERACIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418015', 'REINTEGRO PROVISIÓN CARTERA DE CREDITO- COMERCIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418016', 'REINTEGRO PROVISIÓN CARTERA DE CREDITO- CONSUMO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('41801601', 'REINTEGRO PROVISION CARTERA DE CONSUMO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('418017', 'REINTEGRO PROVISIÓN CARTERA DE CREDITO - VIVIENDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418018', 'REINTEGRO PROVISIÓN CARTERA DE CREDITO - MICROCREDITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418020', 'REINTEGRO PROVISION DEUDORES POR VENTA DE BIENES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418025', 'REINTEGRO PROVISIÓN DEUDORES POR PRESTACIÓN DE SERVICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418027', 'REINTEGRO PROVISIÓN BIENES RECIBIDOS EN PAGO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418028', 'PROVISION DE INTERESES', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('41802801', 'PROVISION DE INTERESES', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('4185', 'SERVICIO DE CREDITO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418505', 'INTERESES CREDITOS COMERCIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418510', 'INTERESES CREDITOS CONSUMO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('41851001', 'INTERESES CREDITO CONSUMO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('41851004', 'INTERES LIBRANZAS COOP', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('418515', 'INTERESES CREDITOS DE VIVIENDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418516', 'INTERESES MICROCREDITO EMPRESARIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418517', 'INTERESES MICROCREDITO INMOBILIARIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418518', 'REAJUSTE MONETARIO VIVIENDA ( U.V.R.)', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418519', 'INTERESES INVERSIONES NEGOCIABLES EN TITULOS DE DEUDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418521', 'INTERESES INVERSIONES NEGOCIABLES EN TITULOS PARTICIPATIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418522', 'INTERESES INVERSIONES DISPONIBLES PARA LA VENTA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418523', 'INTERESES INVERSIONES PARA MANTENER HASTA EL VENCIMIENTO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418525', 'INTERESES COMPROMISOS DE REVENTA DE INVERSIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418530', 'INTERESES COMPROMISOS DE REVENTA DE CARTERA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418540', 'INTERESES GANADOS FOGACOOP', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418542', 'INTERESES DEUDORES POR VENTA DE BIENES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418543', 'INTERESES DEUDORES POR PRESTACIÓN DE SERVICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418545', 'INTERESES VARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418546', 'INTERESES FONDO DE LIQUIDEZ', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418550', 'VALORACION INVERSIONES TEMPORALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418555', 'VALORACION INVERSIONES PERMANENTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418560', 'COMISIONES Y/O HONORARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('41856001', 'COMISIONES 5*%', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('418565', 'UTILIDAD EN VENTAS DE INVERSIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418570', 'UTILIDAD EN VENTA DE CARTERA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418575', 'DIFERENCIA EN CAMBIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418580', 'PACTO DE REAJUSTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('418598', 'OTROS INGRESOS DE SERVICIO DE CREDITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('41859801', 'OTROS INGRESOS SERVICIO DE CREDITO SANCION PREPAGO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('41859802', 'INTERES POR MORA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('4190', 'ADMINISTRATIVOS Y SOCIALES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('419005', 'CUOTAS DE ADMISIÓN Y/O AFILIACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('41900501', 'CUOTAS DE ADMISION Y/O AFILIACION', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('419010', 'CUOTAS DE ADMINISTRACIÓN Y SOSTENIMIENTO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('419015', 'CUOTAS POR SERVICIOS DE PREVISIÓN Y SEGURIDAD SOCIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('41901501', 'PREVISION Y SEG. SOCIAL                                                          ', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('41901502', 'SERVICIOS SALUD ORAL', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('41901503', 'SERVICIO DE SALUD ORAL', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('41901504', 'SERVICIO DE RECREACION Y CULTURA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('41901505', 'SERVICIO DE TURISMO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('419090', 'OTROS INGRESOS ADMINISTRATIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('42', 'NO OPERACIONALES', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4205', 'OTRAS VENTAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420505', 'MATERIA PRIMA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420510', 'MATERIAL DE DESECHO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420515', 'MATERIALES VARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420520', 'PRODUCTOS DE DIVERSIFICACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420525', 'EXCEDENTES DE EXPORTACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420530', 'ENVASES Y EMPAQUES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420535', 'PRODUCTOS AGRICOLAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420540', 'DE PROPAGANDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420545', 'PRODUCTOS EN REMATE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('420550', 'COMBUSTIBLES Y LUBRICANTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4210', 'FINANCIEROS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421005', 'INTERESES VARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('42100501', 'INTERESES VARIOS                                                                 ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('42100502', 'INTERESES POR MORA                                                               ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('42100503', 'RENDIMIENTOS FINANCIEROS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('421010', 'REAJUSTE MONETARIO    UVR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421015', 'DESCUENTOS AMORTIZADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421020', 'DIFERENCIA EN CAMBIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421025', 'FINANCIACION VEHICULOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421030', 'FINANCIACION SISTEMAS DE VIAJES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421035', 'FINANCIACIÓN VENTAS A CREDITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421040', 'COMISIONES VARIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421045', 'PACTO DE  REAJUSTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421050', 'INTERESES CARTERA DE  POR VENTA DE BIENES Y SERVICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421098', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4215', 'DIVIDENDOS, PARTICIPACIONES Y EXCEDENTES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421505', 'DE SOCIEDADES ANONIMAS Y/O ASIMILADAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421510', 'DE SOCIEDADES LIMITADAS Y/O ASIMILADAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('421515', 'DE ENTIDADES COOPERATIVAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4220', 'ARRENDAMIENTOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422005', 'TERRENOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422010', 'EDIFICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422015', 'MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422020', 'MUEBLES Y EQUIPO DE OFICINA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422025', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422030', 'EQUIPO MEDICO - CIENTIFICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422035', 'EQUIPO DE HOTELES Y RESTAURANTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422040', 'ENVASES Y EMPAQUES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422045', 'VEHICULOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422050', 'ARTICULOS DE VIGILANCIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422055', 'ELEMENTOS DIDÁCTICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422060', 'MAUSOLEOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422065', 'SEMOVIENTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422070', 'OTROS BIENES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4225', 'COMISIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422505', 'SOBRE  INVERSIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422510', 'DE CONCESIONARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422515', 'DE ACTIVIDADES FINANCIERAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422520', 'POR VENTA DE SERVICIOS DE TALLER', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422525', 'POR VENTA DE SEGUROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422530', 'POR INGRESOS PARA TERCEROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422535', 'POR DISTRIBUCION DE PELICULAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422540', 'DERECHOS DE AUTOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('422545', 'DERECHOS DE PROGRAMACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4230', 'HONORARIOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423005', 'ASESORIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423010', 'ASISTENCIA TECNICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423015', 'ADMINISTRACION DE VINCULADAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4235', 'SERVICIOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423505', 'DE BÁSCULA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423510', 'DE TRANSPORTE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423515', 'DE PRENSA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423520', 'ADMINISTRATIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423525', 'TECNICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423530', 'DE COMPUTACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423535', 'DE TELEFAX', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423540', 'TALLER DE VEHICULOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423545', 'DE RECEPCION DE AERONAVES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423550', 'DE TRANSPORTE PROGRAMA GAS NATURAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423555', 'POR CONTRATOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423560', 'DE TRILLLA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423565', 'DE MANTENIMIENTO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423570', 'AL PERSONAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423575', 'DE CASINO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423580', 'FLETES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423585', 'ENTRE COMPAÑIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('423595', 'OTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4240', 'UTILIDAD EN VENTA DE INVERSIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424010', 'FONDO DE LIQUIDEZ', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424019', 'UTILIDAD EN VENTA TITULOS NEGOCIABLES DE DEUDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424021', 'UTILIDAD EN VENTA TITULOS NEGOCIABLES  DE PATICIPACIÓN', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424022', 'UTILIDAD EN VENTA TITULOS PARA MANTENER HASTA EL VENCIMIENTO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424023', 'UTILIDAD EN VENTA DE INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE DEUDA.', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424024', 'UTILIDAD EN VENTA DE INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE  PARTICIPACIÓN.', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424095', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4245', 'UTILIDAD EN VENTA DE PROPIEDADES PLANTA Y EQUIPO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424504', 'TERRENOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424508', 'CONSTRUCCIONES  O MONTAJES EN  CURSO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424516', 'EDIFICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424524', 'MUEBLES Y EQUIPO DE OFICINA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424528', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424532', 'VEHICULOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424536', 'ARMAMENTO DE VIGILANCIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424540', 'PLANTACIONES AGRÍCOLAS Y FORESTALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424545', 'MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424548', 'PROPIEDADES EN TRANSITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424552', 'SEMOVIENTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424556', 'MAUSOLEOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424558', 'ENVASES Y EMPAQUES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424560', 'ELEMENTOS DIDACTICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424564', 'RECURSOS NATURALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424565', 'EQUIPO MEDICOS - CIENTIFICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4248', 'UTILIDAD EN VENTA DE OTROS BIENES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424805', 'INTANGIBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424810', 'BIENES RECIBIDOS EN PAGO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('424815', 'OTROS ACTIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4250', 'RECUPERACIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425005', 'DEUDAS CASTIGADAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('42500501', 'DEUDAS CASTIGADAS', 'C', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425010', 'SEGUROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425015', 'RECLAMOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425020', 'REINTEGRO POR PERSONAL EN COMISION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425025', 'REINTEGRO GARANTIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425030', 'DESCUENTOS CONCEDIDOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425035', 'REINTEGRO PROVISIONES DE INVERSIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425036', 'EINTEGRO PROVISIONES DE CARTERA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425037', 'REINTEGRO PROVISIONES DE CUENTAS POR COBRAR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425038', 'REINTEGRO PROVISIONES DE BIENES RECIBIDOS EN PAGO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425040', 'GASTOS BANCARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425045', 'REINTEGRO DE DEPRECIACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425050', 'REINTEGRO DE OTROS COSTOS Y GASTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('42505001', 'REINTEGRO DE OTROS COSTOS Y GASTOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('425055', 'REINTEGRO PROVISIONES DE CAPITAL GARANTIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4255', 'INDEMNIZACIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425505', 'POR SINIESTRO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('42550501', 'SEGUROS DEL ESTADO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('425510', 'POR SUMINISTROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425515', 'LUCRO CESANTE COMPAÑIAS DE SEGUROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425520', 'DAÑO EMERGENTE COMPAÑIAS DE SEGUROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425525', 'POR PERDIDA DE MERCANCIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425530', 'POR INCUMPLIMIENTO DE CONTRATOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425535', 'DE TERCEROS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425540', 'POR INCAPACIDADES.', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('425595', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4260', 'PARTICIPACIONES EN CONCESIONES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4275', 'DEVOLUCIONES, REBAJAS Y DESCUENTOS EN OTRAS VENTAS (DB)', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4295', 'DIVERSOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429503', 'CERT', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429505', 'APROVECHAMIENTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('42950501', 'APROVECHAMIENTOS                                                                 ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('42950502', 'CERTIFICADOS                                                                     ', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('42950503', 'OTROS INGRESOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('42950504', 'OTROS INGRESOS EN LIBRANZAS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('42950505', 'INCENTIVO EN PAGO PUNTUAL - SINCELEJO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('42950506', 'DEVOLUCIONES DESCUENTOS Y REBAJAS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('42950507', 'OTROS INGRESOS EN CONVENIOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('42950508', 'INCENTIVO PAGO PUNTUAL CARTAGENA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('42950509', 'DESCUENTOS RECIBIDOS EN CUOTAS DE ADMINISTRACION', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('429507', 'AUXILIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429509', 'DONACIONES O SUBVENCIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429511', 'INGRESOS POR INVESTIGACION Y DESARROLLO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429513', 'POR TRABAJOS EJECUTADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429515', 'REGALIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429517', 'DERIVADOS DE LAS EXPORTACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429519', 'OTROS INGRESOS DE EXPLOTACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429521', 'DE LA ACTIVIDAD GANADERA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429525', 'DERECHOS Y LICITACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429530', 'INGRESOS POR ELEMENTOS PERDIDOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429533', 'MULTAS Y RECARGOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429535', 'PREAVISOS DESCONTADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429537', 'RECLAMOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429540', 'RECOBRO DE DAÑOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429543', 'PREMIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429545', 'BONIFICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429547', 'PRODUCTOS DESCONTADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429549', 'RECONOCIMIENTOS  EPS.', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429551', 'EXCEDENTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429553', 'SOBRANTES DE CAJA MENOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429555', 'SOBRANTES EN LIQUIDACION FLETES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429557', 'SUBSIDIOS ESTATALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429559', 'CAPACITACION DISTRIBUIDORES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429561', 'DE ESCRITURACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429563', 'REGISTRO PROMESAS DE VENTA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429567', 'UTILES, PAPELERIA Y FOTOCOPIAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429571', 'RESULTADOS MATRICULAS Y TRASPASOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429573', 'DECORACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429575', 'MANEJO DE CARGA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429579', 'HISTORIA CLINICA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('429581', 'AJUSTE AL PESO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('42958101', 'AJUSTE AL PESO', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('429583', 'LLAMADAS TELEFONICAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('43', 'INGRESOS DE EJERCICIOS ANTERIORES', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('4305', 'INGRESOS DE EJERCICIOS ANTERIORES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5', 'GASTOS', 'D', '1', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51', 'GASTOS DE ADMINISTRACION', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5105', 'GASTOS DE PERSONAL', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510503', 'SALARIO INTEGRAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510506', 'SUELDOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51050601', 'SUELDOS                                                                          ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510512', 'JORNALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510513', 'COMPENSACION ORDINARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510515', 'HORAS EXTRAS Y RECARGOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51051501', 'HORAS EXTRAS Y RECARGOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510516', 'TIEMPO SUPLEMENTARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510518', 'COMISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51051801', 'COMISIONES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510520', 'COMPENSACION VARIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510521', 'VIATICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51052101', 'VIATICOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510524', 'INCAPACIDADES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510527', 'AUXILIO DE TRANSPORTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51052701', 'AUXILIO DE TRANSPORTE                                                            ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510528', 'AYUDA PARA EL TRANSPORTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510530', 'CESANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51053001', 'CESANTIAS                                                                        ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510532', 'COMPENSACION ANUAL DIFERIDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510533', 'INTERESES SOBRE CESANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51053301', 'INTERESES SOBRE CESANTIAS                                                        ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510536', 'PRIMA DE SERVICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51053601', 'PRIMA LEGAL                                                                      ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510537', 'COMPENSACION SEMESTRAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510539', 'VACACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51053901', 'VACACIONES                                                                       ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510540', 'DESCANSO ANUAL COMPENSADO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510542', 'PRIMAS EXTRALEGALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510545', 'AUXILIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510548', 'BONIFICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51054801', 'BONIFICACIONES POR GESTION DE VENTAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51054802', 'BONIFICACIONES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510550', 'COMPENSACION EXTRAORDINARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510551', 'DOTACION Y SUMINISTRO A TRABAJADORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51055101', 'UNIFORMES-DOTACION', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51055102', 'UNIFORMES DOTACIONES - IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510554', 'SEGUROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510557', 'CUOTAS PARTES PENSIONES DE JUBILACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510558', 'AMORTIZACION CALCULO ACTUARIAL PENSIONES DE JUBILACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510559', 'PENSIONES DE JUBILACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510560', 'INDEMNIZACIONES LABORALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51056001', 'INDEMNIZACIONES LABORALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510563', 'CAPACITACION AL PERSONAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51056301', 'CAPACITACION AL PERSONAL', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510566', 'GASTOS DEPORTIVOS Y DE RECREACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510569', 'APORTES SALUD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51056901', 'APORTES SALUD                                                                    ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510570', 'APORTES PENSION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51057001', 'APORTES PENSION                                                                  ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510571', 'APORTES A.R.P.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51057101', 'ARP                                                                              ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510572', 'APORTES CAJAS DE COMPENSACION FAMILIAR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51057201', 'CAJA DE COMPRENSACION FAMILIAR                                                   ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510575', 'APORTES I.C.B.F.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51057501', 'ICBF                                                                             ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510578', 'SENA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51057801', 'SENA                                                                             ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510581', 'APORTES SINDICALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('510584', 'GASTOS MEDICOS Y DROGAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51058401', 'GASTOS MEDICOS Y DROGAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51058402', 'GASTOS MEDICOS Y DROGAS-IVA DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('510595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5110', 'GASTOS  GENERALES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511001', 'HONORARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51100101', 'REVISORIA FISCAL', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100102', 'ASESORÍA TÉCNICA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100103', 'ASESORIA JURIDICA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100104', 'HONORARIOS CONTADOR PUBLICO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100105', 'HONORARIOS -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100190', 'OTROS HONORARIOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511002', 'IMPUESTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51100201', 'IMPUESTOS                                                                        ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100203', 'INDUSTRIA Y COMERCIO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100204', 'IMPUESTO PROHOSPITAL', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100205', 'AVISOS Y TABLEROS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100206', 'SOBRETASA BOMBERIL', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100207', 'SOBRETASA CON DESTINO AL DEPORTE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100210', 'INDUSTRIA Y COMERCIO, AVISOS Y TABLEROS Y SOBRETASA BOMBERIL', 'D', '5', '0', 'I');
INSERT INTO `cn_puc` VALUES ('51100215', 'ESTAMPILLA PROHOSPITAL UNIVERSITARIO CARI E.S.E.', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511004', 'ARRENDAMIENTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51100401', 'BIENES INMUEBLES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100402', 'BIENES INMUEBLE-IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100403', 'CUOTA ADMINISTRACION EDIFICIO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100404', 'ESTUDIO DEL ARRENDAMIENTO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100502', 'POLIZAS JUDICIALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100507', 'SOBRETASA CON DESTINO AL DEPORTE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511006', 'ADMINISTRACION DE BIENES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511008', 'SEGUROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51100801', 'POLIZA SEGURO DE MANEJO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100802', 'POLIZA DE SEGURO DE MANEJO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100803', 'SEGUROS GENERALES POLIZA INFRAESTRUCTURA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51100804', 'SEGURO OBLIGATORIO S.O.A.T. MOTOCICLETAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511010', 'MANTENIMIENTO Y REPARACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51101001', 'MANTENIMIENTO PREVENTIVO EQUIPOS DE OFICINA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51101002', 'MANTENIMIENTO PREVENTIVO-IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51101003', 'MANTENIMIENTO Y REPARACIONES DE VEHICULO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51101004', 'MANTENIMIENTO Y REP VEHICULO IVA-DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511012', 'MEJORAS A BIENES AJENOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511014', 'CUOTAS DE ADMINISTRACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511016', 'REPARACIONES LOCATIVAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51101601', 'REPARACIONES Y ADECUACIONES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511018', 'ASEO Y ELEMENTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51101801', 'ELEMENTOS DE ASEO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51101802', 'ELEMENTOS DE ASEO-IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511020', 'CAFETERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51102001', 'CAFETERIA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51102002', 'AGUA-ASEO-ALCANTARILLADO', 'D', '5', '0', 'I');
INSERT INTO `cn_puc` VALUES ('51102003', 'CAFETERIA-IVA NO DEDUCIBLE-', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511022', 'SERVICIOS PUBLICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51102201', 'ENERGIA ELECTRICA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51102202', 'ENERGIA ELECTRICA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51102203', 'AGUA, ASEO Y ALCANTARILLADO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51102204', 'TELEFONO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51102205', 'TELEFONO-IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511024', 'PORTES, CABLES, FAX Y TELEX', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51102401', 'PORTES CALBES FAX Y TELEX', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511026', 'TRANSPORTE,  FLETES Y ACARREOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51102601', 'TRANSPORTE, FLETES Y ACARREOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51102602', 'TAXIS Y BUSES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511028', 'PAPELERIA Y UTILES DE OFICINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51102801', 'CERTIFICADOS DE CAMARA Y COMERCIO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51102802', 'PAPELERIA Y UTILES VARIOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51102803', 'PAPELERIA Y UTILES DE OFICINA -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511030', 'FOTOCOPIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511032', 'SUMINISTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511034', 'PUBLICIDAD Y PROPAGANDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51103401', 'PUBLICIDAD Y PROPAGANDA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51103402', 'PUBLICIDAD Y PROPAGANDA IVA NO DESCONTABLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511036', 'CONTRIBUCIONES Y AFILIACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51103601', 'TASA DE CONTRIBUCION', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51103602', 'AFILIACIONES VARIAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51103603', 'CAMARA DE COMERCIO DE BARRANQUILLA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51103604', 'ARANCELES JUDICIALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511038', 'GASTOS DE ASAMBLEA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51103801', 'GASTOS DE ASAMBLEA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511040', 'GASTOS DE DIRECTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511042', 'GASTOS DE COMITES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511044', 'REUNIONES Y CONFERENCIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51104401', 'REUNIONES Y CONFERENCIAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51104402', 'REUNIONES Y CONFERENCIA - IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511046', 'GASTOS LEGALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51104601', 'GASTOS LEGALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51104602', 'TRAMITES Y LICENCIAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51104603', 'MULTAS Y SANCIONES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51104604', 'TRAMITES Y LICENCIAS-IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51104605', 'GASTOS LEGALES-IVA DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511048', 'INFORMACION COMERCIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51104801', 'COMISION DE VENDEDORES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51104802', 'OTRAS COMISIONES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511050', 'GASTOS DE  REPRESENTACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51105001', 'GASTOS DE REPRESENTACION', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511052', 'GASTOS DE VIAJES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51105201', 'GASTOS DE VIAJE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51105202', 'TIQUETES AEREOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51105203', 'TIQUETEA AEREOS-IVA NO DEDUCIBLE-', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51105204', 'GASTOS DE VIAJE -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511054', 'SERVICIOS TEMPORALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51105401', 'SERVICIOS TEMPORALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51105402', 'SERVICIOS TEMPORALES-IVA DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511056', 'VIGILANCIA PRIVADA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511058', 'SISTEMATIZACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51105801', 'LICENCIA DE SOFTWARE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51105802', 'ANTIVIRUS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51105803', 'SISTEMATIZACION', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51105804', 'SITEMATIZACION-IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511060', 'CUOTAS DE SOSTENIMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51106001', 'CUOTA DE SOSTENIMIENTO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511062', 'SUSCRIPCIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51106201', 'SUSCRIPCION CODIGO MINDEFENSA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51106202', 'CERTICAMARAS S.A.', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51106203', 'SUSCRIPCION - IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511064', 'AUXILIOS Y DONACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51106401', 'AUXILIOS Y DONACIONES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511066', 'ADECUACION E INSTALACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51106601', 'ADECUACION E INSTALACION', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51106602', 'ADECUACION E INSTALACIONES -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511068', 'ASISTENCIA TÉCNICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51106801', 'ASISTENCIA TECNICA CIFIN', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51106802', 'ASISTENCIA TECNICA CIFIN -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511070', 'GASTOS FONDO DE EDUCACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511072', 'GASTOS FONDOS SOLIDARIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511075', 'GASTOS FONDOS RESERVA TÉCNICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511078', 'GASTOS FONDO BIENESTAR SOCIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51107801', 'GASTOS FONDO DE BIENESTAR SOCIAL', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511080', 'GASTOS OTROS FONDOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51108002', 'GASTOS FONDOS MUTUALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511095', 'GASTOS VARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51109501', 'GASTOS VARIOS                                                                    ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51109502', 'TAXIS Y BUSES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51109503', 'MUEBLES Y ENSERES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51109504', 'EQUIPOS DE OFICINA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51109505', 'SEGUROS DE VIDA COLECTIVO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51109506', 'GASTOS VARIOS -IVA NO DEDUCIBLE-', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('51109507', 'ALOJAMIENTO Y MANUTENCION', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('5115', 'PROVISIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511501', 'INVERSIONES  TITULOS NEGOCIABLES DE DEUDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511502', 'INVERSIONES TITULOS NEGOCIABLES  DE PATICIPACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511503', 'INVERSIONES TITULOS PARA MANTENER HASTA EL VENCIMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511504', 'INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE DEUDA.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511505', 'INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE  PARTICIPACIÓN.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511510', 'CREDITOS COMERCIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511515', 'CREDITOS  CONSUMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51151501', 'CREDITOS DE CONSUMO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511520', 'CREDITOS VIVIENDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511522', 'MICROCREDITOS INMOBILIARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511523', 'MICROCREDITOS EMPRESARIAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511524', 'PROVISION GENERAL DE CARTERA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51152401', 'PROVISION GENERAL DE CARTERA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511525', 'DEUDORES POR VENTA DE BIENES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511528', 'DEUDORES POR PRESTACION DE SERVICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511530', 'CUENTAS POR COBRAR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51153001', 'CUENTAS POR COBRAR', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('511535', 'INVENTARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511540', 'BIENES RECIBIDOS EN PAGO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511545', 'PROPIEDADES PLANTA  Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511550', 'PARA PROTECCIÓN DE SEMOVIENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511555', 'FONDO DE LIQUIDEZ', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511560', 'OTROS ACTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('511565', 'OTRAS  PROVISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51156501', 'OTRAS PROVISIONES-IMPUESTO DE RENTA Y COMPLEMENTARIOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('5120', 'AMORTIZACION Y AGOTAMIENTO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512005', 'INTANGIBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512010', 'CARGOS DIFERIDOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51201001', 'IMPUESTO AL PATRIMONIO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('512015', 'PLANTACIONES AGRÍCOLAS Y FORESTALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512020', 'SEMOVIENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512025', 'RECURSOS NATURALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512095', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5125', 'DEPRECIACIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512515', 'EDIFICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512520', 'MUEBLES Y EQUIPOS DE OFICINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51252001', 'MUEBLES Y EQUIPOS DE OFICINA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('512522', 'EQUIPO MEDICO Y CIENTÍFICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512525', 'EQUIPO DE CÓMPUTO Y COMUNICACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51252501', 'EQUIPOS DE COMPUTO Y COMUNICACIONES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('512528', 'EQUIPO DE HOTELES Y RESTAURANTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512530', 'VEHICULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51253001', 'MOTOCICLETAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('512532', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512535', 'ARMAMENTO DE  VIGILANCIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512540', 'PLANTACIONES AGRÍCOLAS Y FORESTALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512545', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512550', 'MAUSOLEOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512555', 'ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('512560', 'BIENES DE FONDOS SOCIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5140', 'GASTOS FINANCIEROS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514005', 'GASTOS BANCARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51400501 ', 'GRAVAMEN MOVIMIENTO FINANCIERO 4*1000                                                               ', 'D', '5', '0', 'I');
INSERT INTO `cn_puc` VALUES ('51400502', 'GRAVAMEN MOVIMIENTOS FINANCIEROS                                                 ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('514010', 'REAJUSTE MONETARIO    UVR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514015', 'COMISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51401501', 'COMISIONES                                                                       ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('514020', 'INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51402001', 'INTERESES VARIOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('514025', 'DIFERENCIA EN CAMBIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514030', 'GASTOS EN NEGOCIACION CERTIFICADOS DE CAMBIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514035', 'DESCUENTOS COMERCIALES CONDICIONADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514040', 'GASTOS MANEJO Y EMISION DE BONOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514045', 'PRIMA AMORTIZADA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514050', 'PÉRDIDA EN VENTA DE INVERSIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514051', 'PÉRDIDA EN VENTA TITULOS NEGOCIABLES DE DEUDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514052', 'PERDIDA EN VENTA TITULOS NEGOCIABLES  DE PARTICIPACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514053', 'PÉRDIDA EN VENTA TITULOS PARA MANTENER HASTA EL VENCIMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514054', 'PERDIDA EN VENTA EN INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE DEUDA.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514055', 'PERDIDA EN VENTA EN INVERSIONES DISPONIBLE PARA LA VENTA EN TITULOS DE  PARTICIPACIÓN.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('51409501', 'OTROS GASTOS                                                                     ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('5141', 'PERDIDA EN VALORACION INVERSIONES NEGOCIABLES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514105', 'EN TITULOS DE DEUDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514110', 'EN TITULOS PARTICIPATIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5142', 'PERDIDA EN VALORACION DE INVERSIONES DISPONIBLES PARA LA VENTA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514205', 'EN TITULOS DE DEUDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514210', 'EN TITULOS PARTICIPATIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5143', 'PERDIDA EN VALORACION DE INVERSIONES PARA MANTENER HASTA EL VENCIMIENTO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514305', 'EN TITULOS DE DEUDA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('514310', 'EN TITULOS  PARTICIPATIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('52', 'GASTOS  DE VENTAS', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5205', 'GASTOS DE PERSONAL', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520503', 'SALARIO INTEGRAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520506', 'SUELDOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520512', 'JORNALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520513', 'COMPENSACION ORDINARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520515', 'HORAS EXTRAS Y RECARGOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520516', 'TIEMPO SUPLEMENTARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520518', 'COMISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520520', 'COMPENSACION VARIABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520521', 'VIATICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520524', 'INCAPACIDADES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520527', 'AUXILIO DE TRANSPORTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520528', 'AYUDA AL TRANSPORTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520530', 'CESANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520532', 'COMPENSACION ANUAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520533', 'INTERESES SOBRE CESANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520536', 'PRIMA DE SERVICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520537', 'COMPENSACION SEMESTRAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520539', 'VACACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520540', 'DESCANSO ANUAL COMPENSADO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520542', 'PRIMAS EXTRALEGALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520545', 'AUXILIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520548', 'BONIFICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520550', 'COMPENSACION EXTRAORDINARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520551', 'DOTACION Y SUMINISTRO A TRABAJADORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520554', 'SEGUROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520557', 'CUOTAS PARTES PENSIONES DE JUBILACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520558', 'AMORTIZACION CALCULO ACTUARIAL PENSIONES DE JUBILACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520559', 'PENSIONES DE JUBILACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520560', 'INDEMNIZACIONES LABORALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520563', 'CAPACITACION AL PERSONAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520566', 'GASTOS DEPORTIVOS Y DE RECREACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520569', 'APORTES SALUD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520570', 'APORTES PENSION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520571', 'APORTES A.R.P.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520572', 'APORTES CAJAS DE COMPENSACION FAMILIAR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520575', 'APORTES I.C.B.F.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520578', 'SENA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520581', 'APORTES SINDICALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520584', 'GASTOS MEDICOS Y DROGAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('520595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5210', 'HONORARIOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521005', 'JUNTA DIRECTIVA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521010', 'REVISORIA FISCAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521015', 'AUDITORIA EXTERNA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521020', 'AVALUOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521025', 'ASESORIA JURIDICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521030', 'ASESORIA FINANCIERA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521035', 'ASESORIA TECNICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5215', 'IMPUESTOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521505', 'INDUSTRIA Y COMERCIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('52150501', 'INDUSTRIA Y COMERCIO                                                             ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('521510', 'DE TIMBRES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521515', 'A LA PROPIEDAD RAIZ', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521520', 'DERECHOS SOBRE INSTRUMENTOS PUBLICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521525', 'DE VALORIZACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521530', 'DE TURISMO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521535', 'TASA POR UTILIZACION DE PUERTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521540', 'DE VEHICULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521545', 'DE ESPECTACULOS PUBLICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521550', 'CUOTAS DE FOMENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521555', 'LICORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521560', 'CERVEZAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521565', 'CIGARRILLOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521570', 'IVA DESCONTABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521575', '3X1000', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('521595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('52159501', 'ESTAMPILLA PRO-HOSPITAL                                                          ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('52159502', 'AVISOS Y TABLEROS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('52159503', 'SOBRETASA BOMBERIL', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('5220', 'ARRENDAMIENTOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522005', 'TERRENOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522010', 'EDIFICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522015', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522020', 'MUEBLES Y EQUIPO DE OFICINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522025', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522030', 'ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522035', 'EQUIPO DE HOTELES Y RESTAURANTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522040', 'MAUSOLEOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522045', 'VEHICULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522050', 'EQUIPOS MEDICOS - CIENTIFICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522060', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522065', 'SEMOVIENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522070', 'ARMAMENTO DE VIGILANCIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522075', 'BIENES DE FONDOS SOCIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5225', 'CONTRIBUCIONES Y AFILIACIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522505', 'CONTRIBUCIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('522510', 'AFILIACIONES Y SOSTENIMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5230', 'SEGUROS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523005', 'MANEJO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523010', 'CUMPLIMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523015', 'CORRIENTE DEBIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523020', 'VIDA COLECTIVA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523025', 'INCENDIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523030', 'TERREMOTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523035', 'SUSTRACCION Y HURTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523040', 'VEHICULO - RODAMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523045', 'RESPONSABILIDAD CIVIL Y EXTRACONTRACTUAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523050', 'ROTURA DE MAQUINARIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523055', 'OBLIGATORIO ACCIDENTE DE TRANSITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523060', 'LUCRO CESANTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5235', 'SERVICIOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523505', 'ASEO Y VIGILANCIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523510', 'TEMPORALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523515', 'ASISTENCIA TECNICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('52351501', 'ASISTENCIA TECNICA CIFIN', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523520', 'PROCESAMIENTO ELECTRONICO DE DATOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523525', 'ACUEDUCTO Y ALCANTARILLADO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523530', 'ENERGIA ELECTRICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523535', 'TELEFONO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523540', 'CORREO, PORTES Y TELEGRAMAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523545', 'FAX Y TELEX', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523550', 'TRANSPORTE, FLETES Y ACARREOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523555', 'GAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523560', 'PUBLICIDAD, PROPAGANDA Y PROMOCION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('523595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5240', 'GASTOS LEGALES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524005', 'NOTARIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524010', 'REGISTRO MERCANTIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524015', 'TRAMITES Y LICENCIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524020', 'ADUANEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524025', 'CONSULARES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5245', 'MANTENIMIENTO Y REPARACIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524505', 'TERRENOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524510', 'EDIFICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524515', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524520', 'MUEBLES Y EQUIPO DE OFICINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524525', 'EQUIPO DE COMPUTACION Y COMUNICACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524530', 'ELEMENTOS DIDACTICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524535', 'VEHICULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524540', 'MAUSOLEOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524545', 'BIENES FONDOS SOCIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524550', 'ARMAMENTO DE VIGILANCIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('524555', 'VIAS DE COMUNICACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5250', 'ADECUACION E INSTALACION', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('525005', 'INSTALACIONES ELECTRICAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('525010', 'ARREGLOS ORNAMENTALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('525015', 'REPARACIONES LOCATIVAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('525095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5255', 'GASTOS DE VIAJE', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('525505', 'ALOJAMIENTO Y MANUTENCION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('525510', 'PASAJES FLUVIALES Y/O MARITIMOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('525515', 'PASAJES AEREOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('52551501', 'PASAJES AEREOS', 'D', '5', '1', 'A');
INSERT INTO `cn_puc` VALUES ('525520', 'PASAJES TERRESTRES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('525525', 'PASAJES FERREOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('525595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5260', 'DEPRECIACIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526005', 'EDIFICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526010', 'EQUIPO DE HOTELES Y RESTAURANTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526015', 'MUEBLES Y EQUIPOS DE OFICINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526020', 'EQUIPO DE COMPUTO Y COMUNICACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526025', 'VEHICULOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526030', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526035', 'EQUIPOS MEDICOS  - CIENTIFICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526040', 'ARMAMENTO DE  VIGILANCIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526045', 'MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526050', 'MAUSOLEOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526055', 'ELEMENTOS DIDÁCTICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526060', 'BIENES DE FONDOS SOCIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5265', 'AMORTIZACIONES Y AGOTAMIENTO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526505', 'RECURSOS NATURALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526510', 'SEMOVIENTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526515', 'INTANGIBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526520', 'CARGOS DIFERIDOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('526595', 'OTRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5295', 'DIVERSOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529505', 'COMISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('52950501', 'COMISIONES DE VENTAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('52950503', 'PAGADURIAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('529510', 'LIBROS, SUSCRIPCIONES, PERIODICOS Y REVISTAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529515', 'MUSICA AMBIENTAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529520', 'GASTOS DE REPRESENTACION Y RELACIONES PUBLICAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529525', 'ELEMENTOS DE ASEO Y CAFETERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529530', 'UTILES, PAPELERIA Y FOTOCOPIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529535', 'COMBUSTIBLES Y LUBRICANTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529540', 'ENVASES Y EMPAQUES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529545', 'TAXIS Y BUSES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529550', 'ESTAMPILLAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529555', 'MICROFILMACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529560', 'CASINO Y RESTAURANTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529562', 'GASTOS REUNIONES Y CONFERENCIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529565', 'PARQUEADEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529570', 'INDEMNIZACION POR DAÑOS A TERCEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529575', 'POLVORA Y SIMILARES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('52959504', 'OTRAS COMISIONES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('5299', 'PROVISIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529905', 'INVERSIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529910', 'INVENTARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529915', 'BIENES RECIBIDOS EN PAGO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529920', 'CARTERA POR VENTA DE BIENES Y SERVICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529925', 'CUENTAS POR COBRAR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529930', 'PROPIEDADES, PLANTA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('529995', 'OTROS ACTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('53', 'GASTOS NO OPERACIONALES', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5305', 'GASTOS FINANCIEROS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('530505', 'GASTOS BANCARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('530510', 'REAJUSTE MONETARIO    UVR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('530515', 'COMISIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('530520', 'INTERESES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('530525', 'DIFERENCIA EN CAMBIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('530530', 'GASTOS EN NEGOCIACION CERTIFICADOS DE CAMBIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('530535', 'DESCUENTOS COMERCIALES CONDICIONADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('53053501', 'DESCUENTOS COMERCIALES ASOCIADOS                                                 ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('530540', 'GASTOS MANEJO Y EMISION DE BONOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('530545', 'PRIMA AMORTIZADA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('530550', 'IMPUESTO 3X1000', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('530595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5310', 'PERDIDA EN VENTA Y RETIRO DE BIENES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('531005', 'VENTA DE INVERSIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('531010', 'VENTA DE CARTERA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('53101001', 'VENTA DE CARTERA                                                                 ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('531015', 'VENTA DE PROPIEDADES PLANTA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('531020', 'VENTA DE INTANGIBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('531025', 'VENTA DE OTROS ACTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('531027', 'RETIRO DE INVENTARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('531030', 'RETIRO DE PROPIEDADES PLANTA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('531035', 'RETIRO DE OTROS ACTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('531040', 'PERDIDAS POR SINIESTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('53104001', 'PERDIDA EN EFECTIVO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53104002', 'PERDIDA POR SINIESTRO FRAUDE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('531095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5315', 'GASTOS EXTRAORDINARIOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('531505', 'COSTAS Y PROCESOS JUDICIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('531510', 'ACTIVIDADES CULTURALES Y CIVICAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('53151001', 'ACTIVIDADES CULTURALES Y CIVICAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53151002', 'ACTIVIDADES CULTURALES Y CIVICAS-IVA NO DEDUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('531520', 'IMPUESTOS ASUMIDOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('53152001', 'IMPUESTOS ASUMIDOS RETENCION CREE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('531595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5395', 'GASTOS DIVERSOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539505', 'DEMANDAS LABORALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539510', 'DEMANDAS POR INCUMPLIMIENTO DE CONTRATOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539515', 'INDEMNIZACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539520', 'MULTAS, SANCIONES Y LITIGIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('53952001', 'SANCIONES IMPUESTOS MUNICIPALES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53952002', 'MULTAS, SANCIONES SUPERSOLIDARIA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53952003', 'MULTAS SECRETARIA DISTRITAL DE MOVILIDAD', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53952004', 'MULTAS - IVA DEUCIBLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('539525', 'INTERESES SOBRE MULTAS, SANCIONES Y LITIGIOS.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('53952501', 'INTERESES SOBRE MULTAS, SANCIONES Y LITIGIOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('539530', 'DONACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539535', 'CONSTITUCION DE GARANTIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539540', 'AMORTIZACION DE BIENES ENTREGADOS EN COMODATO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539545', 'GASTOS DE DIRECTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539550', 'REUNIONES Y CONFERENCIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539555', 'ARRENDAMIENTOS Y ALQUILERES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('539595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('53959501', 'ADECUACIONES FESTIVAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53959503', 'IMPUESTOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53959510', 'AJUSTE AL PESO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53959511', 'GASTOS DE VIAJE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53959514', 'CASINO Y RESTAURANTE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53959515', 'GASTOS ASUMIDOS RETEFUENTE VENDEDORES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53959520', 'OTROS GASTOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53959521', 'GASTOS ASUMIDOS SALDOS EN LIBRANZAS                                              ', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('53959522', 'IMPUESTOS SINCELEJO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('54', 'GASTOS EJERCICIOS ANTERIORES', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5405', 'GASTOS EJERCICIOS ANTERIORES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('540505', 'GASTOS EJERCICIOS ANTERIORES', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('54050501', 'GASTOS EJERCICIOS ANTERIORES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('58', 'IM PUESTO DE  RENTA Y COMPLEMENTARIOS', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5805', 'IM PUESTO DE  RENTA Y COMPLEMENTARIOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('580505', 'IMPUESTO DE RENTA Y COMPLEMENTARIOS', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('58050501', 'IMPUESTO DE RENTA Y COMPLEMENTARIOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('59', 'EXCEDENTES Y/O PÉRDIDAS', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('5905', 'EXCEDENTES Y/O PÉRDIDAS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('590505', 'EXCEDENTES Y/O PÈRDIDAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('59050501', 'EXCEDENTES Y/O PERDIDAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('6', 'COSTOS DE VENTAS', 'D', '1', '1', 'A');
INSERT INTO `cn_puc` VALUES ('61', 'COSTO DE VENTAS Y DE PRESTACION DE SERVICIOS', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6105', 'AGRICULTURA, GANADERIA, CAZA Y SILVICULTURA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610505', 'CULTIVO DE CEREALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610510', 'CULTIVOS DE HORTALIZAS, LEGUMBRES Y PLANTAS ORNAMENTALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610515', 'CULTIVOS DE FRUTAS, NUECES Y PLANTAS AROMATICAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610520', 'CULTIVO DE CAFE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610525', 'CULTIVO DE FLORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610530', 'CULTIVO DE CAÑA DE AZUCAR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610535', 'CULTIVO DE ALGODON Y PLANTAS PARA MATERIAL TEXTIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610540', 'CULTIVO DE BANANO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610545', 'OTROS CULTIVOS AGRICOLAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610550', 'CRIA DE OVEJAS, CABRAS, ASNOS, MULAS Y BURDEGANOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610555', 'CRIA DE GANADO CABALLAR Y VACUNO.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610560', 'PRODUCCION AVICOLA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610565', 'CRIA DE OTROS ANIMALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610570', 'SERVICIOS AGRICOLAS Y GANADEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610575', 'ACTIVIDAD DE CAZA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('610580', 'ACTIVIDAD DE SILVICULTURA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6110', 'PESCA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611005', 'ACTIVIDAD DE PESCA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611010', 'EXPLOTACION DE CRIADEROS DE PECES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611095', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6115', 'EXPLOTACION DE MINAS Y CANTERAS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611505', 'CARBON', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611510', 'PETROLEO CRUDO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611512', 'GAS NATURAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611514', 'SERVICIOS RELACIONADOS CON EXTRACCION DE PETROLEO Y GAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611515', 'MINERALES DE HIERRO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611520', 'MINERALES METALIFEROS NO FERROSOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611525', 'PIEDRA, ARENA Y ARCILLA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611527', 'PIEDRAS PRECIOSAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611528', 'ORO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611530', 'OTRAS MINAS Y CANTERAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611532', 'PRESTACION DE SERVICIOS SECTOR MINERO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('611595', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6120', 'INDUSTRIAS MANUFACTURERAS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612001', 'PRODUCCION Y PROCESAMIENTO DE CARNES Y PRODUCTOS CARNICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612002', 'PRODUCTOS DE PESCADO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612003', 'PRODUCTOS DE FRUTAS, LEGUMBRES Y HORTALIZAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612004', 'ELABORACION DE ACEITES Y GRASAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612005', 'ELABORACION DE PRODUCTOS LACTEOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612006', 'ELABORACION DE PRODUCTOS DE MOLINERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612007', 'ELABORACION DE ALMIDONES Y DERIVADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612008', 'ELABORACION DE ALIMENTOS PARA ANIMALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612009', 'ELABORACION DE PRODUCTOS PARA PANADERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612010', 'ELABORACION DE AZUCAR Y MELAZAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612011', 'ELABORACION DE CACAO, CHOCOLATE Y CONFITERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612012', 'ELABORACION DE PASTAS  Y PRODUCTOS FARINACEOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612013', 'ELABORACION DE PRODUCTOS DE CAFE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612014', 'ELABORACION DE OTROS PRODUCTOS ALIMENTICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612015', 'ELABORACION DE BEBIDAS ALCOHOLICAS Y ALCOHOL ETILICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612016', 'ELABORACION DE VINOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612017', 'ELABORACION DE BEBIDAS MALTEADAS Y DE MALTA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612018', 'ELABORACION DE BEBIDAS NO ALCOHOLICAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612019', 'ELABORACION DE PRODUCTOS DE TABACO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612020', 'PREPARACION E HILATURA DE FIBRAS TEXTILES Y TEJEDURIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612021', 'ACABADO DE PRODUCTOS TEXTILES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612022', 'ELABORACION DE ARTICULOS DE MATERIALES TEXTILES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612023', 'ELABORACION DE TAPICES Y ALFOMBRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612024', 'ELABORACION DE CUERDAS, CORDELES, BRAMANTES Y REDES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612025', 'ELABORACION DE OTROS PRODUCTOS TEXTILES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612026', 'ELABORACION DE TEJIDOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612027', 'ELABORACION DE PRENDAS DE VESTIR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612028', 'PREPARACION, ADOBO Y TEÑIDO DE PIELES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612029', 'CURTIDO, ADOBO O PREPARACION DE CUERO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612030', 'ELABORACION DE MALETAS, BOLSOS Y SIMILARES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612031', 'ELABORACION DE CALZADO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612032', 'PRODUCCION DE MADERA, ARTICULOS DE MADERA Y CORCHO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612033', 'ELABORACION DE PASTA Y PRODUCTOS DE MADERA, PAPEL Y CARTON', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612034', 'EDICIONES Y PUBLICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612035', 'IMPRESION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612036', 'SERVICIOS RELACIONADOS CON LA EDICION Y LA IMPRESION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612037', 'REPRODUCCION DE GRABACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612038', 'ELABORACION DE PRODUCTOS DE HORNO DE COQUE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612039', 'ELABORACION DE PRODUCTOS DE LA REFINACION DE PETROLEO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612040', 'ELABORACION DE SUSTANCIAS QUIMICAS BASICAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612041', 'ELABORACION DE ABONOS Y COMPUESTOS DE NITROGENO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612042', 'ELABORACION DE PLASTICO Y CAUCHO SINTETICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612043', 'ELABORACION DE PRODUCTOS QUIMICOS DE USO AGROPECUARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612044', 'ELABORACION DE PINTURAS, TINTAS Y MASILLAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612045', 'ELABORACION DE PRODUCTOS FARMACEUTICOS Y BOTANICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612046', 'ELABORACION DE JABONES, DETERGENTES Y PREPARADOS DE TOCADOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612047', 'ELABORACION DE OTROS PRODUCTOS QUIMICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612048', 'ELABORACION DE FIBRAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612049', 'ELABORACION DE OTROS PRODUCTOS DE CAUCHO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612050', 'ELABORACION DE PRODUCTOS DE PLASTICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612051', 'ELABORACION DE VIDRIO Y PRODUCTOS DE VIDRIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612052', 'ELABORACION DE PRODUCTOS DE CERAMICA, LOZA, PIEDRA, ARCILLA Y PORCELANA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612053', 'ELABORACION DE CEMENTO, CAL Y YESO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612054', 'ELABORACION DE ARTICULOS DE HORMIGON, CEMENTO Y YESO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612055', 'CORTE, TALLADO Y ACABADO DE LA PIEDRA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612056', 'ELABORACION DE OTROS PRODUCTOS MINERALES NO METALICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612057', 'INDUSTRIAS BASICAS Y FUNDICION DE HIERRO Y ACERO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612058', 'PRODUCTOS PRIMARIOS DE METALES PRECIOSOS Y DE METALES NO  FERROSOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612059', 'FUNDICION DE METALES NO FERROSOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612060', 'FABRICACION DE PRODUCTOS METALICOS PARA USO ESTRUCTURAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612061', 'FORJA, PRENSADO, ESTAMPADO, LAMINADO DE METAL YPULVIMETALURGIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612062', 'REVESTIMIENTO DE METALES Y OBRAS DE INGENIERIA MECANICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612063', 'FABRICACION DE ARTICULOS DE FERRETERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612064', 'ELABORACION DE OTROS PRODUCTOS DE METAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612065', 'FABRICACION DE MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612066', 'FABRICACION DE EQUIPOS DE ELEVACION Y MANIPULACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612067', 'ELABORACION DE APARATOS DE USO DOMESTICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612068', 'ELABORACION DE EQUIPO DE OFICINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612069', 'ELABORACION DE PILAS Y BATERIAS PRIMARIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612070', 'ELABORACION DE EQUIPO DE ILUMINACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612071', 'ELABORACION DE OTROS TIPOS DE EQUIPO ELECTRICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612072', 'FABRICACION DE EQUIPOS DE RADIO, TELEVISION Y COMUNICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612073', 'FABRICACION DE APARATOS E INSTRUMENTOS MEDICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612074', 'FABRICACION DE INSTRUMENTOS DE MEDICION Y CONTROL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612075', 'FABRICACION DE INSTRUMENTOS DE OPTICA Y EQUIPO FOTOGRAFICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612076', 'FABRICACION DE RELOJES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612077', 'FABRICACION DE VEHICULOS AUTOMOTORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612078', 'FABRICACION DE CARROCERIAS PARA AUTOMOTORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612079', 'FABRICACION DE PARTES PIEZAS Y ACCESORIOS PARA AUTOMOTORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612080', 'FABRICACION Y REPARACION DE BUQUES Y OTRAS EMBARCACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612081', 'FABRICACION DE LOCOMOTORAS Y MATERIAL RODANTE PARA  FERROCARRILES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612082', 'FABRICACION DE AERONAVES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612083', 'FABRICACION DE MOTOCICLETAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612084', 'FABRICACION DE BICICLETAS Y SILLAS DE RUEDAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612085', 'FABRICACION DE OTROS TIPOS DE TRANSPORTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612086', 'FABRICACION DE MUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612087', 'FABRICACION DE JOYAS Y ARTICULOS CONEXOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612088', 'FABRICACION DE INSTRUMENTOS DE MUSICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612089', 'FABRICACION DE ARTICULOS Y EQUIPO PARA DEPORTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612090', 'FABRICACION DE JUEGOS Y JUGUETES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612091', 'RECICLAMIENTO DE DESPERDICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612095', 'PRODUCTOS DE OTRAS INDUSTRIAS MANUFACTURERAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6125', 'SUMINISTRO DE ELECTRICIDAD, GAS Y AGUA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612505', 'GENERACION, CAPTACION Y DISTRIBUCION DE ENERGIA ELECTRICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612510', 'FABRICACION DE GAS Y DISTRIBUCION DE COMBUSTIBLES GASEOSOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612515', 'CAPTACION, DEPURACION Y DISTRIBUCION DE AGUA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('612595', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6130', 'CONSTRUCCION', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613005', 'PREPARACION DE TERRENOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613010', 'CONSTRUCCION DE EDIFICIOS Y OBRAS DE INGENIERIA CIVIL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613015', 'ACONDICIONAMIENTO DE EDIFICIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613020', 'TERMINACION DE EDIFICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613025', 'ALQUILER DE EQUIPO CON OPERARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613095', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6135', 'COMERCIO AL POR MAYOR Y AL POR MENOR', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613502', 'VENTA DE VEHICULOS AUTOMOTORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613504', 'MANTENIMIENTO, REPARACION Y LAVADO DE VEHICULOS AUTOMOTORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613506', 'VENTA DE PARTES, PIEZAS Y ACCESORIOS DE VEHICULOS AUTOMOTORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613508', 'VENTA DE COMBUSTIBLES SÓLIDOS, LIQUIDOS, GASEOSOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613510', 'VENTA DE LUBRICANTES, ADITIVOS, LLANTAS Y LUJOS PARA AUTOMOTORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613512', 'VENTA A CAMBIO DE RETRIBUCION O POR CONTRATA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613514', 'VENTA DE INSUMOS, MATERIAS PRIMAS AGROPECUARIAS Y FLORES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613516', 'VENTA DE OTROS INSUMOS Y MATERIAS PRIMAS NO AGROPECUARIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613518', 'VENTA DE ANIMALES VIVOS Y CUEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613520', 'VENTA DE PRODUCTOS EN ALMACENES NO ESPECIALIZADOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613522', 'VENTA DE PRODUCTOS AGROPECUARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613524', 'VENTA DE PRODUCTOS TEXTILES, DE VESTIR, DE CUERO Y CALZADO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613526', 'VENTA DE PAPEL Y CARTON', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613528', 'VENTA DE LIBROS, REVISTAS, ELEMENTOS DE PAPELERIA, UTILES Y TEXTOS  ESCOLARES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613530', 'VENTA DE JUEGOS, JUGUETES Y ARTICULOS DEPORTIVOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613532', 'VENTA DE INSTRUMENTOS QUIRURGICOS Y ORTOPEDICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613534', 'VENTA DE ARTICULOS EN RELOJERIAS Y JOYERIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613536', 'VENTA DE ELECTRODOMESTICOS Y MUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613538', 'VENTA DE PRODUCTOS DE ASEO, FARMACEUTICOS, MEDICINALES, Y ARTICULOS DE TOCADOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613540', 'VENTA DE CUBIERTOS, VAJILLAS, CRISTALERIA, PORCELANAS, CERAMICAS Y OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613542', 'VENTA DE MATERIALES DE CONSTRUCCION, FONTANERIA Y CALEFACCIÓN.', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613544', 'VENTA DE PINTURAS Y LACAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613546', 'VENTA DE PRODUCTOS DE VIDRIOS Y MARQUETERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613548', 'VENTA DE HERRAMIENTAS Y ARTICULOS DE FERRETERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613550', 'VENTA DE QUIMICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613552', 'VENTA DE PRODUCTOS INTERMEDIOS, DESPERDICIOS Y DESECHOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613554', 'VENTA DE MAQUINARIA, EQUIPO DE OFICINA Y PROGRAMAS DE COMPUTADOR', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613556', 'VENTA DE ARTICULOS EN CACHARRERIAS Y MISCELANEAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613558', 'VENTA DE INSTRUMENTOS MUSICALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613560', 'VENTA DE ARTICULOS EN CASAS DE EMPEÑO Y PRENDERIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613562', 'VENTA DE EQUIPO FOTOGRAFICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613564', 'VENTA DE EQUIPO OPTICO Y DE PRECISION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613566', 'VENTA DE EMPAQUES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613568', 'VENTA DE EQUIPO PROFESIONAL Y CIENTIFICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613572', 'REPARACION DE EFECTOS PERSONALES Y ELECTRODOMESTICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('613595', 'VENTA DE OTROS PRODUCTOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6140', 'HOTELES Y RESTAURANTES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614005', 'HOTELERIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614010', 'CAMPAMENTO Y OTROS TIPOS DE HOSPEDAJE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614015', 'RESTAURANTES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614020', 'BARES Y CANTINAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614095', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6145', 'TRANSPORTE, ALMACENAMIENTO Y COMUNICACIONES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614505', 'SERVICIO DE TRANSPORTE POR CARRETERA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614510', 'SERVICIO DE TRANSPORTE POR VIA FERREA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614515', 'SERVICIO DE TRANSPORTE POR VIA ACUATICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614520', 'SERVICIO DE TRANSPORTE POR VIA AEREA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614525', 'SERVICIO DE TRANSPORTE POR TUBERIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614530', 'MANIPULACION DE CARGA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614535', 'ALMACENAMIENTO Y DEPÓSITO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614540', 'SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614545', 'AGENCIAS DE VIAJE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614550', 'OTRAS AGENCIAS DE TRANSPORTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614555', 'SERVICIO POSTAL Y DE CORREO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614560', 'SERVICIO TELEFONICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614565', 'SERVICIO DE TELEGRAFO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614570', 'SERVICIO DE TRANSMISION DE DATOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614575', 'SERVICIO DE RADIO Y TELEVISION POR CABLE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614580', 'TRANSMISION DE SONIDO E IMAGENES POR CONTRATO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('614595', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6150', 'ACTIVIDAD FINANCIERA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615005', 'INTERESES DEPOSITOS DE AHORRO ORDINARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615010', 'INTERESES DEPOSITOS DE AHORRO A TÉRMINO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615015', 'INTERESES AHORRO CONTRACTUAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615020', 'INTERESES AHORRO PERMANENTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615035', 'CONTRIBUCION EMERGENCIA  ECONOMICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615040', 'DIFERENCIA EN CAMBIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615045', 'PACTO DE REAJUSTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615050', 'INTERESES COMPROMISOS DE RECOMPRA INVERSIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615055', 'INTERESES COMPROMISOS DE RECOMPRA DE CARTERA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615060', 'INTERESES DE CREDITOS BANCARIOS Y FINANCIEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615095', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6155', 'ACTIVIDADES INMOBILIARIAS, EMPRESARIALES Y DE ALQUILER', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615505', 'ARRENDAMIENTOS DE BIENES INMUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615510', 'INMOBILIARIAS POR RETRIBUCION O CONTRATA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615515', 'ALQUILER EQUIPO DE TRANSPORTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615520', 'ALQUILER MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615525', 'ALQUILER DE EFECTOS PERSONALES Y ENSERES DOMESTICOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615530', 'CONSULTORIA EN EQUIPO Y PROGRAMAS DE INFORMATICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615535', 'PROCESAMIENTO DE DATOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615540', 'MANTENIMIENTO Y REPARACION DE MAQUINARIA DE OFICINA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615545', 'INVESTIGACIONES CIENTIFICAS Y DE DESARROLLO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615550', 'ACTIVIDADES EMPRESARIALES DE CONSULTORIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615555', 'PUBLICIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615560', 'DOTACION DE PERSONAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615565', 'INVESTIGACION Y SEGURIDAD', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615570', 'LIMPIEZA DE INMUEBLES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615575', 'FOTOGRAFIA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615580', 'ENVASE Y EMPAQUE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615585', 'FOTOCOPIADO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615590', 'MANTENIMIENTO Y REPARACION DE MAQUINARIA Y EQUIPO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('615595', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6160', 'ENSEÑANZA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616005', 'ACTIVIDADES RELACIONADAS CON LA EDUCACIÓN', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616010', 'CERTIFICACIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616015', 'FORMULARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616020', 'VALOR DE DERECHOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616025', 'PAZ Y SALVO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616095', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6165', 'SERVICIOS SOCIALES Y DE SALUD', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616505', 'SERVICIO HOSPITALARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616510', 'SERVICIO MEDICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616515', 'SERVICIO ODONTOLOGICO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616520', 'SERVICIO DE LABORATORIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616525', 'ACTIVIDADES VETERINARIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616530', 'ACTIVIDADES DE SERVICIOS SOCIALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('616595', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6170', 'OTRAS ACTIVIDADES DE SERVICIOS COMUNES, SOCIALES Y PERSONALES', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617005', 'ELIMINACION DE DESPERDICIOS Y AGUAS RESIDUALES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617010', 'ACTIVIDADES DE ASOCIACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617015', 'PRODUCCION Y DISTRIBUCION DE FILMES Y VIDEOCINTAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617020', 'EXHIBICION DE FILMES Y VIDEOCINTAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617025', 'ACTIVIDAD DE RADIO Y TELEVISION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617030', 'ACTIVIDAD TEATRAL, MUSICAL Y ARTISTICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617035', 'GRABACION Y PRODUCCION DE DISCOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617040', 'ENTRETENIMIENTO Y ESPARCIMIENTO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617045', 'AGENCIAS DE NOTICIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617050', 'LAVANDERIAS Y SIMILARES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617055', 'PELUQUERIAS Y SIMILARES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617060', 'SERVICIOS FUNERARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617062', 'VIGILANCIA Y SEGURIDAD PRIVADA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617065', 'ZONAS FRANCAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617070', 'SERVICIOS DE ASISTENCIA TÉCNICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617072', 'SERVICIO DE SISTEMAS  Y COMPUTACION', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617075', 'SERVICIO DE ASESORIAS EN GENERAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617080', 'SERVICIO DE REVISORIAS Y AUDITORIAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617085', 'SERVICIO DE ASESORIA JURÍDICA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617090', 'SERVICIOS VARIOS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617095', 'ACTIVIDADES CONEXAS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6175', 'SERVICIO  DE CREDITO', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617505', 'INTERESES DEPOSITOS DE AHORRO ORDINARIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617510', 'INTERESES CERTIFICADOS DE DEPOSITOS DE AHORRO A TÉRMINO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617515', 'INTERESES AHORRO CONTRACTUAL', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617520', 'INTERESES AHORRO PERMANENTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617525', 'INTERESES COMROMISOS DE RECOMRA INVERSIONES', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617530', 'INTERESES COMROMISOS DE RECOMPRA DE CARTERA', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617535', 'IMPUESTO 3x1000', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617540', 'DIFERENCIA EN CAMBIO', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617545', 'PACTO DE REAJUSTE', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('617550', 'INTERESES CREDITOS BANCARIOS Y FINANCIEROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('61755001', 'INTERESES CREDITOS BANCARIOS Y FINANCIEROS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('61755002', 'INTERESES DE MORA CREDITOS BANCARIOS Y FINANCIEROS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('617595', 'OTROS', 'D', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('61759501', 'OTROS INTERESES SERVICIOS DE CREDITO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('62', 'COMPRAS', 'D', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6205', 'DE MERCANCIAS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6210', 'DE MATERIAS PRIMAS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6215', 'DE MATERIALES INDIRECTOS', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6220', 'COMPRA DE ENERGIA', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('6225', 'DEVOLUCIONES REBAJAS Y DESCUENTOS EN COMPRAS (CR)', 'D', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('7', 'COSTOS DE PRODUCCION O DE OPERACION', 'C', '1', '1', 'A');
INSERT INTO `cn_puc` VALUES ('71', 'MATERIA PRIMA', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('72', 'MANO DE OBRA DIRECTA', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('73', 'COSTOS INDIRECTOS', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('74', 'CONTRATOS DE SERVICIOS', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8', 'CUENTAS DE ORDEN DEUDORAS', 'C', '1', '1', 'A');
INSERT INTO `cn_puc` VALUES ('81', 'DEUDORAS CONTINGENTES', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8105', 'BIENES Y VALORES ENTREGADOS EN CUSTODIA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('810505', 'BIENES MUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('810510', 'VALORES MOBILIARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('810595', 'OTROS BIENES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8110', 'BIENES Y VALORES ENTREGADOS EN GARANTIA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('811005', 'BIENES INMUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('811010', 'VALORES MOBILIARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('811020', 'OTROS BIENES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8112', 'BIENES Y VALORES EN PODER  DE TERCEROS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('811205', 'EN ARRENDAMIENTO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('811210', 'EN PRÉSTAMOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('811215', 'EN DEPÓSITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('811220', 'EN CONSIGNACIÓN', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8115', 'LITIGIOS Y/O DEMANDAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('811505', 'LITIGIOS Y/O DEMANDAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('81150501', 'LITIGIOS Y/O DEMANDAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('8120', 'INTERESES CARTERA DE CREDITO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('812020', 'CATEGORIA C RIESGO APRECIABLE, VIVIENDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('812022', 'CATEGORIA D RIESGO SIGNIFICATIVO, VIVIENDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('812024', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, VIVIENDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('812026', 'CATEGORIA C RIESGO APRECIABLE, CONSUMO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('81202601', 'CATEGORIA C RIESGO APRECIABLE', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('812028', 'CATEGORIA D RIESGO SIGNIFICATIVO, CONSUMO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('81202801', 'CATEGORIA D RIESGO SIGNIFICATIVO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('812030', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, CONSUMO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('81203001', 'CATEGORIA E RIESGO DE INCOBRABILIDAD', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('812032', 'CATEGORIA C RIESGO APRECIABLE, MICROCREDITOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('812034', 'CATEGORIA D RIESGO SIGNIFICATIVO, MICROCREDITOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('812036', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, MICROCREDITOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('812038', 'CATEGORIA C RIESGO APRECIABLE, COMERCIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('812040', 'CATEGORIA D RIESGO SIGNIFICATIVO, COMERCIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('812042', 'CATEGORIA E RIESGO DE INCOBRABILIDAD, COMERCIAL', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8125', 'BIENES Y VALORES EN ADMINISTRACION', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8185', 'OTRAS DEUDORAS CONTINGENTES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('818505', 'BIENES ADQUIRIDOS POR RECIBIR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('818510', 'VALORES ADQUIRIDOS POR RECIBIR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('818595', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('83', 'DEUDORAS DE CONTROL', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8305', 'CREDITOS A FAVOR NO UTILIZADOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('830505', 'PAÍS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('830510', 'EXTERIOR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8310', 'ACTIVOS CASTIGADOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('831005', 'INVERSIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('831010', 'INVENTARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('831015', 'CARTERA DE CRÉDITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('83101501', 'CARTERA DE CREDITO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('831020', 'CARTERA POR VENTA DE BIENES Y SERVICIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('831025', 'CUENTAS POR COBRAR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('831030', 'PROPIEDADES PLANTA Y EQUIPOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('831095', 'OTROS ACTIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8320', 'PROPIEDADES, PLANTA Y EQUIPO TOTALMENTE  DEPRECIADOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832005', 'MAUSOLEOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832010', 'EDIFICACIONES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832015', 'MUEBLES Y EQUIPO DE OFICINA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832020', 'EQUIPO DE CÓMPUTO Y COMUNICACIÓN', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832025', 'MAQUINARIA Y EQUIPO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832030', 'VEHICULOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832035', 'LABORATORIO Y ELEMENTOS DIDÁCTICOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832040', 'SEMOVIENTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832045', 'EQUIPO HOTELES Y RESTAURANTES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832050', 'EQUIPO MEDICO   CIENTÍFICO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832055', 'ENVASES Y EMPAQUES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832060', 'ARMAMENTO DE VIGILANCIA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8325', 'APORTES SUSCRITOS POR COBRAR', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('832505', 'APORTES SUSCRITOS POR COBRAR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8330', 'AJUSTES POR INFLACION ACTIVOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('833015', 'PROPIEDADES, PLANTA Y EQUIPOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('833020', 'CARGOS DIFERIDOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('833025', 'OTROS ACTIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8385', 'OTRAS DEUDORAS DE CONTROL', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('838505', 'CHEQUES DEVUELTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('838510', 'CHEQUES POSFECHADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('838585', 'OTRAS.', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('86', 'DEUDORAS CONTINGENTES POR CONTRA', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8605', 'DEUDORAS CONTINGENTES POR EL CONTRARIO (CR)', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('860505', 'DEUDORAS CONTINGENTES POR EL CONTRARIO (CR)', 'C', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('86050501', 'DEUDORAS CONTINGENTES POR EL CONTRARIO', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('88', 'DEUDORAS DE CONTROL POR CONTRA', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('8805', 'DEUDORAS DE CONTROL POR CONTRA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('880505', 'DEUDORAS DE CONTROL POR CONTRA', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('88050501', 'DEUDORAS DE CONTROL POR CONTRA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('9', 'CUENTAS DE ORDEN ACREEDORAS', 'C', '1', '1', 'A');
INSERT INTO `cn_puc` VALUES ('91', 'ACREEDORAS CONTINGENTES', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9105', 'BIENES Y VALORES RECIBIDOS EN CUSTODIA', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('910505', 'BIENES MUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('91050501', 'BIENES Y VALORES RECIBIDOS EN GUSTODIA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('910510', 'VALORES MOBILIARIOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9110', 'BIENES Y VALORES RECIBIDOS EN GARANTIA   GARANTIA ADMISIBLE', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('911005', 'DE CREDITOS COMERCIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('911010', 'DE CREDITOS CONSUMO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('911015', 'DE CREDITOS VIVIENDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('911020', 'DE MICROCREDITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('911025', 'DE CUENTAS POR COBRAR', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('911095', 'DE OTROS ACTIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9115', 'BIENES Y VALORES RECIBIDOS EN GARANTIA   OTRAS GARANTIAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('911505', 'DE CREDITOS COMERCIALES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('911510', 'DE CREDITOS CONSUMO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('91151001', 'DE CREDITO DE CONSUMO (PAGARES ASOCIADOS)', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('911515', 'DE CREDITOS DE VIVIENDA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('911520', 'DE MICROCREDITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('911595', 'DE OTROS ACTIVOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9120', 'BIENES Y VALORES  EN ADMINISTRACIÓN', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('912005', 'CARTERA FOGACOOP', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('91200501', 'BIENES Y VALORES EN ADMINISTRACION', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('91201001', 'BIENES Y VALORES RECIBIDOS EN ADMINISTRACION', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('9125', 'CREDITOS APROBADOS NO DESEMBOLSADOS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('912505', 'CRÉDITOS APROBADOS NO DESEMBOLSADOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9130', 'APERTURA DE CREDITO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('913005', 'CREDITOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('913095', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9140', 'BIENES Y VALORES RECIBIDOS DE TERCEROS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('914005', 'EN ARRENDAMIENTOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('914010', 'EN PRÉSTAMOS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('914015', 'EN DEPÓSITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('914020', 'EN CONSIGNACIÓN', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('91402001', 'BIENES Y VALORES RECIBIDOS DE TERCEROS EN CONSIGNACION', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('914025', 'EN COMODATO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9145', 'LITIGIOS Y/O DEMANDAS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('914505', 'LITIGIOS Y/O DEMANDAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9155', 'DERECHOS CEDIDOS POR AHORRADORES EN ENTIDADES EN LIQUIDACION', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('915505', 'DERECHOS CEDIDOS POR AHORRADORES EN ENTIDADES EN LIQUIDACION', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9185', 'OTRAS CUENTAS ACREEDORAS CONTINGENTES', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('918505', 'SUSTITUCIÓN DE CARTERA', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('918510', 'SEGURO DE CRÉDITO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('918585', 'OTRAS', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('91858501', 'OTRAS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('91858502', 'OTRAS-INTERESES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('91858503', 'DACION PAGO CAPITAL', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('91858504', 'DACION PAGO CAPITAL POR CONTRA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('91858505', 'INTERESES POR CONTRA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('91858506', 'CARTERA CASTIGADA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('91858507', 'INTERESES CASTIGADOS', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('92', 'CUENTAS DE ORDEN ACREEDORAS', 'D', '2', '0', 'A');
INSERT INTO `cn_puc` VALUES ('9205', 'CUENTAS DE ORDEN ACREEDORAS', 'D', '3', '0', 'A');
INSERT INTO `cn_puc` VALUES ('920505', 'CUENTAS DE ORDEN DACION PAGO', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('92050501', 'ACREED CONT. DACION EN PAGO 001 CAPITAL', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('92050502', 'ACREEDORA CONT.001 DACION EN PAGO INTERESES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('93', 'ACREEDORAS DE CONTROL', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9305', 'CONTRATOS DE ARRENDAMIENTOS FINANCIEROS', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('930505', 'BIENES MUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('930510', 'BIENES INMUEBLES', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9312', 'CAPITAL MINIMO IRREDUCIBLE', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('931205', 'CAPITAL MINIMO IRREDUCIBLE', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('93120501', 'CAPITAL MINIMO IRREDUCIBLE', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('9315', 'CAPITALIZACION REVALORIZACION DEL PATRIMONIO', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('931505', 'CAPITALIZACIÓN REVALORIZACIÓN DEL PATRIMONIO', 'C', '4', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9350', 'OTRAS ACREEDORAS DE CONTROL', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('94', 'CUENTAS DE ORDEN', 'D', '2', '0', 'A');
INSERT INTO `cn_puc` VALUES ('9405', 'CUENTA DE ORDEN', 'D', '3', '0', 'A');
INSERT INTO `cn_puc` VALUES ('940505', 'CUENTAS DE ORDEN', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('94050501', 'CUENTA DE ORDEN CONTRATO 001 DACION EN PAGO CAPITAL', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('94050502', 'CUENTA DE ORDEN CONTRATO 001 DACION EN PAGO INTERESES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('96', 'ACREEDORAS CONTINGENTES POR CONTRA', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9605', 'ACREEDORAS CONTINGENTES POR CONTRA (DB)', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('960505', 'ACREEDORAS CONTINGENTES POR CONTRA (DB)', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('96050501', 'ACRREDORAS CONTIGENTES POR CONTRA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('96050502', 'ACREEDORAS CONTINGENTES POR CONTRA-INTERES CARTERA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('96050503', 'ACREEDORAS CONTINGENTES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('96050504', 'INTERESES', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('96050505', 'INTERESES POR CONTRA', 'C', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('96050506', 'CARTERA CASTIGADA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('96050507', 'INTERESES CASTIGADOS', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('9615', 'ACREEDORES CONTIGENTES POR CONTRA', 'D', '3', '0', 'A');
INSERT INTO `cn_puc` VALUES ('961510', 'ACREEDORES CONTIGENTES POR CONTRA', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('96151001', 'ACREEDORES CONTIGENTES POR CONTRA', 'D', '5', '0', 'A');
INSERT INTO `cn_puc` VALUES ('98', 'ACREEDORAS DE CONTROL POR CONTRA', 'C', '2', '1', 'A');
INSERT INTO `cn_puc` VALUES ('9805', 'ACREEDORAS DE CONTROL POR CONTRA (DB)', 'C', '3', '1', 'A');
INSERT INTO `cn_puc` VALUES ('980505', 'ACREEDORAS DE CONTROL POR EL CONTRARIO', 'D', '4', '0', 'A');
INSERT INTO `cn_puc` VALUES ('98050501', 'CAPITAL MINIMO IRREDUCIBLE', 'D', '5', '0', 'A');

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
	UPDATE cgf_consecutivos
		SET cons_valor = lnNext + 1
	WHERE
		cons_codigo = PcCodigo;
	
	RETURN lnNext + 1;
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
