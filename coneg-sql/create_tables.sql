CREATE SCHEMA coneg;

-- Creating dim_cadastrados
CREATE TABLE IF NOT EXISTS coneg.dim_cadastrados (
  pesid SERIAL PRIMARY KEY,
  nome varchar(128),
  email varchar(64),
  telefone varchar(16)
);

-- Creating dim_status
CREATE TABLE IF NOT EXISTS coneg.dim_status (
  id SERIAL PRIMARY KEY,
  mascara boolean,
  cadastrado boolean
);

-- Creating fato_faces
CREATE TABLE IF NOT EXISTS coneg.fato_faces (
  tid SERIAL PRIMARY KEY,
  "local" varchar(128),
  ts timestamp,
  "status" int,
  pessoa int,
  CONSTRAINT fk_status FOREIGN KEY("status") REFERENCES coneg.dim_status(id),
  CONSTRAINT fk_pessoa FOREIGN KEY("pessoa") REFERENCES coneg.dim_cadastrados(pesid)
);