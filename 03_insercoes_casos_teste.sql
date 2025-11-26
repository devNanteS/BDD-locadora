/*
============================================================
  Arquivo: 03_insercoes_casos_teste.sql
  Autor(es):
    Leonardo Giannoccaro Nantes
    Pietro di Luca Monte Souza Balbino
    Matheus Gonçalves Domingues Geraldi
    Guilherme Liyuji Aoki Uehara

  Trabalho: Locação de Veículos
  Curso/Turma: DS 213
  SGBD: MySQL Versão: 8.0
  Objetivo: Inserção de dados específicos para
            exercitar regras de negócio e relatórios.
  Execução esperada: rodar após o 02_insercoes_basicas.sql
==========================================================
*/

/*
============================================================
  Arquivo: 03_insercoes_casos_teste.sql
  Objetivo: Casos de teste com novas colunas e imagens.
==========================================================
*/

USE locadora;

-- CENÁRIO A: Cliente com CNH vencida
INSERT INTO endereco (id_endereco, logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
(11, 'Rua Validade', '99', NULL, 'Doc', 'Recife', 'PE', '50000-000');
INSERT INTO cnh (id_cnh, numero_registro, categoria, data_validade) VALUES
(6, '99999999999', 'B', '2020-01-01');
INSERT INTO cliente (id_cliente, nome_completo, cpf, data_nascimento, telefone, email, tempo_habilitacao_anos, id_endereco, id_cnh) VALUES
(6, 'Joaozin do Erro', '666.666.666-66', '1980-01-01', '81988888888', 'erro@gov.com', 25, 11, 6);

-- CENÁRIO B: Cliente Novato
INSERT INTO endereco (id_endereco, logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
(12, 'Rua Novato', '10', NULL, 'Ini', 'Curitiba', 'PR', '80000-000');
INSERT INTO cnh (id_cnh, numero_registro, categoria, data_validade) VALUES
(7, '88888888888', 'B', '2030-01-01');
INSERT INTO cliente (id_cliente, nome_completo, cpf, data_nascimento, telefone, email, tempo_habilitacao_anos, id_endereco, id_cnh) VALUES
(7, 'Bianca Novata', '777.777.777-77', '2003-01-01', '41977777777', 'novata@email.com', 1, 12, 7);

-- CENÁRIO C: Histórico de Manutenção
INSERT INTO manutencao (data_entrada, data_saida, descricao_servico, custo, id_veiculo, status) VALUES
('2025-01-10', '2025-01-11', 'Freios', 450.00, 1, 'Concluída'),
('2025-04-22', '2025-04-22', 'Alinhamento', 180.00, 1, 'Concluída'),
('2025-09-05', '2025-09-07', 'Ar Cond', 620.00, 1, 'Concluída');

-- CENÁRIO D: Cliente Premium (Rodrigo)
INSERT INTO locacao (id_locacao, data_retirada, data_devolucao_prevista, data_devolucao_real, valor_total_previsto, valor_final, quilometragem_retirada, quilometragem_devolucao, id_cliente, id_veiculo, id_funcionario, status, tanque_saida, tanque_chegada, caucao, devolucao) VALUES
(6, '2025-02-01 08:00:00', '2025-02-03 08:00:00', '2025-02-03 08:00:00', 361.00, 361.00, 4501, 4750, 1, 2, 1, 'Chegada', 52, 52, 1000.00, 'na devolução'),
(7, '2025-07-10 12:00:00', '2025-07-17 12:00:00', '2025-07-17 11:30:00', 1750.00, 1750.00, 21001, 22500, 1, 3, 4, 'Chegada', 60, 60, 2000.00, 'na devolução');
INSERT INTO pagamento (data_pagamento, valor, id_locacao, id_forma_pagamento) VALUES
('2025-02-01 08:05:00', 361.00, 6, 1), ('2025-07-10 12:05:00', 1750.00, 7, 3);

-- CENÁRIO E: Locação ativa (Matheus)
INSERT INTO locacao (id_locacao, data_retirada, data_devolucao_prevista, data_devolucao_real, valor_total_previsto, valor_final, quilometragem_retirada, quilometragem_devolucao, id_cliente, id_veiculo, id_funcionario, status, tanque_saida, tanque_chegada, caucao, devolucao) VALUES
(8, '2025-10-25 10:00:00', '2025-10-30 10:00:00', NULL, 600.00, NULL, 15501, NULL, 2, 1, 1, 'Locado', 40, NULL, 1000.00, 'na devolução');
INSERT INTO pagamento (data_pagamento, valor, id_locacao, id_forma_pagamento) VALUES
('2025-10-25 10:05:00', 600.00, 8, 2);

-- Update status do veículo do Cenário E para Alugado
UPDATE veiculo SET id_status_veiculo = 2 WHERE id_veiculo = 1;