-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/09/2025 às 14:09
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `marketing_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `campanha`
--

CREATE TABLE `campanha` (
  `id_campanha` int(11) NOT NULL,
  `nome_campanha` varchar(50) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `orcamento` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `campanha`
--

INSERT INTO `campanha` (`id_campanha`, `nome_campanha`, `data_inicio`, `data_fim`, `orcamento`) VALUES
(1, 'Black Friday', '2025-11-01', '2025-11-30', 50000.00),
(2, 'Natal', '2025-12-01', '2025-12-25', 60000.00),
(3, 'Verão', '2025-12-15', '2026-01-15', 40000.00),
(4, 'Dia das Mães', '2025-05-01', '2025-05-10', 30000.00),
(5, 'Dia dos Pais', '2025-08-01', '2025-08-10', 25000.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `campanha_cliente`
--

CREATE TABLE `campanha_cliente` (
  `id_campanha` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `campanha_cliente`
--

INSERT INTO `campanha_cliente` (`id_campanha`, `id_cliente`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `campanha_midia`
--

CREATE TABLE `campanha_midia` (
  `id_campanha` int(11) NOT NULL,
  `id_midia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `campanha_midia`
--

INSERT INTO `campanha_midia` (`id_campanha`, `id_midia`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `segmento` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_cliente`, `email`, `segmento`) VALUES
(1, 'João Silva', 'joao@email.com', 'Tecnologia'),
(2, 'Maria Souza', 'maria@email.com', 'Moda'),
(3, 'Pedro Lima', 'pedro@email.com', 'Alimentação'),
(4, 'Ana Costa', 'ana@email.com', 'Saúde'),
(5, 'Lucas Rocha', 'lucas@email.com', 'Educação');

-- --------------------------------------------------------

--
-- Estrutura para tabela `midia`
--

CREATE TABLE `midia` (
  `id_midia` int(11) NOT NULL,
  `tipo_midia` varchar(50) NOT NULL,
  `custo_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `midia`
--

INSERT INTO `midia` (`id_midia`, `tipo_midia`, `custo_unitario`) VALUES
(1, 'TV', 1000.00),
(2, 'Facebook Ads', 200.00),
(3, 'Instagram Ads', 150.00),
(4, 'Google Ads', 300.00),
(5, 'Radio', 500.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `campanha`
--
ALTER TABLE `campanha`
  ADD PRIMARY KEY (`id_campanha`);

--
-- Índices de tabela `campanha_cliente`
--
ALTER TABLE `campanha_cliente`
  ADD PRIMARY KEY (`id_campanha`,`id_cliente`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `campanha_midia`
--
ALTER TABLE `campanha_midia`
  ADD PRIMARY KEY (`id_campanha`,`id_midia`),
  ADD KEY `id_midia` (`id_midia`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `midia`
--
ALTER TABLE `midia`
  ADD PRIMARY KEY (`id_midia`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `campanha`
--
ALTER TABLE `campanha`
  MODIFY `id_campanha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `midia`
--
ALTER TABLE `midia`
  MODIFY `id_midia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `campanha_cliente`
--
ALTER TABLE `campanha_cliente`
  ADD CONSTRAINT `campanha_cliente_ibfk_1` FOREIGN KEY (`id_campanha`) REFERENCES `campanha` (`id_campanha`),
  ADD CONSTRAINT `campanha_cliente_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Restrições para tabelas `campanha_midia`
--
ALTER TABLE `campanha_midia`
  ADD CONSTRAINT `campanha_midia_ibfk_1` FOREIGN KEY (`id_campanha`) REFERENCES `campanha` (`id_campanha`),
  ADD CONSTRAINT `campanha_midia_ibfk_2` FOREIGN KEY (`id_midia`) REFERENCES `midia` (`id_midia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
