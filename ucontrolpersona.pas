unit ucontrolpersona;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
TPersona = class
    Dni : string;
    Apellido_paterno : string;
    Apellido_materno : string;
    Nombre    : string;
    Fecnac    : string;
    Telefono  : string;
    Direccion : string;
    procedure limpiar;
    Constructor Create;
    function validar:smallint;
    function guardar:boolean;
    function editar(id,iddato : string):boolean;
  end;

implementation

procedure TPersona.limpiar;
begin
    Dni := '';
    Apellido_paterno := '';
    Apellido_materno := '';
    Nombre    := '';
    Fecnac    := '';
    Telefono  := '';
    Direccion := '';
end;

Constructor TPersona.Create;
begin
  limpiar;
end;

function TPersona.validar:smallint;
 begin
   result:=1;
 end;

function TPersona.guardar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO persona(Dni,Apellido_paterno,Apellido_materno,Nombre,Fecnac,Telefono,Direccion)'+
  'VALUES('+
  vcampostr(Dni)+','+
  vcampostr(Apellido_paterno)+','+
  vcampostr(Apellido_materno)+','+
  vcampostr(Nombre)+','+
  vcampostr(Fecnac)+','+
  vcampostr(Telefono)+','+
  vcampostr(Direccion)+');',
  true);
end;

function TPersona.editar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE persona SET '+
  'Apellido_paterno='+vcampostr(Apellido_paterno)+','+
  'Apellido_materno='+vcampostr(Apellido_materno)+','+
  'Nombre='+vcampostr(Nombre)+','+
  'Fecnac='+vcampostr(Fecnac)+','+
  'Telefono='+vcampostr(Telefono)+','+
  'Direccion='+vcampostr(Direccion)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.
