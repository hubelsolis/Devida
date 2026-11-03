unit uModelomovPadron;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

type
TmovPadron = class
    Idmovpadron : string;
    Idadenda : string;
    Nro : string;
    Idcaserio : string;
    Dni_titular : string;
    Telefono : string;
    Dni_conyuge : string;
    Dni_autoridad : string;
    Actividad : string;
    Tipomovimiento : string;
    Subtipomov : string;
    cambioTitularidad : string;
    Dni_tecnico : string;
    Nro_informe : string;
    Anio_incorporacion : string;
    Observaciones_1 : string;
    Observaciones_2 : string;
    Observaciones_3 : string;
    Imagen1 : string;
    Imagen2 : string;
    DNI_referencia : string;
    DNI_refConyuge : string;
    IDMovReferencia : string;
    FECHAACTUALIZACION : string;
    HORAACTUALIZACION : string;

    TituloPath : String;
    TituloTipo : String;
    TituloDescripcion : String;

    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datIdmovpadron,
    datIdadenda,
    datNro,
    datIdcaserio,
    datDni_titular,
    datTelefono,
    datDni_conyuge,
    datDni_autoridad,
    datActividad,
    datTipomovimiento,
    datSubtipomov,
    datCambioTitularidad,
    datDni_tecnico,
    datNro_informe,
    datAnio_incorporacion,
    datObservaciones_1,
    datObservaciones_2,
    datObservaciones_3,
    datImagen1,
    datImagen2,
    datDni_referencia,
    datDNI_refConyuge,
    datIDMovReferencia,
    datFECHAACTUALIZACION,
    datHORAACTUALIZACION,
    datTituloPath,
    datTituloTipo,
    datTituloDescripcion
    :string);
    procedure ObtenerRegistro(id,iddato:string); overload;
    procedure ObtenerRegistro(id,iddato,id2,iddato2:string); overload;
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato : string):boolean;
    function eliminar(id,iddato : string):boolean;
  end;

implementation

Constructor TmovPadron.Create;
begin
  limpiar;
end;

procedure TmovPadron.limpiar;
begin
    Idmovpadron := '';
    Idadenda := '';
    Nro := '';
    Idcaserio := '';
    Dni_titular := '';
    Telefono := '';
    Dni_conyuge := '';
    Dni_autoridad := '';
    Actividad := '';
    Tipomovimiento := '';
    Subtipomov := '';
    cambioTitularidad:='';
    Dni_tecnico := '';
    Nro_informe := '';
    Anio_incorporacion := '';
    Observaciones_1 := '';
    Observaciones_2 := '';
    Observaciones_3 := '';
    Imagen1 := '';
    Imagen2 := '';
    Dni_referencia := '';
    DNI_refConyuge := '';
    IDMovReferencia:='';
    FECHAACTUALIZACION:='';
    HORAACTUALIZACION:='';
    TituloPath :='';
    TituloTipo :='';
    TituloDescripcion :='';
end;

