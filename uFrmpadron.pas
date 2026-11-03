unit uFrmpadron;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uniBasicGrid,
  uniDBGrid, uniPanel, uniEdit, uniMultiItem, uniComboBox, uniMemo,
  uniGridExporters, uniScreenMask, uniLabel, Vcl.Menus, uniMainMenu;

type
  TFrmpadron = class(TUniForm)
    Panel1: TUniPanel;
    btnActualizar: TUniBitBtn;
    btngenerarpadron: TUniBitBtn;
    BtnExportarCSV: TUniBitBtn;
    BtnCerrarPadron: TUniBitBtn;
    BtnReporte: TUniBitBtn;
    btnSalir: TUniBitBtn;
    ztabla: TZQuery;
    ds1: TDataSource;
    Zdetalle: TZQuery;
    cbAdendas: TUniComboBox;
    uniExcelExporter1: TUniGridExcelExporter;
    btnlimpiarpadron: TUniBitBtn;
    pnlLog: TUniPanel;
    mmoLog: TUniMemo;
    UniButton1: TUniButton;
    btnAbrirPadron: TUniBitBtn;
    btnCambioFenologico: TUniBitBtn;
    edtDNIBeneficiario: TUniEdit;
    UniLabel1: TUniLabel;
    edtCaserio: TUniEdit;
    UniLabel2: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    pmPadron: TUniPopupMenu;
    EditardatosDNIdelTitular1: TUniMenuItem;
    N1: TUniMenuItem;
    N2: TUniMenuItem;
    EditarHASInstalacion1: TUniMenuItem;
    EditarHASInstalacion2: TUniMenuItem;
    N3: TUniMenuItem;
    N4: TUniMenuItem;
    VerHistorial1: TUniMenuItem;
    N5: TUniMenuItem;
    N6: TUniMenuItem;
    N7: TUniMenuItem;
    dbRejilla: TUniDBGrid;
    procedure btnSalirClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExportarCSVClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnCerrarPadronClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReporteClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure cbAdendasChange(Sender: TObject);
    procedure btngenerarpadronClick(Sender: TObject);
    procedure btnlimpiarpadronClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure btnCambioFenologicoClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure EditardatosDNIdelTitular1Click(Sender: TObject);
    procedure dbRejillaCellContextClick(Column: TUniDBGridColumn; X,
      Y: Integer);
  private
    { Private declarations }
    procedure BorradoPadron(Sender: TComponent; AResult:Integer; AText: string);
    procedure CallBackACtualizar(Sender: TComponent; Res: Integer);
    procedure GenerarPadron(Sender: TComponent; AResult:Integer; AText: string);
  public
    { Public declarations }
   procedure ActivaZ(sql1:string);
  end;

function
  Frmpadron: TFrmpadron;

implementation

{$R *.dfm}

uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,uniguiUSQLutils,UDBModulo,
  ServerModule,uNativeXLSExport, udataglobal, UfrmCambioFenologico, Main,
  uFrmSubirTitulo,System.IOUtils, uFrmDatospersonaPadron;

 function Frmpadron: TFrmpadron;
  begin 
    Result := TFrmpadron(UniMainModule.GetFormInstance(TFrmpadron));
  end;

procedure TFrmpadron.btnSalirClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmpadron.cbAdendasChange(Sender: TObject);
begin
  caption:='Padron de Beneficiarios '+cbadendas.Text;
  btnactualizarclick(nil);
end;

procedure TFrmpadron.dbRejillaCellContextClick(Column: TUniDBGridColumn; X,
  Y: Integer);
begin
  pmPadron.Popup(X,Y);
end;

procedure TFrmpadron.EditardatosDNIdelTitular1Click(Sender: TObject);
begin
   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
           FrmDatospersonaPadron.ShowModal(
             procedure (Sender: TComponent; Res:Integer)
                begin
                   btnActualizarClick(nil);
                end
           );
           FrmDatospersonaPadron.btnLimpiarClick(nil);
           FrmDatospersonaPadron.idtablaTitular:=Ztabla.FieldByName('DNI').AsString;
           FrmDatospersonaPadron.idtablaCONY:=Ztabla.FieldByName('CONY_DNI').AsString;
           FrmDatospersonaPadron.SidAdenda:=cbAdendas.Text;
           FrmDatospersonaPadron.cargardatos;
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

procedure TFrmpadron.ActivaZ(sql1:string);
begin
  Ztabla.Close;
  Ztabla.SQL.Clear;
  Ztabla.SQL.Add(FormatSQL3(sql1));
  Ztabla.Open;
end;

procedure TFrmpadron.btnActualizarClick(Sender: TObject);
var C1,C2 : string;
begin

// FEC NANC DE AMBOS Y ANIO X CADA ACT
C1:='';
C2:='';

if edtCaserio.text<>'' then c1:=' and a.idCaserio="'+edtCaserio.text+'" ';
if edtDNIBeneficiario.text<>'' then c2:=' and a.dni="'+edtDNIBeneficiario.text+'" ';

{s:=
'SELECT a.IDPADRON, a.IDADENDA,  '+
'a.IDCASERIO, a.CODIGO, a.OZ, a.AMBITO, a.DEPARTAMENTO, a.PROVINCIA, a.DISTRITO, a.CASERIO,  '+
'a.APPATERNO, a.APMATERNO, a.NOMBRE, a.DNI, a.SEXO, a.ETNIA, a.LENGUA, a.TELEFONO,  '+
'a.CONY_APPATERNO, a.CONY_APMATERNO, a.CONY_NOMBRE, a.CONY_DNI, a.CONY_SEXO, a.CONY_ETNIA, a.CONY_LENGUA,  '+
'a.ANIO_INCORPORACION,  '+
'a.INST_CACAO, a.CREC_CACAO, a.PROD_CACAO, a.TOTAL_CACAO, '+
'a.ACT_ACUICOLA, a.ACT_APICOLA, a.PCAC_SANIDAD, a.PCAF_SANIDAD, a.PROD_CAFE,  '+
'a.INST_PLA,a.CREC_PLA,a.PROD_PLA,a.TOTAL_PLA,'+
'a.COORX_CACAO, a.COORY_CACAO, a.ALTITUD_CACAO, '+
'a.COORX_CAFE, a.COORY_CAFE, a.ALTITUD_CAFE, '+
'a.COORX_PLA, a.COORY_PLA, a.ALTITUD_PLA,'+
'a.COORX_SPCC, a.COORY_SPCC, a.ALTITUD_SPCC, a.COORX_SPCF, a.COORY_SPCF, a.ALTITUD_SPCF,  '+
'a.COORX_ACUI, a.COORY_ACUI, a.ALTITUD_ACUI, a.COORX_API, a.COORY_API, a.ALTITUD_API, a.OBSERVACIONES, a.JUSTIFICACION, '+
'a.TITULOPATH,a.TITULOTIPO,a.TITULODESCRIPCION,a.TITULONOUPDATE '+
'FROM VPADRON a '+
'WHERE a.IDADENDA="'+cbadendas.Text+'" '+c1+c2+
'ORDER BY a.CODIGO ';
}
//UNIMEMO1.Lines.Add(FormatSQL3(S));
//ActivaZ(s);
Ztabla.Close;
Ztabla.SQL.Clear;
Ztabla.SQL.LoadFromFile(workdir+'\sql\SELECT_VPRADRON.SQL');
Ztabla.SQL.Add(FormatSQL3('WHERE a.IDADENDA="'+cbadendas.Text+'" '+c1+c2));
Ztabla.SQL.Add(FormatSQL3('ORDER BY a.CODIGO '));
Ztabla.Open;

