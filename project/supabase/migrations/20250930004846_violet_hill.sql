-- V3__Insert_initial_users.sql
-- Inserção de usuários iniciais do sistema

-- Senha: admin123 (BCrypt encoded)
INSERT INTO usuarios (username, password, email, enabled) 
VALUES ('admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9P2.nHb8GjU5cWO', 'admin@mottu.com', 1);

-- Senha: operador123 (BCrypt encoded)
INSERT INTO usuarios (username, password, email, enabled) 
VALUES ('operador', '$2a$10$8K1p/H9jd.cBZAvNUGduqeaR9QzBs6/pjF5zJLbLWf5o2XzqXJqYm', 'operador@mottu.com', 1);

-- Senha: viewer123 (BCrypt encoded)
INSERT INTO usuarios (username, password, email, enabled) 
VALUES ('viewer', '$2a$10$DowJWslW8gEXTdIkd6iD6uKpZa9fB2gt9i5uS0/s8qMqLvQoM9Iem', 'viewer@mottu.com', 1);

-- Associar usuários aos perfis
INSERT INTO usuario_roles (usuario_id, role_id) VALUES (1, 1); -- admin -> ADMIN
INSERT INTO usuario_roles (usuario_id, role_id) VALUES (2, 2); -- operador -> OPERADOR
INSERT INTO usuario_roles (usuario_id, role_id) VALUES (3, 3); -- viewer -> VISUALIZADOR

COMMIT;