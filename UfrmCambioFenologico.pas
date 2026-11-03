unit UfrmCambioFenologico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMemo, uniMultiItem, uniComboBox, uniLabel,
  uniGUIBaseClasses, uniEdit, uniButton, uniBitBtn;

type
  TfrmCambioFenologico = class(TUniForm)
    cbbactividadOR: TUniComboBox;
    UniLabel3: TUniLabel;
    cbbetapaOR: TUniComboBox;
    UniLabel1: TUniLabel;
    btnCambioFenologico: TUniBitBtn;
    cbbActividadDEST: TUniComboBox;
    UniLabel2: TUniLabel;
    cbbEtapaDest: TUniComboBox;
    UniLabel4: TUniLabel;
    log: TUniMemo;
    logsql: TUniMemo;
    btnmigraact: TUniBitBtn;
    procedure UniFormShow(Sender: TObject);
    procedure cbbactividadORChange(Sender: TObject);
    procedure cbbActividadDESTChange(Sender: TObject);
    procedure btnCambioFenologicoClick(Sender: TObject);
    procedure cbbetapaORSelect(Sender: TObject);
    procedure btnmigraactClick(Sender: TObject);
  private
    { Private declarations }
    procedure CambiarActividad;
  public
    { Public declarations }
  end;

function frmCambioFenologico: TfrmCambioFenologico;

implementation
{$R *.dfm}

uses
  MainModule, uniGUIApplication,UniGuioperadores,UDBModulo,uniguiusqlutils,
  udataglobal;

function frmCambioFenologico: TfrmCambioFenologico;
begin
  Result := TfrmCambioFenologico(UniMainModule.GetFormInstance(TfrmCambioFenologico));
end;

procedure TfrmCambioFenologico.cbbActividadDESTChange(Sender: TObject);
var
  i: Integer;
begin
  cbbetapaDEST.Items.Clear;
  ActivaDM1ConSQL('select IDETAPA from ACTIVIDADETAPA a '+
                  'where a.IDACTIVIDAD="'+cbbactividadDEST.Text+'" ORDER BY ORDEN');
  for i := 1to DM1.ConSQL.RecordCount do
   begin
     if i>1 then DM1.ConSQL.Next;
     cbbetapaDEST.Items.Add(DM1.ConSQL.Fields[0].AsString);
   end;
  DM1.ConSQL.close;
end;

procedure TfrmCambioFenologico.cbbactividadORChange(Sender: TObject);
var
  i: Integer;
begin
  cbbetapaor.Items.Clear;
  ActivaDM1ConSQL('select IDETAPA from ACTIVIDADETAPA a '+
                  'where a.IDACTIVIDAD="'+cbbactividadOR.Text+'" ORDER BY ORDEN');
  for i := 1to DM1.ConSQL.RecordCount do
   begin
     if i>1 then DM1.ConSQL.Next;
     cbbetapaor.Items.Add(DM1.ConSQL.Fields[0].AsString);
   end;
  DM1.ConSQL.close;
end;

procedure TfrmCambioFenologico.cbbetapaORSelect(Sender: TObject);
var
  i: Integer;  s : string;
begin
  if cbbetapaOR.ItemIndex>-1 then
  BEGIN
  // seleccionado el origen mostramos cuantas hectareas migraran
  log.Clear;
  //-- SABER CUANTOS SE AFECTAN
  ActivaDM1ConSQL('select p.IDPADRON, '+
  '(select m.DNI from PADRON m where m.IDPADRON=p.IDPADRON), '+
  '(select m.APMATERNO from PADRON m where m.IDPADRON=p.IDPADRON), '+
  '(select m.APPATERNO from PADRON m where m.IDPADRON=p.IDPADRON), '+
  '(select m.NOMBRE from PADRON m where m.IDPADRON=p.IDPADRON), '+
  'p.IDACTIVIDAD, p.IDETAPA, p.ORDEN, p.COORX, p.COORY, p.ALTITUD, p.HAS, p.ANIO_INSTALACION, p.FECHA_INSTALACION '+
  'FROM PADRONACTIVIDAD p '+
  'WHERE p.IDACTIVIDAD="'+cbbactividadOR.Text+'" and P.IDETAPA="'+cbbetapaor.Text+'" and '+
  'p.IDPADRON in (select idpadron from padron a where a.IDADENDA="'+dataGlobal.VidAdenda+'"); ');
  Log.Lines.Add('Disponibilidad para Migracion : '+StrI(DM1.ConSQL.RecordCount));
  S:='	';
  for i := 1 to DM1.ConSQL.RecordCount do
    begin
      if i>1 then DM1.ConSQL.Next;
      Log.Lines.Add(
         DM1.ConSQL.Fields[0].AsString + s +
         DM1.ConSQL.Fields[1].AsString + s +
         DM1.ConSQL.Fields[2].AsString + s +
         DM1.ConSQL.Fields[3].AsString + s +
         DM1.ConSQL.Fields[4].AsString + s +
         DM1.ConSQL.Fields[5].AsString + s +
         DM1.ConSQL.Fields[6].AsString + s +
         DM1.ConSQL.Fields[7].AsString
      );
    end;
  END;
