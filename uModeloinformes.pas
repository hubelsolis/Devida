unit uModeloINFORMES;

interface
uses uniguioperadores,uniguiUSQLutils,UDBModulo;

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
    procedure ObtenerRegistro(id,iddato:string);
    procedure ObtenerRegistro2(id,iddato,id2,iddato2:string);
    procedure ObtenerRegistro3(id,iddato,id2,iddato2,id3,iddato3:string);
    procedure ObtenerRegistro4(id,iddato,id2,iddato2,id3,iddato3,id4,iddato4:string);
    function Buscar(id,iddato:string):boolean;
    function validar:smallint;
    function insertar:boolean;
    function actualizar(id,iddato : string):boolean;
    function Actualizar2(Cond : string):boolean;
    function eliminar(id,iddato : string):boolean;
    function eliminar2(cond : string):boolean;
  end;

implementation

Constructor TINFORMES.Create;
begin
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

procedure TINFORMES.ObtenerRegistro(id,iddato:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Nroinforme,Tipoinforme,Idadenda,Idcaserio,Aniode,Fecha,Para,Asunto,Referencia,Dni1,Dni2,Actividad1,Actividad2,Antecentes,Analisis,Conclusiones,Recomendaciones,Fechaactualizacion,Horaactualizacion,FechaRes,FechaFirma,NroAdenda '+
    'FROM INFORMES WHERE '+id+'="'+iddato+'"',true);
    Nroinforme:=DM1.ConsultaSql.Fields[0].Asstring;
    Tipoinforme:=DM1.ConsultaSql.Fields[1].Asstring;
    Idadenda:=DM1.ConsultaSql.Fields[2].Asstring;
    Idcaserio:=DM1.ConsultaSql.Fields[3].Asstring;
    Aniode:=DM1.ConsultaSql.Fields[4].Asstring;
    Fecha:=DM1.ConsultaSql.Fields[5].Asstring;
    Para:=DM1.ConsultaSql.Fields[6].Asstring;
    Asunto:=DM1.ConsultaSql.Fields[7].Asstring;
    Referencia:=DM1.ConsultaSql.Fields[8].Asstring;
    Dni1:=DM1.ConsultaSql.Fields[9].Asstring;
    Dni2:=DM1.ConsultaSql.Fields[10].Asstring;
    Actividad1:=DM1.ConsultaSql.Fields[11].Asstring;
    Actividad2:=DM1.ConsultaSql.Fields[12].Asstring;
    Antecentes:=DM1.ConsultaSql.Fields[13].Asstring;
    Analisis:=DM1.ConsultaSql.Fields[14].Asstring;
    Conclusiones:=DM1.ConsultaSql.Fields[15].Asstring;
    Recomendaciones:=DM1.ConsultaSql.Fields[16].Asstring;
    Fechaactualizacion:=DM1.ConsultaSql.Fields[17].Asstring;
    Horaactualizacion:=DM1.ConsultaSql.Fields[18].Asstring;
    FechaRes:=DM1.ConsultaSql.Fields[19].Asstring;
    FechaFirma:=DM1.ConsultaSql.Fields[20].Asstring;
    NroAdenda:=DM1.ConsultaSql.Fields[21].Asstring;
    DM1.ConsultaSQL.Close;
 end;

