/*
============================================================
  Arquivo: 02_insercoes_basicas.sql
  Autor(es):
   
Leonardo Giannoccaro Nantes
Pietro di Luca Monte Souza Balbino
Matheus Gonçalves Domingues Geraldi
Guilherme Liyuji Aoki Uehara

  Trabalho: Locação de Veículos
  Curso/Turma: DS 213
  SGBD: MySQL Versão: 8.0
  Objetivo: Inserção de dados básicos e coerentes
            para popular o sistema.
  Execução esperada: rodar após o 01_modelo_fisico.sql
==========================================================
*/

USE locadora;

-- ---
-- Bloco 1: Tabelas Auxiliares
-- ---

INSERT INTO cargo (id_cargo, nome_cargo, descricao_permissoes) VALUES
(1, 'Atendente', 'Atendimento ao cliente e locação.'),
(2, 'Gerente', 'Gestão total do sistema.'),
(3, 'Mecânico', 'Gestão de frota e manutenção.');

INSERT INTO status_veiculo (id_status_veiculo, descricao_status) VALUES
(1, 'Disponível'), (2, 'Alugado'), (3, 'Em Manutenção');

INSERT INTO combustivel (id_combustivel, tipo_combustivel) VALUES
(1, 'Gasolina'), (2, 'Etanol'), (3, 'Flex'), (4, 'Diesel'), (5, 'Elétrico');

INSERT INTO forma_pagamento (id_forma_pagamento, descricao_pagamento) VALUES
(1, 'Cartão de Crédito'), (2, 'Cartão de Débito'), (3, 'PIX'), (4, 'Dinheiro');

INSERT INTO categoria_veiculo (id_categoria_veiculo, nome_categoria, valor_diaria) VALUES
(1, 'Compacto', 120.00), (2, 'Sedan Médio', 180.50), (3, 'SUV', 250.00), (4, 'Picape', 300.00), (5, 'Elétrico', 350.75);

INSERT INTO opcional (id_opcional, descricao, valor_diaria) VALUES
(1, 'Cadeira de Bebê', 25.00), (2, 'GPS Integrado', 15.00), (3, 'Bagageiro de Teto', 40.00), (4, 'Seguro Adicional Vidros', 10.00);

-- ---
-- Bloco 2: Marcas e Modelos (Variados)
-- ---

INSERT INTO marca (id_marca, nome_marca) VALUES
(1, 'Renault'), (2, 'Volkswagen'), (3, 'BYD'), (4, 'FIAT'), (5, 'BMW'),
(6, 'Chevrolet'), (7, 'Hyundai'), (8, 'Toyota'), (9, 'Honda'), (10, 'Nissan');

INSERT INTO modelo (id_modelo, nome_modelo, id_marca, id_categoria_veiculo) VALUES
-- Modelos Originais
(1, 'Kwid', 1, 1), (2, 'Virtus', 2, 2), (3, 'X3', 5, 3), (4, 'Dolphin', 3, 5), (5, 'Toro', 4, 4),
(6, 'Uno', 4, 1), (7, 'Seal', 3, 5), (8, 'Captur', 1, 3), (9, 'Saveiro', 2, 4), (10, 'Pulse', 4, 2),
-- Modelos Extras
(11, 'Onix', 6, 1),      -- GM, Compacto
(12, 'Tracker', 6, 3),   -- GM, SUV
(13, 'HB20', 7, 1),      -- Hyundai, Compacto
(14, 'Creta', 7, 3),     -- Hyundai, SUV
(15, 'Corolla', 8, 2),   -- Toyota, Sedan
(16, 'Civic', 9, 2),     -- Honda, Sedan
(17, 'HR-V', 9, 3),      -- Honda, SUV
(18, 'Kicks', 10, 3),    -- Nissan, SUV
(19, 'S10', 6, 4),       -- GM, Picape
(20, 'Versa', 10, 2);    -- Nissan, Sedan

