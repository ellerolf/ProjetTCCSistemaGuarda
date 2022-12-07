-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/12/2022 às 00:35
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
(1, 1, 0, NULL, NULL, '2022-12-07', 750, NULL, NULL, 1, NULL, NULL),
(2, 1, 0, NULL, NULL, '2022-12-08', 750, NULL, NULL, 1, NULL, NULL),
(3, 2, 0, NULL, NULL, '2022-12-07', 1000, NULL, NULL, 1, NULL, NULL),
(4, 3, 0, NULL, NULL, '2022-12-08', 850, NULL, NULL, 1, NULL, NULL),
(5, 4, 1, 4, 2, '2022-12-07', 400, NULL, 100.5, 1, '2022-12-07', 299.5),
(6, 4, 0, NULL, NULL, '2022-12-08', 450.5, NULL, NULL, 1, NULL, NULL),
(7, 5, 1, 4, 2, '2022-12-06', 500, 15.5, NULL, 1, '2022-12-07', 515.5),
(8, 5, 0, NULL, NULL, '2022-12-08', 500, NULL, NULL, 1, NULL, NULL),
(9, 6, 1, 4, 1, '2022-12-07', 123.5, NULL, NULL, 1, '2022-12-07', 123.5);

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
(1, 'FGTS', 2, 1),
(2, 'ALIMENTAÇÃO', 2, 1),
(3, 'ENERGIA ELÉTRICA', 2, 1),
(4, 'JARDINAGEM', 2, 1),
(5, 'SUBVENÇÃO MUNICIPAL', 1, 1),
(6, 'SUBVENÇÃO ESTADUAL', 1, 1),
(7, 'DOAÇÃO P.F.', 1, 1),
(8, 'DOAÇÃO P.J.', 1, 1);

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
(1, 'BANCO DO BRASIL ', 1, '777', '12345', 85.5, 1),
(2, 'BANCO BRADESCO', 1, '888', '4568', 10.32, 1),
(3, 'CAIXA GERAL', 3, NULL, NULL, 23.65, 1);

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
(3, 'DÉBITO AUTOMÁTICO'),
(4, 'TRANSF. BANCÁRIA'),
(5, 'TRANSF. TED'),
(6, 'TRANSF. DOC');

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
(1, '2022-12-07', 4, '586', 1500, 1, 2, '', 0, 1),
(2, '2022-12-07', 2, '1', 1000, 2, 6, '', 1, 1),
(3, '2022-12-08', 4, '21', 850, 4, 4, 'LIMPEZA DO JARDIM', 0, 1),
(4, '2022-12-06', 1, '5443', 850.5, 4, 4, '', 0, 1),
(5, '2022-12-06', 2, '1221', 1000, 1, 7, '', 1, 1),
(6, '2022-12-07', 8, '121', 123.5, 2, 8, '', 1, 1);

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
  `PESINSCRICAO_ESTADUAL` varchar(20) DEFAULT NULL COMMENT 'Inscrição estadual da empresa a ser cadastrada',
  `PESINSCRICAO_MUNICIPAL` varchar(20) DEFAULT NULL COMMENT 'Inscrição municipal da empresa a ser cadastrada',
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
  `PESSTATUS` tinyint(1) DEFAULT '1' COMMENT 'Status da pessoa quando for 1 ele será ativo, e quando for 0 significa que ele está inativo',
  `PESLGPD` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Fazendo dump de dados para tabela `pessoa`
--