procedure TmovPadron.llenar(
    datIdmovpadron,
    datIdadenda,
    datNro,
    datIdcaserio,
    datDni_titular,
    datTelefono,
    datDni_conyuge,
    datDni_autoridad,
    datActividad,
    datTipomovimiento,
    datSubtipomov,
    datCambioTitularidad,
    datDni_tecnico,
    datNro_informe,
    datAnio_incorporacion,
    datObservaciones_1,
    datObservaciones_2,
    datObservaciones_3,
    datImagen1,
    datImagen2,
    datDni_referencia,
    datDNI_refConyuge,
    datIDMovReferencia,
    datFECHAACTUALIZACION,
    datHORAACTUALIZACION,
    datTituloPath,
    datTituloTipo,
    datTituloDescripcion
    :string);
 begin
   Idmovpadron:=DatIdmovpadron;
   Idadenda:=DatIdadenda;
   Nro:=DatNro;
   Idcaserio:=DatIdcaserio;
   Dni_titular:=DatDni_titular;
   Telefono:=DatTelefono;
   Dni_conyuge:=DatDni_conyuge;
   Dni_autoridad:=DatDni_autoridad;
   Actividad:=DatActividad;
   Tipomovimiento:=DatTipomovimiento;
   Subtipomov:=DatSubtipomov;
   CambioTitularidad:=datCambioTitularidad;
   Dni_tecnico:=DatDni_tecnico;
   Nro_informe:=DatNro_informe;
   Anio_incorporacion:=DatAnio_incorporacion;
   Observaciones_1:=DatObservaciones_1;
   Observaciones_2:=DatObservaciones_2;
   Observaciones_3:=DatObservaciones_3;
   Imagen1:=DatImagen1;
   Imagen2:=DatImagen2;
   Dni_referencia:=DatDni_referencia;
   DNI_refConyuge:=DatDNI_refConyuge;
   IDMovReferencia:=DatIDMovReferencia;
   FECHAACTUALIZACION:=datFECHAACTUALIZACION;
   HORAACTUALIZACION:=datHORAACTUALIZACION;
   TituloPath := datTituloPath;
   TituloTipo := datTituloTipo;
   TituloDescripcion := datTituloDescripcion;
 end;

procedure TmovPadron.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idmovpadron,Idadenda,Nro,Idcaserio,Dni_titular,Telefono,'+
    'Dni_conyuge,Dni_autoridad,Actividad,Tipomovimiento,Subtipomov,Dni_tecnico,Nro_informe,'+
    'Anio_incorporacion,Observaciones_1,Observaciones_2,Observaciones_3,Imagen1,Imagen2,'+
    'Dni_referencia,CambioTitularidad,DNI_refConyuge,IDMovReferencia,TituloPath,TituloTipo,TituloDescripcion '+
    'FROM movPadron WHERE '+id+'="'+iddato+'"',true);
    Idmovpadron:=DM1.ConsultaSql.Fields[0].Asstring;
    Idadenda:=DM1.ConsultaSql.Fields[1].Asstring;
    Nro:=DM1.ConsultaSql.Fields[2].Asstring;
    Idcaserio:=DM1.ConsultaSql.Fields[3].Asstring;
    Dni_titular:=DM1.ConsultaSql.Fields[4].Asstring;
    Telefono:=DM1.ConsultaSql.Fields[5].Asstring;
    Dni_conyuge:=DM1.ConsultaSql.Fields[6].Asstring;
    Dni_autoridad:=DM1.ConsultaSql.Fields[7].Asstring;
    Actividad:=DM1.ConsultaSql.Fields[8].Asstring;
    Tipomovimiento:=DM1.ConsultaSql.Fields[9].Asstring;
    Subtipomov:=DM1.ConsultaSql.Fields[10].Asstring;
    Dni_tecnico:=DM1.ConsultaSql.Fields[11].Asstring;
    Nro_informe:=DM1.ConsultaSql.Fields[12].Asstring;
    Anio_incorporacion:=DM1.ConsultaSql.Fields[13].Asstring;
    Observaciones_1:=DM1.ConsultaSql.Fields[14].Asstring;
    Observaciones_2:=DM1.ConsultaSql.Fields[15].Asstring;
    Observaciones_3:=DM1.ConsultaSql.Fields[16].Asstring;
    Imagen1:=DM1.ConsultaSql.Fields[17].Asstring;
    Imagen2:=DM1.ConsultaSql.Fields[18].Asstring;
    Dni_referencia:=DM1.ConsultaSql.Fields[19].Asstring;
    CambioTitularidad:=DM1.ConsultaSql.Fields[20].Asstring;
    DNI_refConyuge:=DM1.ConsultaSql.Fields[21].Asstring;
    IDMovReferencia:=DM1.ConsultaSql.Fields[22].Asstring;
    TituloPath := DM1.ConsultaSql.Fields[23].Asstring;
    TituloTipo := DM1.ConsultaSql.Fields[24].Asstring;
    TituloDescripcion := DM1.ConsultaSql.Fields[25].Asstring;
    DM1.ConsultaSQL.Close;
 end;

