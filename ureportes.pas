unit ureportes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, frxClass, uniGUIBaseClasses, uniEdit, frxDBSet,
  uniMultiItem, uniListBox, uniBitBtn, uniButton, uniSpeedButton, uniLabel,
  uniPanel, uniPageControl, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, uniBasicGrid, uniDBGrid, uniComboBox, frxExportBaseDialog,
  frxExportPDF, uniMemo, uniCheckBox, frxExportRTF, uniScreenMask, Vcl.ExtCtrls,
  uniProgressBar, uniThreadTimer, uniTimer, ZAbstractConnection, ZConnection;

type

  // HILO QUE SOLO CALCULA (NO TOCA CONTROLES)
  TCalculationThread = class(TThread)
  private
    FProgress: Integer;
    FFinished: Boolean;
    FSQLCaserio : String;
    FChkImpCarta : Boolean;
    FChkCuadrosBlancos : Boolean;
    FErrores : String;
    FhostName : string;
    FDatabase : string;
    FPdfUrl : String;
    FPDFfile : string;
    FidAdenda : String;
  protected
    procedure Execute; override;
  public
    constructor Create(SQLCaserio : String; ChkImpCarta, ChkCuadrosBlancos: Boolean; phostname,pdatabase,pPDFurl,pPDFfile,pidAdenda: string);
    property Progress: Integer read FProgress;
    property Finished: Boolean read FFinished;
  end;

  TfrmReportes = class(TUniForm)
    frxDBDatos1: TfrxDBDataset;
    frxDBDatosPadron: TfrxDBDataset;
    frxDBDatosMovPadron: TfrxDBDataset;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    tabCartaAutoridad: TUniTabSheet;
    lblDni_tecnico_responsable: TUniLabel;
    edtDni_tecnico: TUniEdit;
    UniLabel1: TUniLabel;
    edtNombreTecnico: TUniEdit;
    btnBuscaDNI: TUniSpeedButton;
    btnGenerarInformeTecnico: TUniBitBtn;
    UniBitBtn2: TUniBitBtn;
    dbgCaseriosTecnico: TUniDBGrid;
    zcaserio: TZQuery;
    ZQuery1: TZQuery;
    DsCaserio: TDataSource;
    cbbactividad: TUniComboBox;
    UniLabel2: TUniLabel;
    edtcoordinador: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    frxPDFExp: TfrxPDFExport;
    UniMemo1: TUniMemo;
    ZQuery2: TZQuery;
    frxDBDatos2: TfrxDBDataset;
    ZQuery3: TZQuery;
    frxDBDatos3: TfrxDBDataset;
    ZQuery4: TZQuery;
    ZQuery5: TZQuery;
    frxDBDatos4: TfrxDBDataset;
    frxDBDatos5: TfrxDBDataset;
    ZQuery6: TZQuery;
    frxDBDatos6: TfrxDBDataset;
    ZQuery7: TZQuery;
    frxDBDatos7: TfrxDBDataset;
    frxDBCaserios: TfrxDBDataset;
    chkfotostecnico: TUniCheckBox;
    UniCheckBox2: TUniCheckBox;
    UniCheckBox3: TUniCheckBox;
    UniCheckBox4: TUniCheckBox;
    UniCheckBox5: TUniCheckBox;
    lblTipoUsuario: TUniLabel;
    edtNroInforme: TUniEdit;
    UniLabel6: TUniLabel;
    cbbactividadcoord: TUniComboBox;
    UniLabel7: TUniLabel;
    edtnombrecoord: TUniEdit;
    edtdnicoord: TUniEdit;
    edtnroinformecoord: TUniEdit;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    edtpara: TUniEdit;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    edtreferencia: TUniEdit;
    edtasunto: TUniMemo;
    edtrecomendaciones: TUniMemo;
    UniLabel12: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    UniBitBtn3: TUniBitBtn;
    edtfechacoord: TUniEdit;
    dbgCaseriosCarta: TUniDBGrid;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    edtasuntocarta: TUniMemo;
    UniLabel17: TUniLabel;
    edtjefecarta: TUniEdit;
    btnGeneraCarta: TUniBitBtn;
    UniBitBtn5: TUniBitBtn;
    btnlistacaserioscarta: TUniBitBtn;
    UniLabel13: TUniLabel;
    edtfechacarta: TUniEdit;
    edtnrocarta: TUniEdit;
    edtbuscacaserio: TUniEdit;
    cbbdniautoridad: TUniComboBox;
    cbbnombreautoridad: TUniComboBox;
    cbbcargoautoridad: TUniComboBox;
    chkcartacuadrosblancos: TUniCheckBox;
    chkcoordinadorcuadrosblancos: TUniCheckBox;
    UniTabSheet4: TUniTabSheet;
    btnBuscaCaserioActa: TUniBitBtn;
    edtbuscacaserioacta: TUniEdit;
    dbgCaseriosActa: TUniDBGrid;
    UniLabel18: TUniLabel;
    edtactaDniAutoridad: TUniComboBox;
    edtactanombreautoridad: TUniComboBox;
    edtactaresolucionautoridad: TUniComboBox;
    UniLabel19: TUniLabel;
    edtactacargoautoridad: TUniComboBox;
    UniLabel20: TUniLabel;
    UniLabel21: TUniLabel;
    edtActaFecha: TUniEdit;
    edtActaNumero: TUniEdit;
    edtactajefe: TUniEdit;
    edtactafechares: TUniComboBox;
    chkactacuadrosblanco: TUniCheckBox;
    btngeneraacta: TUniBitBtn;
    UniBitBtn6: TUniBitBtn;
    frxRTFExport1: TfrxRTFExport;
    chkactaword: TUniCheckBox;
    zQueryFotos: TZQuery;
    UniTabSheet5: TUniTabSheet;
    UniBitBtn4: TUniBitBtn;
    edtbuscacarta: TUniEdit;
    dbgcartas: TUniDBGrid;
    UniBitBtn8: TUniBitBtn;
    edtnrocorrelativo: TUniEdit;
    UniLabel22: TUniLabel;
    lblcantidad: TUniLabel;
    UniLabel23: TUniLabel;
    edtfechaact: TUniEdit;
    UniBitBtn9: TUniBitBtn;
    UniBitBtn10: TUniBitBtn;
    edtubigeosacta: TUniComboBox;
    UniTabSheet6: TUniTabSheet;
    edtBuscaCaserioAdenda: TUniEdit;
    btnBuscaCaserioAdendas: TUniBitBtn;
    dbgCaseriosAdenda: TUniDBGrid;
    edtAdendanombreautoridad: TUniComboBox;
    edtAdendacargoautoridad: TUniComboBox;
    edtAdendaresolucionautoridad: TUniComboBox;
    edtAdendaNumero: TUniEdit;
    edtAdendajefe: TUniEdit;
    edtAdendafecha: TUniEdit;
    edtAdendafechares: TUniComboBox;
    edtAdendadniautoridad: TUniComboBox;
    edtubigeosadenda: TUniComboBox;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    UniLabel27: TUniLabel;
    chkadendaword: TUniCheckBox;
    chkAdendacuadrosblanco: TUniCheckBox;
    btnInformeAdenda: TUniBitBtn;
    UniBitBtn12: TUniBitBtn;
    cbbTipoAdenda: TUniComboBox;
    edtFechaFirma: TUniEdit;
    UniLabel28: TUniLabel;
    UniLabel29: TUniLabel;
    UniLabel30: TUniLabel;
    edtNroAdenda: TUniEdit;
    chkIMPcartaautoridad: TUniCheckBox;
    chkJalaActaAutoridad: TUniCheckBox;
    chkImpAutoridadAdendad: TUniCheckBox;
    UniLabel31: TUniLabel;
    UniLabel32: TUniLabel;
    ZQuery8: TZQuery;
    frxDBDatos8: TfrxDBDataset;
    chkGenLote: TUniCheckBox;
    btnGenLoteAdenda: TUniButton;
    chkGenPDFsActa: TUniCheckBox;
    BtnGenLoteActas: TUniButton;
    UniButton1: TUniButton;
    lblError: TUniLabel;
    lblerrorcarta: TUniLabel;
    TimerCartaAutoridad: TTimer;
    pnlProcesamiento: TUniPanel;
    pbProcesamiento: TUniProgressBar;
    lblProcesamiento: TUniLabel;
    tmrProcesamiento: TUniTimer;
    UniThreadTimer1: TUniThreadTimer;
    btnStart: TUniButton;
    btnCerrarPnlProcesamiento: TUniBitBtn;
    mmoLogPDF: TUniMemo;
    procedure btnBuscaDNIClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure cbbactividadChange(Sender: TObject);
    procedure btnGenerarInformeTecnicoClick(Sender: TObject);
    procedure frxReporteBeforePrint(Sender: TfrxReportComponent);
    procedure frxReporteBeforePrintFotos(Sender: TfrxReportComponent);
    procedure UniFormCreate(Sender: TObject);
    procedure dbgCaseriosTecnicoCellClick(Column: TUniDBGridColumn);
    procedure UniPageControl1Change(Sender: TObject);
    procedure cbbactividadcoordChange(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnlistacaserioscartaClick(Sender: TObject);
    procedure dbgCaseriosCartaCellClick(Column: TUniDBGridColumn);
    procedure btnGeneraCartaClick(Sender: TObject);
    procedure btnBuscaCaserioActaClick(Sender: TObject);
    procedure dbgCaseriosActaCellClick(Column: TUniDBGridColumn);
    procedure edtactanombreautoridadChange(Sender: TObject);
    procedure edtactaresolucionautoridadChange(Sender: TObject);
    procedure edtactacargoautoridadChange(Sender: TObject);
    procedure edtactafecharesChange(Sender: TObject);
    procedure btngeneraactaClick(Sender: TObject);
    procedure edtactaDniAutoridadChange(Sender: TObject);
    procedure UniBitBtn4Click(Sender: TObject);
    procedure UniBitBtn10Click(Sender: TObject);
    procedure UniBitBtn9Click(Sender: TObject);
    procedure btnBuscaCaserioAdendasClick(Sender: TObject);
    procedure dbgCaseriosAdendaCellClick(Column: TUniDBGridColumn);
    procedure edtAdendanombreautoridadChange(Sender: TObject);
    procedure edtAdendafecharesChange(Sender: TObject);
    procedure edtAdendaresolucionautoridadChange(Sender: TObject);
    procedure edtAdendacargoautoridadChange(Sender: TObject);
    procedure btnInformeAdendaClick(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkGenLoteChange(Sender: TObject);
    procedure chkGenPDFsActaChange(Sender: TObject);
    procedure btnGenLoteAdendaClick(Sender: TObject);
    procedure BtnGenLoteActasClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure tmrProcesamientoTimer(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnCerrarPnlProcesamientoClick(Sender: TObject);
  private
    { Private declarations }
    condAct : string;
    indexacta : shortint;
    indexAdenda : shortint;
    nombreFoto:string;
    nombreFoto2:string;
    limpiarCA:boolean;
    UnPDFName : String;
    FThread: TCalculationThread;
    function CalculaNroInforme(datonombre,datoanio,datoactividad:string):string;
    function BuscaInforme(tipoinforme:string):string;
    procedure limpiadataacta;
    procedure limpiadataadenda;
    Procedure GenReporteTotal(chkIMPcartaautoridadVRT,chkcartacuadrosblancosVRT:boolean);
  public
    { Public declarations }
  end;

function frmReportes: TfrmReportes;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UDBModulo , uModeloMovPadron, uniguioperadores,UNIGUIuSQLUTILS,
  ServerModule, uFrmVistaPrevia, udataglobal,uModeloINFORMEV2,JPEG,PNGImage, ZDbcIntfs, ZClasses;

function frmReportes: TfrmReportes;
begin
  Result := TfrmReportes(UniMainModule.GetFormInstance(TfrmReportes));
end;

procedure ZBindParam(var Zdato : TZQuery; llave, valor : string);
var lineas : TStringList;
    i : integer;
 begin
   for i := 0 to Zdato.SQL.Count-1 do
    begin
      Zdato.SQL[i]:=StrCom(Zdato.SQL[i],llave,valor);
    end;
 end;

function completardir(d,a:string):string;
   begin
     if Copy(d,Length(d),1)='\' then
      Result:=d+a
     else
      Result:=d+'\'+a;
   end;

function procesalineas(L : Tstrings; mx : integer):string;
var s : string; i : smallint;
 begin
   s:='';
   for i := 0 to L.Count-1 do
     s:=s+' '+L[i];
   if mx<=0 then
     result:=Trim(s)
   else
     result:=copy(Trim(s),1,mx);
 end;

function TfrmReportes.CalculaNroInforme(datonombre,datoanio,datoactividad:string ):string;
var i : smallint;  iniciales,contador : string;
  begin
    iniciales:='';
    for i := 1 to 10 do
       iniciales:=iniciales+Trim(Copy(SplitCadena(datoNombre,' ',i),1,1));

    //contador:=ActivaDM1ConRegistro('SELECT count(a.DNI_TECNICO)+1 FROM MOVPADRON a where a.DNI_TECNICO="'+edtDNI_Tecnico.text+'" and a.IDADENDA="'+DataGlobal.vIdAdenda+'"',1);
    contador:=completar3('1');
    if datoActividad<>'' then
      result:=contador+'-'+datoanio+'-'+datoactividad+'-'+iniciales
    else
      result:=contador+'-'+datoanio+'-'+iniciales;
  end;

procedure TfrmReportes.btnBuscaCaserioActaClick(Sender: TObject);
begin
     Zcaserio.Close;
     Zcaserio.SQL.Clear;                  //   0           1             2         3          4          5
       zcaserio.SQL.Add(FormatSQL3('select c.AMBITO,c.departamento,c.provincia,c.distrito,c.CASERIO,c.idcaserio '));
       zcaserio.SQL.Add(FormatSQL3('from caserio c '));
       zcaserio.SQL.Add(FormatSQL3('where c.IDCASERIO in (select m.IDCASERIO FROM MOVPADRON m where m.IDADENDA="'+DataGlobal.vidadenda+'" ) '));
       zcaserio.SQL.Add(FormatSQL3('and c.CASERIO like "%'+edtbuscacaserioacta.Text+'%" '));
       zcaserio.SQL.Add(FormatSQL3('order by 5,4;'));
     zcaserio.Open;

     dbgCaseriosActa.Columns[0].Width:=125;
     dbgCaseriosActa.Columns[1].Width:=125;
     dbgCaseriosActa.Columns[2].Width:=125;
     dbgCaseriosActa.Columns[3].Width:=145;
     dbgCaseriosActa.Columns[4].Width:=145;
     dbgCaseriosActa.Columns[5].visible:=false;

     limpiadataacta;
end;

procedure TfrmReportes.btnBuscaCaserioAdendasClick(Sender: TObject);
begin
     Zcaserio.Close;
     Zcaserio.SQL.Clear;                  //   0           1             2         3          4          5
       zcaserio.SQL.Add(FormatSQL3('select c.AMBITO,c.departamento,c.provincia,c.distrito,c.CASERIO,c.idcaserio '));
       zcaserio.SQL.Add(FormatSQL3('from caserio c '));
       zcaserio.SQL.Add(FormatSQL3('where c.IDCASERIO in (select m.IDCASERIO FROM MOVPADRON m where m.IDADENDA="'+DataGlobal.vidadenda+'" ) '));
       zcaserio.SQL.Add(FormatSQL3('and c.CASERIO like "%'+edtbuscacaserioadenda.Text+'%" '));
       zcaserio.SQL.Add(FormatSQL3('order by 5,4;'));
     zcaserio.Open;

     dbgCaseriosAdenda.Columns[0].Width:=125;
     dbgCaseriosAdenda.Columns[1].Width:=125;
     dbgCaseriosAdenda.Columns[2].Width:=125;
     dbgCaseriosAdenda.Columns[3].Width:=145;
     dbgCaseriosAdenda.Columns[4].Width:=145;
     dbgCaseriosAdenda.Columns[5].visible:=false;

     limpiadataAdenda;
end;

procedure TfrmReportes.btnBuscaDNIClick(Sender: TObject);
var MiMovPadron : TMovPadron;
    i : smallint;
begin
 if length(edtDni_tecnico.Text)=8 then
   begin
     edtnombretecnico.Text:=recuperanombre(edtDni_tecnico.Text,' ');
     Zcaserio.Close;
     Zcaserio.SQL.Clear;
       zcaserio.SQL.Add(FormatSQL3('SELECT distinct '));
       zcaserio.SQL.Add(FormatSQL3('(select c.AMBITO from caserio c where c.IDCASERIO=m.IDCASERIO),'));
       zcaserio.SQL.Add(FormatSQL3('(select c.departamento from caserio c where c.IDCASERIO=m.IDCASERIO),'));
       zcaserio.SQL.Add(FormatSQL3('(select c.provincia from caserio c where c.IDCASERIO=m.IDCASERIO),'));
       zcaserio.SQL.Add(FormatSQL3('(select c.distrito from caserio c where c.IDCASERIO=m.IDCASERIO),'));
       zcaserio.SQL.Add(FormatSQL3('(select c.CASERIO from caserio c where c.IDCASERIO=m.IDCASERIO),'));
       zcaserio.SQL.Add(FormatSQL3(' m.IDCASERIO '));
       zcaserio.SQL.Add(FormatSQL3('FROM MOVPADRON m'));
       zcaserio.SQL.Add(FormatSQL3('where'));
       zcaserio.SQL.Add(FormatSQL3('m.IDADENDA="'+DataGlobal.vidadenda+'"'));
       zcaserio.SQL.Add(FormatSQL3('and m.DNI_TECNICO="'+edtDni_Tecnico.text+'"'));
     zcaserio.Open;

     dbgCaseriosTecnico.Columns[0].Width:=125;
     dbgCaseriosTecnico.Columns[1].Width:=125;
     dbgCaseriosTecnico.Columns[2].Width:=125;
     dbgCaseriosTecnico.Columns[3].Width:=135;
     dbgCaseriosTecnico.Columns[4].Width:=145;

     ActivaDM1ConsultaSQL('select distinct o.IDACTIVIDAD from MOVPADRONACTIVIDAD o where o.IDMOVPADRON in '+
     '(select m.idmovpadron from movpadron m where m.DNI_TECNICO="'+edtDni_Tecnico.text+'" and m.IDADENDA="'+DataGlobal.vidadenda+'")',false);
     cbbactividad.items.clear;
     for i:=1 to DM1.ConsultaSQL.RecordCount do
       begin
         if i>1 then DM1.ConsultaSQL.Next;
         cbbactividad.Items.Add(Dm1.ConsultaSQL.Fields[0].Asstring);
       end;
     DM1.ConsultaSQL.Close;

     cbbactividad.ItemIndex:=0;
     cbbactividadChange(nil);

     if zcaserio.Active then
       begin
         edtNroInforme.Text:=BuscaInforme('TECNICO');
       end;

     if edtNroInforme.Text='' then
        edtnroInforme.text:=CalculaNroInforme(edtNombreTecnico.Text,copy(dataGlobal.VidAdenda,length(dataGlobal.VidAdenda)-3,4),cbbactividad.Text);

   end;
end;

procedure TfrmReportes.btnCerrarPnlProcesamientoClick(Sender: TObject);
begin
  pnlProcesamiento.Visible:=false;
end;

procedure TfrmReportes.btngeneraactaClick(Sender: TObject);
VAR error : byte;
    sc,ol,scaserio,ncaserio,sdistrito,sprovincia,sdepartamento,aurl : string;
    MiInforme : TINFORMES;
    ReporteActaCaserio : TfrxReport;
    act : array[1..18] of string;
    sumaact,cantact,concact : string;
    i,nrocont: Integer;
    EtapaAnterior,Etapanueva : string;

    // AUTOMATIZAR CON LOS CAMPOS EN ACTIVIDAD ETAPA, PENDIENTE ESCRIBIR UN FORMULARIO DE MODIFICACION DE DATOS
    function extraetapa(s:string):string; // descripcion
     begin                //particiapeses para
       if s='INST_CACAO'   then result:='la instalacion';
       if s='CREC_CACAO'   then result:='el crecimiento';
       if s='PROD_CACAO'   then result:='la produccion';
       if s='INST_CAFE'    then result:='la instalacion';
       if s='CREC_CAFE'    then result:='el crecimiento';
       if s='PROD_CAFE'      then result:='la produccion';
       if (s='PCAC_SANIDAD') OR (s='ACT_SCACAO')  then result:='produccion en cacao';
       if (s='PCAF_SANIDAD') OR (s='ACT_SCAFE')   then result:='produccion en cafe';
       if (s='ACT_APICOLA')  OR (s='ACT_API')     then result:='modulos apicolas';
       if (s='ACT_ACUICOLA') OR (s='ACT_ACUI')    then result:='unidades acuicolas';
       //2024
       if s='INST_PLA'   then result:='la instalacion';
       if s='CREC_PLA'   then result:='el crecimiento';
       if s='PROD_PLA'   then result:='la produccion';
       //2024-2
       if s='ACT_GRA' then result:='la produccion';
       if s='ACT_AVI' then result:='galpones avicolas';
     end;

    function extraeunidad(s:string):string;
     begin
       if s='INST_CACAO'   then result:='hectáreas';
       if s='CREC_CACAO'   then result:='hectáreas';
       if s='PROD_CACAO'   then result:='hectáreas';
       if s='INST_CAFE'    then result:='hectáreas';
       if s='CREC_CAFE'    then result:='hectáreas';
       if s='PROD_CAFE'    then result:='hectáreas';
       if (s='PCAC_SANIDAD') or (s='ACT_SCACAO') then result:='hectáreas';
       if (s='PCAF_SANIDAD') or (s='ACT_SCAFE')  then result:='hectáreas';
       if (s='ACT_APICOLA')  or (s='ACT_API')    then result:='modulos';
       if (s='ACT_ACUICOLA') or (s='ACT_ACUI')   then result:='unidades';
       //2024
       if s='INST_PLA'   then result:='hectáreas';
       if s='CREC_PLA'   then result:='hectáreas';
       if s='PROD_PLA'   then result:='hectáreas';
       //2024-2
       if s='ACT_GRA'    then result:='hectáreas';
       if s='ACT_AVI'   then result:='galpones';
     end;

    function extraeactividad(s:string):string; // join desde actividad
     begin
       if s='INST_CACAO'   then result:='cacao';
       if s='CREC_CACAO'   then result:='cacao';
       if s='PROD_CACAO'   then result:='cacao';
       if s='INST_CAFE'    then result:='cafe';
       if s='CREC_CAFE'    then result:='cafe';
       if s='PROD_CAFE'    then result:='cafe';
       if (s='PCAC_SANIDAD') or (s='ACT_SCACAO') then result:='sanidad cacao';
       if (s='PCAF_SANIDAD') or (s='ACT_SCAFE')  then result:='sanidad cafe';
       if (s='ACT_APICOLA')  or (s='ACT_API')    then result:='apicola';
       if (s='ACT_ACUICOLA') or (s='ACT_ACUI')   then result:='acuicola';
       //2024
       if s='INST_PLA'   then result:='platano';
       if s='CREC_PLA'   then result:='platano';
       if s='PROD_PLA'   then result:='platano';
       //2024-2
       if s='ACT_GRA'    then result:='granadilla';
       if s='ACT_AVI'   then result:='avicola';
     end;

    function cambiarDenominacionID(s:string):string; // denomiancion
     begin
       if s='HAS INST' then result:='instalacion';
       if s='HAS CREC' then result:='crecimiento';
       if s='HAS PROD' then result:='producción';
     end;

begin
  // reporte acta entendimiento

  error:=0;
  if not zcaserio.Active then  error:=1;
  if edtactadniautoridad.Text='' then error:=2;
  if edtactanombreautoridad.Text='' then error:=3;
  if (length(edtactafecha.Text)<>10) or (length(edtactafechares.Text)<>10) then error:=4;
  if edtactacargoautoridad.text='' then error:=5;
  if edtactanumero.Text='' then error:=6;


  if error=0 then
    begin
    scaserio:=zcaserio.Fields[5].AsString;
    ncaserio:=zcaserio.Fields[4].AsString;
    sdistrito:=zcaserio.Fields[3].AsString;
    sprovincia:=zcaserio.Fields[2].AsString;
    sdepartamento:=zcaserio.Fields[1].AsString;
      sc:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.TIPOINFORME="ACTACASERIO" and i.IDCASERIO="'+scaserio+'"';
      ActivaDM1ConsultaSQL('select i.NROINFORME '+
      'from INFORMES i where '+
      sc
      ,false);
      ol:=DM1.ConsultaSQL.Fields[0].AsString;
      DM1.ConsultaSQL.Close;

      MiInforme := TINFORMES.Create;
      Miinforme.Idadenda:=dataglobal.VidAdenda;
      Miinforme.idcaserio:=scaserio;
      MiInforme.Tipoinforme:='ACTACASERIO';
      MiInforme.Dni1:=edtactadniautoridad.Text;
      Miinforme.Referencia:=edtactacargoautoridad.Text;
      Miinforme.Asunto:=edtactaresolucionautoridad.Text;
      MiInforme.Fechares:=edtactafechares.Text;

      MiInforme.Fecha:=edtactafecha.Text;
      MiInforme.Nroinforme:=edtactanumero.Text;
      MiInforme.Para:=edtactajefe.Text;
       if ol<>'' then
         begin
           MiInforme.Fechaactualizacion:=dateToStr(now);
           MiInforme.Horaactualizacion:=getTime24;
           MiInforme.actualizar2(sc,DM1.Base_Datos);
         end
       else
         MiInforme.insertar(DM1.Base_Datos);
      MiInforme.Free;

      //actualizo autoridades
      if edtubigeosacta.Text<>'' then
       begin
         EjecutaSQL('update autoridad a set '+
                    'a.FECHA="'+(edtactafechares.text)+
                    '",a.CARGO="'+edtactacargoautoridad.Text+
                    '",a.RESOLUCION="'+edtactaresolucionautoridad.Text+'" '+
                    'where a.IDCASERIO="'+edtubigeosacta.text+'" and a.DNI="'+edtactadniautoridad.Text+'"',true);
       end;

      ReporteActacaserio := TFrxReport.Create(frmReportes);
      ReporteActacaserio.OnBeforePrint :=  frxReporteBeforePrint;

      ReporteActacaserio.LoadFromFile(workdir+'\reportes\reporteactaentendimiento.fr3');

      ReporteActacaserio.Variables.Clear;

     //UNIGUI
      ReporteActacaserio.EngineOptions.SilentMode := True;
      ReporteActacaserio.EngineOptions.EnableThreadSafe := True;
      ReporteActacaserio.EngineOptions.DestroyForms := False;
      ReporteActacaserio.EngineOptions.UseGlobalDataSetList := False;
      ReporteActacaserio.PrintOptions.ShowDialog := False;
      ReporteActacaserio.ShowProgress := False;
      ReporteActacaserio.PreviewOptions.AllowEdit := False;


      ReporteActacaserio.Variables['FECHAACTA']:='''' + fechaLarga(edtActafecha.Text) + '''';
      ReporteActacaserio.Variables['NROACTA']:='''' + edtActanumero.Text + '''';
      ReporteActacaserio.Variables['PARA']:='''' + edtActajefe.Text + '''';

      ReporteActacaserio.Variables['NOMBREAUTORIDAD']:='''' + edtActanombreautoridad.Text + '''';
      ReporteActacaserio.Variables['CARGOAUTORIDAD']:='''' + edtActacargoautoridad.Text + '''';
      ReporteActacaserio.Variables['DNIAUTORIDAD']:='''' + edtActaDNIautoridad.Text + '''';
      ReporteActacaserio.Variables['NRORESOLUCION']:='''' + edtActaresolucionautoridad.Text + '''';
      ReporteActacaserio.Variables['FECHARESOLUCION']:='''' + edtActafechares.Text + '''';

      ReporteActacaserio.Variables['CASERIO']:='''' + ncaserio + '''';
      ReporteActacaserio.Variables['DEPARTAMENTO']:='''' + sdepartamento + '''';
      ReporteActacaserio.Variables['PROVINCIA']:='''' + sprovincia + '''';
      ReporteActacaserio.Variables['DISTRITO']:='''' + sdistrito + '''';


      frxPDFExp.Background := True;
      frxPDFExp.ShowProgress := False;
      frxPDFExp.ShowDialog := False;

      frxPDFExp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl);
      frxPDFExp.DefaultPath := '';
      frxPDFExp.Author:='DEVIDA';
      frxPDFExp.Subject:='CARTA CASERIO';

      act[1]:='INST_CACAO';
      act[2]:='CREC_CACAO';
      act[3]:='PROD_CACAO';
      act[4]:='INST_CAFE';
      act[5]:='CREC_CAFE';
      act[6]:='PROD_CAFE';
      act[7]:='ACT_SCACAO';    //'PCAC_SANIDAD';
      act[8]:='ACT_SCAFE';     //'PCAF_SANIDAD';
      act[9]:='ACT_API';       //'ACT_APICOLA';
      act[10]:='ACT_ACUI';     //'ACT_ACUICOLA';
      //2024  ERAN 13
      act[11]:='INST_PLA';
      act[12]:='CREC_PLA';
      act[13]:='PROD_PLA';
      //2024-2
      act[14]:='ACT_AVI';
      act[15]:='ACT_GRA';


      // consulta totales
      nrocont:=0;
      for i:=1 to 15 do
       begin
        zquery1.Close;
        zquery1.SQL.Clear;
        zquery1.SQL.Add(FSL3('SELECT '));
        zquery1.SQL.Add(FSL3('sum(p.'+act[i]+'),count(p.'+act[i]+') '));
        zquery1.SQL.Add(FSL3('FROM vPadron p '));
        zquery1.SQL.Add(FSL3('Where p.'+act[i]+' is not null and p.'+act[i]+'>0 and p.Idadenda="'+dataglobal.VidAdenda+'" and p.idcaserio="'+scaserio+'" '));
        zquery1.open;
        sumaact:=StrR(ValR(zquery1.Fields[0].AsString));
        cantact:=StrI(ValI(zquery1.Fields[1].AsString));

        concact:=cantact+' familias participantes para '+extraetapa(act[i])+' con '+sumaact+
        ' '+extraeunidad(act[i])+' de la actividad '+extraeactividad(act[i])+', las mismas que se encuentran representadas'+
        ' por sus jefes de familia y firman la presente acta en el anexo 08.';

        if Valr(cantact)>0 then
         begin
           inc(nrocont);
           ReporteActacaserio.Variables['C'+strI(nrocont)]:='''' + concact + '''';
           ReporteActacaserio.Variables[act[i]]:='''' + sumaact + '''';
         end
        else
         begin
           //ReporteActacaserio.Variables['C'+strI(i)]:='''' + '' + '''';
           ReporteActacaserio.Variables[act[i]]:='''' + '' + '''';
         end;

       end;

      // para cambio fenologico ----
      //Listado de Cambios                   0            1
      ActivaDM1ConSQL('SELECT distinct a.IDACTIVIDAD,a.IDETAPA '+
      'FROM HISTORIALMOVIMIENTOS a '+
      'where a.IDADENDA="'+dataGlobal.VidAdenda+'" and A.TIPOMOVIMIENTO="CAMBIO FENOLOGICO" and a.IDCASERIO="'+scaserio+'"');
      if (DM1.ConSQL.RecordCount>0) and (true) then
        begin
          for i := 1 to DM1.ConSQL.RecordCount do
           begin
             if i>1 then DM1.ConSQL.Next;

             ActivaDM1AuxSQl('SELECT idETAPA FROM ACTIVIDADETAPA b '+
             'where b.IDACTIVIDAD="'+DM1.ConSQL.Fields[0].AsString+'" and orden= '+
             '(SELECT (ORDEN-1) FROM ACTIVIDADETAPA a '+
             'where a.IDACTIVIDAD="'+DM1.ConSQL.Fields[0].AsString+'" and a.IDETAPA="'+DM1.ConSQL.Fields[1].AsString+'") ');
             EtapaAnterior:=cambiarDenominacionID(DM1.AuxSQL.Fields[0].AsString);
             EtapaNueva:=cambiarDenominacionID(DM1.ConSQL.Fields[1].AsString);

             ActivaDM1AuxSQl('SELECT count(dni),sum(nro_has) '+
             'FROM HISTORIALMOVIMIENTOS a '+
             'where a.IDADENDA="'+dataGlobal.VidAdenda+'" and A.TIPOMOVIMIENTO="CAMBIO FENOLOGICO" and a.IDCASERIO="'+scaserio+'" '+
             'and a.IDACTIVIDAD="'+DM1.ConSQL.Fields[0].AsString+'" and a.IDETAPA="'+DM1.ConSQL.Fields[1].AsString+'" '+
             'group by IDCASERIO ');

              concact:=DM1.AuxSQL.Fields[0].AsString+' familias participantes hicieron cambio fenologico de '+
              EtapaAnterior+' a '+EtapaNueva+' con un total de '+DM1.AuxSQL.Fields[1].AsString+' hectarea(s).';
              inc(nrocont);
              ReporteActacaserio.Variables['C'+strI(nrocont)]:='''' + concact + '''';

             Dm1.AuxSQL.Close;
           end;
        end;
      DM1.ConSQL.Close;
      //

      if nrocont<12 then
        for i :=nrocont+1 to 12 do
          begin
            ReporteActacaserio.Variables['C'+strI(i)]:='''' + '' + '''';
          end;

       // consulta de padron ya listo // EL PADRON DEBE CERRASE (*)
       zquery1.Close;
       zquery1.SQL.Clear;
       zquery1.SQL.Add(FSL3('SELECT '));
       zquery1.SQL.Add(FSL3('p.APPATERNO,p.APMATERNO,p.NOMBRE,p.DNI,p.edad,p.telefono, '));
       zquery1.SQL.Add(FSL3('p.CONY_APPATERNO,p.CONY_APMATERNO,p.CONY_NOMBRE,p.CONY_DNI, p.CONY_edad, '));
       zquery1.SQL.Add(FSL3('p.inst_cacao,p.crec_cacao,p.prod_cacao, '));
       zquery1.SQL.Add(FSL3('p.inst_pla,p.crec_pla,p.prod_pla, '));
       zquery1.SQL.Add(FSL3('p.inst_cafe,p.crec_cafe,p.prod_cafe, '));
       zquery1.SQL.Add(FSL3('p.ACT_AVI,p.ACT_GRA,p.ACT_API,p.ACT_ACUI, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "ACUI") p) HACUI, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "APIC") p) HAPIC, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "CCAC") p) HCCAC, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "CCAF") p) HCCAF, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "FARI") p) HFARI, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "IBIO") p) HIBIO, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "ICAC") p) HICAC, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "ICAF") p) HICAF, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "MCAC") p) HMCAC, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "MCAF") p) HMCAF, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "PCAC") p) HPCAC, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "PCAF") p) HPCAF, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "SPCC") p) HSPCC, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "SPCF") p) HSPCF, '));
       //2024
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "IPLA") p) HIPLA, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "CPLA") p) HCPLA, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "PPLA") p) HPPLA, '));
       //2024-2
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "AVIC") p) HAVIC, '));
       zquery1.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "PGRA") p) HPGRA  '));

       zquery1.SQL.Add(FSL3('FROM vPadron p '));
       zquery1.SQL.Add(FSL3('Where p.Idadenda="'+dataglobal.VidAdenda+'" and p.idcaserio="'+scaserio+'" '));
       zquery1.SQL.Add(FSL3('order by 1,2,3'));
       zquery1.open;
       ReporteActacaserio.Variables['TOTAL_FAMILIAS']:='''' + StrI(zquery1.RecordCount) + '''';

       // consulta de padron ya listo // EL PADRON DEBE CERRASE
       zquery2.Close;
       zquery2.SQL.Clear;
       {zquery2.SQL.Add(FSL3('SELECT '));
       zquery2.SQL.Add(FSL3('p.APPATERNO,p.APMATERNO,p.NOMBRE,p.DNI,p.edad,p.telefono,p.sexo,case coalesce(p.DNI,"") when "" then ""else "DNI" end TIPODOC,'));
       zquery2.SQL.Add(FSL3('p.CONY_APPATERNO,p.CONY_APMATERNO,p.CONY_NOMBRE,p.CONY_DNI,p.CONY_edad,p.CONY_telefono,p.CONY_sexo,case coalesce(p.CONY_DNI,"") when "" then ""else "DNI" end CONY_TIPODOC '));
       zquery2.SQL.Add(FSL3('FROM vPadron p '));
       zquery2.SQL.Add(FSL3('Where p.Idadenda="'+dataglobal.VidAdenda+'" and p.idcaserio="'+scaserio+'" '));
       zquery2.SQL.Add(FSL3('order by 1,2,3'));}   //2024_PLA

       zquery2.SQL.Add(FSL3('SELECT '));
       zquery2.SQL.Add(FSL3('p.CAPPATERNO, p.CAPMATERNO, p.CNOMBRE, p.CDNI, p.CEDAD, p.CTELEFONO, p.CSEXO, p.CTIPODOC,'));
       zquery2.SQL.Add(FSL3('p.CCONY_APPATERNO, p.CCONY_APMATERNO, p.CCONY_NOMBRE, p.CCONY_DNI, p.CCONY_EDAD, p.CCONY_TELEFONO, p.CCONY_SEXO, p.CCONY_TIPODOC,'));
       zquery2.SQL.Add(FSL3('p.CANIO_INCORPORACION,'));
       zquery2.SQL.Add(FSL3('p.ACULTIVOCRIANZA, p.AETAPA, p.AHECTMOD, p.AANIO_INST, p.AANIO_ADOP,'));
       zquery2.SQL.Add(FSL3('p.BCULTIVOCRIANZA, p.BETAPA, p.BHECTMOD, p.BANIO_INST, p.BANIO_ADOP,'));
       zquery2.SQL.Add(FSL3('p.CCULTIVOCRIANZA, p.CETAPA, p.CHECTMOD, p.CANIO_INST, p.CANIO_ADOP'));
       zquery2.SQL.Add(FSL3('FROM ANEXO8_IDADENDA_IDCASERIO("'+dataglobal.VidAdenda+'", '+scaserio+') p'));
       zquery2.SQL.Add(FSL3('order by 1,2,3'));

       zquery2.open;

       // ---------------- genero el reporte
       ReporteActacaserio.PrepareReport(True);

       if chkactaword.checked then
         begin
