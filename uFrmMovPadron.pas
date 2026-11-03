unit uFrmmovPadron;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs 
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniBasicGrid, uniDBGrid, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, uniPanel, uniMemo, uniEdit, uniLabel, uniCheckBox
; 

type
  TFrmmovPadron = class(TUniForm)
    Panel1: TUniPanel;
    btnActualizar: TUniBitBtn;
    BtnNuevoMovimiento: TUniBitBtn;
    BtnModificarMovimiento: TUniBitBtn;
    BtnExportarCSV: TUniBitBtn;
    BtnEliminarMovimiento: TUniBitBtn;
    btnSalir: TUniBitBtn;
    ztabla: TZQuery;
    ds1: TDataSource;
    Zdetalle: TZQuery;
    dbrejilla: TUniDBGrid;
    UniMemo1: TUniMemo;
    edtDniUsuario: TUniEdit;
    edtCaserio: TUniEdit;
    lblnomcaserio: TUniLabel;
    lblTipoUsuario: TUniLabel;
    chkDNIUsuario: TUniCheckBox;
    UniLabel1: TUniLabel;
    edtDNITitular: TUniEdit;
    procedure btnSalirClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNuevoMovimientoClick(Sender: TObject);
    procedure BtnModificarMovimientoClick(Sender: TObject);
    procedure BtnEliminarMovimientoClick(Sender: TObject);
    procedure BtnExportarCSVClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReporteClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure ztablaAfterOpen(DataSet: TDataSet);
    procedure dbrejillaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure ActivaZ(sql1:string);
  end;

function
  FrmmovPadron: TFrmmovPadron;

implementation

{$R *.dfm}

uses uniGUIVars, MainModule, uniGUIApplication,Uniguioperadores,UniguiUSQLutils,
  uFrmDatosMovPadron, UDBModulo, ServerModule, uNativeXLSExport, udataglobal,
  Main;

 function FrmmovPadron: TFrmmovPadron;
  begin 
    Result := TFrmmovPadron(UniMainModule.GetFormInstance(TFrmmovPadron));
  end;

procedure TFrmmovPadron.btnSalirClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmmovPadron.dbrejillaDblClick(Sender: TObject);
begin
  edtCaserio.Text:=Ztabla.Fields[1].AsString;
end;

procedure TFrmmovPadron.ActivaZ(sql1:string);
begin
  Ztabla.Close;
  Ztabla.SQL.Clear;
  Ztabla.SQL.Add(FormatSQL3(sql1));
  Ztabla.Open;
end;

