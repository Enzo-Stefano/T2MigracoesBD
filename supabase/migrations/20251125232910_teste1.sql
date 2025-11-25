-- Migration (DEV): criar 3 tabelas (5 colunas cada) e inserir 7 registros em cada
-- Coloque este arquivo em supabase/migrations/ com um timestamp adequado se usar Supabase CLI

BEGIN;

-- Habilita função para gerar UUIDs, caso necessário
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Tabela clientes (5 colunas)
CREATE TABLE IF NOT EXISTS clientes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome text NOT NULL,
  email text UNIQUE NOT NULL,
  telefone text,
  data_cadastro timestamptz DEFAULT now()
);

-- Inserir 7 registros em clientes
INSERT INTO clientes (id, nome, email, telefone) VALUES
  ('11111111-0000-0000-0000-000000000001','Lucas Pereira','lucas.pereira@example.com','+55 11 98888-0001'),
  ('11111111-0000-0000-0000-000000000002','Mariana Souza','mariana.souza@example.com','+55 11 98888-0002'),
  ('11111111-0000-0000-0000-000000000003','Rafael Lima','rafael.lima@example.com','+55 11 98888-0003'),
  ('11111111-0000-0000-0000-000000000004','Patrícia Alves','patricia.alves@example.com','+55 11 98888-0004'),
  ('11111111-0000-0000-0000-000000000005','Thiago Castro','thiago.castro@example.com','+55 11 98888-0005'),
  ('11111111-0000-0000-0000-000000000006','Bianca Moreira','bianca.moreira@example.com','+55 11 98888-0006'),
  ('11111111-0000-0000-0000-000000000007','Gustavo Pinto','gustavo.pinto@example.com','+55 11 98888-0007');


-- Tabela produtos (5 colunas)
CREATE TABLE IF NOT EXISTS produtos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome text NOT NULL,
  preco numeric(10,2) NOT NULL,
  estoque int NOT NULL,
  criado_em timestamptz DEFAULT now()
);

-- Inserir 7 registros em produtos
INSERT INTO produtos (id, nome, preco, estoque) VALUES
  ('22222222-0000-0000-0000-000000000101','Teclado USB',79.90,25),
  ('22222222-0000-0000-0000-000000000102','Mouse Óptico',49.50,40),
  ('22222222-0000-0000-0000-000000000103','Monitor 27"',1099.00,6),
  ('22222222-0000-0000-0000-000000000104','Webcam Full HD',199.90,15),
  ('22222222-0000-0000-0000-000000000105','Cadeira Gamer',899.00,4),
  ('22222222-0000-0000-0000-000000000106','Hub USB-C',129.90,30),
  ('22222222-0000-0000-0000-000000000107','SSD 1TB',749.00,10);


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
  ('33333333-0000-0000-0000-000000000201','11111111-0000-0000-0000-000000000001','22222222-0000-0000-0000-000000000101',1),
  ('33333333-0000-0000-0000-000000000202','11111111-0000-0000-0000-000000000002','22222222-0000-0000-0000-000000000103',2),
  ('33333333-0000-0000-0000-000000000203','11111111-0000-0000-0000-000000000003','22222222-0000-0000-0000-000000000104',1),
  ('33333333-0000-0000-0000-000000000204','11111111-0000-0000-0000-000000000004','22222222-0000-0000-0000-000000000105',1),
  ('33333333-0000-0000-0000-000000000205','11111111-0000-0000-0000-000000000005','22222222-0000-0000-0000-000000000106',3),
  ('33333333-0000-0000-0000-000000000206','11111111-0000-0000-0000-000000000006','22222222-0000-0000-0000-000000000102',2),
  ('33333333-0000-0000-0000-000000000207','11111111-0000-0000-0000-000000000007','22222222-0000-0000-0000-000000000107',1);

COMMIT;