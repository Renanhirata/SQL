-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/09/2025 às 15:23
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
-- Banco de dados: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(12) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `cep` varchar(14) NOT NULL,
  `datacadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`, `senha`, `cpf`, `endereco`, `cidade`, `estado`, `cep`, `datacadastro`) VALUES
(1, 'João Silva', 'joao@gmail.com', '123456', '111.111.111-11', 'Rua A, 100', 'São Paulo', 'SP', '01000-000', '0000-00-00 00:00:00'),
(2, 'Maria Souza', 'maria@gmail.com', 'senha123', '222.222.222-22', 'Av. B, 200', 'Rio de Janeiro', 'RJ', '20000-000', '0000-00-00 00:00:00'),
(3, 'Pedro Santos', 'pedro@gmail.com', 'abc12345', '333.333.333-33', 'Rua C, 300', 'Belo Horizonte', 'MG', '30000-000', '0000-00-00 00:00:00'),
(4, 'Ana Oliveira', 'ana@gmail.com', 'ana2024', '444.444.444-44', 'Rua D, 400', 'Curitiba', 'PR', '40000-000', '0000-00-00 00:00:00'),
(5, 'Lucas Lima', 'lucas@gmail.com', 'lucaspass', '555.555.555-55', 'Av. E, 500', 'Porto Alegre', 'RS', '90000-000', '0000-00-00 00:00:00'),
(6, 'Fernanda Alves', 'fernanda@gmail.com', 'f123456', '666.666.666-66', 'Rua F, 600', 'Florianópolis', 'SC', '88000-000', '0000-00-00 00:00:00'),
(7, 'Carlos Mendes', 'carlos@gmail.com', 'carlospw', '777.777.777-77', 'Rua G, 700', 'Salvador', 'BA', '40000-001', '0000-00-00 00:00:00'),
(8, 'Juliana Costa', 'juliana@gmail.com', 'ju2025', '888.888.888-88', 'Rua H, 800', 'Fortaleza', 'CE', '60000-000', '0000-00-00 00:00:00'),
(9, 'Rafael Rocha', 'rafael@gmail.com', 'rafa123', '999.999.999-99', 'Av. I, 900', 'Manaus', 'AM', '69000-000', '0000-00-00 00:00:00'),
(10, 'Beatriz Martins', 'beatriz@gmail.com', 'bia2025', '000.000.000-00', 'Rua J, 1000', 'Brasília', 'DF', '70000-000', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itenspedido`
--

CREATE TABLE `itenspedido` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `precounitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itenspedido`
--

INSERT INTO `itenspedido` (`id`, `id_pedido`, `id_produto`, `quantidade`, `precounitario`) VALUES
(1, 1, 1, 1, 3500.00),
(2, 1, 3, 1, 150.00),
(3, 2, 2, 1, 5000.00),
(4, 3, 3, 2, 250.00),
(5, 3, 4, 1, 150.00),
(6, 4, 7, 1, 350.00),
(7, 4, 4, 1, 150.00),
(8, 5, 5, 2, 1200.00),
(9, 5, 6, 1, 900.00),
(10, 6, 7, 1, 350.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `datapedido` datetime NOT NULL,
  `status` varchar(30) NOT NULL,
  `valortotal` decimal(10,2) NOT NULL,
  `enderecoentrega` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id`, `id_cliente`, `datapedido`, `status`, `valortotal`, `enderecoentrega`) VALUES
