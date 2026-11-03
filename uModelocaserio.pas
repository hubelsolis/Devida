unit uModelocaserio;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
Tcaserio = class
    Idcaserio : string;
    Oz : string;
    Ambito : string;
    Departamento : string;
    Provincia : string;
    Distrito : string;
    Caserio : string;
    Region_natural : string;
    Coorx : string;
    Coory : string;
    Altitud : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datIdcaserio,
    datOz,
    datAmbito,
    datDepartamento,
    datProvincia,
    datDistrito,
    datCaserio,
    datRegion_natural,
    datCoorx,
    datCoory,
    datAltitud:string);
    procedure ObtenerRegistro(id,iddato:string);
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function insertar_actualizar:boolean;
    function actualizar(id,iddato : string):boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor Tcaserio.Create;
begin
  limpiar;
end;

procedure Tcaserio.limpiar;
begin
    Idcaserio := '';
    Oz := '';
    Ambito := '';
    Departamento := '';
    Provincia := '';
    Distrito := '';
    Caserio := '';
    Region_natural := '';
    Coorx := '';
    Coory := '';
    Altitud := '';
end;

procedure Tcaserio.llenar(
    datIdcaserio,
    datOz,
    datAmbito,
    datDepartamento,
    datProvincia,
    datDistrito,
    datCaserio,
    datRegion_natural,
    datCoorx,
    datCoory,
    datAltitud:string);
 begin
   Idcaserio:=DatIdcaserio;
   Oz:=DatOz;
   Ambito:=DatAmbito;
   Departamento:=DatDepartamento;
   Provincia:=DatProvincia;
   Distrito:=DatDistrito;
   Caserio:=DatCaserio;
   Region_natural:=DatRegion_natural;
   Coorx:=DatCoorx;
   Coory:=DatCoory;
   Altitud:=DatAltitud;
 end;

procedure Tcaserio.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idcaserio,Oz,Ambito,Departamento,Provincia,Distrito,Caserio,Region_natural,Coorx,Coory,Altitud '+
    'FROM caserio WHERE '+id+'="'+iddato+'"',true);
    Idcaserio:=DM1.ConsultaSql.Fields[0].Asstring;
    Oz:=DM1.ConsultaSql.Fields[1].Asstring;
    Ambito:=DM1.ConsultaSql.Fields[2].Asstring;
    Departamento:=DM1.ConsultaSql.Fields[3].Asstring;
    Provincia:=DM1.ConsultaSql.Fields[4].Asstring;
    Distrito:=DM1.ConsultaSql.Fields[5].Asstring;
    Caserio:=DM1.ConsultaSql.Fields[6].Asstring;
    Region_natural:=DM1.ConsultaSql.Fields[7].Asstring;
    Coorx:=DM1.ConsultaSql.Fields[8].Asstring;
    Coory:=DM1.ConsultaSql.Fields[9].Asstring;
    Altitud:=DM1.ConsultaSql.Fields[10].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function Tcaserio.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM caserio WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function Tcaserio.validar:smallint;
 begin
   result:=1;
 end;

function Tcaserio.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO caserio( '+
  'Idcaserio,'+
  'Oz,'+
  'Ambito,'+
  'Departamento,'+
  'Provincia,'+
  'Distrito,'+
  'Caserio,'+
  'Region_natural,'+
  'Coorx,'+
  'Coory,'+
  'Altitud) '+
  'VALUES('+
  vcampostr(Idcaserio)+','+
  vcampostr(Oz)+','+
  vcampostr(Ambito)+','+
  vcampostr(Departamento)+','+
  vcampostr(Provincia)+','+
  vcampostr(Distrito)+','+
  vcampostr(Caserio)+','+
  vcampostr(Region_natural)+','+
  vcampostr(Coorx)+','+
  vcampostr(Coory)+','+
  vcampostr(Altitud)+')',
  true);
end;

function Tcaserio.insertar_actualizar:boolean;
var c : array[1..10] of string;
    v : array[1..10] of string;
begin
  if Idcaserio='' then
    result:=false
  else
  BEGIN

  if oz='' then begin c[1]:=''; v[1]:=''; end else begin c[1]:='Oz,'; v[1]:=vcampostr(Oz)+','; end;
  if Ambito='' then begin c[2]:=''; v[2]:=''; end else begin c[2]:='Ambito,'; v[2]:=vcampostr(Ambito)+','; end;
  if Departamento='' then begin c[3]:=''; v[3]:=''; end else begin c[3]:='Departamento,'; v[3]:=vcampostr(Departamento)+','; end;
  if Provincia='' then begin c[4]:=''; v[4]:=''; end else begin c[4]:='Provincia,'; v[4]:=vcampostr(Provincia)+','; end;
  if Distrito='' then begin c[5]:=''; v[5]:=''; end else begin c[5]:='Distrito,'; v[5]:=vcampostr(Distrito)+','; end;
  if Caserio='' then begin c[6]:=''; v[6]:=''; end else begin c[6]:='Caserio,'; v[6]:=vcampostr(Caserio)+','; end;
  if Region_natural='' then begin c[7]:=''; v[7]:=''; end else begin c[7]:='Region_natural,'; v[7]:=vcampostr(Region_natural)+','; end;
  if Coorx='' then begin c[8]:=''; v[8]:=''; end else begin c[8]:='Coorx,'; v[8]:=vcampostr(Coorx)+','; end;
  if Coory='' then begin c[9]:=''; v[9]:=''; end else begin c[9]:='Coory,'; v[9]:=vcampostr(Coory)+','; end;
  if Altitud='' then begin c[10]:=''; v[10]:=''; end else begin c[10]:='Altitud,'; v[10]:=vcampostr(Altitud)+''; end;

  result :=
  EjecutaSQL(
  'update or INSERT INTO caserio( '+
   c[1]+
   c[2]+
   c[3]+
   c[4]+
   c[5]+
   c[6]+
   c[7]+
   c[8]+
   c[9]+
   c[10]+
  'Idcaserio)'+
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
  v[10]+
  vcampostr(Idcaserio)+') '+
  'matching (Idcaserio) ',
  true);
  END;
end;

function Tcaserio.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE caserio SET '+
  'Idcaserio='+vcampostr(Idcaserio)+','+
  'Oz='+vcampostr(Oz)+','+
  'Ambito='+vcampostr(Ambito)+','+
  'Departamento='+vcampostr(Departamento)+','+
  'Provincia='+vcampostr(Provincia)+','+
  'Distrito='+vcampostr(Distrito)+','+
  'Caserio='+vcampostr(Caserio)+','+
  'Region_natural='+vcampostr(Region_natural)+','+
  'Coorx='+vcampostr(Coorx)+','+
  'Coory='+vcampostr(Coory)+','+
  'Altitud='+vcampostr(Altitud)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function Tcaserio.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from caserio '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.