//           frxRTFExport1.Background := True;
           frxRTFExport1.ShowProgress := False;
           frxRTFExport1.ShowDialog := False;

           frxRTFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'doc', '', '', AUrl);
           frxRTFExport1.DefaultPath := '';
//           frxRTFExport1.Author:='DEVIDA';
//           frxRTFExport1.Subject:='CARTA CASERIO';

           ReporteActacaserio.Export(frxRTFExport1);
         end
       else
         ReporteActacaserio.Export(frxPDFExp);

       if Sender=btngeneraacta then
          FrmVistaPrevia.UniURLFrame1.URL:=AUrl;

       if chkGenPDFsActa.Checked then
          UnPDFName:=frxPDFExp.FileName;

       ReporteActacaserio.Free;

    end
  else
    case error of
      1: Showmessage('Busque un caserio antes');
      2: Showmessage('Falta DNI Autoridad');
      3: Showmessage('Falta Nombre de Autoridad');
      4: Showmessage('Verifique la fecha');
      5: Showmessage('Falta Cargo de Autoridad');
      6: Showmessage('Falta Nro de Acta');
    end;
end;

procedure TfrmReportes.cbbactividadChange(Sender: TObject);
var dni : string; hecho : boolean;
begin
  dni:=ActivaDM1ConRegistro('select first 1 a.DNI_COORDINADOR from actividad a where a.IDACTIVIDAD="'+cbbactividad.text+'"',1);
  edtcoordinador.Text:=RecuperaNombre(dni,' ');

  if zcaserio.Active then
   begin
     edtNroInforme.Text:=BuscaInforme('TECNICO');
   end;

  if edtNroInforme.Text='' then
    edtnroInforme.text:=CalculaNroInforme(edtNombreTecnico.Text,copy(dataGlobal.VidAdenda,length(dataGlobal.VidAdenda)-3,4),cbbactividad.Text);
end;

procedure TfrmReportes.cbbactividadcoordChange(Sender: TObject);
begin
  if cbbactividadcoord.Items.Count>0 then
   begin
     edtdnicoord.text:=ActivaDM1ConRegistro('select first 1 a.DNI_COORDINADOR from actividad a where a.IDACTIVIDAD="'+cbbactividadcoord.text+'"',1);
     edtnombrecoord.Text:=RecuperaNombre(edtdnicoord.text,' ');

     if edtdnicoord.text<>'' then
       begin
          ActivaDM1ConsultaSQL('select i.fecha,i.NROINFORME,i.PARA,i.ASUNTO,i.REFERENCIA,i.RECOMENDACIONES '+
          'from INFORMES i where '+
          'i.DNI1="'+edtdnicoord.Text+'" and i.ACTIVIDAD1="'+cbbactividadcoord.Text+'" and i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.TIPOINFORME="COORDINADOR"'
          ,false);
          if DM1.ConsultaSQL.RecordCount>0 then
            begin
              edtFechaCoord.Text:=DM1.ConsultaSQL.Fields[0].AsString;
              edtNroInformeCoord.Text:=DM1.ConsultaSQL.Fields[1].AsString;
              edtPara.Text:=DM1.ConsultaSQL.Fields[2].AsString;
              edtAsunto.Text:=DM1.ConsultaSQL.Fields[3].AsString;
              edtReferencia.Text:=DM1.ConsultaSQL.Fields[4].AsString;
              edtRecomendaciones.Text:=DM1.ConsultaSQL.Fields[5].AsString;
            end
          else
            begin
              edtFechaCoord.Text:=DateToStr(Now);
              edtNroInformeCoord.Text:=CalculaNroInforme(edtNombreCoord.Text,copy(dataGlobal.VidAdenda,length(dataGlobal.VidAdenda)-3,4),cbbactividadcoord.Text);
            end;
          DM1.ConsultaSQL.Close;
       end;
   end;
end;

procedure TfrmReportes.chkGenLoteChange(Sender: TObject);
begin
  btnGenLoteAdenda.Visible:=chkGenLote.Checked;
end;

procedure TfrmReportes.frxReporteBeforePrint(Sender: TfrxReportComponent);
begin
 //if USAR_HASH_CODES then
  BEGIN
   //if sender.name = 'PictureQR' then
   // tfrxpictureview(sender).picture.loadfromfile(WorkDir+'\tmp\qr.jpg');
  end;
end;



procedure TfrmReportes.frxReporteBeforePrintFotos(Sender: TfrxReportComponent);
var
   Imajpg: TJpegImage;
   ImaPng: TPngImage;
   Leido : boolean;
begin
  if FileExists(NombreFoto) then
  if sender.name = 'Picture1' then
    begin
     //-----------------------------------
     Imajpg := TJpegImage.Create;
     leido:=false;
     try
       Imajpg.LoadFromFile(nombreFoto);
       leido:=true;
     except
     end;
     if Leido then
        tfrxpictureview(sender).picture.Assign(ImaJpg)
     else
      begin
         ImaPng := TPNGImage.Create;
         try
           ImaPng.LoadFromFile(nombreFoto);
           leido:=true;
         except
         end;
         if Leido then
           tfrxpictureview(sender).picture.Assign(ImaPng);
         ImaPng.free;
      end;
     Imajpg.free;
     //......................................
    end;


  if FileExists(NombreFoto2) then
  if sender.name = 'Picture2' then
    begin
    //-----------------------------------
     Imajpg := TJpegImage.Create;
     leido:=false;
     try
       Imajpg.LoadFromFile(nombreFoto2);
       leido:=true;
     except
     end;
     if Leido then
        tfrxpictureview(sender).picture.Assign(ImaJpg)
     else
      begin
         ImaPng := TPNGImage.Create;
         try
           ImaPng.LoadFromFile(nombreFoto2);
           leido:=true;
         except
         end;
         if Leido then
           tfrxpictureview(sender).picture.Assign(ImaPng);
         ImaPng.free;
      end;
     Imajpg.free;
   //......................................
   end;
end;


procedure TfrmReportes.limpiadataacta;
 begin
  edtactadniautoridad.Items.Clear;
  edtactacargoautoridad.Items.Clear;
  edtactanombreautoridad.Items.Clear;
  edtactaresolucionautoridad.Items.Clear;
  edtactafechares.Items.Clear;
  edtubigeosacta.items.clear;

  edtactadniautoridad.text:='';
  edtactacargoautoridad.text:='';
  edtactanombreautoridad.text:='';
  edtactaresolucionautoridad.text:='';
  edtactafechares.text:='';

  edtactafecha.Text:='';
  edtActaNumero.Text:='';
  edtactajefe.Text:='';

  indexacta:=-1;
 end;

procedure TfrmReportes.limpiadataadenda;
 begin
  edtAdendadniautoridad.Items.Clear;
  edtAdendacargoautoridad.Items.Clear;
  edtAdendanombreautoridad.Items.Clear;
  edtAdendaresolucionautoridad.Items.Clear;
  edtAdendafechares.Items.Clear;
  edtubigeosadenda.items.clear;

  edtAdendadniautoridad.text:='';
  edtAdendacargoautoridad.text:='';
  edtAdendanombreautoridad.text:='';
  edtAdendaresolucionautoridad.text:='';
  edtAdendafechares.text:='';

  edtAdendafecha.Text:='';
  edtAdendaNumero.Text:='';
  edtAdendajefe.Text:='';

  cbbtipoAdenda.text:=DataGlobal.VTipoAdenda;
  edtNroAdenda.text:=DataGlobal.VNroAdenda;
  edtFechaFirma.Text:=DateToStr(now);

  indexAdenda:=-1;
 end;


procedure TfrmReportes.dbgCaseriosActaCellClick(Column: TUniDBGridColumn);
  procedure seleccionarAutoridad(id:integer);
   begin
      edtactadniautoridad.ItemIndex:=id;
      edtactacargoautoridad.ItemIndex:=id;
      edtactanombreautoridad.ItemIndex:=id;
      edtactaresolucionautoridad.ItemIndex:=id;
      edtactafechares.ItemIndex:=id;
      edtubigeosacta.itemindex:=id;
      indexacta:=id;
   end;

  Procedure ActaJalaAutoridadDefault;
   var i : integer;
    begin
          DM1.ConsultaSQL.Close;
          DM1.ConsultaSQL.SQL.Clear;
          //edtnrocarta.Text:='';                       //0       1           2
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('SELECT a.DNI, a.IDCASERIO, a.CARGO, '));         //3   adxmarca
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('(select p.NOMBRE||" "||p.APPATERNO||" "||p.APMATERNO from persona p where p.DNI=a.DNI) NOMBRE, '));
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('a.Resolucion,a.fecha '));
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('FROM AUTORIDAD a '));
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('where a.ESTADO=1 and a.IDCASERIO="'+zcaserio.Fields[5].AsString+'" '));
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('ORDER BY 3 '));
          DM1.ConsultaSQL.Open;

          for i:=1 to DM1.ConsultaSQL.RecordCount do
           begin
             if i>1 then DM1.ConsultaSQL.Next;
             edtactadniautoridad.Items.Add(DM1.ConsultaSQL.Fields[0].AsString);
             edtubigeosacta.Items.Add(DM1.ConsultaSQL.Fields[1].AsString);
             edtactacargoautoridad.Items.Add(DM1.ConsultaSQL.Fields[2].AsString);
             edtactanombreautoridad.Items.Add(DM1.ConsultaSQL.Fields[3].AsString);
             edtactaresolucionautoridad.Items.Add(DM1.ConsultaSQL.Fields[4].AsString);
             edtactafechares.Items.Add(DM1.ConsultaSQL.Fields[5].AsString);
           end;
          seleccionarAutoridad(0);
          DM1.ConsultaSQL.Close;
    end;

begin
 // caserio acta click
  if zcaserio.Active then
   begin
      limpiadataacta;

      edtActaNumero.Text:=BuscaInforme('ACTACASERIO');
      // no hay datos es un informe nuevo

      if edtActaNumero.Text='' then
        begin
          edtActaNumero.text:=CalculaNroInforme('ACTACASERIO '+zcaserio.Fields[4].AsString,copy(dataGlobal.VidAdenda,length(dataGlobal.VidAdenda)-3,4),'');
          edtactafecha.Text:=dateToStr(now);

          ActaJalaAutoridadDefault;

          edtactajefe.Text:='JORDAN BERTONI HERRERA ARANDA';

        end
      else
        begin
          //hay datos hay que levantar
          CondAct:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.IDCASERIO="'+Zcaserio.Fields[5].AsString+'" and i.TIPOINFORME="ACTACASERIO" ';
                                      //  0       1            2        3        4          5         6
          ActivaDM1ConsultaSQL('select i.dni1,i.referencia,i.asunto,i.fechares,i.fecha,i.nroinforme,i.para '+
          'from INFORMES i where '+
          condAct,false);

          edtactadniautoridad.Text:=DM1.ConsultaSQL.Fields[0].AsString;
          edtactacargoautoridad.Text:=DM1.ConsultaSQL.Fields[1].AsString;
          edtactaresolucionautoridad.Text:=DM1.ConsultaSQL.Fields[2].AsString;
          edtactafechares.Text:=DM1.ConsultaSQL.Fields[3].AsString;
          edtubigeosacta.Text:=Zcaserio.Fields[5].AsString;

          edtactafecha.Text:=DM1.ConsultaSQL.Fields[4].AsString;
          edtActaNumero.Text:=DM1.ConsultaSQL.Fields[5].AsString;
          edtactajefe.Text:=DM1.ConsultaSQL.Fields[6].AsString;

          Dm1.ConsultaSQL.Close;

          edtactanombreautoridad.Text:=recuperaNombre(edtactadniautoridad.Text,' ');

          if chkJalaActaAutoridad.checked then
            ActaJalaAutoridadDefault;
        end;
   end;
end;

procedure TfrmReportes.dbgCaseriosAdendaCellClick(Column: TUniDBGridColumn);

  procedure seleccionarAutoridad(id:integer);
   begin
      edtAdendadniautoridad.ItemIndex:=id;
      edtAdendacargoautoridad.ItemIndex:=id;
      edtAdendanombreautoridad.ItemIndex:=id;
      edtAdendaresolucionautoridad.ItemIndex:=id;
      edtAdendafechares.ItemIndex:=id;
      edtubigeosadenda.itemindex:=id;
      indexAdenda:=id;
   end;

  procedure ImpAdendaAutoridad;
  var i : integer;
   begin
       DM1.ConsultaSQL.Close;
          DM1.ConsultaSQL.SQL.Clear;
          //edtnrocarta.Text:='';                       //0       1           2
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('SELECT a.DNI, a.IDCASERIO, a.CARGO, '));         //3  adxmarca
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('(select p.NOMBRE||" "||p.APPATERNO||" "||p.APMATERNO from persona p where p.DNI=a.DNI) NOMBRE, '));
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('a.Resolucion,a.fecha '));
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('FROM AUTORIDAD a '));
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('where a.ESTADO=1 and a.IDCASERIO="'+zcaserio.Fields[5].AsString+'" '));
            DM1.ConsultaSQL.SQL.ADD(FormatSQL3('ORDER BY 3 '));
          DM1.ConsultaSQL.Open;

          for i:=1 to DM1.ConsultaSQL.RecordCount do
           begin
             if i>1 then DM1.ConsultaSQL.Next;
             edtAdendadniautoridad.Items.Add(DM1.ConsultaSQL.Fields[0].AsString);
             edtubigeosadenda.Items.Add(DM1.ConsultaSQL.Fields[1].AsString);
             edtAdendacargoautoridad.Items.Add(DM1.ConsultaSQL.Fields[2].AsString);
             edtAdendanombreautoridad.Items.Add(DM1.ConsultaSQL.Fields[3].AsString);
             edtAdendaresolucionautoridad.Items.Add(DM1.ConsultaSQL.Fields[4].AsString);
             edtAdendafechares.Items.Add(DM1.ConsultaSQL.Fields[5].AsString);
           end;
          seleccionarAutoridad(0);
       DM1.ConsultaSQL.Close;
   end;

begin
 // caserio Adenda click
  if zcaserio.Active then
   begin
      limpiadataAdenda;

      edtAdendaNumero.Text:=BuscaInforme('ADENDACASERIO');
      // no hay datos es un informe nuevo

      if edtAdendaNumero.Text='' then
        begin
          edtAdendaNumero.text:=CalculaNroInforme('ADENDACASERIO '+zcaserio.Fields[4].AsString,copy(dataGlobal.VidAdenda,length(dataGlobal.VidAdenda)-3,4),'');
          edtAdendafecha.Text:=dateToStr(now);

          edtAdendajefe.Text:='JORDAN BERTONI HERRERA ARANDA';

          ImpAdendaAutoridad;

        end
      else
        begin
          //hay datos hay que levantar
          CondAct:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.IDCASERIO="'+Zcaserio.Fields[5].AsString+'" and i.TIPOINFORME="ADENDACASERIO" ';
                                      //  0       1            2        3        4          5         6
          ActivaDM1ConsultaSQL('select i.dni1,i.referencia,i.asunto,i.fechares,i.fecha,i.nroinforme,i.para '+
          'from INFORMES i where '+
          condAct,false);

          edtAdendadniautoridad.Text:=DM1.ConsultaSQL.Fields[0].AsString;
          edtAdendacargoautoridad.Text:=DM1.ConsultaSQL.Fields[1].AsString;
          edtAdendaresolucionautoridad.Text:=DM1.ConsultaSQL.Fields[2].AsString;
          edtAdendafechares.Text:=DM1.ConsultaSQL.Fields[3].AsString;
          edtubigeosadenda.Text:=Zcaserio.Fields[5].AsString;

          edtAdendafecha.Text:=DM1.ConsultaSQL.Fields[4].AsString;
          edtAdendaNumero.Text:=DM1.ConsultaSQL.Fields[5].AsString;
          edtAdendajefe.Text:=DM1.ConsultaSQL.Fields[6].AsString;

          Dm1.ConsultaSQL.Close;

          edtAdendanombreautoridad.Text:=recuperaNombre(edtAdendadniautoridad.Text,' ');

          if chkImpAutoridadAdendad.checked then  ImpAdendaAutoridad;

        end;
   end;
end;

procedure TfrmReportes.dbgCaseriosCartaCellClick(Column: TUniDBGridColumn);
  procedure seleccionarAutoridad(id:integer);
   begin
      cbbdniautoridad.ItemIndex:=id;
      cbbcargoautoridad.ItemIndex:=id;
      cbbnombreautoridad.ItemIndex:=id;
   end;

  procedure cargarAutoridadDefault;
  var i : integer;
   begin
      DM1.ConsultaSQL.Close;
      DM1.ConsultaSQL.SQL.Clear;
      //edtnrocarta.Text:='';                   //0       1           2               3  adxmarca
        DM1.ConsultaSQL.SQL.ADD(FormatSQL3('SELECT a.DNI, a.IDCASERIO, a.CARGO, '));
        DM1.ConsultaSQL.SQL.ADD(FormatSQL3('(select p.NOMBRE||" "||p.APPATERNO||" "||p.APMATERNO from persona p where p.DNI=a.DNI) NOMBRE '));
        DM1.ConsultaSQL.SQL.ADD(FormatSQL3('FROM AUTORIDAD a '));
        DM1.ConsultaSQL.SQL.ADD(FormatSQL3('where a.ESTADO=1 and a.IDCASERIO="'+zcaserio.Fields[5].AsString+'" '));
        DM1.ConsultaSQL.SQL.ADD(FormatSQL3('ORDER BY 3 '));
      DM1.ConsultaSQL.Open;

      for i:=1 to DM1.ConsultaSQL.RecordCount do
       begin
         if i>1 then DM1.ConsultaSQL.Next;
         cbbdniautoridad.Items.Add(DM1.ConsultaSQL.Fields[0].AsString);
         cbbcargoautoridad.Items.Add(DM1.ConsultaSQL.Fields[2].AsString);
         cbbnombreautoridad.Items.Add(DM1.ConsultaSQL.Fields[3].AsString);
       end;
      seleccionarAutoridad(0);

      DM1.ConsultaSQL.Close;
   end;

begin
  if zcaserio.Active then
   begin
      edtnrocarta.Text:=BuscaInforme('CARTACASERIO');
      // no hay datos es un informe nuevo
      cbbdniautoridad.Items.Clear;
      cbbcargoautoridad.Items.Clear;
      cbbnombreautoridad.Items.Clear;

      if edtnrocarta.Text='' then
        begin
          edtnrocarta.text:=CalculaNroInforme('CASERIO '+zcaserio.Fields[4].AsString,copy(dataGlobal.VidAdenda,length(dataGlobal.VidAdenda)-3,4),'');

          edtfechacarta.Text:=dateToStr(now);

          cargarAutoridadDefault;

          edtasuntocarta.Text:='Necesidad de sucripción de adenda al acta de entendimiento en el '+
          'anexo/centro poblado/comunidad nativa/ de '+zcaserio.Fields[4].AsString+' del distrito de '+
          zcaserio.Fields[3].AsString+' de la provincia de '+zcaserio.Fields[2].AsString;
          edtjefecarta.Text:='JORDAN BERTONI HERRERA ARANDA';

        end
      else
        begin
          //hay datos hay que levantar
          CondAct:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.IDCASERIO="'+Zcaserio.Fields[5].AsString+'" and i.TIPOINFORME="CARTACASERIO" ';
                                      //  0       1       2      3        4
          ActivaDM1ConsultaSQL('select i.fecha,i.para,i.asunto,i.dni1,i.referencia '+
          'from INFORMES i where '+
          condAct,false);

          cbbdniautoridad.Text:=DM1.ConsultaSQL.Fields[3].AsString;
          cbbcargoautoridad.Text:=DM1.ConsultaSQL.Fields[4].AsString;

          edtasuntocarta.Text:=DM1.ConsultaSQL.Fields[2].AsString;
          edtjefecarta.Text:=DM1.ConsultaSQL.Fields[1].AsString;
          edtfechacarta.Text:=DM1.ConsultaSQL.Fields[0].AsString;
          Dm1.ConsultaSQL.Close;

          cbbnombreautoridad.Text:=recuperaNombre(cbbdniautoridad.Text,' ');

          if chkIMPcartaautoridad.Checked then
           cargarAutoridadDefault;

        end;
   end;
end;




