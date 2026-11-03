create table backupTitulo (
  idpadron integer not null,
  idcaserio varchar(12),
  dni varchar(10), 
  TITULOPATH varchar(32),
  TITULOTIPO varchar(64),
  TITULODESCRIPCION varchar(255),
  TITULONOUPDATE smallint DEFAULT 0
)