procedure TFrmmovPadron.btnActualizarClick(Sender: TObject);
var s,sd,fc : string;
begin
 fc:='';
 if edtCaserio.Text<>'' then
   fc:='and Idcaserio="'+edtCaserio.Text+'" ';

 {s:='select '+
    'a.IDMOVPADRON, a.IDCASERIO, a.AMBITO, a.PROVINCIA, a.DISTRITO, a.CASERIO, '+
    'a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, a.FECNAC, a.TELEFONO, '+
    'a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, a.FECNAC_CONYUGE, '+
    'a.TIPOMOVIMIENTO, a.SUBTIPOMOV, '+
    'a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '+
    'a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '+
    'a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '+                         //2024
    'a.SCACAO, a.SCAFE, a.API, a.ACUI, '+

    'ANIO_INST_CACAO_INST, ANIO_INST_CACAO_CREC, ANIO_INST_CACAO_PROD, '+
    'ANIO_INST_CAFE_INST, ANIO_INST_CAFE_CREC, ANIO_INST_CAFE_PROD, '+
    'ANIO_INST_PLA_INST, ANIO_INST_PLA_CREC, ANIO_INST_PLA_PROD, '+              //2024
    'ANIO_INST_SCACAO, ANIO_INST_SCAFE, ANIO_INST_API, ANIO_INST_ACUI, '+

    'a.DNI_TECNICO, a.NOMBRE_TECNICO, '+
    'a.OBSERVACIONES_1, a.OBSERVACIONES_2, a.OBSERVACIONES_3, a.IMAGEN1, a.IMAGEN2, '+
    'a.DNI_REFERENCIA, a.REF_NOMBRE, a.REF_APPATERNO, a.REF_APMATERNO, '+

    'a.CACAO_INST_X, a.CACAO_INST_Y, a.CACAO_INST_ALT, '+
    'a.CACAO_CREC_X, a.CACAO_CREC_Y, a.CACAO_CREC_ALT, '+
    'a.CACAO_PROD_X, a.CACAO_PROD_Y, a.CACAO_PROD_ALT, '+

    'a.CAFE_INST_X, a.CAFE_INST_Y, a.CAFE_INST_ALT, '+
    'a.CAFE_CREC_X, a.CAFE_CREC_Y, a.CAFE_CREC_ALT, '+
    'a.CAFE_PROD_X, a.CAFE_PROD_Y, a.CAFE_PROD_ALT, '+

    'a.PLA_INST_X, a.PLA_INST_Y, a.PLA_INST_ALT, '+                              //2024
    'a.PLA_CREC_X, a.PLA_CREC_Y, a.PLA_CREC_ALT, '+                              //2024
    'a.PLA_PROD_X, a.PLA_PROD_Y, a.PLA_PROD_ALT, '+                              //2024

    'a.SCACAO_X, a.SCACAO_Y, a.SCACAO_ALT, a.SCAFE_X, '+
    'a.SCAFE_Y, a.SCAFE_ALT, a.API_X, a.API_Y, a.API_ALT, '+
    'a.ACUI_X, a.ACUI_Y, a.ACUI_ALT, '+
    'a.DNI_AUTORIDAD, a.AUT_NOMBRE, a.AUT_APPATERNO, a.AUT_APMATERNO, a.AUT_FECHA, a.AUT_CARGO, '+
    'a.AUT_RESOLUCION, a.AUT_FECHA2, a.AUT_CARGO2, a.AUT_RESOLUCION2 '+
    'FROM VMOVPADRON a ';
 }
 s:='';
 sd:='';

 if Trim(edtDNITitular.Text)<>'' then sd:='and DNI_TITULAR="'+Trim(edtDNITitular.Text)+'" ';


 if Not chkDNIusuario.checked then    // visualiza de todos
    s:= s +
        'where a.idadenda="'+DataGlobal.vIdAdenda+'" '+fc+sd+
        'Order by 1'
 else                      // visualiza solo del usuario
   s:= s +
       'where a.idadenda="'+DataGlobal.vIdAdenda+'" and a.dni_tecnico="'+edtDNIUsuario.text+'"'+fc+sd+
       'Order by 1';

 //ActivaZ(s);
 //UNIMEMO1.Lines.Add(FormatSQL3(S));
 Ztabla.Close;
 Ztabla.SQL.Clear;
 Ztabla.SQL.LoadFromFile(workdir+'\sql\SELECT_VMOVPADRON.SQL');
 Ztabla.SQL.Add(FormatSQL3(s));
 Ztabla.Open;

end;

procedure TFrmmovPadron.FormShow(Sender: TObject);
begin
  // al iniciar
 Color:=ColorFormulario;
 Font.Color:=ColorFuente;

 btnActualizarClick(nil);
end;

procedure TFrmmovPadron.UniFormShow(Sender: TObject);
var Lista : TStringList;
    i : shortint; P : String;
begin
  btnActualizarClick(NIL);

  if fileexists(workdir+'\vistas.ini') and (MainForm.lblTipoUsuario.Caption<>'ADMIN') then
    begin
       Lista := TStringList.create;
          Lista.LoadFromFile(workdir+'\vistas.ini');
          for i := 0 to Lista.Count-1 do
           begin
              if Lista[i]='BTNNUEVOMOVIMIENTO=OFF' then    BTNNUEVOMOVIMIENTO.enabled:=false;
              if Lista[i]='BTNELIMINARMOVIMIENTO=OFF' then BTNELIMINARMOVIMIENTO.enabled:=false;
           end;
       Lista.Free;
    end;

  caption:=DataGlobal.VidAdenda+' MOVIMIENTOS';

  //procesa permisos personalizado desde un memo llamado mmopermisos    var i : shortint; P : String;
  // que tiene la estructura TipoUser.Formulario.Componente.Propiedad.Valor
  for i:=0 to MainForm.mmopermisos.Lines.Count-1 do
   begin
     //1            2          3           4       5
     //TipoUser.Formulario.Componente.Propiedad.Valor
     P:=MainForm.mmopermisos.Lines[i];
      if uppercase(MainForm.lbltipoUsuario.caption)=SplitCadena(P,'.',1) then
       if UpperCase(Self.Name)=SplitCadena(P,'.',2) then
        begin
         if Assigned( Self.FindComponent( SplitCadena(P,'.',3) ) ) then
            begin
              if SplitCadena(P,'.',4)='ENABLED' Then TUniControl(Self.FindComponent( SplitCadena(P,'.',3) )).Enabled:=StrToBool(SplitCadena(P,'.',5));
              if SplitCadena(P,'.',4)='VISIBLE' Then TUniControl(Self.FindComponent( SplitCadena(P,'.',3) )).Visible:=StrToBool(SplitCadena(P,'.',5));
            end
         else
           ShowMessage(Self.Name+' Error en Permiso, no se puede ubicar : '+SplitCadena(P,'.',2) );
        end;
   end;
