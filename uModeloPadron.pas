unit uModelopadron;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
Tpadron = class
    Idpadron : string;
    Idadenda : string;
    Codigo : string;
    Idcaserio : string;
    Oz : string;
    Ambito : string;
    Departamento : string;
    Provincia : string;
    Distrito : string;
    Caserio : string;
    Appaterno : string;
    Apmaterno : string;
    Nombre : string;
    Dni : string;
    Sexo : string;
    Etnia : string;
    Lengua : string;
    Telefono : string;
    Cony_Appaterno : string;
    Cony_Apmaterno : string;
    Cony_nombre : string;
    Cony_dni : string;
    Cony_sexo : string;
    Cony_etnia : string;
    Cony_lengua : string;
    Anio_incorporacion : string;
    Observaciones : string;
    Justificacion : string;
    editable : string;
    fecnac : string;
    cony_fecnac : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datIdpadron,
    datIdadenda,
    datCodigo,
    datIdcaserio,
    datOz,
    datAmbito,
    datDepartamento,
    datProvincia,
    datDistrito,
    datCaserio,
    datAppaterno,
    datApmaterno,
    datNombre,
    datDni,
    datSexo,
    datEtnia,
    datLengua,
    datTelefono,
    datCony_Appaterno,
    datCony_Apmaterno,
    datCony_nombre,
    datCony_dni,
    datCony_sexo,
    datCony_etnia,
    datCony_lengua,
    datAnio_incorporacion,
    datObservaciones,
    datJustificacion,
    datEditable,
    datfecnac,
    datcony_fecnac:string);
    procedure ObtenerRegistro(id,iddato:string); overload;
    procedure ObtenerRegistro(id,iddato,id2,iddato2:string); overload;
    function Buscar(id,iddato:string):boolean;
    function Buscar2(id1,iddato1,id2,iddato2:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato : string):boolean;
    function Actualizar2(id1,iddato1,id2,iddato2 : string):boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor Tpadron.Create;
begin
  limpiar;
end;

procedure Tpadron.limpiar;
begin
    Idpadron := '';
    Idadenda := '';
    Codigo := '';
    Idcaserio := '';
    Oz := '';
    Ambito := '';
    Departamento := '';
    Provincia := '';
    Distrito := '';
    Caserio := '';
    Appaterno := '';
    Apmaterno := '';
    Nombre := '';
    Dni := '';
    Sexo := '';
    Etnia := '';
    Lengua := '';
    Telefono := '';
    Cony_Appaterno := '';
    Cony_Apmaterno := '';
    Cony_nombre := '';
    Cony_dni := '';
    Cony_sexo := '';
    Cony_etnia := '';
    Cony_lengua := '';
    Anio_incorporacion := '';
    Observaciones := '';
    Justificacion := '';
    editable := '';
    fecnac:='';
    cony_fecnac:='';
end;

procedure Tpadron.llenar(
    datIdpadron,
    datIdadenda,
    datCodigo,
    datIdcaserio,
    datOz,
    datAmbito,
    datDepartamento,
    datProvincia,
    datDistrito,
    datCaserio,
    datAppaterno,
    datApmaterno,
    datNombre,
    datDni,
    datSexo,
    datEtnia,
    datLengua,
    datTelefono,
    datCony_Appaterno,
    datCony_Apmaterno,
    datCony_nombre,
    datCony_dni,
    datCony_sexo,
    datCony_etnia,
    datCony_lengua,
    datAnio_incorporacion,
    datObservaciones,
    datJustificacion,
    datEditable,
    datFecNac,
    datcony_fecnac:string);
 begin
   Idpadron:=DatIdpadron;
   Idadenda:=DatIdadenda;
   Codigo:=DatCodigo;
   Idcaserio:=DatIdcaserio;
   Oz:=DatOz;
   Ambito:=DatAmbito;
   Departamento:=DatDepartamento;
   Provincia:=DatProvincia;
   Distrito:=DatDistrito;
   Caserio:=DatCaserio;
   Appaterno:=DatAppaterno;
   Apmaterno:=DatApmaterno;
   Nombre:=DatNombre;
   Dni:=DatDni;
   Sexo:=DatSexo;
   Etnia:=DatEtnia;
   Lengua:=DatLengua;
   Telefono:=DatTelefono;
   Cony_Appaterno:=DatCony_Appaterno;
   Cony_Apmaterno:=DatCony_Apmaterno;
   Cony_nombre:=DatCony_nombre;
   Cony_dni:=DatCony_dni;
   Cony_sexo:=DatCony_sexo;
   Cony_etnia:=DatCony_etnia;
   Cony_lengua:=DatCony_lengua;
   Anio_incorporacion:=DatAnio_incorporacion;
   Observaciones:=DatObservaciones;
   Justificacion:=DatJustificacion;
   editable:=DatEditable;
   fecnac:=datFecNac;
   cony_fecnac:=datcony_fecnac;
 end;