end;


procedure TfrmCambioFenologico.CambiarActividad;
var error : integer;  TMPDOC:STRING;
    i: Integer;
begin
error:=0;
 if (cbbactividadOR.ItemIndex=-1) or (cbbactividadDEST.ItemIndex=-1) then
  error:=1;

 // misma actividad
 if cbbactividadOR.ItemIndex=cbbactividadDest.ItemIndex then
  error:=2;

 // estapa destino mayor que la etapa origen
 if cbbEtapaDest.Text<>cbbEtapaOr.Text then
  error:=3;

 //if (error=0) and ( cbbEtapaDest.ItemIndex-cbbEtapaOr.ItemIndex<>1 ) then
  //error:=4;

 if error=0 then
  begin
    log.Lines.Add(' ');
    log.Lines.Add('Realizando el cambio');
    logsql.Lines.Clear;
    tmpDoc:=DateToStr(now)+'_'+timetostr(now);
    tmpDoc:=StrCom(tmpDoc,':','_');
    tmpDoc:=StrCom(tmpDoc,'.','');
    tmpDoc:=StrCom(tmpDoc,'/','-');
    tmpDoc:=StrCom(tmpDoc,' ','');
    tmpDoc:=StrCom(tmpDoc,' ','');

    ActivaDM1Consql('select '+
    //   0          1
    'p.IDPADRON, p.HAS, '+
    //     2             3
    'p.IDACTIVIDAD, p.IDETAPA, '+
    //           4
    '(select a.DNI from padron a where a.IDADENDA="'+dataGlobal.VidAdenda+'" and a.IDPADRON=p.IDPADRON ), '+
    //           5
    '(select a.IDCASERIO from padron a where a.IDADENDA="'+dataGlobal.VidAdenda+'" and a.IDPADRON=p.IDPADRON ) '+
    'FROM PADRONACTIVIDAD p '+
    'WHERE p.IDACTIVIDAD="'+cbbActividadOR.Text+'" and P.IDETAPA="'+cbbEtapaOR.Text+'" and '+
    'p.IDPADRON in (select idpadron from padron a where a.IDADENDA="'+dataGlobal.VidAdenda+'"); ');
    for i := 1 to DM1.ConSQL.RecordCount do
     begin

       if i>1 then DM1.ConSQL.Next;

       // AGREGANDO A HISTORIAL
       EjecutaSQL(
        'INSERT INTO HISTORIALMOVIMIENTOS (IDADENDA, DNI, IDCASERIO, TIPO_COMPROMISO, IDACTIVIDAD, IDETAPA, NRO_HAS, '+
        'CONDICION_ADENDA, CONDICION_ADENDA_DESC, TIPOMOVIMIENTO, SUBTIPOMOVIMIENTO, AE_HISTORIAL_ID, ANHIO_ADENDA) '+
        'VALUES ( '+
        '"'+dataGlobal.VidAdenda+'", '+
        '"'+DM1.ConSQL.Fields[4].AsString+'", '+
        '"'+DM1.ConSQL.Fields[5].AsString+'", '+
        '"CBFE", '+
        '"'+DM1.ConSQL.Fields[2].AsString+'", '+
        '"'+cbbEtapaDEST.Text+'", '+
        '"'+DM1.ConSQL.Fields[1].AsString+'", '+
        '"F", '+
        '"CAMBIO DE ACTIVIDAD", '+
        '"CAMBIO DE ACTIVIDAD", '+
        '"CAMBIO DE ACTIVIDAD", '+
        '1001, '+
        VcampoSTRFECHA(DateToStr(now))+');',false);
       // -------------------

       ActivaDM1AuxSQL('select COUNT(idactividad) from padronactividad where idpadron='+DM1.ConSQL.Fields[0].AsString+' and idactividad="'+CbbActividadDEST.Text+'"');
       if ValR(DM1.AuxSQL.Fields[0].AsString)>0 then
        begin
          Log.Lines.add(DM1.ConSQL.Fields[0].AsString+' Cambio con adicion a la actividad ');
          logsql.Lines.add('-- Cambio con adicion a la actividad');

          ejecutaSQL('update padronactividad set has = has + '+StrR(ValR(DM1.ConSQL.Fields[1].AsString))+
          ' where idpadron='+DM1.ConSQL.Fields[0].AsString+' and idactividad="'+CbbActividadDEST.Text+'"',false);
          logsql.Lines.add(DM1.ZEjecuta.SQL.Text);

          ejecutaSQL('delete from padronactividad '+
          'where idpadron='+DM1.ConSQL.Fields[0].AsString+' and idactividad="'+CbbActividadOR.Text+'"',false);
          logsql.Lines.add(DM1.ZEjecuta.SQL.Text);

        end
       else
        begin
         ejecutaSQL('UPDATE PADRONACTIVIDAD p set p.IDACTIVIDAD="'+ CbbActividadDEST.Text +'" '+
         'WHERE p.idpadron='+DM1.ConSQL.Fields[0].AsString+' and p.IDACTIVIDAD="'+cbbactividadOR.Text+'" and P.IDETAPA="'+cbbEtapaOR.Text+'" and '+
         'p.IDPADRON in (select idpadron from padron a where a.IDADENDA="'+dataGlobal.VidAdenda+'");',false);
         logsql.Lines.add('-- Cambio nuevo');
         logsql.Lines.add(DM1.ZEjecuta.SQL.Text);

         Log.Lines.Add(DM1.ConSQL.Fields[0].AsString+' Cambio nuevo ');

        end;
       Dm1.AuxSQL.Close;

     end;
    Dm1.ConSQL.Close;
    log.Lines.SaveToFile(workdir+'\log\CA'+tmpdoc+'.log');
    Showmessage('Cambio de Actividad ejecutado con exito...');
  end;

 Log.Lines.Add(' ');
 if error<>0 then
   Log.Lines.Add('ERROR ...');
 case error of
   1: Log.Lines.Add('Seleccione una Actividad en Origen y Destino');
   2: Log.Lines.Add('No se puede migrar la misma actividad');
   3: Log.Lines.Add('La etapa destino tiene que ser igual');
   4: Log.Lines.Add('Solo se puede migrar de una etapa a la siguiente');
 end;

