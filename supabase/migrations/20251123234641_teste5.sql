-- Criação da tabela clientes
create table clientes (
  id serial primary key,
  nome text not null,
  email text unique not null,
  telefone text,
  data_cadastro date default current_date
);