# T2MigracoesBD
Repositório destinado ao T2 da cadeira de `Gerência de Configuração` do curso de `ADS`. Uso de migrações de banco de dados em `trunk based`

---

## Sumário
- [Programas a serem instalados](#programas)
- [Forma de uso do projeto](#forma-de-uso)
- [Fluxo de Trabalho](#fluxo-de-trabalho)
- [Nomenclatura de branches](#nomenclatura-de-branches)
- [Como Contribuir](#como-contribuir)
- [Comandos Úteis](#comandos-úteis)

---

## Programas

- **Banco de dados relacional**: PostgreSQL 15;
- **Controle de banco de dados (migrations)**: Flyway 11.13.2;
- **Controle de versão local**: Git;
- **Criação & Controle de dados e sistema por containers**: Docker Desktop v4.43;
- **Editor de código para desenvolvimento**: Visual Studio Code (VS Code).

- **Links**
  - **postgreSQL**= ``https://www.postgresql.org/download/``;
  - **flyway**= ``https://documentation.red-gate.com/fd/flyway-open-source-277579296.html``;
  - **git**= ``https://git-scm.com/downloads``,``https://github.com/``;
  - **docker desktop**= ``https://www.docker.com/products/docker-desktop/``;
  - **VScode**= ``https://code.visualstudio.com/``.

---

## Forma de uso

### **Como subir o ambiente**

1. Clonar o repositório:
   ```bash
   git clone https://github.com/Enzo-Stefano/T2MigracoesBD.git
   cd SEU-REPOSITORIO
   ```

2. Abrir a pasta do projeto pelo VS Code;

3. Iniciar o container (subir banco de dados PostgreSQL e Flyway via Docker Compose):
   ```bash
   docker-compose up -d
   ```
4. Aplicar migrations de Flyway no terminal com o comando `docker-compose run --rm flyway migrate`; 

5. Criar branch (a partir da main/master) e acessar para novas migrações pelo git (`feature/...`);

6. Criar novas migrations:
- Acessar pasta `/migrations`;
- Criar arqivo `.sql` no padrão de nomenclatura do Flyway:  
  - `V<número da migração>__descricao.sql`;  
  - Exemplo: `V1__cria_tabela.sql`.

7. Commit na branch de funcionalidade criada;

8. Abrir PR para `main/master` após finalizar.

---

## Fluxo de Trabalho
- **Baseado no Trunk Based Development**: branch `main` + branches de funcionalidade;
- **Sem commit direto na main/master**;
- **Branches**: Sempre criar uma branch a partir da `main/master` para cada nova funcionalidade (feature);
- **Pull Request (PR)**: Ao terminar a feature/migration, abrir um PR para `main/master`;
- **Code Review**: Toda PR passará por revisão de código antes do merge.

---

## Nomenclatura de branches

- **Conventional Commits:**  
  - `feat`: Nova funcionalidade ou migração;
  - `fix`: Correção de bug;
  - `docs`: Atualização de documentação;
  - `chore`: Atualização de dependências/configurações;
  - `refactor`: Refatoração sem alteração funcional;
  - `test`: Adição/alteração de testes.

---

## Como Contribuir

1. Faça um fork ou clone do repositório;
2. Abra o projeto no VS Code;
3. Crie uma branch a partir da main/master seguindo o Conventional Commits:
   ```bash
   git checkout master
   git pull
   ```
4. Implemente sua feature/migration;
5. Dar commit seguindo o Conventional Commits;
6. Abra um PR para main/master;
7. Aguarde revisão de código para efetuação do merge.

---

## Comandos Úteis

- **Subir ambiente:**  
  `docker-compose up -d`

- **Parar ambiente:**  
  `docker-compose down`

- **Efetuar migrations manualmente:**  
  `docker-compose run --rm flyway migrate`

- **Ver status das migrations:**  
  `docker-compose run --rm flyway info`

- **Acessar query do postgres pelo container:**  
  `docker exec -it meu-postgres psql -U admin -d cliente_db`

- **Derrubar e subir Schemas (dentro do query):**  
  `drop schema public cascade;` + `create schema public;`

---
