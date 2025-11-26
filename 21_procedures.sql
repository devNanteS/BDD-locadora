/*
============================================================
  Arquivo: 21_procedures.sql
  Autor(es):
    Leonardo Giannoccaro Nantes
    Pietro di Luca Monte Souza Balbino
    Matheus Gonçalves Domingues Geraldi
    Guilherme Liyuji Aoki Uehara

  Trabalho: Locação de Veículos
  Curso/Turma: DS 213
  SGBD: MySQL Versão: 8.0
  Objetivo: Criação de procedures e functions (opcional).
  Execução esperada: rodar após o 01_modelo_fisico.sql
==========================================================
*/

USE locadora;

DELIMITER //

-- Procedure 1: Registrar uma Nova Locação com Segurança (ATUALIZADA)
-- Agora aceita: Caução e Tanque de Saída
CREATE PROCEDURE sp_registrar_locacao (
    IN p_id_cliente INT,
    IN p_id_veiculo INT,
    IN p_id_funcionario INT,
    IN p_data_devolucao_prevista DATETIME,
    IN p_caucao DECIMAL(10, 2), -- Novo Parâmetro
    IN p_tanque_saida INT       -- Novo Parâmetro
)
BEGIN
    DECLARE v_status_veiculo INT;
    DECLARE v_quilometragem_atual INT;
    DECLARE v_valor_diaria DECIMAL(10, 2);
    DECLARE v_total_dias INT;
    DECLARE v_valor_previsto DECIMAL(10, 2);

    -- 1. Verifica status e KM atual
    SELECT id_status_veiculo, quilometragem INTO v_status_veiculo, v_quilometragem_atual
    FROM veiculo
    WHERE id_veiculo = p_id_veiculo;

    -- 2. Se não estiver Disponível (1), bloqueia
    IF v_status_veiculo != 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERRO: Veículo não está "Disponível". Locação cancelada.';
    ELSE
        -- 3. Calcula valor previsto
        SELECT cv.valor_diaria INTO v_valor_diaria
        FROM veiculo v
        JOIN modelo m ON v.id_modelo = m.id_modelo
        JOIN categoria_veiculo cv ON m.id_categoria_veiculo = cv.id_categoria_veiculo
        WHERE v.id_veiculo = p_id_veiculo;

        SET v_total_dias = CEILING(TIMESTAMPDIFF(HOUR, NOW(), p_data_devolucao_prevista) / 24.0);
        IF v_total_dias <= 0 THEN SET v_total_dias = 1; END IF;

        SET v_valor_previsto = v_total_dias * v_valor_diaria;

        -- 4. Insere a locação com os NOVOS CAMPOS OBRIGATÓRIOS
        INSERT INTO locacao (
            data_retirada, data_devolucao_prevista, valor_total_previsto,
            quilometragem_retirada, id_cliente, id_veiculo, id_funcionario,
            status, tanque_saida, caucao, devolucao
        ) VALUES (
            NOW(), p_data_devolucao_prevista, v_valor_previsto,
            v_quilometragem_atual, p_id_cliente, p_id_veiculo, p_id_funcionario,
            'Locado',       -- Status inicial já vai como 'Locado'
            p_tanque_saida, -- Tanque informado
            p_caucao,       -- Caução informada
            'na devolução'  -- Padrão
        );

        -- 5. Atualiza status do veículo para Alugado (2)
        UPDATE veiculo
        SET id_status_veiculo = 2
        WHERE id_veiculo = p_id_veiculo;

        SELECT 'Locação registrada com sucesso!' AS Resultado;

    END IF;
END;
//

-- Function 1: Calcular Diárias (Inalterada, pois a lógica de tempo é a mesma)
CREATE FUNCTION fn_calcular_diarias (
    f_data_inicio DATETIME,
    f_data_fim DATETIME
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total_dias INT;
    SET v_total_dias = CEILING(TIMESTAMPDIFF(HOUR, f_data_inicio, f_data_fim) / 24.0);
    IF v_total_dias <= 0 THEN SET v_total_dias = 1; END IF;
    RETURN v_total_dias;
END;
//

DELIMITER ;

/*
-- ==========================================
-- TESTES DA PROCEDURE (Atualizados)
-- ==========================================

-- Teste de Sucesso: Alugar o Veículo 6 (Uno), que está Disponível.
-- Agora passamos a Caução (1000.00) e o Tanque (47)
CALL sp_registrar_locacao(2, 6, 1, NOW() + INTERVAL 3 DAY, 1000.00, 47);

-- Teste de Falha: Tentar alugar o mesmo Uno novamente
CALL sp_registrar_locacao(3, 6, 1, NOW() + INTERVAL 2 DAY, 1000.00, 47);
*/