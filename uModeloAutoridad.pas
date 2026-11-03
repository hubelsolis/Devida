unit uModeloAutoridad;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
TAutoridad = class
    Idcaserio : string;
    Dni : string;
    Fecha : string;
    Cargo : string;
    Resolucion : string;
    Telefono : string;
    Estado : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datIdcaserio,
    datDni,
    datFecha,
    datCargo,
    datResolucion,
    datTelefono,
    datEstado:string);
    procedure ObtenerRegistro(id,iddato:string); overload;
    procedure ObtenerRegistro(id,iddato,id2,iddato2:string); overload;
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function insertar_actualizar:boolean;
    function actualizar(id,iddato : string):boolean;
    function Actualizar2(id,iddato,id2,iddato2 : string):boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor TAutoridad.Create;
begin
  limpiar;
end;

procedure TAutoridad.limpiar;
begin
    Idcaserio := '';
    Dni := '';
    Fecha := '';
    Cargo := '';
    Resolucion := '';
    Estado := '';
    telefono := '';
end;

procedure TAutoridad.llenar(
    datIdcaserio,
    datDni,
    datFecha,
    datCargo,
    datResolucion,
    datTelefono,
    datEstado:string);
 begin
   Idcaserio:=DatIdcaserio;
   Dni:=DatDni;
   Fecha:=DatFecha;
   Cargo:=DatCargo;
   Resolucion:=DatResolucion;
   Telefono:=datTelefono;
   Estado:=DatEstado;
 end;

procedure TAutoridad.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idcaserio,Dni,Fecha,Cargo,Resolucion,Estado,Telefono '+
    'FROM Autoridad WHERE '+id+'="'+iddato+'"',true);
    Idcaserio:=DM1.ConsultaSql.Fields[0].Asstring;
    Dni:=DM1.ConsultaSql.Fields[1].Asstring;
    Fecha:=DM1.ConsultaSql.Fields[2].Asstring;
    Cargo:=DM1.ConsultaSql.Fields[3].Asstring;
    Resolucion:=DM1.ConsultaSql.Fields[4].Asstring;
    Estado:=DM1.ConsultaSql.Fields[5].Asstring;
    Telefono:=DM1.ConsultaSql.Fields[6].Asstring;
    DM1.ConsultaSQL.Close;
 end;

procedure TAutoridad.ObtenerRegistro(id,iddato,id2,iddato2:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idcaserio,Dni,Fecha,Cargo,Resolucion,Estado,telefono '+
    'FROM Autoridad WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'"',true);
    Idcaserio:=DM1.ConsultaSql.Fields[0].Asstring;
    Dni:=DM1.ConsultaSql.Fields[1].Asstring;
    Fecha:=DM1.ConsultaSql.Fields[2].Asstring;
    Cargo:=DM1.ConsultaSql.Fields[3].Asstring;
    Resolucion:=DM1.ConsultaSql.Fields[4].Asstring;
    Estado:=DM1.ConsultaSql.Fields[5].Asstring;
    Telefono:=DM1.ConsultaSql.Fields[6].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function TAutoridad.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM Autoridad WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function TAutoridad.validar:smallint;
 begin
   result:=1;
 end;

function TAutoridad.Insertar:boolean;
begin
  if dni='' then
    result:=false
  else
  BEGIN
  result :=
  EjecutaSQL(
  'INSERT INTO Autoridad( '+
  'Idcaserio,'+
  'Dni,'+
  'Fecha,'+
  'Cargo,'+
  'Resolucion,'+
  'telefono,'+
  'Estado) '+
  'VALUES('+
  vcampostr(Idcaserio)+','+
  vcampostr(Dni)+','+
  vcampostr(Fecha)+','+
  vcampostr(Cargo)+','+
  vcampostr(Resolucion)+','+
  vcampostr(Telefono)+','+
  vcampostr(Estado)+')',
  true);
  END;
end;

function TAutoridad.insertar_actualizar:boolean;
var c : array[1..6] of string;
    v : array[1..6] of string;
begin

  if dni='' then
    result:=false
  else
  BEGIN

  if estado='' then begin c[1]:=''; v[1]:=''; end else begin c[1]:='estado,'; v[1]:=vcampostr(estado)+','; end;
  if Idcaserio='' then begin c[2]:=''; v[2]:=''; end else begin c[2]:='Idcaserio,'; v[2]:=vcampostr(Idcaserio)+','; end;
  if Fecha='' then begin c[3]:=''; v[3]:=''; end else begin c[3]:='Fecha,'; v[3]:=vcampostr(Fecha)+','; end;
  if Cargo='' then begin c[4]:=''; v[4]:=''; end else begin c[4]:='Cargo,'; v[4]:=vcampostr(Cargo)+','; end;
  if Resolucion='' then begin c[5]:=''; v[5]:=''; end else begin c[5]:='Resolucion,'; v[5]:=vcampostr(Resolucion)+','; end;
  if Telefono='' then begin c[6]:=''; v[6]:=''; end else begin c[6]:='Telefono,'; v[6]:=vcampostr(Telefono)+','; end;

  result :=
  EjecutaSQL(
  'UPDATE OR INSERT INTO Autoridad( '+
  c[1]+
  c[2]+
  c[3]+
  c[4]+
  c[5]+
  c[6]+
  'dni) '+
  'VALUES('+
  v[1]+
  v[2]+
  v[3]+
  v[4]+
  v[5]+
  v[6]+
  vcampostr(dni)+') '+
  'matching (dni)',
  true)
  END;
end;

function TAutoridad.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE Autoridad SET '+
  'Idcaserio='+vcampostr(Idcaserio)+','+
  'Dni='+vcampostr(Dni)+','+
  'Fecha='+vcampostr(Fecha)+','+
  'Cargo='+vcampostr(Cargo)+','+
  'Resolucion='+vcampostr(Resolucion)+','+
  'telefono='+vcampostr(telefono)+','+
  'Estado='+vcampostr(Estado)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function TAutoridad.Actualizar2(id,iddato,id2,iddato2 : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE Autoridad SET '+
  'Idcaserio='+vcampostr(Idcaserio)+','+
  'Dni='+vcampostr(Dni)+','+
  'Fecha='+vcampostr(Fecha)+','+
  'Cargo='+vcampostr(Cargo)+','+
  'Resolucion='+vcampostr(Resolucion)+','+
  'telefono='+vcampostr(telefono)+','+
  'Estado='+vcampostr(Estado)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+' and '+id2+'='+vcampostr(iddato2)+';',
  true);
end;
function TAutoridad.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from Autoridad '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.
