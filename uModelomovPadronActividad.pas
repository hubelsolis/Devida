unit uModelomovPadronactividad;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
TmovPadronactividad = class
    Idmovpadron : string;
    Idactividad : string;
    Idetapa : string;
    Has : string;
    Has_mov : string;
    Coorx : string;
    Coory : string;
    Altitud : string;
    Anio_instalacion : string;
    Orden : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datIdmovpadron,
    datIdactividad,
    datIdetapa,
    datHas,
    datHas_mov,
    datCoorx,
    datCoory,
    datAltitud,
    datAnio_instalacion,
    datOrden:string);
    procedure ObtenerRegistro(id,iddato:string);
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato : string):boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor TmovPadronactividad.Create;
begin
  limpiar;
end;

procedure TmovPadronactividad.limpiar;
begin
    Idmovpadron := '';
    Idactividad := '';
    Idetapa := '';
    Has := '';
    Has_mov := '';
    Coorx := '';
    Coory := '';
    Altitud := '';
    Anio_instalacion := '';
    Orden := '';
end;

procedure TmovPadronactividad.llenar(
    datIdmovpadron,
    datIdactividad,
    datIdetapa,
    datHas,
    datHas_mov,
    datCoorx,
    datCoory,
    datAltitud,
    datAnio_instalacion,
    datOrden:string);
 begin
   Idmovpadron:=DatIdmovpadron;
   Idactividad:=DatIdactividad;
   Idetapa:=DatIdetapa;
   Has:=DatHas;
   Has_mov:=DatHas_mov;
   Coorx:=DatCoorx;
   Coory:=DatCoory;
   Altitud:=DatAltitud;
   Anio_instalacion:=DatAnio_instalacion;
   Orden:=DatOrden;
 end;

procedure TmovPadronactividad.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idmovpadron,Idactividad,Idetapa,Has,Has_mov,Coorx,Coory,Altitud,Anio_instalacion,Orden '+
    'FROM movPadronactividad WHERE '+id+'="'+iddato+'"',true);
    Idmovpadron:=DM1.ConsultaSql.Fields[0].Asstring;
    Idactividad:=DM1.ConsultaSql.Fields[1].Asstring;
    Idetapa:=DM1.ConsultaSql.Fields[2].Asstring;
    Has:=DM1.ConsultaSql.Fields[3].Asstring;
    Has_mov:=DM1.ConsultaSql.Fields[4].Asstring;
    Coorx:=DM1.ConsultaSql.Fields[5].Asstring;
    Coory:=DM1.ConsultaSql.Fields[6].Asstring;
    Altitud:=DM1.ConsultaSql.Fields[7].Asstring;
    Anio_instalacion:=DM1.ConsultaSql.Fields[8].Asstring;
    Orden:=DM1.ConsultaSql.Fields[9].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function TmovPadronactividad.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM movPadronactividad WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function TmovPadronactividad.validar:smallint;
 begin
   result:=1;
 end;

function TmovPadronactividad.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO movPadronactividad( '+
  'Idmovpadron,'+
  'Idactividad,'+
  'Idetapa,'+
  'Has,'+
  'Has_mov,'+
  'Coorx,'+
  'Coory,'+
  'Altitud,'+
  'Anio_instalacion,'+
  'Orden) '+
  'VALUES('+
  vcampostr(Idmovpadron)+','+
  vcampostr(Idactividad)+','+
  vcampostr(Idetapa)+','+
  vcampostr(Has)+','+
  vcampostr(Has_mov)+','+
  vcampostr(Coorx)+','+
  vcampostr(Coory)+','+
  vcampostr(Altitud)+','+
  vcampostr(Anio_instalacion)+','+
  vcampostr(Orden)+')',
  true);
end;

function TmovPadronactividad.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE movPadronactividad SET '+
  'Idmovpadron='+vcampostr(Idmovpadron)+','+
  'Idactividad='+vcampostr(Idactividad)+','+
  'Idetapa='+vcampostr(Idetapa)+','+
  'Has='+vcampostr(Has)+','+
  'Has_mov='+vcampostr(Has_mov)+','+
  'Coorx='+vcampostr(Coorx)+','+
  'Coory='+vcampostr(Coory)+','+
  'Altitud='+vcampostr(Altitud)+','+
  'Anio_instalacion='+vcampostr(Anio_instalacion)+','+
  'Orden='+vcampostr(Orden)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function TmovPadronactividad.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from movPadronactividad '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.