INSERT INTO `pessoa` (`PESCODIGO`, `PESNOME`, `CODIGOTIP`, `PESCPF`, `PESDATA_NASCIMENTO`, `PESCNPJ`, `PESNOME_FANTASIA`, `PESINSCRICAO_ESTADUAL`, `PESINSCRICAO_MUNICIPAL`, `PESCEP`, `PESENDERECO`, `PESNUMERO`, `PESCOMPLEMENTO`, `PESESTADO`, `PESCIDADE`, `PESBAIRRO`, `PESEMAIL`, `PESTELEFONE`, `PESCELULAR`, `PESOBSERVACAO`, `PESSTATUS`, `PESLGPD`) VALUES
(1, 'FERNANDO ARTHUR PIRES', 1, '991.938.540-99', '1899-12-30', NULL, NULL, NULL, NULL, '18800-000', 'SETOR CASA DO ESTUDANTE UNIVERSITÁRIO BLOCO B', 32, '', 'SP', 'PIRAJU', 'CAMPUS UNIVERSITÁRIO DARCY RIBEIRO', '', '(  )    -    ', '(14)99999-9999', '', 1, 0),
(2, 'MARLENE E FABIANA FILMAGENS ME', 2, NULL, NULL, '34.412.696/0001-85', 'MARLENE E FABIANA FILMAGENS ME', '681.751.372.523', '681.751.372.895', '18800-000', 'AVENIDA PADRE VICENTE MELILLO ', 955, '', 'SP', 'OSASCO', 'UMUARAMA', '', '(14)9999-9999', '(14)99838-9911', '', 1, 0),
(3, 'LORENZO E DANIELA TELAS LTDA', 2, NULL, NULL, '55.894.001/0001-19', 'LORENZO E DANIELA TELAS', '111111111111111', '000000000000000', '18800-000', 'RUA CARDOSO DE MELO', 122, '', 'SP', 'PIRAJU', 'VL GLÓRIA', '', '(14)3351-3244', '(14)99732-4474', '', 0, 0),
(4, 'PEDRO LEANDRO LEONARDO SOUZA', 1, '414.665.748-28', '1996-10-04', NULL, NULL, NULL, NULL, '18800-000', 'AVENIDA DOS IMIGRANTES', 530, '', 'SP', 'PIRAJU', 'PANAIR', '', '(  )    -    ', '(14)99052-2222', '', 1, 0);

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
(3, 'RECIBO', 0),
(4, 'NOTA DE SERVIÇO', 0),
(5, 'SUBVENÇÃO', 1),
(6, 'GUIA', 0),
(7, 'CUPOM FISCAL', 0),
(8, 'RECIBO', 1);

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
(1, 45.5, 1, 2, '2022-12-07', '12', 1);

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
(1, 'ADMINISTRADOR', 'ADMIN', '12345678', 1, 1),
(2, 'OPERACIONAL', 'OPERACIONAL', '12345678', 1, 2);

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
-- Estrutura stand-in para view `vwextrato`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwextrato` (
`operacao` varchar(7)
,`conta` int(11)
,`data` date
,`descricao` varchar(123)
,`documento` varchar(50)
,`valor` double
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
,`INSCRIÇÃO ESTADUAL` varchar(20)
,`INSCRIÇÃO MUNICIPAL` varchar(20)
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
,`LGPD` tinyint(1)
,`ATIVO` tinyint(1)
,`STATUS` varchar(7)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwtransferencia`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwtransferencia` (
`TRACODIGO` int(11)
,`TRAVALOR` double
,`TRADATA` date
,`TRANUMERO_DOCUMENTO` varchar(50)
,`TRASTATUS` tinyint(1)
,`STATUS` varchar(7)
,`NOME DA CONTA DE ORIGEM` varchar(50)
,`AGENCIA DA CONTA DE ORIGEM` varchar(50)
,`N° CONTA DE ORIGEM` varchar(50)
,`CODIGO DA CONTA DE ORIGEM` int(11)
,`NOME DA CONTA DE DESTINO` varchar(50)
,`AGENCIA DA CONTA DE destino` varchar(50)
,`N° CONTA DE DESTINO` varchar(50)
,`CODIGO DA CONTA DE DESTINO` int(11)
,`TIPO DA CONTA DE ORIGEM` varchar(50)
,`TIPO DA CONTA DE DESTINO` varchar(50)
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
-- Estrutura para view `vwextrato`
--
DROP TABLE IF EXISTS `vwextrato`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwextrato`  AS  select 'CREDITO' AS `operacao`,`transferencia`.`TRACODIGO_CONDES` AS `conta`,`transferencia`.`TRADATA` AS `data`,concat(concat('Transferência de ',`origem`.`CONNOME`),concat(' para ',`destino`.`CONNOME`)) AS `descricao`,`transferencia`.`TRANUMERO_DOCUMENTO` AS `documento`,`transferencia`.`TRAVALOR` AS `valor` from ((`transferencia` join `contas` `origem` on((`origem`.`CONCODIGO` = `transferencia`.`TRACODIGO_CONORI`))) join `contas` `destino` on((`destino`.`CONCODIGO` = `transferencia`.`TRACODIGO_CONDES`))) where (`transferencia`.`TRASTATUS` = 1) union all select 'DEBITO' AS `operacao`,`transferencia`.`TRACODIGO_CONORI` AS `conta`,`transferencia`.`TRADATA` AS `data`,concat(concat('Transferência de ',`origem`.`CONNOME`),concat(' para ',`destino`.`CONNOME`)) AS `descricao`,`transferencia`.`TRANUMERO_DOCUMENTO` AS `documento`,(`transferencia`.`TRAVALOR` * -(1)) AS `valor` from ((`transferencia` join `contas` `origem` on((`origem`.`CONCODIGO` = `transferencia`.`TRACODIGO_CONORI`))) join `contas` `destino` on((`destino`.`CONCODIGO` = `transferencia`.`TRACODIGO_CONDES`))) where (`transferencia`.`TRASTATUS` = 1) union all select (case when (`vwmostrabaixaefet`.`LANTIPO` = 0) then 'DEBITO' when (`vwmostrabaixaefet`.`LANTIPO` = 1) then 'CREDITO' else NULL end) AS `operacao`,`vwmostrabaixaefet`.`CODIGOCON` AS `conta`,`vwmostrabaixaefet`.`BAIDATAPGTO` AS `data`,`vwmostrabaixaefet`.`PESNOME` AS `descricao`,`vwmostrabaixaefet`.`LANNUMERO_DOCUMENTO` AS `documento`,(case when (`vwmostrabaixaefet`.`LANTIPO` = 0) then (`vwmostrabaixaefet`.`BAIVALORPAGO` * -(1)) when (`vwmostrabaixaefet`.`LANTIPO` = 1) then `vwmostrabaixaefet`.`BAIVALORPAGO` else NULL end) AS `valor` from `vwmostrabaixaefet` order by `data` ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwpessoas`  AS  select `p`.`PESCODIGO` AS `CODIGO`,`p`.`PESNOME` AS `NOME`,`p`.`CODIGOTIP` AS `CODIGOTIP`,`t`.`TIPNOME` AS `TIPO`,`p`.`PESCPF` AS `CPF`,`p`.`PESDATA_NASCIMENTO` AS `DATA NASCIMENTO`,`p`.`PESCNPJ` AS `CNPJ`,`p`.`PESNOME_FANTASIA` AS `NOME FANTASIA`,`p`.`PESINSCRICAO_ESTADUAL` AS `INSCRIÇÃO ESTADUAL`,`p`.`PESINSCRICAO_MUNICIPAL` AS `INSCRIÇÃO MUNICIPAL`,`p`.`PESCEP` AS `CEP`,`p`.`PESENDERECO` AS `ENDEREÇO`,`p`.`PESNUMERO` AS `NÚMERO`,`p`.`PESCOMPLEMENTO` AS `COMPLEMENTO`,`p`.`PESESTADO` AS `ESTADO`,`p`.`PESCIDADE` AS `CIDADE`,`p`.`PESBAIRRO` AS `BAIRRO`,`p`.`PESEMAIL` AS `E-MAIL`,`p`.`PESTELEFONE` AS `TELEFONE`,`p`.`PESCELULAR` AS `CELULAR`,`p`.`PESOBSERVACAO` AS `OBSERVAÇÃO`,`p`.`PESLGPD` AS `LGPD`,`p`.`PESSTATUS` AS `ATIVO`,(case when (`p`.`PESSTATUS` = 1) then 'ATIVO' else 'INATIVO' end) AS `STATUS` from (`pessoa` `p` join `tipo_pessoa` `t` on((`p`.`CODIGOTIP` = `t`.`TIPCODIGO`))) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwtransferencia`
--
DROP TABLE IF EXISTS `vwtransferencia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwtransferencia`  AS  select `transferencia`.`TRACODIGO` AS `TRACODIGO`,`transferencia`.`TRAVALOR` AS `TRAVALOR`,`transferencia`.`TRADATA` AS `TRADATA`,`transferencia`.`TRANUMERO_DOCUMENTO` AS `TRANUMERO_DOCUMENTO`,`transferencia`.`TRASTATUS` AS `TRASTATUS`,(case when (`transferencia`.`TRASTATUS` = 1) then 'ATIVO' when (`transferencia`.`TRASTATUS` = 0) then 'INATIVO' end) AS `STATUS`,`origem`.`CONNOME` AS `NOME DA CONTA DE ORIGEM`,`origem`.`CONAGENCIA` AS `AGENCIA DA CONTA DE ORIGEM`,`origem`.`CONNUMERO_CONTA` AS `N° CONTA DE ORIGEM`,`origem`.`CONCODIGO` AS `CODIGO DA CONTA DE ORIGEM`,`destino`.`CONNOME` AS `NOME DA CONTA DE DESTINO`,`destino`.`CONAGENCIA` AS `AGENCIA DA CONTA DE destino`,`destino`.`CONNUMERO_CONTA` AS `N° CONTA DE DESTINO`,`destino`.`CONCODIGO` AS `CODIGO DA CONTA DE DESTINO`,`tipocontaorigem`.`TIPNOME` AS `TIPO DA CONTA DE ORIGEM`,`tipocontadestino`.`TIPNOME` AS `TIPO DA CONTA DE DESTINO` from ((((`transferencia` join `contas` `origem` on((`origem`.`CONCODIGO` = `transferencia`.`TRACODIGO_CONORI`))) join `contas` `destino` on((`destino`.`CONCODIGO` = `transferencia`.`TRACODIGO_CONDES`))) join `tipo_conta` `tipocontaorigem` on((`origem`.`CODIGOTIP` = `tipocontaorigem`.`TIPCODIGO`))) join `tipo_conta` `tipocontadestino` on((`destino`.`CODIGOTIP` = `tipocontadestino`.`TIPCODIGO`))) order by `transferencia`.`TRADATA` ;

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
  MODIFY `BAICODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `centro_custo`
--
ALTER TABLE `centro_custo`
  MODIFY `CENCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `contas`
--
ALTER TABLE `contas`
  MODIFY `CONCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `FORCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `lancamento`
--
ALTER TABLE `lancamento`
  MODIFY `LANCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
  MODIFY `NIVCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática de código', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `PESCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=5;

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
  MODIFY `DOCCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tipo_pessoa`
--
ALTER TABLE `tipo_pessoa`
  MODIFY `TIPCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `TRACODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `USUCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=3;

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
