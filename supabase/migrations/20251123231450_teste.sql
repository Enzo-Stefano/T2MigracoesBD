-- Criação da tabela produtos
create table produtos (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  preco numeric(10,2) not null,
  quantidade int not null,
  criado_em timestamp with time zone default now()
);