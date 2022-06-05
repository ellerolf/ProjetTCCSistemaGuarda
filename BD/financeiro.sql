-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25-Maio-2022 às 02:32
-- Versão do servidor: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `financeiro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `baixa`
--

CREATE TABLE `baixa` (
  `BAICODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `CODIGOLAN` int(11) DEFAULT NULL COMMENT 'Código do lançamento',
  `BAISTATUS` tinyint(1) DEFAULT '0' COMMENT 'Status de pagamento ou recebimento, sendo pendente 0 e finalizado 1',
  `CODIGOFOR` int(11) DEFAULT NULL COMMENT 'Código da forma de pagamento(Dinheiro, Cheque)',
  `CODIGOCON` int(11) DEFAULT NULL COMMENT 'Código da conta onde irá sair ou entrar o dinheiro',
  `BAIDATA` date DEFAULT NULL COMMENT 'Data do pagamento',
  `BAIVALOR` double DEFAULT NULL COMMENT 'Valor pago a ser baixado',
  `BAIMULTA_JUROS` double DEFAULT NULL COMMENT 'Valor da multa ou juros da respectiva baixa',
  `BAIDESCONTO` double DEFAULT NULL COMMENT 'Valor de desconto da respectiva baixa',
  `CODIGOUSU` int(11) DEFAULT NULL COMMENT 'Código do usuário que efetuou o lançamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `baixa`
--

