unit uFrmSubirTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniEdit,
  uniPanel, uniImage, uniLabel, uniMultiItem, uniComboBox, uniURLFrame,
  uniFileUpload;

type
  TFrmSubirTitulo = class(TUniForm)
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniPanel5: TUniPanel;
    btnSalir: TUniBitBtn;
    cbbTituloTipo: TUniComboBox;
    edtTituloDescripcion: TUniEdit;
    btnSubirTitulo: TUniBitBtn;
    btnGuardar: TUniBitBtn;
    btnEliminarTitulo: TUniBitBtn;
    lblTituloPath: TUniLabel;
    UniURLFrame1: TUniURLFrame;
    UniFileUpload2: TUniFileUpload;
    procedure btnSalirClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure btnSubirTituloClick(Sender: TObject);
    procedure UniFileUpload2Completed(Sender: TObject; AStream: TFileStream);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnEliminarTituloClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dni_titular : string;
    es_mov     : string;
  end;

function FrmSubirTitulo: TFrmSubirTitulo;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, udataglobal, uniguioperadores,uniguiusqlutils,
  System.IOUtils,ServerModule;

function FrmSubirTitulo: TFrmSubirTitulo;
begin
  Result := TFrmSubirTitulo(UniMainModule.GetFormInstance(TFrmSubirTitulo));
end;

procedure TFrmSubirTitulo.btnEliminarTituloClick(Sender: TObject);
begin
  // Eliminar
  if (DNI_titular<>'') and (lblTituloPath.Caption<>'') then
   Begin
    MessageDlg('Esta seguro de Eliminar...',
    mtInformation, mbYesNoCancel,
     procedure (Sender: TComponent; Res:Integer)
      begin
          case Res of
             mrYes :
             begin
                UniURLFrame1.URL := '';
                DeleteFile(workdir+'\Titulos\'+lblTituloPath.Caption);
                lblTituloPath.Caption:='';
                cbbTituloTipo.ItemIndex:=-1;
                cbbTituloTipo.Text:='';
                edtTituloDescripcion.Text:='';
                if ES_MOV<>'SI' then
                  EjecutaSQL(
                  'update padron p set '+
                  'p.TITULOPATH="", '+
                  'p.TITULOTIPO="", '+
                  'p.TITULODESCRIPCION="", '+
                  'p.TITULONOUPDATE=0 '+
                  'where p.IDADENDA="'+dataGlobal.VidAdenda+'" AND P.DNI="'+DNI_Titular+'" ',false);
                Showmessage('PDF eliminado');
             end;
          end;
      end);
   end;
end;

procedure TFrmSubirTitulo.btnSalirClick(Sender: TObject);
begin
  close;
end;

procedure TFrmSubirTitulo.btnSubirTituloClick(Sender: TObject);
begin
  if not DirectoryExists(Workdir+'\titulos\') then
    CreateDir(Workdir+'\titulos\');
  UniFileUpload2.Execute;
end;

procedure TFrmSubirTitulo.btnGuardarClick(Sender: TObject);
begin
  // aca los UPDATEs a la DB
  if Trim(lblTituloPath.Caption)='' then
   begin
     Showmessage('Suba un archivo antes');
     exit;
   end;

  // aca los UPDATEs a la DB
  if Trim(cbbtituloTipo.text)='' then
   begin
     Showmessage('Seleccione un Tipo de Titulo');
     exit;
   end;

  // aca los UPDATEs a la DB
  {if Trim(edtTituloDescripcion.Text)='' then
   begin
     Showmessage('Agregue un tipo de descripcion');
     exit;
   end;
  }


  if ES_MOV='SI' then
   begin
     // MOVPADRON
     dataglobal.Vdato1:=lblTituloPath.Caption;
     dataglobal.Vdato2:=cbbTituloTipo.Text;
     dataglobal.Vdato3:=edtTituloDescripcion.Text;
     dataglobal.Vdato4:='ok';
     close;
   end
  Else
  //if (DNI_titular<>'') then
   begin
     EjecutaSQL(
     'update padron p set '+
     'p.TITULOPATH="'+lblTituloPath.Caption+'", '+
     'p.TITULOTIPO="'+cbbTitulotipo.Text+'", '+
     'p.TITULODESCRIPCION="'+edtTituloDescripcion.Text+'", '+
     'p.TITULONOUPDATE=1 '+
     'where p.IDADENDA="'+dataGlobal.VidAdenda+'" AND P.DNI="'+DNI_Titular+'" ',false);
     Showmessage('Guardado ...');
   end;

end;

procedure TFrmSubirTitulo.UniFileUpload2Completed(Sender: TObject;
  AStream: TFileStream);
var
  DestName,CacheURL,cacheFile : string;
  DestFolder : string;
  n : string;
begin
   randomize;

   if DNI_Titular<>'' then
     begin
       if es_mov='SI' then
         n:='MOV_'+DNI_Titular+'_'+DataGlobal.VidAdenda+'_r'+StrI(random(1000)+1)
       ELSE
         n:='PD_'+DNI_Titular+'_'+DataGlobal.VidAdenda+'_r'+StrI(random(1000)+1);
     end
   else
     n:=dateTostr(now)+'-'+timetostr(now)+'_r'+StrI(random(100)+1);

   n:=strCom(n,'/','_');
   n:=strcom(n,':','_');
   n:=strcom(n,'.','');
   n:=strcom(n,' ','');
   n:=n+'.pdf';
   DestFolder:=Workdir+'\titulos\';

   lblTituloPath.Caption:=n;
   DestName:=DestFolder+lblTituloPath.Caption;

   CopyFile(PChar(AStream.FileName), PChar(DestName), False);

     // Crea un archivo temporal en la cache y devuelve la URL pública en CacheURL
     CacheFile := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', CacheURL);

     // Copiamos el PDF existente al archivo de cache
     TFile.Copy(DestName, CacheFile, True);

     // Cargamos en el frame (con rompe-caché opcional)
     FrmSubirTitulo.UniURLFrame1.URL := CacheURL; // + '&v=' + IntToStr(GetTickCount);

   ShowMessage('Documento cargado con exito...');
   //FrmSubirTitulo.UniSession.AddJS(FrmSubirTitulo.UniURLFrame1.JSName + '.reload();');
end;

procedure TFrmSubirTitulo.UniFormCreate(Sender: TObject);
begin
 dni_titular:='';
 ES_mov:='';
end;

procedure TFrmSubirTitulo.UniFormResize(Sender: TObject);
begin
 UniPanel5.Left:=Trunc(Unipanel2.Width/2-UniPanel5.Width/2)-2
end;

procedure TFrmSubirTitulo.UniFormShow(Sender: TObject);
begin
 if cbbtitulotipo.Items.Count<=0 then
  cbbtitulotipo.Items.LoadFromFile(workdir+'\titulos.ini');
end;

end.
