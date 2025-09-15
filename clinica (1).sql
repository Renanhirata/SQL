-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/09/2025 às 18:48
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
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id`, `id_paciente`, `id_medico`, `data_hora`, `observacoes`) VALUES
(1, 1, 2, '2025-09-19 14:00:00', 'Consulta de Rotina'),
(2, 3, 8, '2025-09-21 11:00:00', 'Consulta dermatológica - alergia na pele'),
(3, 4, 5, '2025-09-22 16:15:00', 'Acompanhamento de tratamento de hipertensão'),
(4, 5, 7, '2025-09-23 08:45:00', 'Consulta pediátrica - acompanhamento mensal'),
(5, 6, 10, '2025-09-24 10:00:00', 'Exame de rotina pré-operatório');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `crm` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`id`, `nome`, `especialidade`, `telefone`, `crm`) VALUES
(1, 'Dr. Carlos Souza', 'Cardiologista', '5555-6666', 'CRM12345'),
(2, 'Dra.Ana Lima', 'Pediatra', '7878-0000', 'CRM67890'),
(3, 'Dr.Marcos Alves', 'Dermatologista', '8889-8927', 'CRM11223'),
(4, 'Dra.Luisa Costa', 'Ginecologista', '9998-9090', 'CRM44556'),
(5, 'Dr.Gustavo Crespilho', 'Cardiologista', '9923-2025', 'CRM98755'),
(6, 'Dra.Giovanna Iura', 'Oftalmologista', '9983-2024', 'CRM33124'),
(7, 'Dra.Mariana Iura', 'Pediatra', '9732-0873', 'CRM54352'),
(8, 'Dr.Lucas Cintra', 'Dermatologista', '9833-7653', 'CRM85731'),
(9, 'Dr.Kauã Santos', 'Ortopedista', '9854-1678', 'CRM54367'),
(10, 'Dra.Julia Rodrigues', 'Urologista', '9873-2124', 'CRM63281');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id`, `nome`, `data_nascimento`, `telefone`, `endereco`, `cep`, `email`) VALUES
(1, 'João Souza', '1990-05-12', '9998-2020', 'Rua das Monções, 34', '12345-250', 'joao@gmail.com'),
(2, 'Maria Silva', '1985-03-22', '9987-1122', 'Avenida Brasil, 120', '12345-300', 'maria@gmail.com'),
(3, 'Carlos Pereira', '1978-07-10', '9976-3344', 'Rua das Flores, 56', '12345-350', 'carlos@gmail.com'),
(4, 'Ana Costa', '1992-11-05', '9965-5566', 'Praça da Sé, 78', '12345-400', 'ana@gmail.com'),
(5, 'Felipe Santos', '1988-02-18', '9954-7788', 'Rua do Sol, 90', '12345-450', 'felipe@gmail.com'),
(6, 'Luiza Ramos', '1991-09-30', '9943-9900', 'Avenida Paulista, 101', '12345-500', 'luiza@gmail.com'),
(7, 'Ricardo Lima', '1980-06-25', '9932-1122', 'Rua Nova, 12', '12345-550', 'ricardo@gmail.com'),
(8, 'Patricia Alves', '1987-12-14', '9921-3344', 'Rua das Acácias, 23', '12345-600', 'patricia@gmail.com'),
(9, 'Gustavo Rocha', '1993-08-09', '9910-5566', 'Avenida Central, 45', '12345-650', 'gustavo@gmail.com'),
(10, 'Carolina Martins', '1989-01-02', '9909-7788', 'Rua Primavera, 67', '12345-700', 'carolina@gmail.com'),
(11, 'Rafael Oliveira', '1995-04-20', '9898-2233', 'Rua dos Lírios, 89', '12345-750', 'rafael@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
