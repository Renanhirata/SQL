-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/09/2025 às 18:50
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
-- Banco de dados: `campanhaas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `campanhass`
--

CREATE TABLE `campanhass` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `orcamento` decimal(10,2) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_midia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `campanhass`
--

INSERT INTO `campanhass` (`id`, `nome`, `data_inicio`, `data_fim`, `orcamento`, `id_cliente`, `id_midia`) VALUES
(1, 'Papelaria FastPaper', '2020-09-10', '2020-09-18', 4000.00, 1, 1),
(2, 'PapelaoReciclavel', '2025-05-01', '2025-05-12', 2000.00, 2, 2),
(3, 'PrivacyJUANTOURO', '2025-02-01', '2025-02-15', 19000.00, 3, 3),
(4, 'BibliotecaSilence', '2025-11-24', '2025-11-30', 6000.00, 4, 4),
(5, 'FotografiaComFichel', '2025-07-22', '2025-08-12', 12000.00, 5, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `segmento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`, `segmento`) VALUES
(1, 'Gustavo Crespilho', 'gustavocrespilho@gmail.com', 'papelaria'),
(2, 'Kauã Santos', 'kauasantos@gmail.com', 'papelao'),
(3, 'Juan Neves', 'juanneves@gmail.com', 'privacy'),
(4, 'Thiago Souza', 'thiagosouza@gmail.com', 'biblioteca'),
(5, 'Maria Gabriela', 'mariagabriela@gmail.com', 'fotografo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `midia`
--

CREATE TABLE `midia` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `custo_unitario` decimal(10,2) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `midia`
--

INSERT INTO `midia` (`id`, `nome`, `tipo`, `custo_unitario`, `descricao`) VALUES
(1, 'Televisão', 'Vídeo', 1200.00, 'Entrega daqui 2 semanas'),
(2, 'Facebook', 'Curta-metragem', 2600.00, 'Mostrar os benefícios dos produtos'),
(3, 'Instagram', 'Vídeo curto', 500.00, 'Um vídeo mais extrovertido e dinâmico'),
(4, 'Outdoor', 'Imagem do local', 7000.00, 'Uma frase trazendo questionamento'),
(5, 'Pinterest', 'Redes Sociais', 10000.00, 'Em todas as redes sociais');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `campanhass`
--
ALTER TABLE `campanhass`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_midia` (`id_midia`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `midia`
--
ALTER TABLE `midia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `campanhass`
--
ALTER TABLE `campanhass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `midia`
--
ALTER TABLE `midia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `campanhass`
--
ALTER TABLE `campanhass`
  ADD CONSTRAINT `campanhass_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `campanhass_ibfk_2` FOREIGN KEY (`id_midia`) REFERENCES `midia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
