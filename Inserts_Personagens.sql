-- ============================================================
-- Script para inserir 10 personagens do universo Dragon Ball Z
-- Use este arquivo para popular a tabela DBZ do banco de dados
-- ============================================================

USE DBZ;

-- Inserts de personagens DBZ
INSERT INTO DBZ (Nome, Tipo) VALUES ('Goku', 'Saiyajin');
INSERT INTO DBZ (Nome, Tipo) VALUES ('Vegeta', 'Saiyajin');
INSERT INTO DBZ (Nome, Tipo) VALUES ('Piccolo', 'Namekuseijin');
INSERT INTO DBZ (Nome, Tipo) VALUES ('Gohan', 'Saiyajin');
INSERT INTO DBZ (Nome, Tipo) VALUES ('Goten', 'Saiyajin');
INSERT INTO DBZ (Nome, Tipo) VALUES ('Trunks', 'Saiyajin');
INSERT INTO DBZ (Nome, Tipo) VALUES ('Kuririn', 'Humano');
INSERT INTO DBZ (Nome, Tipo) VALUES ('Bulma', 'Humano');
INSERT INTO DBZ (Nome, Tipo) VALUES ('Yamcha', 'Humano');
INSERT INTO DBZ (Nome, Tipo) VALUES ('Gotenks', 'Saiyajin');

-- Verificar se os personagens foram inseridos
SELECT * FROM DBZ;

