ALTER TABLE MOVPADRON ADD TituloPath Varchar(32);
ALTER TABLE MOVPADRON ADD TituloTipo Varchar(64);
ALTER TABLE MOVPADRON ADD TituloDescripcion Varchar(255);

ALTER TABLE PADRON ADD TituloPath Varchar(32);
ALTER TABLE PADRON ADD TituloTipo Varchar(64);
ALTER TABLE PADRON ADD TituloDescripcion Varchar(255);
ALTER TABLE PADRON ADD TituloNoUpdate smallint default 0;

cominddd;

update padron set TituloNoupdate=0;

CREATE INDEX IDX_AUTORIDAD1 ON AUTORIDAD (DNI);