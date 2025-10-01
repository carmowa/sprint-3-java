-- V2__Insert_initial_roles.sql
-- Inserção dos perfis de usuário iniciais

INSERT INTO roles (name, description) VALUES ('ADMIN', 'Administrador do sistema com acesso total');
INSERT INTO roles (name, description) VALUES ('OPERADOR', 'Operador com acesso limitado às funcionalidades básicas');
INSERT INTO roles (name, description) VALUES ('VISUALIZADOR', 'Usuário com acesso apenas para visualização');