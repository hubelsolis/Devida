unit uModelopersona;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
Tpersona = class
    Dni : string;
    Appaterno : string;
    Apmaterno : string;
    Nombre : string;
    Fecnac : string;
    Telefono : string;
    Direccion : string;
    Sexo : string;
    Etnia : string;
    Lengua : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datDni,
    datAppaterno,
    datApmaterno,
    datNombre,
    datFecnac,
    datTelefono,
    datDireccion,
    datSexo,
    datEtnia,
    datLengua:string);
    procedure ObtenerRegistro(id,iddato:string);
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato : string):boolean;
    function insertar_actualizar:boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor Tpersona.Create;
begin
  limpiar;
end;

procedure Tpersona.limpiar;
begin
    Dni := '';
    Appaterno := '';
    Apmaterno := '';
    Nombre := '';
    Fecnac := '';
    Telefono := '';
    Direccion := '';
    Sexo := '';
    Etnia := '';
    Lengua := '';
end;

procedure Tpersona.llenar(
    datDni,
    datAppaterno,
    datApmaterno,
    datNombre,
    datFecnac,
    datTelefono,
    datDireccion,
    datSexo,
    datEtnia,
    datLengua:string);
 begin
   Dni:=DatDni;
   Appaterno:=DatAppaterno;
   Apmaterno:=DatApmaterno;
   Nombre:=DatNombre;
   Fecnac:=DatFecnac;
   Telefono:=DatTelefono;
   Direccion:=DatDireccion;
   Sexo:=DatSexo;
   Etnia:=DatEtnia;
   Lengua:=DatLengua;
 end;

procedure Tpersona.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Dni,Appaterno,Apmaterno,Nombre,Fecnac,Telefono,Direccion,Sexo,Etnia,Lengua '+
    'FROM persona WHERE '+id+'="'+iddato+'"',true);
    Dni:=DM1.ConsultaSql.Fields[0].Asstring;
    Appaterno:=DM1.ConsultaSql.Fields[1].Asstring;
    Apmaterno:=DM1.ConsultaSql.Fields[2].Asstring;
    Nombre:=DM1.ConsultaSql.Fields[3].Asstring;
    Fecnac:=DM1.ConsultaSql.Fields[4].Asstring;
    Telefono:=DM1.ConsultaSql.Fields[5].Asstring;
    Direccion:=DM1.ConsultaSql.Fields[6].Asstring;
    Sexo:=DM1.ConsultaSql.Fields[7].Asstring;
    Etnia:=DM1.ConsultaSql.Fields[8].Asstring;
    Lengua:=DM1.ConsultaSql.Fields[9].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function Tpersona.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM persona WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function Tpersona.validar:smallint;
 begin
   result:=1;
 end;

function Tpersona.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO persona( '+
  'Dni,'+
  'Appaterno,'+
  'Apmaterno,'+
  'Nombre,'+
  'Fecnac,'+
  'Telefono,'+
  'Direccion,'+
  'Sexo,'+
  'Etnia,'+
  'Lengua) '+
  'VALUES('+
  vcampostr(Dni)+','+
  vcampostr(Appaterno)+','+
  vcampostr(Apmaterno)+','+
  vcampostr(Nombre)+','+
  vcampostrFecha(Fecnac)+','+
  vcampostr(Telefono)+','+
  vcampostr(Direccion)+','+
  vcampostr(Sexo)+','+
  vcampostr(Etnia)+','+
  vcampostr(Lengua)+')',
  true);
end;

function Tpersona.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE persona SET '+
  'Dni='+vcampostr(Dni)+','+
  'Appaterno='+vcampostr(Appaterno)+','+
  'Apmaterno='+vcampostr(Apmaterno)+','+
  'Nombre='+vcampostr(Nombre)+','+
  'Fecnac='+vcampostrFecha(Fecnac)+','+
  'Telefono='+vcampostr(Telefono)+','+
  'Direccion='+vcampostr(Direccion)+','+
  'Sexo='+vcampostr(Sexo)+','+
  'Etnia='+vcampostr(Etnia)+','+
  'Lengua='+vcampostr(Lengua)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function Tpersona.insertar_actualizar:boolean;
var c : array[1..10] of string;
    v : array[1..10] of string;
begin
  if dni='' then
    result:=false
  else
  BEGIN

  if Lengua='' then begin c[1]:=''; v[1]:=''; end else begin c[1]:='Lengua,'; v[1]:=vcampostr(Lengua)+','; end;
  if Appaterno='' then begin c[2]:=''; v[2]:=''; end else begin c[2]:='Appaterno,'; v[2]:=vcampostr(Appaterno)+','; end;
  if Apmaterno='' then begin c[3]:=''; v[3]:=''; end else begin c[3]:='Apmaterno,'; v[3]:=vcampostr(Apmaterno)+','; end;
  if Nombre='' then begin c[4]:=''; v[4]:=''; end else begin c[4]:='Nombre,'; v[4]:=vcampostr(Nombre)+','; end;
  if Fecnac='' then begin c[5]:=''; v[5]:=''; end else begin c[5]:='Fecnac,'; v[5]:=vcampostrFecha(Fecnac)+','; end;
  if Telefono='' then begin c[6]:=''; v[6]:=''; end else begin c[6]:='Telefono,'; v[6]:=vcampostr(Telefono)+','; end;
  if Direccion='' then begin c[7]:=''; v[7]:=''; end else begin c[7]:='Direccion,'; v[7]:=vcampostr(Direccion)+','; end;
  if Sexo='' then begin c[8]:=''; v[8]:=''; end else begin c[8]:='Sexo,'; v[8]:=vcampostr(Sexo)+','; end;
  if Etnia='' then begin c[9]:=''; v[9]:=''; end else begin c[9]:='Etnia,'; v[9]:=vcampostr(Etnia)+','; end;

 result :=
  EjecutaSQL(
  'update or insert INTO persona( '+
   c[1]+
   c[2]+
   c[3]+
   c[4]+
   c[5]+
   c[6]+
   c[7]+
   c[8]+
   c[9]+
  'dni) '+
  'VALUES('+
   v[1]+
   v[2]+
   v[3]+
   v[4]+
   v[5]+
   v[6]+
   v[7]+
   v[8]+
   v[9]+
   vcampostr(dni)+') '+
   'matching (dni)',
  true);
  END;
end;

function Tpersona.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from persona '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.