end;

procedure TFrmmovPadron.ztablaAfterOpen(DataSet: TDataSet);
begin
dbrejilla.Columns[0].Width:=60;
dbrejilla.Columns[1].Width:=70;
dbrejilla.Columns[2].Width:=108;
dbrejilla.Columns[3].Width:=93;
dbrejilla.Columns[4].Width:=96;
dbrejilla.Columns[5].Width:=106;
dbrejilla.Columns[6].Width:=80;
dbrejilla.Columns[7].Width:=99;
dbrejilla.Columns[8].Width:=89;
dbrejilla.Columns[9].Width:=103;
dbrejilla.Columns[10].Width:=96;
dbrejilla.Columns[11].Width:=60;
dbrejilla.Columns[12].Width:=128;
dbrejilla.Columns[13].Width:=138;
dbrejilla.Columns[14].Width:=148;
dbrejilla.Columns[15].Width:=169;
dbrejilla.Columns[16].Width:=169;
                     {
dbrejilla.Columns[17].Width:=80;
dbrejilla.Columns[18].Width:=80;
dbrejilla.Columns[19].Width:=80;
dbrejilla.Columns[20].Width:=80;
dbrejilla.Columns[21].Width:=80;
dbrejilla.Columns[22].Width:=80;
dbrejilla.Columns[23].Width:=70;
dbrejilla.Columns[24].Width:=70;
dbrejilla.Columns[25].Width:=70;
dbrejilla.Columns[26].Width:=70;

dbrejilla.Columns[27].Width:=130;
dbrejilla.Columns[28].Width:=70;
dbrejilla.Columns[29].Width:=247;
dbrejilla.Columns[30].Width:=317;
dbrejilla.Columns[31].Width:=482;
dbrejilla.Columns[32].Width:=384;
dbrejilla.Columns[33].Width:=384;}
end;

procedure TFrmmovPadron.BtnNuevoMovimientoClick(Sender: TObject);
VAR S : STRING;
begin
  ActivaDM1ConsultaSQL('select sellado from adenda where idadenda="'+DataGlobal.VidAdenda+'"',false);
  s:=dm1.Consultasql.Fields[0].AsString;
  DM1.ConsultaSQL.Close;
  if ValI(s)>=1 then
   begin
     Showmessage('Esta adenda esta Sellada, NO se puede modificar');
     exit;
   end;

   FrmDatosmovPadron.edtDni_tecnico.Text :=edtDniusuario.text;
   FrmDatosmovPadron.lblTipoUsuario.Text :=lblTipoUsuario.Caption;
   FrmDatosmovPadron.btnLimpiarClick(nil);
   FrmDatosmovPadron.ShowModal;
   //btnActualizarClick(nil);
end;

procedure TFrmmovPadron.BtnModificarMovimientoClick(Sender: TObject);
VAR S : STRING;
begin
  ActivaDM1ConsultaSQL('select sellado from adenda where idadenda="'+DataGlobal.VidAdenda+'"',false);
  s:=dm1.Consultasql.Fields[0].AsString;
  DM1.ConsultaSQL.Close;
  if ValI(s)>=1 then
   begin
     Showmessage('Esta adenda esta Sellada, NO se puede modificar');
     exit;
   end;

   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
           FrmDatosmovPadron.btnLimpiarClick(nil);
           FrmDatosmovPadron.idtabla:=Ztabla.fields[0].AsString;
           FrmDatosmovPadron.editar:=1;
           FrmDAtosMovPadron.lblTipoUsuario.Caption:=lbltipousuario.Caption;
           FrmDatosmovPadron.ShowModal;
          // btnActualizarClick(nil);
        end
      else
        begin
           Showmessage('No existen registros a editar...');
        end;
    end
   ELSE
    begin
      Showmessage('Actualice la tabla antes...');
    end;
