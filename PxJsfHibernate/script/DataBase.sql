/*
SQLyog Enterprise - MySQL GUI v5.25
Host - 5.0.89-community-nt : Database - dbsiscom
*********************************************************************
Server version : 5.0.89-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `dbsiscom`;

USE `dbsiscom`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `ajuste` */

DROP TABLE IF EXISTS `ajuste`;

CREATE TABLE `ajuste` (
  `ajuste_nro` int(11) NOT NULL auto_increment,
  `dep_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  `art_codigo` int(11) default NULL,
  `mtacodigo` int(11) default NULL,
  `ajfecha_solicitada` date default NULL,
  `ajfecha_autorizada` date default NULL,
  `ajcant_solicitada` int(11) default NULL,
  `ajfecha_confirmada` date default NULL,
  `ajcant_autorizada` int(11) default NULL,
  `fun_solicitante` int(11) default NULL,
  `fun_autorizante` int(11) default NULL,
  `ajautorizado` tinyint(1) default NULL,
  `ajcant_confirmada` int(11) default NULL,
  PRIMARY KEY  (`ajuste_nro`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `ajuste` */

insert  into `ajuste`(`ajuste_nro`,`dep_codigo`,`suc_codigo`,`art_codigo`,`mtacodigo`,`ajfecha_solicitada`,`ajfecha_autorizada`,`ajcant_solicitada`,`ajfecha_confirmada`,`ajcant_autorizada`,`fun_solicitante`,`fun_autorizante`,`ajautorizado`,`ajcant_confirmada`) values (1,NULL,NULL,1,NULL,'2012-11-26','2012-12-20',10,NULL,NULL,1,1,1,NULL),(2,NULL,NULL,1,NULL,'2012-11-26','2013-01-06',10,NULL,NULL,1,1,0,NULL),(3,NULL,NULL,3,NULL,'2012-11-26',NULL,20,NULL,NULL,1,NULL,0,NULL),(4,NULL,NULL,1,NULL,'2012-11-26',NULL,10,NULL,NULL,1,NULL,0,NULL),(5,NULL,NULL,3,NULL,'2012-11-26',NULL,20,NULL,NULL,1,NULL,0,NULL),(6,NULL,NULL,1,NULL,'2012-11-26','2012-12-20',20,NULL,NULL,1,1,1,NULL),(7,NULL,NULL,4,NULL,'2012-11-26','2012-12-20',1,NULL,NULL,1,1,1,NULL),(8,NULL,NULL,1,NULL,'2012-11-26',NULL,20,NULL,NULL,1,NULL,0,NULL),(9,NULL,NULL,3,NULL,'2012-11-26',NULL,10,NULL,NULL,1,NULL,0,NULL),(10,NULL,NULL,4,NULL,'2012-11-26',NULL,20,NULL,NULL,1,NULL,0,NULL),(11,NULL,NULL,5,NULL,'2012-11-26',NULL,1,NULL,NULL,1,NULL,0,NULL),(12,NULL,NULL,6,NULL,'2012-11-26','2013-01-06',100,NULL,NULL,1,1,0,NULL),(13,NULL,NULL,1,NULL,'2012-11-26','2012-12-20',10,NULL,NULL,1,1,1,NULL),(14,NULL,NULL,1,NULL,'2012-11-26','2012-12-20',10,NULL,NULL,1,1,1,NULL);

/*Table structure for table `apercierre` */

DROP TABLE IF EXISTS `apercierre`;

CREATE TABLE `apercierre` (
  `ope_nro` int(11) NOT NULL,
  `ope_fecha` date default NULL,
  `ope_cajero` varchar(50) NOT NULL,
  `caj_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `ape_fec_hor` datetime default NULL,
  `cie_fec_hor` datetime default NULL,
  `montoaper` double(20,2) default NULL,
  `montocierre` double(20,2) default NULL,
  `estado` varchar(1) default NULL,
  PRIMARY KEY  (`ope_nro`),
  KEY `apercierre_FKIndex1` (`caj_codigo`),
  KEY `apercierre_FKIndex2` (`suc_codigo`),
  CONSTRAINT `apercierre_ibfk_1` FOREIGN KEY (`caj_codigo`) REFERENCES `caja` (`caj_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `apercierre_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `apercierre` */

/*Table structure for table `articulo` */

DROP TABLE IF EXISTS `articulo`;

CREATE TABLE `articulo` (
  `art_codigo` int(11) NOT NULL auto_increment,
  `artbarra` varchar(50) default NULL,
  `gru_codigo` int(11) default NULL,
  `tg_codigo` int(11) default NULL,
  `artnomreal` varchar(80) default NULL,
  `artnomfact` varchar(80) default NULL,
  `artcodorigen` varchar(50) default NULL,
  `artnropieza` varchar(50) default NULL,
  `mar_codigo` int(11) default NULL,
  `codigomarca` varchar(50) default NULL,
  `pais_codigo` int(11) default NULL,
  `artprecact` double(20,3) default NULL,
  `artpreant` double(20,3) default NULL,
  `artpreventa` double(20,3) default NULL,
  `arttpiva` varchar(7) default NULL,
  `ubica_codigo` int(11) default NULL,
  `artstockmin` int(11) default NULL,
  `artobs` varchar(200) default NULL,
  `artivaporc` int(11) default NULL,
  PRIMARY KEY  (`art_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `articulo` */

insert  into `articulo`(`art_codigo`,`artbarra`,`gru_codigo`,`tg_codigo`,`artnomreal`,`artnomfact`,`artcodorigen`,`artnropieza`,`mar_codigo`,`codigomarca`,`pais_codigo`,`artprecact`,`artpreant`,`artpreventa`,`arttpiva`,`ubica_codigo`,`artstockmin`,`artobs`,`artivaporc`) values (1,'2222222222222',4,2,'Ventilador brisa 444',NULL,'ARE00001','1111111',3,'1111111111111',1,1000.000,NULL,1000.000,'Iva',2,113,'Nothing',10),(2,'2222211',4,2,'FARO DEEROTOR 45',NULL,'ARE00002','254o',20,'222',2,5000.000,NULL,15000.000,'Iva',22,31,'',5),(3,'222222222',4,2,'CROMO FORTE 1',NULL,'ARE00003',NULL,3,NULL,1,0.000,NULL,NULL,NULL,2,10,NULL,5),(4,'22222',4,2,'BLICK 12V21/5W-2FILAMENTOS',NULL,'ARE00004',NULL,3,NULL,1,0.000,NULL,NULL,NULL,2,10,NULL,5),(5,'11111',4,2,'CORONA RS125 428-36T',NULL,'ARE00005',NULL,3,NULL,1,0.000,NULL,NULL,NULL,2,10,NULL,NULL),(6,'111111',4,2,'GOMA POSAPIE AX100',NULL,'AAC00127',NULL,3,NULL,NULL,0.000,NULL,NULL,NULL,NULL,2,NULL,NULL);

/*Table structure for table `asignacion_ff` */

DROP TABLE IF EXISTS `asignacion_ff`;

CREATE TABLE `asignacion_ff` (
  `asig_nro` int(11) NOT NULL,
  `resp_codigo` int(11) default NULL,
  `fon_codigo` int(11) default NULL,
  `asig_fecha` date default NULL,
  `asig_monto` double(20,2) default NULL,
  `asig_saldo` double(20,2) default NULL,
  PRIMARY KEY  (`asig_nro`),
  KEY `FK_asignacion_ff` (`fon_codigo`),
  KEY `resp_codigo` (`resp_codigo`),
  CONSTRAINT `asignacion_ff_ibfk_1` FOREIGN KEY (`fon_codigo`) REFERENCES `fondo_fijo` (`fon_codigo`),
  CONSTRAINT `asignacion_ff_ibfk_2` FOREIGN KEY (`resp_codigo`) REFERENCES `responsable_ff` (`resp_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `asignacion_ff` */

/*Table structure for table `audi_stock` */

DROP TABLE IF EXISTS `audi_stock`;

CREATE TABLE `audi_stock` (
  `nueart_codigo` int(11) default NULL,
  `viart_codigo` int(11) default NULL,
  `nusuc_codigo` int(11) default NULL,
  `visuc_codigo` int(11) default NULL,
  `nudep_codigo` int(11) default NULL,
  `videp_codigo` int(11) default NULL,
  `nust_existencia` int(11) default NULL,
  `vist_existencia` int(11) default NULL,
  `fec_hor_oper` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `usuario` varchar(50) default NULL,
  `operacion` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `audi_stock` */

/*Table structure for table `banco` */

DROP TABLE IF EXISTS `banco`;

CREATE TABLE `banco` (
  `ban_codigo` int(11) NOT NULL,
  `ban_nombre` varchar(50) NOT NULL,
  `ban_direccion` varchar(50) NOT NULL,
  `ban_telef` varchar(30) NOT NULL,
  PRIMARY KEY  (`ban_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `banco` */

insert  into `banco`(`ban_codigo`,`ban_nombre`,`ban_direccion`,`ban_telef`) values (1,'INTERBACO S.A.                                    ','MCL. LOPEZ                                        ','7877 7878                     '),(2,'CITY BANK S.A.                                    ','VILLA MORRA                                       ','645 455                       '),(3,'SUDAMERIS                                         ','<DESCONOCIDO>','<DESCONOCIDO>');

/*Table structure for table `caja` */

DROP TABLE IF EXISTS `caja`;

CREATE TABLE `caja` (
  `caj_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `caj_nombre` varchar(30) NOT NULL,
  PRIMARY KEY  (`caj_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `caja` */

insert  into `caja`(`caj_codigo`,`suc_codigo`,`caj_nombre`) values (1,1,'NRO 1.                        ');

/*Table structure for table `cajero` */

DROP TABLE IF EXISTS `cajero`;

CREATE TABLE `cajero` (
  `caje_codigo` int(11) NOT NULL,
  `caje_nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`caje_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cajero` */

insert  into `cajero`(`caje_codigo`,`caje_nombre`) values (1,'PAZ OLMEDO                               ');

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `cat_codigo` int(11) NOT NULL,
  `cat_nombre` varchar(50) default NULL,
  `cat_porce_ganancia` double(10,2) default NULL,
  `cat_porce_descuento` double(10,2) default NULL,
  PRIMARY KEY  (`cat_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `categoria` */

insert  into `categoria`(`cat_codigo`,`cat_nombre`,`cat_porce_ganancia`,`cat_porce_descuento`) values (1,'<SIN CATEGORIA>',0.00,0.00),(2,'MOSTRADOR                                         ',70.00,5.00),(3,'PROFESIONAL',50.00,5.00),(4,'MAYORISTA',50.00,50.00);

/*Table structure for table `cheque_e` */

DROP TABLE IF EXISTS `cheque_e`;

CREATE TABLE `cheque_e` (
  `che_nro` varchar(50) NOT NULL,
  `ban_codigo` int(11) NOT NULL,
  `cta_cte_nro` varchar(50) NOT NULL,
  `titu_codigo` int(11) NOT NULL,
  `tp_cheq` int(10) unsigned NOT NULL,
  `che_monto` double(20,3) default NULL,
  `che_fec_emi` date default NULL,
  `che_fec_ven` date default NULL,
  `mon_codigo` int(11) NOT NULL,
  PRIMARY KEY  (`che_nro`,`ban_codigo`,`cta_cte_nro`),
  KEY `cta_cte_nro` (`cta_cte_nro`,`ban_codigo`),
  KEY `tp_cheq` (`tp_cheq`),
  KEY `titu_codigo` (`titu_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `cheque_e_ibfk_1` FOREIGN KEY (`cta_cte_nro`, `ban_codigo`) REFERENCES `cta_cte` (`cta_cte_nro`, `ban_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cheque_e_ibfk_2` FOREIGN KEY (`tp_cheq`) REFERENCES `tipo_cheque` (`tp_cheq`) ON UPDATE NO ACTION,
  CONSTRAINT `cheque_e_ibfk_3` FOREIGN KEY (`titu_codigo`) REFERENCES `titular` (`titu_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cheque_e_ibfk_4` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cheque_e` */

/*Table structure for table `cheque_r` */

DROP TABLE IF EXISTS `cheque_r`;

CREATE TABLE `cheque_r` (
  `che_nro` varchar(50) NOT NULL,
  `ban_codigo` int(11) NOT NULL,
  `cta_cte_nro` varchar(50) NOT NULL,
  `tp_cheq` int(10) unsigned NOT NULL,
  `che_fec_r` date default NULL,
  `che_fec_v` date default NULL,
  `che_monto` double(20,2) default NULL,
  `mon_codigo` int(11) NOT NULL,
  `titular` varchar(50) NOT NULL,
  PRIMARY KEY  (`che_nro`,`ban_codigo`),
  KEY `tp_cheq` (`tp_cheq`),
  KEY `mon_codigo` (`mon_codigo`),
  KEY `cheque_r_ibfk_1` (`ban_codigo`),
  CONSTRAINT `cheque_r_ibfk_1` FOREIGN KEY (`ban_codigo`) REFERENCES `banco` (`ban_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cheque_r_ibfk_2` FOREIGN KEY (`tp_cheq`) REFERENCES `tipo_cheque` (`tp_cheq`) ON UPDATE NO ACTION,
  CONSTRAINT `cheque_r_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cheque_r` */

/*Table structure for table `ciudad` */

DROP TABLE IF EXISTS `ciudad`;

CREATE TABLE `ciudad` (
  `ciu_codigo` int(11) NOT NULL auto_increment,
  `ciu_nombre` varchar(50) default NULL,
  PRIMARY KEY  (`ciu_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `ciudad` */

insert  into `ciudad`(`ciu_codigo`,`ciu_nombre`) values (1,'Resistencia'),(2,'ASUNCION'),(3,'?EMBY                                            '),(4,'SAN LORENZO'),(5,'FNDO. DE LA MORA'),(6,NULL),(7,'LIMPIO'),(8,'EMBOSCADA                                '),(9,'LUQUE                                    '),(10,NULL);

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `clie_codigo` int(11) NOT NULL,
  `ciu_codigo` int(11) NOT NULL,
  `clie_razon` varchar(50) NOT NULL,
  `clie_direcc` varchar(70) default NULL,
  `clie_telef` varchar(30) default NULL,
  `clie_movil` varchar(30) default NULL,
  `clie_ruc` varchar(30) default NULL,
  `clie_correo` varchar(70) default NULL,
  `clie_comen` varchar(100) default NULL,
  `clie_cip` varchar(30) default NULL,
  `cat_codigo` int(11) default NULL,
  PRIMARY KEY  (`clie_codigo`),
  KEY `cliente_FKIndex1` (`ciu_codigo`),
  KEY `FK_cliente` (`cat_codigo`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cat_codigo`) REFERENCES `categoria` (`cat_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`ciu_codigo`) REFERENCES `ciudad` (`ciu_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cliente` */

/*Table structure for table `cobranza` */

DROP TABLE IF EXISTS `cobranza`;

CREATE TABLE `cobranza` (
  `ven_nro` int(10) unsigned NOT NULL,
  `fecha_pago` date NOT NULL,
  `clie_codigo` int(11) NOT NULL,
  `forc_codigo` int(11) NOT NULL,
  `cuo_nro` int(11) NOT NULL,
  `monto_cobrar` double(20,2) NOT NULL,
  `mon_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  PRIMARY KEY  (`ven_nro`,`fecha_pago`,`clie_codigo`,`forc_codigo`,`cuo_nro`,`monto_cobrar`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `clie_codigo` (`clie_codigo`,`ven_nro`),
  KEY `mon_codigo` (`mon_codigo`,`suc_codigo`),
  KEY `FK_cobranza` (`suc_codigo`),
  CONSTRAINT `cobranza_ibfk_1` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cobranza_ibfk_2` FOREIGN KEY (`clie_codigo`, `ven_nro`) REFERENCES `cta_a_cobrar` (`clie_codigo`, `ven_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `cobranza_ibfk_3` FOREIGN KEY (`ven_nro`) REFERENCES `venta` (`ven_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `cobranza_ibfk_4` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cobranza_ibfk_5` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cobranza` */

/*Table structure for table `cobro` */

DROP TABLE IF EXISTS `cobro`;

CREATE TABLE `cobro` (
  `cob_nro` int(11) NOT NULL,
  `ven_nro` int(11) NOT NULL,
  `ope_nro` int(11) default NULL,
  `cob_fecha` date default NULL,
  `suc_codigo` int(11) default NULL,
  `tipo_operacion` varchar(70) default NULL,
  PRIMARY KEY  (`cob_nro`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `ope_nro` (`ope_nro`),
  KEY `ven_nro` (`ven_nro`),
  CONSTRAINT `cobro_ibfk_1` FOREIGN KEY (`ope_nro`) REFERENCES `apercierre` (`ope_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `cobro_ibfk_2` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cobro` */

/*Table structure for table `compra` */

DROP TABLE IF EXISTS `compra`;

CREATE TABLE `compra` (
  `com_nro` int(11) NOT NULL auto_increment,
  `forc_codigo` int(11) default NULL,
  `mon_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  `dep_codigo` int(11) default NULL,
  `pro_codigo` int(11) default NULL,
  `com_fact_nro` varchar(30) default NULL,
  `com_fecha` date default NULL,
  `com_exe` double(20,3) default NULL,
  `com_gra` double(20,3) default NULL,
  `com_iva` double(20,3) default NULL,
  `com_desc` double(20,3) default NULL,
  `com_recar` double(20,3) default NULL,
  `com_total` double(20,3) default NULL,
  `com_cond` varchar(7) default NULL,
  `com_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`com_nro`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `compra` */

insert  into `compra`(`com_nro`,`forc_codigo`,`mon_codigo`,`suc_codigo`,`dep_codigo`,`pro_codigo`,`com_fact_nro`,`com_fecha`,`com_exe`,`com_gra`,`com_iva`,`com_desc`,`com_recar`,`com_total`,`com_cond`,`com_cambio`) values (1,1,1,1,1,1,'55555','2012-04-04',0.000,100.000,10.000,0.000,0.000,100.000,'CONTADO',0.00),(2,1,1,1,1,1,'122121','2012-04-04',0.000,0.000,0.000,0.000,0.000,0.000,'CONTADO',0.00),(3,1,NULL,NULL,NULL,1,'123','2012-11-05',NULL,NULL,NULL,NULL,NULL,200.000,NULL,NULL),(4,1,NULL,NULL,NULL,3,'1234','2012-11-18',NULL,NULL,NULL,NULL,NULL,1500.000,NULL,NULL),(5,1,NULL,NULL,NULL,3,'5244','2012-11-18',NULL,NULL,NULL,NULL,NULL,500.000,NULL,NULL),(6,1,NULL,NULL,NULL,3,'2555','2012-11-23',NULL,NULL,NULL,NULL,NULL,500.000,NULL,NULL),(7,1,NULL,NULL,NULL,4,'1522','2012-11-18',NULL,NULL,NULL,NULL,NULL,500.000,NULL,NULL),(8,1,NULL,NULL,NULL,3,'121','2012-11-05',NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL),(9,1,NULL,NULL,NULL,3,'111111','2012-11-21',NULL,NULL,NULL,NULL,NULL,500.000,NULL,NULL),(10,1,NULL,NULL,NULL,4,'1111','2012-11-21',NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL);

/*Table structure for table `cotizacion` */

DROP TABLE IF EXISTS `cotizacion`;

CREATE TABLE `cotizacion` (
  `cot_fecha` date NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `cot_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`cot_fecha`,`mon_codigo`),
  KEY `cotizacion_FKIndex1` (`mon_codigo`),
  CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cotizacion` */

/*Table structure for table `cta_a_cobrar` */

DROP TABLE IF EXISTS `cta_a_cobrar`;

CREATE TABLE `cta_a_cobrar` (
  `clie_codigo` int(11) NOT NULL,
  `ven_nro` int(10) unsigned NOT NULL,
  `monto_cobrar` double(10,2) default NULL,
  `monto_pago` double(10,2) default NULL,
  `fecha_pago` date default NULL,
  `estado_cta` varchar(1) NOT NULL,
  `cuo_nro` int(11) NOT NULL,
  `can_cuo` int(11) default NULL,
  `fec_vto` date default NULL,
  `mon_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  `total_deuda` double(20,2) default NULL,
  PRIMARY KEY  (`clie_codigo`,`ven_nro`,`cuo_nro`),
  KEY `clie_codigo` (`clie_codigo`),
  KEY `ven_nro` (`ven_nro`),
  KEY `suc_codigo` (`mon_codigo`,`suc_codigo`),
  KEY `FK_cta_a_cobrar` (`suc_codigo`),
  CONSTRAINT `cta_a_cobrar_ibfk_1` FOREIGN KEY (`clie_codigo`) REFERENCES `cliente` (`clie_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_cobrar_ibfk_2` FOREIGN KEY (`ven_nro`) REFERENCES `venta` (`ven_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_cobrar_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_cobrar_ibfk_4` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cta_a_cobrar` */

/*Table structure for table `cta_a_pagar` */

DROP TABLE IF EXISTS `cta_a_pagar`;

CREATE TABLE `cta_a_pagar` (
  `com_nro` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `can_cuota` int(11) NOT NULL,
  `total_deuda` double(20,3) default NULL,
  `nro_cuota` int(11) NOT NULL,
  `fecha_vto` date default NULL,
  `fecha_pago` date default NULL,
  `monto_cuota` double(20,3) default NULL,
  `pago_cuota` double(20,3) default NULL,
  `estado_cta` varchar(1) default NULL,
  PRIMARY KEY  (`com_nro`,`mon_codigo`,`suc_codigo`,`pro_codigo`,`can_cuota`,`nro_cuota`),
  KEY `pro_codigo` (`pro_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `cta_a_pagar_ibfk_1` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_pagar_ibfk_2` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_pagar_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cta_a_pagar_ibfk_4` FOREIGN KEY (`com_nro`) REFERENCES `compra` (`com_nro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cta_a_pagar` */

/*Table structure for table `cta_cte` */

DROP TABLE IF EXISTS `cta_cte`;

CREATE TABLE `cta_cte` (
  `cta_cte_nro` varchar(50) NOT NULL,
  `ban_codigo` int(11) NOT NULL,
  `titu_codigo` int(11) NOT NULL,
  `fec_aper_cta` date default NULL,
  `fec_cierr_cta` date default NULL,
  PRIMARY KEY  (`cta_cte_nro`,`ban_codigo`),
  KEY `ban_codigo` (`ban_codigo`),
  KEY `titu_codigo` (`titu_codigo`),
  CONSTRAINT `cta_cte_ibfk_1` FOREIGN KEY (`ban_codigo`) REFERENCES `banco` (`ban_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `cta_cte_ibfk_2` FOREIGN KEY (`titu_codigo`) REFERENCES `titular` (`titu_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cta_cte` */

/*Table structure for table `deposito` */

DROP TABLE IF EXISTS `deposito`;

CREATE TABLE `deposito` (
  `dep_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_nombre` varchar(30) default NULL,
  PRIMARY KEY  (`dep_codigo`,`suc_codigo`),
  KEY `deposito_FKIndex1` (`suc_codigo`),
  CONSTRAINT `deposito_ibfk_1` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deposito` */

insert  into `deposito`(`dep_codigo`,`suc_codigo`,`dep_nombre`) values (1,1,'DEPOSITO GENERAL              ');

/*Table structure for table `det_compra` */

DROP TABLE IF EXISTS `det_compra`;

CREATE TABLE `det_compra` (
  `det_codigo` int(11) NOT NULL auto_increment,
  `com_nro` int(11) default NULL,
  `art_codigo` int(11) default NULL,
  `det_com_can` int(11) default NULL,
  `det_com_pre` double(20,3) default NULL,
  `det_com_exe` double(20,3) default NULL,
  `det_com_gra10` double(20,3) default NULL,
  `det_com_gra5` double(20,3) default NULL,
  `det_com_sub` double(20,3) default NULL,
  `det_com_porc` double(10,2) default NULL,
  PRIMARY KEY  (`det_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `det_compra` */

insert  into `det_compra`(`det_codigo`,`com_nro`,`art_codigo`,`det_com_can`,`det_com_pre`,`det_com_exe`,`det_com_gra10`,`det_com_gra5`,`det_com_sub`,`det_com_porc`) values (1,1,1,1,50.000,0.000,50.000,0.000,50.000,10.00),(2,1,2,1,50.000,0.000,50.000,0.000,50.000,10.00),(5,3,1,1,200.000,NULL,NULL,NULL,200.000,NULL),(6,4,1,5,100.000,NULL,NULL,NULL,500.000,NULL),(7,4,2,10,100.000,NULL,NULL,NULL,1000.000,NULL),(8,5,1,2,100.000,NULL,NULL,NULL,200.000,NULL),(9,5,2,1,300.000,NULL,NULL,NULL,300.000,NULL),(10,6,1,1,200.000,NULL,NULL,NULL,200.000,NULL),(11,6,2,1,300.000,NULL,NULL,NULL,300.000,NULL),(12,7,1,2,100.000,NULL,NULL,NULL,200.000,NULL),(13,7,2,1,300.000,NULL,NULL,NULL,300.000,NULL),(14,8,1,0,0.000,NULL,NULL,NULL,0.000,NULL),(15,8,4,0,0.000,NULL,NULL,NULL,0.000,NULL),(16,8,6,0,0.000,NULL,NULL,NULL,0.000,NULL),(17,9,1,2,100.000,NULL,NULL,NULL,200.000,NULL),(18,9,6,1,300.000,NULL,NULL,NULL,300.000,NULL),(19,10,2,0,0.000,NULL,NULL,NULL,0.000,NULL),(20,10,3,0,0.000,NULL,NULL,NULL,0.000,NULL),(21,10,4,0,0.000,NULL,NULL,NULL,0.000,NULL),(22,10,5,0,0.000,NULL,NULL,NULL,0.000,NULL);

/*Table structure for table `det_devolucion` */

DROP TABLE IF EXISTS `det_devolucion`;

CREATE TABLE `det_devolucion` (
  `devo_nro` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `detd_can` int(11) default NULL,
  `detd_pre` double(20,3) default NULL,
  `detd_exe` double(20,3) default NULL,
  `det_gra5` double(20,3) default NULL,
  `detd_gra10` double(20,3) default NULL,
  PRIMARY KEY  (`art_codigo`,`devo_nro`),
  KEY `art_codigo` (`art_codigo`),
  KEY `devo_nro` (`devo_nro`),
  CONSTRAINT `det_devolucion_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `det_devolucion_ibfk_2` FOREIGN KEY (`devo_nro`) REFERENCES `devolucion` (`devo_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `det_devolucion` */

/*Table structure for table `det_importacion` */

DROP TABLE IF EXISTS `det_importacion`;

CREATE TABLE `det_importacion` (
  `imp_nro` int(10) unsigned NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `det_imp_can` int(10) unsigned default NULL,
  `det_imp_pre` double(20,3) default NULL,
  `det_imp_exc` double(20,3) default NULL,
  `det_imp_gra` double(20,3) default NULL,
  `det_imp_sub` double(20,3) default NULL,
  `det_imp_porc` int(10) unsigned default NULL,
  PRIMARY KEY  (`art_codigo`,`imp_nro`),
  KEY `imp_nro` (`imp_nro`),
  CONSTRAINT `det_importacion_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `det_importacion_ibfk_2` FOREIGN KEY (`imp_nro`) REFERENCES `importacion` (`imp_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `det_importacion` */

/*Table structure for table `det_notacredito` */

DROP TABLE IF EXISTS `det_notacredito`;

CREATE TABLE `det_notacredito` (
  `nc_codigo` int(11) default NULL,
  `art_codigo` int(11) default NULL,
  `detnc_can` int(11) default NULL,
  `detnc_pre` double(20,2) default NULL,
  `detnc_exe` double(20,2) default NULL,
  `detnc_gra5` double(20,2) default NULL,
  `detnc_gra10` double(20,2) default NULL,
  KEY `nc_codigo` (`nc_codigo`),
  KEY `art_codigo` (`art_codigo`),
  CONSTRAINT `det_notacredito_ibfk_1` FOREIGN KEY (`nc_codigo`) REFERENCES `nota_credito` (`nc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `det_notacredito_ibfk_2` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `det_notacredito` */

/*Table structure for table `det_pedcliente` */

DROP TABLE IF EXISTS `det_pedcliente`;

CREATE TABLE `det_pedcliente` (
  `pedclie_nro` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `detped_can` int(11) default NULL,
  `detped_pre` double(20,2) default NULL,
  `detped_exe` double(20,2) default NULL,
  `detped_gra10` double(20,2) default NULL,
  `detped_gra5` double(20,2) default NULL,
  `detped_sub` double(20,2) default NULL,
  PRIMARY KEY  (`pedclie_nro`,`art_codigo`),
  KEY `art_codigo` (`art_codigo`),
  CONSTRAINT `FK_det_pedcliente` FOREIGN KEY (`pedclie_nro`) REFERENCES `pedido_cliente` (`pedclie_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `det_pedcliente` */

/*Table structure for table `det_presupuesto` */

DROP TABLE IF EXISTS `det_presupuesto`;

CREATE TABLE `det_presupuesto` (
  `presu_nro` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `detpre_can` int(11) default NULL,
  `detpre_pre` double(20,3) default NULL,
  `detpre_exe` double(20,3) default NULL,
  `detpre_gra10` double(20,3) default NULL,
  `detpre_gra5` double(20,3) default NULL,
  `detpre_sub` double(20,3) default NULL,
  PRIMARY KEY  (`presu_nro`,`art_codigo`),
  KEY `FK_det_presupuesto` (`art_codigo`),
  CONSTRAINT `det_presupuesto_ibfk_1` FOREIGN KEY (`presu_nro`) REFERENCES `presupuesto` (`presu_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `det_presupuesto_ibfk_2` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `det_presupuesto` */

/*Table structure for table `det_venta` */

DROP TABLE IF EXISTS `det_venta`;

CREATE TABLE `det_venta` (
  `ven_nro` int(10) unsigned NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `det_ven_can` int(10) default NULL,
  `det_ven_pre` double(10,3) default NULL,
  `det_ven_exe` double(10,3) default NULL,
  `det_ven_gra10` double(10,3) default NULL,
  `det_ven_gra5` double(20,3) default NULL,
  `det_ven_sub` double(20,3) default NULL,
  `det_iva_porc` double(10,2) default NULL,
  PRIMARY KEY  (`art_codigo`,`ven_nro`),
  KEY `art_codigo` (`art_codigo`),
  KEY `ven_nro` (`ven_nro`),
  CONSTRAINT `det_venta_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `det_venta_ibfk_2` FOREIGN KEY (`ven_nro`) REFERENCES `venta` (`ven_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `det_venta` */

/*Table structure for table `detalle_cobro` */

DROP TABLE IF EXISTS `detalle_cobro`;

CREATE TABLE `detalle_cobro` (
  `cob_nro` int(11) default NULL,
  `forc_codigo` int(11) default NULL,
  `mon_codigo` int(11) default NULL,
  `tipo_operacion` varchar(70) default NULL,
  `monto_cobrado` double(20,2) default NULL,
  KEY `cob_nro` (`cob_nro`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `detalle_cobro_ibfk_1` FOREIGN KEY (`cob_nro`) REFERENCES `cobro` (`cob_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `detalle_cobro_ibfk_2` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `detalle_cobro_ibfk_3` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detalle_cobro` */

/*Table structure for table `detalle_pedep` */

DROP TABLE IF EXISTS `detalle_pedep`;

CREATE TABLE `detalle_pedep` (
  `peded_nro` int(10) unsigned NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `detp_cant` int(10) unsigned default NULL,
  `detp_codorig` varchar(50) default NULL,
  PRIMARY KEY  (`peded_nro`,`art_codigo`),
  KEY `art_codigo` (`art_codigo`),
  CONSTRAINT `detalle_pedep_ibfk_1` FOREIGN KEY (`peded_nro`) REFERENCES `pedido_dep` (`peded_nro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalle_pedep_ibfk_2` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detalle_pedep` */

/*Table structure for table `detord_compra` */

DROP TABLE IF EXISTS `detord_compra`;

CREATE TABLE `detord_compra` (
  `ordc_nro` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  `detordc_can` int(11) default NULL,
  `detordc_pre` double(20,3) default NULL,
  `detordc_exe` double(20,3) default NULL,
  `detordc_gra10` double(20,3) default NULL,
  `detordc_gra5` double(20,3) default NULL,
  `detordc_sub` double(20,3) default NULL,
  PRIMARY KEY  (`ordc_nro`,`art_codigo`),
  KEY `FK_detord_compra` (`art_codigo`),
  CONSTRAINT `detord_compra_ibfk_1` FOREIGN KEY (`ordc_nro`) REFERENCES `orden_compra` (`ordc_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `detord_compra_ibfk_2` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detord_compra` */

/*Table structure for table `detord_pago` */

DROP TABLE IF EXISTS `detord_pago`;

CREATE TABLE `detord_pago` (
  `ord_pago_nro` int(11) NOT NULL,
  `com_nro` int(11) NOT NULL,
  `can_cuota` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `nro_cuota` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `forc_codigo` int(11) NOT NULL,
  `detord_monto` double(20,3) NOT NULL,
  `detord_estado` varchar(1) default NULL,
  `detord_fecvto` date default NULL,
  PRIMARY KEY  (`ord_pago_nro`,`com_nro`,`nro_cuota`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `com_nro` (`com_nro`,`mon_codigo`,`suc_codigo`,`pro_codigo`,`can_cuota`,`nro_cuota`),
  CONSTRAINT `detord_pago_ibfk_1` FOREIGN KEY (`ord_pago_nro`) REFERENCES `ord_pago` (`ord_pago_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `detord_pago_ibfk_2` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detord_pago` */

/*Table structure for table `devolucion` */

DROP TABLE IF EXISTS `devolucion`;

CREATE TABLE `devolucion` (
  `devo_nro` int(11) NOT NULL,
  `ven_nro` int(11) unsigned NOT NULL,
  `clie_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  `dep_codigo` int(11) default NULL,
  `mon_codigo` int(11) default NULL,
  `devo_fecha` date NOT NULL,
  `devo_monto` double(20,3) default NULL,
  `devo_tipo` varchar(3) default NULL,
  `devo_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`devo_nro`),
  KEY `ven_nro` (`ven_nro`),
  KEY `clie_codigo` (`clie_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `dep_codigo` (`dep_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`ven_nro`) REFERENCES `venta` (`ven_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`clie_codigo`) REFERENCES `cliente` (`clie_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `devolucion_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `devolucion_ibfk_4` FOREIGN KEY (`dep_codigo`) REFERENCES `deposito` (`dep_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `devolucion_ibfk_5` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `devolucion` */

/*Table structure for table `empresa` */

DROP TABLE IF EXISTS `empresa`;

CREATE TABLE `empresa` (
  `emp_codigo` int(11) NOT NULL,
  `emp_nombre` varchar(50) default NULL,
  `emp_direcc` varchar(50) default NULL,
  `emp_telef` varchar(30) default NULL,
  `emp_ruc` varchar(50) default NULL,
  `emp_iva` int(11) default NULL,
  PRIMARY KEY  (`emp_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `empresa` */

insert  into `empresa`(`emp_codigo`,`emp_nombre`,`emp_direcc`,`emp_telef`,`emp_ruc`,`emp_iva`) values (1,'CASA EL AMIGO                                     ','COLON E/ MCL. ESTIGARRBIA                         ','780 623                       ','OEGE 4616401                                      ',1);

/*Table structure for table `fact_anulado` */

DROP TABLE IF EXISTS `fact_anulado`;

CREATE TABLE `fact_anulado` (
  `fanu_nro` int(11) NOT NULL,
  `ven_nro` int(10) unsigned NOT NULL,
  `fanu_fecha` date default NULL,
  `fanu_motivo` varchar(100) default NULL,
  PRIMARY KEY  (`ven_nro`,`fanu_nro`),
  CONSTRAINT `fact_anulado_ibfk_1` FOREIGN KEY (`ven_nro`) REFERENCES `venta` (`ven_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fact_anulado` */

/*Table structure for table `fondo_fijo` */

DROP TABLE IF EXISTS `fondo_fijo`;

CREATE TABLE `fondo_fijo` (
  `fon_codigo` int(11) NOT NULL,
  `fon_nombre` varchar(50) default NULL,
  `suc_codigo` int(11) default NULL,
  PRIMARY KEY  (`fon_codigo`),
  KEY `fon_codigo` (`fon_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  CONSTRAINT `fondo_fijo_ibfk_1` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fondo_fijo` */

/*Table structure for table `forma_cobro` */

DROP TABLE IF EXISTS `forma_cobro`;

CREATE TABLE `forma_cobro` (
  `forc_codigo` int(11) NOT NULL,
  `forc_nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`forc_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `forma_cobro` */

insert  into `forma_cobro`(`forc_codigo`,`forc_nombre`) values (1,'EFECTIVO'),(2,'TARJETA PLATINO VISA'),(3,'TARJETA NARANJA'),(4,'TARJETA ARGENTA'),(5,'TARJETA VISA DE ORO'),(6,'CREDICARD');

/*Table structure for table `funcionario` */

DROP TABLE IF EXISTS `funcionario`;

CREATE TABLE `funcionario` (
  `fun_codigo` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) default NULL,
  `direccion` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `barrio` varchar(50) default NULL,
  `ciudad` varchar(50) default NULL,
  `dni` varchar(50) default NULL,
  `estado` varchar(10) default NULL,
  `telefono` varchar(30) default NULL,
  `celular` varchar(30) default NULL,
  `provincia` varchar(50) default NULL,
  `nacionalidad` varchar(50) default NULL,
  `profesion` varchar(50) default NULL,
  `fechanacimiento` date default NULL,
  `cargo` varchar(50) default NULL,
  `sueldo` double(10,2) default NULL,
  `login` varchar(10) default NULL,
  `pass` varchar(10) default NULL,
  `actotal` char(1) default NULL,
  PRIMARY KEY  (`fun_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `funcionario` */

insert  into `funcionario`(`fun_codigo`,`nombre`,`direccion`,`email`,`barrio`,`ciudad`,`dni`,`estado`,`telefono`,`celular`,`provincia`,`nacionalidad`,`profesion`,`fechanacimiento`,`cargo`,`sueldo`,`login`,`pass`,`actotal`) values (1,'Ariel Duarte','Molinas 852','arielpy@gmail.com','Urunday','Resistencia','31431944','Soltero','3624249010','3624249010','Chaco','Argentina','Developer',NULL,'Gerente',3500.00,'ariel','123','S'),(3,'Miguel Trmm','Julio Rocca','miguellillo@gmail.com','Burzum','Cordoba','48885557','Soltero','333','3333','Cordoba','Argentina','Ingeniero','1985-03-08','Developer',2550.00,'mr','123','S'),(4,'Betina Almada','San Juan 855','ba@hotmail.com','Las Malvinas','Buenos Aires','36666988','Soltero','888','888','Buenos Aires','Argentina','Quality Enginner','1985-03-08','QC',5500.00,'beti','123','N'),(6,'Ivan Duarte','Molinas 852','ivanpy@gmail.com','San Fernando','Resistencia','4555669','Casado','03624852741','0362455555','Chaco','Argentina','Analista de Sistemas','1985-03-08','Programador',10000.00,'ivan','ivan','N'),(7,'Amanda','Lima','elguille@gmail.com','Cañada','Saspeña','322.214.788','S','03624852741','03624852741','Chaco','Argentina','Quality Enginner','1985-12-05','Automation',5500.00,'guille','123','N');

/*Table structure for table `gasto_fon_fijo` */

DROP TABLE IF EXISTS `gasto_fon_fijo`;

CREATE TABLE `gasto_fon_fijo` (
  `gas_codigo` int(11) NOT NULL,
  `asig_nro` int(11) NOT NULL,
  `tdoc_codigo` int(11) default NULL,
  `gas_fecha` date default NULL,
  `gas_fecha_rend` date default NULL,
  `gas_monto` double(20,2) default NULL,
  PRIMARY KEY  (`gas_codigo`),
  KEY `tdoc_codigo` (`tdoc_codigo`),
  KEY `asig_nro` (`asig_nro`),
  CONSTRAINT `gasto_fon_fijo_ibfk_2` FOREIGN KEY (`tdoc_codigo`) REFERENCES `tipo_documento` (`tdoc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `gasto_fon_fijo_ibfk_3` FOREIGN KEY (`asig_nro`) REFERENCES `asignacion_ff` (`asig_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gasto_fon_fijo` */

/*Table structure for table `grupo` */

DROP TABLE IF EXISTS `grupo`;

CREATE TABLE `grupo` (
  `gru_codigo` int(11) NOT NULL auto_increment,
  `gru_nombre` varchar(50) default NULL,
  PRIMARY KEY  (`gru_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `grupo` */

insert  into `grupo`(`gru_codigo`,`gru_nombre`) values (1,'RESPUESTOS P/ MOTO                       '),(2,'REPUESTOS P/ BICICLETA                   '),(3,'ELECTRODOMESTICOS                        '),(4,'ACCESORIOS                               '),(5,'ACEITES Y LUBRICANTES                    '),(6,'ADHESIVOS Y SILICONAS                    '),(7,'HERRAMIENTAS                             '),(8,'RESORTES                                 '),(9,'CAMARA                                   '),(10,'CUBIERTA                                 '),(11,'BICICLETAS                               '),(12,'ARTICULOS BEBE                           '),(13,'MOTOCIERRA                               '),(14,'MAX POWER'),(15,'AVALANCH');

/*Table structure for table `importacion` */

DROP TABLE IF EXISTS `importacion`;

CREATE TABLE `importacion` (
  `imp_nro` int(10) unsigned NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `forc_codigo` int(11) NOT NULL,
  `imp_nrodespacho` varchar(50) NOT NULL,
  `imp_nrofact` varchar(50) default NULL,
  `imp_fecha` date default NULL,
  `imp_exe` double(20,3) default NULL,
  `imp_gra` double(20,3) default NULL,
  `imp_total` double(20,3) default NULL,
  `imp_cond` varchar(7) default NULL,
  `imp_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`imp_nro`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  KEY `pro_codigo` (`pro_codigo`),
  KEY `dep_codigo` (`dep_codigo`,`suc_codigo`),
  CONSTRAINT `importacion_ibfk_1` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `importacion_ibfk_2` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `importacion_ibfk_3` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `importacion_ibfk_4` FOREIGN KEY (`dep_codigo`, `suc_codigo`) REFERENCES `deposito` (`dep_codigo`, `suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `importacion` */

/*Table structure for table `marca` */

DROP TABLE IF EXISTS `marca`;

CREATE TABLE `marca` (
  `mar_codigo` int(11) NOT NULL auto_increment,
  `mar_nombre` varchar(50) default NULL,
  PRIMARY KEY  (`mar_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=latin1;

/*Data for the table `marca` */

insert  into `marca`(`mar_codigo`,`mar_nombre`) values (2,'MEGA MOLINO                                   '),(3,'BRISA                                    '),(4,'BRITANIA                                 '),(5,'KML                                      '),(6,'CMB                                      '),(7,'ZKL                                      '),(8,'MAX                                      '),(9,'NBN                                      '),(10,'NACHI                                    '),(11,'KOYO                                     '),(12,'URB                                      '),(13,'GULF                                     '),(14,'ITIBAN                                   '),(15,'YAMATO                                   '),(16,'BRAKE SHOES                              '),(17,'ISK                                      '),(18,'KMC                                      '),(19,'FLYING PIGEON                            '),(20,'DEERMOTOR                                '),(21,'DEERMOTOR MTB                            '),(22,'HIGHEST                                  '),(23,'BLICK                                    '),(24,'SALOM                                             '),(25,'CROMO FORTE                              '),(26,'RENASCENCA                               '),(27,'NGK                                      '),(28,'AIP                                      '),(29,'RIFFEL                                   '),(30,'COMETA                                   '),(31,'CATI                                     '),(32,'KHOOBRA                                  '),(33,'MMG                                      '),(34,'HELIO                                    '),(35,'JEC                                      '),(36,'LCK                                      '),(37,'CATALANO                                 '),(38,'NARVA                                    '),(39,'OSWA                                     '),(40,'ELF                                      '),(41,'CHEVRON                                  '),(42,'BARDAHL                                  '),(43,'MOTOBOR                                  '),(44,'CHAMPION                                 '),(45,'SPEEDOMETER                              '),(46,'BEST                                     '),(47,'CD-F                                     '),(48,'PARDAL PASBOR                            '),(49,'THL                                      '),(50,'DEEPAK                                   '),(51,'SUACO                                    '),(52,'JG                                       '),(53,'STAR                                     '),(54,'SOHOLD                                   '),(55,'DS                                       '),(56,'HALOGEN LAMPS                            '),(57,'AUTO LAMP                                '),(58,'SILISUR                                  '),(59,'TERMINATOR                               '),(60,'ELECTRIC HORN                            '),(61,'KS                                                '),(62,'JING YI                                  '),(63,'TENSAI                                   '),(64,'AMBIKA                                   '),(65,'CHERRY                                   '),(66,'TOP                                      '),(67,'TOKO                                     '),(68,'MAHLE                                    '),(69,'METAL LEVE                               '),(70,'IKT                                      '),(71,'MAIN SWITCH                              '),(72,'WANGL                                    '),(73,'INF                                      '),(74,'I-ZEN                                    '),(75,'MOTORCYCLE                               '),(76,'DUAS BARRAS                              '),(77,'ZINC                                     '),(78,'TMA                                      '),(79,'TMB                                      '),(80,'TFB                                      '),(81,'EASTMAN                                  '),(82,'LEADER                                   '),(83,'VICTORIA                                 '),(84,'RUBBER                                   '),(85,'VIPAL                                    '),(86,'FLASH LIGHT                              '),(87,'XINGCHENG                                '),(88,'POXIPOL                                  '),(89,'FASTIX                                   '),(90,'BMB                                      '),(91,'PMA                                      '),(92,'BMA                                      '),(93,'AFA                                      '),(94,'AUTO OEM                                 '),(95,'ADHESIVOS INDUSTRIALES                   '),(96,'SHIMANO                                  '),(97,'LEVORIN                                  '),(98,'MONTANA                                  '),(99,'LEOPARD                                  '),(100,'RUBER                                    '),(101,'KENTON                                   '),(102,'GL150                                    '),(103,'LIBERTY                                  '),(104,'PROFIELD                                 '),(105,'BALLPUMP                                 '),(106,'CHJC OOH                                 '),(107,'AX 100                                   '),(108,'CITY                                     '),(109,'DAKAR                                    '),(110,'CYCLE CHAIN                                       '),(111,'C70                                      '),(112,'CG125                                             '),(113,'HERO PUCH                                '),(114,'KENDA                                    '),(115,'INDEX                                    '),(116,'STLU                                     '),(117,'JKS                                               '),(118,'MELC                                     '),(119,'MILANO                                   '),(120,'P R                                      '),(121,'NPR                                      '),(122,'RIK                                      '),(123,'TP                                       '),(124,'FLYNN                                             '),(125,'KIM                                      '),(126,'RING TOP                                 '),(127,'POWER RING                               '),(128,'PISTON RING                              '),(129,'ROIDE                                    '),(130,'GASKET                                   '),(131,'GASKET OEM                               '),(132,'VALFLEX                                  '),(133,'ZHETON                                   '),(134,'GUMP                                     '),(135,'OOH                                      '),(136,'GASKETS                                  '),(137,'GASKET SET                               '),(138,'JIALING                                  '),(139,'WL                                       '),(140,'MARANELLO                                '),(141,'HIDRO-OESTE                              '),(142,'BRECKAR                                  '),(143,'DIA FRAG                                 '),(144,'AQUARIUS                                 '),(145,'KENLI                                    '),(146,'LOCKING                                  '),(147,'MOTOTEC                                  '),(148,'AUTO LAMP BULBS                          '),(149,'MP                                       '),(150,'AUTO TEC                                 '),(151,'HANGDA ZHUOE                             '),(152,'CONSON                                   '),(153,'FIAMM                                    '),(154,'DIAMOND                                  '),(155,'YC                                       '),(156,'SPL                                      '),(157,'NIKEN                                    '),(158,'HYPER-F                                  '),(159,'AUTO STICKER                             '),(160,'HUADA                                    '),(161,'HT                                       '),(162,'DURO                                     '),(163,'D.I.D                                             '),(164,'METALCICLO                               '),(165,'NIPPON                                   '),(166,'KI-FREIO                                 '),(167,'TURNING LAMPS                            '),(168,'PERFECT TRUST                            '),(169,'SIVERST                                  '),(170,'SAFETY LIGHT                             '),(171,'TEC                                      '),(172,'MEGAVILLE                                '),(173,'ENINCO                                   '),(174,'CIRCUIT                                  '),(175,'SIMHWA                                   '),(176,'WAHSON                                   '),(177,'LA GOTITA                                '),(178,'UNIUM                                    '),(179,'PEDALS                                   '),(180,'TORK                                     '),(181,'KEYSTER                                  '),(182,'VORTEX                                   '),(183,'SAIOM                                    '),(184,'NATCO                                    '),(185,'BAILIDE                                  '),(186,'TRINITY                                  '),(187,'MAGNUM                                   '),(188,'NSK                                      '),(189,'NBR                                      '),(190,'HCH                                      '),(191,'KBC                                      '),(192,'LGGB                                     '),(193,'KGC                                      '),(194,'KFB                                      '),(195,'HONDA                               '),(196,'RSK                                 '),(197,'JINDAL FINE INDUSTRIES              '),(198,'MONI                                '),(199,'ETERNUM                             '),(200,'WESTER                              '),(201,'DUQUE                               '),(202,'T.T.A.                              '),(203,'TUO TE                              '),(204,'RAFAELA                             '),(205,'YASI                                '),(206,'FOG LAMP                            '),(207,'GTS                                 '),(208,'SAIGUAN                             '),(209,'GILONG                              '),(210,'SUPERFOG                            '),(211,'DEMTEC                              '),(212,'TRILHA                              '),(213,'ACS                                 '),(214,'RSO                                 '),(215,'BOSS');

/*Table structure for table `moneda` */

DROP TABLE IF EXISTS `moneda`;

CREATE TABLE `moneda` (
  `mon_codigo` int(11) NOT NULL,
  `mon_nombre` varchar(50) default NULL,
  `mon_simbolo` varchar(3) default NULL,
  PRIMARY KEY  (`mon_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `moneda` */

insert  into `moneda`(`mon_codigo`,`mon_nombre`,`mon_simbolo`) values (1,'GUARANIES','Gs.'),(2,'DOLAR                                             ','US$'),(3,'EURO                                   ','?'),(4,'PESO ARGENTINO                                    ','$  '),(5,'REAL                                              ','R$ ');

/*Table structure for table `motivoajuste` */

DROP TABLE IF EXISTS `motivoajuste`;

CREATE TABLE `motivoajuste` (
  `mtacodigo` int(11) NOT NULL,
  `mtanombre` varchar(50) default NULL,
  PRIMARY KEY  (`mtacodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `motivoajuste` */

/*Table structure for table `mov_caja` */

DROP TABLE IF EXISTS `mov_caja`;

CREATE TABLE `mov_caja` (
  `ope_nro` int(11) NOT NULL,
  `forc_codigo` int(11) default NULL,
  `ope_fecha` datetime default NULL,
  `ope_monto` double(20,2) default NULL,
  `ope_tipo` varchar(50) default NULL,
  `mon_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  KEY `mov_caja_FKIndex1` (`forc_codigo`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `ope_nro` (`ope_nro`),
  KEY `mon_codigo` (`mon_codigo`,`suc_codigo`),
  KEY `FK_mov_caja` (`suc_codigo`),
  CONSTRAINT `mov_caja_ibfk_1` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `mov_caja_ibfk_2` FOREIGN KEY (`ope_nro`) REFERENCES `apercierre` (`ope_nro`) ON UPDATE NO ACTION,
  CONSTRAINT `mov_caja_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `mov_caja_ibfk_4` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mov_caja` */

insert  into `mov_caja`(`ope_nro`,`forc_codigo`,`ope_fecha`,`ope_monto`,`ope_tipo`,`mon_codigo`,`suc_codigo`) values (3,1,'2007-07-10 16:55:16',39600.00,'COBRO VENTA CONTADO',1,1),(4,1,'2007-12-06 15:48:24',145750.00,'COBRO VENTA CONTADO',1,1),(4,1,'2007-12-06 16:28:04',39600.00,'COBRO VENTA CONTADO',1,1),(4,1,'2007-12-06 16:34:42',309600.00,'COBRO VENTA CONTADO',1,1),(5,1,'2007-12-21 12:22:44',6000.00,'COBRO VENTA CONTADO',1,1),(5,1,'2007-12-22 07:54:13',28000.00,'COBRO VENTA CONTADO',1,1),(6,1,'2007-12-22 10:17:37',30000.00,'COBRO VENTA CONTADO',1,1),(6,1,'2007-12-22 10:49:26',60000.00,'COBRO VENTA CONTADO',1,1),(6,1,'2007-12-22 10:57:27',22000.00,'COBRO VENTA CONTADO',1,1),(6,1,'2007-12-22 15:14:31',6000.00,'COBRO VENTA CONTADO',1,1),(6,1,'2007-12-22 16:36:08',39000.00,'COBRO VENTA CONTADO',1,1),(6,1,'2007-12-22 19:19:12',94300.00,'COBRO VENTA CONTADO',1,1),(6,1,'2007-12-22 19:28:39',25000.00,'COBRO VENTA CONTADO',1,1),(7,1,'2007-12-24 09:02:23',8800.00,'COBRO VENTA CONTADO',1,1),(7,1,'2007-12-24 09:21:37',11000.00,'COBRO VENTA CONTADO',1,1),(7,1,'2007-12-24 09:40:53',9900.00,'COBRO VENTA CONTADO',1,1),(7,1,'2007-12-24 10:31:55',19000.00,'COBRO VENTA CONTADO',1,1),(7,1,'2007-12-24 10:59:30',120000.00,'COBRO VENTA CONTADO',1,1),(5,1,'2007-12-24 11:16:14',49000.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 11:43:39',3300.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 11:49:39',1650.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 11:56:58',8250.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 12:04:59',120000.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 12:16:18',14000.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 12:19:32',120000.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 12:25:44',11000.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 12:27:20',1650.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 12:52:15',110000.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 13:17:51',90000.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 14:54:31',13000.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 15:40:31',3000.00,'COBRO VENTA CONTADO',1,1),(8,1,'2007-12-24 16:04:29',95000.00,'COBRO VENTA CONTADO',1,1),(9,1,'2007-12-26 10:28:43',10000.00,'COBRO VENTA CONTADO',1,1),(9,1,'2007-12-26 10:34:59',32800.00,'COBRO VENTA CONTADO',1,1),(9,1,'2007-12-26 11:03:29',120000.00,'COBRO VENTA CONTADO',1,1),(9,1,'2007-12-26 11:04:52',100000.00,'COBRO VENTA CONTADO',1,1),(9,1,'2007-12-26 11:06:09',100000.00,'COBRO VENTA CONTADO',1,1),(9,1,'2007-12-26 11:09:43',11000.00,'COBRO VENTA CONTADO',1,1),(9,1,'2007-12-27 17:18:31',30000.00,'COBRO VENTA CONTADO',1,1),(9,1,'2007-12-27 20:27:29',90000.00,'COBRO VENTA CONTADO',1,1),(10,1,'2007-12-28 20:37:08',120000.00,'COBRO VENTA CONTADO',1,1),(11,1,'2007-12-29 16:24:39',120000.00,'COBRO VENTA CONTADO',1,1),(11,1,'2007-12-29 16:56:15',8500.00,'COBRO VENTA CONTADO',1,1),(11,1,'2007-12-29 18:30:33',30000.00,'COBRO VENTA CONTADO',1,1),(11,1,'2007-12-29 18:33:37',365000.00,'COBRO VENTA CONTADO',1,1),(11,1,'2007-12-29 18:47:34',62000.00,'COBRO VENTA CONTADO',1,1),(12,1,'2007-12-31 08:21:05',4000.00,'COBRO VENTA CONTADO',1,1),(12,1,'2007-12-31 10:16:54',24000.00,'COBRO VENTA CONTADO',1,1),(12,1,'2007-12-31 10:36:36',18000.00,'COBRO VENTA CONTADO',1,1),(12,1,'2007-12-31 13:34:29',120000.00,'COBRO VENTA CONTADO',1,1),(12,1,'2007-12-31 17:00:34',80000.00,'COBRO VENTA CONTADO',1,1),(13,1,'2008-01-02 11:33:04',8000.00,'COBRO VENTA CONTADO',1,1),(14,1,'2008-01-03 17:41:48',120000.00,'COBRO VENTA CONTADO',1,1),(14,1,'2008-01-03 20:13:57',120000.00,'COBRO VENTA CONTADO',1,1),(15,1,'2008-01-04 09:42:28',295000.00,'COBRO VENTA CONTADO',1,1),(15,1,'2008-01-04 10:08:31',30000.00,'COBRO VENTA CONTADO',1,1),(15,1,'2008-01-04 10:53:50',120000.00,'COBRO VENTA CONTADO',1,1),(15,1,'2008-01-04 10:55:56',115000.00,'COBRO VENTA CONTADO',1,1),(16,1,'2008-01-04 19:17:01',125000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 12:11:56',245000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 17:15:36',250000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 17:48:30',295000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 18:44:16',280000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 19:34:13',285000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 19:57:00',310000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 20:15:12',28000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 20:36:12',240000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 21:22:08',340000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 22:48:23',125000.00,'COBRO VENTA CONTADO',1,1),(17,1,'2008-01-05 23:33:56',125000.00,'COBRO VENTA CONTADO',1,1),(18,1,'2008-01-06 11:38:36',120000.00,'COBRO VENTA CONTADO',1,1),(18,1,'2008-01-06 11:41:51',15000.00,'COBRO VENTA CONTADO',1,1),(19,1,'2008-01-07 09:04:32',30000.00,'COBRO VENTA CONTADO',1,1),(19,1,'2008-01-07 11:50:16',95000.00,'COBRO VENTA CONTADO',1,1),(19,1,'2008-01-07 13:20:25',295000.00,'COBRO VENTA CONTADO',1,1),(19,1,'2008-01-07 16:22:07',30000.00,'COBRO VENTA CONTADO',1,1),(21,1,'2008-01-09 16:12:08',285000.00,'COBRO VENTA CONTADO',1,1),(23,1,'2008-01-11 07:58:28',110000.00,'COBRO VENTA CONTADO',1,1),(24,1,'2008-01-12 08:14:16',10000.00,'COBRO VENTA CONTADO',1,1),(26,1,'2008-01-14 14:41:52',75000.00,'COBRO VENTA CONTADO',1,1),(27,1,'2008-01-14 17:01:28',110000.00,'COBRO VENTA CONTADO',1,1),(27,1,'2008-01-14 19:12:09',110000.00,'COBRO VENTA CONTADO',1,1),(28,1,'2008-01-15 17:18:59',110000.00,'COBRO VENTA CONTADO',1,1),(29,1,'2008-01-16 10:50:02',110000.00,'COBRO VENTA CONTADO',1,1),(29,1,'2008-01-16 11:21:10',110000.00,'COBRO VENTA CONTADO',1,1),(1,1,'2008-01-18 11:11:28',110000.00,'COBRO VENTA CONTADO',1,1),(1,1,'2008-01-18 15:23:32',110000.00,'COBRO VENTA CONTADO',1,1),(1,1,'2008-01-18 15:24:55',110000.00,'COBRO VENTA CONTADO',1,1),(1,1,'2008-01-19 08:59:18',22000.00,'COBRO VENTA CONTADO',1,1),(1,1,'2008-01-19 09:00:07',500.00,'COBRO VENTA CONTADO',1,1),(33,1,'2008-01-22 14:45:48',550.00,'COBRO VENTA CONTADO',1,1),(34,1,'2008-01-22 17:13:08',105000.00,'COBRO VENTA CONTADO',1,1),(34,1,'2008-01-22 17:52:43',100000.00,'COBRO VENTA CONTADO',1,1),(34,1,'2008-01-22 20:01:35',110000.00,'COBRO VENTA CONTADO',1,1),(35,1,'2008-01-23 16:35:37',26000.00,'COBRO VENTA CONTADO',1,1),(37,1,'2008-01-28 17:18:21',110000.00,'COBRO VENTA CONTADO',1,1),(39,1,'2008-02-01 19:19:58',20000.00,'COBRO VENTA CONTADO',1,1),(43,1,'2008-02-06 09:09:45',75000.00,'COBRO VENTA CONTADO',1,1),(43,1,'2008-02-06 09:20:43',7700.00,'COBRO VENTA CONTADO',1,1),(43,1,'2008-02-06 09:38:13',126100.00,'COBRO VENTA CONTADO',1,1),(43,1,'2008-02-06 10:33:08',107000.00,'COBRO VENTA CONTADO',1,1),(44,1,'2008-02-08 09:46:52',11500.00,'COBRO VENTA CONTADO',1,1),(44,1,'2008-02-08 12:57:54',50000.00,'COBRO VENTA CONTADO',1,1),(44,1,'2008-02-08 17:54:58',110000.00,'COBRO VENTA CONTADO',1,1),(45,1,'2008-02-10 09:48:14',240000.00,'COBRO VENTA CONTADO',1,1),(48,1,'2008-02-13 19:10:01',110000.00,'COBRO VENTA CONTADO',1,1),(51,1,'2008-02-16 17:42:43',110000.00,'COBRO VENTA CONTADO',1,1),(52,1,'2008-02-17 11:03:22',27500.00,'COBRO VENTA CONTADO',1,1),(53,1,'2008-02-18 09:08:47',85000.00,'COBRO VENTA CONTADO',1,1),(53,1,'2008-02-18 11:11:54',10000.00,'COBRO VENTA CONTADO',1,1),(54,1,'2008-02-19 08:54:41',110000.00,'COBRO VENTA CONTADO',1,1),(56,1,'2008-02-21 11:21:19',110000.00,'COBRO VENTA CONTADO',1,1),(57,1,'2008-02-22 17:29:46',10000.00,'COBRO VENTA CONTADO',1,1),(58,1,'2008-02-23 10:27:04',295000.00,'COBRO VENTA CONTADO',1,1),(58,1,'2008-02-23 11:27:23',110000.00,'COBRO VENTA CONTADO',1,1),(58,1,'2008-02-23 11:50:54',62000.00,'COBRO VENTA CONTADO',1,1),(58,1,'2008-02-23 15:12:19',110000.00,'COBRO VENTA CONTADO',1,1),(59,1,'2008-02-24 12:32:57',108000.00,'COBRO VENTA CONTADO',1,1),(61,1,'2008-02-26 09:06:02',110000.00,'COBRO VENTA CONTADO',1,1),(62,1,'2008-02-27 08:39:33',125000.00,'COBRO VENTA CONTADO',1,1),(62,1,'2008-02-27 11:37:07',3000.00,'COBRO VENTA CONTADO',1,1),(69,1,'2008-03-23 11:09:15',22000.00,'COBRO VENTA CONTADO',1,1);

/*Table structure for table `nota_credito` */

DROP TABLE IF EXISTS `nota_credito`;

CREATE TABLE `nota_credito` (
  `nc_codigo` int(11) NOT NULL,
  `devo_nro` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  `clie_codigo` int(11) default NULL,
  `nc_fecha` date default NULL,
  `nc_motivo` varchar(50) NOT NULL,
  `nc_monto` double(20,3) NOT NULL,
  `c_nc_estado` varchar(1) default NULL,
  PRIMARY KEY  (`nc_codigo`),
  KEY `clie_codigo` (`clie_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  CONSTRAINT `nota_credito_ibfk_1` FOREIGN KEY (`clie_codigo`) REFERENCES `cliente` (`clie_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `nota_credito_ibfk_2` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `nota_credito` */

/*Table structure for table `ord_pago` */

DROP TABLE IF EXISTS `ord_pago`;

CREATE TABLE `ord_pago` (
  `ord_pago_nro` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `pro_codigo` int(11) default NULL,
  `ord_pago_fecha` date NOT NULL,
  `ord_pago_monto` double(20,3) NOT NULL,
  `ord_estado` varchar(7) default NULL,
  PRIMARY KEY  (`ord_pago_nro`),
  KEY `pro_codigo` (`pro_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  CONSTRAINT `ord_pago_ibfk_1` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `ord_pago_ibfk_2` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ord_pago` */

/*Table structure for table `orden_compra` */

DROP TABLE IF EXISTS `orden_compra`;

CREATE TABLE `orden_compra` (
  `ordc_nro` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `forc_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `ordc_fec_elab` date default NULL,
  `ordc_exe` double(20,3) default NULL,
  `ordc_gra` double(20,3) default NULL,
  `ordc_iva` double(20,3) default NULL,
  `ordc_total` double(20,3) default NULL,
  `ordc_cond` varchar(7) default NULL,
  `ordc_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`ordc_nro`),
  KEY `pro_codigo` (`pro_codigo`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `dep_codigo` (`dep_codigo`),
  CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `orden_compra_ibfk_2` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `orden_compra_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `orden_compra_ibfk_4` FOREIGN KEY (`dep_codigo`) REFERENCES `deposito` (`dep_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `orden_compra_ibfk_5` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orden_compra` */

/*Table structure for table `orden_pago` */

DROP TABLE IF EXISTS `orden_pago`;

CREATE TABLE `orden_pago` (
  `ord_pago_nro` int(10) unsigned NOT NULL auto_increment,
  `pro_codigo` int(11) NOT NULL,
  `com_nro` int(11) NOT NULL,
  `ord_pago_fecha` date default NULL,
  `ord_pago_monto` double(20,3) default NULL,
  `ord_estado` varchar(1) default NULL,
  PRIMARY KEY  (`ord_pago_nro`),
  KEY `com_nro` (`com_nro`),
  KEY `pro_codigo` (`pro_codigo`),
  CONSTRAINT `orden_pago_ibfk_1` FOREIGN KEY (`com_nro`) REFERENCES `cta_a_pagar` (`com_nro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orden_pago_ibfk_2` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orden_pago` */

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `pag_nro` int(10) unsigned NOT NULL,
  `ord_pago_nro` int(10) unsigned default NULL,
  `forc_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `pro_codigo` int(11) NOT NULL,
  `pag_fecha` date default NULL,
  `pag_monto` double(20,3) default NULL,
  `pag_cambio` double(10,2) default NULL,
  PRIMARY KEY  (`pag_nro`),
  KEY `pro_codigo` (`pro_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `forc_codigo` (`forc_codigo`),
  KEY `ord_pago_nro` (`ord_pago_nro`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`pro_codigo`) REFERENCES `proveedor` (`pro_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagos_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagos_ibfk_4` FOREIGN KEY (`forc_codigo`) REFERENCES `forma_cobro` (`forc_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pagos_ibfk_5` FOREIGN KEY (`ord_pago_nro`) REFERENCES `orden_pago` (`ord_pago_nro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pagos` */

/*Table structure for table `pais` */

DROP TABLE IF EXISTS `pais`;

CREATE TABLE `pais` (
  `pais_codigo` int(11) NOT NULL,
  `pais_nombre` varchar(50) default NULL,
  `pais_gentilicio` varchar(50) default NULL,
  PRIMARY KEY  (`pais_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pais` */

insert  into `pais`(`pais_codigo`,`pais_nombre`,`pais_gentilicio`) values (1,'Argentina','Argentino'),(2,'Paraguay','Paraguayo');

/*Table structure for table `pedido_cliente` */

DROP TABLE IF EXISTS `pedido_cliente`;

CREATE TABLE `pedido_cliente` (
  `pedclie_nro` int(11) NOT NULL,
  `clie_codigo` int(11) default NULL,
  `mon_codigo` int(11) default NULL,
  `suc_codigo` int(11) default NULL,
  `dep_codigo` int(11) default NULL,
  `pedclie_fecha` date default NULL,
  `pedclie_exe` double(20,2) default NULL,
  `pedclie_gra` double(20,2) default NULL,
  `pedclie_iva` double(10,2) default NULL,
  `pedclie_total` double(20,2) default NULL,
  `pedclie_cond` varchar(7) default NULL,
  PRIMARY KEY  (`pedclie_nro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedido_cliente` */

/*Table structure for table `pedido_dep` */

DROP TABLE IF EXISTS `pedido_dep`;

CREATE TABLE `pedido_dep` (
  `peded_nro` int(10) unsigned NOT NULL auto_increment,
  `pdep_fecha` date default NULL,
  PRIMARY KEY  (`peded_nro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedido_dep` */

/*Table structure for table `presupuesto` */

DROP TABLE IF EXISTS `presupuesto`;

CREATE TABLE `presupuesto` (
  `presu_nro` int(11) NOT NULL,
  `clie_codigo` int(11) NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `presu_fecha` date NOT NULL,
  `presu_exe` double(20,3) default NULL,
  `presu_gra` double(20,3) default NULL,
  `presu_iva` double(20,3) default NULL,
  `presu_total` double(20,3) default NULL,
  `presu_cond` varchar(7) default NULL,
  PRIMARY KEY  (`presu_nro`),
  KEY `clie_codigo` (`clie_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  KEY `dep_codigo` (`dep_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `presupuesto_ibfk_1` FOREIGN KEY (`clie_codigo`) REFERENCES `cliente` (`clie_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `presupuesto_ibfk_2` FOREIGN KEY (`dep_codigo`) REFERENCES `deposito` (`dep_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `presupuesto_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `presupuesto_ibfk_4` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `presupuesto` */

/*Table structure for table `privilegios` */

DROP TABLE IF EXISTS `privilegios`;

CREATE TABLE `privilegios` (
  `usuario` varchar(16) default NULL COMMENT 'USUARIO DEL SISTEMA',
  `password` varchar(70) default NULL COMMENT 'LOGIN DEL USUARIO',
  `m_archivo` int(1) default NULL COMMENT 'MENU ARCHIVO',
  `m_archivo_1` int(1) default NULL COMMENT 'MENU COMERCIALES',
  `m_archivo_2` int(1) default NULL COMMENT 'MENU FINANCIEROS',
  `m_archivo_3` int(1) default NULL COMMENT 'MENU ARTICULOS',
  `m_archivo_4` int(1) default NULL COMMENT 'MENU MOVIMIENTOS',
  `m_archivo_5` int(1) default NULL COMMENT 'MENU EMPRESA',
  `m_compra` int(1) default NULL COMMENT 'MENU COMPRA',
  `m_compra_1` int(1) default NULL COMMENT 'MENU ORDEN DE COMPRAS',
  `m_compra_2` int(1) default NULL COMMENT 'MENU COMPRAS',
  `m_compra_3` int(1) default NULL COMMENT 'MENU NOTA DE CREDITO',
  `m_compra_4` int(1) default NULL,
  `m_venta` int(1) default NULL COMMENT 'MENU VENTA',
  `m_venta_1` int(1) default NULL COMMENT 'MENU PRESUPUESTO',
  `m_venta_2` int(1) default NULL COMMENT 'MENU PEDIDO DE CLIENTE',
  `m_venta_3` int(1) default NULL COMMENT 'MENU VENTAS',
  `m_venta_4` int(1) default NULL COMMENT 'MENU DEVOLUCIONES',
  `m_venta_5` int(1) default NULL COMMENT 'MENU ANULAR VENTAS',
  `m_cobranza` int(1) default NULL COMMENT 'MENU COBRANZA',
  `m_cobro_1` int(1) default NULL COMMENT 'MENU APERTURA CIERRE',
  `m_cobro_2` int(1) default NULL COMMENT 'MENU COBRO DE VENTAS',
  `m_cobro_3` int(1) default NULL COMMENT 'MENU COBRO DE VENTAS',
  `m_cobro_4` int(1) default NULL COMMENT 'MENU RECAUDACIONES DE A DEPOSITAR',
  `m_tesoreria` int(1) default NULL COMMENT 'MENU TESORERIA',
  `m_tesoreria_1` int(1) default NULL COMMENT 'MENU DE CARGA DE FACTURAS',
  `m_tesoreria_2` int(1) default NULL COMMENT 'MENU ORDEN DE PAGO',
  `m_tesoreria_3` int(1) default NULL COMMENT 'MENU ASIGNACION DE FONDO FIJO',
  `m_tesoreria_4` int(1) default NULL COMMENT 'MENU GASTOS DE FONDO FIJO',
  `m_tesoreria_5` int(1) default NULL COMMENT 'MENU RENDIR FONDO FIJO',
  `m_tesoreria_6` int(1) default NULL COMMENT 'MENU CONCIALIACION BANCARIA',
  `m_tesoreria_7` int(1) default NULL COMMENT 'MENU CARGA DE OTROS CREDITOS Y DEBITOS',
  `m_tesoreria_8` int(1) default NULL COMMENT 'MENU DEPOSITO BANCARIO',
  `m_inventario` int(1) default NULL COMMENT 'MENU INVENTARIO',
  `m_inventario_1` int(1) default NULL COMMENT 'MENU PEDIDO DE COMPRAS',
  `m_inventario_2` int(1) default NULL COMMENT 'MENU AJUSTE DE INVENTARIO',
  `m_inventario_3` int(1) default NULL COMMENT 'MENU TRANSFERENCIAS ',
  `m_inventario_4` int(1) default NULL COMMENT 'MENU LISTADO PARA INVETARIO',
  `m_informe` int(1) default NULL COMMENT 'MENU INFORMES',
  `m_informe_1` int(1) default NULL COMMENT 'MENU INFORME VARIOS',
  `m_informe_2` int(1) default NULL COMMENT 'MENU INFORME COMPRAS',
  `m_informe_3` int(1) default NULL COMMENT 'MENU INFORME VENTAS',
  `m_informe_4` int(1) default NULL COMMENT 'MENU INFORME COBRANZAS',
  `m_informe_5` int(1) default NULL COMMENT 'MENU INFORME TESORERIA',
  `m_informe_6` int(1) default NULL COMMENT 'MENU INFORME INVENTARIO',
  `m_herraminetas` int(1) default NULL COMMENT 'MENU HERRAMIENTAS',
  `m_calc_1` int(1) default NULL COMMENT 'CALCULADORA',
  `m_cont_2` int(1) default NULL COMMENT 'OUTLOOK',
  `m_agen_3` int(1) default NULL COMMENT 'AGENDA',
  `m_backup_4` int(1) default NULL COMMENT 'BACKUP DE DATOS',
  `m_impresora` int(1) default NULL COMMENT 'CONFIGURACION DE IMPRESORA',
  `m_pdf_5` int(1) default NULL COMMENT 'INSTALAR IMPRESORA PDF',
  `m_internet_6` int(1) default NULL COMMENT 'NAVEGAR CON INTERNET EXPLORER DEL SISTEMA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `privilegios` */

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `pro_codigo` int(11) NOT NULL auto_increment,
  `ciu_codigo` int(11) default NULL,
  `pro_razon` varchar(50) default NULL,
  `pro_ruc` varchar(50) default NULL,
  `pro_direc` varchar(50) default NULL,
  `pro_telef` varchar(30) default NULL,
  `pro_fax` varchar(50) default NULL,
  `pro_mail` varchar(50) default NULL,
  `pro_iva` int(11) default NULL,
  `pais_codigo` int(11) default NULL,
  PRIMARY KEY  (`pro_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `proveedor` */

insert  into `proveedor`(`pro_codigo`,`ciu_codigo`,`pro_razon`,`pro_ruc`,`pro_direc`,`pro_telef`,`pro_fax`,`pro_mail`,`pro_iva`,`pais_codigo`) values (1,2,'Belen Baumas','45554555','Julio Rocca','666','55','ba@hotmail.com',2,1),(3,2,'Michelle Olmedo','1111','Avda. Rocca 7778','11','121545','sl@hotmail.com',1,1),(4,1,'Marisol Benitez','77777','Florianopolis','444','444','adritelo84@gmail.com',1,1),(5,1,'Milton Garcia','1122','Barrio Norte','011144888','011145555','mil@yahoo.com',1,1),(6,1,'Annotations Test','Hibernate','Lima','11','00000','arielpy@gmail.com',1,1);

/*Table structure for table `rendicion_ff` */

DROP TABLE IF EXISTS `rendicion_ff`;

CREATE TABLE `rendicion_ff` (
  `rend_nro` int(11) NOT NULL auto_increment,
  `asig_nro` int(11) default NULL,
  `rend_fecha` date default NULL,
  `rend_monto_asig` double(20,2) default NULL,
  `rend_monto_rendido` double(20,2) default NULL,
  `rend_saldo` double(20,2) default NULL,
  PRIMARY KEY  (`rend_nro`),
  UNIQUE KEY `rend_nro` (`rend_nro`),
  KEY `asig_nro` (`asig_nro`),
  CONSTRAINT `rendicion_ff_ibfk_1` FOREIGN KEY (`asig_nro`) REFERENCES `asignacion_ff` (`asig_nro`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rendicion_ff` */

/*Table structure for table `responsable_ff` */

DROP TABLE IF EXISTS `responsable_ff`;

CREATE TABLE `responsable_ff` (
  `resp_codigo` int(11) NOT NULL,
  `resp_cip` varchar(30) default NULL,
  `resp_nombre` varchar(50) default NULL,
  `resp_apellido` varchar(50) default NULL,
  PRIMARY KEY  (`resp_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `responsable_ff` */

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `art_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `st_existencia` int(11) default NULL,
  PRIMARY KEY  (`art_codigo`,`suc_codigo`,`dep_codigo`),
  KEY `stock_FKIndex1` (`art_codigo`),
  KEY `stock_FKIndex2` (`dep_codigo`,`suc_codigo`),
  KEY `suc_codigo` (`suc_codigo`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`dep_codigo`, `suc_codigo`) REFERENCES `deposito` (`dep_codigo`, `suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `stock_ibfk_3` FOREIGN KEY (`suc_codigo`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock` */

/*Table structure for table `sucursal` */

DROP TABLE IF EXISTS `sucursal`;

CREATE TABLE `sucursal` (
  `suc_codigo` int(11) NOT NULL,
  `suc_nombre` varchar(30) default NULL,
  `suc_direccion` varchar(30) default NULL,
  `suc_telefono` varchar(30) default NULL,
  `caj_ultinro` int(11) default NULL,
  PRIMARY KEY  (`suc_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sucursal` */

insert  into `sucursal`(`suc_codigo`,`suc_nombre`,`suc_direccion`,`suc_telefono`,`caj_ultinro`) values (1,'CASA CENTRAL','DEFENSORES DEL CHACO          ','123 456                       ',71);

/*Table structure for table `tipo_cheque` */

DROP TABLE IF EXISTS `tipo_cheque`;

CREATE TABLE `tipo_cheque` (
  `tp_cheq` int(10) unsigned NOT NULL auto_increment,
  `tp_cheqnombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`tp_cheq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tipo_cheque` */

insert  into `tipo_cheque`(`tp_cheq`,`tp_cheqnombre`) values (1,'NORMAL                                            '),(2,'CRUZADO                                    '),(3,'A LARGO PLAZO                              '),(4,'DIFERIDO                                   '),(5,'AL PORTADOR                                ');

/*Table structure for table `tipo_documento` */

DROP TABLE IF EXISTS `tipo_documento`;

CREATE TABLE `tipo_documento` (
  `tdoc_codigo` int(11) NOT NULL,
  `tdoc_nombre` varchar(50) default NULL,
  PRIMARY KEY  (`tdoc_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_documento` */

insert  into `tipo_documento`(`tdoc_codigo`,`tdoc_nombre`) values (1,'SIN COMPROBANTE                                   '),(2,'TICKET                                            '),(3,'TICKET FACTURA                           '),(4,'BOLETA DE VENTA                                   '),(5,'FACTURA                                  ');

/*Table structure for table `tipo_grupo` */

DROP TABLE IF EXISTS `tipo_grupo`;

CREATE TABLE `tipo_grupo` (
  `tg_codigo` int(11) NOT NULL,
  `gru_codigo` int(11) NOT NULL,
  `tg_nombre` varchar(50) default NULL,
  PRIMARY KEY  (`tg_codigo`),
  KEY `tipo_articulo_FKIndex1` (`gru_codigo`),
  CONSTRAINT `tipo_grupo_ibfk_1` FOREIGN KEY (`gru_codigo`) REFERENCES `grupo` (`gru_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_grupo` */

insert  into `tipo_grupo`(`tg_codigo`,`gru_codigo`,`tg_nombre`) values (1,3,'VENTILADOR DE PIE                        '),(2,3,'VENTILADORES DE TECHO                    '),(3,3,'LICUADORA                                '),(4,1,'RULEMANES                                '),(5,1,'FIBRA DE FRENO                           '),(6,2,'CADENAS                                  '),(7,1,'FOCO                                              '),(8,4,'EXTENSOR                                 '),(9,4,'ESPEJO RETROVISOR                                 '),(10,1,'BUJIAS                                   '),(11,1,'SE?ALERO                                          '),(12,1,'CRISTAL SOLO                             '),(13,1,'BOBINA ALTA                              '),(14,1,'PI?ON                                    '),(15,1,'PEDAL DE FRENO                           '),(16,1,'CORONA                                   '),(17,1,'TAPA MAZA                                '),(18,2,'CONO                                     '),(19,1,'EJE                                      '),(20,2,'DESCARRILADOR                            '),(21,2,'RUEDITA DE DESCARRILADOR                 '),(22,1,'PERNO BUJE CORONA                        '),(23,1,'PASTILLA DE FRENO                        '),(24,1,'FARO DELANTERO                           '),(25,1,'FARO TRASERO                             '),(26,2,'DISCO PROTECTOR DE RAYOS                          '),(27,2,'MANOPLA                                  '),(28,5,'ACEITE MOTOR                                      '),(29,1,'BUJE                                     '),(30,1,'TABLERO VELOCIMETRO                      '),(31,1,'SELENIO                                  '),(32,4,'SE?ALERO                                 '),(33,4,'CARCAZA                                  '),(34,1,'RELAY DE ARRANQUE                        '),(35,4,'GOMA POSAPIE                             '),(36,4,'GUARDA POLVO                             '),(37,1,'RELAY SE?ALERO                           '),(38,4,'CAMPANILLA GRANDE                        '),(39,1,'SILENCIADOR                              '),(40,4,'LLAVE PIPA                               '),(41,1,'ESTIRA CADENA                            '),(42,1,'PORTA FOCO                               '),(43,1,'GUARDACADENA                             '),(44,4,'GOMA GUERDACADENA                        '),(45,1,'PISTON                                   '),(46,1,'ARO                                      '),(47,1,'LLAVE MANUBRIO                           '),(48,1,'FIBRA DE EMBRAGUE                        '),(49,4,'BOCINA                                   '),(50,1,'MANIVELA                                 '),(51,4,'CERA                                     '),(52,1,'CARBURADOR                               '),(53,1,'PORTA CABLES                             '),(54,4,'GOMA PARA MATA PERRO                     '),(55,4,'GOMA P/ TANQUE                           '),(56,4,'CINTILLO                                 '),(57,4,'GOMA TAPON                               '),(58,4,'LINTERNA DELANTERA                       '),(59,1,'JUNTA                                    '),(60,1,'PALANCA                                  '),(61,1,'VALVULA                                  '),(62,1,'FILTRO                                   '),(63,1,'PISTON C/ ARO                            '),(64,1,'LLAVE CONTACTO                           '),(65,4,'TUERCA                                   '),(66,4,'BULON                                    '),(67,4,'TORNILLO                                 '),(68,2,'PI?ON                                    '),(69,6,'SOLUCION                                 '),(70,6,'PARCHES                                  '),(71,4,'REFLECTORES                                       '),(72,6,'PEGAMENTO                                '),(73,6,'SILICONA PARA JUNTAS DE MOTOR                     '),(74,4,'MANGUERA CRISTAL                         '),(75,4,'COLA DE PATO                             '),(76,1,'PATADA DE ARRANQUE                       '),(77,1,'MANILLAR                                 '),(78,1,'GRIFO                                    '),(79,2,'PATIN DE FRENO                           '),(80,1,'RETEN                                    '),(81,2,'CUBIERTA                                 '),(82,4,'FARO                                     '),(83,4,'CANASTA                                  '),(84,4,'FARO DELANTERO                                    '),(85,4,'CRISTAL                                  '),(86,1,'TANQUE                                   '),(87,4,'GUARDABARRO                              '),(88,1,'INTERRUPTOR                              '),(89,1,'JUEGO DE BIELA                           '),(90,1,'GENERADOR                                '),(91,2,'RUEDA PLASTICA                           '),(92,4,'CAJA PORTABULTO                          '),(93,4,'CAJA P/ HERRAMIENTAS                              '),(94,1,'CADENA                                   '),(95,2,'MANIVELA                                 '),(96,4,'MANDIL                                   '),(97,2,'RUEDA LATERAL                            '),(98,4,'INFLADOR                                 '),(99,2,'CORONA                                   '),(100,4,'TAPA                                     '),(101,1,'TAPON                                    '),(102,4,'GUIA DE CABLE                            '),(103,4,'COLLAR                                   '),(104,1,'JUEGO DE ARO                             '),(105,4,'CASCO                                    '),(106,7,'LLAVE                                    '),(107,7,'PINZA CORTE                              '),(108,7,'PINZA P/ SEGURO                          '),(109,4,'FICHA P/ ANTENA                                   '),(110,4,'ANTENA P/ TV                                      '),(111,4,'GOMA ELASTICA                            '),(112,1,'GOMA MAZA                                '),(113,4,'MARCADOR TANQUE                          '),(114,4,'PORTA FOCO                               '),(115,4,'PUNTERA                                  '),(116,4,'VISOR                                    '),(117,4,'FARO TRASERO                             '),(118,4,'TAPA LATERAL                             '),(119,1,'POSAPIE                                  '),(120,1,'ANILLO RETEN                             '),(121,2,'LLANTA                                   '),(122,4,'MANGUERA P/ INFLADOR                              '),(123,2,'MAZA                                     '),(124,4,'FORRO P/ CABO                            '),(125,2,'BULON                                    '),(126,1,'PEDAL DE CAMBIO                          '),(127,2,'TUERCA                                   '),(128,1,'BATERIA                                  '),(129,4,'FUSIBLE CRISTAL                          '),(130,1,'CUBIERTAS                                         '),(131,2,'PEDAL                                    '),(132,2,'CA?O DE ASIENTO                          '),(133,2,'GUARDABARRO                              '),(134,2,'EJE DELANTERO                            '),(135,1,'PROTECTOR DE SUCIEDAD                    '),(136,4,'CINTA SUJETA BATERIA                     '),(137,1,'ENGRANAJE VELOCIMETRO                    '),(138,8,'EJE DE ARRANQUE                          '),(139,1,'SOPORTE                                  '),(140,1,'ESPEJO                                   '),(141,1,'VELOCIMETRO COMPLETO                     '),(142,1,'CABO DE CAMBIO                                    '),(143,2,'MANIVELA DE CAMBIO                       '),(144,1,'ENGRANAJE                                '),(145,1,'CABO VELOCIMETRO                         '),(146,1,'MANIVELA DE FRENO                        '),(147,1,'CUBRE CADENA                             '),(148,1,'COVERTOR                                 '),(149,1,'TUBO SILENCIADOR                         '),(150,1,'VALVULA ESCAPE                           '),(151,1,'GUIA VALVULA                             '),(152,1,'ANILLO SEGURO                            '),(153,1,'TAPA TANQUE                              '),(154,1,'CABO EMBRAGUE                            '),(155,1,'TENSOR CADENA                            '),(156,4,'GUANTES                                  '),(157,4,'FARO DELANTERO A PILA                    '),(158,2,'SOPORTE LATERAL                          '),(159,2,'JUEGO CUBETA CENTRAL                     '),(160,2,'EJE TRASERO                              '),(161,2,'CABO                                     '),(162,1,'TAPA GENERADOR                                    '),(164,1,'TAPA MOTOR                               '),(165,1,'EJE ARRANQUE                             '),(166,9,'CAMARA MOTO                              '),(167,1,'PRENSACABO                               '),(168,2,'EJE CENTRAL ZETA                         '),(169,1,'FILTRO DE COMBUSTIBLE                    '),(170,4,'RED P/ CASCO                             '),(171,1,'TUBO DE ACELERADOR                       '),(172,11,'ARO 12                                   '),(173,11,'ARO 16                                   '),(174,11,'ARO 20                                   '),(175,1,'JUEGO DE JUNTAS                          '),(176,1,'BUJE ESPACIADOR                                   '),(177,1,'PROTECTOR CADENA                         '),(178,1,'ACOPLE                                   '),(179,2,'MANUBRIO                                 '),(180,1,'MEDIDOR DE ACEITE                        '),(181,1,'JUNTA ESCAPE                             '),(182,4,'BOLSO                                    '),(183,1,'CABO DE ACELERADOR                       '),(184,4,'GUARDACADENA                             '),(185,1,'DISCO EMBRAGUE                           '),(186,1,'BARRA TENSOR CADENA                      '),(187,4,'PROTECTOR                                         '),(188,1,'STATOR                                   '),(189,1,'CORONITA LEVA                            '),(190,1,'MEDIA LUNA                               '),(191,1,'CABO SOLO                                '),(192,10,'CUBIERTA MOTO                                     '),(193,8,'AMORTIGUADOR                             '),(194,4,'GUIA CADENA                              '),(195,4,'TAPA SUPERIOR                            '),(196,8,'CABALLETE                                '),(197,1,'CILINDRO                                 '),(198,1,'TAPA COSTADO                             '),(199,1,'TAPA CILINDRO                            '),(200,4,'COBERTOR                                 '),(201,1,'BARRA POSAPIE                            '),(202,4,'SOSTEN LATERAL                           '),(203,2,'AMORTIGUADOR                             '),(204,2,'ASIENTO                                  '),(205,2,'HORQUILLA                                '),(206,2,'JUEGO DE MAZA                                     '),(207,4,'ACRILICO FARO TRASERO                    '),(208,4,'POSAPIE TRASERO                          '),(209,7,'LLAVE \" L\"                               '),(210,1,'CDI                                      '),(211,1,'AMORTIGUADOR TRASERO                     '),(212,1,'AMORTIGUADOR DELANTERO                   '),(213,4,'FOCO DELANTERO                           '),(214,1,'JUEGO BULON CORONA                       '),(215,1,'JUNTA TAPA CILINDRO                      '),(216,4,'SOSTEN CENTRAL                           '),(217,1,'BULBO DE FRENO                           '),(218,4,'GOMA MAZA                                         '),(219,1,'GUIA ACELERADOR                          '),(220,4,'FOCO SE?ALERO                            '),(221,4,'CASCO INFANTIL                           '),(222,1,'CABO DE FRENO                            '),(223,1,'RAYO                                     '),(224,4,'LUZ DECORATIVA                                    '),(225,4,'PORTAFUSIBLE                             '),(226,4,'BUSCAHUELLA                              '),(227,4,'PORTA CHAPA                              '),(228,4,'CALCOMANIA                               '),(229,1,'VALVULA ADMISION                         '),(230,1,'RELAY SE?ALERO Y BULBO DE FRENO          '),(231,1,'TAPON DE ACEITE                          '),(232,1,'PERNO PISTON                             '),(233,1,'PEDAL DE ARRANQUE                        '),(234,10,'CUBIERTA BICICLETA                       '),(235,4,'MANUBRIO                                 '),(236,1,'CADENITA                                 '),(237,4,'MANOPLA                                  '),(238,1,'CABO RPM                                 '),(239,4,'ARANDELA DE GOMA                         '),(240,1,'SEGURO PI?ON                             '),(241,1,'JUEGO DE DIRECCION                                '),(242,4,'LUZ                                               '),(243,1,'MECANISMO DE FRENO                       '),(244,1,'HORQUILLA                                '),(245,2,'RUEDITA LATERAL                          '),(246,1,'UNION DE CADENA                          '),(247,1,'PORTA CORONA                             '),(248,1,'MAZA TRASERA                             '),(249,1,'MAZA DELANTERA                           '),(250,1,'REGULADOR                                '),(251,1,'FLOTADOR                                 '),(252,1,'CUBETA                                   '),(253,4,'PERILLA                                  '),(254,1,'BOBINA ARRANQUE                          '),(255,4,'CANDADO                                  '),(256,1,'BOBINA LUZ                               '),(257,9,'CAMARA BICICLETA                         '),(258,4,'FORRO DE ASIENTO                         '),(259,1,'RAYOS                                    '),(260,4,'PROTECTOR DE MANUBRIO                    '),(261,2,'CABO DE CAMBIO                                    '),(262,2,'JUEGO DE DIRECCION                       '),(263,3,'VENTILADOR DE MESA                       '),(264,6,'ADHESIVO INSTANTANEO                     '),(265,12,'ANDADOR                                  '),(266,1,'BRASITO DE FRENO                         '),(267,1,'TUBO DE AIRE                             '),(268,2,'MANIJA DE FRENO                          '),(269,3,'PLANCHA                                  '),(270,4,'CUERNITOS                                '),(271,11,'BICICLETA                                '),(272,1,'MANGUERA DE FLUIDO                       '),(273,1,'JUEGO DE REPARO CARBURADOR               '),(274,1,'EJE DE CABALLETE                         '),(275,1,'CA?ITO DE COMBUSTIBLE                    '),(276,4,'PORTAPLACA                               '),(277,4,'PROTECTOR DE MANOPLA                     '),(278,4,'SOPORTE ABRAZADERA                       '),(279,4,'MOCHILA                                  '),(280,1,'TENSOR CADENITA                          '),(281,1,'BOMBA                                    '),(282,2,'ROTOR                                    '),(283,1,'PRUEBA                                   '),(284,2,'CANDADO P/ BICICLETA                     '),(285,4,'CANDADO P/ MOTO                          '),(286,4,'OJO D/ GATO                              '),(287,2,'STEY                                     '),(288,2,'CAMARA                                   '),(289,1,'KIT CORONA                               '),(290,2,'FORRO P/ CAMBIO                          '),(291,2,'REMOVEDOR D/ PI?ON                       '),(292,2,'ESTIRA RAYO                              '),(293,4,'PORTABULTO                               '),(294,2,'JUEGO DE FRENO                                    '),(295,2,'RAYO                                     '),(296,1,'FICHA                                    '),(297,1,'ASIENTO                                  '),(298,1,'TUERCA                                   '),(299,4,'TERMITO                                           '),(300,2,'CANASTA                                  '),(301,1,'KIT DE PISTON C/ARO SEG/ PER/            '),(303,1,'BRAZO BIELA                              '),(304,1,'SOSTEN LATERAL                           '),(305,2,'EXTRACTOR                                '),(306,2,'BLOQUEO DE ASIENTO                       '),(307,1,'CABALLETE                                         '),(308,11,'ARO 24                                   '),(309,2,'BALBULA COMPLETA PICO GRUESO             '),(310,4,'REPARO TENSOR CADENA                     '),(311,2,'BRAZO                                    '),(312,2,'VALINES                                  '),(313,1,'MANUBRIO                                 '),(314,13,'BUJIA                                    '),(315,1,'CAJA EMBRAGUE                            '),(316,1,'CASQUILLO                                '),(317,1,'VARILLA DE VALVULA                       '),(318,4,'INTERRUPTOR                              '),(319,1,'LLANTA                                   '),(320,1,'TAPA PI?ON                               '),(321,4,'CAJA BATERIA                             '),(322,1,'PROTECTOR MOTOR                          '),(323,1,'TAPA SELECTOR                            '),(324,7,'LLAVE TUBO                               '),(325,7,'ESTIRA RAYO                              '),(326,1,'TUBO DE ADMISION                         '),(327,4,'CARETA DEL.                              ');

/*Table structure for table `titular` */

DROP TABLE IF EXISTS `titular`;

CREATE TABLE `titular` (
  `titu_codigo` int(11) NOT NULL,
  `titu_nombre` varchar(50) NOT NULL,
  `titu_cpi` varchar(50) default '<RAZÓN SOCIAL>',
  `titu_direccion` varchar(50) default '<DESCONOCIDO>',
  `titu_telef` varchar(30) default '<DESCONOCIDO>',
  PRIMARY KEY  (`titu_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `titular` */

/*Table structure for table `transferproduc` */

DROP TABLE IF EXISTS `transferproduc`;

CREATE TABLE `transferproduc` (
  `art_codigo` int(11) default NULL,
  `tranfecha` datetime default NULL,
  `tran_cantidad` int(11) default NULL,
  `tran_d_suc` int(11) default NULL,
  `tran_a_suc` int(11) default NULL,
  `tran_d_dep` int(11) default NULL,
  `tran_a_dep` int(11) default NULL,
  KEY `art_codigo` (`art_codigo`),
  KEY `tran_d_suc` (`tran_d_suc`),
  KEY `tran_a_suc` (`tran_a_suc`),
  KEY `tran_d_dep` (`tran_d_dep`),
  KEY `tran_a_dep` (`tran_a_dep`),
  CONSTRAINT `transferproduc_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `transferproduc_ibfk_2` FOREIGN KEY (`tran_a_suc`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `transferproduc_ibfk_3` FOREIGN KEY (`tran_d_suc`) REFERENCES `sucursal` (`suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `transferproduc_ibfk_4` FOREIGN KEY (`tran_a_dep`) REFERENCES `deposito` (`dep_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `transferproduc_ibfk_5` FOREIGN KEY (`tran_d_dep`) REFERENCES `deposito` (`dep_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transferproduc` */

/*Table structure for table `ubicacion` */

DROP TABLE IF EXISTS `ubicacion`;

CREATE TABLE `ubicacion` (
  `ubica_codigo` int(11) NOT NULL,
  `ubica_nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`ubica_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ubicacion` */

insert  into `ubicacion`(`ubica_codigo`,`ubica_nombre`) values (1,'DEPOSITO GENERAL'),(2,'E4-C2                                             '),(6,'E4-C3                                             '),(7,'M1-C3                                             '),(8,'M1-C5                                             '),(9,'E1-B3                                             '),(10,'E1-C16-1                                          '),(11,'E1-C33-1                                          '),(12,'E1-C33-2                                          '),(13,'E1-C33-3                                          '),(14,'E4-C1                                             '),(15,'E4-C6                                             '),(16,'MOSTRADOR 1                                       '),(17,'E2-C29                                   '),(18,'E2-C8                                    '),(19,'E2-C9                                             '),(20,'E1-C14                                   '),(21,'E3-C15                                   '),(22,'E3-C7                                    '),(23,'E1-C22                                   '),(24,'E2-C7                                    '),(25,'E1-C8                                    '),(26,'E1-C19                                   '),(27,'E4-C18                                   '),(28,'E3-C14                                   '),(29,'E3-C6                                    '),(30,'E3-C13                                   '),(31,'E3-C22                                   '),(32,'E3-C30                                   '),(33,'E3-C16                                   '),(34,'E4-C29                                   '),(35,'E3-C20                                   '),(36,'M1-B                                     '),(37,'M 1                                      '),(38,'E4-C7                                    '),(39,'E1-C15                                   '),(40,'E4-C8                                    '),(41,'E2-C18                                   '),(42,'E1-C31                                   '),(43,'E2-C15                                   '),(44,'E1-C17                                   '),(45,'E1-C18                                   '),(46,'E2-C16                                   '),(47,'E1-C25                                   '),(48,'E1-C35                                   '),(49,'E1-C6                                    '),(50,'E4-C15                                   '),(51,'E1-C26                                   '),(52,'E1-C10                                   '),(53,'E2-C21                                   '),(54,'E4-C14                                   '),(55,'E1-C12                                   '),(56,'E4-C22                                   '),(57,'E1-C24                                   '),(58,'E3-C21                                   '),(59,'E4-C21                                   '),(60,'E3-16                                    '),(61,'E4-C20                                   '),(62,'E4-C13                                   '),(63,'D2-E2-C2                                 '),(64,'E3-C10                                   '),(65,'E1-C16                                   '),(66,'E3-C12                                   '),(67,'E3-C31                                   '),(68,'E2-C10                                   '),(69,'E4-C4                                    '),(70,'E4-C17                                   '),(71,'MOSTRADOR 2                              '),(72,'E3-C8                                    '),(73,'E4-C24                                   '),(74,'E1-C4                                    '),(75,'E1-C20                                   '),(76,'E4-C5                                    '),(77,'E2-C17                                   '),(78,'E3-C23                                   '),(79,'E3-C32                                   '),(80,'E2-C22                                   '),(81,'E2-C20                                   '),(82,'E2-C19                                   '),(83,'E4-C19                                   '),(84,'DEPOSITO3                                '),(85,'E1-C30                                   '),(86,'E2-C26                                   '),(87,'E3-C35                                   '),(88,'DEPOSITO1 ACCESORY                       '),(89,'E4-C9                                    '),(90,'E1-C21                                   '),(91,'E4-C16                                   ');

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

CREATE TABLE `venta` (
  `ven_nro` int(10) unsigned NOT NULL,
  `mon_codigo` int(11) NOT NULL,
  `suc_codigo` int(11) NOT NULL,
  `dep_codigo` int(11) NOT NULL,
  `clie_codigo` int(11) NOT NULL,
  `ven_fecha` date default NULL,
  `ven_fac_nro` int(11) default NULL,
  `ven_exe` double(20,3) default NULL,
  `ven_gra` double(20,3) default NULL,
  `ven_iva` double(20,3) default NULL,
  `ven_desc` double(10,3) default NULL,
  `ven_recar` double(20,3) default NULL,
  `ven_total` double(20,3) default NULL,
  `ven_cond` varchar(7) default NULL,
  `ven_can_cuo` int(11) default NULL,
  `ven_entrega` double(10,3) default NULL,
  `ven_cambio` int(10) default '0',
  `ven_estanu` varchar(2) default NULL,
  PRIMARY KEY  (`ven_nro`),
  KEY `venta_FKIndex2` (`clie_codigo`),
  KEY `dep_codigo` (`dep_codigo`,`suc_codigo`),
  KEY `mon_codigo` (`mon_codigo`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`clie_codigo`) REFERENCES `cliente` (`clie_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`dep_codigo`, `suc_codigo`) REFERENCES `deposito` (`dep_codigo`, `suc_codigo`) ON UPDATE NO ACTION,
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`mon_codigo`) REFERENCES `moneda` (`mon_codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `venta` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
