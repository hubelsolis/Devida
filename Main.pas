unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton,
  uniBitBtn, uniPanel, uniLabel, uniGroupBox, uniEdit, uniMemo;

type
  TMainForm = class(TUniForm)
    pnlIngreso: TUniPanel;
    lblIdMain: TUniLabel;
    UniGroupBox1: TUniGroupBox;
    UniGroupBox2: TUniGroupBox;
    btnPersonas: TUniBitBtn;
    btnUsuarios: TUniBitBtn;
    btncaserios: TUniBitBtn;
    btnAutoridades: TUniBitBtn;
    UniGroupBox3: TUniGroupBox;
    btnPadronBeneficiarios: TUniBitBtn;
    btnPadronCambios: TUniBitBtn;
    UniGroupBox4: TUniGroupBox;
    btnMovimientos: TUniBitBtn;
    btnActividades: TUniBitBtn;
    btnAdendas: TUniBitBtn;
    btnSalir: TUniBitBtn;
    lbldniusuario: TUniLabel;
    UniGroupBox5: TUniGroupBox;
    edtusuario: TUniEdit;
    edtclave: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    btnIngresar: TUniBitBtn;
    UniBitBtn12: TUniBitBtn;
    btnReportes: TUniBitBtn;
    btnPosicionGPS: TUniBitBtn;
    lbltipousuario: TUniLabel;
    lblusuario: TUniLabel;
    btnubigeos: TUniBitBtn;
    UniGroupBox6: TUniGroupBox;
    btnsimdevdata: TUniBitBtn;
    btnsimdevplan: TUniBitBtn;
    mmopermisos: TUniMemo;
    procedure btnIngresarClick(Sender: TObject);
    procedure btnAdendasClick(Sender: TObject);
    procedure btnPadronBeneficiariosClick(Sender: TObject);
    procedure btnPersonasClick(Sender: TObject);
    procedure btnPadronCambiosClick(Sender: TObject);
    procedure btncaseriosClick(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure btnActividadesClick(Sender: TObject);
    procedure btnMovimientosClick(Sender: TObject);
    procedure btnAutoridadesClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure edtclaveKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnReportesClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnsimdevplanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, UDBModulo, uFrmAdenda, UNIGUIoperadores,
  uFrmpadron, uFrmpersona, UModeloPersona, uFrmMovPadron, uFrmcaserio,
  uFrmUsuario, uniguiusqlutils, uFrmActividad, uFrmmovimientos, uFrmAutoridad,
  ureportes, udataglobal, uFrmSIMDEV;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.btnAutoridadesClick(Sender: TObject);
begin
  FrmAutoridad.showmodal;
end;

procedure TMainForm.UniBitBtn12Click(Sender: TObject);
begin
  close;
end;

procedure TMainForm.UniFormShow(Sender: TObject);
var T : Tstringlist;
begin
  workdir:=getcurrentdir;
  if fileexists(workdir+'\test.user') then
   begin
      T:=Tstringlist.Create;
      T.LoadFromFile(workdir+'\test.user');
       edtusuario.Text:=T[0];
       edtclave.Text:=T[1];
      T.Free;
   end;
end;

procedure TMainForm.btnSalirClick(Sender: TObject);
begin
   close;
end;

procedure TMainForm.btnsimdevplanClick(Sender: TObject);
begin
 FrmSimDev.showmodal;
end;

procedure TMainForm.btnAdendasClick(Sender: TObject);
begin
  Frmadenda.showmodal;
  ObtenerAdendaActual;
  MainForm.lblIdMain.caption:=DataGlobal.VidAdenda;
end;

procedure TMainForm.btnIngresarClick(Sender: TObject);
var i : shortint;
    p : string;
begin
  workdir:=getcurrentdir;
  DM1.Base_Datos.connected:=FALSE;
  DM1.Base_Datos.LibraryLocation:=workdir+'\fbclient.dll';
  DM1.Base_Datos.Database:=workdir+'\DEVIDA.FDB';
  DM1.Base_Datos.connected:=true;

  ObtenerAdendaActual;
  lblIdMain.caption:=DataGlobal.VidAdenda;

  // ahora obtener el usuario y clave

  ActivaDM1ConsultaSQL('SELECT DNI,usuario,TIPOUSUARIO FROM USUARIO a '+
  'where a.USUARIO="'+edtusuario.text+'" AND CLAVE="'+edtclave.Text+'"',FALSE);
  if DM1.ConsultaSQL.RecordCount>0 then
   begin
     lbldniusuario.caption:=DM1.ConsultaSQL.Fields[0].AsString;
     lblusuario.Caption:=DM1.ConsultaSQL.Fields[1].AsString;
     lbltipoUsuario.caption:=DM1.ConsultaSQL.Fields[2].AsString;
     pnlIngreso.visible:=false;
     colorFormulario:=clBtnFace;

     if lbltipoUsuario.caption='TECNICO' then
       BEGIN
         self.btnReportes.Enabled:=true;
         self.btnPadronCambios.Enabled:=true;
         self.btnAutoridades.Enabled:=true;

         // 2025 pidio chupin
         self.btncaserios.Enabled:=true;
         self.btnPersonas.Enabled:=true;
       END;

     if lbltipoUsuario.caption='COORDINADOR' then
       BEGIN
         self.btnReportes.Enabled:=true;
         self.btnPadronCambios.Enabled:=true;
         self.btnAutoridades.Enabled:=true;
         self.btncaserios.Enabled:=true;
       END;

     if lbltipoUsuario.caption='ADMIN' then
       BEGIN
         self.btnReportes.Enabled:=true;
         self.btnPadronCambios.Enabled:=true;
         self.btnPadronBeneficiarios.Enabled:=true;

         self.btnAdendas.Enabled:=true;
         self.btnActividades.Enabled:=true;
         self.btnMovimientos.Enabled:=true;

         self.btnAutoridades.Enabled:=true;
         self.btncaserios.Enabled:=true;

         self.btnPersonas.Enabled:=true;
         self.btnUsuarios.Enabled:=true;
       END;

    if fileexists(workdir+'\permisos.ini') then
     begin
      mmopermisos.lines.loadFromFile(workdir+'\permisos.ini');
      for i:=0 to MainForm.mmopermisos.Lines.Count-1 do
         MainForm.mmopermisos.Lines[i]:=UpperCase(MainForm.mmopermisos.Lines[i]);
     end;

    //procesa permisos personalizado desde un memo llamado mmopermisos
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

   end
  else
   begin
     //owMessage('Usuario y/o clave incorrecta...');
     MessageDlg('Usuario y/o clave incorrecta...', mtWarning, [mbOK]);
   end;
  DM1.ConsultaSQL.Close;
end;

procedure TMainForm.btnPadronBeneficiariosClick(Sender: TObject);
begin
  Frmpadron.showmodal;
end;

procedure TMainForm.btnPadronCambiosClick(Sender: TObject);
begin
  FrmMovPadron.showmodal;
  FrmMovPadron.edtCaserio.Text:='';
  FrmMovPadron.edtDniUsuario.Text :=lblDniusuario.Caption;
  FrmMovPadron.lblTipoUsuario.Text:=lblTipoUsuario.Caption;
  if lblTipousuario.Caption='ADMIN' then
   begin
     FrmMovPadron.edtCaserio.Enabled:=true;
     FrmMovPadron.edtDniUsuario.Enabled:=true;
     FrmMovPadron.chkDNIusuario.enabled:=true;
     FrmMovPadron.chkDNIusuario.Checked:=false;
     FrmMovPadron.lblnomcaserio.visible:=true;
   end
  else
   begin
     FrmMovPadron.edtCaserio.Enabled:=false;
     FrmMovPadron.edtDniUsuario.Enabled:=false;
     FrmMovPadron.chkDNIusuario.enabled:=false;
     FrmMovPadron.chkDNIusuario.Checked:=true;
     FrmMovPadron.lblnomcaserio.visible:=false;
   end;
end;

procedure TMainForm.btnPersonasClick(Sender: TObject);
begin
  FrmPersona.ShowModal;
end;

procedure TMainForm.btnReportesClick(Sender: TObject);
begin
  frmReportes.showModal;
  frmReportes.edtDni_tecnico.Text :=lblDniusuario.Caption;
  frmReportes.lblTipoUsuario.Text:=lblTipoUsuario.Caption;
end;

procedure TMainForm.btncaseriosClick(Sender: TObject);
begin
  Frmcaserio.showmodal;
end;

procedure TMainForm.btnUsuariosClick(Sender: TObject);
begin
  FrmUsuario.showmodal;
end;

procedure TMainForm.edtclaveKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if KEY=13 then
    BTNINGRESARCLICK(NIL);
end;

procedure TMainForm.btnActividadesClick(Sender: TObject);
begin
  FrmActividad.showmodal;
end;

procedure TMainForm.btnMovimientosClick(Sender: TObject);
begin
  //wer
  FrmMovimientos.ShowModal;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