procedure TmovPadron.ObtenerRegistro(id,iddato,id2,iddato2:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Idmovpadron,Idadenda,Nro,Idcaserio,Dni_titular,Telefono,Dni_conyuge,'+
    'Dni_autoridad,Actividad,Tipomovimiento,Subtipomov,Dni_tecnico,Nro_informe,Anio_incorporacion,'+
    'Observaciones_1,Observaciones_2,Observaciones_3,Imagen1,Imagen2,Dni_referencia,CambioTitularidad,DNI_refConyuge,IDMovReferencia,,TituloPath,TituloTipo,TituloDescripcion '+
    'FROM movPadron WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'" ',true);
    Idmovpadron:=DM1.ConsultaSql.Fields[0].Asstring;
    Idadenda:=DM1.ConsultaSql.Fields[1].Asstring;
    Nro:=DM1.ConsultaSql.Fields[2].Asstring;
    Idcaserio:=DM1.ConsultaSql.Fields[3].Asstring;
    Dni_titular:=DM1.ConsultaSql.Fields[4].Asstring;
    Telefono:=DM1.ConsultaSql.Fields[5].Asstring;
    Dni_conyuge:=DM1.ConsultaSql.Fields[6].Asstring;
    Dni_autoridad:=DM1.ConsultaSql.Fields[7].Asstring;
    Actividad:=DM1.ConsultaSql.Fields[8].Asstring;
    Tipomovimiento:=DM1.ConsultaSql.Fields[9].Asstring;
    Subtipomov:=DM1.ConsultaSql.Fields[10].Asstring;
    Dni_tecnico:=DM1.ConsultaSql.Fields[11].Asstring;
    Nro_informe:=DM1.ConsultaSql.Fields[12].Asstring;
    Anio_incorporacion:=DM1.ConsultaSql.Fields[13].Asstring;
    Observaciones_1:=DM1.ConsultaSql.Fields[14].Asstring;
    Observaciones_2:=DM1.ConsultaSql.Fields[15].Asstring;
    Observaciones_3:=DM1.ConsultaSql.Fields[16].Asstring;
    Imagen1:=DM1.ConsultaSql.Fields[17].Asstring;
    Imagen2:=DM1.ConsultaSql.Fields[18].Asstring;
    Dni_referencia:=DM1.ConsultaSql.Fields[19].Asstring;
    CambioTitularidad:=DM1.ConsultaSql.Fields[20].Asstring;
    DNI_refConyuge:=DM1.ConsultaSql.Fields[21].Asstring;
    IDMovReferencia:=DM1.ConsultaSql.Fields[22].Asstring;
    TituloPath := DM1.ConsultaSql.Fields[23].Asstring;
    TituloTipo := DM1.ConsultaSql.Fields[24].Asstring;
    TituloDescripcion := DM1.ConsultaSql.Fields[25].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function TmovPadron.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM movPadron WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function TmovPadron.validar:smallint;
 begin
   result:=1;
 end;

function TmovPadron.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
  'INSERT INTO movPadron( '+
  'Idmovpadron,'+
  'Idadenda,'+
  'Nro,'+
  'Idcaserio,'+
  'Dni_titular,'+
  'Telefono,'+
  'Dni_conyuge,'+
  'Dni_autoridad,'+
  'Actividad,'+
  'Tipomovimiento,'+
  'Subtipomov,'+
  'CambioTitularidad,'+
  'Dni_tecnico,'+
  //'Nro_informe,'+
  'Anio_incorporacion,'+
  'Observaciones_1,'+
  'Observaciones_2,'+
  'Observaciones_3,'+
  'Imagen1,'+
  'Imagen2,'+
  'DNI_refConyuge,'+
  'IDMovReferencia,'+
  'Dni_referencia,'+
  'FECHAACTUALIZACION,'+
  'HORAACTUALIZACION,'+
  'TituloPath,'+
  'TituloTipo,'+
  'TituloDescripcion) '+
  'VALUES('+
  vcampostr(Idmovpadron)+','+
  vcampostr(Idadenda)+','+
  vcampostr(Nro)+','+
  vcampostr(Idcaserio)+','+
  vcampostr(Dni_titular)+','+
  vcampostr(Telefono)+','+
  vcampostr(Dni_conyuge)+','+
  vcampostr(Dni_autoridad)+','+
  vcampostr(Actividad)+','+
  vcampostr(Tipomovimiento)+','+
  vcampostr(Subtipomov)+','+
  vcampostr(CambioTitularidad)+','+
  vcampostr(Dni_tecnico)+','+
  //vcampostr(Nro_informe)+','+
  vcampostr(Anio_incorporacion)+','+
  vcampostr(Observaciones_1)+','+
  vcampostr(Observaciones_2)+','+
  vcampostr(Observaciones_3)+','+
  vcampostr(Imagen1)+','+
  vcampostr(Imagen2)+','+
  vcampostr(DNI_refConyuge)+','+
  vcampostr(IDMovReferencia)+','+
  vcampostr(Dni_referencia)+','+
  vcampostrFECHA(FECHAACTUALIZACION)+','+
  vcampostr(HORAACTUALIZACION)+','+
  vcampostr(TituloPath)+','+
  vcampostr(TituloTipo)+','+
  vcampostr(TituloDescripcion)+')',
  true);