end;




procedure TfrmCambioFenologico.btnCambioFenologicoClick(Sender: TObject);
var error : integer;  TMPDOC:STRING;
    i: Integer;
begin
error:=0;
 if (cbbactividadOR.ItemIndex=-1) or (cbbactividadDEST.ItemIndex=-1) then
  error:=1;

 // misma actividad
 if cbbactividadOR.ItemIndex<>cbbactividadDest.ItemIndex then
  error:=2;

 // estapa destino mayor que la etapa origen
 if cbbEtapaDest.ItemIndex<=cbbEtapaOr.ItemIndex then
  error:=3;

 if (error=0) and ( cbbEtapaDest.ItemIndex-cbbEtapaOr.ItemIndex<>1 ) then
  error:=4;

 if error=0 then
  begin
    log.Lines.Add(' ');
    log.Lines.Add('Realizando el cambio');
    logsql.Lines.Clear;
    tmpDoc:=DateToStr(now)+'_'+timetostr(now);
    tmpDoc:=StrCom(tmpDoc,':','_');
    tmpDoc:=StrCom(tmpDoc,'.','');
    tmpDoc:=StrCom(tmpDoc,'/','-');
    tmpDoc:=StrCom(tmpDoc,' ','');
    tmpDoc:=StrCom(tmpDoc,' ','');

    ActivaDM1Consql('select '+
    //   0          1
    'p.IDPADRON, p.HAS, '+
    //     2             3
    'p.IDACTIVIDAD, p.IDETAPA, '+
    //           4
    '(select a.DNI from padron a where a.IDADENDA="'+dataGlobal.VidAdenda+'" and a.IDPADRON=p.IDPADRON ), '+
    //           5
    '(select a.IDCASERIO from padron a where a.IDADENDA="'+dataGlobal.VidAdenda+'" and a.IDPADRON=p.IDPADRON ) '+
    'FROM PADRONACTIVIDAD p '+
    'WHERE p.IDACTIVIDAD="'+cbbActividadOR.Text+'" and P.IDETAPA="'+cbbEtapaOR.Text+'" and '+
    'p.IDPADRON in (select idpadron from padron a where a.IDADENDA="'+dataGlobal.VidAdenda+'"); ');
    for i := 1 to DM1.ConSQL.RecordCount do
     begin

       if i>1 then DM1.ConSQL.Next;

       // AGREGANDO A HISTORIAL
       EjecutaSQL(
        'INSERT INTO HISTORIALMOVIMIENTOS (IDADENDA, DNI, IDCASERIO, TIPO_COMPROMISO, IDACTIVIDAD, IDETAPA, NRO_HAS, '+
        'CONDICION_ADENDA, CONDICION_ADENDA_DESC, TIPOMOVIMIENTO, SUBTIPOMOVIMIENTO, AE_HISTORIAL_ID, ANHIO_ADENDA) '+
        'VALUES ( '+
        '"'+dataGlobal.VidAdenda+'", '+
        '"'+DM1.ConSQL.Fields[4].AsString+'", '+
        '"'+DM1.ConSQL.Fields[5].AsString+'", '+
        '"CBFE", '+
        '"'+DM1.ConSQL.Fields[2].AsString+'", '+
        '"'+cbbEtapaDEST.Text+'", '+
        '"'+DM1.ConSQL.Fields[1].AsString+'", '+
        '"F", '+
        '"CAMBIO FENOLOGICO", '+
        '"CAMBIO FENOLOGICO", '+
        '"CAMBIO FENOLOGICO", '+
        '1000, '+
        VcampoSTRFECHA(DateToStr(now))+');',false);
       // -------------------

       ActivaDM1AuxSQL('select COUNT(idetapa) from padronactividad where idpadron='+DM1.ConSQL.Fields[0].AsString+' and idetapa="'+cbbEtapaDest.Text+'"');
       if ValR(DM1.AuxSQL.Fields[0].AsString)>0 then
        begin
          Log.Lines.add(DM1.ConSQL.Fields[0].AsString+' Cambio con adicion a la actividad ');
          logsql.Lines.add('-- Cambio con adicion a la actividad');

          ejecutaSQL('update padronactividad set has = has + '+StrR(ValR(DM1.ConSQL.Fields[1].AsString))+
          ' where idpadron='+DM1.ConSQL.Fields[0].AsString+' and idetapa="'+cbbetapadest.Text+'"',false);
          logsql.Lines.add(DM1.ZEjecuta.SQL.Text);

          ejecutaSQL('delete from padronactividad '+
          'where idpadron='+DM1.ConSQL.Fields[0].AsString+' and idetapa="'+cbbetapaOR.Text+'"',false);
          logsql.Lines.add(DM1.ZEjecuta.SQL.Text);

        end
       else
        begin
         ejecutaSQL('UPDATE PADRONACTIVIDAD p set p.IDETAPA="'+ cbbEtapaDEST.Text +'" '+
         'WHERE p.idpadron='+DM1.ConSQL.Fields[0].AsString+' and p.IDACTIVIDAD="'+cbbactividadOR.Text+'" and P.IDETAPA="'+cbbEtapaOR.Text+'" and '+
         'p.IDPADRON in (select idpadron from padron a where a.IDADENDA="'+dataGlobal.VidAdenda+'");',false);
         logsql.Lines.add('-- Cambio nuevo');
         logsql.Lines.add(DM1.ZEjecuta.SQL.Text);

         Log.Lines.Add(DM1.ConSQL.Fields[0].AsString+' Cambio nuevo ');

        end;
       Dm1.AuxSQL.Close;

     end;
    Dm1.ConSQL.Close;
    log.Lines.SaveToFile(workdir+'\log\CF'+tmpdoc+'.log');
    Showmessage('Cambio Fenologico ejecutado con exito...');
  end;

 case error of
   1: Showmessage('Seleccione una Actividad en Origen y Destino');
   2: Showmessage('Solo se puede migrar la misma actividad');
   3: Showmessage('La etapa destino tiene que ser mayor');
   4: Showmessage('Solo se puede migrar de una etapa a la siguiente');
 end;