-- ---
-- Bloco 3: Usuários, Seguros e Endereços
-- ---

INSERT INTO usuario (id_usuario, email, senha, perfil) VALUES
(1, 'pietro.atendente@locadora.com', 'hash123', 'Funcionario'),
(2, 'leonardo.gerente@locadora.com', 'hash456', 'Funcionario'),
(3, 'claudete.mec@locadora.com', 'hash789', 'Funcionario'),
(4, 'motta.atendente@locadora.com', 'hash111', 'Funcionario'),
(5, 'ricardo.gerente@locadora.com', 'hash222', 'Funcionario');

-- Seguros (40 apólices para os 40 carros)
INSERT INTO seguro (id_seguro, companhia, vencimento) VALUES
(1, 'Porto Seguro', '2026-10-01'), (2, 'Azul Seguros', '2026-10-15'), (3, 'Allianz', '2026-11-30'), (4, 'Tokio Marine', '2027-01-10'), (5, 'Bradesco', '2026-09-01'),
(6, 'Porto Seguro', '2027-02-01'), (7, 'Allianz', '2027-02-10'), (8, 'Azul Seguros', '2027-03-05'), (9, 'Tokio Marine', '2027-04-15'), (10, 'Bradesco', '2027-05-20'),
(11, 'Mapfre', '2027-06-01'), (12, 'Liberty', '2027-06-15'), (13, 'HDI', '2027-07-01'), (14, 'Sompo', '2027-07-15'), (15, 'Zurich', '2027-08-01'),
(16, 'Porto Seguro', '2027-08-15'), (17, 'Azul Seguros', '2027-09-01'), (18, 'Allianz', '2027-09-15'), (19, 'Tokio Marine', '2027-10-01'), (20, 'Bradesco', '2027-10-15'),
(21, 'Mapfre', '2027-11-01'), (22, 'Liberty', '2027-11-15'), (23, 'HDI', '2027-12-01'), (24, 'Sompo', '2027-12-15'), (25, 'Zurich', '2028-01-01'),
(26, 'Porto Seguro', '2028-01-15'), (27, 'Azul Seguros', '2028-02-01'), (28, 'Allianz', '2028-02-15'), (29, 'Tokio Marine', '2028-03-01'), (30, 'Bradesco', '2028-03-15'),
(31, 'Mapfre', '2028-04-01'), (32, 'Liberty', '2028-04-15'), (33, 'HDI', '2028-05-01'), (34, 'Sompo', '2028-05-15'), (35, 'Zurich', '2028-06-01'),
(36, 'Mapfre', '2028-06-15'), (37, 'Liberty', '2028-07-01'), (38, 'HDI', '2028-07-15'), (39, 'Sompo', '2028-08-01'), (40, 'Zurich', '2028-08-15');