dbrejilla.Columns[0].Width:=50;
dbrejilla.Columns[1].Width:=100;
dbrejilla.Columns[2].Width:=100;
dbrejilla.Columns[3].Width:=54;
dbrejilla.Columns[4].Width:=84;
dbrejilla.Columns[5].Width:=100;
dbrejilla.Columns[6].Width:=100;
dbrejilla.Columns[7].Width:=110;
dbrejilla.Columns[8].Width:=180;
dbrejilla.Columns[9].Width:=170;
dbrejilla.Columns[10].Width:=127;
dbrejilla.Columns[11].Width:=133;
dbrejilla.Columns[12].Width:=143;
dbrejilla.Columns[13].Width:=66;
dbrejilla.Columns[14].Width:=46;
dbrejilla.Columns[15].Width:=84;
dbrejilla.Columns[16].Width:=82;
dbrejilla.Columns[17].Width:=76;
dbrejilla.Columns[18].Width:=170;
dbrejilla.Columns[19].Width:=170;
dbrejilla.Columns[20].Width:=110;
dbrejilla.Columns[21].Width:=76;
dbrejilla.Columns[22].Width:=76;
dbrejilla.Columns[23].Width:=120;
dbrejilla.Columns[24].Width:=120;
dbrejilla.Columns[25].Width:=120;
dbrejilla.Columns[26].Width:=99;
dbrejilla.Columns[27].Width:=93;
dbrejilla.Columns[28].Width:=96;
dbrejilla.Columns[29].Width:=96;
dbrejilla.Columns[30].Width:=86;
dbrejilla.Columns[31].Width:=86;
dbrejilla.Columns[32].Width:=86;
dbrejilla.Columns[33].Width:=86;
dbrejilla.Columns[34].Width:=86;
dbrejilla.Columns[35].Width:=120;
dbrejilla.Columns[36].Width:=120;
dbrejilla.Columns[37].Width:=120;
dbrejilla.Columns[38].Width:=86;
dbrejilla.Columns[39].Width:=86;
dbrejilla.Columns[40].Width:=86;
dbrejilla.Columns[41].Width:=86;
dbrejilla.Columns[42].Width:=86;
dbrejilla.Columns[43].Width:=86;
dbrejilla.Columns[44].Width:=86;
dbrejilla.Columns[45].Width:=86;
dbrejilla.Columns[46].Width:=86;
dbrejilla.Columns[47].Width:=86;
dbrejilla.Columns[48].Width:=86;
dbrejilla.Columns[49].Width:=86;
dbrejilla.Columns[50].Width:=86;
dbrejilla.Columns[51].Width:=86;
dbrejilla.Columns[52].Width:=86;
dbrejilla.Columns[53].Width:=400;
dbrejilla.Columns[54].Width:=400;


dbrejilla.Columns[0].Visible:=false;
dbrejilla.Columns[1].Visible:=false;
dbrejilla.Columns[2].Visible:=false;

end;

procedure TFrmpadron.FormShow(Sender: TObject);
begin
  // al iniciar
 Color:=ColorFormulario;
 Font.Color:=ColorFuente;
end;

procedure TFrmpadron.btnlimpiarpadronClick(Sender: TObject);
Var S : String;
begin
  ActivaDM1ConsultaSQL('select sellado from adenda where idadenda="'+cbadendas.Text+'"',false);
  s:=dm1.Consultasql.Fields[0].AsString;
  DM1.ConsultaSQL.Close;
  if ValI(s)>=1 then
   begin
     Showmessage('Esta adenda esta Sellada, no se puede modificar');
     exit;
   end;

 MessageDlg('Esta seguro de Limpiar el Padron '+cbadendas.Text,
 mtConfirmation, [mbYes, mbNo],
  procedure(Sender: TComponent; Res: Integer)
  begin
    case Res of
      mrYes : begin
                Prompt('Por Favor Ingrese el Pin de Seguridad', '', mtInformation, mbOKCancel, BorradoPadron);
              end;
      mrNo :  begin

              end;
    end;
  end
 );
end;

