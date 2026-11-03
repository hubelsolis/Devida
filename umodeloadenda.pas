unit uModeloAdenda;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
TAdenda = class
    Idadenda : string;
    Nombre : string;
    Tipo : string;
    Nro : string;
    Adenda_Anterior : string;
    Fecha : string;
    estado : string;
    sellado : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datIdadenda,
    datNombre,
    datTipo,
    datNro,
    datAdenda_Anterior,
    datFecha,
    datEstado,
    datSellado:string);
    procedure ObtenerRegistro(id,iddato:string);
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato : string):boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor TAdenda.Create;
begin
  limpiar;
end;

procedure TAdenda.limpiar;
begin
    Idadenda := '';
    Nombre := '';
    Tipo := '';
    Nro:='';
    Adenda_Anterior := '';
    Fecha := '';
    estado:='';
    sellado:='';
end;

procedure TAdenda.llenar(
    datIdadenda,
    datNombre,
    datTipo,
    datNro,
    datAdenda_Anterior,
    datFecha,
    datEstado,
    datSellado:string);
 begin
   Idadenda:=DatIdadenda;
   Nombre:=DatNombre;
   Tipo:=DatTipo;
   Nro:=DatNro;
   Adenda_Anterior:=DatAdenda_Anterior;
   Fecha:=DatFecha;
   estado:=datEstado;
   sellado:=datSellado;
 end;

procedure TAdenda.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idadenda,Nombre,Tipo,Adenda_Anterior,Fecha,estado,sellado,Nro '+
    'FROM Adenda WHERE '+id+'="'+iddato+'"',true);
    Idadenda:=DM1.ConsultaSql.Fields[0].Asstring;
    Nombre:=DM1.ConsultaSql.Fields[1].Asstring;
    Tipo:=DM1.ConsultaSql.Fields[2].Asstring;
    Adenda_Anterior:=DM1.ConsultaSql.Fields[3].Asstring;
    Fecha:=DM1.ConsultaSql.Fields[4].Asstring;
    EStado:=DM1.ConsultaSql.Fields[5].Asstring;
    sellado:=DM1.ConsultaSql.Fields[6].Asstring;
    Nro:=DM1.ConsultaSql.Fields[7].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function TAdenda.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM Adenda WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function TAdenda.validar:smallint;
 begin
   result:=1;
 end;

function TAdenda.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO Adenda( '+
  'Idadenda,'+
  'Nombre,'+
  'Tipo,'+
  'Nro,'+
  'Adenda_Anterior,'+
  'Fecha,'+
  'Sellado,'+
  'Estado) '+
  'VALUES('+
  vcampostr(Idadenda)+','+
  vcampostr(Nombre)+','+
  vcampostr(Tipo)+','+
  vcampoInt(Nro)+','+
  vcampostr(Adenda_Anterior)+','+
  vcampostrFECHA(Fecha)+','+
  vcampostr(sellado)+','+
  vcampostr(estado)+')',
  true);
end;

function TAdenda.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE Adenda SET '+
  'Idadenda='+vcampostr(Idadenda)+','+
  'Nombre='+vcampostr(Nombre)+','+
  'Tipo='+vcampostr(Tipo)+','+
  'Nro='+vcampoInt(Nro)+','+
  'Adenda_Anterior='+vcampostr(Adenda_Anterior)+','+
  'Fecha='+vcampostrFECHA(Fecha)+', '+
  'estado='+vcampostr(estado)+', '+
  'sellado='+vcampostr(sellado)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function TAdenda.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from Adenda '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.

