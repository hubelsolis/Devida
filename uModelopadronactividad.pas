unit uModeloPadronActividad;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
TPadronActividad = class
    Idpadron : string;
    Idactividad : string;
    Idetapa : string;
    Orden : string;
    Coorx : string;
    Coory : string;
    Altitud : string;
    Has : string;
    Anio_instalacion : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datIdpadron,
    datIdactividad,
    datIdetapa,
    datOrden,
    datCoorx,
    datCoory,
    datAltitud,
    datHas,
    datAnio_instalacion:string);
    procedure ObtenerRegistro(id,iddato:string);
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato : string):boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor TPadronActividad.Create;
begin
  limpiar;
end;

procedure TPadronActividad.limpiar;
begin
    Idpadron := '';
    Idactividad := '';
    Idetapa := '';
    Orden := '';
    Coorx := '';
    Coory := '';
    Altitud := '';
    Has := '';
    Anio_instalacion := '';
end;

procedure TPadronActividad.llenar(
    datIdpadron,
    datIdactividad,
    datIdetapa,
    datOrden,
    datCoorx,
    datCoory,
    datAltitud,
    datHas,
    datAnio_instalacion:string);
 begin
   Idpadron:=DatIdpadron;
   Idactividad:=DatIdactividad;
   Idetapa:=DatIdetapa;
   Orden:=DatOrden;
   Coorx:=DatCoorx;
   Coory:=DatCoory;
   Altitud:=DatAltitud;
   Has:=DatHas;
   Anio_instalacion:=DatAnio_instalacion;
 end;

procedure TPadronActividad.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idpadron,Idactividad,Idetapa,Orden,Coorx,Coory,Altitud,Has,Anio_instalacion '+
    'FROM PadronActividad WHERE '+id+'="'+iddato+'"',true);
    Idpadron:=DM1.ConsultaSql.Fields[0].Asstring;
    Idactividad:=DM1.ConsultaSql.Fields[1].Asstring;
    Idetapa:=DM1.ConsultaSql.Fields[2].Asstring;
    Orden:=DM1.ConsultaSql.Fields[3].Asstring;
    Coorx:=DM1.ConsultaSql.Fields[4].Asstring;
    Coory:=DM1.ConsultaSql.Fields[5].Asstring;
    Altitud:=DM1.ConsultaSql.Fields[6].Asstring;
    Has:=DM1.ConsultaSql.Fields[7].Asstring;
    Anio_instalacion:=DM1.ConsultaSql.Fields[8].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function TPadronActividad.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM PadronActividad WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function TPadronActividad.validar:smallint;
 begin
   result:=1;
 end;

function TPadronActividad.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO PadronActividad( '+
  'Idpadron,'+
  'Idactividad,'+
  'Idetapa,'+
  'Orden,'+
  'Coorx,'+
  'Coory,'+
  'Altitud,'+
  'Has,'+
  'Anio_instalacion) '+
  'VALUES('+
  vcampostr(Idpadron)+','+
  vcampostr(Idactividad)+','+
  vcampostr(Idetapa)+','+
  vcampostr(Orden)+','+
  vcampostr(Coorx)+','+
  vcampostr(Coory)+','+
  vcampostr(Altitud)+','+
  vcampostr(Has)+','+
  vcampostr(Anio_instalacion)+')',
  true);
end;

function TPadronActividad.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE PadronActividad SET '+
  'Idpadron='+vcampostr(Idpadron)+','+
  'Idactividad='+vcampostr(Idactividad)+','+
  'Idetapa='+vcampostr(Idetapa)+','+
  'Orden='+vcampostr(Orden)+','+
  'Coorx='+vcampostr(Coorx)+','+
  'Coory='+vcampostr(Coory)+','+
  'Altitud='+vcampostr(Altitud)+','+
  'Has='+vcampostr(Has)+','+
  'Anio_instalacion='+vcampostr(Anio_instalacion)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function TPadronActividad.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from PadronActividad '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.