Procedure TfrmReportes.GenReporteTotal(chkIMPcartaautoridadVRT,chkcartacuadrosblancosVRT:boolean);      //TfrmReportes.
begin
end;
{Var  cbbdniautoridadVRT : String;
     cbbcargoautoridadVRT : String;
     cbbnombreautoridadVRT : String;
     edtnrocartaVRT,edtfechacartaVRT,edtasuntocartaVRT,edtjefecartaVRT,lblErrorCaption,aurl : string;
     MiInforme : TINFORMES;
     ReporteCartaCaserio : TfrxReport;
     j : integer;

     //---------------------------------------------------------------------------------------------------------------------
      procedure dbgCaseriosCartaCellClickVirtual;
       Var
           CondActVRT : string;

        procedure cargarAutoridadDefaultVRT;
        var i : integer;
         begin
            DM1.ConsultaSQL.Close;
            DM1.ConsultaSQL.SQL.Clear;
            //edtnrocarta.Text:='';                       //0       1           2               3  adxmarca
              DM1.ConsultaSQL.SQL.ADD(FormatSQL3('SELECT a.DNI, a.IDCASERIO, a.CARGO, '));
              DM1.ConsultaSQL.SQL.ADD(FormatSQL3('(select p.NOMBRE||" "||p.APPATERNO||" "||p.APMATERNO from persona p where p.DNI=a.DNI) NOMBRE '));
              DM1.ConsultaSQL.SQL.ADD(FormatSQL3('FROM AUTORIDAD a '));
              DM1.ConsultaSQL.SQL.ADD(FormatSQL3('where a.ESTADO=1 and a.IDCASERIO="'+zcaserioVRT.Fields[5].AsString+'" '));
              DM1.ConsultaSQL.SQL.ADD(FormatSQL3('ORDER BY 3 '));
            DM1.ConsultaSQL.Open;

               cbbdniautoridadVRT:=DM1.ConsultaSQL.Fields[0].AsString;
               cbbcargoautoridadVRT:=DM1.ConsultaSQL.Fields[2].AsString;
               cbbnombreautoridadVRT:=DM1.ConsultaSQL.Fields[3].AsString;

            DM1.ConsultaSQL.Close;
         end;

      begin
        if zcaserioVRT.Active then
         begin
            edtnrocartaVRT:=BuscaInforme('CARTACASERIO');
            // no hay datos es un informe nuevo
            cbbdniautoridadVRT:='';
            cbbcargoautoridadVRT:='';
            cbbnombreautoridadVRT:='';

            if edtnrocartaVRT='' then
              begin
                edtnrocartaVRT:=CalculaNroInforme('CASERIO '+zcaserioVRT.Fields[4].AsString,copy(dataGlobal.VidAdenda,length(dataGlobal.VidAdenda)-3,4),'');

                edtfechacartaVRT:=dateToStr(now);

                cargarAutoridadDefaultVRT;

                edtasuntocartaVRT:='Necesidad de sucripción de adenda al acta de entendimiento en el '+
                'anexo/centro poblado/comunidad nativa/ de '+zcaserioVRT.Fields[4].AsString+' del distrito de '+
                zcaserioVRT.Fields[3].AsString+' de la provincia de '+zcaserioVRT.Fields[2].AsString;
                edtjefecartaVRT:='JORDAN BERTONI HERRERA ARANDA';

              end
            else
              begin
                //hay datos hay que levantar
                CondActVRT:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.IDCASERIO="'+ZcaserioVRT.Fields[5].AsString+'" and i.TIPOINFORME="CARTACASERIO" ';
                                            //  0       1       2      3        4
                ActivaDM1ConsultaSQL('select i.fecha,i.para,i.asunto,i.dni1,i.referencia '+
                'from INFORMES i where '+
                CondActVRT,false);

                cbbdniautoridadVRT:=DM1.ConsultaSQL.Fields[3].AsString;
                cbbcargoautoridadVRT:=DM1.ConsultaSQL.Fields[4].AsString;

                edtasuntocartaVRT:=DM1.ConsultaSQL.Fields[2].AsString;
                edtjefecartaVRT:=DM1.ConsultaSQL.Fields[1].AsString;
                edtfechacartaVRT:=DM1.ConsultaSQL.Fields[0].AsString;
                Dm1.ConsultaSQL.Close;

                cbbnombreautoridadVRT:=recuperaNombre(cbbdniautoridadVRT,' ');

                if chkIMPcartaautoridadVRT then
                 cargarAutoridadDefaultVRT;

              end;
         end;
      end;



    //---------------------------------------------------------------------------------------------------------------------
    procedure btnGeneraCartaClickVRT(limpiarReporte:boolean);
    VAR error,i : byte;
        sc,ol,scaserio,ncaserio,sdistrito,sprovincia,sdepartamento : string;
    begin
        begin
          // debe de estar en un reg
          dbgCaseriosCartaCellClickVirtual;
          error:=0;
          if not zcaserioVRT.Active then  error:=1;
          if cbbdniautoridadVRT='' then error:=2;
          if cbbnombreautoridadVRT='' then error:=3;
          if (edtfechacartaVRT='') or (length(edtfechacartaVRT)<>10) then error:=4;
          if cbbcargoautoridadVRT='' then error:=5;
          if edtnrocartaVRT='' then error:=6;

          if error=0 then
            begin
            scaserio:=zcaserioVRT.Fields[5].AsString;
            ncaserio:=zcaserioVRT.Fields[4].AsString;
            sdistrito:=zcaserioVRT.Fields[3].AsString;
            sprovincia:=zcaserioVRT.Fields[2].AsString;
            sdepartamento:=zcaserioVRT.Fields[1].AsString;
              sc:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.TIPOINFORME="CARTACASERIO" and i.IDCASERIO="'+scaserio+'"';
              ActivaDM1ConsultaSQL('select i.NROINFORME '+
              'from INFORMES i where '+
              sc
              ,false);
              ol:=DM1.ConsultaSQL.Fields[0].AsString;
              DM1.ConsultaSQL.Close;

              MiInforme := TINFORMES.Create;
              Miinforme.Idadenda:=dataglobal.VidAdenda;
              Miinforme.idcaserio:=scaserio;
              MiInforme.Tipoinforme:='CARTACASERIO';
              MiInforme.Nroinforme:=edtnrocartaVRT;
              MiInforme.Fecha:=edtfechacartaVRT;
              MiInforme.Dni1:=cbbdniautoridadVRT;
              Miinforme.Referencia:=cbbcargoautoridadVRT;
              MiInforme.Para:=edtjefecartaVRT;
              Miinforme.Asunto:=edtasuntocartaVRT; //procesalineas(,512);
               if ol<>'' then
                 begin
                   MiInforme.Fechaactualizacion:=dateToStr(now);
                   MiInforme.Horaactualizacion:=getTime24;
                   MiInforme.actualizar2(sc);
                 end
               else
                 MiInforme.insertar;
              MiInforme.Free;

              ReporteCartaCaserio := TFrxReport.Create(frmReportes);
              ReporteCartaCaserio.OnBeforePrint :=  frxReporteBeforePrint;

              ReporteCartaCaserio.LoadFromFile(workdir+'\reportes\reportecartacaserio.fr3');

              ReporteCartaCaserio.Variables.Clear;

             //UNIGUI
              ReporteCartaCaserio.EngineOptions.SilentMode := True;
              ReporteCartaCaserio.EngineOptions.EnableThreadSafe := True;
              ReporteCartaCaserio.EngineOptions.DestroyForms := False;
              ReporteCartaCaserio.EngineOptions.UseGlobalDataSetList := False;
              ReporteCartaCaserio.PrintOptions.ShowDialog := False;
              ReporteCartaCaserio.ShowProgress := False;
              ReporteCartaCaserio.PreviewOptions.AllowEdit := False;


              ReporteCartaCaserio.Variables['FECHA']:='''' + fechaLarga(edtfechacartaVRT) + '''';
              ReporteCartaCaserio.Variables['NROCARTA']:='''' + edtnrocartaVRT + '''';
              ReporteCartaCaserio.Variables['NOMBREAUTORIDAD']:='''' + cbbnombreautoridadVRT + '''';
              ReporteCartaCaserio.Variables['CARGOAUTORIDAD']:='''' + cbbcargoautoridadVRT + '''';

              ReporteCartaCaserio.Variables['CASERIO']:='''' + ncaserio + '''';
              ReporteCartaCaserio.Variables['DEPARTAMENTO']:='''' + sdepartamento + '''';
              ReporteCartaCaserio.Variables['PROVINCIA']:='''' + sprovincia + '''';
              ReporteCartaCaserio.Variables['DISTRITO']:='''' + sdistrito + '''';

              ReporteCartaCaserio.Variables['PARA']:='''' + edtjefecartaVRT+ '''';
              ReporteCartaCaserio.Variables['ASUNTO']:='''' + edtasuntocartaVRT + '''';

              frxPDFExp.Background := True;
              frxPDFExp.ShowProgress := False;
              frxPDFExp.ShowDialog := False;

              frxPDFExp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl);
              frxPDFExp.DefaultPath := '';
              frxPDFExp.Author:='DEVIDA';
              frxPDFExp.Subject:='CARTA CASERIO';

               // Anexo 1 Incorporacion // 1.1 nueva familia
              zquery1.Close;
              zquery1.SQL.Clear;
              zquery1.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL1.sql');
              ZBindParam(zquery1,':IDADENDA',dataglobal.VidAdenda);
              ZBindParam(zquery1,':IDCASERIO',scaserio);

              zquery1.open;
              if (zquery1.RecordCount<=0) and (chkcartacuadrosblancosVRT) then
                begin
                  zquery1.Close;
                  zquery1.SQL.Clear;
                  zquery1.SQL.Add(FSL3('select * from vmovPadronvoid'));
                  zquery1.open;
                end;

              //Anexo 2
              zquery2.Close;
              zquery2.SQL.Clear;
              zquery2.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL2.sql');
              ZBindParam(zquery2,':IDADENDA',dataglobal.VidAdenda);
              ZBindParam(zquery2,':IDCASERIO',scaserio);

              zquery2.open;
              //for i:=0 to zquery2.Fields.count-1 do unimemo2.Lines.Add(zquery2.Fields[i].FieldName);
              if (zquery2.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
                begin
                  zquery2.Close;
                  zquery2.SQL.Clear;
                  zquery2.SQL.Add(FSL3('select * from vmovPadronvoid'));
                  zquery2.open;
                end;

              //anexo 3
              zquery3.Close;
              zquery3.SQL.Clear;
              zquery3.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL3.sql');
              ZBindParam(zquery3,':IDADENDA',dataglobal.VidAdenda);
              ZBindParam(zquery3,':IDCASERIO',scaserio);

              zquery3.open;
              if (zquery3.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
                begin
                  zquery3.Close;
                  zquery3.SQL.Clear;
                  zquery3.SQL.Add(FSL3('select * from vmovPadronvoid'));
                  zquery3.open;
                end;

              //anexo 4
              zquery4.Close;
              zquery4.SQL.Clear;
              zquery4.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL4.sql');
              ZBindParam(zquery4,':IDADENDA',dataglobal.VidAdenda);
              ZBindParam(zquery4,':IDCASERIO',scaserio);

              zquery4.open;
              if (zquery4.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
                begin
                  zquery4.Close;
                  zquery4.SQL.Clear;
                  zquery4.SQL.Add(FSL3('select * from vmovPadronvoid'));
                  zquery4.open;
                end;

              //anexo 5
              zquery5.Close;
              zquery5.SQL.Clear;
              zquery5.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL5.sql');
              ZBindParam(zquery5,':IDADENDA',dataglobal.VidAdenda);
              ZBindParam(zquery5,':IDCASERIO',scaserio);

              zquery5.open;
              if (zquery5.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
                begin
                  zquery5.Close;
                  zquery5.SQL.Clear;
                  zquery5.SQL.Add(FSL3('select * from vmovPadronvoid'));
                  zquery5.open;
                end;

              //anexo 6
              zquery6.Close;
              zquery6.SQL.Clear;
              zquery6.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL6.sql');
              ZBindParam(zquery6,':IDADENDA',dataglobal.VidAdenda);
              ZBindParam(zquery6,':IDCASERIO',scaserio);

              zquery6.open;
              if (zquery6.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
                begin
                  zquery6.Close;
                  zquery6.SQL.Clear;
                  zquery6.SQL.Add(FSL3('select * from vmovPadronvoid'));
                  zquery6.open;
                end;

              // ---------------- genero el reporte
              ReporteCartaCaserio.PrepareReport(LimpiarReporte)

            end
          else
            BEGIN
             //case error of
             //  1: Showmessage('Busque un caserio antes');
             //  2: Showmessage('Falta DNI Autoridad');
             //  3: Showmessage('Falta Nombre de Autoridad');
             //  4: Showmessage('Verifique la fecha');
             //  5: Showmessage('Falta Cargo de Autoridad');
             //  6: Showmessage('Falta Nro de Carta');
             // end;
               lblErrorCaption:=lblError.Caption+'Reg='+StrI(zcaseriovrt.RecNo)+',e='+strI(error)+'; ';
            end;
        end;
        lblError.Caption:=lblErrorCaption;
    end;

begin
  // asdasd
  if Zcaserio.Active then
   begin
     ZcaserioVRT.Close;
     ZcaserioVRT.sql.Clear;
     ZcaserioVRT.sql.Add( Zcaserio.SQL.Text );
     ZcaserioVRT.Open;

     if zcaseriovrt.RecordCount>0 then
      BEGIN
       zcaseriovrt.First;
       for J := 1 to 1 do //zcaseriovrt.RecordCount do
         BEGIN
           if j>1 then zcaseriovrt.Next;

           IF J=1 THEN btnGeneraCartaClickVRT(TRUE)
           ELSE
             btnGeneraCartaClickVRT(FALSE);
         END;
       ReporteCartaCaserio.Export(frxPDFExp);
       FrmVistaPrevia.UniURLFrame1.URL:=AUrl;
       ReporteCartaCaserio.Free;
      END
     else
       ShowMessage('No hay datos...');

   end;
end;
}















procedure TfrmReportes.dbgCaseriosTecnicoCellClick(Column: TUniDBGridColumn);
begin
  if zcaserio.Active then
   begin
      edtNroInforme.Text:=BuscaInforme('TECNICO');
      if edtNroInforme.Text='' then
        edtnroInforme.text:=CalculaNroInforme(edtNombreTecnico.Text,copy(dataGlobal.VidAdenda,length(dataGlobal.VidAdenda)-3,4),cbbactividad.Text);
   end;
end;

procedure TfrmReportes.edtactacargoautoridadChange(Sender: TObject);
begin
  if (indexacta<>edtactacargoautoridad.ItemIndex) and (edtactacargoautoridad.ItemIndex<>-1) then
   begin
    indexacta:=edtactacargoautoridad.ItemIndex;
    edtactadniautoridad.ItemIndex:=edtactacargoautoridad.ItemIndex;
    //edtactacargoautoridad.ItemIndex:=;
    edtactanombreautoridad.ItemIndex:=edtactacargoautoridad.ItemIndex;
    edtactaresolucionautoridad.ItemIndex:=edtactacargoautoridad.ItemIndex;
    edtactafechares.ItemIndex:=edtactacargoautoridad.ItemIndex;
   end;
end;

procedure TfrmReportes.edtactaDniAutoridadChange(Sender: TObject);
begin
  if (indexacta<>edtactadniautoridad.ItemIndex) and (edtactadniautoridad.ItemIndex<>-1) then
   begin
    indexacta:=edtactadniautoridad.ItemIndex;
    //edtactadniautoridad.ItemIndex:=;
    edtactacargoautoridad.ItemIndex:=edtactadniautoridad.ItemIndex;
    edtactanombreautoridad.ItemIndex:=edtactadniautoridad.ItemIndex;
    edtactaresolucionautoridad.ItemIndex:=edtactadniautoridad.ItemIndex;
    edtactafechares.ItemIndex:=edtactadniautoridad.ItemIndex;
   end;
end;

procedure TfrmReportes.edtactafecharesChange(Sender: TObject);
begin
  if (indexacta<>edtactafechares.ItemIndex) and (edtactafechares.ItemIndex<>-1) then
   begin
    indexacta:=edtactafechares.ItemIndex;
    edtactadniautoridad.ItemIndex:=edtactafechares.ItemIndex;
    edtactacargoautoridad.ItemIndex:=edtactafechares.ItemIndex;
    edtactanombreautoridad.ItemIndex:=edtactafechares.ItemIndex;
    edtactaresolucionautoridad.ItemIndex:=edtactafechares.ItemIndex;
    //edtactafechares.ItemIndex:=;
   end;
end;

procedure TfrmReportes.edtactanombreautoridadChange(Sender: TObject);
begin
  if (indexacta<>edtactanombreautoridad.ItemIndex) and (edtactanombreautoridad.ItemIndex<>-1) then
   begin
    indexacta:=edtactanombreautoridad.ItemIndex;
    edtactadniautoridad.ItemIndex:=edtactanombreautoridad.ItemIndex;
    edtactacargoautoridad.ItemIndex:=edtactanombreautoridad.ItemIndex;
    //edtactanombreautoridad.ItemIndex:=edtactanombreautoridad.ItemIndex;
    edtactaresolucionautoridad.ItemIndex:=edtactanombreautoridad.ItemIndex;
    edtactafechares.ItemIndex:=edtactanombreautoridad.ItemIndex;
   end;
end;

procedure TfrmReportes.edtactaresolucionautoridadChange(Sender: TObject);
begin
  if (indexacta<>edtactaresolucionautoridad.ItemIndex) and (edtactaresolucionautoridad.ItemIndex<>-1) then
   begin
    indexacta:=edtactaresolucionautoridad.ItemIndex;
    edtactadniautoridad.ItemIndex:=edtactaresolucionautoridad.ItemIndex;
    edtactacargoautoridad.ItemIndex:=edtactaresolucionautoridad.ItemIndex;
    edtactanombreautoridad.ItemIndex:=edtactaresolucionautoridad.ItemIndex;
    //edtactaresolucionautoridad.ItemIndex:=;
    edtactafechares.ItemIndex:=edtactaresolucionautoridad.ItemIndex;
   end;
end;

procedure TfrmReportes.edtAdendacargoautoridadChange(Sender: TObject);
begin
  if (indexAdenda<>edtAdendacargoautoridad.ItemIndex) and (edtAdendacargoautoridad.ItemIndex<>-1) then
   begin
    indexAdenda:=edtAdendacargoautoridad.ItemIndex;
    edtAdendadniautoridad.ItemIndex:=edtAdendacargoautoridad.ItemIndex;
    //edtAdendacargoautoridad.ItemIndex:=;
    edtAdendanombreautoridad.ItemIndex:=edtAdendacargoautoridad.ItemIndex;
    edtAdendaresolucionautoridad.ItemIndex:=edtAdendacargoautoridad.ItemIndex;
    edtAdendafechares.ItemIndex:=edtAdendacargoautoridad.ItemIndex;
   end;
end;

procedure TfrmReportes.edtAdendafecharesChange(Sender: TObject);
begin
  if (indexAdenda<>edtAdendafechares.ItemIndex) and (edtAdendafechares.ItemIndex<>-1) then
   begin
    indexAdenda:=edtAdendafechares.ItemIndex;
    edtAdendadniautoridad.ItemIndex:=edtAdendafechares.ItemIndex;
    edtAdendacargoautoridad.ItemIndex:=edtAdendafechares.ItemIndex;
    edtAdendanombreautoridad.ItemIndex:=edtAdendafechares.ItemIndex;
    edtAdendaresolucionautoridad.ItemIndex:=edtAdendafechares.ItemIndex;
    //edtAdendafechares.ItemIndex:=;
   end;
end;

procedure TfrmReportes.edtAdendanombreautoridadChange(Sender: TObject);
begin
  if (indexAdenda<>edtAdendanombreautoridad.ItemIndex) and (edtAdendanombreautoridad.ItemIndex<>-1) then
   begin
    indexAdenda:=edtAdendanombreautoridad.ItemIndex;
    edtAdendadniautoridad.ItemIndex:=edtAdendanombreautoridad.ItemIndex;
    edtAdendacargoautoridad.ItemIndex:=edtAdendanombreautoridad.ItemIndex;
    //edtAdendanombreautoridad.ItemIndex:=edtAdendanombreautoridad.ItemIndex;
    edtAdendaresolucionautoridad.ItemIndex:=edtAdendanombreautoridad.ItemIndex;
    edtAdendafechares.ItemIndex:=edtAdendanombreautoridad.ItemIndex;
   end;
end;

procedure TfrmReportes.edtAdendaresolucionautoridadChange(Sender: TObject);
begin
  if (indexacta<>edtactaresolucionautoridad.ItemIndex) and (edtactaresolucionautoridad.ItemIndex<>-1) then
   begin
    indexacta:=edtactaresolucionautoridad.ItemIndex;
    edtactadniautoridad.ItemIndex:=edtactaresolucionautoridad.ItemIndex;
    edtactacargoautoridad.ItemIndex:=edtactaresolucionautoridad.ItemIndex;
    edtactanombreautoridad.ItemIndex:=edtactaresolucionautoridad.ItemIndex;
    //edtactaresolucionautoridad.ItemIndex:=;
    edtactafechares.ItemIndex:=edtactaresolucionautoridad.ItemIndex;
   end;
end;

function TfrmReportes.BuscaInforme(tipoinforme:string):string;
 begin
      if tipoinforme='TECNICO' then
        CondAct:='i.DNI1="'+edtdni_tecnico.Text+'" and i.ACTIVIDAD1="'+cbbactividad.Text+'" and i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.IDCASERIO="'+Zcaserio.Fields[5].AsString+'"';

      if tipoinforme='CARTACASERIO' then
        CondAct:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.IDCASERIO="'+Zcaserio.Fields[5].AsString+'" and i.TIPOINFORME="CARTACASERIO" ';

      if tipoinforme='ACTACASERIO' then
        CondAct:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.IDCASERIO="'+Zcaserio.Fields[5].AsString+'" and i.TIPOINFORME="ACTACASERIO" ';

      if tipoinforme='ADENDACASERIO' then
        CondAct:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.IDCASERIO="'+Zcaserio.Fields[5].AsString+'" and i.TIPOINFORME="ADENDACASERIO" ';

      ActivaDM1ConsultaSQL('select i.NROINFORME '+
      'from INFORMES i where '+
      condAct,false);
      BuscaInforme:=DM1.ConsultaSQL.Fields[0].AsString;
      DM1.ConsultaSQL.Close;
 end;

procedure TfrmReportes.btnGeneraCartaClick(Sender: TObject);
VAR error,i : byte;
    sc,ol,scaserio,ncaserio,sdistrito,sprovincia,sdepartamento,aurl : string;
    MiInforme : TINFORMES;
    ReporteCartaCaserio : TfrxReport;
begin
  error:=0;
  if not zcaserio.Active then  error:=1;
  if cbbdniautoridad.Text='' then error:=2;
  if cbbnombreautoridad.Text='' then error:=3;
  if (edtfechacarta.Text='') or (length(edtfechacarta.Text)<>10) then error:=4;
  if cbbcargoautoridad.text='' then error:=5;
  if edtnrocarta.Text='' then error:=6;


  if error=0 then
    begin
    scaserio:=zcaserio.Fields[5].AsString;
    ncaserio:=zcaserio.Fields[4].AsString;
    sdistrito:=zcaserio.Fields[3].AsString;
    sprovincia:=zcaserio.Fields[2].AsString;
    sdepartamento:=zcaserio.Fields[1].AsString;
      sc:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.TIPOINFORME="CARTACASERIO" and i.IDCASERIO="'+scaserio+'"';
      ActivaDM1ConsultaSQL('select i.NROINFORME '+
      'from INFORMES i where '+
      sc
      ,false);
      ol:=DM1.ConsultaSQL.Fields[0].AsString;
      DM1.ConsultaSQL.Close;

      MiInforme := TINFORMES.Create;
      Miinforme.Idadenda:=dataglobal.VidAdenda;
      Miinforme.idcaserio:=scaserio;
      MiInforme.Tipoinforme:='CARTACASERIO';
      MiInforme.Nroinforme:=edtnrocarta.Text;
      MiInforme.Fecha:=edtfechacarta.Text;
      MiInforme.Dni1:=cbbdniautoridad.Text;
      Miinforme.Referencia:=cbbcargoautoridad.Text;
      MiInforme.Para:=edtjefecarta.Text;
      Miinforme.Asunto:=procesalineas(edtasuntocarta.Lines,512);
       if ol<>'' then
         begin
           MiInforme.Fechaactualizacion:=dateToStr(now);
           MiInforme.Horaactualizacion:=getTime24;
           MiInforme.actualizar2(sc,DM1.Base_Datos);
         end
       else
         MiInforme.insertar(DM1.Base_Datos);
      MiInforme.Free;

      ReporteCartaCaserio := TFrxReport.Create(frmReportes);
      ReporteCartaCaserio.OnBeforePrint :=  frxReporteBeforePrint;

      ReporteCartaCaserio.LoadFromFile(workdir+'\reportes\reportecartacaserio.fr3');

      ReporteCartaCaserio.Variables.Clear;

     //UNIGUI
      ReporteCartaCaserio.EngineOptions.SilentMode := True;
      ReporteCartaCaserio.EngineOptions.EnableThreadSafe := True;
      ReporteCartaCaserio.EngineOptions.DestroyForms := False;
      ReporteCartaCaserio.EngineOptions.UseGlobalDataSetList := False;
      ReporteCartaCaserio.PrintOptions.ShowDialog := False;
      ReporteCartaCaserio.ShowProgress := False;
      ReporteCartaCaserio.PreviewOptions.AllowEdit := False;


      ReporteCartaCaserio.Variables['FECHA']:='''' + fechaLarga(edtfechacarta.Text) + '''';
      ReporteCartaCaserio.Variables['NROCARTA']:='''' + edtnrocarta.Text + '''';
      ReporteCartaCaserio.Variables['NOMBREAUTORIDAD']:='''' + cbbnombreautoridad.Text + '''';
      ReporteCartaCaserio.Variables['CARGOAUTORIDAD']:='''' + cbbcargoautoridad.Text + '''';

      ReporteCartaCaserio.Variables['CASERIO']:='''' + ncaserio + '''';
      ReporteCartaCaserio.Variables['DEPARTAMENTO']:='''' + sdepartamento + '''';
      ReporteCartaCaserio.Variables['PROVINCIA']:='''' + sprovincia + '''';
      ReporteCartaCaserio.Variables['DISTRITO']:='''' + sdistrito + '''';

      ReporteCartaCaserio.Variables['PARA']:='''' + edtjefecarta.Text + '''';
      ReporteCartaCaserio.Variables['ASUNTO']:='''' + procesalineas(edtasuntocarta.Lines,512) + '''';

      frxPDFExp.Background := True;
      frxPDFExp.ShowProgress := False;
      frxPDFExp.ShowDialog := False;

      frxPDFExp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl);
      frxPDFExp.DefaultPath := '';
      frxPDFExp.Author:='DEVIDA';
      frxPDFExp.Subject:='CARTA CASERIO';

       // Anexo 1 Incorporacion // 1.1 nueva familia
      zquery1.Close;
      zquery1.SQL.Clear;
      {zquery1.SQL.Add(FSL3('SELECT '));
      zquery1.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery1.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery1.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
      zquery1.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));

      zquery1.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));

      zquery1.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
      zquery1.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
      zquery1.SQL.Add(FSL3('FROM VMOVPADRON a '));

      zquery1.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery1.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="INCORPORACION" AND a.SUBTIPOMOV="NUEVA FAMILIA" '));
      zquery1.SQL.Add(FSL3('Order by 1 '));
      zquery1.sql.SaveToFile('D:\CARTA_CASERIO_SQL1.sql'); }

      zquery1.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL1.sql');
      ZBindParam(zquery1,':IDADENDA',dataglobal.VidAdenda);
      ZBindParam(zquery1,':IDCASERIO',scaserio);

      zquery1.open;
      if (zquery1.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
        begin
          zquery1.Close;
          zquery1.SQL.Clear;
          zquery1.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery1.open;
        end;

      //Anexo 2
      zquery2.Close;
      zquery2.SQL.Clear;
      {zquery2.SQL.Add(FSL3('SELECT '));
      zquery2.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery2.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery2.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
      zquery2.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery2.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
      zquery2.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
      zquery2.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3, '));
      //------ DATOS SI HAY REFERENCIA
      zquery2.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPPATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPMATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_REFERENCIA) RFNOMBRE, '));
      zquery2.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_REFERENCIA) RFEDAD, '));
      zquery2.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_REFERENCIA) RFSEXO, '));
      zquery2.SQL.Add(FSL3('a.DNI_REFERENCIA, '));
      zquery2.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPPATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPMATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_refConyuge) RFCYNOMBRE, '));
      zquery2.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_refConyuge) RFCYEDAD, '));
      zquery2.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_refConyuge) RFCYSEXO, '));
      zquery2.SQL.Add(FSL3('a.DNI_refConyuge, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFANIOS, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFACTIVIDADES, '));
      zquery2.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) HAS, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) ETAPAS, '));
      zquery2.SQL.Add(FSL3('(SELECT t.observaciones FROM padron t where t.idpadron=a.IDMOVREFERENCIA) RFOBSERVACIONES '));
      //------- tabla
      zquery2.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery2.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery2.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="INCORPORACION" AND a.SUBTIPOMOV="REEMPLAZO DE FAMILIA" '));
      zquery2.SQL.Add(FSL3('Order by 1 '));
      zquery2.sql.SaveToFile('D:\CARTA_CASERIO_SQL2.sql');}

      zquery2.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL2.sql');
      ZBindParam(zquery2,':IDADENDA',dataglobal.VidAdenda);
      ZBindParam(zquery2,':IDCASERIO',scaserio);

      zquery2.open;
      //for i:=0 to zquery2.Fields.count-1 do unimemo2.Lines.Add(zquery2.Fields[i].FieldName);
      if (zquery2.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
        begin
          zquery2.Close;
          zquery2.SQL.Clear;
          zquery2.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery2.open;
        end;

      //anexo 3
      zquery3.Close;
      zquery3.SQL.Clear;
      {zquery3.SQL.Add(FSL3('SELECT '));
      zquery3.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery3.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery3.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
      zquery3.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery3.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
      zquery3.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
      zquery3.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
      zquery3.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery3.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery3.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="EXCLUSION" AND a.SUBTIPOMOV="EXCLUSION DE PARTICIPANTES" '));
      zquery3.SQL.Add(FSL3('Order by 1 '));
      zquery3.sql.SaveToFile('D:\CARTA_CASERIO_SQL3.sql');}

      zquery3.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL3.sql');
      ZBindParam(zquery3,':IDADENDA',dataglobal.VidAdenda);
      ZBindParam(zquery3,':IDCASERIO',scaserio);

      zquery3.open;
      if (zquery3.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
        begin
          zquery3.Close;
          zquery3.SQL.Clear;
          zquery3.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery3.open;
        end;

      //anexo 4
      zquery4.Close;
      zquery4.SQL.Clear;
      {zquery4.SQL.Add(FSL3('SELECT '));
      zquery4.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery4.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery4.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
      zquery4.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery4.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
      zquery4.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
      zquery4.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
      zquery4.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery4.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery4.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="ACTUALIZACION DE METAS" AND a.SUBTIPOMOV="INCREMENTO DE BENEFICIO" '));
      zquery4.SQL.Add(FSL3('Order by 1 '));
      zquery4.sql.SaveToFile('D:\CARTA_CASERIO_SQL4.sql');}

      zquery4.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL4.sql');
      ZBindParam(zquery4,':IDADENDA',dataglobal.VidAdenda);
      ZBindParam(zquery4,':IDCASERIO',scaserio);

      zquery4.open;
      if (zquery4.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
        begin
          zquery4.Close;
          zquery4.SQL.Clear;
          zquery4.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery4.open;
        end;

      //anexo 5
      zquery5.Close;
      zquery5.SQL.Clear;
      {zquery5.SQL.Add(FSL3('SELECT '));
      zquery5.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery5.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery5.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
      zquery5.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery5.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
      zquery5.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
      zquery5.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
      zquery5.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery5.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery5.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="ACTUALIZACION DE METAS" AND a.SUBTIPOMOV="REDUCCION DE BENEFICIOS" '));
      zquery5.SQL.Add(FSL3('Order by 1 '));
      zquery5.sql.SaveToFile('D:\CARTA_CASERIO_SQL5.sql'); }

      zquery5.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL5.sql');
      ZBindParam(zquery5,':IDADENDA',dataglobal.VidAdenda);
      ZBindParam(zquery5,':IDCASERIO',scaserio);

      zquery5.open;
      if (zquery5.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
        begin
          zquery5.Close;
          zquery5.SQL.Clear;
          zquery5.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery5.open;
        end;

      //anexo 6
      zquery6.Close;
      zquery6.SQL.Clear;
      {zquery6.SQL.Add(FSL3('SELECT '));
      zquery6.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery6.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery6.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
      zquery6.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery6.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
      zquery6.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
      zquery6.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3, '));
      //------ DATOS SI HAY REFERENCIA
      zquery6.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPPATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPMATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_REFERENCIA) RFNOMBRE, '));
      zquery6.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_REFERENCIA) RFEDAD, '));
      zquery6.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_REFERENCIA) RFSEXO, '));
      zquery6.SQL.Add(FSL3('a.DNI_REFERENCIA, '));
      zquery6.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPPATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPMATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_refConyuge) RFCYNOMBRE, '));
      zquery6.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_refConyuge) RFCYEDAD, '));
      zquery6.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_refConyuge) RFCYSEXO, '));
      zquery6.SQL.Add(FSL3('a.DNI_refConyuge, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFANIOS, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFACTIVIDADES, '));
      zquery6.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) HAS, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) ETAPAS, '));
      zquery6.SQL.Add(FSL3('(SELECT t.observaciones FROM padron t where t.idpadron=a.IDMOVREFERENCIA) RFOBSERVACIONES '));
      //------- tabla
      zquery6.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery6.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery6.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="CAMBIO DE TITULARIDAD" AND a.SUBTIPOMOV="CAMBIO DE TITULARIDAD" '));
      zquery6.SQL.Add(FSL3('Order by 1 '));
      zquery6.sql.SaveToFile('D:\CARTA_CASERIO_SQL6.sql'); }

      zquery6.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL6.sql');
      ZBindParam(zquery6,':IDADENDA',dataglobal.VidAdenda);
      ZBindParam(zquery6,':IDCASERIO',scaserio);

      zquery6.open;
      if (zquery6.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
        begin
          zquery6.Close;
          zquery6.SQL.Clear;
          zquery6.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery6.open;
        end;

      // ---------------- genero el reporte
      ReporteCartaCaserio.PrepareReport(True);
      ReporteCartaCaserio.Export(frxPDFExp);

      FrmVistaPrevia.UniURLFrame1.URL:=AUrl;

      ReporteCartaCaserio.Free;

    end
  else
    case error of
      1: Showmessage('Busque un caserio antes');
      2: Showmessage('Falta DNI Autoridad');
      3: Showmessage('Falta Nombre de Autoridad');
      4: Showmessage('Verifique la fecha');
      5: Showmessage('Falta Cargo de Autoridad');
      6: Showmessage('Falta Nro de Carta');
    end;
end;




procedure TfrmReportes.btnGenerarInformeTecnicoClick(Sender: TObject);
VAR AUrl,Cond,oldNroInforme : String;
    ReporteTecnicoCampo : TfrxReport;
    ReporteFotos : TfrxReport;
    miInforme : TINFORMES;
    i : integer;

    function evaluaX(dato : boolean) : string;
     begin
       if dato then result:='X'
       else result:='';
     end;

begin
 if zcaserio.Active then
 begin
  if Zcaserio.RecordCount>0 then
    begin

      oldNroInforme:=BuscaInforme('TECNICO');

      MiInforme := TINFORMES.Create;
      Miinforme.Idadenda:=dataglobal.VidAdenda;
      MiInforme.Nroinforme:=edtnroInforme.Text;
      MiInforme.Tipoinforme:='TECNICO';
      MiInforme.Dni1:=edtDNI_tecnico.Text;
      MiInforme.Actividad1:=cbbactividad.Text;
      MiInforme.Idcaserio:=Zcaserio.Fields[5].AsString;
       if oldNroInforme<>'' then
         begin
           MiInforme.Fechaactualizacion:=dateToStr(now);
           MiInforme.Horaactualizacion:=getTime24;
           MiInforme.actualizar2(condAct,DM1.Base_Datos);
         end
       else
         MiInforme.insertar(DM1.Base_Datos);
      MiInforme.Free;

      //pero tengo que actualizar en movpadron
      EjecutaSQL('update movpadron m '+
      'set m.NRO_INFORME="'+edtnroInforme.Text+'" '+
      'where m.IDADENDA="'+dataglobal.VidAdenda+'" '+
      'and m.DNI_TECNICO="'+edtDNI_tecnico.Text+'" '+
      'and m.IDCASERIO="'+Zcaserio.Fields[5].AsString+'" '+
      'and "'+cbbactividad.Text+'" in '+
      '(select ma.IDACTIVIDAD '+
      'from movpadronactividad ma '+
      'where ma.IDMOVPADRON in '+
      '(select a.idmovpadron from MOVPADRON a '+
      'where a.IDADENDA="'+dataglobal.VidAdenda+'" '+
      'and a.DNI_TECNICO="'+edtDNI_tecnico.Text+'" '+
      'and a.IDCASERIO="'+Zcaserio.Fields[5].AsString+'")) ',false);


      ReporteTecnicoCampo := TFrxReport.Create(frmReportes);
      ReporteTecnicoCampo.OnBeforePrint :=  frxReporteBeforePrint;

      ReporteTecnicoCampo.LoadFromFile(workdir+'\reportes\ReporteTecnicoCampo.fr3');

      ReporteTecnicoCampo.Variables.Clear;

     //UNIGUI
      ReporteTecnicoCampo.EngineOptions.SilentMode := True;
      ReporteTecnicoCampo.EngineOptions.EnableThreadSafe := True;
      ReporteTecnicoCampo.EngineOptions.DestroyForms := False;
      ReporteTecnicoCampo.EngineOptions.UseGlobalDataSetList := False;
      ReporteTecnicoCampo.PrintOptions.ShowDialog := False;
      ReporteTecnicoCampo.ShowProgress := False;
      ReporteTecnicoCampo.PreviewOptions.AllowEdit := False;


      ReporteTecnicoCampo.Variables['ACTIVIDAD']:='''' + cbbactividad.Text + '''';
      ReporteTecnicoCampo.Variables['COORDINADOR']:='''' + EDTCOORDINADOR.Text + '''';
      ReporteTecnicoCampo.Variables['TECNICO']:='''' + EDTNOMBRETECNICO.Text + '''';
      ReporteTecnicoCampo.Variables['DNITECNICO']:='''' + EDTDNI_TECNICO.Text + '''';
      ReporteTecnicoCampo.Variables['NROINFORME']:='''' + edtnroinforme.Text + '''';
      ReporteTecnicoCampo.Variables['CASERIO']:='''' + Zcaserio.Fields[4].AsString + '''';
      ReporteTecnicoCampo.Variables['DISTRITO']:='''' + Zcaserio.Fields[3].AsString  + '''';
      ReporteTecnicoCampo.Variables['PROVINCIA']:='''' + Zcaserio.Fields[2].AsString + '''';

      ReporteTecnicoCampo.Variables['CHK1']:='''' + evaluaX(chkfotostecnico.Checked) + '''';
      ReporteTecnicoCampo.Variables['CHK2']:='''' + evaluaX(uniCheckBox2.Checked) + '''';
      ReporteTecnicoCampo.Variables['CHK3']:='''' + evaluaX(uniCheckBox3.Checked) + '''';
      ReporteTecnicoCampo.Variables['CHK4']:='''' + evaluaX(uniCheckBox4.Checked) + '''';
      ReporteTecnicoCampo.Variables['CHK5']:='''' + evaluaX(uniCheckBox5.Checked) + '''';

      frxPDFExp.Background := True;
      frxPDFExp.ShowProgress := False;
      frxPDFExp.ShowDialog := False;

      frxPDFExp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl);
      frxPDFExp.DefaultPath := '';
      frxPDFExp.Author:='DEVIDA';
      frxPDFExp.Subject:='INFORME TECNICO DE CAMPO';

      //cond:=FSL3(' and m.idcaserio="'+Zcaserio.Fields[5].AsString+'" ');
      cond:=FSL3(' and m.idcaserio="'+Zcaserio.Fields[5].AsString+'" and m.dni_tecnico="'+edtDni_tecnico.Text+'" ');

      // Anexo 1 Incorporacion // 1.1 nueva familia
      zquery1.Close;
      zquery1.SQL.Clear;
      zquery1.SQL.Add(FSL3('select '));
      zquery1.SQL.Add(FSL3('m.idmovpadron, '));
      zquery1.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_TITULAR) APPATERNO, '));
      zquery1.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_TITULAR) APMATERNO, '));
      zquery1.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_TITULAR) NOMBRE, '));
      zquery1.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_TITULAR) EDAD, '));
      zquery1.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_TITULAR) SEXO, '));
      zquery1.SQL.Add(FSL3('m.DNI_TITULAR, '));
      zquery1.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPPATERNO, '));
      zquery1.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPMATERNO, '));
      zquery1.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_CONYUGE) CYNOMBRE, '));
      zquery1.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_CONYUGE) CYEDAD, '));
      zquery1.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_CONYUGE) CYSEXO, '));
      zquery1.SQL.Add(FSL3('m.DNI_CONYUGE, '));
      zquery1.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) ANIOS, '));
      zquery1.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) ACTIVIDADES, '));
      zquery1.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) HAS, '));
      zquery1.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) ETAPAS, '));
      zquery1.SQL.Add(FSL3('coalesce(m.OBSERVACIONES_1,"")||" "||coalesce(m.OBSERVACIONES_2,"") OBSERVACIONES, m.OBSERVACIONES_3 JUSTIFICACION '));
      zquery1.SQL.Add(FSL3('from MOVPADRON m '));
      zquery1.SQL.Add(FSL3('where m.IDADENDA="'+DataGlobal.VidAdenda+'" and m.SUBTIPOMOV="NUEVA FAMILIA" '));
      zquery1.SQL.Add(cond);
      zquery1.SQL.Add(FSL3('order by 1,2,3;'));
      //zquery1.SQL.SaveToFile('D:\REPORTETECNICOCAMPO_SQL1.sql');

      zquery1.open;

      // Anexo 1 Incorporacion // 1.2 Reemplazo de familia
      zquery2.Close;
      zquery2.SQL.Clear;
      zquery2.SQL.Add(FSL3('select '));
      zquery2.SQL.Add(FSL3('m.idmovpadron, '));
      zquery2.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_TITULAR) APPATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_TITULAR) APMATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_TITULAR) NOMBRE, '));
      zquery2.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_TITULAR) EDAD, '));
      zquery2.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_TITULAR) SEXO, '));
      zquery2.SQL.Add(FSL3('m.DNI_TITULAR, '));
      zquery2.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPPATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPMATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_CONYUGE) CYNOMBRE, '));
      zquery2.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_CONYUGE) CYEDAD, '));
      zquery2.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_CONYUGE) CYSEXO, '));
      zquery2.SQL.Add(FSL3('m.DNI_CONYUGE, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ANIOS, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ACTIVIDADES, '));
      zquery2.SQL.Add(FSL3('coalesce(m.OBSERVACIONES_1,"")||" "||coalesce(m.OBSERVACIONES_2,"") OBSERVACIONES, m.OBSERVACIONES_3 JUSTIFICACION, '));
      //------ DATOS SI HAY REFERENCIA
      zquery2.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_REFERENCIA) RFAPPATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_REFERENCIA) RFAPMATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_REFERENCIA) RFNOMBRE, '));
      zquery2.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_REFERENCIA) RFEDAD, '));
      zquery2.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_REFERENCIA) RFSEXO, '));
      zquery2.SQL.Add(FSL3('m.DNI_REFERENCIA, '));
      zquery2.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_refConyuge) RFCYAPPATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_refConyuge) RFCYAPMATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_refConyuge) RFCYNOMBRE, '));
      zquery2.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_refConyuge) RFCYEDAD, '));
      zquery2.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_refConyuge) RFCYSEXO, '));
      zquery2.SQL.Add(FSL3('m.DNI_refConyuge, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(m.IDMOVREFERENCIA) c) RFANIOS, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(m.IDMOVREFERENCIA) c) RFACTIVIDADES, '));
      zquery2.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) HAS, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) ETAPAS, '));
      zquery2.SQL.Add(FSL3('(SELECT t.observaciones FROM padron t where t.idpadron=m.IDMOVREFERENCIA) RFOBSERVACIONES '));
      //------- tabla
      zquery2.SQL.Add(FSL3('from MOVPADRON m '));
      zquery2.SQL.Add(FSL3('where m.IDADENDA="'+DataGlobal.VidAdenda+'" and m.SUBTIPOMOV="REEMPLAZO DE FAMILIA" '));
      zquery2.SQL.Add(cond);
      zquery2.SQL.Add(FSL3('order by 1,2,3;'));
      //zquery2.SQL.SaveToFile('D:\REPORTETECNICOCAMPO_SQL2.sql');

      zquery2.open;

      // Anexo 2. Exclusion de Participantes
      zquery3.Close;
      zquery3.SQL.Clear;
      zquery3.SQL.Add(FSL3('select '));
      zquery3.SQL.Add(FSL3('m.idmovpadron, '));
      zquery3.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_TITULAR) APPATERNO, '));
      zquery3.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_TITULAR) APMATERNO, '));
      zquery3.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_TITULAR) NOMBRE, '));
      zquery3.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_TITULAR) EDAD, '));
      zquery3.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_TITULAR) SEXO, '));
      zquery3.SQL.Add(FSL3('m.DNI_TITULAR, '));
      zquery3.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPPATERNO, '));
      zquery3.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPMATERNO, '));
      zquery3.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_CONYUGE) CYNOMBRE, '));
      zquery3.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_CONYUGE) CYEDAD, '));
      zquery3.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_CONYUGE) CYSEXO, '));
      zquery3.SQL.Add(FSL3('m.DNI_CONYUGE, '));
      zquery3.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ANIOS, '));
      zquery3.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ACTIVIDADES, '));
      zquery3.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) HAS, '));
      zquery3.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) ETAPAS, '));
      zquery3.SQL.Add(FSL3('coalesce(m.OBSERVACIONES_1,"")||" "||coalesce(m.OBSERVACIONES_2,"") OBSERVACIONES, m.OBSERVACIONES_3 JUSTIFICACION '));
      zquery3.SQL.Add(FSL3('from MOVPADRON m '));
      zquery3.SQL.Add(FSL3('where m.IDADENDA="'+DataGlobal.VidAdenda+'" and m.SUBTIPOMOV="EXCLUSION DE PARTICIPANTES" '));
      zquery3.SQL.Add(cond);
      zquery3.SQL.Add(FSL3('order by 1,2,3;'));
      //zquery3.SQL.SaveToFile('D:\REPORTETECNICOCAMPO_SQL3.sql');

      zquery3.open;

      // Anexo 3. Actualizacion de metas // 3.1 Incremento de Beneficios
      zquery4.Close;
      zquery4.SQL.Clear;
      zquery4.SQL.Add(FSL3('select '));
      zquery4.SQL.Add(FSL3('m.idmovpadron, '));
      zquery4.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_TITULAR) APPATERNO, '));
      zquery4.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_TITULAR) APMATERNO, '));
      zquery4.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_TITULAR) NOMBRE, '));
      zquery4.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_TITULAR) EDAD, '));
      zquery4.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_TITULAR) SEXO, '));
      zquery4.SQL.Add(FSL3('m.DNI_TITULAR, '));
      zquery4.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPPATERNO, '));
      zquery4.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPMATERNO, '));
      zquery4.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_CONYUGE) CYNOMBRE, '));
      zquery4.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_CONYUGE) CYEDAD, '));
      zquery4.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_CONYUGE) CYSEXO, '));
      zquery4.SQL.Add(FSL3('m.DNI_CONYUGE, '));
      zquery4.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ANIOS, '));
      zquery4.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ACTIVIDADES, '));
      zquery4.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) HAS, '));
      zquery4.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) ETAPAS, '));
      zquery4.SQL.Add(FSL3('coalesce(m.OBSERVACIONES_1,"")||" "||coalesce(m.OBSERVACIONES_2,"") OBSERVACIONES, m.OBSERVACIONES_3 JUSTIFICACION '));
      zquery4.SQL.Add(FSL3('from MOVPADRON m '));
      zquery4.SQL.Add(FSL3('where m.IDADENDA="'+DataGlobal.VidAdenda+'" and m.SUBTIPOMOV="INCREMENTO DE BENEFICIO" '));
      zquery4.SQL.Add(cond);
      zquery4.SQL.Add(FSL3('order by 1,2,3;'));
      //zquery4.SQL.SaveToFile('D:\REPORTETECNICOCAMPO_SQL4.sql');

      zquery4.open;

      // Anexo 3. Actualizacion de metas // 3.2 Reduccion de beneficio
      zquery5.Close;
      zquery5.SQL.Clear;
      zquery5.SQL.Add(FSL3('select '));
      zquery5.SQL.Add(FSL3('m.idmovpadron, '));
      zquery5.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_TITULAR) APPATERNO, '));
      zquery5.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_TITULAR) APMATERNO, '));
      zquery5.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_TITULAR) NOMBRE, '));
      zquery5.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_TITULAR) EDAD, '));
      zquery5.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_TITULAR) SEXO, '));
      zquery5.SQL.Add(FSL3('m.DNI_TITULAR, '));
      zquery5.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPPATERNO, '));
      zquery5.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPMATERNO, '));
      zquery5.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_CONYUGE) CYNOMBRE, '));
      zquery5.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_CONYUGE) CYEDAD, '));
      zquery5.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_CONYUGE) CYSEXO, '));
      zquery5.SQL.Add(FSL3('m.DNI_CONYUGE, '));
      zquery5.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ANIOS, '));
      zquery5.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ACTIVIDADES, '));
      zquery5.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) HAS, '));
      zquery5.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) ETAPAS, '));
      zquery5.SQL.Add(FSL3('coalesce(m.OBSERVACIONES_1,"")||" "||coalesce(m.OBSERVACIONES_2,"") OBSERVACIONES, m.OBSERVACIONES_3 JUSTIFICACION '));
      zquery5.SQL.Add(FSL3('from MOVPADRON m '));
      zquery5.SQL.Add(FSL3('where m.IDADENDA="'+DataGlobal.VidAdenda+'" and m.SUBTIPOMOV="REDUCCION DE BENEFICIOS" '));
      zquery5.SQL.Add(cond);
      zquery5.SQL.Add(FSL3('order by 1,2,3;'));
      //zquery5.SQL.SaveToFile('D:\REPORTETECNICOCAMPO_SQL5.sql');

      zquery5.open;

      // Anexo 4. Cambio de Titularidad
      zquery6.Close;
      zquery6.SQL.Clear;
      zquery6.SQL.Add(FSL3('select '));
      zquery6.SQL.Add(FSL3('m.idmovpadron, '));
      zquery6.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_TITULAR) APPATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_TITULAR) APMATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_TITULAR) NOMBRE, '));
      zquery6.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_TITULAR) EDAD, '));
      zquery6.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_TITULAR) SEXO, '));
      zquery6.SQL.Add(FSL3('m.DNI_TITULAR, '));
      zquery6.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPPATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPMATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_CONYUGE) CYNOMBRE, '));
      zquery6.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_CONYUGE) CYEDAD, '));
      zquery6.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_CONYUGE) CYSEXO, '));
      zquery6.SQL.Add(FSL3('m.DNI_CONYUGE, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ANIOS, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ACTIVIDADES, '));
      zquery6.SQL.Add(FSL3('coalesce(m.OBSERVACIONES_1,"")||" "||coalesce(m.OBSERVACIONES_2,"") OBSERVACIONES, m.OBSERVACIONES_3 JUSTIFICACION, '));
      //------ DATOS SI HAY REFERENCIA
      zquery6.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_REFERENCIA) RFAPPATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_REFERENCIA) RFAPMATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_REFERENCIA) RFNOMBRE, '));
      zquery6.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_REFERENCIA) RFEDAD, '));
      zquery6.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_REFERENCIA) RFSEXO, '));
      zquery6.SQL.Add(FSL3('m.DNI_REFERENCIA, '));
      zquery6.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_refConyuge) RFCYAPPATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_refConyuge) RFCYAPMATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_refConyuge) RFCYNOMBRE, '));
      zquery6.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_refConyuge) RFCYEDAD, '));
      zquery6.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_refConyuge) RFCYSEXO, '));
      zquery6.SQL.Add(FSL3('m.DNI_refConyuge, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(m.IDMOVREFERENCIA) c) RFANIOS, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(m.IDMOVREFERENCIA) c) RFACTIVIDADES, '));
      zquery6.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) HAS, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) ETAPAS, '));
      zquery6.SQL.Add(FSL3('(SELECT t.observaciones FROM padron t where t.idpadron=m.IDMOVREFERENCIA) RFOBSERVACIONES '));
      //------- tabla
      zquery6.SQL.Add(FSL3('from MOVPADRON m '));
      zquery6.SQL.Add(FSL3('where m.IDADENDA="'+DataGlobal.VidAdenda+'" and m.SUBTIPOMOV="CAMBIO DE TITULARIDAD" '));
      zquery6.SQL.Add(cond);
      zquery6.SQL.Add(FSL3('order by 1,2,3;'));
      //zquery6.SQL.SaveToFile('D:\REPORTETECNICOCAMPO_SQL6.sql');

      zquery6.open;

      // Anexo 5. Cambio de Etapa fenologica
      zquery7.Close;
      zquery7.SQL.Clear;
      zquery7.SQL.Add(FSL3('select '));
      zquery7.SQL.Add(FSL3('m.idmovpadron, '));
      zquery7.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_TITULAR) APPATERNO, '));
      zquery7.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_TITULAR) APMATERNO, '));
      zquery7.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_TITULAR) NOMBRE, '));
      zquery7.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_TITULAR) EDAD, '));
      zquery7.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_TITULAR) SEXO, '));
      zquery7.SQL.Add(FSL3('m.DNI_TITULAR, '));
      zquery7.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPPATERNO, '));
      zquery7.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_CONYUGE) CYAPMATERNO, '));
      zquery7.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_CONYUGE) CYNOMBRE, '));
      zquery7.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=m.DNI_CONYUGE) CYEDAD, '));
      zquery7.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=m.DNI_CONYUGE) CYSEXO, '));
      zquery7.SQL.Add(FSL3('m.DNI_CONYUGE, '));
      zquery7.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ANIOS, '));
      zquery7.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(m.IDMOVPADRON) c) ACTIVIDADES, '));
      zquery7.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) HAS, '));
      zquery7.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(m.IDMOVPADRON) c) ETAPAS, '));
      zquery7.SQL.Add(FSL3('coalesce(m.OBSERVACIONES_1,"")||" "||coalesce(m.OBSERVACIONES_2,"") OBSERVACIONES, m.OBSERVACIONES_3 JUSTIFICACION '));
      zquery7.SQL.Add(FSL3('from MOVPADRON m '));
      zquery7.SQL.Add(FSL3('where m.IDADENDA="'+DataGlobal.VidAdenda+'" and m.SUBTIPOMOV="CAMBIO DE ETAPA FENOLOGICA" '));
      zquery7.SQL.Add(cond);
      zquery7.SQL.Add(FSL3('order by 1,2,3;'));
      //zquery7.SQL.SaveToFile('D:\REPORTETECNICOCAMPO_SQL7.sql');

      zquery7.open;

      ReporteTecnicoCampo.PrepareReport(True);

      zqueryFotos.close;
      zqueryFotos.SQL.clear;    //           0                  1               2                 3          4
      ZqueryFotos.SQL.add(FSL3('select m.OBSERVACIONES_1,m.OBSERVACIONES_2,m.OBSERVACIONES_3,m.IMAGEN1,m.IMAGEN2, '));
      ZqueryFotos.SQL.Add(FSL3('m.DNI_TITULAR, '));  //5
      ZqueryFotos.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_TITULAR) APPATERNO, '));  //6
      ZqueryFotos.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_TITULAR) APMATERNO, '));  //7
      ZqueryFotos.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_TITULAR) NOMBRE, '));        //8
      //------ DATOS SI HAY REFERENCIA
      ZqueryFotos.SQL.Add(FSL3('m.DNI_REFERENCIA, ')); //9
      ZqueryFotos.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=m.DNI_REFERENCIA) RFAPPATERNO, ')); //10
      ZqueryFotos.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=m.DNI_REFERENCIA) RFAPMATERNO, ')); //11
      ZqueryFotos.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=m.DNI_REFERENCIA) RFNOMBRE '));      //12
      ZqueryFotos.SQL.Add(FSL3('from movpadron m '));
      ZqueryFotos.SQL.Add(FSL3('where m.idadenda="'+DataGlobal.VidAdenda+'" and m.idcaserio="'+Zcaserio.Fields[5].AsString+'"'));
      ZqueryFotos.SQL.Add(FSL3('and (select count(ma.IDMOVPADRON) from MOVPADRONACTIVIDAD ma where ma.IDMOVPADRON=m.IDMOVPADRON and ma.IDACTIVIDAD="'+cbbactividad.Text+'")>0'));
      //ZqueryFotos.SQL.SaveToFile('D:\REPORTETECNICOCAMPO_SQL8.sql');

      ZqueryFotos.open;

      if (ZqueryFotos.RecordCount>0) and (chkfotostecnico.Checked) then
        begin
          ReporteFotos :=TFrxReport.Create(frmReportes);
          ReporteFotos.onBeforePrint :=  frxReporteBeforePrintFotos;
          for i:=1 to ZqueryFotos.RecordCount do
            begin
                if i>1 then  ZqueryFotos.Next;

                ReporteFotos.LoadFromFile(workdir+'\reportes\reporteFotos.fr3');
                ReporteFotos.Variables.Clear;
                ReporteFotos.Variables['OBS1']:='''' + zqueryFotos.fields[0].AsString + '''';
                ReporteFotos.Variables['OBS2']:='''' + zqueryFotos.fields[1].AsString + '''';
                ReporteFotos.Variables['JUS']:='''' + zqueryFotos.fields[2].AsString  + '''';
                ReporteFotos.Variables['TITULAR']:='''' + zqueryFotos.fields[5].AsString+' '+zqueryFotos.fields[6].AsString+' '+zqueryFotos.fields[7].AsString+' '+zqueryFotos.fields[8].AsString + '''';
                ReporteFotos.Variables['TITULARREF']:='''' + zqueryFotos.fields[9].AsString+' '+zqueryFotos.fields[10].AsString+' '+zqueryFotos.fields[11].AsString+' '+zqueryFotos.fields[12].AsString + '''';

                nombreFoto:=workdir+'\images\'+dataGlobal.VidAdenda+'\'+zqueryFotos.fields[3].AsString;
                nombreFoto2:=workdir+'\images\'+dataGlobal.VidAdenda+'\'+zqueryFotos.fields[4].AsString;

                if (FileExists(nombreFoto) or FileExists(nombreFoto2)) or (false) then
                  begin
                    ReporteFotos.PrepareReport(true);
                    if Assigned(ReporteFotos) then
                      ReporteTecnicoCampo.PreviewPages.AddFrom(ReporteFotos);
                  end;
            end;
        end;

      ReporteTecnicoCampo.Export(frxPDFExp);

      FrmVistaPrevia.UniURLFrame1.URL:=AUrl;

      ReporteTecnicoCampo.Free;
      if Assigned(ReporteFotos) then
        ReporteFotos.Free;

      //ReporteTecnicoCampo.PrepareReport(True);
    end
   else
    begin
      showmessage('Sin caserios para hacer el reporte...');
    end;
 end
 else
 begin
    showmessage('Seleccione un caserio antes...');
 end;
