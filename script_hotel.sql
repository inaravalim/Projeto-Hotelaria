-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Dez-2017 às 01:17
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospedagem`
--

DROP TABLE IF EXISTS `hospedagem`;
CREATE TABLE IF NOT EXISTS `hospedagem` (
  `idhospedagem` int(11) NOT NULL AUTO_INCREMENT,
  `idhospede` int(11) NOT NULL,
  `idquarto` int(11) NOT NULL,
  `chek-in` date NOT NULL,
  `qntd_adultos` int(11) NOT NULL,
  `qntd_criancas` int(11) NOT NULL,
  `chek-out` date DEFAULT NULL,
  PRIMARY KEY (`idhospedagem`),
  KEY `fk_hospedagem_hospede1_idx` (`idhospede`),
  KEY `fk_hospedagem_quarto1_idx` (`idquarto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `hospedagem`
--

INSERT INTO `hospedagem` (`idhospedagem`, `idhospede`, `idquarto`, `chek-in`, `qntd_adultos`, `qntd_criancas`, `chek-out`) VALUES
(1, 1, 8, '2017-12-05', 6, 3, '2017-12-27'),
(2, 1, 4, '2017-12-01', 1, 0, '2017-12-06'),
(3, 2, 9, '2017-12-01', 7, 1, '2017-12-07'),
(4, 4, 7, '2017-12-01', 1, 0, '2017-12-06'),
(5, 4, 6, '2017-12-01', 0, 0, '2017-12-04'),
(6, 3, 3, '2017-11-01', 2, 0, '2017-11-07'),
(7, 5, 10, '2017-11-13', 3, 1, '2017-12-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospede`
--

DROP TABLE IF EXISTS `hospede`;
CREATE TABLE IF NOT EXISTS `hospede` (
  `idhospede` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `RG` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `telefone_extra` varchar(45) DEFAULT NULL,
  `estado` varchar(2) NOT NULL,
  `cep` varchar(45) NOT NULL,
  PRIMARY KEY (`idhospede`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `hospede`
--

INSERT INTO `hospede` (`idhospede`, `nome`, `email`, `senha`, `RG`, `sexo`, `telefone`, `telefone_extra`, `estado`, `cep`) VALUES
(1, 'Iris Freitas', 'iri@gmail.com', '10', '10', 'feminino', '10', '10', 'SP', '10'),
(2, 'Inara Valim', 'inara@gmail.com', '10', '10', 'feminino', '10', '10', 'MG', '999999'),
(3, 'Mario Pereira', 'mario@gmail.com', '10', '10', 'masculino', '10', '10', 'RJ', '10'),
(4, 'Joel Vagner', 'joel@gmail.com', '10', '10', 'masculino', '10', '10', 'PA', '000000'),
(5, 'Adryane ', 'adryane@gmail.com', '10', '10', 'feminino', '10', '10', 'ES', '000000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

DROP TABLE IF EXISTS `itens`;
CREATE TABLE IF NOT EXISTS `itens` (
  `idquarto` int(11) NOT NULL,
  `iditens` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idquarto`,`iditens`),
  KEY `fk_quarto_has_itens_quarto1_idx` (`idquarto`),
  KEY `fk_quarto_itens_tipo_itens1_idx` (`iditens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quarto`
--

DROP TABLE IF EXISTS `quarto`;
CREATE TABLE IF NOT EXISTS `quarto` (
  `idquarto` int(11) NOT NULL AUTO_INCREMENT,
  `andar` int(11) NOT NULL,
  `observacao` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`idquarto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `quarto`
--

INSERT INTO `quarto` (`idquarto`, `andar`, `observacao`) VALUES
(1, 1, NULL),
(2, 1, NULL),
(3, 1, NULL),
(4, 1, NULL),
(5, 2, NULL),
(6, 2, NULL),
(7, 2, NULL),
(8, 2, NULL),
(9, 2, NULL),
(10, 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

DROP TABLE IF EXISTS `servicos`;
CREATE TABLE IF NOT EXISTS `servicos` (
  `idhospedagem` int(11) NOT NULL,
  `idtipo_servicos` int(11) NOT NULL,
  PRIMARY KEY (`idhospedagem`,`idtipo_servicos`),
  KEY `fk_servicos_hospedagem1_idx` (`idhospedagem`),
  KEY `fk_servicos_tipo_servicos1_idx` (`idtipo_servicos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_itens`
--

DROP TABLE IF EXISTS `tipo_itens`;
CREATE TABLE IF NOT EXISTS `tipo_itens` (
  `iditens` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `observacao` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`iditens`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_itens`
--

INSERT INTO `tipo_itens` (`iditens`, `nome`, `observacao`) VALUES
(1, 'cama de casal', NULL),
(2, 'cama de solteiro', NULL),
(3, 'ar condicionado', NULL),
(4, 'televisao', NULL),
(5, 'banheira', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_servicos`
--

DROP TABLE IF EXISTS `tipo_servicos`;
CREATE TABLE IF NOT EXISTS `tipo_servicos` (
  `idtipo_servicos` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtipo_servicos`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_servicos`
--

INSERT INTO `tipo_servicos` (`idtipo_servicos`, `nome`, `valor`, `observacao`) VALUES
(1, 'serviço de quarto', '30', NULL),
(2, 'lavanderia', '15', NULL),
(3, 'frigobar', '25', NULL),
(4, 'refeição', '30', NULL),
(5, 'piscina', '20', NULL),
(6, 'wifi', '15', NULL),
(7, 'academia', '20', NULL);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `fk_hospedagem_hospede1` FOREIGN KEY (`idhospede`) REFERENCES `hospede` (`idhospede`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hospedagem_quarto1` FOREIGN KEY (`idquarto`) REFERENCES `quarto` (`idquarto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `fk_quarto_has_itens_quarto1` FOREIGN KEY (`idquarto`) REFERENCES `quarto` (`idquarto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_quarto_itens_tipo_itens1` FOREIGN KEY (`iditens`) REFERENCES `tipo_itens` (`iditens`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `fk_servicos_hospedagem1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicos_tipo_servicos1` FOREIGN KEY (`idtipo_servicos`) REFERENCES `tipo_servicos` (`idtipo_servicos`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
