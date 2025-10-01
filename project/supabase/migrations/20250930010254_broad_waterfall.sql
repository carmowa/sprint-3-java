-- V1__Create_initial_tables.sql
-- Criação das tabelas principais do sistema

-- Tabela de usuários para autenticação
CREATE TABLE usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de roles (perfis de usuário)
CREATE TABLE roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(255)
);

-- Tabela de relacionamento usuário-role
CREATE TABLE usuario_roles (
    usuario_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (usuario_id, role_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- Tabela Patio
CREATE TABLE patio (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    complemento VARCHAR(100),
    cidade VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    capacidade_maxima INTEGER NOT NULL,
    administrador_responsavel VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Dispositivo
CREATE TABLE dispositivo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    patio_id BIGINT,
    moto_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patio_id) REFERENCES patio(id)
);

-- Tabela Moto
CREATE TABLE moto (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    imei VARCHAR(20) UNIQUE NOT NULL,
    chassi VARCHAR(50) NOT NULL,
    placa VARCHAR(10) NOT NULL,
    patio_id BIGINT,
    dispositivo_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patio_id) REFERENCES patio(id)
);

-- Tabela Historico_Patio
CREATE TABLE historico_patio (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    moto_id BIGINT NOT NULL,
    patio_id BIGINT NOT NULL,
    data_entrada TIMESTAMP,
    data_saida TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (moto_id) REFERENCES moto(id),
    FOREIGN KEY (patio_id) REFERENCES patio(id)
);

-- Adicionar foreign key para dispositivo na moto
ALTER TABLE dispositivo ADD CONSTRAINT fk_dispositivo_moto 
    FOREIGN KEY (moto_id) REFERENCES moto(id);