end;

procedure TfrmReportes.BtnGenLoteActasClick(Sender: TObject);
var nomPDF : String;  directorio : string;
begin
  // Aca Generamos
  if Zcaserio.active then
   if Zcaserio.RecordCount>0 then
    begin
      Prompt('Ingrese el Directorio', 'C:\Adendas\PDFs', mtInformation, mbOKCancel,
      procedure (Sender: TComponent; AResult:Integer; AText: string)
      var i : integer;
       begin
        case AResult of
          mrOK :
           begin
            directorio:=AText;
            if DirectoryExists(directorio) then
             begin
              zcaserio.First;
              for i:=1 to Zcaserio.RecordCount do
                begin
                   if i>1 then zcaserio.Next;
                   dbgCaseriosActaCellClick(nil);   // click en la rejilla
                   btngeneraactaClick(nil);        // genero el PDF
                   nomPDF:='ACTA-'+Zcaserio.Fields[2].AsString+'-'+
                           Zcaserio.Fields[3].AsString+'-'+
                           Zcaserio.Fields[4].AsString+'.pdf';

                   NomPDF:=StrCom(NomPDF,'\','');
                   NomPDF:=StrCom(NomPDF,'/','');

                   nomPDF:=completardir(directorio,nomPDF);
                   if FileExists(UnPDFName) then
                     copyFile(Pchar(UnPDFName),Pchar(nomPDF),true);
                end;
               Showmessage('Lote Generado ...');
              end
             else
              Showmessage('El Directorio no existe');
           end;
        end;
       end);
    end;
end;


procedure TfrmReportes.btnGenLoteAdendaClick(Sender: TObject);
var nomPDF : String;  directorio : string;
begin
  // Aca Generamos
  if Zcaserio.active then
   if Zcaserio.RecordCount>0 then
    begin
      Prompt('Ingrese el Directorio', 'C:\Adendas\PDFs', mtInformation, mbOKCancel,
      procedure (Sender: TComponent; AResult:Integer; AText: string)
      var i : integer;
       begin
        case AResult of
          mrOK :
           begin
            directorio:=AText;
            if DirectoryExists(directorio) then
             begin
              zcaserio.First;
              for i:=1 to Zcaserio.RecordCount do
                begin
                   if i>1 then zcaserio.Next;
                   dbgCaseriosAdendaCellClick(nil);   // click en la rejilla
                   btnInformeAdendaClick(nil);        // genero el PDF
                   nomPDF:='ADENDA-'+Zcaserio.Fields[2].AsString+'-'+
                           Zcaserio.Fields[3].AsString+'-'+
                           Zcaserio.Fields[4].AsString+'.pdf';

                   NomPDF:=StrCom(NomPDF,'\','');
                   NomPDF:=StrCom(NomPDF,'/','');

                   nomPDF:=completardir(directorio,nomPDF);
                   if FileExists(UnPDFName) then
                     copyFile(Pchar(UnPDFName),Pchar(nomPDF),true);
                end;
               Showmessage('Lote Generado ...');
              end
             else
              Showmessage('El Directorio no existe');
           end;
        end;
       end);
    end;
end;

procedure TfrmReportes.btnInformeAdendaClick(Sender: TObject);
VAR error : byte;
    sc,ol,scaserio,ncaserio,sdistrito,sprovincia,sdepartamento,aurl : string;
    MiInforme : TINFORMES;
    ReporteAdendaCaserio : TfrxReport;
    act : array[1..15] of string;
    sumaact,cantact,concact : string;
    ACsumaact : REAL;
    ACcantact : INTEGER;
    NroRes : byte;
    i,nrocont: Integer;
    EtapaAnterior,Etapanueva : string;
    contFN : integer;
    tmpSTR : string;
    arrFN : array[1..4] of string;

    function extraetapa(s:string):string;
     begin                //particiapeses para
       if s='INST_CACAO'   then result:='la instalacion';
       if s='CREC_CACAO'   then result:='el crecimiento';
       if s='PROD_CACAO'   then result:='la produccion';
       if s='INST_CAFE'    then result:='la instalacion';
       if s='CREC_CAFE'    then result:='el crecimiento';
       if s='PROD_CAFE'    then result:='la produccion';
       if (s='PCAC_SANIDAD') OR (s='ACT_SCACAO')  then result:='produccion en cacao';
       if (s='PCAF_SANIDAD') OR (s='ACT_SCAFE')   then result:='produccion en cafe';
       if (s='ACT_APICOLA')  OR (s='ACT_API')     then result:='modulos apicolas';
       if (s='ACT_ACUICOLA') OR (s='ACT_ACUI')    then result:='unidades acuicolas';
       //2024
       if s='INST_PLA'   then result:='la instalacion';
       if s='CREC_PLA'   then result:='el crecimiento';
       if s='PROD_PLA'   then result:='la produccion';
       //2024-2
       if s='ACT_AVI'   then result:='galpones avicolas';
       if s='ACT_GRA'   then result:='la produccion';
     end;

    function extraeunidad(s:string):string;
     begin
       if s='INST_CACAO'   then result:='hectáreas';
       if s='CREC_CACAO'   then result:='hectáreas';
       if s='PROD_CACAO'   then result:='hectáreas';

       if s='INST_CAFE'    then result:='hectáreas';
       if s='CREC_CAFE'    then result:='hectáreas';
       if s='PROD_CAFE'    then result:='hectáreas';
       if (s='PCAC_SANIDAD') or (s='ACT_SCACAO') then result:='hectáreas';
       if (s='PCAF_SANIDAD') or (s='ACT_SCAFE')  then result:='hectáreas';
       if (s='ACT_APICOLA')  or (s='ACT_API')    then result:='modulos';
       if (s='ACT_ACUICOLA') or (s='ACT_ACUI')   then result:='unidades';

       //2024
       if s='INST_PLA'   then result:='hectáreas';
       if s='CREC_PLA'   then result:='hectáreas';
       if s='PROD_PLA'   then result:='hectáreas';

       //2024-2
       if s='ACT_AVI'    then result:='galpones';
       if s='ACT_GRA'    then result:='hectáreas';
     end;

    function extraeactividad(s:string):string;
     begin
       if s='INST_CACAO'   then result:='cacao';
       if s='CREC_CACAO'   then result:='cacao';
       if s='PROD_CACAO'   then result:='cacao';
       if s='INST_CAFE'    then result:='cafe';
       if s='CREC_CAFE'    then result:='cafe';
       if s='PROD_CAFE'    then result:='cafe';
       if s='PCAC_SANIDAD' then result:='sanidad cacao';
       if s='PCAF_SANIDAD' then result:='sanidad cafe';
       if s='ACT_APICOLA'  then result:='apicola';
       if s='ACT_ACUICOLA' then result:='acuicola';
       //2024
       if s='INST_PLA'   then result:='platano';
       if s='CREC_PLA'   then result:='platano';
       if s='PROD_PLA'   then result:='platano';
      //2024-2
       if s='ACT_AVI'    then result:='avicola';
       if s='ACT_GRA'    then result:='granadilla';
     end;

    function cambiarDenominacionID(s:string):string;
     begin
       if s='HAS INST' then result:='instalacion';
       if s='HAS CREC' then result:='crecimiento';
       if s='HAS PROD' then result:='producción';
     end;

    procedure AgregarVarReporte(nroConsulta:String; dato:integer);
     begin
       inc(nroRes);
       tmpSTR:='';
       if nroConsulta='zquery1' then
         tmpStr:='<b>2.1.</b> Inclusión al padrón general de participantes, '+StrI(dato)+' nuevos jefes de familia, identificados '+
                 'en el Anexo 1.1';

       if nroConsulta='zquery2' then
         tmpStr:='<b>2.2.</b> Inclusión al padrón general de participantes, '+StrI(dato)+' nuevos por reemplazo de  jefes de '+
                 'familia, identificados en el Anexo 1.2';

       if nroConsulta='zquery3' then
         tmpStr:='<b>2.3.</b> Exclusión del padrón general de participantes, '+StrI(dato)+' jefes de familia identificados en el '+
                 'Anexo 2';

       if nroConsulta='zquery4' then
         tmpStr:='<b>2.4.</b> Incremento de beneficio a jefes de familia del padrón general de participantes identificados en '+
                 'el Anexo 3.1';

       if nroConsulta='zquery5' then
         tmpStr:='<b>2.5.</b> Reducción de beneficio a jefes de familia del padrón general de participantes identificados en '+
                 'el Anexo 3.2';

       if nroConsulta='zquery6' then
          tmpStr:='<b>2.6.</b> Cambio de titularidad del padrón general de participantes, '+StrI(dato)+' jefes de familia cambiaron '+
                  'de cultivo y '+StrI(dato)+' jefes de familia cambiaron la titularidad de la parcela identificados en el '+
                  'Anexo 4';

       ReporteAdendacaserio.Variables['CANT'+StrI(nroRes)]:='''' + tmpStr + '''';
       //UniMemo2.Lines.Add('CANT'+StrI(nroRes));
     end;


begin
  // reporte Adenda CASERIO

  error:=0;
  if not zcaserio.Active then  error:=1;
  if edtAdendadniautoridad.Text='' then error:=2;
  if edtAdendanombreautoridad.Text='' then error:=3;
  if (length(edtAdendafecha.Text)<>10) or (length(edtAdendafechares.Text)<>10) then error:=4;
  if edtAdendacargoautoridad.text='' then error:=5;
  if edtAdendanumero.Text='' then error:=6;


  if error=0 then
    begin
    scaserio:=zcaserio.Fields[5].AsString;
    ncaserio:=zcaserio.Fields[4].AsString;
    sdistrito:=zcaserio.Fields[3].AsString;
    sprovincia:=zcaserio.Fields[2].AsString;
    sdepartamento:=zcaserio.Fields[1].AsString;

      sc:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.TIPOINFORME="ADENDACASERIO" and i.IDCASERIO="'+scaserio+'"';

      ActivaDM1ConsultaSQL('seLect i.NROINFORME '+
      'from INFORMES i where '+
      sc
      ,false);

      ol:=DM1.ConsultaSQL.Fields[0].AsString;
      DM1.ConsultaSQL.Close;

      MiInforme := TINFORMES.Create;
      Miinforme.Idadenda:=dataglobal.VidAdenda;
      Miinforme.idcaserio:=scaserio;
      MiInforme.Tipoinforme:='ADENDACASERIO';
      MiInforme.Dni1:=edtAdendadniautoridad.Text;
      Miinforme.Referencia:=edtAdendacargoautoridad.Text;
      Miinforme.Asunto:=edtAdendaresolucionautoridad.Text;
      MiInforme.Fechares:=edtAdendafechares.Text;

      MiInforme.Fecha:=edtAdendafecha.Text;
      MiInforme.Nroinforme:=edtAdendanumero.Text;
      MiInforme.Para:=edtAdendajefe.Text;
       if ol<>'' then
         begin
           MiInforme.Fechaactualizacion:=dateToStr(now);
           MiInforme.Horaactualizacion:=getTime24;
           MiInforme.actualizar2(sc,DM1.Base_Datos);
         end
       else
         MiInforme.insertar(DM1.Base_Datos);
      MiInforme.Free;

      //actualizo autoridades
      if edtubigeosAdenda.Text<>'' then
       begin
         EjecutaSQL('update autoridad a set '+
                    'a.FECHA="'+(edtAdendafechares.text)+
                    '",a.CARGO="'+edtAdendacargoautoridad.Text+
                    '",a.RESOLUCION="'+edtAdendaresolucionautoridad.Text+'" '+
                    'where a.IDCASERIO="'+edtubigeosAdenda.text+'" and a.DNI="'+edtAdendadniautoridad.Text+'"',true);
       end;

      ReporteAdendacaserio := TFrxReport.Create(frmReportes);
      ReporteAdendacaserio.OnBeforePrint :=  frxReporteBeforePrint;

      ReporteAdendacaserio.LoadFromFile(workdir+'\reportes\reporteAdendaCaserio.fr3');

      ReporteAdendacaserio.Variables.Clear;

     //UNIGUI
      ReporteAdendacaserio.EngineOptions.SilentMode := True;
      ReporteAdendacaserio.EngineOptions.EnableThreadSafe := True;
      ReporteAdendacaserio.EngineOptions.DestroyForms := False;
      ReporteAdendacaserio.EngineOptions.UseGlobalDataSetList := False;
      ReporteAdendacaserio.PrintOptions.ShowDialog := False;
      ReporteAdendacaserio.ShowProgress := False;
      ReporteAdendacaserio.PreviewOptions.AllowEdit := False;


      ReporteAdendacaserio.Variables['FECHAADENDA']:='''' + fechaLarga(edtAdendafecha.Text) + '''';
      ReporteAdendacaserio.Variables['NROADENDA']:='''' + edtAdendanumero.Text + '''';
      ReporteAdendacaserio.Variables['ADENDAJEFE']:='''' + edtAdendajefe.Text + '''';
      ReporteAdendacaserio.Variables['TIPOADENDA']:='''' + cbbTIPOADENDA.Text + '''';


      ReporteAdendacaserio.Variables['NOMBREAUTORIDAD']:='''' + edtAdendanombreautoridad.Text + '''';
      ReporteAdendacaserio.Variables['CARGOAUTORIDAD']:='''' + edtAdendacargoautoridad.Text + '''';
      ReporteAdendacaserio.Variables['DNIAUTORIDAD']:='''' + edtAdendaDNIautoridad.Text + '''';
      ReporteAdendacaserio.Variables['NRORESOLUCION']:='''' + edtAdendaresolucionautoridad.Text + '''';
      ReporteAdendacaserio.Variables['FECHARESOLUCION']:='''' + edtAdendafechares.Text + '''';

      ReporteAdendacaserio.Variables['CASERIO']:='''' + ncaserio + '''';
      ReporteAdendacaserio.Variables['DEPARTAMENTO']:='''' + sdepartamento + '''';
      ReporteAdendacaserio.Variables['PROVINCIA']:='''' + sprovincia + '''';
      ReporteAdendacaserio.Variables['DISTRITO']:='''' + sdistrito + '''';


      frxPDFExp.Background := True;
      frxPDFExp.ShowProgress := False;
      frxPDFExp.ShowDialog := False;

      frxPDFExp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl);
      frxPDFExp.DefaultPath := '';
      frxPDFExp.Author:='DEVIDA';
      frxPDFExp.Subject:='ADENDA CASERIO';

      act[1]:='INST_CACAO';
      act[2]:='CREC_CACAO';
      act[3]:='PROD_CACAO';
      act[4]:='INST_CAFE';
      act[5]:='CREC_CAFE';
      act[6]:='PROD_CAFE';
      act[7]:='ACT_SCACAO';    //'PCAC_SANIDAD';
      act[8]:='ACT_SCAFE';     //'PCAF_SANIDAD';
      act[9]:='ACT_API';       //'ACT_APICOLA';
      act[10]:='ACT_ACUI';     //'ACT_ACUICOLA';
      //2024  ERAN 13
      act[11]:='INST_PLA';
      act[12]:='CREC_PLA';
      act[13]:='PROD_PLA';
      //2024-2
      act[14]:='ACT_AVI';
      act[15]:='ACT_GRA';

      // consulta totales
      nrocont:=0;
      ACsumaact := 0;
      ACcantact := 0;

      for i:=1 to 15 do
       begin
        zquery1.Close;
        zquery1.SQL.Clear;
        zquery1.SQL.Add(FSL3('SELECT '));
        zquery1.SQL.Add(FSL3('sum(p.'+act[i]+'),count(p.'+act[i]+') '));
        zquery1.SQL.Add(FSL3('FROM vPadron p '));
        zquery1.SQL.Add(FSL3('Where p.'+act[i]+' is not null and p.'+act[i]+'>0 and '+
                             'p.Idadenda="'+dataglobal.VidAdenda+'" and p.idcaserio="'+scaserio+'" '));
        zquery1.open;

        //UniMemo2.Lines.Add(zquery1.SQL.Text);         UniMemo2.Lines.Add('-- --------------');

        sumaact:=StrR(ValR(zquery1.Fields[0].AsString));
        cantact:=StrI(ValI(zquery1.Fields[1].AsString));

        ACsumaact := ACsumaact + ValR(sumaact);
        ACcantact := ACcantact + ValI(cantact);

        concact:='> '+cantact+' familias participantes para '+extraetapa(act[i])+' con '+sumaact+
        ' '+extraeunidad(act[i])+' de la actividad '+extraeactividad(act[i])+', las mismas que se encuentran representadas'+
        ' por sus jefes de familia en el ANEXO 08A.';

        if Valr(cantact)>0 then
         begin
           inc(nrocont);
           ReporteAdendacaserio.Variables['C'+strI(nrocont)]:='''' + concact + '''';
           ReporteAdendacaserio.Variables[act[i]]:='''' + sumaact + '''';
         end
        else
         begin
           //ReporteAdendacaserio.Variables['C'+strI(i)]:='''' + '' + '''';
           ReporteAdendacaserio.Variables[act[i]]:='''' + '' + '''';
         end;

       end;

      // para cambio fenologico ----
      //Listado de Cambios                   0            1
      ActivaDM1ConSQL('SELECT distinct a.IDACTIVIDAD,a.IDETAPA '+
      'FROM HISTORIALMOVIMIENTOS a '+
      'where a.IDADENDA="'+dataGlobal.VidAdenda+'" and A.TIPOMOVIMIENTO="CAMBIO FENOLOGICO" and a.IDCASERIO="'+scaserio+'"');
      //UniMemo2.Lines.Add(DM1.ConSQL.SQL.Text);   UniMemo2.Lines.Add('-- ------');
      // 2 columnas resultado
      // IDACTIVIDAD  IDETAPA
      // CACAO	      HAS CREC
      contFN:=0;
      if (DM1.ConSQL.RecordCount>0) and (true) then
        begin
          for i := 1 to DM1.ConSQL.RecordCount do
           begin
             if i>1 then DM1.ConSQL.Next;

             ActivaDM1AuxSQl('SELECT idETAPA FROM ACTIVIDADETAPA b '+
             'where b.IDACTIVIDAD="'+DM1.ConSQL.Fields[0].AsString+'" and orden= '+
             '(SELECT (ORDEN-1) FROM ACTIVIDADETAPA a '+
             'where a.IDACTIVIDAD="'+DM1.ConSQL.Fields[0].AsString+'" and a.IDETAPA="'+DM1.ConSQL.Fields[1].AsString+'") ');
             EtapaAnterior:=cambiarDenominacionID(DM1.AuxSQL.Fields[0].AsString);
             EtapaNueva:=cambiarDenominacionID(DM1.ConSQL.Fields[1].AsString);

             ActivaDM1AuxSQl('SELECT count(dni),sum(nro_has) '+
             'FROM HISTORIALMOVIMIENTOS a '+
             'where a.IDADENDA="'+dataGlobal.VidAdenda+'" and A.TIPOMOVIMIENTO="CAMBIO FENOLOGICO" and a.IDCASERIO="'+scaserio+'" '+
             'and a.IDACTIVIDAD="'+DM1.ConSQL.Fields[0].AsString+'" and a.IDETAPA="'+DM1.ConSQL.Fields[1].AsString+'" '+
             'group by IDCASERIO ');

              concact:=DM1.AuxSQL.Fields[0].AsString+' familias participantes hicieron cambio fenologico de '+
              EtapaAnterior+' a '+EtapaNueva+' con un total de '+DM1.AuxSQL.Fields[1].AsString+' hectarea(s).';
              inc(nrocont);
              ReporteAdendacaserio.Variables['C'+strI(nrocont)]:='''' + concact + '''';


              tmpSTR:='2.7.	Cambio de etapa Fenológica de '+EtapaAnterior+' a '+EtapaNueva+
                      ' del cultivo '+DM1.ConSQL.Fields[0].AsString+' con '+DM1.AuxSQL.Fields[0].AsString+' familias con '+DM1.AuxSQL.Fields[1].AsString+' hectáreas';
              inc(contFN);
              //ReporteAdendacaserio.Variables['CFEN'+StrI(contFN)]:='''' + tmpSTR + '''';
              ArrFN[contFN]:=tmpSTR;
              //UniMemo2.Lines.Add('CFEN'+StrI(contFN)+ ' <--');

             Dm1.AuxSQL.Close;
           end;
           //UniMemo2.Lines.Add(DM1.AuxSQL.SQL.Text);   UniMemo2.Lines.Add('-- ------');
        end;
      DM1.ConSQL.Close;

      if contFN<4 then
       for i := contFN+1 to 4 do
         BEGIN
           //ReporteAdendacaserio.Variables['CFEN'+StrI(i)]:='''' + '' + '''';
           //UniMemo2.Lines.Add('CFEN'+StrI(i));
           ArrFN[contFN]:='';
         END;

      if nrocont<12 then
        for i :=nrocont+1 to 12 do
          begin
            ReporteAdendacaserio.Variables['C'+strI(i)]:='''' + '' + '''';
            //UniMemo2.Lines.Add(C1);
          end;

       // consulta de padron ya listo // EL PADRON DEBE CERRARSE
       zquery7.Close;
       zquery7.SQL.Clear;
       {zquery7.SQL.Add(FSL3('SELECT '));
       zquery7.SQL.Add(FSL3('p.APPATERNO,p.APMATERNO,p.NOMBRE,p.DNI,p.edad,p.telefono, '));
       zquery7.SQL.Add(FSL3('p.CONY_APPATERNO,p.CONY_APMATERNO,p.CONY_NOMBRE,p.CONY_DNI, '));
       zquery7.SQL.Add(FSL3('p.inst_cacao,p.crec_cacao,p.prod_cacao, '));
       zquery7.SQL.Add(FSL3('p.inst_pla,p.crec_pla,p.prod_pla, '));
       zquery7.SQL.Add(FSL3('p.inst_cafe,p.crec_cafe,p.prod_cafe, '));
       zquery7.SQL.Add(FSL3('p.pcac_sanidad,p.pcaf_sanidad,p.ACT_APICOLA,p.ACT_ACUICOLA, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "ACUI") p) HACUI, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "APIC") p) HAPIC, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "CCAC") p) HCCAC, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "CCAF") p) HCCAF, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "FARI") p) HFARI, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "IBIO") p) HIBIO, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "ICAC") p) HICAC, '));
       //2024
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "IPLA") p) HIPLA, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "CPLA") p) HCPLA, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "PPLA") p) HPPLA, '));

       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "ICAF") p) HICAF, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "MCAC") p) HMCAC, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "MCAF") p) HMCAF, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "PCAC") p) HPCAC, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "PCAF") p) HPCAF, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "SPCC") p) HSPCC, '));
       zquery7.SQL.Add(FSL3('(SELECT p.CADENA FROM CADENAHISTORIAL(p.DNI, "SPCF") p) HSPCF '));
       zquery7.SQL.Add(FSL3('FROM vPadron p '));
       zquery7.SQL.Add(FSL3('Where p.Idadenda="'+dataglobal.VidAdenda+'" and p.idcaserio="'+scaserio+'" '));
       zquery7.SQL.Add(FSL3('order by 1,2,3')); }
       zquery7.SQL.Add(FSL3('SELECT '));
       zquery7.SQL.Add(FSL3('p.CAPPATERNO, p.CAPMATERNO, p.CNOMBRE, p.CDNI, p.CEDAD, p.CTELEFONO, p.CSEXO, p.CTIPODOC,'));
       zquery7.SQL.Add(FSL3('p.CCONY_APPATERNO, p.CCONY_APMATERNO, p.CCONY_NOMBRE, p.CCONY_DNI, p.CCONY_EDAD, p.CCONY_TELEFONO, p.CCONY_SEXO, p.CCONY_TIPODOC,'));
       zquery7.SQL.Add(FSL3('p.CANIO_INCORPORACION,'));
       zquery7.SQL.Add(FSL3('p.ACULTIVOCRIANZA, p.AETAPA, p.AHECTMOD, p.AANIO_INST, p.AANIO_ADOP,'));
       zquery7.SQL.Add(FSL3('p.BCULTIVOCRIANZA, p.BETAPA, p.BHECTMOD, p.BANIO_INST, p.BANIO_ADOP,'));
       zquery7.SQL.Add(FSL3('p.CCULTIVOCRIANZA, p.CETAPA, p.CHECTMOD, p.CANIO_INST, p.CANIO_ADOP'));
       zquery7.SQL.Add(FSL3('FROM ANEXO8_IDADENDA_IDCASERIO("'+dataglobal.VidAdenda+'", '+scaserio+') p'));
       //zquery7.SQL.Add(FSL3('WHERE (select first 1 m.TIPOMOVIMIENTO from MOVPADRON m where m.IDADENDA="'+dataglobal.VidAdenda+'" and m.DNI_TITULAR=p.CDNI) in ("ACTUALIZACION DE METAS","CAMBIO DE TITULARIDAD","INCORPORACION") '));
       zquery7.SQL.Add(FSL3('order by 1,2,3'));

       zquery7.open;
       ReporteAdendacaserio.Variables['TOTAL_FAMILIAS']:='''' + StrI(zquery7.RecordCount) + '''';

       // consulta de padron ya listo // EL PADRON DEBE CERRASE
       zquery8.Close;
       zquery8.SQL.Clear;
       {zquery8.SQL.Add(FSL3('SELECT '));
       zquery8.SQL.Add(FSL3('p.APPATERNO,p.APMATERNO,p.NOMBRE,p.DNI,p.edad,p.telefono,p.sexo,case coalesce(p.DNI,"") when "" then ""else "DNI" end TIPODOC,'));
       zquery8.SQL.Add(FSL3('p.CONY_APPATERNO,p.CONY_APMATERNO,p.CONY_NOMBRE,p.CONY_DNI,p.CONY_edad,p.CONY_telefono,p.CONY_sexo,case coalesce(p.CONY_DNI,"") when "" then ""else "DNI" end CONY_TIPODOC '));
       zquery8.SQL.Add(FSL3('FROM vPadron p '));
       zquery8.SQL.Add(FSL3('Where p.Idadenda="'+dataglobal.VidAdenda+'" and p.idcaserio="'+scaserio+'" '));
       zquery8.SQL.Add(FSL3('AND (select first 1 m.TIPOMOVIMIENTO from MOVPADRON m where m.IDADENDA="'+dataglobal.VidAdenda+'" and m.DNI_TITULAR=p.DNI) in ("ACTUALIZACION DE METAS","CAMBIO DE TITULARIDAD","INCORPORACION") '));
       zquery8.SQL.Add(FSL3('order by 1,2,3'));} //2024_PLA

       zquery8.SQL.Add(FSL3('SELECT '));
       zquery8.SQL.Add(FSL3('p.CAPPATERNO, p.CAPMATERNO, p.CNOMBRE, p.CDNI, p.CEDAD, p.CTELEFONO, p.CSEXO, p.CTIPODOC,'));
       zquery8.SQL.Add(FSL3('p.CCONY_APPATERNO, p.CCONY_APMATERNO, p.CCONY_NOMBRE, p.CCONY_DNI, p.CCONY_EDAD, p.CCONY_TELEFONO, p.CCONY_SEXO, p.CCONY_TIPODOC,'));
       zquery8.SQL.Add(FSL3('p.CANIO_INCORPORACION,'));
       zquery8.SQL.Add(FSL3('p.ACULTIVOCRIANZA, p.AETAPA, p.AHECTMOD, p.AANIO_INST, p.AANIO_ADOP,'));
       zquery8.SQL.Add(FSL3('p.BCULTIVOCRIANZA, p.BETAPA, p.BHECTMOD, p.BANIO_INST, p.BANIO_ADOP,'));
       zquery8.SQL.Add(FSL3('p.CCULTIVOCRIANZA, p.CETAPA, p.CHECTMOD, p.CANIO_INST, p.CANIO_ADOP'));
       zquery8.SQL.Add(FSL3('FROM ANEXO8_IDADENDA_IDCASERIO("'+dataglobal.VidAdenda+'", '+scaserio+') p'));
       //zquery8.SQL.Add(FSL3('WHERE (select first 1 m.TIPOMOVIMIENTO from MOVPADRON m where m.IDADENDA="'+dataglobal.VidAdenda+'" and m.DNI_TITULAR=p.CDNI) in ("ACTUALIZACION DE METAS","CAMBIO DE TITULARIDAD","INCORPORACION") '));

       // 2025 CHUPIN SALEN SOLO NUEVOS Y CAMBIOS DE TITULAIDAD
       // ESTOY DEJANDO FUERA A LOS DE EXLUCIONS
       zquery8.SQL.Add(FSL3('WHERE (select first 1 m.SUBTIPOMOV     from MOVPADRON m where m.IDADENDA="'+dataglobal.VidAdenda+'" and m.DNI_TITULAR=p.CDNI and M.TIPOMOVIMIENTO<>"EXCLUSION") in ("INCREMENTO DE BENEFICIO","CAMBIO DE TITULARIDAD","NUEVA FAMILIA","REEMPLAZO DE FAMILIA")  '));

       zquery8.SQL.Add(FSL3('order by 1,2,3'));

       //unimemo2.Lines.Add(zquery8.sql.Text);

       zquery8.open;

       //unimemo2.Lines.Add('rECORDS = '+sTRi(zquery8.RecordCount));

      NroRes:=0;
       // Anexo 1 Incorporacion // 1.1 nueva familia
      zquery1.Close;
      zquery1.SQL.Clear;
      zquery1.SQL.Add(FSL3('SELECT '));
      zquery1.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery1.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery1.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
      zquery1.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery1.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
      zquery1.SQL.Add(FSL3('a.AVI, a.GRA, a.API, a.ACUI, '));
      zquery1.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
      zquery1.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery1.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery1.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="INCORPORACION" AND a.SUBTIPOMOV="NUEVA FAMILIA" '));
      zquery1.SQL.Add(FSL3('Order by 1 '));
      zquery1.open;
      if (zquery1.RecordCount<=0) and (chkAdendacuadrosblanco.Checked) then
        begin
          zquery1.Close;
          zquery1.SQL.Clear;
          zquery1.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery1.open;
          //ReporteAdendacaserio.Variables['CANT11']:='''' + StrI(0) + ''''
          AgregarVarReporte('zquery1',0);
        end
      Else
       begin
        if zquery1.RecordCount>0 then
           AgregarVarReporte('zquery1',zquery1.RecordCount);
       end;

      // Anexo 1 Incorporacion // 1.2 reemplazo familia
      zquery2.Close;
      zquery2.SQL.Clear;
      zquery2.SQL.Add(FSL3('SELECT '));
      zquery2.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery2.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery2.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
      zquery2.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
      zquery2.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery2.SQL.Add(FSL3('a.AVI, a.GRA, a.API, a.ACUI, '));
      zquery2.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3, '));
      //------ DATOS SI HAY REFERENCIA
      zquery2.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPPATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPMATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_REFERENCIA) RFNOMBRE, '));
      zquery2.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_REFERENCIA) RFEDAD, '));
      zquery2.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_REFERENCIA) RFSEXO, '));
      zquery2.SQL.Add(FSL3('a.DNI_REFERENCIA, '));
      zquery2.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPPATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPMATERNO, '));
      zquery2.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_refConyuge) RFCYNOMBRE, '));
      zquery2.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_refConyuge) RFCYEDAD, '));
      zquery2.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_refConyuge) RFCYSEXO, '));
      zquery2.SQL.Add(FSL3('a.DNI_refConyuge, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFANIOS, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFACTIVIDADES, '));
      zquery2.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) HAS, '));
      zquery2.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) ETAPAS, '));
      zquery2.SQL.Add(FSL3('(SELECT t.observaciones FROM padron t where t.idpadron=a.IDMOVREFERENCIA) RFOBSERVACIONES '));
      //------- tabla
      zquery2.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery2.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery2.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="INCORPORACION" AND a.SUBTIPOMOV="REEMPLAZO DE FAMILIA" '));
      zquery2.SQL.Add(FSL3('Order by 1 '));
      zquery2.open;

         //for i:=0 to zquery2.Fields.count-1 do unimemo2.Lines.Add(zquery2.Fields[i].FieldName);
         //unimemo2.Lines.Add(zquery2.sql.Text);


      if (zquery2.RecordCount<=0) and (chkAdendacuadrosblanco.Checked) then
        begin
          zquery2.Close;
          zquery2.SQL.Clear;
          zquery2.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery2.open;
          //ReporteAdendacaserio.Variables['CANT12']:='''' + StrI(0) + '''';
          AgregarVarReporte('zquery2',0);
        end
      Else
       begin
        if zquery2.RecordCount>0 then
           AgregarVarReporte('zquery2',zquery2.RecordCount);
       end;


      // Anexo 2 EXCLUSION // 2.1 EXCLUSION DE PARTICIPANTES
      zquery3.Close;
      zquery3.SQL.Clear;
      zquery3.SQL.Add(FSL3('SELECT '));
      zquery3.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery3.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery3.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
      //2024
      zquery3.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));

      zquery3.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery3.SQL.Add(FSL3('a.AVI, a.GRA, a.API, a.ACUI, '));
      zquery3.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
      zquery3.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery3.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery3.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="EXCLUSION" AND a.SUBTIPOMOV="EXCLUSION DE PARTICIPANTES" '));
      zquery3.SQL.Add(FSL3('Order by 1 '));
      zquery3.open;
      if (zquery3.RecordCount<=0) and (chkAdendacuadrosblanco.Checked) then
        begin
          zquery3.Close;
          zquery3.SQL.Clear;
          zquery3.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery3.open;
          //ReporteAdendacaserio.Variables['CANT21']:='''' + StrI(0) + '''';
          AgregarVarReporte('zquery3',0);
        end
      Else
       begin
        if zquery3.RecordCount>0 then
           AgregarVarReporte('zquery3',zquery3.RecordCount);
       end;

      // Anexo 3 ACTUALIZACION DE METAS // 3.1 EXCLUSION DE PARTICIPANTES
      zquery4.Close;
      zquery4.SQL.Clear;
      zquery4.SQL.Add(FSL3('SELECT '));
      zquery4.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery4.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery4.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));

      //2024
      zquery4.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));

      zquery4.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery4.SQL.Add(FSL3('a.AVI, a.GRA, a.API, a.ACUI, '));
      zquery4.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
      zquery4.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery4.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery4.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="ACTUALIZACION DE METAS" AND a.SUBTIPOMOV="INCREMENTO DE BENEFICIO" '));
      zquery4.SQL.Add(FSL3('Order by 1 '));
      zquery4.open;
      if (zquery4.RecordCount<=0) and (chkAdendacuadrosblanco.Checked) then
        begin
          zquery4.Close;
          zquery4.SQL.Clear;
          zquery4.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery4.open;
          //ReporteAdendacaserio.Variables['CANT31']:='''' + StrI(0) + '''';
          AgregarVarReporte('zquery4',0);
        end
      Else
       begin
        if zquery4.RecordCount>0 then
           AgregarVarReporte('zquery1',zquery4.RecordCount);
       end;

      // Anexo 3 ACTUALIZACION DE METAS // 3.2 REDUCCION DE BENEFICIOS
      zquery5.Close;
      zquery5.SQL.Clear;
      zquery5.SQL.Add(FSL3('SELECT '));
      zquery5.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery5.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery5.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));

      //2024
      zquery5.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));

      zquery5.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery5.SQL.Add(FSL3('a.AVI, a.GRA, a.API, a.ACUI, '));
      zquery5.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
      zquery5.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery5.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery5.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="ACTUALIZACION DE METAS" AND a.SUBTIPOMOV="REDUCCION DE BENEFICIOS" '));
      zquery5.SQL.Add(FSL3('Order by 1 '));
      zquery5.open;
      if (zquery5.RecordCount<=0) and (chkAdendacuadrosblanco.Checked) then
        begin
          zquery5.Close;
          zquery5.SQL.Clear;
          zquery5.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery5.open;
          //ReporteAdendacaserio.Variables['CANT32']:='''' + StrI(0) + '''';
          AgregarVarReporte('zquery5',0);
        end
      Else
       begin
        if zquery5.RecordCount>0 then
           AgregarVarReporte('zquery5',zquery5.RecordCount);
       end;

      // Anexo 4 CAMBIO DE TITULARIDAD // 4.1 CAMBIO DE TITULARIDAD
      zquery6.Close;
      zquery6.SQL.Clear;
      zquery6.SQL.Add(FSL3('SELECT '));
      zquery6.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
      zquery6.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
      zquery6.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
      //2024
      zquery6.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));

      zquery6.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
      zquery6.SQL.Add(FSL3('a.AVI, a.GRA, a.API, a.ACUI, '));
      zquery6.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3, '));
      //------ DATOS SI HAY REFERENCIA
      zquery6.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPPATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPMATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_REFERENCIA) RFNOMBRE, '));
      zquery6.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_REFERENCIA) RFEDAD, '));
      zquery6.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_REFERENCIA) RFSEXO, '));
      zquery6.SQL.Add(FSL3('a.DNI_REFERENCIA, '));
      zquery6.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPPATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPMATERNO, '));
      zquery6.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_refConyuge) RFCYNOMBRE, '));
      zquery6.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_refConyuge) RFCYEDAD, '));
      zquery6.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_refConyuge) RFCYSEXO, '));
      zquery6.SQL.Add(FSL3('a.DNI_refConyuge, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFANIOS, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFACTIVIDADES, '));
      zquery6.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) HAS, '));
      zquery6.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) ETAPAS, '));
      zquery6.SQL.Add(FSL3('(SELECT t.observaciones FROM padron t where t.idpadron=a.IDMOVREFERENCIA) RFOBSERVACIONES '));
      //------- tabla
      zquery6.SQL.Add(FSL3('FROM VMOVPADRON a '));
      zquery6.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
      zquery6.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="CAMBIO DE TITULARIDAD" AND a.SUBTIPOMOV="CAMBIO DE TITULARIDAD" '));
      zquery6.SQL.Add(FSL3('Order by 1 '));
      zquery6.open;
      if (zquery6.RecordCount<=0) and (chkAdendacuadrosblanco.Checked) then
        begin
          zquery6.Close;
          zquery6.SQL.Clear;
          zquery6.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery6.open;
          //ReporteAdendacaserio.Variables['CANT41']:='''' + StrI(0) + '''';
          AgregarVarReporte('zquery6',0);
        end
      Else
       begin
        if zquery6.RecordCount>0 then
           AgregarVarReporte('zquery6',zquery6.RecordCount);
       end;               //


     For i := 1 to 4 do
       BEGIN
          inc(NroRes);
          ReporteAdendacaserio.Variables['CANT'+StrI(NroRes)]:='''' + arrFN[i] + '''';
          //UniMemo2.Lines.Add('-CANT'+StrI(NroRes));
       END;

      if NroRes<10 then
       for i := NroRes+1 to 10 do
         BEGIN
           ReporteAdendacaserio.Variables['CANT'+StrI(i)]:='''' + '' + '''';
           //UniMemo2.Lines.Add('+CANT'+StrI(i));
         END;

       {
       UniMemo2.Lines.Add(zquery1.SQL.Text);         UniMemo2.Lines.Add('-- --------------');
       UniMemo2.Lines.Add(zquery2.SQL.Text);         UniMemo2.Lines.Add('-- --------------');
       UniMemo2.Lines.Add(zquery3.SQL.Text);         UniMemo2.Lines.Add('-- --------------');
       UniMemo2.Lines.Add(zquery4.SQL.Text);         UniMemo2.Lines.Add('-- --------------');
       UniMemo2.Lines.Add(zquery5.SQL.Text);         UniMemo2.Lines.Add('-- --------------');
       UniMemo2.Lines.Add(zquery6.SQL.Text);         UniMemo2.Lines.Add('-- --------------');
       }

       // ---------------- genero el reporte
       ReporteAdendacaserio.PrepareReport(True);

       if chkAdendaword.checked then
         begin