INSERT INTO endereco (id_endereco, logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
(1, 'Rua A', '1', NULL, 'Centro', 'São Paulo', 'SP', '01000-000'), (2, 'Rua B', '2', NULL, 'Bairro B', 'São Paulo', 'SP', '02000-000'), (3, 'Rua C', '3', NULL, 'Bairro C', 'São Paulo', 'SP', '03000-000'), (4, 'Rua D', '4', NULL, 'Bairro D', 'São Paulo', 'SP', '04000-000'), (5, 'Rua E', '5', NULL, 'Bairro E', 'São Paulo', 'SP', '05000-000'),
(6, 'Av Func 1', '10', NULL, 'Jundiaí', 'Jundiaí', 'SP', '13200-000'), (7, 'Av Func 2', '20', NULL, 'Jundiaí', 'Jundiaí', 'SP', '13200-000'), (8, 'Av Func 3', '30', NULL, 'Jundiaí', 'Jundiaí', 'SP', '13200-000'), (9, 'Av Func 4', '40', NULL, 'Jundiaí', 'Jundiaí', 'SP', '13200-000'), (10, 'Av Func 5', '50', NULL, 'Jundiaí', 'Jundiaí', 'SP', '13200-000');

-- ---
-- Bloco 4: Pessoas e Frota
-- ---

INSERT INTO cnh (id_cnh, numero_registro, categoria, data_validade) VALUES
(1, '11111111111', 'B', '2028-01-01'), (2, '22222222222', 'B', '2027-01-01'), (3, '33333333333', 'D', '2026-01-01'), (4, '44444444444', 'AB', '2029-01-01'), (5, '55555555555', 'B', '2025-12-01');

INSERT INTO cliente (id_cliente, nome_completo, cpf, data_nascimento, telefone, email, tempo_habilitacao_anos, id_endereco, id_cnh) VALUES
(1, 'Rodrigo Nantes', '111.111.111-11', '1983-04-14', '11900001111', 'cli1@teste.com', 20, 1, 1),
(2, 'Matheus Geraldi', '222.222.222-22', '2000-11-20', '11900002222', 'cli2@teste.com', 2, 2, 2),
(3, 'Fabrizio San Felipe', '333.333.333-33', '1998-11-26', '11900003333', 'cli3@teste.com', 10, 3, 3),
(4, 'Japones Liuyji', '444.444.444-44', '1946-06-17', '11900004444', 'cli4@teste.com', 40, 4, 4),
(5, 'Yuri de Argolo', '555.555.555-55', '2000-01-01', '11900005555', 'cli5@teste.com', 7, 5, 5);

INSERT INTO funcionario (id_usuario, nome, cpf, rg, data_nascimento, id_cargo, id_endereco) VALUES
(1, 'Pietro di Luca', '123.123.123-01', '1234567', '1995-05-10', 1, 6), (2, 'Leonardo Nantes', '123.123.123-02', '2345678', '1990-02-20', 2, 7), (3, 'Claudete', '123.123.123-03', '3456789', '1985-07-15', 3, 8), (4, 'Leonardo Motta', '123.123.123-04', '4567890', '1998-03-05', 1, 9), (5, 'Ricardo Agostinho', '123.123.123-05', '5678901', '1988-12-25', 2, 10);

-- FROTA DE 40 VEÍCULOS
INSERT INTO veiculo (id_veiculo, placa, ano, cor, chassi, quilometragem, transmissao, data_compra, valor_compra, data_vencimento, tanque, tanque_fracao, valor_fracao, url_imagem, id_modelo, id_status_veiculo, id_combustivel, id_seguro) VALUES
-- 1-5 (Originais)
(1, 'RBC1A23', 2024, 'Branco', 'CHASSI001', 15000, 'Manual', '2024-01-01', 70000, '2025-01-01', 40, 1.0, 35.00, 'kwid.jpg', 1, 1, 3, 1),
(2, 'SCD2B34', 2023, 'Preto', 'CHASSI002', 5000, 'Auto', '2023-05-01', 110000, '2025-05-01', 52, 1.0, 44.00, 'virtus.jpg', 2, 1, 3, 2),
(3, 'TDE3C45', 2022, 'Azul', 'CHASSI003', 25000, 'Auto', '2022-07-01', 280000, '2025-07-01', 60, 1.0, 50.00, 'x3.jpg', 3, 1, 1, 3), -- BMW (Teto de preço)
(4, 'UFG4D56', 2021, 'Prata', 'CHASSI004', 40000, 'Auto', '2021-11-01', 150000, '2025-11-01', 45, 1.0, 0.00, 'dolphin.jpg', 4, 3, 5, 4),
(5, 'VHI5E67', 2023, 'Vermelho', 'CHASSI005', 10000, 'Auto', '2023-09-01', 180000, '2025-09-01', 60, 1.0, 65.00, 'toro.jpg', 5, 2, 4, 5),
-- 6-10 (Originais 2ª leva)
(6, 'ABC1D23', 2022, 'Cinza', 'CHASSI006', 22000, 'Manual', '2022-03-15', 65000, '2026-03-15', 47, 1.0, 40.00, 'uno.jpg', 6, 1, 3, 6),
(7, 'DEF4E56', 2024, 'Preto', 'CHASSI007', 2000, 'Auto', '2024-05-01', 280000, '2026-05-01', 50, 1.0, 0.00, 'seal.jpg', 7, 1, 5, 7),
(8, 'GHI7F89', 2023, 'Branco', 'CHASSI008', 12000, 'Auto', '2023-02-20', 130000, '2026-02-20', 50, 1.0, 42.00, 'captur.jpg', 8, 1, 3, 8),
(9, 'JKL0G12', 2022, 'Prata', 'CHASSI009', 35000, 'Manual', '2022-04-10', 90000, '2026-04-10', 55, 1.0, 47.00, 'saveiro.jpg', 9, 1, 3, 9),
(10, 'MNO3H45', 2023, 'Vermelho', 'CHASSI010', 18000, 'Auto', '2023-06-30', 105000, '2026-06-30', 47, 1.0, 40.00, 'pulse.jpg', 10, 1, 3, 10),
-- 11-35 (Leva 3)
(11, 'PQR1I23', 2024, 'Branco', 'CHASSI011', 5000, 'Manual', '2024-02-15', 85000, '2026-02-15', 44, 1.0, 38.00, 'onix.jpg', 11, 1, 3, 11),
(12, 'STU2J34', 2023, 'Prata', 'CHASSI012', 15000, 'Manual', '2023-08-10', 82000, '2026-08-10', 44, 1.0, 38.00, 'onix.jpg', 11, 1, 3, 12),
(13, 'VWX3K45', 2024, 'Vermelho', 'CHASSI013', 2000, 'Auto', '2024-06-01', 130000, '2026-06-01', 44, 1.0, 38.00, 'tracker.jpg', 12, 1, 3, 13),
(14, 'YZA4L56', 2022, 'Cinza', 'CHASSI014', 30000, 'Auto', '2022-11-20', 115000, '2025-11-20', 44, 1.0, 38.00, 'tracker.jpg', 12, 1, 3, 14),
(15, 'BCD5M67', 2024, 'Branco', 'CHASSI015', 8000, 'Manual', '2024-03-05', 88000, '2026-03-05', 50, 1.0, 42.50, 'hb20.jpg', 13, 1, 3, 15),
(16, 'EFG6N78', 2023, 'Preto', 'CHASSI016', 18000, 'Manual', '2023-09-12', 85000, '2026-09-12', 50, 1.0, 42.50, 'hb20.jpg', 13, 1, 3, 16),
(17, 'HIJ7O89', 2022, 'Azul', 'CHASSI017', 45000, 'Manual', '2022-05-18', 75000, '2025-05-18', 50, 1.0, 42.50, 'hb20.jpg', 13, 1, 3, 17),
(18, 'KLM8P90', 2024, 'Prata', 'CHASSI018', 3000, 'Auto', '2024-07-20', 140000, '2026-07-20', 50, 1.0, 42.50, 'creta.jpg', 14, 1, 3, 18),
(19, 'NOP9Q01', 2023, 'Branco', 'CHASSI019', 25000, 'Auto', '2023-01-10', 155000, '2026-01-10', 50, 1.0, 42.50, 'corolla.jpg', 15, 1, 3, 19),
(20, 'QRS0R12', 2022, 'Preto', 'CHASSI020', 42000, 'Auto', '2022-09-30', 145000, '2025-09-30', 50, 1.0, 42.50, 'corolla.jpg', 15, 1, 3, 20),
(21, 'TUV1S23', 2024, 'Cinza', 'CHASSI021', 12000, 'Auto', '2024-04-15', 160000, '2026-04-15', 47, 1.0, 40.25, 'civic.jpg', 16, 1, 1, 21),
(22, 'WXY2T34', 2021, 'Branco', 'CHASSI022', 55000, 'Auto', '2021-08-22', 130000, '2025-08-22', 47, 1.0, 40.25, 'civic.jpg', 16, 1, 1, 22),
(23, 'ZAB3U45', 2023, 'Vermelho', 'CHASSI023', 19000, 'Auto', '2023-10-05', 148000, '2026-10-05', 50, 1.0, 42.50, 'hrv.jpg', 17, 1, 3, 23),
(24, 'CDE4V56', 2024, 'Azul', 'CHASSI024', 6000, 'Auto', '2024-01-20', 135000, '2026-01-20', 41, 1.0, 35.75, 'kicks.jpg', 18, 1, 3, 24),
(25, 'FGH5W67', 2022, 'Prata', 'CHASSI025', 38000, 'Auto', '2022-12-01', 115000, '2025-12-01', 41, 1.0, 35.75, 'kicks.jpg', 18, 1, 3, 25),
(26, 'IJK6X78', 2021, 'Branco', 'CHASSI026', 60000, 'Auto', '2021-06-15', 220000, '2025-06-15', 76, 1.0, 62.00, 's10.jpg', 19, 1, 4, 26),
(27, 'LMN7Y89', 2023, 'Preto', 'CHASSI027', 28000, 'Auto', '2023-04-10', 110000, '2026-04-10', 41, 1.0, 35.75, 'versa.jpg', 20, 1, 3, 27),
(28, 'OPQ8Z90', 2024, 'Cinza', 'CHASSI028', 4000, 'Manual', '2024-08-01', 72000, '2026-08-01', 40, 1.0, 35.00, 'kwid.jpg', 1, 1, 3, 28),
(29, 'RST9A01', 2024, 'Branco', 'CHASSI029', 3500, 'Manual', '2024-09-10', 68000, '2026-09-10', 47, 1.0, 40.00, 'uno.jpg', 6, 1, 3, 29),
(30, 'UVW0B12', 2023, 'Vermelho', 'CHASSI030', 15000, 'Manual', '2023-11-05', 70000, '2026-11-05', 47, 1.0, 40.00, 'uno.jpg', 6, 1, 3, 30),
(31, 'XYZ1C23', 2022, 'Azul', 'CHASSI031', 41000, 'Auto', '2022-02-14', 105000, '2025-02-14', 52, 1.0, 44.00, 'virtus.jpg', 2, 1, 3, 31),
(32, 'ABC2D34', 2024, 'Prata', 'CHASSI032', 9000, 'Auto', '2024-03-22', 108000, '2026-03-22', 47, 1.0, 40.00, 'pulse.jpg', 10, 1, 3, 32),
(33, 'DEF3E45', 2023, 'Branco', 'CHASSI033', 21000, 'Auto', '2023-07-08', 102000, '2026-07-08', 47, 1.0, 40.00, 'pulse.jpg', 10, 1, 3, 33),
(34, 'GHI4F56', 2022, 'Preto', 'CHASSI034', 33000, 'Manual', '2022-10-30', 88000, '2025-10-30', 55, 1.0, 46.25, 'saveiro.jpg', 9, 1, 3, 34),
(35, 'JKL5G67', 2023, 'Branco', 'CHASSI035', 14000, 'Manual', '2023-05-15', 92000, '2026-05-15', 55, 1.0, 46.25, 'saveiro.jpg', 9, 1, 3, 35),
-- 36-40 (Leva 4 - Balanceada: Picape, Elétrico, SUV, Sedan, Compacto)
(36, 'ABC9D01', 2024, 'Prata', 'CHASSI036', 15000, 'Auto', '2024-01-20', 230000, '2026-01-20', 76, 1.0, 62.00, 's10.jpg', 19, 1, 4, 36), -- S10 (Picape)
(37, 'EFG0E12', 2023, 'Rosa', 'CHASSI037', 5000, 'Auto', '2023-11-15', 150000, '2026-11-15', 45, 1.0, 0.00, 'dolphin.jpg', 4, 1, 5, 37), -- Dolphin (Elétrico)
(38, 'HIJ1F23', 2024, 'Cinza', 'CHASSI038', 8000, 'Auto', '2024-03-10', 160000, '2026-03-10', 50, 1.0, 42.50, 'hrv.jpg', 17, 1, 3, 38), -- HR-V (SUV)
(39, 'KLM2G34', 2023, 'Preto', 'CHASSI039', 25000, 'Auto', '2023-05-05', 155000, '2026-05-05', 50, 1.0, 42.50, 'corolla.jpg', 15, 1, 3, 39), -- Corolla (Sedan)
(40, 'NOP3H45', 2024, 'Branco', 'CHASSI040', 10000, 'Manual', '2024-08-20', 85000, '2026-08-20', 44, 1.0, 38.00, 'onix.jpg', 11, 1, 3, 40); -- Onix (Compacto)

-- ---
-- Bloco 5: Operações
-- ---

INSERT INTO manutencao (data_entrada, data_saida, descricao_servico, custo, id_veiculo, status) VALUES
('2025-10-28', NULL, 'Revisão 40k', 850.00, 4, 'Em andamento'),
('2025-06-15', '2025-06-16', 'Pneus', 1200.00, 1, 'Concluída');

INSERT INTO locacao (id_locacao, data_retirada, data_devolucao_prevista, data_devolucao_real, valor_total_previsto, valor_final, quilometragem_retirada, quilometragem_devolucao, id_cliente, id_veiculo, id_funcionario, status, tanque_saida, tanque_chegada, caucao, devolucao) VALUES
(1, '2025-10-01 10:00:00', '2025-10-05 10:00:00', '2025-10-05 09:30:00', 480.00, 480.00, 10000, 10500, 1, 1, 1, 'Chegada', 40, 40, 1000.00, 'na devolução'),
(2, '2025-10-10 14:00:00', '2025-10-15 14:00:00', '2025-10-15 14:10:00', 902.50, 902.50, 4000, 4500, 2, 2, 4, 'Chegada', 52, 50, 1500.00, 'na devolução'),
(3, '2025-10-20 09:00:00', '2025-10-25 09:00:00', '2025-10-25 09:00:00', 1250.00, 1250.00, 20000, 21000, 3, 3, 1, 'Chegada', 60, 60, 2000.00, '5 dias'),
(4, '2025-10-30 15:00:00', '2025-11-10 15:00:00', NULL, 3000.00, NULL, 10000, NULL, 4, 5, 2, 'Locado', 60, NULL, 2500.00, '30 dias'),
(5, '2025-10-22 11:00:00', '2025-10-24 11:00:00', '2025-10-24 18:00:00', 240.00, 300.00, 10500, 11000, 5, 1, 4, 'Chegada', 40, 35, 1000.00, 'na devolução');

INSERT INTO pagamento (data_pagamento, valor, id_locacao, id_forma_pagamento) VALUES
('2025-10-01 10:05:00', 480.00, 1, 1),
('2025-10-10 14:05:00', 902.50, 2, 2),
('2025-10-20 09:05:00', 1250.00, 3, 3),
('2025-10-30 15:05:00', 1500.00, 4, 1),
('2025-10-24 18:05:00', 300.00, 5, 3);

INSERT INTO locacao_opcional (id_locacao, id_opcional, quantidade) VALUES (2, 1, 1);
INSERT INTO locacao_opcional (id_locacao, id_opcional, quantidade) VALUES (3, 2, 1);
INSERT INTO locacao_opcional (id_locacao, id_opcional, quantidade) VALUES (4, 1, 2), (4, 3, 1);
