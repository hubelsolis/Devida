unit uModelomovimientos;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
Tmovimientos = class
    Tipomovimiento : string;
    Subtipomov : string;
    Operacion : string;
    Solo_has_en_uso : string;
    mayorque : string;
    limite : string;
    Referencia : string;
    Jalar_Datos_referencia : string;
    Orden : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datTipomovimiento,
    datSubtipomov,
    datOperacion,
    datSolo_has_en_uso,
    datMayorque,
    datLimite,
    datReferencia,
    datJalar_Datos_referencia,
    datOrden:string);
    procedure ObtenerRegistro(id,iddato,id2,iddato2:string);
    function Buscar(id,iddato,id2,iddato2:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato,id2,iddato2 : string):boolean;
    function eliminar(id,iddato,id2,iddato2 : string):boolean;
  end;

implementation

Constructor Tmovimientos.Create;
begin
  limpiar;
end;

procedure Tmovimientos.limpiar;
begin
    Tipomovimiento := '';
    Subtipomov := '';
    Operacion := '';
    Solo_has_en_uso:='';
    Mayorque:='';
    limite:='';
    Referencia := '';
    Orden := '';
    Jalar_Datos_referencia:='';
end;

procedure Tmovimientos.llenar(
    datTipomovimiento,
    datSubtipomov,
    datOperacion,
    datSolo_has_en_uso,
    datmayorque,
    datlimite,
    datReferencia,
    datJalar_Datos_referencia,
    datOrden:string);
 begin
   Tipomovimiento:=DatTipomovimiento;
   Subtipomov:=DatSubtipomov;
   Operacion:=DatOperacion;
   Solo_has_en_uso:=datSolo_has_en_uso;
   mayorque:=datmayorque;
   limite:=datLimite;
   Referencia:=DatReferencia;
   Jalar_Datos_referencia:=datJalar_Datos_referencia;
   Orden:=DatOrden;
 end;

procedure Tmovimientos.ObtenerRegistro(id,iddato,id2,iddato2:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Tipomovimiento,Subtipomov,Operacion,'+
    'Referencia,Orden,solo_has_en_uso,mayorque,limite,Jalar_Datos_referencia '+
    'FROM movimientos WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'";',true);
      Tipomovimiento:=DM1.ConsultaSql.Fields[0].Asstring;
      Subtipomov:=DM1.ConsultaSql.Fields[1].Asstring;
      Operacion:=DM1.ConsultaSql.Fields[2].Asstring;
      Referencia:=DM1.ConsultaSql.Fields[3].Asstring;
      Orden:=DM1.ConsultaSql.Fields[4].Asstring;
      Solo_has_en_uso:=DM1.ConsultaSql.Fields[5].Asstring;
      mayorque:=DM1.ConsultaSql.Fields[6].Asstring;
      limite:=DM1.ConsultaSql.Fields[7].Asstring;
      Jalar_Datos_referencia:=DM1.ConsultaSQL.Fields[8].AsString;
    DM1.ConsultaSQL.Close;
 end;

function Tmovimientos.Buscar(id,iddato,id2,iddato2:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM movimientos WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function Tmovimientos.validar:smallint;
 begin
   result:=1;
 end;

function Tmovimientos.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO movimientos( '+
  'Tipomovimiento,'+
  'Subtipomov,'+
  'Operacion,'+
  'Solo_has_en_uso,'+
  'mayorque,'+
  'limite,'+
  'Referencia,'+
  'Jalar_Datos_referencia,'+
  'Orden) '+
  'VALUES('+
  vcampostr(Tipomovimiento)+','+
  vcampostr(Subtipomov)+','+
  vcampostr(Operacion)+','+
  vcampostr(Solo_has_en_uso)+','+
  vcampostr(mayorque)+','+
  vcampostr(limite)+','+
  vcampostr(Referencia)+','+
  vcampostr(Jalar_Datos_referencia)+','+
  vcampostr(Orden)+')',
  true);
end;

function Tmovimientos.Actualizar(id,iddato,id2,iddato2 : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE movimientos SET '+
  'Tipomovimiento='+vcampostr(Tipomovimiento)+','+
  'Subtipomov='+vcampostr(Subtipomov)+','+
  'Operacion='+vcampostr(Operacion)+','+
  'Solo_has_en_uso='+vcampostr(Solo_has_en_uso)+','+
  'mayorque='+vcampostr(mayorque)+','+
  'limite='+vcampostr(limite)+','+
  'Referencia='+vcampostr(Referencia)+','+
  'Jalar_Datos_referencia='+vcampostr(Jalar_Datos_referencia)+','+
  'Orden='+vcampostr(Orden)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+' and '+id2+'="'+iddato2+'";',
  true);
end;

function Tmovimientos.eliminar(id,iddato,id2,iddato2 : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from movimientos '+
  'WHERE '+id+'='+vcampostr(iddato)+' and '+id2+'="'+iddato2+'";',
  true);
end;

end.