//           frxRTFExport1.Background := True;
           frxRTFExport1.ShowProgress := False;
           frxRTFExport1.ShowDialog := False;

           frxRTFExport1.FileName := UniServerModule.NewCacheFileUrl(False, 'doc', '', '', AUrl);
           frxRTFExport1.DefaultPath := '';
//           frxRTFExport1.Author:='DEVIDA';
//           frxRTFExport1.Subject:='CARTA CASERIO';

           ReporteAdendacaserio.Export(frxRTFExport1);
         end
       else
         ReporteAdendacaserio.Export(frxPDFExp);

       if Sender=btnInformeAdenda then
          FrmVistaPrevia.UniURLFrame1.URL:=AUrl;

       if chkGenLote.Checked then
          UnPDFName:=frxPDFExp.FileName;

       ReporteAdendacaserio.Free;

    end
  else
    case error of
      1: Showmessage('Busque un caserio antes');
      2: Showmessage('Falta DNI Autoridad');
      3: Showmessage('Falta Nombre de Autoridad');
      4: Showmessage('Verifique la fecha');
      5: Showmessage('Falta Cargo de Autoridad');
      6: Showmessage('Falta Nro de Adenda');
    end;
end;

procedure TfrmReportes.btnlistacaserioscartaClick(Sender: TObject);
begin
     Zcaserio.Close;
     Zcaserio.SQL.Clear;                  //   0           1             2         3          4          5
       zcaserio.SQL.Add(FormatSQL3('select c.AMBITO,c.departamento,c.provincia,c.distrito,c.CASERIO,c.idcaserio '));
       zcaserio.SQL.Add(FormatSQL3('from caserio c '));
       zcaserio.SQL.Add(FormatSQL3('where c.IDCASERIO in (select m.IDCASERIO FROM MOVPADRON m where m.IDADENDA="'+DataGlobal.vidadenda+'" ) '));
       zcaserio.SQL.Add(FormatSQL3('and c.CASERIO like "%'+edtbuscacaserio.Text+'%" '));
       zcaserio.SQL.Add(FormatSQL3('order by 5,4;'));
     zcaserio.Open;

     dbgCaseriosCarta.Columns[0].Width:=125;
     dbgCaseriosCarta.Columns[1].Width:=125;
     dbgCaseriosCarta.Columns[2].Width:=125;
     dbgCaseriosCarta.Columns[3].Width:=145;
     dbgCaseriosCarta.Columns[4].Width:=145;
     dbgCaseriosCarta.Columns[5].visible:=false;