end;

function TmovPadron.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'UPDATE movPadron SET '+
  'Idmovpadron='+vcampostr(Idmovpadron)+','+
  'Idadenda='+vcampostr(Idadenda)+','+
  'Nro='+vcampostr(Nro)+','+
  'Idcaserio='+vcampostr(Idcaserio)+','+
  'Dni_titular='+vcampostr(Dni_titular)+','+
  'Telefono='+vcampostr(Telefono)+','+
  'Dni_conyuge='+vcampostr(Dni_conyuge)+','+
  'Dni_autoridad='+vcampostr(Dni_autoridad)+','+
  'Actividad='+vcampostr(Actividad)+','+
  'Tipomovimiento='+vcampostr(Tipomovimiento)+','+
  'Subtipomov='+vcampostr(Subtipomov)+','+
  'CambioTitularidad='+vcampostr(CambioTitularidad)+','+
  'Dni_tecnico='+vcampostr(Dni_tecnico)+','+
  //'Nro_informe='+vcampostr(Nro_informe)+','+
  'Anio_incorporacion='+vcampostr(Anio_incorporacion)+','+
  'Observaciones_1='+vcampostr(Observaciones_1)+','+
  'Observaciones_2='+vcampostr(Observaciones_2)+','+
  'Observaciones_3='+vcampostr(Observaciones_3)+','+
  'Imagen1='+vcampostr(Imagen1)+','+
  'Imagen2='+vcampostr(Imagen2)+','+
  'DNI_refConyuge='+vcampostr(DNI_refConyuge)+','+
  'IDMovReferencia='+vcampostr(IDMovReferencia)+','+
  'Dni_referencia='+vcampostr(Dni_referencia)+','+
  'FECHAACTUALIZACION='+vcampostrFECHA(FECHAACTUALIZACION)+','+
  'HORAACTUALIZACION='+vcampostr(HORAACTUALIZACION)+','+
  'TituloPath='+vcampostr(TituloPath)+','+
  'TituloTipo='+vcampostr(TituloTipo)+','+
  'TituloDescripcion='+vcampostr(TituloDescripcion)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function TmovPadron.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from movPadron '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

end.