procedure Tpadron.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idpadron,Idadenda,Codigo,Idcaserio,Oz,Ambito,Departamento,'+
    'Provincia,Distrito,Caserio,Appaterno,Apmaterno,Nombre,Dni,Sexo,Etnia,Lengua,'+
    'Telefono,Cony_Appaterno,Cony_Apmaterno,Cony_nombre,Cony_dni,Cony_sexo,Cony_etnia,'+
    'Cony_lengua,Anio_incorporacion,Observaciones,Justificacion,editable,fecNac,cony_fecnac '+
    'FROM padron WHERE '+id+'="'+iddato+'"',true);
    Idpadron:=DM1.ConsultaSql.Fields[0].Asstring;
    Idadenda:=DM1.ConsultaSql.Fields[1].Asstring;
    Codigo:=DM1.ConsultaSql.Fields[2].Asstring;
    Idcaserio:=DM1.ConsultaSql.Fields[3].Asstring;
    Oz:=DM1.ConsultaSql.Fields[4].Asstring;
    Ambito:=DM1.ConsultaSql.Fields[5].Asstring;
    Departamento:=DM1.ConsultaSql.Fields[6].Asstring;
    Provincia:=DM1.ConsultaSql.Fields[7].Asstring;
    Distrito:=DM1.ConsultaSql.Fields[8].Asstring;
    Caserio:=DM1.ConsultaSql.Fields[9].Asstring;
    Appaterno:=DM1.ConsultaSql.Fields[10].Asstring;
    Apmaterno:=DM1.ConsultaSql.Fields[11].Asstring;
    Nombre:=DM1.ConsultaSql.Fields[12].Asstring;
    Dni:=DM1.ConsultaSql.Fields[13].Asstring;
    Sexo:=DM1.ConsultaSql.Fields[14].Asstring;
    Etnia:=DM1.ConsultaSql.Fields[15].Asstring;
    Lengua:=DM1.ConsultaSql.Fields[16].Asstring;
    Telefono:=DM1.ConsultaSql.Fields[17].Asstring;
    Cony_Appaterno:=DM1.ConsultaSql.Fields[18].Asstring;
    Cony_Apmaterno:=DM1.ConsultaSql.Fields[19].Asstring;
    Cony_nombre:=DM1.ConsultaSql.Fields[20].Asstring;
    Cony_dni:=DM1.ConsultaSql.Fields[21].Asstring;
    Cony_sexo:=DM1.ConsultaSql.Fields[22].Asstring;
    Cony_etnia:=DM1.ConsultaSql.Fields[23].Asstring;
    Cony_lengua:=DM1.ConsultaSql.Fields[24].Asstring;
    Anio_incorporacion:=DM1.ConsultaSql.Fields[25].Asstring;
    Observaciones:=DM1.ConsultaSql.Fields[26].Asstring;
    Justificacion:=DM1.ConsultaSql.Fields[27].Asstring;
    editable:=DM1.ConsultaSql.Fields[28].Asstring;
    fecNac:=DM1.ConsultaSql.Fields[29].Asstring;
    cony_fecnac:=DM1.ConsultaSql.Fields[30].Asstring;
    DM1.ConsultaSQL.Close;
 end;