end;

procedure TfrmReportes.UniBitBtn10Click(Sender: TObject);
VAR error,i : byte;
    sc,ol,scaserio,ncaserio,sdistrito,sprovincia,sdepartamento,aurl : string;
    MiInforme : TINFORMES;
    ReporteCartaCaserio : TfrxReport;
begin
  error:=0;
  if not zcaserio.Active then  error:=1;
  if zcaserio.RecordCount=0 then error:=2;
  if vali(edtnrocorrelativo.Text)=0 then error:=3;

  if error=0 then
    begin
    scaserio:=zcaserio.Fields[5].AsString;
    ncaserio:=zcaserio.Fields[4].AsString;
    sdistrito:=zcaserio.Fields[3].AsString;
    sprovincia:=zcaserio.Fields[2].AsString;
    sdepartamento:=zcaserio.Fields[1].AsString;

      ReporteCartaCaserio := TFrxReport.Create(frmReportes);
      ReporteCartaCaserio.OnBeforePrint :=  frxReporteBeforePrint;

      ReporteCartaCaserio.LoadFromFile(workdir+'\reportes\reportecartaacta.fr3');

      ReporteCartaCaserio.Variables.Clear;

     //UNIGUI
      ReporteCartaCaserio.EngineOptions.SilentMode := True;
      ReporteCartaCaserio.EngineOptions.EnableThreadSafe := True;
      ReporteCartaCaserio.EngineOptions.DestroyForms := False;
      ReporteCartaCaserio.EngineOptions.UseGlobalDataSetList := False;
      ReporteCartaCaserio.PrintOptions.ShowDialog := False;
      ReporteCartaCaserio.ShowProgress := False;
      ReporteCartaCaserio.PreviewOptions.AllowEdit := False;


      ReporteCartaCaserio.Variables['FECHALARGA']:='''' + fechaLarga(edtfechaACT.Text) + '''';
      ReporteCartaCaserio.Variables['NROCARTA']:='''' + edtnrocorrelativo.Text + '''';
      ReporteCartaCaserio.Variables['NOMBREAUTORIDAD']:='''' + zcaserio.Fields[7].AsString + '''';
      ReporteCartaCaserio.Variables['CARGOAUTORIDAD']:='''' + zcaserio.Fields[6].AsString + '''';

      ReporteCartaCaserio.Variables['CASERIO']:='''' + ncaserio + '''';
      ReporteCartaCaserio.Variables['DEPARTAMENTO']:='''' + sdepartamento + '''';
      ReporteCartaCaserio.Variables['PROVINCIA']:='''' + sprovincia + '''';
      ReporteCartaCaserio.Variables['DISTRITO']:='''' + sdistrito + '''';

      frxPDFExp.Background := True;
      frxPDFExp.ShowProgress := False;
      frxPDFExp.ShowDialog := False;

      frxPDFExp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl);
      frxPDFExp.DefaultPath := '';
      frxPDFExp.Author:='DEVIDA';
      frxPDFExp.Subject:='CARTA ENTREGA ACTA';

      // ---------------- genero el reporte
      ReporteCartaCaserio.PrepareReport(true);
      ReporteCartaCaserio.Export(frxPDFExp);

      FrmVistaPrevia.UniURLFrame1.URL:=AUrl;

      ReporteCartaCaserio.Free;

    end
  else
    case error of
      1: Showmessage('Busque un caserio antes');
      2: Showmessage('No hay caserio para generar cartas');
      3: Showmessage('el correlativo debe ser mayor a cero');
    end;
end;

procedure TfrmReportes.UniBitBtn1Click(Sender: TObject);
var error,indice,campos,ncorr : smallint;
    i,j : integer;
    sc,ol,AUrl,cond,dato : string;
    MiInforme : TINFORMES;
    ReporteCoordinador : TfrxReport;
    total   : array[1..4] of real;
    c1,c2,c3,c4,c5,c6 : string;
    procedure limpiarC;
     begin
       total[1]:=0;    total[2]:=0; total[3]:=0;  total[4]:=0;
     end;
begin
  //SE CAMBIO SCACAO POR AVI Y SCAFE POR GRA ;
  //EXIT;
  error:=0;
  if cbbactividadcoord.Text='' then error:=1;
  if edtdnicoord.Text='' then error:=2;
  if edtnombrecoord.Text='' then error:=3;
  if (edtfechacoord.Text='') or (length(edtfechacoord.Text)<>10) then error:=4;
  if edtnroinformecoord.text='' then error:=5;

  if error=0 then
    begin
      sc:='i.DNI1="'+edtdnicoord.Text+'" and i.ACTIVIDAD1="'+cbbactividadcoord.Text+'" and i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.TIPOINFORME="COORDINADOR"';
      ActivaDM1ConsultaSQL('select i.NROINFORME '+
      'from INFORMES i where '+
      sc
      ,false);
      ol:=DM1.ConsultaSQL.Fields[0].AsString;
      DM1.ConsultaSQL.Close;

      MiInforme := TINFORMES.Create;
      Miinforme.Idadenda:=dataglobal.VidAdenda;
      MiInforme.Nroinforme:=edtnroInformeCoord.Text;
      MiInforme.Tipoinforme:='COORDINADOR';
      MiInforme.Dni1:=edtDNICoord.Text;
      MiInforme.Actividad1:=cbbactividadCoord.Text;
      MiInforme.Fecha:=edtfechacoord.Text;
      MiInforme.Para:=edtpara.Text;
      Miinforme.Asunto:=procesalineas(edtasunto.Lines,512);
      Miinforme.Referencia:=edtreferencia.Text;
      Miinforme.Recomendaciones:=procesalineas(edtRecomendaciones.Lines,512);
       if ol<>'' then
         begin
           MiInforme.Fechaactualizacion:=dateToStr(now);
           MiInforme.Horaactualizacion:=getTime24;
           MiInforme.actualizar2(sc,DM1.Base_Datos);
         end
       else
         MiInforme.insertar(DM1.Base_Datos);
      MiInforme.Free;

      // data de informe guardado ahora a generar
      if cbbactividadcoord.Text='CACAO'   then
        Begin
          COND:=' and p.TOTAL_CACAO is not null ';
          indice:=10;
          campos:=4;
        End;
      if cbbactividadcoord.Text='CAFE'    then
        Begin
          COND:=' and p.TOTAL_CAFE is not null ';
          indice:=14;
          campos:=4;
        End;
      if cbbactividadcoord.Text='AVI' then
        Begin
          COND:=' and P.AVI is not null ';
          indice:=18;
          campos:=1;
        End;
      if cbbactividadcoord.Text='GRA'  then
        begin
          COND:=' and P.GRA is not null ';
          indice:=19;
          campos:=1;
        end;
      if cbbactividadcoord.Text='API'     then
        begin
          COND:=' and P.API is not null ';
          indice:=20;
          campos:=1;
        end;
      if cbbactividadcoord.Text='ACUI'    then
        begin
          COND:=' and P.ACUI is not null ';
          indice:=21;
          campos:=1;
        end;
      if cbbactividadcoord.Text='PLA'    then
        begin
          COND:=' and p.TOTAL_PLA is not null ';
          indice:=22;
          campos:=4;
        end;

      ReporteCoordinador := TFrxReport.Create(frmReportes);
      ReporteCoordinador.OnBeforePrint :=  frxReporteBeforePrint;

      ReporteCoordinador.LoadFromFile(workdir+'\reportes\ReporteCoordinador'+StrCom(cbbactividadcoord.Text,'.','')+'.fr3');

      ReporteCoordinador.Variables.Clear;

     //UNIGUI
      ReporteCoordinador.EngineOptions.SilentMode := True;
      ReporteCoordinador.EngineOptions.EnableThreadSafe := True;
      ReporteCoordinador.EngineOptions.DestroyForms := False;
      ReporteCoordinador.EngineOptions.UseGlobalDataSetList := False;
      ReporteCoordinador.PrintOptions.ShowDialog := False;
      ReporteCoordinador.ShowProgress := False;
      ReporteCoordinador.PreviewOptions.AllowEdit := False;


      ReporteCoordinador.Variables['ACTIVIDAD']:='''' + cbbactividadcoord.Text + '''';
      ReporteCoordinador.Variables['DNICOORDINADOR']:='''' + EDTDNIcoord.Text + '''';
      ReporteCoordinador.Variables['NOMBRECOORDINADOR']:='''' + edtNombreCoord.Text + '''';
      ReporteCoordinador.Variables['NROINFORME']:='''' + edtnroinformecoord.Text + '''';

      ReporteCoordinador.Variables['FECHA']:='''' + edtfechacoord.Text + '''';
      ReporteCoordinador.Variables['PARA']:='''' + edtpara.Text + '''';
      ReporteCoordinador.Variables['ASUNTO']:='''' + edtasunto.Text + '''';
      ReporteCoordinador.Variables['REFERENCIA']:='''' + edtreferencia.Text + '''';
      ReporteCoordinador.Variables['RECOMENDACIONES']:='''' + edtrecomendaciones.Text + '''';

      frxPDFExp.Background := True;
      frxPDFExp.ShowProgress := False;
      frxPDFExp.ShowDialog := False;

      frxPDFExp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl);
      frxPDFExp.DefaultPath := '';
      frxPDFExp.Author:='DEVIDA';
      frxPDFExp.Subject:='INFORME TECNICO DE COORDINADOR';

       // Anexo 1 Incorporacion // 1.1 nueva familia
      zquery1.Close;
      zquery1.SQL.Clear;

      if fileExists(WorkDir+'\sql\REPORTECOORDINADOR_SQL1.sql') then
        begin
          zquery1.SQL.LoadFromFile(WorkDir+'\sql\REPORTECOORDINADOR_SQL1.sql');
        end
      else
        begin
          zquery1.SQL.Add(FSL3('select '));
          zquery1.SQL.Add(FSL3('p.AMBITO, p.PROVINCIA, p.DISTRITO, p.CASERIO, '));            //  0 1 2 3
          zquery1.SQL.Add(FSL3('p.DNI_TITULAR, p.NOMBRE, p.APPATERNO, p.APMATERNO, '));       //  4 5 6 7
          zquery1.SQL.Add(FSL3('p.TIPOMOVIMIENTO, p.SUBTIPOMOV, '));                          //  8 9
          zquery1.SQL.Add(FSL3('p.TOTAL_CACAO, p.CACAO_INST, p.CACAO_CREC, p.CACAO_PROD, ')); //  10 11 12 13
          zquery1.SQL.Add(FSL3('p.TOTAL_CAFE, p.CAFE_INST, p.CAFE_CREC, p.CAFE_PROD, '));     //  14 15 16 17
          zquery1.SQL.Add(FSL3('p.AVI, p.GRA, p.API, p.ACUI, '));                             //  18 19 20 21
          zquery1.SQL.Add(FSL3('p.TOTAL_PLA, p.PLA_INST, p.PLA_CREC, p.PLA_PROD '));          //  22 23 24 25
          zquery1.SQL.Add(FSL3('FROM vmovPadron p '));
          zquery1.SQL.Add(FSL3('where p.TIPOMOVIMIENTO="INCORPORACION" AND p.SUBTIPOMOV="NUEVA FAMILIA" '));
        end;
      zquery1.SQL.Add(FSL3('and p.idadenda="'+dataglobal.VidAdenda+'" '));
      zquery1.SQL.Add(FSL3(COND));
      zquery1.SQL.Add(FSL3('Order by 1 '));
      zquery1.open;
      //unimemo2.Lines.Add(zquery1.SQL.text);
      ncorr:=0;
      if (zquery1.RecordCount<=0) and (chkcoordinadorcuadrosblancos.Checked) then
        begin
          zquery1.Close;
          zquery1.SQL.Clear;
          zquery1.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery1.open;
          ncorr:=1;
        end;
      // ------------------------------------------------------------------------
      LimpiarC;
      dato:='C1';
      with zquery1 do
       begin
        for i := 1 to RecordCount do
         begin
           if i>1 then Next;
           for j := 1 to campos do
             total[j]:=total[j]+ValR(Fields[indice+j-1].AsString);
         end;
        ReporteCoordinador.Variables[dato+'N']:='''' + StrI(RecordCount-ncorr) + '''';
       end;
      ReporteCoordinador.Variables[dato+'A']:='''' + StrR2(total[1],10,1) + '''';
      ReporteCoordinador.Variables[dato+'B']:='''' + StrR2(total[2],10,1) + '''';
      ReporteCoordinador.Variables[dato+'C']:='''' + StrR2(total[3],10,1) + '''';
      ReporteCoordinador.Variables[dato+'D']:='''' + StrR2(total[4],10,1) + '''';
      // --------------------------------------------------------------------------

      zquery2.Close;
      zquery2.SQL.Clear;
      if fileExists(WorkDir+'\sql\REPORTECOORDINADOR_SQL2.sql') then
        begin
          zquery2.SQL.LoadFromFile(WorkDir+'\sql\REPORTECOORDINADOR_SQL2.sql');
        end
      else
        begin
          zquery2.SQL.Add(FSL3('select '));
          zquery2.SQL.Add(FSL3('p.AMBITO, p.PROVINCIA, p.DISTRITO, p.CASERIO, '));
          zquery2.SQL.Add(FSL3('p.DNI_TITULAR, p.NOMBRE, p.APPATERNO, p.APMATERNO, '));
          zquery2.SQL.Add(FSL3('p.TIPOMOVIMIENTO, p.SUBTIPOMOV, '));
          zquery2.SQL.Add(FSL3('p.TOTAL_CACAO, p.CACAO_INST, p.CACAO_CREC, p.CACAO_PROD, '));
          zquery2.SQL.Add(FSL3('p.TOTAL_CAFE, p.CAFE_INST, p.CAFE_CREC, p.CAFE_PROD, '));
          zquery2.SQL.Add(FSL3('p.AVI, p.GRA, p.API, p.ACUI, '));
          zquery2.SQL.Add(FSL3('p.TOTAL_PLA, p.PLA_INST, p.PLA_CREC, p.PLA_PROD '));
          zquery2.SQL.Add(FSL3('FROM vmovPadron p '));
          zquery2.SQL.Add(FSL3('where p.TIPOMOVIMIENTO="INCORPORACION" AND p.SUBTIPOMOV="REEMPLAZO DE FAMILIA" '));
        end;
      zquery2.SQL.Add(FSL3('and p.idadenda="'+dataglobal.VidAdenda+'" '));
      zquery2.SQL.Add(FSL3(COND));
      zquery2.SQL.Add(FSL3('Order by 1 '));
      zquery2.open;
      ncorr:=0;
      if (zquery2.RecordCount<=0) and (chkcoordinadorcuadrosblancos.Checked) then
        begin
          zquery2.Close;
          zquery2.SQL.Clear;
          zquery2.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery2.open;
          ncorr:=1;
        end;
      // ------------------------------------------------------------------------
      LimpiarC;
      dato:='C2';
      with zquery2 do
       begin
        for i := 1 to RecordCount do
         begin
           if i>1 then Next;
           for j := 1 to campos do
             total[j]:=total[j]+ValR(Fields[indice+j-1].AsString);
         end;
        ReporteCoordinador.Variables[dato+'N']:='''' + StrI(RecordCount-ncorr) + '''';
       end;
      ReporteCoordinador.Variables[dato+'A']:='''' + StrR2(total[1],10,1) + '''';
      ReporteCoordinador.Variables[dato+'B']:='''' + StrR2(total[2],10,1) + '''';
      ReporteCoordinador.Variables[dato+'C']:='''' + StrR2(total[3],10,1) + '''';
      ReporteCoordinador.Variables[dato+'D']:='''' + StrR2(total[4],10,1) + '''';
      // --------------------------------------------------------------------------

      zquery3.Close;
      zquery3.SQL.Clear;
      if fileExists(WorkDir+'\sql\REPORTECOORDINADOR_SQL3.sql') then
        begin
          zquery3.SQL.LoadFromFile(WorkDir+'\sql\REPORTECOORDINADOR_SQL3.sql');
        end
      else
        begin
          zquery3.SQL.Add(FSL3('select '));
          zquery3.SQL.Add(FSL3('p.AMBITO, p.PROVINCIA, p.DISTRITO, p.CASERIO, '));
          zquery3.SQL.Add(FSL3('p.DNI_TITULAR, p.NOMBRE, p.APPATERNO, p.APMATERNO, '));
          zquery3.SQL.Add(FSL3('p.TIPOMOVIMIENTO, p.SUBTIPOMOV, '));
          zquery3.SQL.Add(FSL3('p.TOTAL_CACAO, p.CACAO_INST, p.CACAO_CREC, p.CACAO_PROD, '));
          zquery3.SQL.Add(FSL3('p.TOTAL_CAFE, p.CAFE_INST, p.CAFE_CREC, p.CAFE_PROD, '));
          zquery3.SQL.Add(FSL3('p.AVI, p.GRA, p.API, p.ACUI, '));
          zquery3.SQL.Add(FSL3('p.TOTAL_PLA, p.PLA_INST, p.PLA_CREC, p.PLA_PROD '));
          zquery3.SQL.Add(FSL3('FROM vmovPadron p '));
          zquery3.SQL.Add(FSL3('where p.TIPOMOVIMIENTO="EXCLUSION" AND p.SUBTIPOMOV="EXCLUSION DE PARTICIPANTES" '));
        end;
      zquery3.SQL.Add(FSL3('and p.idadenda="'+dataglobal.VidAdenda+'" '));
      zquery3.SQL.Add(FSL3(COND));
      zquery3.SQL.Add(FSL3('Order by 1 '));
      zquery3.open;
      ncorr:=0;
      if (zquery3.RecordCount<=0) and (chkcoordinadorcuadrosblancos.Checked)  then
        begin
          zquery3.Close;
          zquery3.SQL.Clear;
          zquery3.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery3.open;
          ncorr:=1;
        end;
      // ------------------------------------------------------------------------
      LimpiarC;
      dato:='C3';
      with zquery3 do
       begin
        for i := 1 to RecordCount do
         begin
           if i>1 then Next;
           for j := 1 to campos do
             total[j]:=total[j]+ValR(Fields[indice+j-1].AsString);
         end;
        ReporteCoordinador.Variables[dato+'N']:='''' + StrI(RecordCount-ncorr) + '''';
       end;
      ReporteCoordinador.Variables[dato+'A']:='''' + StrR2(total[1],10,1) + '''';
      ReporteCoordinador.Variables[dato+'B']:='''' + StrR2(total[2],10,1) + '''';
      ReporteCoordinador.Variables[dato+'C']:='''' + StrR2(total[3],10,1) + '''';
      ReporteCoordinador.Variables[dato+'D']:='''' + StrR2(total[4],10,1) + '''';
      // --------------------------------------------------------------------------

      zquery4.Close;
      zquery4.SQL.Clear;
      zquery4.SQL.Add(FSL3('select '));
      if fileExists(WorkDir+'\sql\REPORTECOORDINADOR_SQL4.sql') then
        begin
          zquery4.SQL.LoadFromFile(WorkDir+'\sql\REPORTECOORDINADOR_SQL4.sql');
        end
      else
        begin
          zquery4.SQL.Add(FSL3('p.AMBITO, p.PROVINCIA, p.DISTRITO, p.CASERIO, '));
          zquery4.SQL.Add(FSL3('p.DNI_TITULAR, p.NOMBRE, p.APPATERNO, p.APMATERNO, '));
          zquery4.SQL.Add(FSL3('p.TIPOMOVIMIENTO, p.SUBTIPOMOV, '));
          zquery4.SQL.Add(FSL3('p.TOTAL_CACAO, p.CACAO_INST, p.CACAO_CREC, p.CACAO_PROD, '));
          zquery4.SQL.Add(FSL3('p.TOTAL_CAFE, p.CAFE_INST, p.CAFE_CREC, p.CAFE_PROD, '));
          zquery4.SQL.Add(FSL3('p.AVI, p.GRA, p.API, p.ACUI, '));
          zquery4.SQL.Add(FSL3('p.TOTAL_PLA, p.PLA_INST, p.PLA_CREC, p.PLA_PROD '));
          zquery4.SQL.Add(FSL3('FROM vmovPadron p '));
          zquery4.SQL.Add(FSL3('where p.TIPOMOVIMIENTO="ACTUALIZACION DE METAS" AND p.SUBTIPOMOV="INCREMENTO DE BENEFICIO" '));
        end;
      zquery4.SQL.Add(FSL3('and p.idadenda="'+dataglobal.VidAdenda+'" '));
      zquery4.SQL.Add(FSL3(COND));
      zquery4.SQL.Add(FSL3('Order by 1 '));
      zquery4.open;
      ncorr:=0;
      if (zquery4.RecordCount<=0) and (chkcoordinadorcuadrosblancos.Checked) then
        begin
          zquery4.Close;
          zquery4.SQL.Clear;
          zquery4.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery4.open;
          ncorr:=1;
        end;
      // ------------------------------------------------------------------------
      LimpiarC;
      dato:='C4';
      with zquery4 do
       begin
        for i := 1 to RecordCount do
         begin
           if i>1 then Next;
           for j := 1 to campos do
             total[j]:=total[j]+ValR(Fields[indice+j-1].AsString);
         end;
        ReporteCoordinador.Variables[dato+'N']:='''' + StrI(RecordCount-ncorr) + '''';
       end;
      ReporteCoordinador.Variables[dato+'A']:='''' + StrR2(total[1],10,1) + '''';
      ReporteCoordinador.Variables[dato+'B']:='''' + StrR2(total[2],10,1) + '''';
      ReporteCoordinador.Variables[dato+'C']:='''' + StrR2(total[3],10,1) + '''';
      ReporteCoordinador.Variables[dato+'D']:='''' + StrR2(total[4],10,1) + '''';
      // --------------------------------------------------------------------------

      zquery5.Close;
      zquery5.SQL.Clear;
      if fileExists(WorkDir+'\sql\REPORTECOORDINADOR_SQL5.sql') then
        begin
          zquery5.SQL.LoadFromFile(WorkDir+'\sql\REPORTECOORDINADOR_SQL5.sql');
        end
      else
        begin
          zquery5.SQL.Add(FSL3('select '));
          zquery5.SQL.Add(FSL3('p.AMBITO, p.PROVINCIA, p.DISTRITO, p.CASERIO, '));
          zquery5.SQL.Add(FSL3('p.DNI_TITULAR, p.NOMBRE, p.APPATERNO, p.APMATERNO, '));
          zquery5.SQL.Add(FSL3('p.TIPOMOVIMIENTO, p.SUBTIPOMOV, '));
          zquery5.SQL.Add(FSL3('p.TOTAL_CACAO, p.CACAO_INST, p.CACAO_CREC, p.CACAO_PROD, '));
          zquery5.SQL.Add(FSL3('p.TOTAL_CAFE, p.CAFE_INST, p.CAFE_CREC, p.CAFE_PROD, '));
          zquery5.SQL.Add(FSL3('p.AVI, p.GRA, p.API, p.ACUI, '));
          zquery5.SQL.Add(FSL3('p.TOTAL_PLA, p.PLA_INST, p.PLA_CREC, p.PLA_PROD '));
          zquery5.SQL.Add(FSL3('FROM vmovPadron p '));
          zquery5.SQL.Add(FSL3('where p.TIPOMOVIMIENTO="ACTUALIZACION DE METAS" AND p.SUBTIPOMOV="REDUCCION DE BENEFICIOS" '));
        end;
      zquery5.SQL.Add(FSL3('and p.idadenda="'+dataglobal.VidAdenda+'" '));
      zquery5.SQL.Add(FSL3(COND));
      zquery5.SQL.Add(FSL3('Order by 1 '));
      zquery5.open;
      ncorr:=0;
      if (zquery5.RecordCount<=0) and (chkcoordinadorcuadrosblancos.Checked) then
        begin
          zquery5.Close;
          zquery5.SQL.Clear;
          zquery5.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery5.open;
          ncorr:=1;
        end;
      // ------------------------------------------------------------------------
      LimpiarC;
      dato:='C5';
      with zquery5 do
       begin
        for i := 1 to RecordCount do
         begin
           if i>1 then Next;
           for j := 1 to campos do
             total[j]:=total[j]+ValR(Fields[indice+j-1].AsString);
         end;
        ReporteCoordinador.Variables[dato+'N']:='''' + StrI(RecordCount-ncorr) + '''';
       end;
      ReporteCoordinador.Variables[dato+'A']:='''' + StrR2(total[1],10,1) + '''';
      ReporteCoordinador.Variables[dato+'B']:='''' + StrR2(total[2],10,1) + '''';
      ReporteCoordinador.Variables[dato+'C']:='''' + StrR2(total[3],10,1) + '''';
      ReporteCoordinador.Variables[dato+'D']:='''' + StrR2(total[4],10,1) + '''';
      // --------------------------------------------------------------------------

      zquery6.Close;
      zquery6.SQL.Clear;
      if fileExists(WorkDir+'\sql\REPORTECOORDINADOR_SQL6.sql') then
        begin
          zquery6.SQL.LoadFromFile(WorkDir+'\sql\REPORTECOORDINADOR_SQL6.sql');
        end
      else
        begin
          zquery6.SQL.Add(FSL3('select '));
          zquery6.SQL.Add(FSL3('p.AMBITO, p.PROVINCIA, p.DISTRITO, p.CASERIO, '));
          zquery6.SQL.Add(FSL3('p.DNI_TITULAR, p.NOMBRE, p.APPATERNO, p.APMATERNO, '));
          zquery6.SQL.Add(FSL3('p.TIPOMOVIMIENTO, p.SUBTIPOMOV, '));
          zquery6.SQL.Add(FSL3('p.TOTAL_CACAO, p.CACAO_INST, p.CACAO_CREC, p.CACAO_PROD, '));
          zquery6.SQL.Add(FSL3('p.TOTAL_CAFE, p.CAFE_INST, p.CAFE_CREC, p.CAFE_PROD, '));
          zquery6.SQL.Add(FSL3('p.AVI, p.GRA, p.API, p.ACUI, '));
          zquery6.SQL.Add(FSL3('p.TOTAL_PLA, p.PLA_INST, p.PLA_CREC, p.PLA_PROD '));
          zquery6.SQL.Add(FSL3('FROM vmovPadron p '));
          zquery6.SQL.Add(FSL3('where p.TIPOMOVIMIENTO="CAMBIO DE TITULARIDAD" AND p.SUBTIPOMOV="CAMBIO DE TITULARIDAD" '));
        end;
      zquery6.SQL.Add(FSL3('and p.idadenda="'+dataglobal.VidAdenda+'" '));
      zquery6.SQL.Add(FSL3(COND));
      zquery6.SQL.Add(FSL3('Order by 1 '));
      zquery6.open;
      ncorr:=0;
      if (zquery6.RecordCount<=0) and (chkcoordinadorcuadrosblancos.Checked) then
        begin
          zquery6.Close;
          zquery6.SQL.Clear;
          zquery6.SQL.Add(FSL3('select * from vmovPadronvoid'));
          zquery6.open;
          ncorr:=1;
        end;
      // ------------------------------------------------------------------------
      LimpiarC;
      dato:='C6';
      with zquery6 do
       begin
        for i := 1 to RecordCount do
         begin
           if i>1 then Next;
           for j := 1 to campos do
             total[j]:=total[j]+ValR(Fields[indice+j-1].AsString);
         end;
        ReporteCoordinador.Variables[dato+'N']:='''' + StrI(RecordCount-ncorr) + '''';
       end;
      ReporteCoordinador.Variables[dato+'A']:='''' + StrR2(total[1],10,1) + '''';
      ReporteCoordinador.Variables[dato+'B']:='''' + StrR2(total[2],10,1) + '''';
      ReporteCoordinador.Variables[dato+'C']:='''' + StrR2(total[3],10,1) + '''';
      ReporteCoordinador.Variables[dato+'D']:='''' + StrR2(total[4],10,1) + '''';
      // --------------------------------------------------------------------------

      ReporteCoordinador.PrepareReport(True);
      ReporteCoordinador.Export(frxPDFExp);

      FrmVistaPrevia.UniURLFrame1.URL:=AUrl;

      ReporteCoordinador.Free;

    end
  else
    case error of
      1: Showmessage('Seleccione actividad');
      2: Showmessage('Falta DNI Coordinador');
      3: Showmessage('Falta Nombre de Coordinador');
      4: Showmessage('Verifique la fecha');
      5: Showmessage('Falta Nro de Informe');
    end;
