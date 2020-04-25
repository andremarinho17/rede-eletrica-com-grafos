/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : infraeletrica

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-11-24 15:43:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `efetivo`
-- ----------------------------
DROP TABLE IF EXISTS `efetivo`;
CREATE TABLE `efetivo` (
  `NumCTPS` int(10) DEFAULT NULL,
  `fk_Funcionario_id` int(3) NOT NULL,
  PRIMARY KEY (`fk_Funcionario_id`),
  CONSTRAINT `FK_Efetivo_2` FOREIGN KEY (`fk_Funcionario_id`) REFERENCES `funcionario` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of efetivo
-- ----------------------------

-- ----------------------------
-- Table structure for `estagiario`
-- ----------------------------
DROP TABLE IF EXISTS `estagiario`;
CREATE TABLE `estagiario` (
  `InstituicaoEnsino` varchar(200) DEFAULT NULL,
  `Curso` varchar(200) DEFAULT NULL,
  `fk_Funcionario_id` int(3) NOT NULL,
  PRIMARY KEY (`fk_Funcionario_id`),
  CONSTRAINT `FK_Estagiario_2` FOREIGN KEY (`fk_Funcionario_id`) REFERENCES `funcionario` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estagiario
-- ----------------------------

-- ----------------------------
-- Table structure for `fornecedor`
-- ----------------------------
DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE `fornecedor` (
  `CNPJ` int(20) DEFAULT NULL,
  `RazaoSocial` int(20) DEFAULT NULL,
  `TipoServico` varchar(100) DEFAULT NULL,
  `IdTorre` int(11) DEFAULT NULL,
  `fk_Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`fk_Usuario_idUsuario`),
  CONSTRAINT `FK_Fornecedor_2` FOREIGN KEY (`fk_Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fornecedor
-- ----------------------------

-- ----------------------------
-- Table structure for `funcionario`
-- ----------------------------
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `id` int(3) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Matricula` int(4) DEFAULT NULL,
  `idTorre` int(3) DEFAULT NULL,
  `fk_Torre_idTorre` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Funcionario_2` (`fk_Torre_idTorre`),
  CONSTRAINT `FK_Funcionario_2` FOREIGN KEY (`fk_Torre_idTorre`) REFERENCES `torre` (`idTorre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of funcionario
-- ----------------------------

-- ----------------------------
-- Table structure for `morador`
-- ----------------------------
DROP TABLE IF EXISTS `morador`;
CREATE TABLE `morador` (
  `fk_Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`fk_Usuario_idUsuario`),
  CONSTRAINT `FK_Morador_2` FOREIGN KEY (`fk_Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of morador
-- ----------------------------

-- ----------------------------
-- Table structure for `morador_bens`
-- ----------------------------
DROP TABLE IF EXISTS `morador_bens`;
CREATE TABLE `morador_bens` (
  `id` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `fk_Morador_fk_Usuario_idUsuario` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Morador_Bens_2` (`fk_Morador_fk_Usuario_idUsuario`),
  CONSTRAINT `FK_Morador_Bens_2` FOREIGN KEY (`fk_Morador_fk_Usuario_idUsuario`) REFERENCES `morador` (`fk_Usuario_idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of morador_bens
-- ----------------------------

-- ----------------------------
-- Table structure for `municipio`
-- ----------------------------
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE `municipio` (
  `id` int(3) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of municipio
-- ----------------------------
INSERT INTO `municipio` VALUES ('1', 'Belo Horizonte');
INSERT INTO `municipio` VALUES ('2', 'Pará de Minas');
INSERT INTO `municipio` VALUES ('3', 'Sete Lagoas');
INSERT INTO `municipio` VALUES ('4', 'Uberlândia');
INSERT INTO `municipio` VALUES ('5', 'Caeté');
INSERT INTO `municipio` VALUES ('6', 'Ouro Preto');
INSERT INTO `municipio` VALUES ('7', 'Ouro Fino');

-- ----------------------------
-- Table structure for `orcamento`
-- ----------------------------
DROP TABLE IF EXISTS `orcamento`;
CREATE TABLE `orcamento` (
  `id` int(3) NOT NULL,
  `NomePeca` varchar(100) DEFAULT NULL,
  `idEquipamento` int(3) DEFAULT NULL,
  `MaoDeObra` varchar(200) DEFAULT NULL,
  `idRelatorio` int(3) DEFAULT NULL,
  `fk_Relatorio_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Orcamento_2` (`fk_Relatorio_id`),
  CONSTRAINT `FK_Orcamento_2` FOREIGN KEY (`fk_Relatorio_id`) REFERENCES `relatorio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orcamento
-- ----------------------------
INSERT INTO `orcamento` VALUES ('1', 'Lâmpada', '2', '2000', '1', '1');

-- ----------------------------
-- Table structure for `pais`
-- ----------------------------
DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pais
-- ----------------------------
INSERT INTO `pais` VALUES ('1', 'Brasil', 'BR');

-- ----------------------------
-- Table structure for `relatorio`
-- ----------------------------
DROP TABLE IF EXISTS `relatorio`;
CREATE TABLE `relatorio` (
  `id` int(3) NOT NULL,
  `PrevisaoInicial` date DEFAULT NULL,
  `ValorServico` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of relatorio
-- ----------------------------
INSERT INTO `relatorio` VALUES ('1', '2019-11-29', '2000');

-- ----------------------------
-- Table structure for `telefone`
-- ----------------------------
DROP TABLE IF EXISTS `telefone`;
CREATE TABLE `telefone` (
  `Telefone_PK` int(11) NOT NULL,
  `Telefone` int(11) DEFAULT NULL,
  PRIMARY KEY (`Telefone_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of telefone
-- ----------------------------
INSERT INTO `telefone` VALUES ('1', '34342915');

-- ----------------------------
-- Table structure for `terceirizado`
-- ----------------------------
DROP TABLE IF EXISTS `terceirizado`;
CREATE TABLE `terceirizado` (
  `RazaoSocial` varchar(100) DEFAULT NULL,
  `TipoServico` varchar(200) DEFAULT NULL,
  `CNPJ` int(11) DEFAULT NULL,
  `IdTorre` int(11) DEFAULT NULL,
  `fk_Usuario_idUsuario` int(4) NOT NULL,
  PRIMARY KEY (`fk_Usuario_idUsuario`),
  CONSTRAINT `FK_Terceirizado_2` FOREIGN KEY (`fk_Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of terceirizado
-- ----------------------------

-- ----------------------------
-- Table structure for `torre`
-- ----------------------------
DROP TABLE IF EXISTS `torre`;
CREATE TABLE `torre` (
  `idTorre` int(3) NOT NULL,
  `LocalizacaoGeografica` varchar(100) DEFAULT NULL,
  `Municipio` varchar(100) DEFAULT NULL,
  `torreStatus` tinyint(1) NOT NULL DEFAULT '0',
  `idOrcamento` int(3) DEFAULT NULL,
  `fk_Municipio_id` int(3) DEFAULT NULL,
  `fk_Orcamento_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`idTorre`),
  KEY `FK_Torre_2` (`fk_Municipio_id`),
  KEY `FK_Torre_3` (`fk_Orcamento_id`),
  CONSTRAINT `FK_Torre_2` FOREIGN KEY (`fk_Municipio_id`) REFERENCES `municipio` (`id`),
  CONSTRAINT `FK_Torre_3` FOREIGN KEY (`fk_Orcamento_id`) REFERENCES `orcamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of torre
-- ----------------------------
INSERT INTO `torre` VALUES ('1', 'Belo Horizonte', '1', '1', '1', '1', '1');
INSERT INTO `torre` VALUES ('1110', '1002,6555', '1', '0', '1', null, null);
INSERT INTO `torre` VALUES ('1111', '1002,6555', '1', '0', '1', null, null);
INSERT INTO `torre` VALUES ('11000', '1002,6555', null, '0', '1', null, null);
INSERT INTO `torre` VALUES ('11011', '1002,6555', '1', '0', '1', null, null);
INSERT INTO `torre` VALUES ('11012', '1002,6555', '1', '0', '1', null, null);
INSERT INTO `torre` VALUES ('11013', '1002,6555', '1', '0', '1', null, null);
INSERT INTO `torre` VALUES ('11014', '1002,6555', 'Belo Horizonte', '0', '1', null, null);

-- ----------------------------
-- Table structure for `torre_conexao`
-- ----------------------------
DROP TABLE IF EXISTS `torre_conexao`;
CREATE TABLE `torre_conexao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idTorre1` int(11) DEFAULT NULL,
  `idTorre2` int(11) DEFAULT NULL,
  `Custo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of torre_conexao
-- ----------------------------
INSERT INTO `torre_conexao` VALUES ('1', '110111', '110112', '45');

-- ----------------------------
-- Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `CPF` bigint(22) DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  `Numero` int(10) DEFAULT NULL,
  `idTipoUsuario` int(3) DEFAULT NULL,
  `fk_Telefone_Telefone_PK` int(14) DEFAULT NULL,
  `Senha` varchar(20) DEFAULT NULL,
  `idTorre` int(15) DEFAULT NULL,
  `fk_Torre_idTorre` int(15) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `FK_Usuario_2` (`fk_Telefone_Telefone_PK`),
  KEY `FK_Usuario_3` (`fk_Torre_idTorre`),
  CONSTRAINT `FK_Usuario_2` FOREIGN KEY (`fk_Telefone_Telefone_PK`) REFERENCES `telefone` (`Telefone_PK`) ON DELETE NO ACTION,
  CONSTRAINT `FK_Usuario_3` FOREIGN KEY (`fk_Torre_idTorre`) REFERENCES `torre` (`idTorre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'Andre Marinho', '13978939665', 'Rua Advance', '128', '1', '1', '123', '1', '1', null);
INSERT INTO `usuario` VALUES ('2', 'Claudiney Vander Ramos', '27532913066', 'Rua Advance', '128', '1', null, '1234', '110011', null, '34342915');
INSERT INTO `usuario` VALUES ('3', 'Michelle Nery Nascimento', '80901710016', 'Sombrado e Sussui', '129', '3', null, '1234', '110011', null, '34342915');

-- ----------------------------
-- Table structure for `usuario_tipo`
-- ----------------------------
DROP TABLE IF EXISTS `usuario_tipo`;
CREATE TABLE `usuario_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario_tipo
-- ----------------------------
INSERT INTO `usuario_tipo` VALUES ('1', 'Funcionário Efetivo');
INSERT INTO `usuario_tipo` VALUES ('2', 'Estagiário');
INSERT INTO `usuario_tipo` VALUES ('3', 'Fornecedor');
INSERT INTO `usuario_tipo` VALUES ('4', 'Terceirizado');
INSERT INTO `usuario_tipo` VALUES ('5', 'Morador');