procedure Tpadron.ObtenerRegistro(id,iddato,id2,iddato2:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idpadron,Idadenda,Codigo,Idcaserio,Oz,Ambito,Departamento,'+
    'Provincia,Distrito,Caserio,Appaterno,Apmaterno,Nombre,Dni,Sexo,Etnia,Lengua,'+
    'Telefono,Cony_Appaterno,Cony_Apmaterno,Cony_nombre,Cony_dni,Cony_sexo,Cony_etnia,'+
    'Cony_lengua,Anio_incorporacion,Observaciones,Justificacion,editable,fecNac,cony_fecnac '+
    'FROM padron WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'";',true);
    Idpadron:=DM1.ConsultaSql.Fields[0].Asstring;
    Idadenda:=DM1.ConsultaSql.Fields[1].Asstring;
    Codigo:=DM1.ConsultaSql.Fields[2].Asstring;
    Idcaserio:=DM1.ConsultaSql.Fields[3].Asstring;
    Oz:=DM1.ConsultaSql.Fields[4].Asstring;
    Ambito:=DM1.ConsultaSql.Fields[5].Asstring;
    Departamento:=DM1.ConsultaSql.Fields[6].Asstring;
    Provincia:=DM1.ConsultaSql.Fields[7].Asstring;
    Distrito:=DM1.ConsultaSql.Fields[8].Asstring;
    Caserio:=DM1.ConsultaSql.Fields[9].Asstring;
    Appaterno:=DM1.ConsultaSql.Fields[10].Asstring;
    Apmaterno:=DM1.ConsultaSql.Fields[11].Asstring;
    Nombre:=DM1.ConsultaSql.Fields[12].Asstring;
    Dni:=DM1.ConsultaSql.Fields[13].Asstring;
    Sexo:=DM1.ConsultaSql.Fields[14].Asstring;
    Etnia:=DM1.ConsultaSql.Fields[15].Asstring;
    Lengua:=DM1.ConsultaSql.Fields[16].Asstring;
    Telefono:=DM1.ConsultaSql.Fields[17].Asstring;
    Cony_Appaterno:=DM1.ConsultaSql.Fields[18].Asstring;
    Cony_Apmaterno:=DM1.ConsultaSql.Fields[19].Asstring;
    Cony_nombre:=DM1.ConsultaSql.Fields[20].Asstring;
    Cony_dni:=DM1.ConsultaSql.Fields[21].Asstring;
    Cony_sexo:=DM1.ConsultaSql.Fields[22].Asstring;
    Cony_etnia:=DM1.ConsultaSql.Fields[23].Asstring;
    Cony_lengua:=DM1.ConsultaSql.Fields[24].Asstring;
    Anio_incorporacion:=DM1.ConsultaSql.Fields[25].Asstring;
    Observaciones:=DM1.ConsultaSql.Fields[26].Asstring;
    Justificacion:=DM1.ConsultaSql.Fields[27].Asstring;
    editable:=DM1.ConsultaSql.Fields[28].Asstring;
    fecNac:=DM1.ConsultaSql.Fields[29].Asstring;
    cony_fecnac:=DM1.ConsultaSql.Fields[30].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function Tpadron.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM padron WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
    DM1.ConsultaSQL.Close;
 end;

function Tpadron.Buscar2(id1,iddato1,id2,iddato2:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id1+' '+
    'FROM padron WHERE '+id1+'="'+iddato1+'" and '+id2+'="'+iddato2+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
    DM1.ConsultaSQL.Close;
 end;

function Tpadron.validar:smallint;
 begin
   result:=1;
 end;

function Tpadron.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO padron( '+
  'Idpadron,'+
  'Idadenda,'+
  'Codigo,'+
  'Idcaserio,'+
  'Oz,'+
  'Ambito,'+
  'Departamento,'+
  'Provincia,'+
  'Distrito,'+
  'Caserio,'+
  'Appaterno,'+
  'Apmaterno,'+
  'Nombre,'+
  'Dni,'+
  'Sexo,'+
  'Etnia,'+
  'Lengua,'+
  'Telefono,'+
  'Cony_Appaterno,'+
  'Cony_Apmaterno,'+
  'Cony_nombre,'+
  'Cony_dni,'+
  'Cony_sexo,'+
  'Cony_etnia,'+
  'Cony_lengua,'+
  'Anio_incorporacion,'+
  'Observaciones,'+
  'Justificacion,'+
  'editable, '+
  'fecNac, '+
  'cony_fecNac) '+
  'VALUES('+
  vcampostr(Idpadron)+','+
  vcampostr(Idadenda)+','+
  vcampostr(Codigo)+','+
  vcampostr(Idcaserio)+','+
  vcampostr(Oz)+','+
  vcampostr(Ambito)+','+
  vcampostr(Departamento)+','+
  vcampostr(Provincia)+','+
  vcampostr(Distrito)+','+
  vcampostr(Caserio)+','+
  vcampostr(Appaterno)+','+
  vcampostr(Apmaterno)+','+
  vcampostr(Nombre)+','+
  vcampostr(Dni)+','+
  vcampostr(Sexo)+','+
  vcampostr(Etnia)+','+
  vcampostr(Lengua)+','+
  vcampostr(Telefono)+','+
  vcampostr(Cony_Appaterno)+','+
  vcampostr(Cony_Apmaterno)+','+
  vcampostr(Cony_nombre)+','+
  vcampostr(Cony_dni)+','+
  vcampostr(Cony_sexo)+','+
  vcampostr(Cony_etnia)+','+
  vcampostr(Cony_lengua)+','+
  vcampostr(Anio_incorporacion)+','+
  vcampostr(Observaciones)+','+
  vcampostr(Justificacion)+','+
  vcampostr(editable)+','+
  vcampostrFecha(FecNac)+','+
  vcampostrFecha(cony_FecNac)+')',
  true);
end;

function Tpadron.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE padron SET '+
  'Idpadron='+vcampostr(Idpadron)+','+
  'Idadenda='+vcampostr(Idadenda)+','+
  'Codigo='+vcampostr(Codigo)+','+
  'Idcaserio='+vcampostr(Idcaserio)+','+
  'Oz='+vcampostr(Oz)+','+
  'Ambito='+vcampostr(Ambito)+','+
  'Departamento='+vcampostr(Departamento)+','+
  'Provincia='+vcampostr(Provincia)+','+
  'Distrito='+vcampostr(Distrito)+','+
  'Caserio='+vcampostr(Caserio)+','+
  'Appaterno='+vcampostr(Appaterno)+','+
  'Apmaterno='+vcampostr(Apmaterno)+','+
  'Nombre='+vcampostr(Nombre)+','+
  'Dni='+vcampostr(Dni)+','+
  'Sexo='+vcampostr(Sexo)+','+
  'Etnia='+vcampostr(Etnia)+','+
  'Lengua='+vcampostr(Lengua)+','+
  'Telefono='+vcampostr(Telefono)+','+
  'Cony_Appaterno='+vcampostr(Cony_Appaterno)+','+
  'Cony_Apmaterno='+vcampostr(Cony_Apmaterno)+','+
  'Cony_nombre='+vcampostr(Cony_nombre)+','+
  'Cony_dni='+vcampostr(Cony_dni)+','+
  'Cony_sexo='+vcampostr(Cony_sexo)+','+
  'Cony_etnia='+vcampostr(Cony_etnia)+','+
  'Cony_lengua='+vcampostr(Cony_lengua)+','+
  'Anio_incorporacion='+vcampostr(Anio_incorporacion)+','+
  'Observaciones='+vcampostr(Observaciones)+','+
  'Justificacion='+vcampostr(Justificacion)+','+
  'editable='+vcampostr(editable)+', '+
  'fecNac='+vcampostrFecha(fecNac)+', '+
  'cony_fecNac='+vcampostrFecha(cony_fecNac)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function Tpadron.Actualizar2(id1,iddato1,id2,iddato2 : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE padron SET '+
  'Idpadron='+vcampostr(Idpadron)+','+
  'Idadenda='+vcampostr(Idadenda)+','+
  'Codigo='+vcampostr(Codigo)+','+
  'Idcaserio='+vcampostr(Idcaserio)+','+
  'Oz='+vcampostr(Oz)+','+
  'Ambito='+vcampostr(Ambito)+','+
  'Departamento='+vcampostr(Departamento)+','+
  'Provincia='+vcampostr(Provincia)+','+
  'Distrito='+vcampostr(Distrito)+','+
  'Caserio='+vcampostr(Caserio)+','+
  'Appaterno='+vcampostr(Appaterno)+','+
  'Apmaterno='+vcampostr(Apmaterno)+','+
  'Nombre='+vcampostr(Nombre)+','+
  'Dni='+vcampostr(Dni)+','+
  'Sexo='+vcampostr(Sexo)+','+
  'Etnia='+vcampostr(Etnia)+','+
  'Lengua='+vcampostr(Lengua)+','+
  'Telefono='+vcampostr(Telefono)+','+
  'Cony_Appaterno='+vcampostr(Cony_Appaterno)+','+
  'Cony_Apmaterno='+vcampostr(Cony_Apmaterno)+','+
  'Cony_nombre='+vcampostr(Cony_nombre)+','+
  'Cony_dni='+vcampostr(Cony_dni)+','+
  'Cony_sexo='+vcampostr(Cony_sexo)+','+
  'Cony_etnia='+vcampostr(Cony_etnia)+','+
  'Cony_lengua='+vcampostr(Cony_lengua)+','+
  'Anio_incorporacion='+vcampostr(Anio_incorporacion)+','+
  'Observaciones='+vcampostr(Observaciones)+','+
  'Justificacion='+vcampostr(Justificacion)+','+
  'editable='+vcampostr(editable)+', '+
  'fecNac='+vcampostrFecha(fecNac)+', '+
  'cony_fecNac='+vcampostrFecha(cony_fecNac)+' '+
  'WHERE ('+id1+'='+vcampostr(iddato1)+') AND ('+id2+'='+vcampostr(iddato2)+');',
  true);
end;

function Tpadron.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from padron '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.