end;

procedure TfrmReportes.UniBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmReportes.UniBitBtn4Click(Sender: TObject);
begin
     Zcaserio.Close;
     Zcaserio.SQL.Clear;                  //   0           1             2         3          4          5
       zcaserio.SQL.Add(FormatSQL3('select c.AMBITO,c.departamento,c.provincia,c.distrito,c.CASERIO,c.idcaserio, '));

       zcaserio.SQL.Add(FormatSQL3('(select first 1 a.CARGO from autoridad a where a.IDCASERIO=c.idcaserio and a.ESTADO=1), '));
       zcaserio.SQL.Add(FormatSQL3('(select p.nombre||" "||p.appaterno||" "||p.apmaterno from persona p where p.DNI=(select first 1 a.dni from autoridad a where a.IDCASERIO=c.idcaserio and a.ESTADO=1)) '));

       zcaserio.SQL.Add(FormatSQL3('from caserio c '));
       zcaserio.SQL.Add(FormatSQL3('where c.IDCASERIO in (select m.IDCASERIO FROM MOVPADRON m where m.IDADENDA="'+DataGlobal.vidadenda+'") '));
       if edtbuscacarta.Text<>'' then
          zcaserio.SQL.Add(FormatSQL3('and c.CASERIO like "%'+edtbuscacarta.Text+'%" '));
       zcaserio.SQL.Add(FormatSQL3('order by 5,4;'));
     zcaserio.Open;

     lblcantidad.Caption:='('+StrI(zcaserio.RecordCount)+') registros';

     dbgCartas.Columns[0].Width:=125;
     dbgCartas.Columns[1].Width:=125;
     dbgCartas.Columns[2].Width:=125;
     dbgCartas.Columns[3].Width:=145;
     dbgCartas.Columns[4].Width:=145;
     dbgCartas.Columns[5].visible:=false;
end;

procedure TfrmReportes.UniBitBtn9Click(Sender: TObject);
VAR error,i,c : INTEGER;
    sc,ol,scaserio,ncaserio,sdistrito,sprovincia,sdepartamento,aurl : string;
    MiInforme : TINFORMES;
    ReporteCartaCaserio : TfrxReport;
begin
  error:=0;
  if not zcaserio.Active then  error:=1;
  if zcaserio.RecordCount=0 then error:=2;
  if vali(edtnrocorrelativo.Text)=0 then error:=3;
  lblerrorcarta.caption:='-';

  if error=0 then
    begin

      ReporteCartaCaserio := TFrxReport.Create(frmReportes);
      ReporteCartaCaserio.OnBeforePrint :=  frxReporteBeforePrint;

      ReporteCartaCaserio.LoadFromFile(workdir+'\reportes\reportecartaacta.fr3');
      zcaserio.First;
      c:=vali(edtnrocorrelativo.Text)-1;

      lblerrorcarta.caption:=StrI(zcaserio.RecordCount)+' registros';

      for i:=1 to zcaserio.RecordCount do
        begin
          inc(c);
          if i>1 then zcaserio.Next;

          scaserio:=zcaserio.Fields[5].AsString;
          ncaserio:=zcaserio.Fields[4].AsString;
          sdistrito:=zcaserio.Fields[3].AsString;
          sprovincia:=zcaserio.Fields[2].AsString;
          sdepartamento:=zcaserio.Fields[1].AsString;

          ReporteCartaCaserio.Variables.Clear;

         //UNIGUI
          ReporteCartaCaserio.EngineOptions.SilentMode := True;
          ReporteCartaCaserio.EngineOptions.EnableThreadSafe := True;
          ReporteCartaCaserio.EngineOptions.DestroyForms := False;
          ReporteCartaCaserio.EngineOptions.UseGlobalDataSetList := False;
          ReporteCartaCaserio.PrintOptions.ShowDialog := False;
          ReporteCartaCaserio.ShowProgress := False;
          ReporteCartaCaserio.PreviewOptions.AllowEdit := False;


          ReporteCartaCaserio.Variables['FECHALARGA']:='''' + fechaLarga(edtfechaACT.Text) + '''';
          ReporteCartaCaserio.Variables['NROCARTA']:='''' + Completar3(StrI(c)) + '''';
          ReporteCartaCaserio.Variables['NOMBREAUTORIDAD']:='''' + zcaserio.Fields[7].AsString + '''';
          ReporteCartaCaserio.Variables['CARGOAUTORIDAD']:='''' + zcaserio.Fields[6].AsString + '''';

          ReporteCartaCaserio.Variables['CASERIO']:='''' + ncaserio + '''';
          ReporteCartaCaserio.Variables['DEPARTAMENTO']:='''' + sdepartamento + '''';
          ReporteCartaCaserio.Variables['PROVINCIA']:='''' + sprovincia + '''';
          ReporteCartaCaserio.Variables['DISTRITO']:='''' + sdistrito + '''';

          frxPDFExp.Background := True;
          frxPDFExp.ShowProgress := False;
          frxPDFExp.ShowDialog := False;

          frxPDFExp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl);
          frxPDFExp.DefaultPath := '';
          frxPDFExp.Author:='DEVIDA';
          frxPDFExp.Subject:='CARTA ENTREGA ACTA';

          // ---------------- genero el reporte
          if i=1 then ReporteCartaCaserio.PrepareReport(true)
          else ReporteCartaCaserio.PrepareReport(false);

          lblerrorcarta.caption:= lblerrorcarta.caption+'.';
        end;

      ReporteCartaCaserio.Export(frxPDFExp);
      FrmVistaPrevia.UniURLFrame1.URL:=AUrl;
      ReporteCartaCaserio.Free;

    end
  else
    case error of
      1: Showmessage('Busque un caserio antes');
      2: Showmessage('No hay caserio para generar cartas');
      3: Showmessage('el correlativo debe ser mayor a cero');
    end;
end;

procedure TfrmReportes.UniButton1Click(Sender: TObject);
VAR error,i : integer;
    sc,ol,scaserio,ncaserio,sdistrito,sprovincia,sdepartamento,aurl : string;
    MiInforme : TINFORMES;
    ReporteCartaCaserio : TfrxReport;
    j : integer;
begin
 lblerror.Caption:='-';
 if Zcaserio.Active then
  begin
   //pnlprocesando.Visible:=true;
   Zcaserio.First;
   for j :=1 to Zcaserio.RecordCount do
   begin
    if j>1 then Zcaserio.Next;
    dbgCaseriosCartaCellClick(nil);  //Hago Click

    error:=0;
    if not zcaserio.Active then  error:=1;
    if cbbdniautoridad.Text='' then error:=2;
    if cbbnombreautoridad.Text='' then error:=3;
    if (edtfechacarta.Text='') or (length(edtfechacarta.Text)<>10) then error:=4;
    if cbbcargoautoridad.text='' then error:=5;
    if edtnrocarta.Text='' then error:=6;

    if error=0 then
     begin
        scaserio:=zcaserio.Fields[5].AsString;
        ncaserio:=zcaserio.Fields[4].AsString;
        sdistrito:=zcaserio.Fields[3].AsString;
        sprovincia:=zcaserio.Fields[2].AsString;
        sdepartamento:=zcaserio.Fields[1].AsString;
          sc:='i.IDADENDA="'+dataGlobal.VidAdenda+'" and i.TIPOINFORME="CARTACASERIO" and i.IDCASERIO="'+scaserio+'"';
          ActivaDM1ConsultaSQL('select i.NROINFORME '+
          'from INFORMES i where '+
          sc
          ,false);
          ol:=DM1.ConsultaSQL.Fields[0].AsString;
          DM1.ConsultaSQL.Close;

          MiInforme := TINFORMES.Create;
          Miinforme.Idadenda:=dataglobal.VidAdenda;
          Miinforme.idcaserio:=scaserio;
          MiInforme.Tipoinforme:='CARTACASERIO';
          MiInforme.Nroinforme:=edtnrocarta.Text;
          MiInforme.Fecha:=edtfechacarta.Text;
          MiInforme.Dni1:=cbbdniautoridad.Text;
          Miinforme.Referencia:=cbbcargoautoridad.Text;
          MiInforme.Para:=edtjefecarta.Text;
          Miinforme.Asunto:=procesalineas(edtasuntocarta.Lines,512);
           if ol<>'' then
             begin
               MiInforme.Fechaactualizacion:=dateToStr(now);
               MiInforme.Horaactualizacion:=getTime24;
               MiInforme.actualizar2(sc,DM1.Base_Datos);
             end
           else
             MiInforme.insertar(DM1.Base_Datos);
          MiInforme.Free;

          if J=1 then
           begin
            ReporteCartaCaserio := TFrxReport.Create(frmReportes);
            ReporteCartaCaserio.OnBeforePrint :=  frxReporteBeforePrint;

            ReporteCartaCaserio.LoadFromFile(workdir+'\reportes\reportecartacaserio.fr3');
           end;

          ReporteCartaCaserio.Variables.Clear;

         //UNIGUI
          ReporteCartaCaserio.EngineOptions.SilentMode := True;
          ReporteCartaCaserio.EngineOptions.EnableThreadSafe := True;
          ReporteCartaCaserio.EngineOptions.DestroyForms := False;
          ReporteCartaCaserio.EngineOptions.UseGlobalDataSetList := False;
          ReporteCartaCaserio.PrintOptions.ShowDialog := False;
          ReporteCartaCaserio.ShowProgress := False;
          ReporteCartaCaserio.PreviewOptions.AllowEdit := False;


          ReporteCartaCaserio.Variables['FECHA']:='''' + fechaLarga(edtfechacarta.Text) + '''';
          ReporteCartaCaserio.Variables['NROCARTA']:='''' + edtnrocarta.Text + '''';
          ReporteCartaCaserio.Variables['NOMBREAUTORIDAD']:='''' + cbbnombreautoridad.Text + '''';
          ReporteCartaCaserio.Variables['CARGOAUTORIDAD']:='''' + cbbcargoautoridad.Text + '''';

          ReporteCartaCaserio.Variables['CASERIO']:='''' + ncaserio + '''';
          ReporteCartaCaserio.Variables['DEPARTAMENTO']:='''' + sdepartamento + '''';
          ReporteCartaCaserio.Variables['PROVINCIA']:='''' + sprovincia + '''';
          ReporteCartaCaserio.Variables['DISTRITO']:='''' + sdistrito + '''';

          ReporteCartaCaserio.Variables['PARA']:='''' + edtjefecarta.Text + '''';
          ReporteCartaCaserio.Variables['ASUNTO']:='''' + procesalineas(edtasuntocarta.Lines,512) + '''';

          frxPDFExp.Background := True;
          frxPDFExp.ShowProgress := False;
          frxPDFExp.ShowDialog := False;

          frxPDFExp.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl);
          frxPDFExp.DefaultPath := '';
          frxPDFExp.Author:='DEVIDA';
          frxPDFExp.Subject:='CARTA CASERIO';

           // Anexo 1 Incorporacion // 1.1 nueva familia
          zquery1.Close;
          zquery1.SQL.Clear;
          {zquery1.SQL.Add(FSL3('SELECT '));
          zquery1.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
          zquery1.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
          zquery1.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
          zquery1.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));

          zquery1.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));

          zquery1.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
          zquery1.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
          zquery1.SQL.Add(FSL3('FROM VMOVPADRON a '));

          zquery1.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
          zquery1.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="INCORPORACION" AND a.SUBTIPOMOV="NUEVA FAMILIA" '));
          zquery1.SQL.Add(FSL3('Order by 1 '));
          zquery1.sql.SaveToFile('D:\CARTA_CASERIO_SQL1.sql'); }

          zquery1.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL1.sql');
          ZBindParam(zquery1,':IDADENDA',dataglobal.VidAdenda);
          ZBindParam(zquery1,':IDCASERIO',scaserio);

          zquery1.open;
          if (zquery1.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
            begin
              zquery1.Close;
              zquery1.SQL.Clear;
              zquery1.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery1.open;
            end;

          //Anexo 2
          zquery2.Close;
          zquery2.SQL.Clear;
          {zquery2.SQL.Add(FSL3('SELECT '));
          zquery2.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
          zquery2.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
          zquery2.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
          zquery2.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
          zquery2.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
          zquery2.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
          zquery2.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3, '));
          //------ DATOS SI HAY REFERENCIA
          zquery2.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPPATERNO, '));
          zquery2.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPMATERNO, '));
          zquery2.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_REFERENCIA) RFNOMBRE, '));
          zquery2.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_REFERENCIA) RFEDAD, '));
          zquery2.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_REFERENCIA) RFSEXO, '));
          zquery2.SQL.Add(FSL3('a.DNI_REFERENCIA, '));
          zquery2.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPPATERNO, '));
          zquery2.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPMATERNO, '));
          zquery2.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_refConyuge) RFCYNOMBRE, '));
          zquery2.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_refConyuge) RFCYEDAD, '));
          zquery2.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_refConyuge) RFCYSEXO, '));
          zquery2.SQL.Add(FSL3('a.DNI_refConyuge, '));
          zquery2.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFANIOS, '));
          zquery2.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFACTIVIDADES, '));
          zquery2.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) HAS, '));
          zquery2.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) ETAPAS, '));
          zquery2.SQL.Add(FSL3('(SELECT t.observaciones FROM padron t where t.idpadron=a.IDMOVREFERENCIA) RFOBSERVACIONES '));
          //------- tabla
          zquery2.SQL.Add(FSL3('FROM VMOVPADRON a '));
          zquery2.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
          zquery2.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="INCORPORACION" AND a.SUBTIPOMOV="REEMPLAZO DE FAMILIA" '));
          zquery2.SQL.Add(FSL3('Order by 1 '));
          zquery2.sql.SaveToFile('D:\CARTA_CASERIO_SQL2.sql');}

          zquery2.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL2.sql');
          ZBindParam(zquery2,':IDADENDA',dataglobal.VidAdenda);
          ZBindParam(zquery2,':IDCASERIO',scaserio);

          zquery2.open;
          //for i:=0 to zquery2.Fields.count-1 do unimemo2.Lines.Add(zquery2.Fields[i].FieldName);
          if (zquery2.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
            begin
              zquery2.Close;
              zquery2.SQL.Clear;
              zquery2.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery2.open;
            end;

          //anexo 3
          zquery3.Close;
          zquery3.SQL.Clear;
          {zquery3.SQL.Add(FSL3('SELECT '));
          zquery3.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
          zquery3.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
          zquery3.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
          zquery3.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
          zquery3.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
          zquery3.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
          zquery3.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
          zquery3.SQL.Add(FSL3('FROM VMOVPADRON a '));
          zquery3.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
          zquery3.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="EXCLUSION" AND a.SUBTIPOMOV="EXCLUSION DE PARTICIPANTES" '));
          zquery3.SQL.Add(FSL3('Order by 1 '));
          zquery3.sql.SaveToFile('D:\CARTA_CASERIO_SQL3.sql');}

          zquery3.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL3.sql');
          ZBindParam(zquery3,':IDADENDA',dataglobal.VidAdenda);
          ZBindParam(zquery3,':IDCASERIO',scaserio);

          zquery3.open;
          if (zquery3.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
            begin
              zquery3.Close;
              zquery3.SQL.Clear;
              zquery3.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery3.open;
            end;

          //anexo 4
          zquery4.Close;
          zquery4.SQL.Clear;
          {zquery4.SQL.Add(FSL3('SELECT '));
          zquery4.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
          zquery4.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
          zquery4.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
          zquery4.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
          zquery4.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
          zquery4.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
          zquery4.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
          zquery4.SQL.Add(FSL3('FROM VMOVPADRON a '));
          zquery4.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
          zquery4.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="ACTUALIZACION DE METAS" AND a.SUBTIPOMOV="INCREMENTO DE BENEFICIO" '));
          zquery4.SQL.Add(FSL3('Order by 1 '));
          zquery4.sql.SaveToFile('D:\CARTA_CASERIO_SQL4.sql');}

          zquery4.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL4.sql');
          ZBindParam(zquery4,':IDADENDA',dataglobal.VidAdenda);
          ZBindParam(zquery4,':IDCASERIO',scaserio);

          zquery4.open;
          if (zquery4.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
            begin
              zquery4.Close;
              zquery4.SQL.Clear;
              zquery4.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery4.open;
            end;

          //anexo 5
          zquery5.Close;
          zquery5.SQL.Clear;
          {zquery5.SQL.Add(FSL3('SELECT '));
          zquery5.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
          zquery5.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
          zquery5.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
          zquery5.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
          zquery5.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
          zquery5.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
          zquery5.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3 '));
          zquery5.SQL.Add(FSL3('FROM VMOVPADRON a '));
          zquery5.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
          zquery5.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="ACTUALIZACION DE METAS" AND a.SUBTIPOMOV="REDUCCION DE BENEFICIOS" '));
          zquery5.SQL.Add(FSL3('Order by 1 '));
          zquery5.sql.SaveToFile('D:\CARTA_CASERIO_SQL5.sql'); }

          zquery5.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL5.sql');
          ZBindParam(zquery5,':IDADENDA',dataglobal.VidAdenda);
          ZBindParam(zquery5,':IDCASERIO',scaserio);

          zquery5.open;
          if (zquery5.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
            begin
              zquery5.Close;
              zquery5.SQL.Clear;
              zquery5.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery5.open;
            end;

          //anexo 6
          zquery6.Close;
          zquery6.SQL.Clear;
          {zquery6.SQL.Add(FSL3('SELECT '));
          zquery6.SQL.Add(FSL3('a.DNI_TITULAR, a.NOMBRE, a.APPATERNO, a.APMATERNO, '));
          zquery6.SQL.Add(FSL3('a.DNI_CONYUGE, a.NOMBRE_CONYUGE, a.APPATERNO_CONYUGE, a.APMATERNO_CONYUGE, '));
          zquery6.SQL.Add(FSL3('a.TOTAL_CACAO, a.CACAO_INST, a.CACAO_CREC, a.CACAO_PROD, '));
          zquery6.SQL.Add(FSL3('a.TOTAL_CAFE, a.CAFE_INST, a.CAFE_CREC, a.CAFE_PROD, '));
          zquery6.SQL.Add(FSL3('a.TOTAL_PLA, a.PLA_INST, a.PLA_CREC, a.PLA_PROD, '));
          zquery6.SQL.Add(FSL3('a.SCACAO, a.SCAFE, a.API, a.ACUI, '));
          zquery6.SQL.Add(FSL3('a.OBSERVACIONES_1,a.OBSERVACIONES_2,a.OBSERVACIONES_3, '));
          //------ DATOS SI HAY REFERENCIA
          zquery6.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPPATERNO, '));
          zquery6.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_REFERENCIA) RFAPMATERNO, '));
          zquery6.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_REFERENCIA) RFNOMBRE, '));
          zquery6.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_REFERENCIA) RFEDAD, '));
          zquery6.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_REFERENCIA) RFSEXO, '));
          zquery6.SQL.Add(FSL3('a.DNI_REFERENCIA, '));
          zquery6.SQL.Add(FSL3('(select p.appaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPPATERNO, '));
          zquery6.SQL.Add(FSL3('(select p.apmaterno from persona p where p.DNI=a.DNI_refConyuge) RFCYAPMATERNO, '));
          zquery6.SQL.Add(FSL3('(select p.NOMBRE from persona p where p.DNI=a.DNI_refConyuge) RFCYNOMBRE, '));
          zquery6.SQL.Add(FSL3('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.DNI_refConyuge) RFCYEDAD, '));
          zquery6.SQL.Add(FSL3('(select p.SEXO from persona p where p.DNI=a.DNI_refConyuge) RFCYSEXO, '));
          zquery6.SQL.Add(FSL3('a.DNI_refConyuge, '));
          zquery6.SQL.Add(FSL3('(SELECT c.ANIOS FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFANIOS, '));
          zquery6.SQL.Add(FSL3('(SELECT c.ACTIVIDADES FROM CADENAACTIVIDAD(a.IDMOVREFERENCIA) c) RFACTIVIDADES, '));
          zquery6.SQL.Add(FSL3('(SELECT c.HAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) HAS, '));
          zquery6.SQL.Add(FSL3('(SELECT c.ETAPAS FROM CADENAACTIVIDADv2(a.IDMOVPADRON) c) ETAPAS, '));
          zquery6.SQL.Add(FSL3('(SELECT t.observaciones FROM padron t where t.idpadron=a.IDMOVREFERENCIA) RFOBSERVACIONES '));
          //------- tabla
          zquery6.SQL.Add(FSL3('FROM VMOVPADRON a '));
          zquery6.SQL.Add(FSL3('WHERE a.IDADENDA="'+dataglobal.VidAdenda+'" AND a.IDCASERIO="'+scaserio+'" '));
          zquery6.SQL.Add(FSL3('AND a.TIPOMOVIMIENTO="CAMBIO DE TITULARIDAD" AND a.SUBTIPOMOV="CAMBIO DE TITULARIDAD" '));
          zquery6.SQL.Add(FSL3('Order by 1 '));
          zquery6.sql.SaveToFile('D:\CARTA_CASERIO_SQL6.sql'); }

          zquery6.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL6.sql');
          ZBindParam(zquery6,':IDADENDA',dataglobal.VidAdenda);
          ZBindParam(zquery6,':IDCASERIO',scaserio);

          zquery6.open;
          if (zquery6.RecordCount<=0) and (chkcartacuadrosblancos.Checked) then
            begin
              zquery6.Close;
              zquery6.SQL.Clear;
              zquery6.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery6.open;
            end;

          // ---------------- genero el reporte
          if J=1 then ReporteCartaCaserio.PrepareReport(True)
          Else ReporteCartaCaserio.PrepareReport(False);

          if J=Zcaserio.RecordCount then
           begin
            ReporteCartaCaserio.Export(frxPDFExp);
            FrmVistaPrevia.UniURLFrame1.URL:=AUrl;
            ReporteCartaCaserio.Free;
            //pnlprocesando.Visible:=false;
           end;
      end
    else
      begin
        {case error of
          1: Showmessage('Busque un caserio antes');
          2: Showmessage('Falta DNI Autoridad');
          3: Showmessage('Falta Nombre de Autoridad');
          4: Showmessage('Verifique la fecha');
          5: Showmessage('Falta Cargo de Autoridad');
          6: Showmessage('Falta Nro de Carta');
        end;}
        lblError.Caption:=lblError.Caption+'R='+StrI(J)+',e='+strI(error)+'; ';
      end;
   end
  end
 else
   Showmessage('No hay datos disponibles...');
