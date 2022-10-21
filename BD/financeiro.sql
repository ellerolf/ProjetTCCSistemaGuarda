-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/10/2022 às 01:41
-- Versão do servidor: 10.1.35-MariaDB
-- Versão do PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `financeiro`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `baixa`
--

CREATE TABLE `baixa` (
  `BAICODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `CODIGOLAN` int(11) DEFAULT NULL COMMENT 'Código do lançamento',
  `BAISTATUS` tinyint(1) DEFAULT '0' COMMENT 'Status de pagamento ou recebimento, sendo pendente 0 e finalizado 1',
  `CODIGOFOR` int(11) DEFAULT NULL COMMENT 'Código da forma de pagamento(Dinheiro, Cheque)',
  `CODIGOCON` int(11) DEFAULT NULL COMMENT 'Código da conta onde irá sair ou entrar o dinheiro',
  `BAIDATAVEN` date DEFAULT NULL COMMENT 'Data de vencimento da parcela',
  `BAIVALOR` double DEFAULT NULL COMMENT 'Valor da parcela a ser paga',
  `BAIMULTA_JUROS` double DEFAULT NULL COMMENT 'Valor da multa ou juros da respectiva baixa',
  `BAIDESCONTO` double DEFAULT NULL COMMENT 'Valor de desconto da respectiva baixa',
  `CODIGOUSU` int(11) DEFAULT NULL COMMENT 'Código do usuário que efetuou o lançamento',
  `BAIDATAPGTO` date DEFAULT NULL COMMENT 'Data que a parcela foi paga',
  `BAIVALORPAGO` double DEFAULT NULL COMMENT 'Valor que foi pago'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `baixa`
--

INSERT INTO `baixa` (`BAICODIGO`, `CODIGOLAN`, `BAISTATUS`, `CODIGOFOR`, `CODIGOCON`, `BAIDATAVEN`, `BAIVALOR`, `BAIMULTA_JUROS`, `BAIDESCONTO`, `CODIGOUSU`, `BAIDATAPGTO`, `BAIVALORPAGO`) VALUES
(21, 17, 1, 3, 2, '2022-09-08', 11, NULL, NULL, 15, '2022-09-30', 11),
(33, 9, 0, NULL, NULL, '2022-09-16', 60, NULL, NULL, 15, NULL, NULL),
(34, 9, 0, NULL, NULL, '2022-09-23', 51, NULL, NULL, 15, NULL, NULL),
(35, 11, 1, 2, 2, '2022-09-09', 100, NULL, NULL, 15, '2022-10-02', 100),
(36, 11, 1, 2, 2, '2022-09-30', 22, NULL, NULL, 15, '2022-10-02', 22),
(37, 8, 0, NULL, NULL, '2022-09-30', 11, NULL, NULL, 15, NULL, NULL),
(74, 38, 0, NULL, NULL, '2022-10-01', 1, NULL, NULL, 15, NULL, NULL),
(106, 61, 0, NULL, NULL, '2022-10-01', 50, NULL, NULL, 15, NULL, NULL),
(107, 61, 0, NULL, NULL, '2022-10-05', 50, NULL, NULL, 15, NULL, NULL),
(111, 65, 0, NULL, NULL, '2022-10-05', 100, NULL, NULL, 15, NULL, NULL),
(127, 93, 0, NULL, NULL, '2022-10-05', 32, NULL, NULL, 15, NULL, NULL),
(132, 101, 0, NULL, NULL, '2022-10-14', 21, NULL, NULL, 15, NULL, NULL),
(155, 128, 0, NULL, NULL, '2022-10-13', 1, NULL, NULL, 15, NULL, NULL),
(156, 129, 0, NULL, NULL, '2022-10-07', 2, NULL, NULL, 15, NULL, NULL),
(157, 130, 0, NULL, NULL, '2022-10-07', 21, NULL, NULL, 15, NULL, NULL),
(161, 134, 0, NULL, NULL, '2022-10-08', 120, NULL, NULL, 15, NULL, NULL),
(173, 98, 0, NULL, NULL, '2022-10-07', 3, NULL, NULL, 15, NULL, NULL),
(178, 23, 0, NULL, NULL, '2022-10-14', 56, NULL, NULL, 15, NULL, NULL),
(181, 144, 1, 2, 2, '2022-10-06', 45, NULL, NULL, 15, '2022-10-06', 45),
(202, 76, 0, NULL, NULL, '2022-10-13', 21, NULL, NULL, 15, NULL, NULL),
(203, 30, 0, NULL, NULL, '2022-10-22', 100, NULL, NULL, 15, NULL, NULL),
(205, 21, 0, NULL, NULL, '2022-10-07', 400, NULL, NULL, 15, NULL, NULL),
(206, 19, 0, NULL, NULL, '2022-10-13', 10, NULL, NULL, 15, NULL, NULL),
(211, 147, 0, NULL, NULL, '2022-10-12', 50, NULL, NULL, 15, NULL, NULL),
(214, 148, 0, NULL, NULL, '2022-10-15', 100, NULL, NULL, 15, NULL, NULL),
(215, 36, 0, NULL, NULL, '2022-10-18', 100, NULL, NULL, 15, NULL, NULL),
(218, 144, 0, NULL, NULL, '2022-10-20', 55, NULL, NULL, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `centro_custo`
--

CREATE TABLE `centro_custo` (
  `CENCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `CENNOME` varchar(50) DEFAULT NULL COMMENT 'Nome do Centro de Custo',
  `CODIGOTIP` int(11) DEFAULT NULL COMMENT 'Tipo de centro de custo',
  `CENSTATUS` tinyint(1) DEFAULT '1' COMMENT 'centro de custo, poderá ser ativo ou inativo, sendo ativo 1 e inativo 0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `centro_custo`
--

INSERT INTO `centro_custo` (`CENCODIGO`, `CENNOME`, `CODIGOTIP`, `CENSTATUS`) VALUES
(1, 'ALIMENTAÇÃO', 2, 1),
(2, 'ENERGIA ELÉTRICA', 2, 0),
(3, 'DOAÇÃO PESSOA FÍSICA', 1, 1),
(4, 'DOAÇÃO PESSOA JURÍDICA', 1, 0),
(5, 'FGTS', 2, 1),
(6, 'FGTS', 1, 1),
(7, 'FGTS', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas`
--

CREATE TABLE `contas` (
  `CONCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `CONNOME` varchar(50) DEFAULT NULL COMMENT 'Nome da conta bancária',
  `CODIGOTIP` int(11) DEFAULT NULL COMMENT 'Código do tipo de conta',
  `CONAGENCIA` varchar(50) DEFAULT NULL COMMENT 'N° da agência',
  `CONNUMERO_CONTA` varchar(50) DEFAULT NULL COMMENT 'N° da conta',
  `CONSALDO_INICIAL` double DEFAULT NULL COMMENT 'Quando houver um saldo inicial na conta cadastrada, colocar o valor aqui',
  `CONSTATUS` tinyint(1) DEFAULT '1' COMMENT 'Poderá estar ser ativo ou inativo, sendo inativo 0 e ativo 1 '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `contas`
--

INSERT INTO `contas` (`CONCODIGO`, `CONNOME`, `CODIGOTIP`, `CONAGENCIA`, `CONNUMERO_CONTA`, `CONSALDO_INICIAL`, `CONSTATUS`) VALUES
(1, 'CAIXA ECONOMICA FEDERAL', 1, '333', '242-2', 1410.05, 1),
(2, 'BANCO DO BRASIL', 1, '77', '11.502-4', 510.04, 0),
(3, 'CAIXA ZONA AZUL', 3, NULL, NULL, 20.5, 1),
(4, 'CAIXA ECONOMICA RENDA FIXA', 2, '333', '242-2', 256.854, 1),
(5, 'BANCO NACIONAL', 1, '0444-5', '1234-X', 748.5, 1),
(6, 'Brasil', 1, '12345', '126566', 45.5, 1),
(7, '', 3, '', '', 105.85, 1),
(8, 'BRADESCO', 1, '1233', '67656756', 54.5, 1),
(9, 'MARIA', 3, NULL, NULL, 1.2, 1),
(10, 'BRASIL', 1, '22', '33', 33, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `FORCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `FORNOME` varchar(50) DEFAULT NULL COMMENT 'Nome da forma de pagamento (Dinheiro, Cheque)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`FORCODIGO`, `FORNOME`) VALUES
(1, 'DINHEIRO'),
(2, 'CHEQUE'),
(3, 'DÉBITO AUTOMÁTICO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `lancamento`
--

CREATE TABLE `lancamento` (
  `LANCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `LANDOCUMENTO` date DEFAULT NULL COMMENT 'Data do documento que está embasando o lançamento',
  `CODIGODOC` int(11) DEFAULT NULL COMMENT 'Código do tipo de documento (Nota fiscal ou recibo)',
  `LANNUMERO_DOCUMENTO` varchar(50) DEFAULT NULL COMMENT 'Número do documento que está embasando o lançamento',
  `LANVALOR_DOCUMENTO` double DEFAULT NULL COMMENT 'Valor do documento que está embasando o lançamento',
  `CODIGOPES` int(11) DEFAULT NULL COMMENT 'Código do cliente ou fornecedor',
  `CODIGOCEN` int(11) DEFAULT NULL COMMENT 'Código do centro de custo',
  `LANOBSERVACAO` varchar(200) DEFAULT NULL COMMENT 'Observação referente o lançamento que está sendo feito',
  `LANTIPO` tinyint(1) DEFAULT NULL COMMENT 'Identificação se o lançamento é Receita ou Despesa, sendo  despesa 0 e receita 1 ',
  `CODIGOUSU` int(11) DEFAULT NULL COMMENT 'Código do usuário que efetuou o lançamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `lancamento`
--

INSERT INTO `lancamento` (`LANCODIGO`, `LANDOCUMENTO`, `CODIGODOC`, `LANNUMERO_DOCUMENTO`, `LANVALOR_DOCUMENTO`, `CODIGOPES`, `CODIGOCEN`, `LANOBSERVACAO`, `LANTIPO`, `CODIGOUSU`) VALUES
(8, '2022-09-23', 2, '1', 11, 1, 3, '', 1, 15),
(9, '2022-09-24', 1, '11', 111, 3, 5, '', 0, 15),
(10, '2022-09-02', 2, '11', 33, 1, 3, '', 1, 15),
(11, '2022-09-14', 1, '1', 122, 3, 1, '', 0, 15),
(12, '2022-09-25', 2, '1', 11, 3, 3, '', 1, 15),
(14, '2022-09-07', 1, '1', 100, 3, 1, '', 0, 15),
(17, '2022-09-07', 1, '1', 11, 1, 1, '', 0, 15),
(19, '2022-09-15', 1, '1', 10, 1, 1, '', 0, 15),
(20, '2022-09-09', 1, '1', 1, 1, 1, '', 0, 15),
(21, '2022-09-29', 1, '1222', 400, 1, 1, '', 0, 15),
(22, '2022-09-07', 1, '2', 22, 2, 1, '', 0, 15),
(23, '2022-09-20', 2, '1', 56, 3, 3, '', 1, 15),
(27, '2022-10-01', 2, '1', 111, 1, 1, '', 1, 15),
(30, '2022-10-05', 1, '1', 100, 1, 1, '', 0, 15),
(36, '2022-10-06', 1, '1', 100, 3, 1, '', 1, 15),
(38, '2022-10-01', 1, '1', 1, 1, 1, '', 0, 15),
(49, '2022-10-12', 1, '1', 121, 1, 1, '', 1, 15),
(53, '2022-10-13', 1, '1', 121, 1, 1, '', 0, 15),
(61, '2022-10-12', 1, '1', 100, 1, 1, '', 0, 15),
(65, '2022-10-21', 1, '1', 212, 1, 1, '', 0, 15),
(67, '2022-09-01', 1, '1', 50.5, 1, 1, '', 0, 15),
(68, '2022-10-05', 1, '1', 21, 1, 1, '', 0, 15),
(71, '2022-09-28', 1, '1', 21.5, 1, 1, '', 0, 15),
(76, '2022-09-01', 1, '1', 21, 1, 1, '', 0, 15),
(77, '2022-10-06', 1, '1', 20.5, 1, 1, '', 0, 15),
(82, '2022-09-29', 1, '1', 12, 1, 1, '', 0, 15),
(84, '2022-09-28', 1, '1', 21, 1, 1, '', 0, 15),
(86, '2022-10-06', 1, '1', 21, 1, 1, '', 0, 15),
(88, '2022-10-12', 1, '1', 21, 1, 1, '', 0, 15),
(89, '2022-10-20', 1, '1', 22, 1, 1, '', 0, 15),
(91, '2022-10-19', 1, '1', 222, 1, 1, '', 0, 15),
(93, '2022-08-31', 1, '1', 32, 1, 1, '', 0, 15),
(96, '2022-10-13', 1, '1', 21, 1, 1, '', 0, 15),
(98, '2022-10-18', 1, '1', 3, 1, 1, '', 1, 15),
(101, '2022-10-05', 1, '1', 21, 1, 1, '', 0, 15),
(103, '2022-09-29', 1, '1', 21, 1, 1, '', 0, 15),
(106, '2022-10-12', 1, '1', 21, 1, 1, '', 0, 15),
(110, '2022-10-13', 1, '1', 21, 1, 1, '', 0, 15),
(114, '2022-09-29', 1, '1', 212, 1, 1, '', 0, 15),
(117, '2022-10-06', 1, '1', 2112, 1, 1, '', 1, 15),
(119, '2022-10-05', 1, '1', 2, 1, 1, '', 0, 15),
(128, '2022-10-13', 1, '11', 1, 1, 1, '', 0, 15),
(129, '2022-10-12', 1, '1', 2, 1, 1, '', 0, 15),
(130, '2022-10-12', 1, '1', 21, 1, 1, '', 0, 15),
(134, '2022-10-20', 1, '1', 120, 1, 1, '', 0, 15),
(144, '2022-10-06', 2, '1', 100, 1, 1, '', 1, 15),
(147, '2022-10-13', 1, '1', 50, 1, 1, '', 1, 15),
(148, '2022-09-28', 1, '2', 100, 3, 5, '', 0, 15),
(149, '2022-10-07', 3, '21', 8485, 3, 5, '', 0, 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `nivel_acesso`
--

CREATE TABLE `nivel_acesso` (
  `NIVCODIGO` int(11) NOT NULL COMMENT 'Geração automática de código',
  `NIVNOME` varchar(50) DEFAULT NULL COMMENT 'Nome do nível de acesso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `nivel_acesso`
--

INSERT INTO `nivel_acesso` (`NIVCODIGO`, `NIVNOME`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'OPERACIONAL');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `PESCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `PESNOME` varchar(50) DEFAULT NULL COMMENT 'Nome da pessoa a ser cadastrada',
  `CODIGOTIP` int(11) DEFAULT NULL COMMENT 'Código do tipo de pessoa (Pessoa física, ou jurídica)',
  `PESCPF` varchar(50) DEFAULT NULL COMMENT 'CPF da pessoa a ser cadastrada',
  `PESDATA_NASCIMENTO` date DEFAULT NULL COMMENT 'Data de nascimento da pessoa a ser cadastrada',
  `PESCNPJ` varchar(50) DEFAULT NULL COMMENT 'CNPJ da empresa a ser cadastrada',
  `PESNOME_FANTASIA` varchar(50) DEFAULT NULL COMMENT 'Nome fantasia da empresa a ser cadastrada',
  `PESINSCRICAO_ESTADUAL` int(11) DEFAULT NULL COMMENT 'Inscrição estadual da empresa a ser cadastrada',
  `PESINSCRICAO_MUNICIPAL` int(11) DEFAULT NULL COMMENT 'Inscrição municipal da empresa a ser cadastrada',
  `PESCEP` varchar(50) DEFAULT NULL COMMENT 'CEP da pessoa ou empresa a ser cadastrada',
  `PESENDERECO` varchar(50) DEFAULT NULL COMMENT 'Endereço da pessoa ou empresa a ser cadastrada',
  `PESNUMERO` int(11) DEFAULT NULL COMMENT 'Número do imóvel da empresa ou pessoa a ser cadastrada',
  `PESCOMPLEMENTO` varchar(50) DEFAULT NULL COMMENT 'Complemento do endereço da pessoa ou empresa a ser cadastrada',
  `PESESTADO` varchar(50) DEFAULT NULL COMMENT 'Estado da empresa ou pessoa a ser cadastrada',
  `PESCIDADE` varchar(50) DEFAULT NULL COMMENT 'Cidade da pessoa ou empresa a ser cadastrada',
  `PESBAIRRO` varchar(50) DEFAULT NULL COMMENT 'Bairro da pessoa ou empresa a ser cadastrada',
  `PESEMAIL` varchar(50) DEFAULT NULL COMMENT 'E-mail da empresa ou pessoa a ser cadastrada',
  `PESTELEFONE` varchar(50) DEFAULT NULL COMMENT 'Telefone da pessoa ou empresa a ser cadastrada',
  `PESCELULAR` varchar(50) DEFAULT NULL COMMENT 'Celular da pessoa ou empresa a ser cadastrada',
  `PESOBSERVACAO` varchar(200) DEFAULT NULL COMMENT 'Observação para empresa ou pessoa a ser cadastrada',
  `PESSTATUS` tinyint(1) DEFAULT '1' COMMENT 'Status da pessoa quando for 1 ele será ativo, e quando for 0 significa que ele está inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `pessoa`
--

INSERT INTO `pessoa` (`PESCODIGO`, `PESNOME`, `CODIGOTIP`, `PESCPF`, `PESDATA_NASCIMENTO`, `PESCNPJ`, `PESNOME_FANTASIA`, `PESINSCRICAO_ESTADUAL`, `PESINSCRICAO_MUNICIPAL`, `PESCEP`, `PESENDERECO`, `PESNUMERO`, `PESCOMPLEMENTO`, `PESESTADO`, `PESCIDADE`, `PESBAIRRO`, `PESEMAIL`, `PESTELEFONE`, `PESCELULAR`, `PESOBSERVACAO`, `PESSTATUS`) VALUES
(1, 'GABRIELLE ROBERTA FERREIRA', 1, '123.456.789-X', '1998-04-29', NULL, NULL, NULL, NULL, '18800-000', 'RUA DAS FLORES', 2, 'APARTAMENTO', 'SP', 'PIRAJU', 'BAIRRO DAS CAPIVARA', 'GR@GMAIL.COM', '14-3351-0000', '14-99838-9911', 'devedora', 1),
(2, NULL, 2, NULL, NULL, '14.041.086/0001-05', 'ESCRITORIO CONTABIL PADRAO', NULL, 8547, '18810-009', 'RUA MAJOR MARIANO', 1009, 'DE FRENTE A CASA DOS COLCHÃO', 'SP', 'PIRAJU', 'CENTRO', 'RH@HOTMAIL.COM', '14-3351-3500', '14-99838-1234', NULL, 1),
(3, 'JOAO', 1, '123.456.847.-  ', '2022-02-25', NULL, NULL, NULL, NULL, '18800-000', 'RUA ANTONIO BASTIAO NETO', 50, 'AO LADO DA BIQUEIRA', 'SP', 'PIRAJU', 'CENTRO', 'GABRIUEL@HOTMAIL.COM', '(  )    -    ', '(  )     -    ', 'FILHO DO PRESIDENTE DA GUARDA', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_centro_custo`
--

CREATE TABLE `tipo_centro_custo` (
  `TIPCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `TIPNOME` varchar(50) DEFAULT NULL COMMENT 'Tipo do centro de custo(receita ou despesa)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `tipo_centro_custo`
--

INSERT INTO `tipo_centro_custo` (`TIPCODIGO`, `TIPNOME`) VALUES
(1, 'RECEITA'),
(2, 'DESPESA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_conta`
--

CREATE TABLE `tipo_conta` (
  `TIPCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `TIPNOME` varchar(50) DEFAULT NULL COMMENT 'Nome do tipo da conta(Caixa, Conta Corrente, Conta de Aplicação)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `tipo_conta`
--

INSERT INTO `tipo_conta` (`TIPCODIGO`, `TIPNOME`) VALUES
(1, 'CONTA CORRENTE'),
(2, 'CONTA DE APLICAÇÃO'),
(3, 'CAIXA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `DOCCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `DOCNOME` varchar(50) DEFAULT NULL COMMENT 'Nome do tipo de documento (Nota fiscal, recibo etc)',
  `DOCTIPO` tinyint(1) DEFAULT NULL COMMENT 'Tipo do documento pode ser Receita ou Despesa, sendo receita 1 e despesa 0.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `tipo_documento`
--

INSERT INTO `tipo_documento` (`DOCCODIGO`, `DOCNOME`, `DOCTIPO`) VALUES
(1, 'NOTA FISCAL', 0),
(2, 'NOTA DE SERVIÇO', 1),
(3, 'RECEIBO', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_pessoa`
--

CREATE TABLE `tipo_pessoa` (
  `TIPCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `TIPNOME` varchar(50) DEFAULT NULL COMMENT 'Nome para o tipo de pessoa(jurídica ou física)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `tipo_pessoa`
--

INSERT INTO `tipo_pessoa` (`TIPCODIGO`, `TIPNOME`) VALUES
(1, 'PESSOA FÍSICA'),
(2, 'PESSOA JURÍDICA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transferencia`
--

CREATE TABLE `transferencia` (
  `TRACODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `TRAVALOR` double DEFAULT NULL COMMENT 'Valor que será transferido',
  `TRACODIGO_CONORI` int(11) DEFAULT NULL COMMENT 'Código da conta de origem',
  `TRACODIGO_CONDES` int(11) DEFAULT NULL COMMENT 'Código da conta de destino',
  `TRADATA` date DEFAULT NULL COMMENT 'Data da transferência',
  `TRANUMERO_DOCUMENTO` varchar(50) DEFAULT NULL COMMENT 'Número do documento(Quando tem transferência no extrato sempre tem um número)',
  `TRASTATUS` tinyint(1) DEFAULT '1' COMMENT 'Se for 0 a transferência está inativa, se estiver 1 a transferência está ativa.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `transferencia`
--

INSERT INTO `transferencia` (`TRACODIGO`, `TRAVALOR`, `TRACODIGO_CONORI`, `TRACODIGO_CONDES`, `TRADATA`, `TRANUMERO_DOCUMENTO`, `TRASTATUS`) VALUES
(1, 5, 3, 1, '2022-04-29', '4585', 1),
(2, 100, 1, 3, '2022-04-28', '8575', 1),
(3, 1000, 4, 1, '2022-04-30', '8500', 1),
(4, 458, 4, 1, '2022-10-15', '459', 1),
(5, 1, 1, 2, '2022-10-10', '1', 1),
(6, 1, 2, 9, '2022-06-21', '211', 1),
(7, 150, 3, 9, '2022-10-12', '155', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `USUCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `USUNOME` varchar(50) DEFAULT NULL COMMENT 'Nome do usuário',
  `USULOGIN` varchar(50) DEFAULT NULL COMMENT 'Nome definido pelo usuário para acessar ao sistema. Se houver algum nome de usuário, o usuário terá que criar outro. O usuário está definido no banco como UNIQUE',
  `USUSENHA` varchar(30) DEFAULT NULL COMMENT 'Senha definida pelo usuário',
  `USUSTATUS` tinyint(1) DEFAULT '1' COMMENT 'Status do usuário quando for 1 ele será ativo, e quando for 0 significa que ele está inativo',
  `CODIGONIV` int(11) DEFAULT NULL COMMENT 'Código do nível de acesso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `usuario`
--

INSERT INTO `usuario` (`USUCODIGO`, `USUNOME`, `USULOGIN`, `USUSENHA`, `USUSTATUS`, `CODIGONIV`) VALUES
(1, 'GABRIELLE', 'GABRIELLE', '123', 1, 1),
(2, 'RAFAELRR', 'RAFAEL', '12345678', 0, 2),
(3, 'MARIA', 'MARIA', '12345', 0, 1),
(4, 'ricardo', 'zemane', '123456', 1, 2),
(11, 'bastião', 'Sebastião', '123456', 1, 2),
(15, 'RAFEL', 'RAFEL', '1234', 1, 1),
(16, '', '', '', 1, 1),
(17, 'rafael', 'TTR', '12345678', 1, 2),
(19, 'JOAO', 'JOAO', '12345678', 1, 2),
(20, 'RAFAEL', 'RARA', '12345678', 1, 2),
(21, 'JOAO', 'ZEZINHO', '12345678', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwcontas`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwcontas` (
`CONCODIGO` int(11)
,`CONNOME` varchar(50)
,`CODIGOTIP` int(11)
,`TIPNOME` varchar(50)
,`CONAGENCIA` varchar(50)
,`CONNUMERO_CONTA` varchar(50)
,`CONSALDO_INICIAL` double
,`CONSTATUS` tinyint(1)
,`STATUS` varchar(7)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwmostrabaixaefet`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwmostrabaixaefet` (
`BAICODIGO` int(11)
,`CODIGOLAN` int(11)
,`CODIGOPES` int(11)
,`PESNOME` varchar(50)
,`CODIGODOC` int(11)
,`DOCNOME` varchar(50)
,`LANNUMERO_DOCUMENTO` varchar(50)
,`LANVALOR_DOCUMENTO` double
,`LANDOCUMENTO` date
,`LANOBSERVACAO` varchar(200)
,`CENCODIGO` int(11)
,`CENNOME` varchar(50)
,`LANTIPO` tinyint(1)
,`TIPO` varchar(7)
,`BAISTATUS` tinyint(1)
,`STATUS` varchar(9)
,`CODIGOFOR` int(11)
,`FORNOME` varchar(50)
,`CODIGOCON` int(11)
,`CONNOME` varchar(50)
,`CONAGENCIA` varchar(50)
,`CONNUMERO_CONTA` varchar(50)
,`CODIGOTIP` int(11)
,`TIPNOME` varchar(50)
,`BAIDATAVEN` date
,`BAIDATAPGTO` date
,`BAIVALOR` double
,`BAIVALORPAGO` double
,`BAIMULTA_JUROS` double
,`BAIDESCONTO` double
,`CODIGOUSU` int(11)
,`USUNOME` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwmostrabaixapen`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwmostrabaixapen` (
`BAICODIGO` int(11)
,`CODIGOLAN` int(11)
,`CODIGOPES` int(11)
,`PESNOME` varchar(50)
,`CODIGODOC` int(11)
,`DOCNOME` varchar(50)
,`LANNUMERO_DOCUMENTO` varchar(50)
,`LANVALOR_DOCUMENTO` double
,`LANOBSERVACAO` varchar(200)
,`CENCODIGO` int(11)
,`CENNOME` varchar(50)
,`LANDOCUMENTO` date
,`LANTIPO` tinyint(1)
,`TIPO` varchar(7)
,`BAISTATUS` tinyint(1)
,`STATUS` varchar(9)
,`BAIDATAVEN` date
,`BAIVALOR` double
,`CODIGOUSU` int(11)
,`USUNOME` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwmostracentro`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwmostracentro` (
`CENCODIGO` int(11)
,`CENNOME` varchar(50)
,`CODIGOTIP` int(11)
,`CENSTATUS` tinyint(1)
,`STATUS` varchar(7)
,`TIPOCEN` varchar(7)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwmostrausu`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwmostrausu` (
`USUCODIGO` int(11)
,`USUNOME` varchar(50)
,`USULOGIN` varchar(50)
,`USUSENHA` varchar(30)
,`USUSTATUS` tinyint(1)
,`CODIGONIV` int(11)
,`STATUS` varchar(7)
,`NIVILACESSO` varchar(13)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwpessoas`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwpessoas` (
`CODIGO` int(11)
,`NOME` varchar(50)
,`CODIGOTIP` int(11)
,`TIPO` varchar(50)
,`CPF` varchar(50)
,`DATA NASCIMENTO` date
,`CNPJ` varchar(50)
,`NOME FANTASIA` varchar(50)
,`INSCRIÇÃO ESTADUAL` int(11)
,`INSCRIÇÃO MUNICIPAL` int(11)
,`CEP` varchar(50)
,`ENDEREÇO` varchar(50)
,`NÚMERO` int(11)
,`COMPLEMENTO` varchar(50)
,`ESTADO` varchar(50)
,`CIDADE` varchar(50)
,`BAIRRO` varchar(50)
,`E-MAIL` varchar(50)
,`TELEFONE` varchar(50)
,`CELULAR` varchar(50)
,`OBSERVAÇÃO` varchar(200)
,`ATIVO` tinyint(1)
,`STATUS` varchar(7)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwverparcela`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwverparcela` (
`BAICODIGO` int(11)
,`BAIVALOR` double
,`BAIDATAVEN` date
,`CODIGOLAN` int(11)
,`LANVALOR_DOCUMENTO` double
,`PESCODIGO` int(11)
,`PESNOME` varchar(50)
,`LANTIPO` tinyint(1)
,`TIPO` varchar(7)
,`BAISTATUS` tinyint(1)
,`STATUS` varchar(9)
);

-- --------------------------------------------------------

--
-- Estrutura para view `vwcontas`
--
DROP TABLE IF EXISTS `vwcontas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwcontas`  AS  select `contas`.`CONCODIGO` AS `CONCODIGO`,`contas`.`CONNOME` AS `CONNOME`,`contas`.`CODIGOTIP` AS `CODIGOTIP`,`tipo_conta`.`TIPNOME` AS `TIPNOME`,`contas`.`CONAGENCIA` AS `CONAGENCIA`,`contas`.`CONNUMERO_CONTA` AS `CONNUMERO_CONTA`,`contas`.`CONSALDO_INICIAL` AS `CONSALDO_INICIAL`,`contas`.`CONSTATUS` AS `CONSTATUS`,(case when (`contas`.`CONSTATUS` = 1) then 'ATIVO' else 'INATIVO' end) AS `STATUS` from (`contas` join `tipo_conta`) where (`tipo_conta`.`TIPCODIGO` = `contas`.`CODIGOTIP`) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwmostrabaixaefet`
--
DROP TABLE IF EXISTS `vwmostrabaixaefet`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwmostrabaixaefet`  AS  select `baixa`.`BAICODIGO` AS `BAICODIGO`,`baixa`.`CODIGOLAN` AS `CODIGOLAN`,`lancamento`.`CODIGOPES` AS `CODIGOPES`,`pessoa`.`PESNOME` AS `PESNOME`,`lancamento`.`CODIGODOC` AS `CODIGODOC`,`tipo_documento`.`DOCNOME` AS `DOCNOME`,`lancamento`.`LANNUMERO_DOCUMENTO` AS `LANNUMERO_DOCUMENTO`,`lancamento`.`LANVALOR_DOCUMENTO` AS `LANVALOR_DOCUMENTO`,`lancamento`.`LANDOCUMENTO` AS `LANDOCUMENTO`,`lancamento`.`LANOBSERVACAO` AS `LANOBSERVACAO`,`centro_custo`.`CENCODIGO` AS `CENCODIGO`,`centro_custo`.`CENNOME` AS `CENNOME`,`lancamento`.`LANTIPO` AS `LANTIPO`,(case when (`lancamento`.`LANTIPO` = 0) then 'DESPESA' else 'RECEITA' end) AS `TIPO`,`baixa`.`BAISTATUS` AS `BAISTATUS`,(case when (`baixa`.`BAISTATUS` = 0) then 'PENDENTE' else 'EFETIVADO' end) AS `STATUS`,`baixa`.`CODIGOFOR` AS `CODIGOFOR`,`forma_pagamento`.`FORNOME` AS `FORNOME`,`baixa`.`CODIGOCON` AS `CODIGOCON`,`contas`.`CONNOME` AS `CONNOME`,`contas`.`CONAGENCIA` AS `CONAGENCIA`,`contas`.`CONNUMERO_CONTA` AS `CONNUMERO_CONTA`,`contas`.`CODIGOTIP` AS `CODIGOTIP`,`tipo_conta`.`TIPNOME` AS `TIPNOME`,`baixa`.`BAIDATAVEN` AS `BAIDATAVEN`,`baixa`.`BAIDATAPGTO` AS `BAIDATAPGTO`,`baixa`.`BAIVALOR` AS `BAIVALOR`,`baixa`.`BAIVALORPAGO` AS `BAIVALORPAGO`,`baixa`.`BAIMULTA_JUROS` AS `BAIMULTA_JUROS`,`baixa`.`BAIDESCONTO` AS `BAIDESCONTO`,`baixa`.`CODIGOUSU` AS `CODIGOUSU`,`usuario`.`USUNOME` AS `USUNOME` from ((((((((`baixa` join `forma_pagamento` on((`baixa`.`CODIGOFOR` = `forma_pagamento`.`FORCODIGO`))) join `contas` on((`baixa`.`CODIGOCON` = `contas`.`CONCODIGO`))) join `tipo_conta` on((`contas`.`CODIGOTIP` = `tipo_conta`.`TIPCODIGO`))) join `lancamento` on((`baixa`.`CODIGOLAN` = `lancamento`.`LANCODIGO`))) join `pessoa` on((`lancamento`.`CODIGOPES` = `pessoa`.`PESCODIGO`))) join `tipo_documento` on((`lancamento`.`CODIGODOC` = `tipo_documento`.`DOCCODIGO`))) join `usuario` on((`baixa`.`CODIGOUSU` = `usuario`.`USUCODIGO`))) join `centro_custo` on((`centro_custo`.`CENCODIGO` = `lancamento`.`CODIGOCEN`))) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwmostrabaixapen`
--
DROP TABLE IF EXISTS `vwmostrabaixapen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwmostrabaixapen`  AS  select `baixa`.`BAICODIGO` AS `BAICODIGO`,`baixa`.`CODIGOLAN` AS `CODIGOLAN`,`lancamento`.`CODIGOPES` AS `CODIGOPES`,`pessoa`.`PESNOME` AS `PESNOME`,`lancamento`.`CODIGODOC` AS `CODIGODOC`,`tipo_documento`.`DOCNOME` AS `DOCNOME`,`lancamento`.`LANNUMERO_DOCUMENTO` AS `LANNUMERO_DOCUMENTO`,`lancamento`.`LANVALOR_DOCUMENTO` AS `LANVALOR_DOCUMENTO`,`lancamento`.`LANOBSERVACAO` AS `LANOBSERVACAO`,`centro_custo`.`CENCODIGO` AS `CENCODIGO`,`centro_custo`.`CENNOME` AS `CENNOME`,`lancamento`.`LANDOCUMENTO` AS `LANDOCUMENTO`,`lancamento`.`LANTIPO` AS `LANTIPO`,(case when (`lancamento`.`LANTIPO` = 0) then 'DESPESA' else 'RECEITA' end) AS `TIPO`,`baixa`.`BAISTATUS` AS `BAISTATUS`,(case when (`baixa`.`BAISTATUS` = 0) then 'PENDENTE' else 'EFETIVADO' end) AS `STATUS`,`baixa`.`BAIDATAVEN` AS `BAIDATAVEN`,`baixa`.`BAIVALOR` AS `BAIVALOR`,`baixa`.`CODIGOUSU` AS `CODIGOUSU`,`usuario`.`USUNOME` AS `USUNOME` from (((((`baixa` join `lancamento` on((`baixa`.`CODIGOLAN` = `lancamento`.`LANCODIGO`))) join `pessoa` on((`lancamento`.`CODIGOPES` = `pessoa`.`PESCODIGO`))) join `tipo_documento` on((`lancamento`.`CODIGODOC` = `tipo_documento`.`DOCCODIGO`))) join `usuario` on((`baixa`.`CODIGOUSU` = `usuario`.`USUCODIGO`))) join `centro_custo` on((`centro_custo`.`CENCODIGO` = `lancamento`.`CODIGOCEN`))) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwmostracentro`
--
DROP TABLE IF EXISTS `vwmostracentro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwmostracentro`  AS  select `centro_custo`.`CENCODIGO` AS `CENCODIGO`,`centro_custo`.`CENNOME` AS `CENNOME`,`centro_custo`.`CODIGOTIP` AS `CODIGOTIP`,`centro_custo`.`CENSTATUS` AS `CENSTATUS`,(case when (`centro_custo`.`CENSTATUS` = 1) then 'ATIVO' else 'INATIVO' end) AS `STATUS`,(case when (`centro_custo`.`CODIGOTIP` = 1) then 'RECEITA' else 'DESPESA' end) AS `TIPOCEN` from `centro_custo` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwmostrausu`
--
DROP TABLE IF EXISTS `vwmostrausu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwmostrausu`  AS  select `usuario`.`USUCODIGO` AS `USUCODIGO`,`usuario`.`USUNOME` AS `USUNOME`,`usuario`.`USULOGIN` AS `USULOGIN`,`usuario`.`USUSENHA` AS `USUSENHA`,`usuario`.`USUSTATUS` AS `USUSTATUS`,`usuario`.`CODIGONIV` AS `CODIGONIV`,(case when (`usuario`.`USUSTATUS` = 1) then 'ATIVO' else 'INATIVO' end) AS `STATUS`,(case when (`usuario`.`CODIGONIV` = 1) then 'ADMINISTRADOR' else 'OPERACIONAL' end) AS `NIVILACESSO` from `usuario` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwpessoas`
--
DROP TABLE IF EXISTS `vwpessoas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwpessoas`  AS  select `p`.`PESCODIGO` AS `CODIGO`,`p`.`PESNOME` AS `NOME`,`p`.`CODIGOTIP` AS `CODIGOTIP`,`t`.`TIPNOME` AS `TIPO`,`p`.`PESCPF` AS `CPF`,`p`.`PESDATA_NASCIMENTO` AS `DATA NASCIMENTO`,`p`.`PESCNPJ` AS `CNPJ`,`p`.`PESNOME_FANTASIA` AS `NOME FANTASIA`,`p`.`PESINSCRICAO_ESTADUAL` AS `INSCRIÇÃO ESTADUAL`,`p`.`PESINSCRICAO_MUNICIPAL` AS `INSCRIÇÃO MUNICIPAL`,`p`.`PESCEP` AS `CEP`,`p`.`PESENDERECO` AS `ENDEREÇO`,`p`.`PESNUMERO` AS `NÚMERO`,`p`.`PESCOMPLEMENTO` AS `COMPLEMENTO`,`p`.`PESESTADO` AS `ESTADO`,`p`.`PESCIDADE` AS `CIDADE`,`p`.`PESBAIRRO` AS `BAIRRO`,`p`.`PESEMAIL` AS `E-MAIL`,`p`.`PESTELEFONE` AS `TELEFONE`,`p`.`PESCELULAR` AS `CELULAR`,`p`.`PESOBSERVACAO` AS `OBSERVAÇÃO`,`p`.`PESSTATUS` AS `ATIVO`,(case when (`p`.`PESSTATUS` = 1) then 'ATIVO' else 'INATIVO' end) AS `STATUS` from (`pessoa` `p` join `tipo_pessoa` `t` on((`p`.`CODIGOTIP` = `t`.`TIPCODIGO`))) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwverparcela`
--
DROP TABLE IF EXISTS `vwverparcela`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwverparcela`  AS  select `baixa`.`BAICODIGO` AS `BAICODIGO`,`baixa`.`BAIVALOR` AS `BAIVALOR`,`baixa`.`BAIDATAVEN` AS `BAIDATAVEN`,`baixa`.`CODIGOLAN` AS `CODIGOLAN`,`lancamento`.`LANVALOR_DOCUMENTO` AS `LANVALOR_DOCUMENTO`,`pessoa`.`PESCODIGO` AS `PESCODIGO`,`pessoa`.`PESNOME` AS `PESNOME`,`lancamento`.`LANTIPO` AS `LANTIPO`,(case when (`lancamento`.`LANTIPO` = 0) then 'DESPESA' else 'RECEITA' end) AS `TIPO`,`baixa`.`BAISTATUS` AS `BAISTATUS`,(case when (`baixa`.`BAISTATUS` = 0) then 'PENDENTE' else 'EFETIVADO' end) AS `STATUS` from ((`baixa` join `lancamento` on((`baixa`.`CODIGOLAN` = `lancamento`.`LANCODIGO`))) join `pessoa` on((`lancamento`.`CODIGOPES` = `pessoa`.`PESCODIGO`))) ;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `baixa`
--
ALTER TABLE `baixa`
  ADD PRIMARY KEY (`BAICODIGO`),
  ADD KEY `CODIGOLAN` (`CODIGOLAN`),
  ADD KEY `CODIGOFOR` (`CODIGOFOR`),
  ADD KEY `CODIGOCAD` (`CODIGOCON`),
  ADD KEY `CODIGOUSU` (`CODIGOUSU`);

--
-- Índices de tabela `centro_custo`
--
ALTER TABLE `centro_custo`
  ADD PRIMARY KEY (`CENCODIGO`),
  ADD KEY `CODIGOTIP` (`CODIGOTIP`);

--
-- Índices de tabela `contas`
--
ALTER TABLE `contas`
  ADD PRIMARY KEY (`CONCODIGO`),
  ADD KEY `CODTIP` (`CODIGOTIP`);

--
-- Índices de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`FORCODIGO`);

--
-- Índices de tabela `lancamento`
--
ALTER TABLE `lancamento`
  ADD PRIMARY KEY (`LANCODIGO`),
  ADD KEY `CODIGODOC` (`CODIGODOC`),
  ADD KEY `CODIGOPES` (`CODIGOPES`),
  ADD KEY `CODIGOCEN` (`CODIGOCEN`),
  ADD KEY `CODIGOUSU` (`CODIGOUSU`);

--
-- Índices de tabela `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
  ADD PRIMARY KEY (`NIVCODIGO`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`PESCODIGO`),
  ADD UNIQUE KEY `PESCPF` (`PESCPF`),
  ADD UNIQUE KEY `PESCNPJ` (`PESCNPJ`),
  ADD KEY `CODIGOTIP` (`CODIGOTIP`);

--
-- Índices de tabela `tipo_centro_custo`
--
ALTER TABLE `tipo_centro_custo`
  ADD PRIMARY KEY (`TIPCODIGO`);

--
-- Índices de tabela `tipo_conta`
--
ALTER TABLE `tipo_conta`
  ADD PRIMARY KEY (`TIPCODIGO`);

--
-- Índices de tabela `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`DOCCODIGO`);

--
-- Índices de tabela `tipo_pessoa`
--
ALTER TABLE `tipo_pessoa`
  ADD PRIMARY KEY (`TIPCODIGO`);

--
-- Índices de tabela `transferencia`
--
ALTER TABLE `transferencia`
  ADD PRIMARY KEY (`TRACODIGO`),
  ADD KEY `TRACODIGO_CONORI` (`TRACODIGO_CONORI`),
  ADD KEY `TRACODIGO_CONDES` (`TRACODIGO_CONDES`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`USUCODIGO`),
  ADD UNIQUE KEY `USULOGIN` (`USULOGIN`),
  ADD KEY `CODIGONIV` (`CODIGONIV`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `baixa`
--
ALTER TABLE `baixa`
  MODIFY `BAICODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT de tabela `centro_custo`
--
ALTER TABLE `centro_custo`
  MODIFY `CENCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `contas`
--
ALTER TABLE `contas`
  MODIFY `CONCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `FORCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `lancamento`
--
ALTER TABLE `lancamento`
  MODIFY `LANCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT de tabela `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
  MODIFY `NIVCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática de código', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `PESCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo_centro_custo`
--
ALTER TABLE `tipo_centro_custo`
  MODIFY `TIPCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipo_conta`
--
ALTER TABLE `tipo_conta`
  MODIFY `TIPCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `DOCCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo_pessoa`
--
ALTER TABLE `tipo_pessoa`
  MODIFY `TIPCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `TRACODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `USUCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=22;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `baixa`
--
ALTER TABLE `baixa`
  ADD CONSTRAINT `baixa_ibfk_1` FOREIGN KEY (`CODIGOLAN`) REFERENCES `lancamento` (`LANCODIGO`),
  ADD CONSTRAINT `baixa_ibfk_2` FOREIGN KEY (`CODIGOFOR`) REFERENCES `forma_pagamento` (`FORCODIGO`),
  ADD CONSTRAINT `baixa_ibfk_3` FOREIGN KEY (`CODIGOCON`) REFERENCES `contas` (`CONCODIGO`),
  ADD CONSTRAINT `baixa_ibfk_4` FOREIGN KEY (`CODIGOUSU`) REFERENCES `usuario` (`USUCODIGO`);

--
-- Restrições para tabelas `centro_custo`
--
ALTER TABLE `centro_custo`
  ADD CONSTRAINT `centro_custo_ibfk_1` FOREIGN KEY (`CODIGOTIP`) REFERENCES `tipo_centro_custo` (`TIPCODIGO`);

--
-- Restrições para tabelas `contas`
--
ALTER TABLE `contas`
  ADD CONSTRAINT `contas_ibfk_1` FOREIGN KEY (`CODIGOTIP`) REFERENCES `tipo_conta` (`TIPCODIGO`);

--
-- Restrições para tabelas `lancamento`
--
ALTER TABLE `lancamento`
  ADD CONSTRAINT `lancamento_ibfk_1` FOREIGN KEY (`CODIGODOC`) REFERENCES `tipo_documento` (`DOCCODIGO`),
  ADD CONSTRAINT `lancamento_ibfk_2` FOREIGN KEY (`CODIGOPES`) REFERENCES `pessoa` (`PESCODIGO`),
  ADD CONSTRAINT `lancamento_ibfk_3` FOREIGN KEY (`CODIGOCEN`) REFERENCES `centro_custo` (`CENCODIGO`),
  ADD CONSTRAINT `lancamento_ibfk_4` FOREIGN KEY (`CODIGOUSU`) REFERENCES `usuario` (`USUCODIGO`),
  ADD CONSTRAINT `lancamento_ibfk_5` FOREIGN KEY (`CODIGOUSU`) REFERENCES `usuario` (`USUCODIGO`);

--
-- Restrições para tabelas `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`CODIGOTIP`) REFERENCES `tipo_pessoa` (`TIPCODIGO`);

--
-- Restrições para tabelas `transferencia`
--
ALTER TABLE `transferencia`
  ADD CONSTRAINT `transferencia_ibfk_2` FOREIGN KEY (`TRACODIGO_CONORI`) REFERENCES `contas` (`CONCODIGO`),
  ADD CONSTRAINT `transferencia_ibfk_3` FOREIGN KEY (`TRACODIGO_CONDES`) REFERENCES `contas` (`CONCODIGO`);

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`CODIGONIV`) REFERENCES `nivel_acesso` (`NIVCODIGO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