procedure TFrmpadron.UniBitBtn1Click(Sender: TObject);
var pathPDF,CacheFile,CacheURL : string;
begin
  //titulo PDF
  FrmSubirTitulo.ShowModal(
     procedure (Sender: TComponent; Res:Integer)
        begin
           btnActualizarClick(nil);
        end
   );

  FrmSubirTitulo.DNI_titular:=Ztabla.FieldByName('DNI').AsString;
  if FileExists(Workdir+'\titulos\'+Ztabla.FieldByName('TituloPath').AsString) then
   begin
     FrmSubirTitulo.lblTituloPath.Caption:=Ztabla.FieldByName('TituloPath').AsString;
     FrmSubirTitulo.cbbTituloTipo.Text:=Ztabla.FieldByName('tituloTipo').AsString;
     FrmSubirTitulo.edtTituloDescripcion.Text:=Ztabla.FieldByName('TituloDescripcion').AsString;
     PathPDF:=Workdir+'\titulos\'+Ztabla.FieldByName('TituloPath').AsString;

     // Crea un archivo temporal en la cache y devuelve la URL pública en CacheURL
     CacheFile := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', CacheURL);

     // Copiamos el PDF existente al archivo de cache
     TFile.Copy(PathPDF, CacheFile, True);

     // Cargamos en el frame (con rompe-caché opcional)
     FrmSubirTitulo.UniURLFrame1.URL := CacheURL; // + '&v=' + IntToStr(GetTickCount);
     // UniSession.AddJS(UniURLFrame1.JSName + '.reload();'); // opcional

   end;
end;

procedure TFrmpadron.UniButton1Click(Sender: TObject);
begin
  pnllog.Visible:=false;
end;

procedure TFrmpadron.BorradoPadron(Sender: TComponent; AResult:Integer; AText: string);
begin
  if AResult = mrOK then
  begin
    if (AText= StrCom(dateToStr(now),'/','') )then
     begin
      FrmPadron.ShowMask('Limpiando....');
      UniSession.Synchronize;

      ztabla.Close;

      //2025-12 BACKUP DE TITULOS
      EjecutaSQL('delete from BACKUPTITULO;',false);

      EjecutaSQL('INSERT INTO BACKUPTITULO (IDPADRON,idcaserio,dni, TITULOPATH, TITULOTIPO, TITULODESCRIPCION,TITULONOUPDATE) '+
      'select p.IDPADRON,p.idcaserio,p.dni,p.TITULOPATH,p.TITULOTIPO,p.TITULODESCRIPCION,p.TITULONOUPDATE from padron p where p.IDADENDA="'+cbadendas.Text+'" AND p.TITULOPATH is not null',FALSE);

      EjecutaSQL('delete from padronactividad where idpadron in (select p.idpadron from padron p where p.idadenda="'+cbadendas.Text+'");' ,false);
      EjecutaSQL('delete from padron p where p.idadenda="'+cbadendas.Text+'";' ,false);
      EjecutaSQL('delete from HISTORIALMOVIMIENTOS p where p.idadenda="'+cbadendas.Text+'";' ,false);

      FrmPadron.HideMask;
      MessageDlg('Limpieza Terminada...', mtInformation, [mbOK], CallBackACtualizar );
     end
    else
      MessageDlg('Pin Incorrecto', mtInformation, [mbOK] );
  end;
end;

procedure TFrmpadron.GenerarPadron(Sender: TComponent; AResult:Integer; AText: string);
var smax,smin,excluidos,sidpadron,tmpMin,tmpMax : string;
    i : integer;
    sentencias : TStringList;
    detallado : boolean;

  Function abreviarACT(idactividad,idetapa:string):string;   // call for line 310  XREV2025
   begin
      if (idactividad='ACUI')      and (idetapa='ACUI')      then result:='ACUI';
      if (idactividad='API')       and (idetapa='API')       then result:='APIC';
      if (idactividad='BIOHUERTO') and (idetapa='HAS INST')  then result:='IBIO';
      if (idactividad='CACAO')     and (idetapa='HAS CREC')  then result:='CCAC';
      if (idactividad='CACAO')     and (idetapa='HAS INST')  then result:='ICAC';
      if (idactividad='CACAO')     and (idetapa='HAS MANT')  then result:='MCAC';
      if (idactividad='CACAO')     and (idetapa='HAS PROD')  then result:='PCAC';
      if (idactividad='CAFE')      and (idetapa='HAS CREC')  then result:='CCAF';
      if (idactividad='CAFE')      and (idetapa='HAS INST')  then result:='ICAF';
      if (idactividad='CAFE')      and (idetapa='HAS MANT')  then result:='MCAF';
      if (idactividad='CAFE')      and (idetapa='HAS PROD')  then result:='PCAF';
      if (idactividad='FARI')      and (idetapa='FARI')      then result:='FARI';
      if (idactividad='S.CACAO')   and (idetapa='HAS PROD')  then result:='SPCC';
      if (idactividad='S.CAFE')    and (idetapa='HAS PROD')  then result:='SPCF';
      if (idactividad='PLA')       and (idetapa='HAS CREC')  then result:='CPLA';
      if (idactividad='PLA')       and (idetapa='HAS INST')  then result:='IPLA';
      if (idactividad='PLA')       and (idetapa='HAS MANT')  then result:='MPLA';
      if (idactividad='PLA')       and (idetapa='HAS PROD')  then result:='PPLA';
      //2024-2
      if (idactividad='GRA')       and (idetapa='HAS INST')  then result:='IGRA';
      if (idactividad='GRA')       and (idetapa='HAS CREC')  then result:='CGRA';
      if (idactividad='GRA')       and (idetapa='HAS PROD')  then result:='PGRA';
      if (idactividad='AVI')       and (idetapa='AVI')       then result:='AVIC';
   end;

  function completafecha(s:string):string;
   begin
     if length(s)<10 then
        begin
          if s='' then
            result:='01/01/'+copy(datetostr(now),7,4)
          else
            result:='01/01/'+copy(s,1,4);
        end
     else
        result:=s;
   end;

  procedure agregahistorial(vdni,vidcaserio,vidactividad,videtapa,vnro_has,
                            vtipomovimiento,vsubtipomovimiento,vanhio_adenda:string);
  var vtipo_compromiso : string;
   begin
     vtipo_compromiso:=abreviarACT(vidactividad,videtapa);
     if valr(vnro_has)>0 then
       begin
         ejecutaSQL(formatsql3('INSERT INTO HISTORIALMOVIMIENTOS (IDADENDA, DNI, IDCASERIO, TIPO_COMPROMISO, '+
         'IDACTIVIDAD, IDETAPA, NRO_HAS, CONDICION_ADENDA, CONDICION_ADENDA_DESC, TIPOMOVIMIENTO, SUBTIPOMOVIMIENTO, '+
         'AE_HISTORIAL_ID, ANHIO_ADENDA, FECHA_INSTALACION) '+
         'VALUES ( '+
         '"'+dataGlobal.VidAdenda+'", '+
         '"'+vDNI+'", '+
         '"'+vIDCASERIO+'", '+
         '"'+vTIPO_COMPROMISO+'", '+
         '"'+vIDACTIVIDAD+'", '+
         '"'+vIDETAPA+'", '+
         '"'+vNRO_HAS+'", '+
         '"", '+
         '"", '+
         '"'+vTIPOMOVIMIENTO+'", '+
         '"'+vSUBTIPOMOVIMIENTO+'", '+
         'null, '+
         '"'+completafecha(vANHIO_ADENDA)+'", '+
         'null '+
         ') '),false);
       end;
   end;

 function extraeAnioAdenda(s : string):string;
  begin
    // ad1-2024
    // 12345678
    result := copy(s, length(s)-4+1 ,4 )
  end;

begin
  if AResult = mrOK then
  begin
    detallado:=false;
    if (AText= StrCom(dateToStr(now),'/','') )then
     begin
      FrmPadron.ShowMask('Procesando....');
      UniSession.Synchronize;

      mmoLog.lines.CLEAR;
      mmoLog.Lines.Add('INICIO : '+TIMETOSTR(TIME));
      ztabla.Close;

      smax:=ActivaDM1ConRegistro('select max(idpadron) from padron p;',0);
      smin:=ActivaDM1ConRegistro('select min(idpadron) from padron p where p.IDADENDA="'+DataGlobal.VidAdenda_Anterior+'";',0);
      excluidos := ActivaDM1ConRegistro('SELECT count(distinct m.DNI_TITULAR) FROM MOVPADRON m where m.IDADENDA="'+DataGlobal.vIdAdenda+'" and m.TIPOMOVIMIENTO="EXCLUSION" and m.SUBTIPOMOV="EXCLUSION DE PARTICIPANTES"',0);
      mmoLog.Lines.Add(' ');
      mmoLog.Lines.Add('EXCLUIDOS : '+excluidos);
      mmoLog.Lines.Add(' ');
      mmoLog.Lines.Add('ACTUALIZACION DE METAS');
      mmoLog.Lines.Add(' ');

      //-- PADRON ORIGINAL MENOS LOS DNIS EXCLUIDOS -- nota se generaron 5046 registros AUN NO NUMEROS, conservan codigo original
      // ojo los de EXCLUSION SALEN COMPLETAMENTE DEL PADRON

      // 1). INSERTO TODOS LOS REGISTRO MENOS LOS DE EXCLUSION   2025 se agrego titulo
      EjecutaSQL('INSERT INTO PADRON (IDPADRON, IDADENDA, CODIGO, IDCASERIO, OZ, AMBITO, DEPARTAMENTO, PROVINCIA, DISTRITO, CASERIO, '+
      'DNI, APPATERNO, APMATERNO, NOMBRE, SEXO, ETNIA, LENGUA, TELEFONO, FECNAC, CONY_APPATERNO, CONY_APMATERNO, CONY_NOMBRE, CONY_DNI, '+
      'CONY_SEXO, CONY_ETNIA, CONY_LENGUA, ANIO_INCORPORACION, OBSERVACIONES, JUSTIFICACION,TituloPath,TituloTipo,TituloDescripcion ) '+
      'SELECT (a.IDPADRON-'+smin+')+'+smax+'+1 idpadron,"'+DataGlobal.VidAdenda+'" IDADENDA, a.CODIGO, a.IDCASERIO, a.OZ, a.AMBITO, a.DEPARTAMENTO, a.PROVINCIA, a.DISTRITO, a.CASERIO, '+
      'a.DNI, a.APPATERNO, a.APMATERNO, a.NOMBRE, a.SEXO, a.ETNIA, a.LENGUA, a.TELEFONO, a.FECNAC, a.CONY_APPATERNO, a.CONY_APMATERNO, a.CONY_NOMBRE, a.CONY_DNI, '+
      'a.CONY_SEXO, a.CONY_ETNIA, a.CONY_LENGUA, a.ANIO_INCORPORACION, a.OBSERVACIONES, a.JUSTIFICACION, a.TituloPath,a.TituloTipo,a.TituloDescripcion  '+
      'FROM PADRON a where a.IDADENDA="'+DataGlobal.VidAdenda_Anterior+'" '+
      'AND a.DNI NOT IN '+
      '(SELECT distinct m.DNI_TITULAR FROM MOVPADRON m where m.IDADENDA="'+DataGlobal.VidAdenda+'" and m.TIPOMOVIMIENTO="EXCLUSION" and m.SUBTIPOMOV="EXCLUSION DE PARTICIPANTES"); ',false);

      //-- 1.1. AHORA JALO SUS DATOS DE ACTIVIDADES DESDE EL PADRON ANTERIOR
      EjecutaSQL('INSERT INTO PADRONACTIVIDAD (IDPADRON, IDACTIVIDAD, IDETAPA, ORDEN, COORX, COORY, ALTITUD, HAS, ANIO_INSTALACION, FECHA_INSTALACION, ANIO_ADOPCION, FECHA_ADOPCION) '+
      'select (d.IDPADRON-'+smin+')+'+smax+'+1 idpadron, d.IDACTIVIDAD, d.IDETAPA, d.ORDEN, d.COORX, d.COORY, d.ALTITUD, d.HAS, d.ANIO_INSTALACION, d.FECHA_INSTALACION,d.ANIO_ADOPCION, d.FECHA_ADOPCION '+
      'from PADRONACTIVIDAD d '+
      'where d.IDPADRON '+
      'in '+
      '(SELECT a.idpadron '+
      'FROM PADRON a where a.IDADENDA="'+DataGlobal.VidAdenda_Anterior+'" '+
      'AND a.DNI NOT IN '+
      '(SELECT distinct m.DNI_TITULAR FROM MOVPADRON m where m.IDADENDA="'+DataGlobal.VidAdenda+'" and m.TIPOMOVIMIENTO="EXCLUSION" and m.SUBTIPOMOV="EXCLUSION DE PARTICIPANTES")) ',false);


         // ahora a aplicar

         // (1) ACTUALIZACION DE METAS	INCREMENTO DE BENEFICIO		SUMA DNI TIT
         ActivaDM1ConsultaSQL('select '+
         //     0
         'm.DNI_TITULAR, '+
         //     1              2         3         4          5         6           7               8              9               10
         'ma.IDACTIVIDAD, ma.IDETAPA, ma.HAS, ma.HAS_MOV, ma.COORX, ma.COORY, ma.ALTITUD, ma.ANIO_INSTALACION, ma.ORDEN, ma.FECHA_INSTALACION, '+
         //     11
         'case M.SUBTIPOMOV '+
         '         when "INCREMENTO DE BENEFICIO" then 1 '+
         '         when "REDUCCION DE BENEFICIOS" then -1 '+
         '         else 0 '+
         'end, '+
         //      12    13       14            15
         'M.SUBTIPOMOV,0,M.tipomovimiento,m.IDCaserio '+
         'from '+
         'movpadron m inner join MOVPADRONACTIVIDAD ma using(idmovpadron) '+
         'where m.IDADENDA="'+DataGlobal.VidAdenda+'" AND M.TIPOMOVIMIENTO="ACTUALIZACION DE METAS"; ',true);

         if ( DM1.ConsultaSQL.RecordCount>0 ) then  // tengo incrementos y reducciones
           begin
             for i := 1 to DM1.ConsultaSQL.RecordCount do
              begin
                if i>1 then DM1.ConsultaSQL.Next;

                // UBICA A QUE DNI PERTENECE EL MOVIMIENTO
                ActivaDM1ConSQL('select idpadron from padron '+
                'where dni="'+DM1.ConsultaSQL.Fields[0].AsString+'" and idadenda="'+dataGlobal.VidAdenda+'";');
                sidpadron:=DM1.ConSQL.Fields[0].AsString;
                DM1.ConSQL.Close;

                // VUELVE A AGREGAR PORQUE A VECES SE EXCLUYE Y VA COMO NUEVA FAMILIA
                if valI(sidpadron)<=0 then
                  begin
                    // no existe hay que hacerle como nueva familia
                    ActivaDM1ConSQL('select Max(idpadron)+1 from padron where idadenda="'+dataGlobal.VidAdenda+'";');
                    sidpadron:=DM1.ConSQL.Fields[0].AsString;
                    DM1.ConSQL.Close;

                    EjecutaSQL('INSERT INTO PADRON (IDPADRON, IDADENDA, CODIGO, IDCASERIO, OZ, AMBITO, DEPARTAMENTO, PROVINCIA, DISTRITO, CASERIO, '+
                    'DNI, APPATERNO,APMATERNO, NOMBRE, SEXO, ETNIA, LENGUA, TELEFONO, FECNAC,  '+
                    'CONY_APPATERNO, CONY_APMATERNO, CONY_NOMBRE, CONY_DNI, CONY_SEXO, CONY_ETNIA, CONY_LENGUA, '+
                    'ANIO_INCORPORACION, OBSERVACIONES, JUSTIFICACION) '+
                    'SELECT FIRST 1 '+
                    sidpadron+', '+
                    '"'+dataGlobal.VidAdenda+'", '+
                    sidpadron+', '+
                    'm.IDCASERIO, '+
                    '(select c.OZ from caserio c where c.IDCASERIO=m.idcaserio), '+
                    '(select c.AMBITO from caserio c where c.IDCASERIO=m.idcaserio), '+
                    '(select c.DEPARTAMENTO from caserio c where c.IDCASERIO=m.idcaserio), '+
                    '(select c.PROVINCIA from caserio c where c.IDCASERIO=m.idcaserio), '+
                    '(select c.DISTRITO from caserio c where c.IDCASERIO=m.idcaserio), '+
                    '(select c.CASERIO from caserio c where c.IDCASERIO=m.idcaserio), '+
                    'm.DNI_TITULAR, '+
                    '(select p.APPATERNO from persona p where p.DNI=m.dni_titular), '+
                    '(select p.APMATERNO from persona p where p.DNI=m.dni_titular), '+
                    '(select p.NOMBRE from persona p where p.DNI=m.dni_titular), '+
                    '(select p.SEXO from persona p where p.DNI=m.dni_titular), '+
                    '(select p.ETNIA from persona p where p.DNI=m.dni_titular), '+
                    '(select p.LENGUA from persona p where p.DNI=m.dni_titular), '+
                    '(coalesce((select first 1 p.TELEFONO from MOVPADRON p where p.dni_titular=m.dni_titular order by p.idmovpadron desc),(select p.TELEFONO from persona p where p.DNI=m.dni_titular))), '+
                    '(select p.FECNAC from persona p where p.DNI=m.dni_titular), '+
                    '(select p.APPATERNO from persona p where p.DNI=m.DNI_CONYUGE) APPATERNO_CNY, '+
                    '(select p.APMATERNO from persona p where p.DNI=m.DNI_CONYUGE) APMATERNO_CNY, '+
                    '(select p.NOMBRE from persona p where p.DNI=m.DNI_CONYUGE) NOMBRE_CNY, '+
                    'm.DNI_CONYUGE, '+
                    '(select p.SEXO from persona p where p.DNI=m.DNI_CONYUGE) SEXO_CNY, '+
                    '(select p.ETNIA from persona p where p.DNI=m.DNI_CONYUGE) ETNIA_CNY, '+
                    '(select p.LENGUA from persona p where p.DNI=m.DNI_CONYUGE) LENGUA_CNY, '+
                    '"'+StrI(SysUtils.CurrentYear)+'" ANIO_INCORPORACION, '+
                    '(SELECT p.OBSERVACION FROM CADENAOBSERVACIONES("'+dataGlobal.VidAdenda+'", "'+DM1.ConsultaSQL.Fields[0].AsString+'") p), '+
                    'OBSERVACIONES_3 '+
                    'FROM MOVPADRON m WHERE m.IDADENDA="'+dataGlobal.VidAdenda+'" and '+
                    'm.DNI_TITULAR="'+DM1.ConsultaSQL.Fields[0].AsString+'" and m.TIPOMOVIMIENTO="ACTUALIZACION DE METAS" ORDER BY M.IDMOVPADRON DESC',false);  //2023 EL ULTIMO
                    mmoLog.lines.add('XYZ_REV1 SE VOLVIO A AGREGAR ULTV_MOV '+sidpadron+' A DNI='+DM1.ConsultaSQL.Fields[0].AsString+' ACT='+DM1.ConsultaSQL.Fields[1].AsString+' ETA='+DM1.ConsultaSQL.Fields[2].AsString);
                    //mmoLog.Lines.Add(DM1.ZEjecuta.SQL.Text);
                  end;


                // VUELVE A AGREGAR SUS ACTIVIDADES PORQUE A VECES SE EXCLUYE Y VA COMO NUEVA FAMILIA
                if valI(sidpadron)>0 then
                  begin
                    // BUSCANDO SUS HECTAREAS PERDIDAS
                    ActivaDM1ConSQL('select HAS '+
                    'FROM PADRONACTIVIDAD '+
                    'WHERE IDPADRON='+sidpadron+' and IDACTIVIDAD="'+DM1.ConsultaSQL.Fields[1].AsString+'" and IDETAPA="'+DM1.ConsultaSQL.Fields[2].AsString+'"');
                    if DM1.ConSQL.RecordCount=0 then  // toca un insert no hay el movimiento
                      begin
                        EjecutaSQL('INSERT INTO PADRONACTIVIDAD (IDPADRON, IDACTIVIDAD, IDETAPA, ORDEN, COORX, COORY, ALTITUD,'+
                        'HAS, ANIO_INSTALACION, FECHA_INSTALACION, ANIO_ADOPCION, FECHA_ADOPCION ) '+
                        ' VALUES ( '+
                        sidpadron+', '+
                        vcampostr(DM1.ConsultaSQL.Fields[1].AsString)+', '+
                        vcampostr(DM1.ConsultaSQL.Fields[2].AsString)+', '+
                        vcampostr(DM1.ConsultaSQL.Fields[9].AsString)+', '+
                        vcampostr(DM1.ConsultaSQL.Fields[5].AsString)+', '+
                        vcampostr(DM1.ConsultaSQL.Fields[6].AsString)+', '+
                        vcampostr(DM1.ConsultaSQL.Fields[7].AsString)+', '+
                        vcampostr(DM1.ConsultaSQL.Fields[4].AsString)+', '+
                        vcampostr(DM1.ConsultaSQL.Fields[8].AsString)+', '+
                        vcampostrFecha(DM1.ConsultaSQL.Fields[10].AsString)+', '+
                        vcampostr(extraeAnioAdenda(DataGlobal.vIdAdenda))+', '+
                        vcampostrFecha('')+' '+
                        '); ',false);
                        mmoLog.lines.add('SE RE-AGREGO ACTIVIDAD '+SIDPADRON+' DNI='+DM1.ConsultaSQL.Fields[0].AsString+' ACT='+DM1.ConsultaSQL.Fields[1].AsString+' ETA='+DM1.ConsultaSQL.Fields[2].AsString);

                        // ojo he vuelto a agregar su actividade pero pueda ser que esta tenga una operacion de incremento o decremento
                        // 2025 caso que se habia excluido pero regreso por que tenia un ACUI QUE REGRESE Y NO DIO QUITARSE, AHORA LO QUITO
                        {
                        se desactivo en caso de haber incremento pasaba a sumar el incremento a la insercion
                        EjecutaSQL('UPDATE PADRONACTIVIDAD SET '+
                        'HAS = HAS + '+
                        //          HAS en adenda anterior                          HAS_MOV en movimientos
                        StrR( ValR(DM1.ConsultaSQL.Fields[4].AsString)*ValR(DM1.ConsultaSQL.Fields[11].AsString) )+' '+
                        'WHERE IDPADRON='+sidpadron+' and IDACTIVIDAD="'+DM1.ConsultaSQL.Fields[1].AsString+'" and IDETAPA="'+DM1.ConsultaSQL.Fields[2].AsString+'"',false);
                        mmoLog.lines.add('SE ACTUALIZO POR RE-INSERCION '+SIDPADRON+' DNI='+DM1.ConsultaSQL.Fields[0].AsString+' ACT='+DM1.ConsultaSQL.Fields[1].AsString+' ETA='+DM1.ConsultaSQL.Fields[2].AsString+' HAS_ANT='+DM1.ConSQL.Fields[0].AsString+' HAS_MOV='+DM1.ConsultaSQL.Fields[4].AsString+' TIPO OP='+DM1.ConsultaSQL.Fields[12].AsString);
                        }

                      end
                    else
                     begin  // toca un update
                        EjecutaSQL('UPDATE PADRONACTIVIDAD SET '+
                        'COORX='+vcampostr(DM1.ConsultaSQL.Fields[5].AsString)+', '+
                        'COORY='+vcampostr(DM1.ConsultaSQL.Fields[6].AsString)+', '+
                        'ALTITUD='+vcampostr(DM1.ConsultaSQL.Fields[7].AsString)+', '+
                        'HAS='+
                        //          HAS en adenda anterior                          HAS_MOV en movimientos
                        StrR( ValR(DM1.ConSQL.Fields[0].AsString) + ValR(DM1.ConsultaSQL.Fields[4].AsString)*ValR(DM1.ConsultaSQL.Fields[11].AsString) )+', '+
                        'ANIO_INSTALACION='+vcampostr(DM1.ConsultaSQL.Fields[8].AsString)+', '+
                        'FECHA_INSTALACION='+vcampostrFECHA(DM1.ConsultaSQL.Fields[10].AsString)+' '+
                        'WHERE IDPADRON='+sidpadron+' and IDACTIVIDAD="'+DM1.ConsultaSQL.Fields[1].AsString+'" and IDETAPA="'+DM1.ConsultaSQL.Fields[2].AsString+'"',false);
                        mmoLog.lines.add('SE ACTUALIZO '+SIDPADRON+' DNI='+DM1.ConsultaSQL.Fields[0].AsString+' ACT='+DM1.ConsultaSQL.Fields[1].AsString+' ETA='+DM1.ConsultaSQL.Fields[2].AsString+' HAS_ANT='+DM1.ConSQL.Fields[0].AsString+' HAS_MOV='+DM1.ConsultaSQL.Fields[4].AsString+' TIPO OP='+DM1.ConsultaSQL.Fields[12].AsString);

                        if (DM1.ConsultaSQL.Fields[0].AsString='01009293') and (FALSE) then //debug2023
                          begin
                             mmoLog.lines.add(DM1.ZEjecuta.SQL.Text);
                          end;

                     end;
                     //agregahistorial(vdni,vidcaserio,vidactividad,videtapa,vnro_has,vtipomovimiento,vsubtipomovimiento,vanhio_adenda);
                     agregahistorial(DM1.ConsultaSQL.Fields[0].AsString,DM1.ConsultaSQL.Fields[15].AsString,DM1.ConsultaSQL.Fields[1].AsString,
                     DM1.ConsultaSQL.Fields[2].AsString,DM1.ConsultaSQL.Fields[4].AsString,
                     DM1.ConsultaSQL.Fields[14].AsString,DM1.ConsultaSQL.Fields[12].AsString,DM1.ConsultaSQL.Fields[8].AsString);
                  end;
                  DM1.ConSQL.Close;
              end;
           end;






         mmoLog.Lines.Add(' ');
         mmoLog.Lines.Add('INCORPORACION DE PARTICIPANTES, NUEVA, REEMPLAZO, CAMBIO TITULARIDAD');
         mmoLog.Lines.Add(' ');


         // ahora a aplicar
         // (2) INCORPORACION DE PARTICIPANTES, NUEVA, REEMPLAZO, CAMBIO TITULARIDAD
         ActivaDM1ConsultaSQL('select '+
         //     0
         'm.DNI_TITULAR, '+
         //     1              2         3         4          5         6           7               8              9               10
         'ma.IDACTIVIDAD, ma.IDETAPA, ma.HAS, ma.HAS_MOV, ma.COORX, ma.COORY, ma.ALTITUD, ma.ANIO_INSTALACION, ma.ORDEN, ma.FECHA_INSTALACION, '+
         //     11
         'case M.SUBTIPOMOV '+
         '         when "NUEVA FAMILIA" then 1 '+
         '         when "REEMPLAZO DE FAMILIA" then 2 '+
         '         when "CAMBIO DE TITULARIDAD" then 3 '+
         '         else 0 '+
         'end, '+
         //      12           13                14           15             16
         'M.SUBTIPOMOV,M.DNI_REFERENCIA,m.TIPOMOVIMIENTO,m.IDCaserio, m.IDMOVPADRON '+
         'from '+
         'movpadron m inner join MOVPADRONACTIVIDAD ma using(idmovpadron) '+
         'where m.IDADENDA="'+DataGlobal.VidAdenda+'" AND ma.HAS_MOV is not null and ma.HAS_MOV<>0 '+
         ' AND (M.TIPOMOVIMIENTO="INCORPORACION" OR M.TIPOMOVIMIENTO="CAMBIO DE TITULARIDAD");',true);
         //order by IDMOVPADRON;  // and IDMOVPADRON IN (1917,1892)
         if detallado then mmoLog.Lines.Add('-- abc --------------');
         if detallado then mmoLog.Lines.Add(DM1.ConsultaSQL.SQL.Text);
         if detallado then mmoLog.Lines.Add('-- abc '+StrI(DM1.ConsultaSQL.RecordCount)+' registros--------------');

         if ( DM1.ConsultaSQL.RecordCount>0 ) then  // tengo datos
           begin
             if detallado then mmoLog.Lines.Add('INICIO FOR1 ');
             for i := 1 to DM1.ConsultaSQL.RecordCount do
              begin
                if i>1 then DM1.ConsultaSQL.Next;

                ActivaDM1ConSQL('select idpadron from padron '+
                'where dni="'+DM1.ConsultaSQL.Fields[0].AsString+'" and idadenda="'+dataGlobal.VidAdenda+'";');
                sidpadron:=DM1.ConSQL.Fields[0].AsString;
                DM1.ConSQL.Close;
                if detallado then mmoLog.Lines.Add('Busque el ID Padron con DNI="'+DM1.ConsultaSQL.Fields[0].AsString+'" y Adenda="'+dataGlobal.VidAdenda+'" RESULTADO tengo sidpadron="'+sidpadron+'"');
                //'++'

                // GENERAR NUEVO ASIENTO EN EL PADRON EN EL CASO DE NUEVAS FAMILIAS
                if ValI(sidpadron)<=0 then  // no hay su ID en el Padron entonces le calculo uno nuevo
                  begin
                    ActivaDM1ConSQL('select Max(idpadron)+1 from padron where idadenda="'+dataGlobal.VidAdenda+'";');
                    sidpadron:=DM1.ConSQL.Fields[0].AsString;
                    DM1.ConSQL.Close;

                    EjecutaSQL('INSERT INTO PADRON (IDPADRON, IDADENDA, CODIGO, IDCASERIO, OZ, AMBITO, DEPARTAMENTO, PROVINCIA, DISTRITO, CASERIO, '+
                    'DNI, APPATERNO,APMATERNO, NOMBRE, SEXO, ETNIA, LENGUA, TELEFONO, FECNAC,  '+
                    'CONY_APPATERNO, CONY_APMATERNO, CONY_NOMBRE, CONY_DNI, CONY_SEXO, CONY_ETNIA, CONY_LENGUA, '+
                    'ANIO_INCORPORACION, OBSERVACIONES, JUSTIFICACION) '+
                    'SELECT FIRST 1 '+
                    sidpadron+', '+
                    '"'+dataGlobal.VidAdenda+'", '+
                    sidpadron+', '+
                    'm.IDCASERIO, '+
                    '(select c.OZ from caserio c where c.IDCASERIO=m.idcaserio), '+
                    '(select c.AMBITO from caserio c where c.IDCASERIO=m.idcaserio), '+
                    '(select c.DEPARTAMENTO from caserio c where c.IDCASERIO=m.idcaserio), '+
                    '(select c.PROVINCIA from caserio c where c.IDCASERIO=m.idcaserio), '+
                    '(select c.DISTRITO from caserio c where c.IDCASERIO=m.idcaserio), '+
                    '(select c.CASERIO from caserio c where c.IDCASERIO=m.idcaserio), '+
                    'm.DNI_TITULAR, '+
                    '(select p.APPATERNO from persona p where p.DNI=m.dni_titular), '+
                    '(select p.APMATERNO from persona p where p.DNI=m.dni_titular), '+
                    '(select p.NOMBRE from persona p where p.DNI=m.dni_titular), '+
                    '(select p.SEXO from persona p where p.DNI=m.dni_titular), '+
                    '(select p.ETNIA from persona p where p.DNI=m.dni_titular), '+
                    '(select p.LENGUA from persona p where p.DNI=m.dni_titular), '+
                    '(coalesce((select first 1 p.TELEFONO from MOVPADRON p where p.dni_titular=m.dni_titular order by p.idmovpadron desc),(select p.TELEFONO from persona p where p.DNI=m.dni_titular))), '+
                    '(select p.FECNAC from persona p where p.DNI=m.dni_titular), '+
                    '(select p.APPATERNO from persona p where p.DNI=m.DNI_CONYUGE) APPATERNO_CNY, '+
                    '(select p.APMATERNO from persona p where p.DNI=m.DNI_CONYUGE) APMATERNO_CNY, '+
                    '(select p.NOMBRE from persona p where p.DNI=m.DNI_CONYUGE) NOMBRE_CNY, '+
                    'm.DNI_CONYUGE, '+
                    '(select p.SEXO from persona p where p.DNI=m.DNI_CONYUGE) SEXO_CNY, '+
                    '(select p.ETNIA from persona p where p.DNI=m.DNI_CONYUGE) ETNIA_CNY, '+
                    '(select p.LENGUA from persona p where p.DNI=m.DNI_CONYUGE) LENGUA_CNY, '+
                    '"'+StrI(SysUtils.CurrentYear)+'" ANIO_INCORPORACION, '+
                    '(SELECT p.OBSERVACION FROM CADENAOBSERVACIONES("'+dataGlobal.VidAdenda+'", "'+DM1.ConsultaSQL.Fields[0].AsString+'") p), '+
                    'OBSERVACIONES_3 '+
                    'FROM MOVPADRON m WHERE m.IDADENDA="'+dataGlobal.VidAdenda+'" and '+
                    'm.DNI_TITULAR="'+DM1.ConsultaSQL.Fields[0].AsString+'" AND (M.TIPOMOVIMIENTO="INCORPORACION" OR M.TIPOMOVIMIENTO="CAMBIO DE TITULARIDAD") ORDER BY M.IDMOVPADRON DESC',false);
                     if detallado then mmoLog.lines.add('   al No haber calcule nuevo sidpadron='+sidpadron+' A DNI_Titular='+DM1.ConsultaSQL.Fields[0].AsString+' ACT='+DM1.ConsultaSQL.Fields[1].AsString+' ETA='+DM1.ConsultaSQL.Fields[2].AsString+' desde MOVPadron');
                     //mmoLog.Lines.Add(DM1.ZEjecuta.SQL.Text);
                  end;

                // AHORA AGREGO SUS ACTIVIDADES
                ActivaDM1ConSQL('select HAS '+
                'FROM PADRONACTIVIDAD '+
                'WHERE IDPADRON='+sidpadron+' and IDACTIVIDAD="'+DM1.ConsultaSQL.Fields[1].AsString+'" and IDETAPA="'+DM1.ConsultaSQL.Fields[2].AsString+'"');
                //mmoLog.Lines.Add('-- def --------------');
                if detallado then mmoLog.Lines.Add('   '+DM1.ConSQL.SQL.Text);
                if detallado then mmoLog.Lines.Add('   Busco si tiene PADRONACTIVIDAD con WHERE IDPADRON='+sidpadron+' and IDACTIVIDAD="'+DM1.ConsultaSQL.Fields[1].AsString+'" and IDETAPA="'+DM1.ConsultaSQL.Fields[2].AsString+'"');
                if detallado then mmoLog.Lines.Add('   nro Reg ='+StrI(DM1.ConSQL.RecordCount));

                if DM1.ConSQL.RecordCount=0 then  // toca un insert no hay el movimiento
                  begin
                    // SAMPLE  23142928 -> 10987
                    EjecutaSQL('INSERT INTO PADRONACTIVIDAD (IDPADRON, IDACTIVIDAD, IDETAPA, ORDEN, COORX, COORY, ALTITUD, HAS, ANIO_INSTALACION, FECHA_INSTALACION, ANIO_ADOPCION, FECHA_ADOPCION ) '+
                    ' VALUES ( '+
                    sidpadron+', '+
                    vcampostr(DM1.ConsultaSQL.Fields[1].AsString)+', '+
                    vcampostr(DM1.ConsultaSQL.Fields[2].AsString)+', '+
                    vcampostr(DM1.ConsultaSQL.Fields[9].AsString)+', '+
                    vcampostr(DM1.ConsultaSQL.Fields[5].AsString)+', '+
                    vcampostr(DM1.ConsultaSQL.Fields[6].AsString)+', '+
                    vcampostr(DM1.ConsultaSQL.Fields[7].AsString)+', '+
                    vcampostr(DM1.ConsultaSQL.Fields[4].AsString)+', '+
                    vcampostr(DM1.ConsultaSQL.Fields[8].AsString)+', '+
                    vcampostrFecha(DM1.ConsultaSQL.Fields[10].AsString)+', '+
                    vcampostr(extraeAnioAdenda(dataGlobal.VidAdenda))+', '+
                    vcampostrFecha('')+' '+
                    '); ',false);
                    if detallado then mmoLog.lines.add('      Como no tenia agrego con sidpadron='+SIDPADRON+' DNI_TIT='+DM1.ConsultaSQL.Fields[0].AsString+' ACT='+DM1.ConsultaSQL.Fields[1].AsString+' ETA='+DM1.ConsultaSQL.Fields[2].AsString+' TIPO_OP='+DM1.ConsultaSQL.Fields[12].AsString);
                    // 2023 pero el IDcaserio del beneficiario debe ser igual al de la actividad...
                    ActivaDM1ConSQL('select idcaserio from padron where idpadron="'+sidpadron+'"');
                    if DM1.ConSQL.Fields[0].AsString<>DM1.ConsultaSQL.fields[15].AsString then
                     begin
                       mmoLog.lines.add('      ADVERTENCIA, el caserio del beneficiario '+DM1.ConsultaSQL.fields[0].AsString+' es '+DM1.ConSQL.Fields[0].AsString+' no es el mismo de la actividad '+DM1.ConsultaSQL.fields[15].AsString +' , se actualiza al caserio de la actividad...');
                       ActivaDM1ConSQL('select AMBITO,DEPARTAMENTO,PROVINCIA,DISTRITO,CASERIO from caserio where idcaserio="'+DM1.ConsultaSQL.fields[15].AsString+'"');
                       EjecutaSQL('update padron set '+
                                  'idcaserio="'+DM1.ConsultaSQL.fields[15].AsString+'",'+
                                  'AMBITO="'+DM1.ConSQL.Fields[0].AsString+'",'+
                                  'DEPARTAMENTO="'+DM1.ConSQL.Fields[1].AsString+'",'+
                                  'PROVINCIA="'+DM1.ConSQL.Fields[2].AsString+'",'+
                                  'DISTRITO="'+DM1.ConSQL.Fields[3].AsString+'",'+
                                  'CASERIO="'+DM1.ConSQL.Fields[4].AsString+'" '+
                                  'where idpadron="'+sidpadron+'";',false);

                     end;

                  end
                else
                 begin  // toca un update
                    EjecutaSQL('UPDATE PADRONACTIVIDAD SET '+
                    'COORX='+vcampostr(DM1.ConsultaSQL.Fields[5].AsString)+', '+
                    'COORY='+vcampostr(DM1.ConsultaSQL.Fields[6].AsString)+', '+
                    'ALTITUD='+vcampostr(DM1.ConsultaSQL.Fields[7].AsString)+', '+
                    'HAS='+StrR( ValR(DM1.ConSQL.Fields[0].AsString) + ValR(DM1.ConsultaSQL.Fields[4].AsString) )+', '+
                    'ANIO_INSTALACION='+vcampostr(DM1.ConsultaSQL.Fields[8].AsString)+', '+
                    'FECHA_INSTALACION='+vcampostrFECHA(DM1.ConsultaSQL.Fields[10].AsString)+' '+
                    'WHERE IDPADRON='+sidpadron+' and IDACTIVIDAD="'+DM1.ConsultaSQL.Fields[1].AsString+'" and IDETAPA="'+DM1.ConsultaSQL.Fields[2].AsString+'"',false);
                    mmoLog.lines.add('      actualizo las actividades enncontradas con sidpadron '+SIDPADRON+' DNI_TIT='+DM1.ConsultaSQL.Fields[0].AsString+' ACT='+DM1.ConsultaSQL.Fields[1].AsString+' ETA='+DM1.ConsultaSQL.Fields[2].AsString+' HAS_ANT='+DM1.ConSQL.Fields[0].AsString+' HAS_MOV='+DM1.ConsultaSQL.Fields[4].AsString+' TIPO_OP='+DM1.ConsultaSQL.Fields[12].AsString);
                 end;
               DM1.ConSQL.Close;

               // AHORA DEBO RESTAR AL REFERNCIA   'CAMBIO O REEMPLAZO HAY REFERENCIA'
               if ValI(DM1.ConsultaSQL.Fields[11].AsString) in [2,3] then
                begin  // Cambio y Reemplazo restar las HAS a las referencias

                     // UBICO AL REFERENCIA
                    ActivaDM1ConSQL('select idpadron from padron '+
                    'where dni="'+DM1.ConsultaSQL.Fields[13].AsString+'" and idadenda="'+dataGlobal.VidAdenda+'";');
                    sidpadron:=DM1.ConSQL.Fields[0].AsString;
                    DM1.ConSQL.Close;
                    if detallado then mmoLog.lines.add('   Busco referencia con  where dni="'+DM1.ConsultaSQL.Fields[13].AsString+'" and idadenda="'+dataGlobal.VidAdenda+'"; RESULTADO sidpadron="'+sidpadron+'"');

                    if sidpadron='' then
                      begin
                        mmoLog.lines.add('      ERROR NO HAY EN PADRON'+
                        ' DNI_REF='+DM1.ConsultaSQL.Fields[13].AsString+
                        ' PARA EL DNI_TIT='+DM1.ConsultaSQL.Fields[0].AsString+
                        ' ACT='+DM1.ConsultaSQL.Fields[1].AsString+
                        ' ETA='+DM1.ConsultaSQL.Fields[2].AsString+
                        ' HAS_MOV='+DM1.ConsultaSQL.Fields[4].AsString+
                        ' TIPO OP='+DM1.ConsultaSQL.Fields[12].AsString);
                      end
                    else
                      begin
                        ActivaDM1ConSQL('select HAS '+
                        'FROM PADRONACTIVIDAD '+
                        'WHERE IDPADRON='+sidpadron+' and IDACTIVIDAD="'+DM1.ConsultaSQL.Fields[1].AsString+'" and IDETAPA="'+DM1.ConsultaSQL.Fields[2].AsString+'"');

                        EjecutaSQL('UPDATE PADRONACTIVIDAD SET '+
                        'HAS='+StrR( ValR(DM1.ConSQL.Fields[0].AsString) - ValR(DM1.ConsultaSQL.Fields[4].AsString) )+' '+
                        'WHERE IDPADRON='+sidpadron+' and IDACTIVIDAD="'+DM1.ConsultaSQL.Fields[1].AsString+'" and IDETAPA="'+DM1.ConsultaSQL.Fields[2].AsString+'"',false);
                        mmoLog.lines.add('      Actualizo Referencia restando '+SIDPADRON+' DNI_REF='+DM1.ConsultaSQL.Fields[13].AsString+' ACT='+DM1.ConsultaSQL.Fields[1].AsString+' ETA='+DM1.ConsultaSQL.Fields[2].AsString+' HAS_ANT='+DM1.ConSQL.Fields[0].AsString+' HAS_MOV='+DM1.ConsultaSQL.Fields[4].AsString+' TIPO OP='+DM1.ConsultaSQL.Fields[12].AsString);
                      end;

                end;
               //agregahistorial(vdni,vidcaserio,vidactividad,videtapa,vnro_has,vtipomovimiento,vsubtipomovimiento,vanhio_adenda);
               agregahistorial(DM1.ConsultaSQL.Fields[0].AsString,DM1.ConsultaSQL.Fields[15].AsString,DM1.ConsultaSQL.Fields[1].AsString,
               DM1.ConsultaSQL.Fields[2].AsString,DM1.ConsultaSQL.Fields[4].AsString,
               DM1.ConsultaSQL.Fields[14].AsString,DM1.ConsultaSQL.Fields[12].AsString,DM1.ConsultaSQL.Fields[8].AsString);
              end;
              if detallado then mmoLog.Lines.Add('FIN FOR1');
           end;


         // REVISANDO INCONSISTENCIAS, COMO HECTAREAS NEGATIVAS Y POR ENCIMA DE 2 HAS
         tmpMin:='0';
         tmpMax:='2';
         ActivaDM1ConsultaSQL('SELECT a.IDPADRON,a.dni,a.APPATERNO,a.APMATERNO,a.NOMBRE, '+
         'd.IDACTIVIDAD,d.IDETAPA,d.HAS '+
         'FROM PADRON a inner join PADRONACTIVIDAD d using (idpadron) '+
         'WHERE a.IDPADRON IN '+
         '(SELECT pa.IDPADRON FROM PADRONACTIVIDAD pa where pa.IDPADRON in '+
         '(select IDPADRON from PADRON p where p.IDADENDA="AD03-2022") '+
         'and (pa.HAS<'+tmpMin+' or pa.has>'+tmpMax+') ) '+
         'order by 3,4,5  ',true);
         if (DM1.ConsultaSQL.RecordCount>0) and (true) then  //DEBUG 2023
           begin
             mmoLog.Lines.Add(' ');
             mmoLog.Lines.Add('!!!! SE ENCONTRARON INCOSISTENCIAS : ');
             mmoLog.Lines.Add(' ');
             Sentencias := TStringList.Create;
             for i := 1 to DM1.ConsultaSQL.RecordCount do
               begin
                  if i>1 then DM1.ConsultaSQL.Next;
                  //if ( ValR(DM1.consultaSQL.fields[7].AsString)<ValR(tmpMin) ) and ( ValR(DM1.consultaSQL.fields[7].AsString)>ValR(tmpMax) )  then
                  mmoLog.Lines.Add(DM1.consultaSQL.fields[0].AsString+' '+
                  DM1.consultaSQL.fields[1].AsString+' '+
                  DM1.consultaSQL.fields[2].AsString+' '+
                  DM1.consultaSQL.fields[3].AsString+' '+
                  DM1.consultaSQL.fields[4].AsString+' '+
                  DM1.consultaSQL.fields[5].AsString+' '+
                  DM1.consultaSQL.fields[6].AsString+' '+
                  DM1.consultaSQL.fields[7].AsString);
               end;
             mmoLog.Lines.Add(' ');
           end;

         //AHORA 2023
         mmoLog.Lines.Add(' ');
         mmoLog.Lines.Add('2023rev7 BUSCANDO HAS EN PADRONACTIVIDAD SIN HECTAREAS ...');
         ActivaDM1ConsultaSQL('select count(has) from PADRONACTIVIDAD where has=0 or has IS null',true);
         if DM1.ConsultaSQL.RecordCount>0 then
          begin
            mmoLog.Lines.Add('  SE ENCONTRARON '+StrI(DM1.ConsultaSQL.RecordCount)+' REGISTROS CON HAS=0 EN PADRON ACTIVIDAD, eliminando...');
            EJecutaSQL('delete from PADRONACTIVIDAD where has=0 or has IS null',false);
          end
         else
          mmoLog.Lines.Add('  NO SE ENCONTRARON HAS=0 EN PADRON ACTIVIDAD');

         //11/04/2023 ahroa a los que quedaron con cero debo retirarlos
         mmoLog.Lines.Add(' ');
         mmoLog.Lines.Add('RETIRO DEL PADRON DE PARTICIPANTES QUE QUEDARON CON CERO HAS EN TODOS SUS MOVIS');
         mmoLog.Lines.Add(' ');
         ActivaDM1ConsultaSQL('SELECT a.IDPADRON,a.dni,a.APPATERNO,a.APMATERNO,a.NOMBRE FROM PADRON a WHERE a.IDPADRON IN '+
         '(SELECT pa.IDPADRON FROM PADRONACTIVIDAD pa where pa.IDPADRON in '+
         '(select IDPADRON from PADRON p where p.IDADENDA="'+ dataGlobal.VidAdenda +'") '+
         'group by pa.IDPADRON '+
         'having sum(pa.HAS)=0) '+
         'order by 3,4,5 ',true);
          if ( DM1.ConsultaSQL.RecordCount>0 ) and (true) then  // debug 2023 tengo datos de PARTICIPANTES CON CERO HECTAREAS
            begin
              Sentencias := TStringList.Create;
              for i := 1 to DM1.ConsultaSQL.RecordCount do
               begin
                 if i>1 then DM1.ConsultaSQL.Next;
                   sentencias.add('delete from padron where idpadron='+DM1.ConsultaSQL.Fields[0].AsString+';');
                   sentencias.add('delete from padronactividad where idpadron='+DM1.ConsultaSQL.Fields[0].AsString+';');
                   mmoLog.Lines.Add(' RETIRANDO A : '+DM1.ConsultaSQL.Fields[1].AsString+' '+DM1.ConsultaSQL.Fields[2].AsString+' '+DM1.ConsultaSQL.Fields[3].AsString+' '+DM1.ConsultaSQL.Fields[4].AsString);
               end;
              DM1.ConsultaSQL.Close;
              if sentencias.count>0 then
               for i := 0 to sentencias.count-1 do
                  begin
                    ejecutaSQL(sentencias[i],false);
                  end;
              sentencias.free;
            end;

         //2023
         mmoLog.Lines.Add(' ');
         mmoLog.Lines.Add('2023rev9 BUSCANDO EN PADRON A LOS QUE NO TIENEN ACTIVIDAD ...');
         ActivaDM1ConsultaSQL('select p.idpadron FROM PADRON p where p.IDADENDA="'+dataGlobal.VidAdenda+'" and (select count(a.IDPADRON) from PADRONACTIVIDAD a where a.IDPADRON=p.IDPADRON)<=0',true);
         if DM1.ConsultaSQL.RecordCount>0 then
          begin
            mmoLog.Lines.Add('  SE ENCONTRARON '+StrI(DM1.ConsultaSQL.RecordCount)+' REGISTROS SIN ACTIVIDAD EN PADRON, eliminando...');
            EJecutaSQL('DELETE FROM PADRON p where p.IDADENDA="'+dataGlobal.VidAdenda+'" and (select count(a.IDPADRON) from PADRONACTIVIDAD a where a.IDPADRON=p.IDPADRON)<=0',false);
          end
         else
          mmoLog.Lines.Add('  NO SE ENCONTRARON BENEFICARIOS SIN ACTIVIDADES');



        // 2025-12 ahora debo recuperar los titulos desde backup
        EjecutaSQL(
        'UPDATE Padron p '+
        'SET '+
        'p.TITULOPATH= (SELECT e.TITULOPATH FROM BACKUPTITULO e WHERE e.Dni = p.Dni AND e.IDCASERIO = p.IDCaserio), '+
        'p.TITULOTIPO= (SELECT e.TITULOTIPO FROM BACKUPTITULO e WHERE e.Dni = p.Dni AND e.IDCASERIO = p.IDCaserio), '+
        'p.TITULODESCRIPCION = (SELECT e.TITULODESCRIPCION FROM BACKUPTITULO e WHERE e.Dni = p.Dni AND e.IDCASERIO = p.IDCaserio), '+
        'p.TITULONOUPDATE    = (SELECT e.TITULONOUPDATE FROM BACKUPTITULO e WHERE e.Dni = p.Dni AND e.IDCASERIO = p.IDCaserio) '+
        'WHERE p.IDADENDA="'+dataGlobal.VidAdenda+'" and (SELECT e.TITULOPATH FROM BACKUPTITULO e WHERE e.Dni = p.Dni AND e.IDCASERIO = p.IDCaserio) is not null ',false);

        //2025 ahora debo poner todos los titulos hacia el padron sacandolos desde MOV
        //REV 16-12-2025
        EjecutaSQL(
        'update padron p set '+
        'p.TITULOPATH=(SELECT first 1 n.TITULOPATH FROM MOVPADRON n where n.IDADENDA="'+dataGlobal.VidAdenda+'" and n.DNI_TITULAR=p.DNI), '+
        'p.TITULOTIPO=(SELECT first 1 n.TITULOTIPO FROM MOVPADRON n where n.IDADENDA="'+dataGlobal.VidAdenda+'" and n.DNI_TITULAR=p.DNI), '+
        'p.TITULODESCRIPCION=(SELECT first 1 n.TITULODESCRIPCION FROM MOVPADRON n where n.IDADENDA="'+dataGlobal.VidAdenda+'" and n.DNI_TITULAR=p.DNI) '+
        'where p.IDADENDA="'+dataGlobal.VidAdenda+'" AND P.TITULONOUPDATE=0 AND P.DNI IN '+
        '(SELECT m.dni_titular from MOVPADRON m where m.IDADENDA="'+dataGlobal.VidAdenda+'" AND m.TITULOPATH<>""); ',
        false
        );

        DM1.ConsultaSQL.Close;
        DM1.ConSQL.Close;
        DM1.AuxSQL.Close;

      hidemask;
      mmoLog.Lines.Add('FIN : '+TIMETOSTR(TIME));

      FrmPadron.HideMask;
      MessageDlg('Generacion Terminada...', mtInformation, [mbOK], CallBackACtualizar );
     end
    else
      MessageDlg('Pin Incorrecto', mtInformation, [mbOK] );
  end
 ELSE
  pnllog.Visible:=FALSE;
end;

procedure TFrmpadron.CallBackACtualizar(Sender: TComponent; Res: Integer);
begin
 btnActualizarClick(nil);
end;

procedure TFrmpadron.UniFormAfterShow(Sender: TObject);
begin
  btnActualizarClick(nil);
end;

procedure TFrmpadron.UniFormShow(Sender: TObject);
var i : shortint; P : String;
begin
  btnActualizarClick(nil);
  if cbadendas.Items.Count<=0 then
   begin
     ActivaDM1ConsultaSQL('Select idadenda from Adenda order by fecha desc;',true);
     if DM1.ConsultaSQL.RecordCount>0 then
       begin

         for i := 1 to DM1.ConsultaSQL.RecordCount do
           begin
              if i>1 then Dm1.ConsultaSQL.Next;
              cbadendas.Items.Add(DM1.ConsultaSQL.Fields[0].AsString);
           end;
         cbadendas.ItemIndex:=cbadendas.Items.IndexOf(DataGlobal.Vidadenda);
         caption:='Padron de Beneficiarios '+cbadendas.Text;
       end;
   end;

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

procedure TFrmpadron.BtnExportarCSVClick(Sender: TObject);
var fname : string;
begin
{  // BUSQUEDA
  for i := 0 to dbrejilla.Columns.Count-1 do
   begin
     unimemo1.lines.add('dbrejilla.Columns['+stri(i)+'].Width:='+StrI(dbrejilla.Columns[i].Width)+';');
   end;  }
  fname := UniServerModule.LocalCachePath + 'PADRON_' + FormatDateTime('hhmmss', Now()) + '.csv'; // Crea un nombre único para el informe.

  //DataSetToXLS(Ztabla, fname);
  Ztabla.DisableControls;
    DatasetToCSV(Ztabla, fname , -1, -1);
    Ztabla.First;
  Ztabla.EnableControls;

  UniSession.SendFile(fname);
end;



procedure TFrmpadron.btngenerarpadronClick(Sender: TObject);
Var S : String;
begin
  ActivaDM1ConsultaSQL('select sellado from adenda where idadenda="'+cbadendas.Text+'"',false);
  s:=dm1.Consultasql.Fields[0].AsString;
  DM1.ConsultaSQL.Close;
  if ValI(s)>=1 then
   begin
     Showmessage('Esta adenda esta Sellada, no se puede modificar');
     exit;
   end;

  if (ZTABLA.RecordCount>0) and (TRUE) then
    begin
       Showmessage('Esta padron contiene datos, Borre antes de continuar ...');
    end
  else
    begin
       S:='Esta seguro Generar el Padron de la Adenda '+DataGlobal.vIdAdenda+' en base a los Movimientos y Adenda anterior '+DataGlobal.Vidadenda_anterior+', se recomienda un backup';
       MessageDlg(S,
       mtConfirmation, [mbYes, mbNo],
        procedure(Sender: TComponent; Res: Integer)
        begin
          case Res of
            mrYes : begin
                      pnllog.Visible:=True;
                      Prompt('Por Favor Ingrese el Pin de Seguridad', '', mtInformation, mbOKCancel, GenerarPadron);
                    end;
            mrNo :  begin

                    end;
          end;
        end
       );
    end;

end;

procedure TFrmpadron.BtnEliminarClick(Sender: TObject);
begin
  { if MessageDlg('Esta seguro de Eliminar '+ZTABLA.Fields[0].AsString,
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then   // borra el cero si es unigui
     begin
        EjecutaSQL('DELETE FROM padron WHERE id='+ZTABLA.fields[0].AsString,true);
        btnActualizarClick(nil);
     end; }
  //uniMemo1.Lines.Clear;
  //uniMemo1.Lines.Add(stri (ztabla.RecordCount));
  //uniMemo1.Lines.Add(ztabla.SQL.Text);
end;

procedure TFrmpadron.BtnCerrarPadronClick(Sender: TObject);
var i : integer;
begin
  // BUSQUEDA
  for i := 0 to dbrejilla.Columns.Count-1 do
   begin
     //unimemo1.lines.add('dbrejilla.Columns['+stri(i)+'].Width:='+StrI(dbrejilla.Columns[i].Width)+';');
   end;
end;

procedure TFrmpadron.btnCambioFenologicoClick(Sender: TObject);
var s : string;
begin
  ActivaDM1ConsultaSQL('select sellado from adenda where idadenda="'+cbadendas.Text+'"',false);
  s:=dm1.Consultasql.Fields[0].AsString;
  DM1.ConsultaSQL.Close;
  if ValI(s)>=1 then
   begin
     Showmessage('Esta adenda esta Sellada, no se puede modificar');
     exit;
   end;

  frmCambioFenologico.showModal;
end;

procedure TFrmpadron.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ztabla.Close;
 Zdetalle.Close;
 //cerrarconexionessql(True);
 dbrejilla.Exporter.Enabled:=false;
end;

procedure TFrmpadron.btnReporteClick(Sender: TObject);
begin
 // REPORTE DE padron
end;

end.