end;


procedure TfrmReportes.chkGenPDFsActaChange(Sender: TObject);
begin
  BtnGenLoteActas.Visible:=chkGenPDFsActa.Checked;
end;

procedure TfrmReportes.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
 zcaserio.Close;
 zquery1.Close;
 zquery2.Close;
 zquery3.Close;
 zquery4.Close;
 zquery5.Close;
 zquery6.Close;
 zquery7.Close;
 zquery8.Close;
 zqueryFotos.Close;

  tmrProcesamiento.Enabled := False;

  if Assigned(FThread) then
  begin
    FThread.Terminate;
    // Opcional: esperar a que termine antes de liberar
    FThread.WaitFor;
    FThread.Free;
    FThread := nil;
  end;

end;

procedure TfrmReportes.UniFormCreate(Sender: TObject);
begin
  condAct:='';
  FThread := nil;
  tmrProcesamiento.Enabled := False;   // el timer solo se usa mientras el hilo corre
end;

procedure TfrmReportes.UniFormShow(Sender: TObject);
begin
   //edtDni_tecnico.Text:=lblDniUsuario.caption;
   if lbltipoUsuario.caption='ADMIN' then
     edtDni_tecnico.Enabled:=true
   else
     edtDni_tecnico.Enabled:=false;
end;

procedure TfrmReportes.UniPageControl1Change(Sender: TObject);
var i : integer;
begin
  zcaserio.Close;
  case UniPageControl1.TabIndex of
    0 : begin
          zcaserio.close;
          dbgCaseriosTecnico.DataSource:=DsCaserio;
          dbgCaseriosCarta.DataSource:=nil;
          dbgCaseriosActa.datasource:=nil;
          dbgcartas.DataSource:=nil;
          dbgCaseriosAdenda.DataSource:=nil;
        end;
    1 : begin
           ActivaDM1ConsultaSQL('select distinct o.IDACTIVIDAD from MOVPADRONACTIVIDAD o where o.IDMOVPADRON in '+
           '(select m.idmovpadron from movpadron m where m.IDADENDA="'+DataGlobal.vidadenda+'")',false);
           cbbactividadcoord.items.clear;
           for i:=1 to DM1.ConsultaSQL.RecordCount do
             begin
               if i>1 then DM1.ConsultaSQL.Next;
               cbbactividadcoord.Items.Add(Dm1.ConsultaSQL.Fields[0].Asstring);
             end;
           DM1.ConsultaSQL.Close;
           edtDniCoord.Text:='';
           edtnombrecoord.Text:='';
           edtnroinformecoord.Text:='';
           edtfechacoord.Text:='';
           zcaserio.close;
        end;
    2 : begin
          zcaserio.close;
          dbgCaseriosTecnico.DataSource:=nil;
          dbgCaseriosCarta.DataSource:=DsCaserio;
          dbgCaseriosActa.datasource:=nil;
          dbgcartas.DataSource:=nil;
          dbgCaseriosAdenda.DataSource:=nil;
          //btnlistacaserioscartaClick(nil);
        end;
    3:  begin
          zcaserio.close;
          dbgCaseriosTecnico.DataSource:=nil;
          dbgCaseriosCarta.DataSource:=nil;
          dbgCaseriosActa.datasource:=DsCaserio;
          dbgcartas.DataSource:=nil;
          dbgCaseriosAdenda.DataSource:=nil;
        end;
    4:  begin  // CARTA ENTREGA
          zcaserio.close;
          edtfechaact.Text:=dateTostr(now);
          dbgCaseriosTecnico.DataSource:=nil;
          dbgCaseriosCarta.DataSource:=nil;
          dbgCaseriosActa.datasource:=nil;
          dbgcartas.DataSource:=DsCaserio;
          dbgCaseriosAdenda.DataSource:=nil;
        end;
    5:  begin
          zcaserio.close;
          dbgCaseriosTecnico.DataSource:=nil;
          dbgCaseriosCarta.DataSource:=nil;
          dbgCaseriosActa.datasource:=nil;
          dbgcartas.DataSource:=nil;
          dbgCaseriosAdenda.DataSource:=DsCaserio;
        end;
  end;
end;


{ V  TCalculationThread  V -------------------------------------------- V}
constructor TCalculationThread.Create(SQLCaserio : String; ChkImpCarta, ChkCuadrosBlancos: Boolean; phostname,pdatabase, pPDFurl,pPDFfile,pidAdenda: string);
begin
  inherited Create(True);     // creado suspendido
  FreeOnTerminate := False;   // <<< IMPORTANTE: lo libera el form
  FProgress := 0;
  FFinished := False;
  FErrores := '';
  FSQLCaserio := SQLCaserio;
  FChkImpCarta := ChkImpCarta;
  FChkCuadrosBlancos := ChkCuadrosBlancos;
  FHostName:=PHostname;
  FDatabase:=PDatabase;
  FPdfUrl := pPDFUrl;
  FPDFfile := pPDFfile;
  FidAdenda := pidAdenda;
end;


procedure TCalculationThread.Execute;    // exxxxxxxxxxxxxxxx
Var  cbbdniautoridadVRT : String;
     cbbcargoautoridadVRT : String;
     cbbnombreautoridadVRT : String;
     edtnrocartaVRT,edtfechacartaVRT,edtasuntocartaVRT,edtjefecartaVRT, Aurl : string;
     MiInforme : TINFORMES;
     ReporteCartaCaserio : TfrxReport;
     j : integer;

     zcaserioVRT : TZquery;
     Conn   : TZConnection;
     ZQuery1,ZQuery2,ZQuery3,ZQuery4,ZQuery5,ZQuery6,ConsultaSQL: TZQuery;
     frxPDFExp : TFrxPDFExport;

     frxDBDatos1,frxDBDatos2,frxDBDatos3,frxDBDatos4,frxDBDatos5,frxDBDatos6 : TfrxDBDataset;
     MD1, MD2, MD3, MD4, MD5, MD6: TfrxMasterData;

     Xcap : TStringList;

     procedure ConsultaSQLOpen(s : string);
      begin
        // ConsultaSQL ya fue creado
        ConsultaSQL.Close;
        ConsultaSQL.SQL.Clear;
        ConsultaSQL.SQL.ADD(FormatSQL3(S));
        ConsultaSQL.open;
      end;

     //---------------------------------------------------------------------------------------------------------------------
      procedure dbgCaseriosCartaCellClickVirtual;
       Var
           CondActVRT : string;

        procedure cargarAutoridadDefaultVRT;
        var i : integer;
         begin
            ConsultaSQL.Close;
            ConsultaSQL.SQL.Clear;
            //edtnrocarta.Text:='';                       //0       1           2               3  adxmarca
              ConsultaSQL.SQL.ADD(FormatSQL3('SELECT a.DNI, a.IDCASERIO, a.CARGO, '));
              ConsultaSQL.SQL.ADD(FormatSQL3('(select p.NOMBRE||" "||p.APPATERNO||" "||p.APMATERNO from persona p where p.DNI=a.DNI) NOMBRE '));
              ConsultaSQL.SQL.ADD(FormatSQL3('FROM AUTORIDAD a '));
              ConsultaSQL.SQL.ADD(FormatSQL3('where a.ESTADO=1 and a.IDCASERIO="'+zcaserioVRT.Fields[5].AsString+'" '));
              ConsultaSQL.SQL.ADD(FormatSQL3('ORDER BY 3 '));
            ConsultaSQL.Open;

            if not ConsultaSQL.IsEmpty then
             begin
              cbbdniautoridadVRT:=ConsultaSQL.Fields[0].AsString;
              cbbcargoautoridadVRT:=ConsultaSQL.Fields[2].AsString;
              cbbnombreautoridadVRT:=ConsultaSQL.Fields[3].AsString;
             end
            else
             begin
              cbbdniautoridadVRT:='';
              cbbcargoautoridadVRT:='';
              cbbnombreautoridadVRT:='';
             end;

            ConsultaSQL.Close;
         end;

      begin
        if zcaserioVRT.Active then
         begin
            edtnrocartaVRT:='XYZ'; // BuscaInforme('CARTACASERIO');   // FUNCION POR IMPLEMENTAR
            // no hay datos es un informe nuevo
            cbbdniautoridadVRT:='';
            cbbcargoautoridadVRT:='';
            cbbnombreautoridadVRT:='';

            if edtnrocartaVRT='' then
              begin
                edtnrocartaVRT:='123XYZ'; //CalculaNroInforme('CASERIO '+zcaserioVRT.Fields[4].AsString,copy(dataGlobal.VidAdenda,length(dataGlobal.VidAdenda)-3,4),'');

                edtfechacartaVRT:=dateToStr(now);

                cargarAutoridadDefaultVRT;

                edtasuntocartaVRT:='Necesidad de sucripción de adenda al acta de entendimiento en el '+
                'anexo/centro poblado/comunidad nativa/ de '+zcaserioVRT.Fields[4].AsString+' del distrito de '+
                zcaserioVRT.Fields[3].AsString+' de la provincia de '+zcaserioVRT.Fields[2].AsString;
                edtjefecartaVRT:='JORDAN BERTONI HERRERA ARANDA';

              end
            else
              begin
                //hay datos hay que levantar
                CondActVRT:='i.IDADENDA="'+FidAdenda+'" and i.IDCASERIO="'+ZcaserioVRT.Fields[5].AsString+'" and i.TIPOINFORME="CARTACASERIO" ';
                                            //  0       1       2      3        4
                ConsultaSQLOpen('select i.fecha,i.para,i.asunto,i.dni1,i.referencia '+
                'from INFORMES i where '+
                CondActVRT);

                if not ConsultaSQL.IsEmpty then
                 begin
                  edtasuntocartaVRT:=ConsultaSQL.Fields[2].AsString;
                  edtjefecartaVRT:=ConsultaSQL.Fields[1].AsString;
                  edtfechacartaVRT:=ConsultaSQL.Fields[0].AsString;
                  cbbdniautoridadVRT:=ConsultaSQL.Fields[3].AsString;
                  cbbcargoautoridadVRT:=ConsultaSQL.Fields[4].AsString;
                 END
                ELSE
                 BEGIN
                  edtasuntocartaVRT:='';
                  edtjefecartaVRT:='';
                  edtfechacartaVRT:='';
                  cbbdniautoridadVRT:='';
                  cbbcargoautoridadVRT:='';
                 end;
                ConsultaSQL.Close;

                cbbnombreautoridadVRT:='XYZ Autoridad'; //recuperaNombre(cbbdniautoridadVRT,' ');

                if FChkImpCarta then
                 cargarAutoridadDefaultVRT;

              end;
         end;
      end;



    //---------------------------------------------------------------------------------------------------------------------
    procedure btnGeneraCartaClickVRT(limpiarReporte:boolean);
    VAR error : byte;
        sc,ol,scaserio,ncaserio,sdistrito,sprovincia,sdepartamento : string;
    begin
      // debe de estar en un reg

      dbgCaseriosCartaCellClickVirtual;
      error:=0;
      if not zcaserioVRT.Active then  error:=1;
      if cbbdniautoridadVRT='' then error:=2;
      if cbbnombreautoridadVRT='' then error:=3;
      if (edtfechacartaVRT='') or (length(edtfechacartaVRT)<>10) then error:=4;
      if cbbcargoautoridadVRT='' then error:=5;
      if edtnrocartaVRT='' then error:=6;
      scaserio:=zcaserioVRT.Fields[5].AsString;
      ncaserio:=zcaserioVRT.Fields[4].AsString;

      if error=0 then
        begin
        sdistrito:=zcaserioVRT.Fields[3].AsString;
        sprovincia:=zcaserioVRT.Fields[2].AsString;
        sdepartamento:=zcaserioVRT.Fields[1].AsString;
          sc:='i.IDADENDA="'+FidAdenda+'" and i.TIPOINFORME="CARTACASERIO" and i.IDCASERIO="'+scaserio+'"';
          ConsultaSQLOpen('select i.NROINFORME '+
          'from INFORMES i where '+
          sc);
          if not ConsultaSQL.IsEmpty then
            ol := ConsultaSQL.Fields[0].AsString
          else
            ol := '';
          ConsultaSQL.Close;

        MiInforme := TINFORMES.Create;
          try
            Miinforme.Idadenda:=FidAdenda;
            Miinforme.idcaserio:=scaserio;
            MiInforme.Tipoinforme:='CARTACASERIO';
            MiInforme.Nroinforme:=edtnrocartaVRT;
            MiInforme.Fecha:=edtfechacartaVRT;
            MiInforme.Dni1:=cbbdniautoridadVRT;
            Miinforme.Referencia:=cbbcargoautoridadVRT;
            MiInforme.Para:=edtjefecartaVRT;
            Miinforme.Asunto:=edtasuntocartaVRT; //procesalineas(,512);
             if ol<>'' then
               begin
                 MiInforme.Fechaactualizacion:=dateToStr(now);
                 MiInforme.Horaactualizacion:=getTime24;
                 MiInforme.actualizar2(sc,Conn);
               end
             else
               MiInforme.insertar(Conn);
          finally
            MiInforme.Free;
          end;

          //ReporteCartaCaserio.LoadFromFile(workdir+'\reportes\reportecartacaserio.fr3');
          ReporteCartaCaserio.Variables.Clear;


         //UNIGUI
          ReporteCartaCaserio.EngineOptions.SilentMode := True;
          ReporteCartaCaserio.EngineOptions.EnableThreadSafe := True;
          ReporteCartaCaserio.EngineOptions.DestroyForms := False;
          ReporteCartaCaserio.EngineOptions.UseGlobalDataSetList := False;
          ReporteCartaCaserio.PrintOptions.ShowDialog := False;
          ReporteCartaCaserio.ShowProgress := False;
          ReporteCartaCaserio.PreviewOptions.AllowEdit := False;


          ReporteCartaCaserio.Variables['FECHA']:='''' + fechaLarga(edtfechacartaVRT) + '''';
          ReporteCartaCaserio.Variables['NROCARTA']:='''' + edtnrocartaVRT + '''';
          ReporteCartaCaserio.Variables['NOMBREAUTORIDAD']:='''' + cbbnombreautoridadVRT + '''';
          ReporteCartaCaserio.Variables['CARGOAUTORIDAD']:='''' + cbbcargoautoridadVRT + '''';

          ReporteCartaCaserio.Variables['CASERIO']:='''' + ncaserio + '''';
          ReporteCartaCaserio.Variables['DEPARTAMENTO']:='''' + sdepartamento + '''';
          ReporteCartaCaserio.Variables['PROVINCIA']:='''' + sprovincia + '''';
          ReporteCartaCaserio.Variables['DISTRITO']:='''' + sdistrito + '''';

          ReporteCartaCaserio.Variables['PARA']:='''' + edtjefecartaVRT+ '''';
          ReporteCartaCaserio.Variables['ASUNTO']:='''' + edtasuntocartaVRT + '''';

           // Anexo 1 Incorporacion // 1.1 nueva familia
          zquery1.Close;
          zquery1.SQL.Clear;
          zquery1.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL1.sql');
          ZBindParam(zquery1,':IDADENDA',FidAdenda);
          ZBindParam(zquery1,':IDCASERIO',scaserio);

          zquery1.open;   Ferrores:=Ferrores+' ZQUERY1 RC= '+sTRi(zquery1.RecordCount)+' '+CHR(13);
          if (zquery1.RecordCount<=0) and (FChkCuadrosBlancos) then
            begin
              zquery1.Close;
              zquery1.SQL.Clear;
              zquery1.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery1.open;
            end;

          //Anexo 2
          zquery2.Close;
          zquery2.SQL.Clear;
          zquery2.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL2.sql');
          ZBindParam(zquery2,':IDADENDA',FidAdenda);
          ZBindParam(zquery2,':IDCASERIO',scaserio);

          zquery2.open;      Ferrores:=Ferrores+' ZQUERY2 RC= '+sTRi(zquery2.RecordCount)+' '+CHR(13);
          //for i:=0 to zquery2.Fields.count-1 do unimemo2.Lines.Add(zquery2.Fields[i].FieldName);
          if (zquery2.RecordCount<=0) and (FChkCuadrosBlancos) then
            begin
              zquery2.Close;
              zquery2.SQL.Clear;
              zquery2.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery2.open;
            end;

          //anexo 3
          zquery3.Close;
          zquery3.SQL.Clear;
          zquery3.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL3.sql');
          ZBindParam(zquery3,':IDADENDA',FidAdenda);
          ZBindParam(zquery3,':IDCASERIO',scaserio);

          zquery3.open;     Ferrores:=Ferrores+' ZQUERY3 RC= '+sTRi(zquery3.RecordCount)+' '+CHR(13);
          if (zquery3.RecordCount<=0) and (FChkCuadrosBlancos) then
            begin
              zquery3.Close;
              zquery3.SQL.Clear;
              zquery3.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery3.open;
            end;

          //anexo 4
          zquery4.Close;
          zquery4.SQL.Clear;
          zquery4.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL4.sql');
          ZBindParam(zquery4,':IDADENDA',FidAdenda);
          ZBindParam(zquery4,':IDCASERIO',scaserio);

          zquery4.open;   Ferrores:=Ferrores+' ZQUERY4 RC= '+sTRi(zquery4.RecordCount)+' '+CHR(13);
          if (zquery4.RecordCount<=0) and (FChkCuadrosBlancos) then
            begin
              zquery4.Close;
              zquery4.SQL.Clear;
              zquery4.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery4.open;
            end;

          //anexo 5
          zquery5.Close;
          zquery5.SQL.Clear;
          zquery5.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL5.sql');
          ZBindParam(zquery5,':IDADENDA',FidAdenda);
          ZBindParam(zquery5,':IDCASERIO',scaserio);

          zquery5.open;    Ferrores:=Ferrores+' ZQUERY5 RC= '+sTRi(zquery5.RecordCount)+' '+CHR(13);
          if (zquery5.RecordCount<=0) and (FChkCuadrosBlancos) then
            begin
              zquery5.Close;
              zquery5.SQL.Clear;
              zquery5.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery5.open;
            end;

          //anexo 6
          zquery6.Close;
          zquery6.SQL.Clear;
          zquery6.SQL.LoadFromFile(workdir+'\sql\CARTA_CASERIO_SQL6.sql');
          ZBindParam(zquery6,':IDADENDA',FidAdenda);
          ZBindParam(zquery6,':IDCASERIO',scaserio);

          zquery6.open;    Ferrores:=Ferrores+' ZQUERY6 RC= '+sTRi(zquery6.RecordCount)+' '+CHR(13);
          if (zquery6.RecordCount<=0) and (FChkCuadrosBlancos) then
            begin
              zquery6.Close;
              zquery6.SQL.Clear;
              zquery6.SQL.Add(FSL3('select * from vmovPadronvoid'));
              zquery6.open;
            end;

          // ---------------- genero el reporte
          ReporteCartaCaserio.PrepareReport(LimpiarReporte);


FErrores := FErrores +
  Format('Caserio=%s  Q1=%d  Q2=%d  Q3=%d  Q4=%d  Q5=%d  Q6=%d',[
    scaserio,
    ZQuery1.RecordCount,
    ZQuery2.RecordCount,
    ZQuery3.RecordCount,
    ZQuery4.RecordCount,
    ZQuery5.RecordCount,
    ZQuery6.RecordCount ]) + Chr(13);


        end
      else
        BEGIN
         FErrores:=FErrores+StrI(zcaseriovrt.RecNo)+'.  Caserio='+ncaserio+' '+scaserio;
         case error of
          1: Ferrores:=Ferrores+' error=Busque un caserio antes'+chr(13);
          2: Ferrores:=Ferrores+' error=Falta DNI Autoridad'+chr(13);
          3: Ferrores:=Ferrores+' error=Falta Nombre de Autoridad'+chr(13);
          4: Ferrores:=Ferrores+' error=Verifique la fecha'+chr(13);
          5: Ferrores:=Ferrores+' error=Falta Cargo de Autoridad'+chr(13);
          6: Ferrores:=Ferrores+' error=Falta Nro de Carta'+chr(13);
         end;
        end;

    end;

begin
   try
     Conn := TZConnection.Create(nil);
     try

       Conn.Protocol := 'firebird-2.5';
       Conn.HostName := FhostName;
       Conn.Port     := 3050;
       Conn.Database := Fdatabase;
       Conn.User     := 'sysdba';
       Conn.Password := 'baex1623';
       Conn.AutoCommit := True;
       Conn.TransactIsolationLevel := tiReadCommitted;
       Conn.ClientCodepage := 'WIN1252';

       Conn.Connect;

       zcaserioVRT := TZquery.Create(nil);
       Zquery1 := TZquery.Create(nil);
       Zquery2 := TZquery.Create(nil);
       Zquery3 := TZquery.Create(nil);
       Zquery4 := TZquery.Create(nil);
       Zquery5 := TZquery.Create(nil);
       Zquery6 := TZquery.Create(nil);
       ConsultaSQL :=TZquery.Create(nil);

       zcaserioVRT.Connection := conn;
       Zquery1.Connection := conn;
       Zquery2.Connection := conn;
       Zquery3.Connection := conn;
       Zquery4.Connection := conn;
       Zquery5.Connection := conn;
       Zquery6.Connection := conn;
       ConsultaSQL.Connection := conn;

       ZcaserioVRT.Close;
       ZcaserioVRT.sql.Clear;
       ZcaserioVRT.sql.Add( FSQLcaserio );
       ZcaserioVRT.Open;

// 1) Crear los TfrxDBDataset del hilo y registrarlos en el reporte
frxDBDatos1 := TfrxDBDataset.Create(nil);
frxDBDatos1.DataSet  := ZQuery1;
frxDBDatos1.UserName := 'frxDBDatos1';
ReporteCartaCaserio.DataSets.Add(frxDBDatos1);

frxDBDatos2 := TfrxDBDataset.Create(nil);
frxDBDatos2.DataSet  := ZQuery2;
frxDBDatos2.UserName := 'frxDBDatos2';
ReporteCartaCaserio.DataSets.Add(frxDBDatos2);

frxDBDatos3 := TfrxDBDataset.Create(nil);
frxDBDatos3.DataSet  := ZQuery3;
frxDBDatos3.UserName := 'frxDBDatos3';
ReporteCartaCaserio.DataSets.Add(frxDBDatos3);

frxDBDatos4 := TfrxDBDataset.Create(nil);
frxDBDatos4.DataSet  := ZQuery4;
frxDBDatos4.UserName := 'frxDBDatos4';
ReporteCartaCaserio.DataSets.Add(frxDBDatos4);

frxDBDatos5 := TfrxDBDataset.Create(nil);
frxDBDatos5.DataSet  := ZQuery5;
frxDBDatos5.UserName := 'frxDBDatos5';
ReporteCartaCaserio.DataSets.Add(frxDBDatos5);

frxDBDatos6 := TfrxDBDataset.Create(nil);
frxDBDatos6.DataSet  := ZQuery6;
frxDBDatos6.UserName := 'frxDBDatos6';
ReporteCartaCaserio.DataSets.Add(frxDBDatos6);


       ReporteCartaCaserio := TFrxReport.Create(nil);


        // IMPORTANTÍSIMO: que NO use la lista global de datasets
        ReporteCartaCaserio.EngineOptions.UseGlobalDataSetList := False;
        ReporteCartaCaserio.EngineOptions.EnableThreadSafe     := True;
        ReporteCartaCaserio.EngineOptions.SilentMode           := True;
        ReporteCartaCaserio.EngineOptions.DestroyForms         := False;

       ReporteCartaCaserio.PrintOptions.ShowDialog := False;
       ReporteCartaCaserio.ShowProgress := False;
       ReporteCartaCaserio.PreviewOptions.AllowEdit := False;

       if Not fileExists(workdir+'\reportes\reportecartacaserio.fr3') then
         Ferrores:=Ferrores+' NO SE ENCUENTRA EL REPORTE '+workdir+'\reportes\reportecartacaserio.fr3'+' '+CHR(13)
       ELSE
         Ferrores:=Ferrores+'Arhivo FR3 cargado ok'+chr(13);

       ReporteCartaCaserio.LoadFromFile(workdir+'\reportes\reportecartacaserio.fr3');

// 2) Opcional: logear qué datasets ve FastReport
Ferrores := Ferrores + 'DataSets en reporte: ' + IntToStr(ReporteCartaCaserio.DataSets.Count) + Chr(13);


       frxPDFExp := TFrxPDFExport.Create(nil);

       frxPDFExp.Background := True;
       frxPDFExp.ShowProgress := False;
       frxPDFExp.ShowDialog := False;

       frxPDFExp.FileName :=FPDFfile ;//UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', AUrl);
       frxPDFExp.DefaultPath := '';
       frxPDFExp.Author:='DEVIDA';
       frxPDFExp.Subject:='CARTA CASERIO';

       try
         //zcaseriovrt.First;
         for J := 1 to zcaseriovrt.RecordCount do
           BEGIN
             if Terminated then break;

             if j>1 then zcaseriovrt.Next;

             IF J=1 THEN btnGeneraCartaClickVRT(TRUE)
             ELSE btnGeneraCartaClickVRT(FALSE);
             //Sleep(200);  // PARA TEST

             FProgress := Trunc(J / zcaseriovrt.RecordCount * 100);
           END;

         if (not terminated) then
          BEGIN
            ReporteCartaCaserio.Export(frxPDFExp);
            // FPDFfile = ruta física (ya asignada)
            // FPDFurl  = URL (ya viene desde el formulario en el constructor)
          END;

       finally
         ReporteCartaCaserio.Free;
         frxPDFExp.Free;

  frxDBDatos1.Free;
  frxDBDatos2.Free;
  frxDBDatos3.Free;
  frxDBDatos4.Free;
  frxDBDatos5.Free;
  frxDBDatos6.Free;

         ZcaserioVRT.Free;
         Zquery1.Free;
         Zquery2.Free;
         Zquery3.Free;
         Zquery4.Free;
         Zquery5.Free;
         Zquery6.Free;
         ConsultaSQL.Free;

       end;
     conn.Disconnect;
     finally
      conn.Free;
     end;
   Finally
    FFinished := True;
   end;
end;
{ A  TCalculationThread  A --------------------------------------------- A }



procedure TfrmReportes.tmrProcesamientoTimer(Sender: TObject);
var
  LThread : TCalculationThread;
  LProgress: Integer;
  LUrl: string;
begin
  // Copia local por seguridad (aunque solo el timer toca FThread)
  LThread := FThread;

  if not Assigned(LThread) then
  begin
    tmrProcesamiento.Enabled := False;
    Exit;
  end;

  // Leer progreso
  LProgress := LThread.Progress;
  pbProcesamiento.Position := LProgress;
  lblProcesamiento.Caption := Format('%d %% completado', [LProgress]);

  if LThread.Finished then
  begin
    tmrProcesamiento.Enabled := False;
    pbProcesamiento.Position := 100;
    lblProcesamiento.Caption := '100 % completado';

    // Guardamos la URL antes de liberar el hilo
    LUrl := LThread.FPDFurl;

    // El hilo ya terminó (Finished = True), ahora SÍ lo liberamos aquí
    mmoLogPDF.lines.add('Proceso finalizado : '+timetoSTR(now));
    mmoLogPDF.Lines.Add('');

    mmoLogPDF.Lines.Add('PDF file: ' + FThread.FPDFfile);
    if FileExists(FThread.FPDFfile) then
      mmoLogPDF.Lines.Add('El PDF fue generado correctamente.')
    else
      mmoLogPDF.Lines.Add('ATENCIÓN: el archivo PDF NO existe en disco.');

    if FThread.FErrores<>'' then
      BEGIN
        mmoLogPDF.lines.add('Se encontraron los siguientes errores : ');
        mmoLogPDF.lines.add(FThread.FErrores);
        btncerrarPnlProcesamiento.Enabled:=true;
        //Showmessage('Se encontraron errores');
      END
    else
      pnlProcesamiento.Visible := False;

    FThread.Free;
    FThread := nil;

    // Mostrar el PDF en la vista previa
    FrmVistaPrevia.UniURLFrame1.URL := LUrl;
  end;
end;


procedure TfrmReportes.btnStartClick(Sender: TObject);
var CacheUrl,CacheFile : String;
begin
  if not Zcaserio.Active then
  begin
    ShowMessage('No hay caseríos cargados.');
    Exit;
  end;

  // Si ya hay hilo
  if Assigned(FThread) then
  begin
    // Si sigue trabajando, no lanzar otro
    if not FThread.Finished then
    begin
      ShowMessage('El proceso anterior aún no termina.');
      Exit;
    end;

    // Si ya terminó, liberamos el hilo anterior de forma ordenada
    FThread.WaitFor;      // por si acaso
    FreeAndNil(FThread);
  end;

  // Preparar UI de progreso
  pnlProcesamiento.Visible := True;
  pbProcesamiento.Position := 0;
  lblProcesamiento.Caption := '0 %';
  mmoLogPDF.lines.Clear;
  mmoLogPDF.lines.add('Proceso Iniciado : '+timetoSTR(now));
  btncerrarPnlProcesamiento.Enabled:=false;


  //cache
  CacheFile := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', CacheUrl);
  // CacheFile -> ruta física donde FastReport escribirá el PDF
  // CacheUrl  -> URL que verás en el UniURLFrame

  // Crear nuevo hilo con la foto del SQL y los checks
  FThread := TCalculationThread.Create(
    Zcaserio.SQL.Text,
    chkIMPcartaautoridad.Checked,
    chkcartacuadrosblancos.Checked,
    DM1.base_datos.HostName,
    DM1.Base_Datos.Database,
    CacheUrl,
    CacheFile,
    DataGlobal.VidAdenda
  );

  // Iniciar el hilo
  FThread.Start;

  // Arrancar el timer de monitoreo
  tmrProcesamiento.Interval := 200;
  tmrProcesamiento.Enabled := True;
end;


end.





