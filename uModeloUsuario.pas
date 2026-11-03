unit uModeloUsuario;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
TUsuario = class
    Dni : string;
    Usuario : string;
    Clave : string;
    Cargo : string;
    Tipousuario : string;
    Permisos : string;
    Estado : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datDni,
    datUsuario,
    datClave,
    datCargo,
    datTipousuario,
    datPermisos,
    datEstado:string);
    procedure ObtenerRegistro(id,iddato:string);
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato : string):boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor TUsuario.Create;
begin
  limpiar;
end;

procedure TUsuario.limpiar;
begin
    Dni := '';
    Usuario := '';
    Clave := '';
    Cargo := '';
    Tipousuario := '';
    Permisos := '';
    Estado := '';
end;

procedure TUsuario.llenar(
    datDni,
    datUsuario,
    datClave,
    datCargo,
    datTipousuario,
    datPermisos,
    datEstado:string);
 begin
   Dni:=DatDni;
   Usuario:=DatUsuario;
   Clave:=DatClave;
   Cargo:=DatCargo;
   Tipousuario:=DatTipousuario;
   Permisos:=DatPermisos;
   Estado:=DatEstado;
 end;

procedure TUsuario.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Dni,Usuario,Clave,Cargo,Tipousuario,Permisos,Estado '+
    'FROM Usuario WHERE '+id+'="'+iddato+'"',true);
    Dni:=DM1.ConsultaSql.Fields[0].Asstring;
    Usuario:=DM1.ConsultaSql.Fields[1].Asstring;
    Clave:=DM1.ConsultaSql.Fields[2].Asstring;
    Cargo:=DM1.ConsultaSql.Fields[3].Asstring;
    Tipousuario:=DM1.ConsultaSql.Fields[4].Asstring;
    Permisos:=DM1.ConsultaSql.Fields[5].Asstring;
    Estado:=DM1.ConsultaSql.Fields[6].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function TUsuario.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM Usuario WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function TUsuario.validar:smallint;
 begin
   result:=1;
 end;

function TUsuario.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO Usuario( '+
  'Dni,'+
  'Usuario,'+
  'Clave,'+
  'Cargo,'+
  'Tipousuario,'+
  'Permisos,'+
  'Estado) '+
  'VALUES('+
  vcampostr(Dni)+','+
  vcampostr(Usuario)+','+
  vcampostr(Clave)+','+
  vcampostr(Cargo)+','+
  vcampostr(Tipousuario)+','+
  vcampostr(Permisos)+','+
  vcampostr(Estado)+')',
  true);
end;

function TUsuario.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE Usuario SET '+
  'Dni='+vcampostr(Dni)+','+
  'Usuario='+vcampostr(Usuario)+','+
  'Clave='+vcampostr(Clave)+','+
  'Cargo='+vcampostr(Cargo)+','+
  'Tipousuario='+vcampostr(Tipousuario)+','+
  'Permisos='+vcampostr(Permisos)+','+
  'Estado='+vcampostr(Estado)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function TUsuario.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from Usuario '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.

