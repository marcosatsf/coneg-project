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
  cadastrado int
);

INSERT INTO coneg.dim_status
(id, mascara, cadastrado)
VALUES
-- mask
(0, '1', -1),
-- not mask & not registered
(1, '0', 0),
-- not mask & registered
(2, '0', 1)
ON CONFLICT DO NOTHING;

-- Creating fato_faces
CREATE TABLE IF NOT EXISTS coneg.fato_faces (
  tid SERIAL PRIMARY KEY,
  "local" varchar(128),
  ts timestamp,
  "status" int,
  pessoa int,
  CONSTRAINT fk_status FOREIGN KEY("status") REFERENCES coneg.dim_status(id)
);