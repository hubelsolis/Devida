unit uModeloActividad;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
TActividad = class
    Idactividad : string;
    Nombre : string;
    DNI_coordinador : string;
    Tipoactividad : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datIdactividad,
    datNombre,
    datDNI_coordinador,
    datTipoactividad:string);
    procedure ObtenerRegistro(id,iddato:string);
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato : string):boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor TActividad.Create;
begin
  limpiar;
end;

procedure TActividad.limpiar;
begin
    Idactividad := '';
    Nombre := '';
    Tipoactividad := '';
    DNI_coordinador:='';
end;

procedure TActividad.llenar(
    datIdactividad,
    datNombre,
    datDNI_coordinador,
    datTipoactividad:string);
 begin
   Idactividad:=DatIdactividad;
   Nombre:=DatNombre;
   DNI_coordinador:=datDNI_coordinador;
   Tipoactividad:=DatTipoactividad;
 end;

procedure TActividad.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idactividad,Nombre,Tipoactividad,DNI_coordinador '+
    'FROM Actividad WHERE '+id+'="'+iddato+'"',true);
    Idactividad:=DM1.ConsultaSql.Fields[0].Asstring;
    Nombre:=DM1.ConsultaSql.Fields[1].Asstring;
    Tipoactividad:=DM1.ConsultaSql.Fields[2].Asstring;
    DNI_coordinador:=DM1.ConsultaSQL.Fields[3].AsString;
    DM1.ConsultaSQL.Close;
 end;

function TActividad.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM Actividad WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function TActividad.validar:smallint;
 begin
   result:=1;
 end;

function TActividad.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO Actividad( '+
  'Idactividad,'+
  'Nombre,'+
  'DNI_coordinador,'+
  'Tipoactividad) '+
  'VALUES('+
  vcampostr(Idactividad)+','+
  vcampostr(Nombre)+','+
  vcampostr(DNI_coordinador)+','+
  vcampostr(Tipoactividad)+')',
  true);
end;

function TActividad.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE Actividad SET '+
  'Idactividad='+vcampostr(Idactividad)+','+
  'Nombre='+vcampostr(Nombre)+','+
  'DNI_coordinador='+vcampostr(DNI_coordinador)+','+
  'Tipoactividad='+vcampostr(Tipoactividad)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function TActividad.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from Actividad '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.