INSERT INTO `baixa` (`BAICODIGO`, `CODIGOLAN`, `BAISTATUS`, `CODIGOFOR`, `CODIGOCON`, `BAIDATA`, `BAIVALOR`, `BAIMULTA_JUROS`, `BAIDESCONTO`, `CODIGOUSU`) VALUES
(1, 1, 0, 2, NULL, '2022-05-31', 10, NULL, NULL, 1),
(2, 2, 0, 2, NULL, '2022-01-30', 777.85, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `centro_custo`
--

CREATE TABLE `centro_custo` (
  `CENCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `CENNOME` varchar(50) DEFAULT NULL COMMENT 'Nome do Centro de Custo',
  `CODIGOTIP` int(11) DEFAULT NULL COMMENT 'Tipo de centro de custo',
  `CENSTATUS` tinyint(1) DEFAULT '1' COMMENT 'centro de custo, poderá ser ativo ou inativo, sendo ativo 1 e inativo 0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `centro_custo`
--

INSERT INTO `centro_custo` (`CENCODIGO`, `CENNOME`, `CODIGOTIP`, `CENSTATUS`) VALUES
(1, 'ALIMENTAÇÃO', 2, 1),
(2, 'ENERGIA ELÉTRICA', 2, 0),
(3, 'DOAÇÃO PESSOA FÍSICA', 1, 1),
(4, 'DOAÇÃO PESSOA JURÍDICA', 1, 0),
(5, 'FGTS', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas`
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
-- Extraindo dados da tabela `contas`
--

INSERT INTO `contas` (`CONCODIGO`, `CONNOME`, `CODIGOTIP`, `CONAGENCIA`, `CONNUMERO_CONTA`, `CONSALDO_INICIAL`, `CONSTATUS`) VALUES
(1, 'CAIXA ECONOMICA FEDERAL', 1, '333', '242-2', 1410.05, 1),
(2, 'BANCO DO BRASIL', 1, '77', '11.502-4', 510.04, 0),
(3, 'CAIXA ZONA AZUL', 3, NULL, NULL, 20.5, 1),
(4, 'CAIXA ECONOMICA RENDA FIXA', 2, '333', '242-2', 256.854, 1),
(5, 'BANCO NACIONAL', 1, '0444-5', '1234-X', 748.5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `FORCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `FORNOME` varchar(50) DEFAULT NULL COMMENT 'Nome da forma de pagamento (Dinheiro, Cheque)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`FORCODIGO`, `FORNOME`) VALUES
(1, 'DINHEIRO'),
(2, 'CHEQUE'),
(3, 'DÉBITO AUTOMÁTICO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamento`
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
-- Extraindo dados da tabela `lancamento`
--

INSERT INTO `lancamento` (`LANCODIGO`, `LANDOCUMENTO`, `CODIGODOC`, `LANNUMERO_DOCUMENTO`, `LANVALOR_DOCUMENTO`, `CODIGOPES`, `CODIGOCEN`, `LANOBSERVACAO`, `LANTIPO`, `CODIGOUSU`) VALUES
(1, '2022-04-10', 1, '1005', 30.3, 2, 2, 'DARF DE IR QUE ELES PAGARAM PARA NÓS', 0, 1),
(2, '2022-10-05', 1, '858', 150.55, 2, 2, 'a fulana pediu', 0, 1),
(3, '2022-10-15', 1, '859', 1505, 1, 2, 'VENDA DE SUCATA', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivel_acesso`
--

CREATE TABLE `nivel_acesso` (
  `NIVCODIGO` int(11) NOT NULL COMMENT 'Geração automática de código',
  `NIVNOME` varchar(50) DEFAULT NULL COMMENT 'Nome do nível de acesso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `nivel_acesso`
--

INSERT INTO `nivel_acesso` (`NIVCODIGO`, `NIVNOME`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'OPERACIONAL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `PESCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `PESNOME` varchar(50) DEFAULT NULL COMMENT 'Nome da pessoa a ser cadastrada',
  `CODIGOTIP` int(11) DEFAULT NULL COMMENT 'Código do tipo de pessoa (Pessoa física, ou jurídica)',
  `PESCPF` varchar(50) DEFAULT NULL COMMENT 'CPF da pessoa a ser cadastrada',
  `PESDATA_NASCIMENTO` date DEFAULT NULL COMMENT 'Data de nascimento da pessoa a ser cadastrada',
  `PESCNPJ` varchar(50) DEFAULT NULL COMMENT 'CNPJ da empresa a ser cadastrada',
  `PESRAZAO_SOCIAL` varchar(50) DEFAULT NULL COMMENT 'Razão social da empresa a ser cadastrada',
  `PESNOME_FANTASIA` varchar(50) DEFAULT NULL COMMENT 'Nome fantasia da empresa a ser cadastrada',
  `PESINSCRICAO_ESTADUAL` int(11) DEFAULT NULL COMMENT 'Inscrição estadual da empresa a ser cadastrada',
  `PESINSCRICACAO_MUNICIPAL` int(11) DEFAULT NULL COMMENT 'Inscrição municipal da empresa a ser cadastrada',
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
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`PESCODIGO`, `PESNOME`, `CODIGOTIP`, `PESCPF`, `PESDATA_NASCIMENTO`, `PESCNPJ`, `PESRAZAO_SOCIAL`, `PESNOME_FANTASIA`, `PESINSCRICAO_ESTADUAL`, `PESINSCRICACAO_MUNICIPAL`, `PESCEP`, `PESENDERECO`, `PESNUMERO`, `PESCOMPLEMENTO`, `PESESTADO`, `PESCIDADE`, `PESBAIRRO`, `PESEMAIL`, `PESTELEFONE`, `PESCELULAR`, `PESOBSERVACAO`, `PESSTATUS`) VALUES
(1, 'GABRIELLE ROBERTA FERREIRA', 1, '123.456.789-X', '1998-04-29', NULL, NULL, NULL, NULL, NULL, '18800-000', 'RUA DAS FLORES', 2, 'APARTAMENTO', 'SP', 'PIRAJU', 'BAIRRO DAS CAPIVARA', 'GR@GMAIL.COM', '14-3351-0000', '14-99838-9911', 'devedora', 1),
(2, NULL, 2, NULL, NULL, '14.041.086/0001-05', 'ESCRITORIO CONTABIL PADRAO PIRAJU S/S LTDA\r\n', 'ESCRITORIO CONTABIL PADRAO', NULL, 8547, '18810-009', 'RUA MAJOR MARIANO', 1009, 'DE FRENTE A CASA DOS COLCHÃO', 'SP', 'PIRAJU', 'CENTRO', 'RH@HOTMAIL.COM', '14-3351-3500', '14-99838-1234', NULL, 1),
(3, 'GABRIEL', 1, '123.456.847-85', '2022-02-25', NULL, NULL, NULL, NULL, NULL, '18800-000', 'RUA ANTONIO BASTIAO NETO', 50, 'AO LADO DA BIQUEIRA', 'SP', 'PIRAJU', 'CENTRO', 'GABRIUEL@HOTMAIL.COM', '14-3351-1256', '14-99785-8596', 'FILHO DO PRESIDENTE DA GUARDA', 1),
(4, NULL, 2, NULL, NULL, '10.262.602/0001-70', 'CARLOS ALBERTO ANDRADE PROMOCAO DE VENDAS LTDA', 'PORTAL ASSESSORIA E NEGOCIOS', 532568, 8596, '18800-009', 'R NENE FREITAS', 271, 'PERTO DOS BANCOS', 'SP', 'PIRAJU', 'CENTRO', 'CARLOS@HOTMAIL.COM', '3351-6050', '14-98596-5058', 'ÓTIMO FORNECEDOR', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_centro_custo`
--

CREATE TABLE `tipo_centro_custo` (
  `TIPCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `TIPNOME` varchar(50) DEFAULT NULL COMMENT 'Tipo do centro de custo(receita ou despesa)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_centro_custo`
--

INSERT INTO `tipo_centro_custo` (`TIPCODIGO`, `TIPNOME`) VALUES
(1, 'RECEITA'),
(2, 'DESPESA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_conta`
--

CREATE TABLE `tipo_conta` (
  `TIPCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `TIPNOME` varchar(50) DEFAULT NULL COMMENT 'Nome do tipo da conta(Caixa, Conta Corrente, Conta de Aplicação)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_conta`
--

INSERT INTO `tipo_conta` (`TIPCODIGO`, `TIPNOME`) VALUES
(1, 'CONTA CORRENTE'),
(2, 'CONTA DE APLICAÇÃO'),
(3, 'CAIXA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `DOCCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `DOCNOME` varchar(50) DEFAULT NULL COMMENT 'Nome do tipo de documento (Nota fiscal, recibo etc)',
  `DOCTIPO` tinyint(1) DEFAULT NULL COMMENT 'Tipo do documento pode ser Receita ou Despesa, sendo receita 1 e despesa 0.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_documento`
--

INSERT INTO `tipo_documento` (`DOCCODIGO`, `DOCNOME`, `DOCTIPO`) VALUES
(1, 'NOTA FISCAL', 0),
(2, 'NOTA DE SERVIÇO', 1),
(3, 'RECEIBO', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pessoa`
--

CREATE TABLE `tipo_pessoa` (
  `TIPCODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `TIPNOME` varchar(50) DEFAULT NULL COMMENT 'Nome para o tipo de pessoa(jurídica ou física)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_pessoa`
--

INSERT INTO `tipo_pessoa` (`TIPCODIGO`, `TIPNOME`) VALUES
(1, 'PESSOA FÍSICA'),
(2, 'PESSOA JURÍDICA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferencia`
--

CREATE TABLE `transferencia` (
  `TRACODIGO` int(11) NOT NULL COMMENT 'Geração automática do código',
  `TRAVALOR` double DEFAULT NULL COMMENT 'Valor que será transferido',
  `TRACODIGO_CONORI` int(11) DEFAULT NULL COMMENT 'Código da conta de origem',
  `TRACODIGO_CONDES` int(11) DEFAULT NULL COMMENT 'Código da conta de destino',
  `TRADATA` date DEFAULT NULL COMMENT 'Data da transferência',
  `TRANUMERO_DOCUMENTO` varchar(50) DEFAULT NULL COMMENT 'Número do documento(Quando tem transferência no extrato sempre tem um número)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `transferencia`
--

INSERT INTO `transferencia` (`TRACODIGO`, `TRAVALOR`, `TRACODIGO_CONORI`, `TRACODIGO_CONDES`, `TRADATA`, `TRANUMERO_DOCUMENTO`) VALUES
(1, 5, 3, 1, '2022-04-29', '4585'),
(2, 100, 1, 3, '2022-04-28', '8575'),
(3, 1000, 4, 1, '2022-04-30', '8500'),
(4, 458, 4, 1, '2022-10-15', '459');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
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
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`USUCODIGO`, `USUNOME`, `USULOGIN`, `USUSENHA`, `USUSTATUS`, `CODIGONIV`) VALUES
(1, 'GABRIELLE', 'GABRIELLE', '123', 1, 1),
(2, 'RAFAEL', 'RAFAEL', '1234', 1, 2),
(3, 'MARIA', 'MARIA', '12345', 0, 1),
(4, 'ricardo', 'zemane', '123456', 1, 2),
(11, 'bastião', 'Sebastião', '123456', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baixa`
--
ALTER TABLE `baixa`
  ADD PRIMARY KEY (`BAICODIGO`),
  ADD KEY `CODIGOLAN` (`CODIGOLAN`),
  ADD KEY `CODIGOFOR` (`CODIGOFOR`),
  ADD KEY `CODIGOCAD` (`CODIGOCON`),
  ADD KEY `CODIGOUSU` (`CODIGOUSU`);

--
-- Indexes for table `centro_custo`
--
ALTER TABLE `centro_custo`
  ADD PRIMARY KEY (`CENCODIGO`),
  ADD KEY `CODIGOTIP` (`CODIGOTIP`);

--
-- Indexes for table `contas`
--
ALTER TABLE `contas`
  ADD PRIMARY KEY (`CONCODIGO`),
  ADD KEY `CODTIP` (`CODIGOTIP`);

--
-- Indexes for table `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`FORCODIGO`);

--
-- Indexes for table `lancamento`
--
ALTER TABLE `lancamento`
  ADD PRIMARY KEY (`LANCODIGO`),
  ADD KEY `CODIGODOC` (`CODIGODOC`),
  ADD KEY `CODIGOPES` (`CODIGOPES`),
  ADD KEY `CODIGOCEN` (`CODIGOCEN`),
  ADD KEY `CODIGOUSU` (`CODIGOUSU`);

--
-- Indexes for table `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
  ADD PRIMARY KEY (`NIVCODIGO`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`PESCODIGO`),
  ADD UNIQUE KEY `PESCPF` (`PESCPF`),
  ADD UNIQUE KEY `PESCNPJ` (`PESCNPJ`),
  ADD KEY `CODIGOTIP` (`CODIGOTIP`);

--
-- Indexes for table `tipo_centro_custo`
--
ALTER TABLE `tipo_centro_custo`
  ADD PRIMARY KEY (`TIPCODIGO`);

--
-- Indexes for table `tipo_conta`
--
ALTER TABLE `tipo_conta`
  ADD PRIMARY KEY (`TIPCODIGO`);

--
-- Indexes for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`DOCCODIGO`);

--
-- Indexes for table `tipo_pessoa`
--
ALTER TABLE `tipo_pessoa`
  ADD PRIMARY KEY (`TIPCODIGO`);

--
-- Indexes for table `transferencia`
--
ALTER TABLE `transferencia`
  ADD PRIMARY KEY (`TRACODIGO`),
  ADD KEY `TRACODIGO_CONORI` (`TRACODIGO_CONORI`),
  ADD KEY `TRACODIGO_CONDES` (`TRACODIGO_CONDES`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`USUCODIGO`),
  ADD UNIQUE KEY `USULOGIN` (`USULOGIN`),
  ADD KEY `CODIGONIV` (`CODIGONIV`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baixa`
--
ALTER TABLE `baixa`
  MODIFY `BAICODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `centro_custo`
--
ALTER TABLE `centro_custo`
  MODIFY `CENCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `contas`
--
ALTER TABLE `contas`
  MODIFY `CONCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `FORCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `lancamento`
--
ALTER TABLE `lancamento`
  MODIFY `LANCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
  MODIFY `NIVCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática de código', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `PESCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tipo_centro_custo`
--
ALTER TABLE `tipo_centro_custo`
  MODIFY `TIPCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tipo_conta`
--
ALTER TABLE `tipo_conta`
  MODIFY `TIPCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `DOCCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tipo_pessoa`
--
ALTER TABLE `tipo_pessoa`
  MODIFY `TIPCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `TRACODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `USUCODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Geração automática do código', AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `baixa`
--
ALTER TABLE `baixa`
  ADD CONSTRAINT `baixa_ibfk_1` FOREIGN KEY (`CODIGOLAN`) REFERENCES `lancamento` (`LANCODIGO`),
  ADD CONSTRAINT `baixa_ibfk_2` FOREIGN KEY (`CODIGOFOR`) REFERENCES `forma_pagamento` (`FORCODIGO`),
  ADD CONSTRAINT `baixa_ibfk_3` FOREIGN KEY (`CODIGOCON`) REFERENCES `contas` (`CONCODIGO`),
  ADD CONSTRAINT `baixa_ibfk_4` FOREIGN KEY (`CODIGOUSU`) REFERENCES `usuario` (`USUCODIGO`);

--
-- Limitadores para a tabela `centro_custo`
--
ALTER TABLE `centro_custo`
  ADD CONSTRAINT `centro_custo_ibfk_1` FOREIGN KEY (`CODIGOTIP`) REFERENCES `tipo_centro_custo` (`TIPCODIGO`);

--
-- Limitadores para a tabela `contas`
--
ALTER TABLE `contas`
  ADD CONSTRAINT `contas_ibfk_1` FOREIGN KEY (`CODIGOTIP`) REFERENCES `tipo_conta` (`TIPCODIGO`);

--
-- Limitadores para a tabela `lancamento`
--
ALTER TABLE `lancamento`
  ADD CONSTRAINT `lancamento_ibfk_1` FOREIGN KEY (`CODIGODOC`) REFERENCES `tipo_documento` (`DOCCODIGO`),
  ADD CONSTRAINT `lancamento_ibfk_2` FOREIGN KEY (`CODIGOPES`) REFERENCES `pessoa` (`PESCODIGO`),
  ADD CONSTRAINT `lancamento_ibfk_3` FOREIGN KEY (`CODIGOCEN`) REFERENCES `centro_custo` (`CENCODIGO`),
  ADD CONSTRAINT `lancamento_ibfk_4` FOREIGN KEY (`CODIGOUSU`) REFERENCES `usuario` (`USUCODIGO`),
  ADD CONSTRAINT `lancamento_ibfk_5` FOREIGN KEY (`CODIGOUSU`) REFERENCES `usuario` (`USUCODIGO`);

--
-- Limitadores para a tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`CODIGOTIP`) REFERENCES `tipo_pessoa` (`TIPCODIGO`);

--
-- Limitadores para a tabela `transferencia`
--
ALTER TABLE `transferencia`
  ADD CONSTRAINT `transferencia_ibfk_2` FOREIGN KEY (`TRACODIGO_CONORI`) REFERENCES `contas` (`CONCODIGO`),
  ADD CONSTRAINT `transferencia_ibfk_3` FOREIGN KEY (`TRACODIGO_CONDES`) REFERENCES `contas` (`CONCODIGO`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`CODIGONIV`) REFERENCES `nivel_acesso` (`NIVCODIGO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
