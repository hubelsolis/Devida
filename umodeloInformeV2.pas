unit uModeloINFORMEV2;

interface
uses uniguioperadores,ZConnection,ZDataset;

type
TINFORMES = class
    Nroinforme : string;
    Tipoinforme : string;
    Idadenda : string;
    Idcaserio : string;
    Aniode : string;
    Fecha : string;
    FechaRes : string;
    Para : string;
    Asunto : string;
    Referencia : string;
    Dni1 : string;
    Dni2 : string;
    Actividad1 : string;
    Actividad2 : string;
    Antecentes : string;
    Analisis : string;
    Conclusiones : string;
    Recomendaciones : string;
    Fechaactualizacion : string;
    Horaactualizacion : string;
    FechaFirma : string;
    NroAdenda : string;
    Constructor Create;
    procedure limpiar;
    procedure llenar(
    datNroinforme,
    datTipoinforme,
    datIdadenda,
    datIdcaserio,
    datAniode,
    datFecha,
    datFechaRes,
    datPara,
    datAsunto,
    datReferencia,
    datDni1,
    datDni2,
    datActividad1,
    datActividad2,
    datAntecentes,
    datAnalisis,
    datConclusiones,
    datRecomendaciones,
    datFechaactualizacion,
    datHoraactualizacion,datFechaFirma,datoNroAdenda:string);
    procedure ObtenerRegistro(id,iddato:string; conn : TZconnection);
    procedure ObtenerRegistro2(id,iddato,id2,iddato2:string; conn : TZconnection);
    procedure ObtenerRegistro3(id,iddato,id2,iddato2,id3,iddato3:string; conn : TZconnection);
    procedure ObtenerRegistro4(id,iddato,id2,iddato2,id3,iddato3,id4,iddato4:string; conn : TZconnection);
    function Buscar(id,iddato:string; conn : TZconnection):boolean;
    function validar:smallint;
    function insertar(conn : TZconnection):boolean;
    function actualizar(id,iddato : string; conn : TZconnection):boolean;
    function Actualizar2(Cond : string; conn : TZconnection):boolean;
    function eliminar(id,iddato : string; conn : TZconnection):boolean;
    function eliminar2(cond : string; conn : TZconnection):boolean;
  end;

implementation

Constructor TINFORMES.Create;
begin
  inherited Create;
  limpiar;
end;

procedure TINFORMES.limpiar;
begin
    Nroinforme := '';
    Tipoinforme := '';
    Idadenda := '';
    Idcaserio := '';
    Aniode := '';
    Fecha := '';
    FechaRes := '';
    Para := '';
    Asunto := '';
    Referencia := '';
    Dni1 := '';
    Dni2 := '';
    Actividad1 := '';
    Actividad2 := '';
    Antecentes := '';
    Analisis := '';
    Conclusiones := '';
    Recomendaciones := '';
    Fechaactualizacion := '';
    Horaactualizacion := '';
    FechaFirma:='';
    NroAdenda:='';
end;

procedure TINFORMES.llenar(
    datNroinforme,
    datTipoinforme,
    datIdadenda,
    datIdcaserio,
    datAniode,
    datFecha,
    datFechaRes,
    datPara,
    datAsunto,
    datReferencia,
    datDni1,
    datDni2,
    datActividad1,
    datActividad2,
    datAntecentes,
    datAnalisis,
    datConclusiones,
    datRecomendaciones,
    datFechaactualizacion,
    datHoraactualizacion,
    datFechaFirma,
    datoNroAdenda:string);
 begin
   Nroinforme:=DatNroinforme;
   Tipoinforme:=DatTipoinforme;
   Idadenda:=DatIdadenda;
   Idcaserio:=DatIdcaserio;
   Aniode:=DatAniode;
   Fecha:=DatFecha;
   FechaRes:=DatFechaRes;
   Para:=DatPara;
   Asunto:=DatAsunto;
   Referencia:=DatReferencia;
   Dni1:=DatDni1;
   Dni2:=DatDni2;
   Actividad1:=DatActividad1;
   Actividad2:=DatActividad2;
   Antecentes:=DatAntecentes;
   Analisis:=DatAnalisis;
   Conclusiones:=DatConclusiones;
   Recomendaciones:=DatRecomendaciones;
   Fechaactualizacion:=DatFechaactualizacion;
   Horaactualizacion:=DatHoraactualizacion;
   FechaFirma:=DatFechaFirma;
   NroAdenda:=datoNroAdenda;
 end;

