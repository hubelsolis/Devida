--SELECT * FROM MOVPADRONACTIVIDAD m where m.IDACTIVIDAD='GRA'

--SELECT * FROM MOVPADRON m where m.ACTIVIDAD is not null

--select * from actividadetapa a where a.idetapa='GRA'

--sELECT * FROM MOVPADRONACTIVIDAD m where m.idetapa<>'GRA'


update actividadetapa a set a.IDETAPA='HAS PROD' where a.idetapa='GRA';

update MOVPADRONACTIVIDAD m set m.idetapa='HAS PROD' where m.idetapa='GRA';

ALTER TABLE ACTIVIDADETAPA ADD descripcion Varchar(32);

ALTER TABLE ACTIVIDADETAPA ADD unidad Varchar(32);

ALTER TABLE ACTIVIDADETAPA ADD denominacion Varchar(32);
