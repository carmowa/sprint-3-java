-- V4__Insert_sample_data.sql
-- Inserção de dados de exemplo para demonstração

-- Inserir pátios de exemplo
INSERT INTO patio (nome, logradouro, numero, cep, complemento, cidade, pais, capacidade_maxima, administrador_responsavel)
VALUES ('Pátio Centro', 'Av. Paulista', '1000', '01310-100', 'Andar 5', 'São Paulo', 'Brasil', 50, 'João Silva');

INSERT INTO patio (nome, logradouro, numero, cep, complemento, cidade, pais, capacidade_maxima, administrador_responsavel)
VALUES ('Pátio Norte', 'Rua das Flores', '500', '02020-200', NULL, 'São Paulo', 'Brasil', 30, 'Maria Santos');

INSERT INTO patio (nome, logradouro, numero, cep, complemento, cidade, pais, capacidade_maxima, administrador_responsavel)
VALUES ('Pátio Sul', 'Av. dos Estados', '2000', '09210-580', 'Galpão B', 'Santo André', 'Brasil', 75, 'Pedro Costa');

-- Inserir dispositivos de exemplo
INSERT INTO dispositivo (status, patio_id) VALUES ('DISPONIVEL', 1);
INSERT INTO dispositivo (status, patio_id) VALUES ('PENDENCIA', 1);
INSERT INTO dispositivo (status, patio_id) VALUES ('REPAROS_SIMPLES', 2);
INSERT INTO dispositivo (status, patio_id) VALUES ('PRONTA_PARA_ALUGUEL', 2);
INSERT INTO dispositivo (status, patio_id) VALUES ('DISPONIVEL', 3);

-- Inserir motos de exemplo
INSERT INTO moto (imei, chassi, placa, patio_id, dispositivo_id)
VALUES ('123456789012345', '9BWZZZ377VT004251', 'ABC1D23', 1, 1);

INSERT INTO moto (imei, chassi, placa, patio_id, dispositivo_id)
VALUES ('123456789012346', '9BWZZZ377VT004252', 'DEF2E34', 1, 2);

INSERT INTO moto (imei, chassi, placa, patio_id, dispositivo_id)
VALUES ('123456789012347', '9BWZZZ377VT004253', 'GHI3F45', 2, 3);

INSERT INTO moto (imei, chassi, placa, patio_id, dispositivo_id)
VALUES ('123456789012348', '9BWZZZ377VT004254', 'JKL4G56', 2, 4);

INSERT INTO moto (imei, chassi, placa, patio_id, dispositivo_id)
VALUES ('123456789012349', '9BWZZZ377VT004255', 'MNO5H67', 3, 5);

-- Atualizar dispositivos com as motos associadas
UPDATE dispositivo SET moto_id = 1 WHERE id = 1;
UPDATE dispositivo SET moto_id = 2 WHERE id = 2;
UPDATE dispositivo SET moto_id = 3 WHERE id = 3;
UPDATE dispositivo SET moto_id = 4 WHERE id = 4;
UPDATE dispositivo SET moto_id = 5 WHERE id = 5;

-- Inserir histórico de exemplo
INSERT INTO historico_patio (moto_id, patio_id, data_entrada, data_saida)
VALUES (1, 1, TIMESTAMP '2024-01-15 08:00:00', TIMESTAMP '2024-01-15 18:30:00');

INSERT INTO historico_patio (moto_id, patio_id, data_entrada, data_saida)
VALUES (2, 1, TIMESTAMP '2024-01-16 09:15:00', NULL);

INSERT INTO historico_patio (moto_id, patio_id, data_entrada, data_saida)
VALUES (3, 2, TIMESTAMP '2024-01-17 07:45:00', TIMESTAMP '2024-01-17 17:20:00');

COMMIT;