procedure TINFORMES.ObtenerRegistro2(id,iddato,id2,iddato2:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Nroinforme,Tipoinforme,Idadenda,Idcaserio,Aniode,Fecha,Para,Asunto,Referencia,Dni1,Dni2,Actividad1,Actividad2,Antecentes,Analisis,Conclusiones,Recomendaciones,Fechaactualizacion,Horaactualizacion,fechares,fechaFirma,NroAdenda '+
    'FROM INFORMES WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'";',true);
    Nroinforme:=DM1.ConsultaSql.Fields[0].Asstring;
    Tipoinforme:=DM1.ConsultaSql.Fields[1].Asstring;
    Idadenda:=DM1.ConsultaSql.Fields[2].Asstring;
    Idcaserio:=DM1.ConsultaSql.Fields[3].Asstring;
    Aniode:=DM1.ConsultaSql.Fields[4].Asstring;
    Fecha:=DM1.ConsultaSql.Fields[5].Asstring;
    Para:=DM1.ConsultaSql.Fields[6].Asstring;
    Asunto:=DM1.ConsultaSql.Fields[7].Asstring;
    Referencia:=DM1.ConsultaSql.Fields[8].Asstring;
    Dni1:=DM1.ConsultaSql.Fields[9].Asstring;
    Dni2:=DM1.ConsultaSql.Fields[10].Asstring;
    Actividad1:=DM1.ConsultaSql.Fields[11].Asstring;
    Actividad2:=DM1.ConsultaSql.Fields[12].Asstring;
    Antecentes:=DM1.ConsultaSql.Fields[13].Asstring;
    Analisis:=DM1.ConsultaSql.Fields[14].Asstring;
    Conclusiones:=DM1.ConsultaSql.Fields[15].Asstring;
    Recomendaciones:=DM1.ConsultaSql.Fields[16].Asstring;
    Fechaactualizacion:=DM1.ConsultaSql.Fields[17].Asstring;
    Horaactualizacion:=DM1.ConsultaSql.Fields[18].Asstring;
    FechaRes:=DM1.ConsultaSql.Fields[19].Asstring;
    FechaFirma:=DM1.ConsultaSql.Fields[20].Asstring;
    NroAdenda:=DM1.ConsultaSql.Fields[21].Asstring;
    DM1.ConsultaSQL.Close;
 end;

procedure TINFORMES.ObtenerRegistro3(id,iddato,id2,iddato2,id3,iddato3:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Nroinforme,Tipoinforme,Idadenda,Idcaserio,Aniode,Fecha,Para,Asunto,Referencia,Dni1,Dni2,Actividad1,Actividad2,Antecentes,Analisis,Conclusiones,Recomendaciones,Fechaactualizacion,Horaactualizacion,fechares,fechaFirma,NroAdenda '+
    'FROM INFORMES WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'" and '+id3+'="'+iddato3+'";',true);
    Nroinforme:=DM1.ConsultaSql.Fields[0].Asstring;
    Tipoinforme:=DM1.ConsultaSql.Fields[1].Asstring;
    Idadenda:=DM1.ConsultaSql.Fields[2].Asstring;
    Idcaserio:=DM1.ConsultaSql.Fields[3].Asstring;
    Aniode:=DM1.ConsultaSql.Fields[4].Asstring;
    Fecha:=DM1.ConsultaSql.Fields[5].Asstring;
    Para:=DM1.ConsultaSql.Fields[6].Asstring;
    Asunto:=DM1.ConsultaSql.Fields[7].Asstring;
    Referencia:=DM1.ConsultaSql.Fields[8].Asstring;
    Dni1:=DM1.ConsultaSql.Fields[9].Asstring;
    Dni2:=DM1.ConsultaSql.Fields[10].Asstring;
    Actividad1:=DM1.ConsultaSql.Fields[11].Asstring;
    Actividad2:=DM1.ConsultaSql.Fields[12].Asstring;
    Antecentes:=DM1.ConsultaSql.Fields[13].Asstring;
    Analisis:=DM1.ConsultaSql.Fields[14].Asstring;
    Conclusiones:=DM1.ConsultaSql.Fields[15].Asstring;
    Recomendaciones:=DM1.ConsultaSql.Fields[16].Asstring;
    Fechaactualizacion:=DM1.ConsultaSql.Fields[17].Asstring;
    Horaactualizacion:=DM1.ConsultaSql.Fields[18].Asstring;
    FechaRes:=DM1.ConsultaSql.Fields[19].Asstring;
    FechaFirma:=DM1.ConsultaSql.Fields[20].Asstring;
    NroAdenda:=DM1.ConsultaSql.Fields[21].Asstring;
    DM1.ConsultaSQL.Close;
 end;

procedure TINFORMES.ObtenerRegistro4(id,iddato,id2,iddato2,id3,iddato3,id4,iddato4:string);
 begin
    ActivaDM1ConsultaSQL('SELECT Nroinforme,Tipoinforme,Idadenda,Idcaserio,Aniode,Fecha,Para,Asunto,Referencia,Dni1,Dni2,Actividad1,Actividad2,Antecentes,Analisis,Conclusiones,Recomendaciones,Fechaactualizacion,Horaactualizacion,fechares,fechafirma,NroAdenda '+
    'FROM INFORMES WHERE '+id+'="'+iddato+'" and '+id2+'="'+iddato2+'" and '+id3+'="'+iddato3+'" and '+id4+'="'+iddato4+'";',true);
    Nroinforme:=DM1.ConsultaSql.Fields[0].Asstring;
    Tipoinforme:=DM1.ConsultaSql.Fields[1].Asstring;
    Idadenda:=DM1.ConsultaSql.Fields[2].Asstring;
    Idcaserio:=DM1.ConsultaSql.Fields[3].Asstring;
    Aniode:=DM1.ConsultaSql.Fields[4].Asstring;
    Fecha:=DM1.ConsultaSql.Fields[5].Asstring;
    Para:=DM1.ConsultaSql.Fields[6].Asstring;
    Asunto:=DM1.ConsultaSql.Fields[7].Asstring;
    Referencia:=DM1.ConsultaSql.Fields[8].Asstring;
    Dni1:=DM1.ConsultaSql.Fields[9].Asstring;
    Dni2:=DM1.ConsultaSql.Fields[10].Asstring;
    Actividad1:=DM1.ConsultaSql.Fields[11].Asstring;
    Actividad2:=DM1.ConsultaSql.Fields[12].Asstring;
    Antecentes:=DM1.ConsultaSql.Fields[13].Asstring;
    Analisis:=DM1.ConsultaSql.Fields[14].Asstring;
    Conclusiones:=DM1.ConsultaSql.Fields[15].Asstring;
    Recomendaciones:=DM1.ConsultaSql.Fields[16].Asstring;
    Fechaactualizacion:=DM1.ConsultaSql.Fields[17].Asstring;
    Horaactualizacion:=DM1.ConsultaSql.Fields[18].Asstring;
    FechaRes:=DM1.ConsultaSql.Fields[19].Asstring;
    FechaFirma:=DM1.ConsultaSql.Fields[20].Asstring;
    NroAdenda:=DM1.ConsultaSql.Fields[21].Asstring;
    DM1.ConsultaSQL.Close;
 end;

function TINFORMES.Buscar(id,iddato:string):boolean;
 begin
    ActivaDM1ConsultaSQL('SELECT '+id+' '+
    'FROM INFORMES WHERE '+id+'="'+iddato+'"',true);
    if DM1.ConsultaSQL.RecordCount=0 then result:=false
    else result:=true;
 end;

function TINFORMES.validar:smallint;
 begin
   result:=1;
 end;

function TINFORMES.Insertar:boolean;
begin
  result :=
  EjecutaSQL(
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
  vcampoInt(NroAdenda)+')',
  true);
end;


function TINFORMES.Actualizar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
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
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function TINFORMES.Actualizar2(Cond : string):boolean;
begin
  result :=
  EjecutaSQL(
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
  'WHERE '+cond+'',
  true);
end;

function TINFORMES.eliminar(id,iddato : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from INFORMES '+
  'WHERE '+id+'='+vcampostr(iddato)+';',
  true);
end;

function TINFORMES.eliminar2(cond : string):boolean;
begin
  result :=
  EjecutaSQL(
  'DELETE from INFORMES '+
  'WHERE '+cond+';',
  true);
end;

end.