procedure TINFORMES.ObtenerRegistro(id,iddato:string; conn : TZconnection);
Var ConsultaSQL : TZQuery;
 begin
  ConsultaSQL := TZquery.create(nil);
  Try
    ConsultaSQL.Connection := conn;
    ConsultaSQL.sql.Add(FormatSQL3(
    'SELECT Nroinforme,Tipoinforme,Idadenda,Idcaserio,Aniode,Fecha,Para,Asunto,Referencia,Dni1,Dni2,Actividad1,Actividad2,Antecentes,Analisis,Conclusiones,Recomendaciones,Fechaactualizacion,Horaactualizacion,FechaRes,FechaFirma,NroAdenda '+
    'FROM INFORMES WHERE '+id+'="'+iddato+'"'));
    ConsultaSQL.Open;
    if not ConsultaSQL.IsEmpty then
    begin
      Nroinforme:=ConsultaSql.Fields[0].Asstring;
      Tipoinforme:=ConsultaSql.Fields[1].Asstring;
      Idadenda:=ConsultaSql.Fields[2].Asstring;
      Idcaserio:=ConsultaSql.Fields[3].Asstring;
      Aniode:=ConsultaSql.Fields[4].Asstring;
      Fecha:=ConsultaSql.Fields[5].Asstring;
      Para:=ConsultaSql.Fields[6].Asstring;
      Asunto:=ConsultaSql.Fields[7].Asstring;
      Referencia:=ConsultaSql.Fields[8].Asstring;
      Dni1:=ConsultaSql.Fields[9].Asstring;
      Dni2:=ConsultaSql.Fields[10].Asstring;
      Actividad1:=ConsultaSql.Fields[11].Asstring;
      Actividad2:=ConsultaSql.Fields[12].Asstring;
      Antecentes:=ConsultaSql.Fields[13].Asstring;
      Analisis:=ConsultaSql.Fields[14].Asstring;
      Conclusiones:=ConsultaSql.Fields[15].Asstring;
      Recomendaciones:=ConsultaSql.Fields[16].Asstring;
      Fechaactualizacion:=ConsultaSql.Fields[17].Asstring;
      Horaactualizacion:=ConsultaSql.Fields[18].Asstring;
      FechaRes:=ConsultaSql.Fields[19].Asstring;
      FechaFirma:=ConsultaSql.Fields[20].Asstring;
      NroAdenda:=ConsultaSql.Fields[21].Asstring;
    end
   else
    Limpiar;
  finally
    ConsultaSQL.Free;
  end;
 end;