end;

procedure TFrmmovPadron.BtnEliminarMovimientoClick(Sender: TObject);
VAR S : STRING;
begin
  ActivaDM1ConsultaSQL('select sellado from adenda where idadenda="'+DataGlobal.VidAdenda+'"',false);
  s:=dm1.Consultasql.Fields[0].AsString;
  DM1.ConsultaSQL.Close;
  if ValI(s)>=1 then
   begin
     Showmessage('Esta adenda esta Sellada, NO se puede modificar');
     exit;
   end;

   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin

           MessageDlg('Esta seguro de Eliminar '+ZTABLA.Fields[0].AsString,
                mtConfirmation, [mbYes, mbNo],
                  procedure(Sender: TComponent; Res: Integer)
                  begin
                    case Res of
                      mrYes : begin
                                EjecutaSQL('DELETE FROM movpadron WHERE idmovpadron='+ZTABLA.fields[0].AsString,true);
                                EjecutaSQL('DELETE FROM movpadronActividad WHERE idmovpadron='+ZTABLA.fields[0].AsString,true);
                                btnActualizarClick(nil);
                              end;
                      mrNo :  begin
                              end;
                    end;
                  end
                );

        end
      else
        begin
           Showmessage('No existen registros a eliminar...');
        end;
    end
   ELSE
    begin
      Showmessage('Actualice la tabla antes...');
    end;
end;

procedure DatasetToCSV(zdatos : TZQuery; fname : string; c1,c2 : smallint);
var
    csv : TStringList;
    Linea : WideString;
    i,j : integer;
    apo : string;
begin
  Linea:='';
  zdatos.First;
  for i:=0 to zdatos.Fields.Count-1 do
    begin
      if i=0 then
         Linea:=strCom(zdatos.Fields[i].DisplayName,';',',')
      else
         Linea:=Linea+';'+strCom(zdatos.Fields[i].DisplayName,';',',');
    end;

  csv:=TStringList.Create;
  csv.Add(Linea);

  for i := 1 to zdatos.RecordCount do
    begin
       if i>1 then zdatos.Next;
       linea:='';
       for j := 0 to zdatos.Fields.Count-1  do
         begin
            apo:='';
            if (j=c1) or (j=c2) then
               apo:=chr(39);
            if j=0 then
               Linea:=apo+StrCom(zdatos.Fields[j].AsString,';',',')
            else
               Linea:=Linea+';'+apo+StrCom(zdatos.Fields[j].AsString,';',',');
         end;
       csv.Add(Linea);
    end;
  csv.SaveToFile(fname);
  csv.Free;
 end;

procedure TFrmmovPadron.BtnExportarCSVClick(Sender: TObject);
//VAR I : INTEGER;
var fname : string;
begin
{  // BUSQUEDA
  for i := 0 to dbrejilla.Columns.Count-1 do
   begin
     unimemo1.lines.add('dbrejilla.Columns['+stri(i)+'].Width:='+StrI(dbrejilla.Columns[i].Width)+';');
   end;  }
  fname := UniServerModule.LocalCachePath + 'MOVIMIENTOS_' + FormatDateTime('hhmmss', Now()) + '.csv'; // Crea un nombre único para el informe.

  //DataSetToXLS(Ztabla, fname);
  Ztabla.DisableControls;
    DatasetToCSV(Ztabla, fname , -1, -1);
    Ztabla.First;
  Ztabla.EnableControls;

  UniSession.SendFile(fname);
end;

procedure TFrmmovPadron.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ztabla.Close;
 Zdetalle.Close;
 //cerrarconexionessql(True);
end;

procedure TFrmmovPadron.btnReporteClick(Sender: TObject);
begin
 // REPORTE DE movPadron
end;

end.
