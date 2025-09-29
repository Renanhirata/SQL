-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/09/2025 às 14:08
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
-- Banco de dados: `rh_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nome_departamento` varchar(50) NOT NULL,
  `localizacao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nome_departamento`, `localizacao`) VALUES
(1, 'TI', 'Bloco A'),
(2, 'RH', 'Bloco B'),
(3, 'Financeiro', 'Bloco C'),
(4, 'Marketing', 'Bloco D'),
(5, 'Logística', 'Bloco E');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_admissao` date NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `nome`, `cpf`, `data_admissao`, `cargo`, `id_departamento`) VALUES
(1, 'João Silva', '123.456.789-00', '2023-01-15', 'Analista', 1),
(2, 'Maria Souza', '987.654.321-00', '2022-06-01', 'Coordenadora', 2),
(3, 'Pedro Lima', '111.222.333-44', '2021-09-20', 'Assistente', 3),
(4, 'Ana Costa', '555.666.777-88', '2020-03-12', 'Gerente', 4),
(5, 'Lucas Rocha', '999.888.777-66', '2024-02-10', 'Analista', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `participacao_treinamento`
--

CREATE TABLE `participacao_treinamento` (
  `id_funcionario` int(11) NOT NULL,
  `id_treinamento` int(11) NOT NULL,
  `status_nota` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `participacao_treinamento`
--

INSERT INTO `participacao_treinamento` (`id_funcionario`, `id_treinamento`, `status_nota`) VALUES
(1, 1, 'Aprovado'),
(1, 2, 'Aprovado'),
(2, 3, 'Aprovado'),
(3, 1, 'Reprovado'),
(4, 4, 'Aprovado'),
(5, 5, 'Aprovado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `treinamento`
--

CREATE TABLE `treinamento` (
  `id_treinamento` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `data_treinamento` date NOT NULL,
  `carga_horaria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `treinamento`
--

INSERT INTO `treinamento` (`id_treinamento`, `titulo`, `data_treinamento`, `carga_horaria`) VALUES
(1, 'Excel Avançado', '2025-10-05', 8),
(2, 'Segurança do Trabalho', '2025-11-10', 4),
(3, 'Liderança', '2025-09-30', 6),
(4, 'Comunicação Eficaz', '2025-12-01', 5),
(5, 'Gestão de Projetos', '2025-11-15', 10);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Índices de tabela `participacao_treinamento`
--
ALTER TABLE `participacao_treinamento`
  ADD PRIMARY KEY (`id_funcionario`,`id_treinamento`),
  ADD KEY `id_treinamento` (`id_treinamento`);

--
-- Índices de tabela `treinamento`
--
ALTER TABLE `treinamento`
  ADD PRIMARY KEY (`id_treinamento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `treinamento`
--
ALTER TABLE `treinamento`
  MODIFY `id_treinamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);

--
-- Restrições para tabelas `participacao_treinamento`
--
ALTER TABLE `participacao_treinamento`
  ADD CONSTRAINT `participacao_treinamento_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  ADD CONSTRAINT `participacao_treinamento_ibfk_2` FOREIGN KEY (`id_treinamento`) REFERENCES `treinamento` (`id_treinamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