end;

procedure TfrmCambioFenologico.btnmigraactClick(Sender: TObject);
VAR s : string;
begin
  Prompt('Por Favor Ingrese el Pin de Seguridad', '', mtInformation, mbOKCancel,
  procedure (Sender: TComponent; AResult:Integer; AText: string)
   begin
    case AResult of
      mrOK :
       begin
        if (AText= StrCom(dateToStr(now),'/','') )then
         begin
             CambiarActividad;
         end;
       end;
    end;
   end);

end;

procedure TfrmCambioFenologico.UniFormShow(Sender: TObject);
VAR I : INTEGER;
begin
  if cbbactividadOR.Count=0 then
   BEGIN
     ActivaDM1Consql('select IDACTIVIDAD from ACTIVIDAD a '+
     'WHERE '+
     '(select count(IDACTIVIDAD) from ACTIVIDADETAPA b where b.IDACTIVIDAD=a.IDACTIVIDAD and b.IDETAPA like "%HAS%")>0');
     for i := 1 to DM1.ConSQL.RecordCount do
       begin
         if i>1 then DM1.ConSQL.Next;
         cbbactividadOR.Items.Add(DM1.ConSQL.Fields[0].AsString);
         cbbactividadDEST.Items.Add(DM1.ConSQL.Fields[0].AsString);
       end;
     DM1.ConSQL.close;
   END;
end;

end.