(1, 1, '0000-00-00 00:00:00', 'Concluído', 3650.00, 'Rua A, 100'),
(2, 2, '0000-00-00 00:00:00', 'Pendente', 5000.00, 'Av. B, 200'),
(3, 3, '0000-00-00 00:00:00', 'Concluído', 2750.00, 'Rua C, 300'),
(4, 4, '0000-00-00 00:00:00', 'Em Andamento', 1350.00, 'Rua D, 400'),
(5, 5, '0000-00-00 00:00:00', 'Concluído', 4100.00, 'Av. E, 500'),
(6, 6, '0000-00-00 00:00:00', 'Pendente', 350.00, 'Rua F, 600'),
(7, 7, '0000-00-00 00:00:00', 'Concluído', 2500.00, 'Rua G, 700'),
(8, 8, '0000-00-00 00:00:00', 'Em Andamento', 1500.00, 'Rua H, 800'),
(9, 9, '0000-00-00 00:00:00', 'Pendente', 400.00, 'Av. I, 900'),
(10, 10, '0000-00-00 00:00:00', 'Concluído', 3100.00, 'Rua J, 1000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `estoque` int(11) NOT NULL,
  `datacriacao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `descricao`, `preco`, `sku`, `estoque`, `datacriacao`) VALUES
(1, 'Notebook Dell', 'Notebook i5 8GB RAM SSD 256GB', 3500.00, 'SKU001', 10, '0000-00-00 00:00:00'),
(2, 'Smartphone Samsung', 'Galaxy S22 Ultra 256GB', 5000.00, 'SKU002', 15, '0000-00-00 00:00:00'),
(3, 'Teclado Mecânico', 'Teclado mecânico gamer RGB', 250.00, 'SKU003', 30, '0000-00-00 00:00:00'),
(4, 'Mouse Gamer', 'Mouse óptico 16000 DPI', 150.00, 'SKU004', 40, '0000-00-00 00:00:00'),
(5, 'Monitor LG', 'Monitor 27 polegadas 144Hz', 1200.00, 'SKU005', 20, '0000-00-00 00:00:00'),
(6, 'Cadeira Gamer', 'Cadeira ergonômica reclinável', 900.00, 'SKU006', 25, '0000-00-00 00:00:00'),
(7, 'Headset HyperX', 'Headset gamer com microfone', 350.00, 'SKU007', 35, '0000-00-00 00:00:00'),
(8, 'Impressora HP', 'Impressora multifuncional Wi-Fi', 700.00, 'SKU008', 18, '0000-00-00 00:00:00'),
(9, 'HD Externo 1TB', 'HD portátil USB 3.0', 400.00, 'SKU009', 22, '0000-00-00 00:00:00'),
(10, 'Placa de Vídeo RTX 3060', 'NVIDIA GeForce RTX 3060 12GB', 2500.00, 'SKU010', 12, '0000-00-00 00:00:00'),
(11, 'Notebook Dell', 'Notebook i5 8GB RAM SSD 256GB', 3500.00, 'SKU001', 10, '0000-00-00 00:00:00'),
(12, 'Smartphone Samsung', 'Galaxy S22 Ultra 256GB', 5000.00, 'SKU002', 15, '0000-00-00 00:00:00'),
(13, 'Teclado Mecânico', 'Teclado mecânico gamer RGB', 250.00, 'SKU003', 30, '0000-00-00 00:00:00'),
(14, 'Mouse Gamer', 'Mouse óptico 16000 DPI', 150.00, 'SKU004', 40, '0000-00-00 00:00:00'),
(15, 'Monitor LG', 'Monitor 27 polegadas 144Hz', 1200.00, 'SKU005', 20, '0000-00-00 00:00:00'),
(16, 'Cadeira Gamer', 'Cadeira ergonômica reclinável', 900.00, 'SKU006', 25, '0000-00-00 00:00:00'),
(17, 'Headset HyperX', 'Headset gamer com microfone', 350.00, 'SKU007', 35, '0000-00-00 00:00:00'),
(18, 'Impressora HP', 'Impressora multifuncional Wi-Fi', 700.00, 'SKU008', 18, '0000-00-00 00:00:00'),
(19, 'HD Externo 1TB', 'HD portátil USB 3.0', 400.00, 'SKU009', 22, '0000-00-00 00:00:00'),
(20, 'Placa de Vídeo RTX 3060', 'NVIDIA GeForce RTX 3060 12GB', 2500.00, 'SKU010', 12, '0000-00-00 00:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD CONSTRAINT `itenspedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `itenspedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
