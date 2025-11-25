-- Migration: criar 3 tabelas (5 colunas cada) e inserir 7 registros em cada
-- Uso: cole este SQL no arquivo de migration (ex: supabase/migrations/<timestamp>_create_tables_and_seed.sql)

BEGIN;

-- Extensão para gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Tabela clientes (5 colunas)
CREATE TABLE IF NOT EXISTS clientes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome text NOT NULL,
  email text UNIQUE NOT NULL,
  telefone text,
  data_cadastro timestamptz DEFAULT now()
);

-- Inserir 7 registros em clientes (IDs explícitos para uso em FK nos pedidos)
INSERT INTO clientes (id, nome, email, telefone) VALUES
  ('00000000-0000-0000-0000-000000000001','Ana Silva','ana.silva@example.com','+55 11 99999-0001'),
  ('00000000-0000-0000-0000-000000000002','Bruno Costa','bruno.costa@example.com','+55 11 99999-0002'),
  ('00000000-0000-0000-0000-000000000003','Carla Mendes','carla.mendes@example.com','+55 11 99999-0003'),
  ('00000000-0000-0000-0000-000000000004','Diego Alves','diego.alves@example.com','+55 11 99999-0004'),
  ('00000000-0000-0000-0000-000000000005','Eduarda Rocha','eduarda.rocha@example.com','+55 11 99999-0005'),
  ('00000000-0000-0000-0000-000000000006','Felipe Souza','felipe.souza@example.com','+55 11 99999-0006'),
  ('00000000-0000-0000-0000-000000000007','Gisele Ramos','gisele.ramos@example.com','+55 11 99999-0007');


-- Tabela produtos (5 colunas)
CREATE TABLE IF NOT EXISTS produtos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome text NOT NULL,
  preco numeric(10,2) NOT NULL,
  quantidade int NOT NULL,
  criado_em timestamptz DEFAULT now()
);

-- Inserir 7 registros em produtos (IDs explícitos para uso em FK nos pedidos)
INSERT INTO produtos (id, nome, preco, quantidade) VALUES
  ('00000000-0000-0000-0000-000000000101','Mouse Gamer',120.00,10),
  ('00000000-0000-0000-0000-000000000102','Teclado Mecânico',350.00,5),
  ('00000000-0000-0000-0000-000000000103','Webcam HD',220.90,8),
  ('00000000-0000-0000-0000-000000000104','Monitor 24"',799.90,3),
  ('00000000-0000-0000-0000-000000000105','Fone de Ouvido',199.50,12),
  ('00000000-0000-0000-0000-000000000106','Cabo HDMI',29.90,50),
  ('00000000-0000-0000-0000-000000000107','SSD 500GB',450.00,7);


-- Tabela pedidos (5 colunas) com FKs para clientes e produtos
CREATE TABLE IF NOT EXISTS pedidos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cliente_id uuid NOT NULL REFERENCES clientes(id) ON DELETE CASCADE,
  produto_id uuid NOT NULL REFERENCES produtos(id) ON DELETE RESTRICT,
  quantidade int NOT NULL,
  criado_em timestamptz DEFAULT now()
);

-- Inserir 7 registros em pedidos (referenciando os clientes e produtos acima)
INSERT INTO pedidos (id, cliente_id, produto_id, quantidade) VALUES
  ('00000000-0000-0000-0000-000000000201','00000000-0000-0000-0000-000000000001','00000000-0000-0000-0000-000000000101',2),
  ('00000000-0000-0000-0000-000000000202','00000000-0000-0000-0000-000000000002','00000000-0000-0000-0000-000000000102',1),
  ('00000000-0000-0000-0000-000000000203','00000000-0000-0000-0000-000000000003','00000000-0000-0000-0000-000000000103',1),
  ('00000000-0000-0000-0000-000000000204','00000000-0000-0000-0000-000000000004','00000000-0000-0000-0000-000000000104',1),
  ('00000000-0000-0000-0000-000000000205','00000000-0000-0000-0000-000000000005','00000000-0000-0000-0000-000000000105',3),
  ('00000000-0000-0000-0000-000000000206','00000000-0000-0000-0000-000000000006','00000000-0000-0000-0000-000000000106',5),
  ('00000000-0000-0000-0000-000000000207','00000000-0000-0000-0000-000000000007','00000000-0000-0000-0000-000000000107',1);

COMMIT;