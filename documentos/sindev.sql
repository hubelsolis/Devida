CREATE TABLE simdev
(
	idsimdev             INTEGER NOT NULL,
	almacen              VARCHAR(8) ,
	ambito               VARCHAR(32) ,
	dnisupervisor        VARCHAR(10) ,
	diacampo             VARCHAR(32) ,
	dniextensionistaambiental VARCHAR(10) ,
	dniextensionista     VARCHAR(10) ,
	dnitecnico           VARCHAR(10) ,
	idcaserio            INTEGER ,
	dnititular           VARCHAR(10) ,
	idactividad          VARCHAR(12) ,
	hinst                FLOAT ,
	hcrec                FLOAT ,
	hprod                FLOAT ,
	coordx               FLOAT ,
	coordy               FLOAT ,
	altitud              FLOAT ,
	primary key(idsimdev)
);

CREATE TABLE simdevhoja
(
	idhoja               INTEGER NOT NULL,
	idsimdev             INTEGER NOT NULL,
	nroitem              INTEGER ,
	desccorta            VARCHAR(32) ,
	descitem             VARCHAR(255) ,
	tipoitem             VARCHAR(12) ,
	idsimdevrptas        VARCHAR(255) ,
	estado               SMALLINT
);

CREATE TABLE simdevdata
(
	idhoja               INTEGER NOT NULL,
	idsimdev             INTEGER NOT NULL,
	nrofila              INTEGER NOT NULL,
	nroitem              INTEGER NOT NULL,
	respuesta            VARCHAR(32)	
);

commit;

CREATE UNIQUE INDEX XPKsimdevdata ON simdevdata
(
	idhoja,	idsimdev,	nrofila,	nroitem
);

CREATE UNIQUE INDEX XPKsimdevhoja ON simdevhoja
(
	idhoja,	idsimdev
);