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
-- Banco de dados: `estoque_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `nome_fornecedor` varchar(50) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id_fornecedor`, `nome_fornecedor`, `cnpj`, `telefone`, `cidade`) VALUES
(1, 'Fornecedor A', '12.345.678/0001-00', '1111-2222', 'São Paulo'),
(2, 'Fornecedor B', '98.765.432/0001-11', '3333-4444', 'Rio de Janeiro'),
(3, 'Fornecedor C', '11.222.333/0001-22', '5555-6666', 'Belo Horizonte'),
(4, 'Fornecedor D', '44.555.666/0001-33', '7777-8888', 'Curitiba'),
(5, 'Fornecedor E', '77.888.999/0001-44', '9999-0000', 'Porto Alegre');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_pedido`
--

INSERT INTO `item_pedido` (`id_pedido`, `id_produto`, `quantidade`, `preco_unitario`) VALUES
(1, 2, 10, 50.00),
(1, 3, 5, 120.00),
(2, 1, 1, 3500.00),
(3, 4, 2, 450.00),
(4, 5, 4, 800.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_compra`
--

CREATE TABLE `pedido_compra` (
  `id_pedido` int(11) NOT NULL,
  `data_pedido` date NOT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido_compra`
--

INSERT INTO `pedido_compra` (`id_pedido`, `data_pedido`, `valor_total`) VALUES
(1, '2025-09-20', 1000.00),
(2, '2025-09-21', 2500.00),
(3, '2025-09-22', 1800.00),
(4, '2025-09-23', 3200.00),
(5, '2025-09-24', 1500.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome_produto` varchar(50) NOT NULL,
  `categoria` varchar(30) DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  `quantidade_estoque` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome_produto`, `categoria`, `preco_unitario`, `quantidade_estoque`, `id_fornecedor`) VALUES
(1, 'Notebook', 'Eletrônicos', 3500.00, 10, 1),
(2, 'Mouse', 'Eletrônicos', 50.00, 100, 2),
(3, 'Teclado', 'Eletrônicos', 120.00, 50, 2),
(4, 'Cadeira', 'Móveis', 450.00, 20, 3),
(5, 'Mesa', 'Móveis', 800.00, 15, 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`id_pedido`,`id_produto`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `pedido_compra`
--
ALTER TABLE `pedido_compra`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `id_fornecedor` (`id_fornecedor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pedido_compra`
--
ALTER TABLE `pedido_compra`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido_compra` (`id_pedido`),
  ADD CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