procedure TINFORMES.ObtenerRegistro2(id,iddato,id2,iddato2:string; conn : TZconnection);
Var ConsultaSQL : TZQuery;
 begin
  ConsultaSQL := TZquery.create(nil);
  try
    ConsultaSQL.Connection := conn;
    ConsultaSQL.sql.Add(FormatSQL3(
    'SELECT Nroinforme,Tipoinforme,Idadenda,Idcaserio,Aniode,Fecha,Para,Asunto,Referencia,Dni1,Dni2,Actividad1,Actividad2,Antecentes,Analisis,Conclusiones,Recomendaciones,Fechaactualizacion,Horaactualizacion,fechares,fechaFirma,NroAdenda '+
    'FROM INFORMES WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'";'));
    ConsultaSQL.Open;
    if not ConsultaSQL.IsEmpty then
    begin
      Nroinforme:=ConsultaSql.Fields[0].Asstring;
      Tipoinforme:=ConsultaSql.Fields[1].Asstring;
      Idadenda:=ConsultaSql.Fields[2].Asstring;
      Idcaserio:=ConsultaSql.Fields[3].Asstring;
      Aniode:=ConsultaSql.Fields[4].Asstring;
      Fecha:=ConsultaSql.Fields[5].Asstring;
      Para:=ConsultaSql.Fields[6].Asstring;
      Asunto:=ConsultaSql.Fields[7].Asstring;
      Referencia:=ConsultaSql.Fields[8].Asstring;
      Dni1:=ConsultaSql.Fields[9].Asstring;
      Dni2:=ConsultaSql.Fields[10].Asstring;
      Actividad1:=ConsultaSql.Fields[11].Asstring;
      Actividad2:=ConsultaSql.Fields[12].Asstring;
      Antecentes:=ConsultaSql.Fields[13].Asstring;
      Analisis:=ConsultaSql.Fields[14].Asstring;
      Conclusiones:=ConsultaSql.Fields[15].Asstring;
      Recomendaciones:=ConsultaSql.Fields[16].Asstring;
      Fechaactualizacion:=ConsultaSql.Fields[17].Asstring;
      Horaactualizacion:=ConsultaSql.Fields[18].Asstring;
      FechaRes:=ConsultaSql.Fields[19].Asstring;
      FechaFirma:=ConsultaSql.Fields[20].Asstring;
      NroAdenda:=ConsultaSql.Fields[21].Asstring;
    end
   else
    Limpiar;
  finally
    ConsultaSQL.Free;
  end;
end;

procedure TINFORMES.ObtenerRegistro3(id,iddato,id2,iddato2,id3,iddato3:string; conn : TZconnection);
Var ConsultaSQL : TZQuery;
 begin
  ConsultaSQL := TZquery.create(nil);
  try
    ConsultaSQL.Connection := conn;
    ConsultaSQL.sql.Add(FormatSQL3(
    'SELECT Nroinforme,Tipoinforme,Idadenda,Idcaserio,Aniode,Fecha,Para,Asunto,Referencia,Dni1,Dni2,Actividad1,Actividad2,Antecentes,Analisis,Conclusiones,Recomendaciones,Fechaactualizacion,Horaactualizacion,fechares,fechaFirma,NroAdenda '+
    'FROM INFORMES WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'" and '+id3+'="'+iddato3+'";'));
    ConsultaSQL.Open;
    if not ConsultaSQL.IsEmpty then
    begin
      Nroinforme:=ConsultaSql.Fields[0].Asstring;
      Tipoinforme:=ConsultaSql.Fields[1].Asstring;
      Idadenda:=ConsultaSql.Fields[2].Asstring;
      Idcaserio:=ConsultaSql.Fields[3].Asstring;
      Aniode:=ConsultaSql.Fields[4].Asstring;
      Fecha:=ConsultaSql.Fields[5].Asstring;
      Para:=ConsultaSql.Fields[6].Asstring;
      Asunto:=ConsultaSql.Fields[7].Asstring;
      Referencia:=ConsultaSql.Fields[8].Asstring;
      Dni1:=ConsultaSql.Fields[9].Asstring;
      Dni2:=ConsultaSql.Fields[10].Asstring;
      Actividad1:=ConsultaSql.Fields[11].Asstring;
      Actividad2:=ConsultaSql.Fields[12].Asstring;
      Antecentes:=ConsultaSql.Fields[13].Asstring;
      Analisis:=ConsultaSql.Fields[14].Asstring;
      Conclusiones:=ConsultaSql.Fields[15].Asstring;
      Recomendaciones:=ConsultaSql.Fields[16].Asstring;
      Fechaactualizacion:=ConsultaSql.Fields[17].Asstring;
      Horaactualizacion:=ConsultaSql.Fields[18].Asstring;
      FechaRes:=ConsultaSql.Fields[19].Asstring;
      FechaFirma:=ConsultaSql.Fields[20].Asstring;
      NroAdenda:=ConsultaSql.Fields[21].Asstring;
    end
   else
    Limpiar;
  finally
    ConsultaSQL.Free;
  end;
 end;

procedure TINFORMES.ObtenerRegistro4(id,iddato,id2,iddato2,id3,iddato3,id4,iddato4:string; conn : TZconnection);
Var ConsultaSQL : TZQuery;
 begin
  ConsultaSQL := TZquery.create(nil);
  try
    ConsultaSQL.Connection := conn;
    ConsultaSQL.sql.Add(FormatSQL3(
    'SELECT Nroinforme,Tipoinforme,Idadenda,Idcaserio,Aniode,Fecha,Para,Asunto,Referencia,Dni1,Dni2,Actividad1,Actividad2,Antecentes,Analisis,Conclusiones,Recomendaciones,Fechaactualizacion,Horaactualizacion,fechares,fechafirma,NroAdenda '+
    'FROM INFORMES WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'" and '+id3+'="'+iddato3+'" and '+id4+'="'+iddato4+'";'));
    ConsultaSQL.Open;
    if not ConsultaSQL.IsEmpty then
    begin
      Nroinforme:=ConsultaSql.Fields[0].Asstring;
      Tipoinforme:=ConsultaSql.Fields[1].Asstring;
      Idadenda:=ConsultaSql.Fields[2].Asstring;
      Idcaserio:=ConsultaSql.Fields[3].Asstring;
      Aniode:=ConsultaSql.Fields[4].Asstring;
      Fecha:=ConsultaSql.Fields[5].Asstring;
      Para:=ConsultaSql.Fields[6].Asstring;
      Asunto:=ConsultaSql.Fields[7].Asstring;
      Referencia:=ConsultaSql.Fields[8].Asstring;
      Dni1:=ConsultaSql.Fields[9].Asstring;
      Dni2:=ConsultaSql.Fields[10].Asstring;
      Actividad1:=ConsultaSql.Fields[11].Asstring;
      Actividad2:=ConsultaSql.Fields[12].Asstring;
      Antecentes:=ConsultaSql.Fields[13].Asstring;
      Analisis:=ConsultaSql.Fields[14].Asstring;
      Conclusiones:=ConsultaSql.Fields[15].Asstring;
      Recomendaciones:=ConsultaSql.Fields[16].Asstring;
      Fechaactualizacion:=ConsultaSql.Fields[17].Asstring;
      Horaactualizacion:=ConsultaSql.Fields[18].Asstring;
      FechaRes:=ConsultaSql.Fields[19].Asstring;
      FechaFirma:=ConsultaSql.Fields[20].Asstring;
      NroAdenda:=ConsultaSql.Fields[21].Asstring;
    end
   else
    Limpiar;
  finally
    ConsultaSQL.Free;
  end;
 end;

function TINFORMES.Buscar(id,iddato:string; conn : TZconnection):boolean;
Var ConsultaSQL : TZQuery;
 begin
  ConsultaSQL := TZquery.create(nil);
  try
    ConsultaSQL.Connection := conn;
    ConsultaSQL.sql.Add(FormatSQL3(
    'SELECT '+id+' '+
    'FROM INFORMES WHERE '+id+'="'+iddato+'"'));
    ConsultaSQL.Open;
    Result := not ConsultaSQL.IsEmpty;
  finally
    ConsultaSQL.Free;
  end;
 end;

function TINFORMES.validar:smallint;
 begin
   result:=1;
 end;

function TINFORMES.Insertar(conn : TZconnection):boolean;
Var ConsultaSQL : TZQuery;
 begin
 ConsultaSQL := TZquery.create(nil);
 try
  ConsultaSQL.Connection := conn;
  ConsultaSQL.sql.Add(FormatSQL3(
  'INSERT INTO INFORMES( '+
  'Nroinforme,'+
  'Tipoinforme,'+
  'Idadenda,'+
  'Idcaserio,'+
  'Aniode,'+
  'Fecha,'+
  'FechaRes,'+
  'Para,'+
  'Asunto,'+
  'Referencia,'+
  'Dni1,'+
  'Dni2,'+
  'Actividad1,'+
  'Actividad2,'+
  'Antecentes,'+
  'Analisis,'+
  'Conclusiones,'+
  'Recomendaciones,'+
  'Fechaactualizacion,'+
  'Horaactualizacion,'+
  'fechafirma,'+
  'nroadenda) '+
  'VALUES('+
  vcampostr(Nroinforme)+','+
  vcampostr(Tipoinforme)+','+
  vcampostr(Idadenda)+','+
  vcampostr(Idcaserio)+','+
  vcampostr(Aniode)+','+
  vcampostrFECHA(Fecha)+','+
  vcampostrFECHA(FechaRes)+','+
  vcampostr(Para)+','+
  vcampostr(Asunto)+','+
  vcampostr(Referencia)+','+
  vcampostr(Dni1)+','+
  vcampostr(Dni2)+','+
  vcampostr(Actividad1)+','+
  vcampostr(Actividad2)+','+
  vcampostr(Antecentes)+','+
  vcampostr(Analisis)+','+
  vcampostr(Conclusiones)+','+
  vcampostr(Recomendaciones)+','+
  vcampostrFECHA(Fechaactualizacion)+','+
  vcampostr(Horaactualizacion)+','+
  vcampostrFECHA(FechaFirma)+','+
  vcampoInt(NroAdenda)+')'));
  Result:=True;
  Try
    ConsultaSQL.ExecSQL;
  Except
    Result:=False;
  End;
 finally
   ConsultaSQL.Free;
 end;
end;


function TINFORMES.Actualizar(id,iddato : string; conn : TZconnection):boolean;
Var ConsultaSQL : TZQuery;
 begin
 ConsultaSQL := TZquery.create(nil);
 try
  ConsultaSQL.Connection := conn;
  ConsultaSQL.sql.Add(FormatSQL3(
  'UPDATE INFORMES SET '+
  'Nroinforme='+vcampostr(Nroinforme)+','+
  'Tipoinforme='+vcampostr(Tipoinforme)+','+
  'Idadenda='+vcampostr(Idadenda)+','+
  'Idcaserio='+vcampostr(Idcaserio)+','+
  'Aniode='+vcampostr(Aniode)+','+
  'Fecha='+vcampostrFECHA(Fecha)+','+
  'FechaRes='+vcampostrFECHA(FechaRes)+','+
  'Para='+vcampostr(Para)+','+
  'Asunto='+vcampostr(Asunto)+','+
  'Referencia='+vcampostr(Referencia)+','+
  'Dni1='+vcampostr(Dni1)+','+
  'Dni2='+vcampostr(Dni2)+','+
  'Actividad1='+vcampostr(Actividad1)+','+
  'Actividad2='+vcampostr(Actividad2)+','+
  'Antecentes='+vcampostr(Antecentes)+','+
  'Analisis='+vcampostr(Analisis)+','+
  'Conclusiones='+vcampostr(Conclusiones)+','+
  'Recomendaciones='+vcampostr(Recomendaciones)+','+
  'Fechaactualizacion='+vcampostrFECHA(Fechaactualizacion)+','+
  'Horaactualizacion='+vcampostr(Horaactualizacion)+','+
  'FechaFirma='+vcampostrFECHA(FechaFirma)+','+
  'NroAdenda='+vcampoInt(NroAdenda)+' '+
  'WHERE '+id+'='+vcampostr(iddato)+';'
  ));
  Result:=True;
  Try
    ConsultaSQL.ExecSQL;
  Except
    Result:=False;
  End;
 finally
   ConsultaSQL.Free;
 end;
end;

function TINFORMES.Actualizar2(Cond : string; conn : TZconnection):boolean;
Var ConsultaSQL : TZQuery;
 begin
 ConsultaSQL := TZquery.create(nil);
 try
  ConsultaSQL.Connection := conn;
  ConsultaSQL.sql.Add(FormatSQL3(
  'UPDATE INFORMES i SET '+
  'Nroinforme='+vcampostr(Nroinforme)+','+
  'Tipoinforme='+vcampostr(Tipoinforme)+','+
  'Idadenda='+vcampostr(Idadenda)+','+
  'Idcaserio='+vcampostr(Idcaserio)+','+
  'Aniode='+vcampostr(Aniode)+','+
  'Fecha='+vcampostrFECHA(Fecha)+','+
  'FechaRes='+vcampostrFECHA(FechaRes)+','+
  'Para='+vcampostr(Para)+','+
  'Asunto='+vcampostr(Asunto)+','+
  'Referencia='+vcampostr(Referencia)+','+
  'Dni1='+vcampostr(Dni1)+','+
  'Dni2='+vcampostr(Dni2)+','+
  'Actividad1='+vcampostr(Actividad1)+','+
  'Actividad2='+vcampostr(Actividad2)+','+
  'Antecentes='+vcampostr(Antecentes)+','+
  'Analisis='+vcampostr(Analisis)+','+
  'Conclusiones='+vcampostr(Conclusiones)+','+
  'Recomendaciones='+vcampostr(Recomendaciones)+','+
  'Fechaactualizacion='+vcampostrFECHA(Fechaactualizacion)+','+
  'Horaactualizacion='+vcampostr(Horaactualizacion)+','+
  'FechaFirma='+vcampostrFECHA(FechaFirma)+','+
  'NroAdenda='+vcampoInt(NroAdenda)+' '+
  'WHERE '+cond+''
  ));
  Result:=True;
  Try
    ConsultaSQL.ExecSQL;
  Except
    Result:=False;
  End;
 finally
   ConsultaSQL.Free;
 end;
end;

function TINFORMES.eliminar(id,iddato : string; conn : TZconnection):boolean;
Var ConsultaSQL : TZQuery;
 begin
 ConsultaSQL := TZquery.create(nil);
 try
  ConsultaSQL.Connection := conn;
  ConsultaSQL.sql.Add(FormatSQL3(
  'DELETE from INFORMES '+
  'WHERE '+id+'='+vcampostr(iddato)+';'
  ));
  Result:=True;
  Try
    ConsultaSQL.ExecSQL;
  Except
    Result:=False;
  End;
 finally
   ConsultaSQL.Free;
 end;
end;

function TINFORMES.eliminar2(cond : string; conn : TZconnection):boolean;
Var ConsultaSQL : TZQuery;
 begin
 ConsultaSQL := TZquery.create(nil);
 try
  ConsultaSQL.Connection := conn;
  ConsultaSQL.sql.Add(FormatSQL3(
  'DELETE from INFORMES '+
  'WHERE '+cond+';'
  ));
  Result:=True;
  Try
    ConsultaSQL.ExecSQL;
  Except
    Result:=False;
  End;
 finally
   ConsultaSQL.Free;
 end;
end;

end.
