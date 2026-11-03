unit uModeloSIMDEV;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
TSIMDEV = class
    Idsimdev : string;
    Almacen : string;
    Ambito : string;
    Dnisupervisor : string;
    Diacampo : string;
    Dniextensionistaambiental : string;
    Dniextensionista : string;
    Dnitecnico : string;
    Idcaserio : string;
    Dnititular : string;
    Idactividad : string;
    Hinst : string;
    Hcrec : string;
    Hprod : string;
    Coordx : string;
    Coordy : string;
    Altitud : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datIdsimdev,
    datAlmacen,
    datAmbito,
    datDnisupervisor,
    datDiacampo,
    datDniextensionistaambiental,
    datDniextensionista,
    datDnitecnico,
    datIdcaserio,
    datDnititular,
    datIdactividad,
    datHinst,
    datHcrec,
    datHprod,
    datCoordx,
    datCoordy,
    datAltitud:string);
    procedure ObtenerRegistro(id,iddato:string);
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato : string):boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor TSIMDEV.Create;
begin
  limpiar;
end;

procedure TSIMDEV.limpiar;
begin
    Idsimdev := '';
    Almacen := '';
    Ambito := '';
    Dnisupervisor := '';
    Diacampo := '';
    Dniextensionistaambiental := '';
    Dniextensionista := '';
    Dnitecnico := '';
    Idcaserio := '';
    Dnititular := '';
    Idactividad := '';
    Hinst := '';
    Hcrec := '';
    Hprod := '';
    Coordx := '';
    Coordy := '';
    Altitud := '';
end;

procedure TSIMDEV.llenar(
    datIdsimdev,
    datAlmacen,
    datAmbito,
    datDnisupervisor,
    datDiacampo,
    datDniextensionistaambiental,
    datDniextensionista,
    datDnitecnico,
    datIdcaserio,
    datDnititular,
    datIdactividad,
    datHinst,
    datHcrec,
    datHprod,
    datCoordx,
    datCoordy,
    datAltitud:string);
 begin
   Idsimdev:=DatIdsimdev;
   Almacen:=DatAlmacen;
   Ambito:=DatAmbito;
   Dnisupervisor:=DatDnisupervisor;
   Diacampo:=DatDiacampo;
   Dniextensionistaambiental:=DatDniextensionistaambiental;
   Dniextensionista:=DatDniextensionista;
   Dnitecnico:=DatDnitecnico;
   Idcaserio:=DatIdcaserio;
   Dnititular:=DatDnititular;
   Idactividad:=DatIdactividad;
   Hinst:=DatHinst;
   Hcrec:=DatHcrec;
   Hprod:=DatHprod;
   Coordx:=DatCoordx;
   Coordy:=DatCoordy;
   Altitud:=DatAltitud;
 end;

procedure TSIMDEV.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idsimdev,Almacen,Ambito,Dnisupervisor,Diacampo,Dniextensionistaambiental,Dniextensionista,Dnitecnico,Idcaserio,Dnititular,Idactividad,Hinst,Hcrec,Hprod,Coordx,Coordy,Altitud '+
    'FROM SIMDEV WHERE '+id+'="'+iddato+'"',true);
    Idsimdev:=DM1.ConsultaSql.Fields[0].Asstring;
    Almacen:=DM1.ConsultaSql.Fields[1].Asstring;
    Ambito:=DM1.ConsultaSql.Fields[2].Asstring;
    Dnisupervisor:=DM1.ConsultaSql.Fields[3].Asstring;
    Diacampo:=DM1.ConsultaSql.Fields[4].Asstring;
    Dniextensionistaambiental:=DM1.ConsultaSql.Fields[5].Asstring;
    Dniextensionista:=DM1.ConsultaSql.Fields[6].Asstring;
    Dnitecnico:=DM1.ConsultaSql.Fields[7].Asstring;
    Idcaserio:=DM1.ConsultaSql.Fields[8].Asstring;
    Dnititular:=DM1.ConsultaSql.Fields[9].Asstring;
    Idactividad:=DM1.ConsultaSql.Fields[10].Asstring;
    Hinst:=DM1.ConsultaSql.Fields[11].Asstring;
    Hcrec:=DM1.ConsultaSql.Fields[12].Asstring;
    Hprod:=DM1.ConsultaSql.Fields[13].Asstring;
    Coordx:=DM1.ConsultaSql.Fields[14].Asstring;
    Coordy:=DM1.ConsultaSql.Fields[15].Asstring;
    Altitud:=DM1.ConsultaSql.Fields[16].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function TSIMDEV.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM SIMDEV WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function TSIMDEV.validar:smallint;
 begin
   result:=1;
 end;

function TSIMDEV.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO SIMDEV( '+
  'Idsimdev,'+
  'Almacen,'+
  'Ambito,'+
  'Dnisupervisor,'+
  'Diacampo,'+
  'Dniextensionistaambiental,'+
  'Dniextensionista,'+
  'Dnitecnico,'+
  'Idcaserio,'+
  'Dnititular,'+
  'Idactividad,'+
  'Hinst,'+
  'Hcrec,'+
  'Hprod,'+
  'Coordx,'+
  'Coordy,'+
  'Altitud) '+
  'VALUES('+
  vcampostr(Idsimdev)+','+
  vcampostr(Almacen)+','+
  vcampostr(Ambito)+','+
  vcampostr(Dnisupervisor)+','+
  vcampostr(Diacampo)+','+
  vcampostr(Dniextensionistaambiental)+','+
  vcampostr(Dniextensionista)+','+
  vcampostr(Dnitecnico)+','+
  vcampostr(Idcaserio)+','+
  vcampostr(Dnititular)+','+
  vcampostr(Idactividad)+','+
  vcampostr(Hinst)+','+
  vcampostr(Hcrec)+','+
  vcampostr(Hprod)+','+
  vcampostr(Coordx)+','+
  vcampostr(Coordy)+','+
  vcampostr(Altitud)+')',
  true);
end;

function TSIMDEV.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE SIMDEV SET '+
  'Idsimdev='+vcampostr(Idsimdev)+','+
  'Almacen='+vcampostr(Almacen)+','+
  'Ambito='+vcampostr(Ambito)+','+
  'Dnisupervisor='+vcampostr(Dnisupervisor)+','+
  'Diacampo='+vcampostr(Diacampo)+','+
  'Dniextensionistaambiental='+vcampostr(Dniextensionistaambiental)+','+
  'Dniextensionista='+vcampostr(Dniextensionista)+','+
  'Dnitecnico='+vcampostr(Dnitecnico)+','+
  'Idcaserio='+vcampostr(Idcaserio)+','+
  'Dnititular='+vcampostr(Dnititular)+','+
  'Idactividad='+vcampostr(Idactividad)+','+
  'Hinst='+vcampostr(Hinst)+','+
  'Hcrec='+vcampostr(Hcrec)+','+
  'Hprod='+vcampostr(Hprod)+','+
  'Coordx='+vcampostr(Coordx)+','+
  'Coordy='+vcampostr(Coordy)+','+
  'Altitud='+vcampostr(Altitud)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function TSIMDEV.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from SIMDEV '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.
