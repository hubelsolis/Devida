unit uFrmDatosmovPadron;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
uniEdit, uniLabel, uniMultiItem, uniComboBox, uniSpeedButton, uniImage,
  uniPanel, uniPageControl, uniBasicGrid, uniStringGrid, uniListBox, uniCheckBox,
  uniDateTimePicker, uniFileUpload, uniMemo;

type
  strTwo = string[2];

  TFrmDatosmovPadron = class(TUniForm)
    lblIdadenda: TUnilabel;
    lblIdmovpadron: TUnilabel;
    lblNro: TUnilabel;
    lblIdcaserio: TUnilabel;
    lblDni_titular: TUnilabel;
    lblTelefono: TUnilabel;
    lblDni_conyuge: TUnilabel;
    lblTipomovimiento: TUnilabel;
    lblDni_tecnico_responsable: TUnilabel;
    lblObservaciones_1: TUnilabel;
    lblObservaciones_2: TUnilabel;
    lblObservaciones_3: TUnilabel;
    edtIdadenda: TUniEdit;
    edtIdmovpadron: TUniEdit;
    edtNro: TUniEdit;
    edtIdcaserio: TUniEdit;
    edtDni_titular: TUniEdit;
    edtTelefono: TUniEdit;
    edtDni_conyuge: TUniEdit;
    edtDni_tecnico: TUniEdit;
    btnLimpiar: TUniBitBtn;
    btnGuardar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    edtNombreTitular: TUniEdit;
    edtTipomovimiento: TUniComboBox;
    edtNombreTecnico: TUniEdit;
    btnBuscaDNI: TUniSpeedButton;
    edtApPaterno: TUniEdit;
    edtApMaterno: TUniEdit;
    edtConyNombre: TUniEdit;
    edtConyApPaterno: TUniEdit;
    edtConyApMaterno: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    cbsexo: TUniComboBox;
    cbconysexo: TUniComboBox;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    btnBuscaCaserio: TUniSpeedButton;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    edtambito: TUniEdit;
    edtdepartamento: TUniEdit;
    edtprovincia: TUniEdit;
    edtdistrito: TUniEdit;
    edtcaserio: TUniEdit;
    Rejilla: TUniStringGrid;
    UniLabel19: TUniLabel;
    edtsubtipomov: TUniComboBox;
    paginaimagen: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    UniImage2: TUniImage;
    UniImage1: TUniImage;
    edtImagen1: TUniEdit;
    edtImagen2: TUniEdit;
    btnsubirimagen1: TUniSpeedButton;
    btnsubirimagen2: TUniSpeedButton;
    UniLabel21: TUniLabel;
    btnPreparaRejilla: TUniButton;
    UniLabel20: TUniLabel;
    edtDni_Autoridad: TUniEdit;
    edtAutNombre: TUniEdit;
    edtAutApPaterno: TUniEdit;
    edtAutApMaterno: TUniEdit;
    UniLabel22: TUniLabel;
    edtAutResolucion: TUniEdit;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    UniLabel27: TUniLabel;
    btnBuscaAutoridad: TUniSpeedButton;
    edtAutCargo: TUniEdit;
    UniLabel23: TUniLabel;
    edtNroInforme: TUniEdit;
    edtDNI_Referencia: TUniEdit;
    lblbuscareferencia: TUniLabel;
    edtNombreReferencia: TUniEdit;
    btnbuscareferencia: TUniSpeedButton;
    btnBuscaConyuge: TUniSpeedButton;
    edtAutTelefono: TUniEdit;
    UniLabel29: TUniLabel;
    lblMensaje: TUniLabel;
    chknroinforme: TUniCheckBox;
    edtlengua: TUniComboBox;
    edtetnia: TUniComboBox;
    edtconyetnia: TUniComboBox;
    edtconylengua: TUniComboBox;
    edtFecNac: TUniDateTimePicker;
    edtAutFecha: TUniDateTimePicker;
    chkCambioTitularidad: TUniCheckBox;
    UniFileUpload1: TUniFileUpload;
    UniPanel1: TUniPanel;
    lblDNI_refConyuge: TUniLabel;
    lblIDMovReferencia: TUniLabel;
    lblTipoUsuario: TUniLabel;
    lbltest: TUniLabel;
    UniLabel28: TUniLabel;
    edtfecnaccy: TUniDateTimePicker;
    edtObservaciones_1: TUniComboBox;
    edtObservaciones_2: TUniComboBox;
    edtObservaciones_3: TUniComboBox;
    UniTabSheet3: TUniTabSheet;
    imgTituloPDF: TUniImage;
    btnSubirTitulo: TUniBitBtn;
    btnEliminarTitulo: TUniBitBtn;
    edtTituloDescripcion: TUniEdit;
    cbbTituloTipo: TUniComboBox;
    lblTituloPath: TUniLabel;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnBuscaDNIClick(Sender: TObject);
    procedure btnBuscaCaserioClick(Sender: TObject);
    procedure edtDni_titularKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPreparaRejillaClick(Sender: TObject);
    procedure edtTipomovimientoChange(Sender: TObject);
    procedure edtsubtipomovChange(Sender: TObject);
    procedure btnBuscaConyugeClick(Sender: TObject);
    procedure btnBuscaAutoridadClick(Sender: TObject);
    procedure btnbuscareferenciaClick(Sender: TObject);
    procedure edtDni_conyugeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtIdcaserioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDni_AutoridadKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDNI_ReferenciaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnsubirimagen1Click(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
    procedure btnsubirimagen2Click(Sender: TObject);
    procedure edtDni_tecnicoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSubirTituloClick(Sender: TObject);
    procedure btnEliminarTituloClick(Sender: TObject);
  private
    { Private declarations }
    vIdPadron : string;
    vOperacion : string;
    vmayorque : string;
    vlimite : string;
    vsolo_has_en_uso : strTWO;
    vjalar_datos_referencia : strTWO;
    vactividad : string;
    nroArchivo : smallint;
    procedure ObtenerDatosAdendas(Sender: TComponent; AResult:Integer);
    procedure DCallBackSave(Sender: TComponent; Res: Integer);
    function CalculaNroInforme(datonombre,datoanio,datoactividad:string ):string;
  public
    { Public declarations }
    editar : byte;
    idtabla : string;
    procedure nuevosdatos;
    procedure cargardatos;
    function  getData(nombre:string):string;
    procedure setData(nombre,valor:string);
  end;

function
  FrmDatosmovPadron: TFrmDatosmovPadron;

implementation
{$R *.dfm}

 uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,UDBModulo,uModelomovPadron,
  uFrmMovPadron,uModeloPadron, uFrmbuscador,uniguiusqlutils,UmodeloPersona,Umodeloautoridad,
  umodelocaserio,uModelomovPadronactividad, umensajes, udataglobal,
  uFrmSubirTitulo;

 function FrmDatosmovPadron: TFrmDatosmovPadron;
  begin
    Result := TFrmDatosmovPadron(UniMainModule.GetFormInstance(TFrmDatosmovPadron));
  end;

function TFrmDatosmovPadron.getData(nombre:string):string;
var i : smallint;
 begin
   result:='';
   {for i:=0 to ListaVar.items.count-1 do
    begin
      if SplitCadena(ListaVar.items[i],'=',1)=nombre then
       begin
         result:=SplitCadena(ListaVar.items[i],'=',2);
       end;
    end;}
 end;

procedure TFrmDatosmovPadron.setData(nombre,valor:string);
var i : smallint;
 begin
   {for i:=0 to ListaVar.items.count-1 do
    begin
      if SplitCadena(ListaVar.items[i],'=',1)=nombre then
       begin
         ListaVar.items[i]:=nombre+'='+valor;
       end;
    end; }
 end;

function TFrmDatosmovPadron.CalculaNroInforme(datonombre,datoanio,datoactividad:string ):string;
var i : smallint;  iniciales,contador : string;
  begin
    iniciales:='';
    for i := 1 to 10 do
       iniciales:=iniciales+Trim(Copy(SplitCadena(datoNombre,' ',i),1,1));

    contador:=ActivaDM1ConRegistro('SELECT count(a.DNI_TECNICO)+1 FROM MOVPADRON a where a.DNI_TECNICO="'+edtDNI_Tecnico.text+'" and a.IDADENDA="'+DataGlobal.vIdAdenda+'"',1);
    contador:=completar3(contador);
    result:=contador+'-'+datoanio+'-'+datoactividad+'-'+iniciales;
  end;

procedure TFrmDatosmovPadron.btnLimpiarClick(Sender: TObject);
 begin
    lblmensaje.Caption:='';
    edtDni_titular.enabled:=true;
    btnBuscaDNI.Enabled:=true;
    chknroinforme.Enabled:=true;
    chknroinforme.Checked:=true;

    edtIdmovpadron.text:='';
    edtIdadenda.text:=DataGlobal.vIdAdenda;
    edtNro.text:='0';
    edtIdcaserio.text:='';
    edtDni_titular.text:='';
    edtTelefono.text:='';
    edtDni_conyuge.text:='';

    edtTipoMovimiento.Itemindex:=-1;
    edtsubtipomov.ItemIndex:=-1;

    edtDni_Autoridad.Text:='';
    //edtDni_tecnico.text:='';

    edtNroInforme.Text:='';
    edtObservaciones_1.text:='';
    edtObservaciones_2.text:='';
    edtObservaciones_3.text:='';
    edtImagen1.text:='';
    edtImagen2.text:='';
    UniImage1.Picture.Assign(nil);
    UniImage2.Picture.Assign(nil);
    editar:=0;
    idtabla:='';

    vIdPadron:='';
    voperacion:='';
    vmayorque:='';
    vlimite:='';
    vsolo_has_en_uso:='';

    // extras
    self.edtNombreTitular.Text:='';
    self.edtApPaterno.Text:='';
    self.edtApMaterno.Text:='';
    self.edtFecNac.Text:='';
    self.cbsexo.Text:='';
    self.edtetnia.Text:='';
    self.edtlengua.Text:='';

    self.edtConyNombre.Text:='';
    self.edtConyApPaterno.text:='';
    self.edtConyApMaterno.text:='';
    self.cbConysexo.Text:='';
    self.edtConyetnia.Text:='';
    self.edtConylengua.Text:='';
    self.edtFecNaccy.Text:='';   //2023

    self.edtambito.Text:='';
    self.edtdepartamento.text:='';
    self.edtprovincia.text:='';
    self.edtdistrito.text:='';
    self.edtcaserio.text:='';

    self.edtAutNombre.Text:='';
    self.edtAutApPaterno.Text:='';
    self.edtAutApMaterno.Text:='';
    self.edtAutTelefono.Text:='';

    self.edtAutCargo.Text:='';
    self.edtAutResolucion.Text:='';
    self.edtAutFecha.Text:='';

    edtNombretecnico.text:=recuperanombre(edtDNI_Tecnico.Text,' ');
    vActividad:=ActivaDM1ConRegistro('SELECT idactividad FROM actividadusuario a where a.dni="'+edtDNI_Tecnico.Text+'"',1);

    if vActividad='' then vActividad:='N.A.';


    //if chknroinforme.Checked then
    //   edtNroInforme.Text:=CalculaNroInforme(edtNombretecnico.text,splitCadena(DataGlobal.Vidadenda,'-',2),vactividad)
    //else
       edtNroInforme.Text:='';

    EdtDNI_referencia.Text:='';
    EdtNombrereferencia.Text:='';

    lblBuscaReferencia.Visible:=False;
    btnBuscaReferencia.Visible:=False;
    EdtDNI_referencia.Visible:=False;
    EdtNombrereferencia.Visible:=False;

    chkCambioTitularidad.Checked:=false;

    lblDNI_refConyuge.Caption:='';
    lblIDMovReferencia.Caption:='';

   edtObservaciones_1.Items.clear;
   edtObservaciones_2.Items.clear;
   edtObservaciones_3.Items.clear;

   //2025
    imgTituloPDF.Picture.Assign(nil);
    lblTituloPath.Caption:='';
    cbbTituloTipo.ItemIndex:=-1;
    cbbTituloTipo.Text:='';
    edtTituloDescripcion.Text:='';

 end;


procedure TFrmDatosmovPadron.btnBuscaAutoridadClick(Sender: TObject);
var MiPersona : TPersona;
    MiAutoridad : TAutoridad;
begin
   MiPersona:=TPersona.Create;
    MiPersona.ObtenerRegistro('DNI',edtDni_autoridad.Text );
    self.edtAutNombre.Text:=MiPersona.Nombre;
    self.edtAutApPaterno.text:=MiPersona.Appaterno;
    self.edtAutApMaterno.text:=MiPersona.Apmaterno;
   MiPersona.Free;

   MiAutoridad:=TAutoridad.create;
    MiAutoridad.ObtenerRegistro('DNI',edtDni_autoridad.Text,'ESTADO','1');
    self.edtAutCargo.Text:=MiAutoridad.Cargo;
    self.edtAutResolucion.Text:=MiAutoridad.Resolucion;
    self.edtAutFecha.Text:=MiAutoridad.Fecha;
    Self.edtAutTelefono.text:=MiAutoridad.telefono;
   MiAutoridad.free;
end;

procedure TFrmDatosmovPadron.btnBuscaCaserioClick(Sender: TObject);
begin
  FrmBuscador.tipobusqueda:=1;
  FrmBuscador.ShowModal(ObtenerDatosAdendas);
end;

procedure TFrmDatosmovPadron.ObtenerDatosAdendas(Sender: TComponent; AResult:Integer);
begin
  self.edtIdcaserio.Text:=DataGlobal.Vdato1;
  self.edtambito.Text:=DataGlobal.Vdato2;
  self.edtdepartamento.text:=DataGlobal.Vdato3;
  self.edtprovincia.text:=DataGlobal.Vdato4;
  self.edtdistrito.text:=DataGlobal.Vdato5;
  self.edtcaserio.text:=DataGlobal.Vdato6;
end;

procedure TFrmDatosmovPadron.btnBuscaConyugeClick(Sender: TObject);
var MiPersona : TPersona;
begin
  MiPersona:=TPersona.Create;
  // busca datos del conyugue
  MiPersona.ObtenerRegistro('DNI',edtDni_conyuge.Text );
    self.edtConyNombre.Text:=MiPersona.Nombre;
    self.edtConyApPaterno.text:=MiPersona.Appaterno;
    self.edtConyApMaterno.text:=MiPersona.Apmaterno;
    self.cbConysexo.Text:=MiPersona.Sexo;
    self.edtConyetnia.Text:=MiPersona.Etnia;    if MiPersona.Etnia=''  then  edtConyetnia.Text:='MESTIZO';
    self.edtConylengua.Text:=MiPersona.Lengua;  if MiPersona.lengua='' then  edtConyLengua.Text:='CASTELLANO';
  MiPersona.Free;
end;

procedure TFrmDatosmovPadron.btnBuscaDNIClick(Sender: TObject);
var MiPadron  : TPadron;
    i,j       : smallint;
    MiPersona : TPersona;
    Miautoridad : TAutoridad;
begin
  lblMensaje.Caption:='';
  btnPreparaRejillaClick(NIL);
  if Length(edtDni_titular.text)=8 then
   begin
     VidPadron:='';

     edtNombreTitular.Text:='';
     edtApPaterno.Text:='';
     edtApMaterno.Text:='';
     edtTelefono.Text:='';
     edtFecNac.Text:='';
     cbsexo.Text:='';
     edtetnia.Text:='';
     edtLengua.Text:='';

     edtidcaserio.Text:='';
     edtambito.Text:='';
     edtdepartamento.Text:='';
     edtprovincia.Text:='';
     edtdistrito.Text:='';
     edtcaserio.Text:='';

     edtDNI_Conyuge.Text:='';
     edtConyNombre.Text:='';
     edtConyApPaterno.Text:='';
     edtConyApMaterno.Text:='';
     cbconysexo.Text:='';
     edtconyetnia.Text:='';
     edtconyLengua.Text:='';

     MiPadron := TPadron.Create;
       MiPadron.ObtenerRegistro('dni',edtDni_titular.Text,'idAdenda',DataGlobal.VidAdenda_anterior);
       if Mipadron.Dni<>'' then
         begin
           VIdPadron:=MiPadron.Idpadron;
           lblMensaje.font.Color:=ClBlue;
           lblMensaje.Caption:='Participante presente en padron '+DataGlobal.VidAdenda_anterior+'...';

           edtNombreTitular.Text:=MiPadron.Nombre;
           edtApPaterno.Text:=Mipadron.Appaterno;
           edtApMaterno.Text:=MiPadron.Apmaterno;
           edtTelefono.Text:=MiPadron.Telefono;
           edtFecNac.Text:=ActivaDM1ConRegistro('select fecnac from persona where DNI="'+edtDni_titular.Text+'"',1);
           cbsexo.Text:=MiPadron.Sexo;
           edtetnia.Text:=MiPadron.Etnia;    if MiPadron.Etnia=''  then  edtetnia.Text:='MESTIZO';
           edtLengua.Text:=MiPadron.Lengua;  if MiPadron.Lengua='' then  edtLengua.Text:='CASTELLANO';

           edtidcaserio.Text:=MiPadron.idcaserio;
           edtambito.Text:=MiPadron.Ambito;
           edtdepartamento.Text:=MiPadron.Departamento;
           edtprovincia.Text:=MiPadron.Provincia;
           edtdistrito.Text:=Mipadron.Distrito;
           edtcaserio.Text:=MiPadron.Caserio;

             //ADICIONAL 12/2022 CUANDO YA HAY AUTORIDAD
             if edtidcaserio.Text<>'' then
               begin
                 Miautoridad:=TAutoridad.Create;
                   Miautoridad.ObtenerRegistro('IDCASERIO',edtidcaserio.Text,'ESTADO','1');
                   if Miautoridad.Dni<>'' then
                    begin
                      edtDni_autoridad.Text:=Miautoridad.Dni;
                      btnBuscaAutoridadClick(nil);
                    end;
                 MiAutoridad.Free;
               end;

           edtDNI_Conyuge.Text:=Mipadron.Cony_dni;
           edtConyNombre.Text:=Mipadron.Cony_nombre;
           edtConyApPaterno.Text:=MiPadron.Cony_Appaterno;
           edtConyApMaterno.Text:=MiPadron.Cony_Apmaterno;
           cbconysexo.Text:=MiPadron.Cony_sexo;
           edtconyetnia.Text:=MiPadron.cony_Etnia;
           edtconyLengua.Text:=MiPadron.cony_Lengua;

           //Ahora los detalles para la matriz
            ActivaDM1ConsultaSQL('select a.IDACTIVIDAD,a.IDETAPA, '+
            'a.HAS,a.COORX, a.COORY, a.ALTITUD,a.ANIO_INSTALACION '+
            'from padronactividad a where a.idpadron="'+VidPadron+'" '+
            'order by a.IDACTIVIDAD,a.ORDEN ',true);
             for j:=1 to DM1.ConsultaSQL.RecordCount do
             begin
                if j>1 then DM1.ConsultaSQL.Next;
                for i:=0 to Rejilla.RowCount do
                 begin
                    if (Rejilla.Cells[0,i]=DM1.ConsultaSQL.Fields[0].AsString) and
                       (Rejilla.Cells[1,i]=DM1.ConsultaSQL.Fields[1].AsString) then
                       begin
                         Rejilla.Cells[2,i]:=DM1.ConsultaSQL.Fields[2].AsString;
                         Rejilla.Cells[4,i]:=DM1.ConsultaSQL.Fields[3].AsString;
                         Rejilla.Cells[5,i]:=DM1.ConsultaSQL.Fields[4].AsString;
                         Rejilla.Cells[6,i]:=DM1.ConsultaSQL.Fields[5].AsString;
                         Rejilla.Cells[7,i]:=DM1.ConsultaSQL.Fields[6].AsString;
                       end;
                 end;
             end;
             DM1.ConsultaSQL.Close;

           MiPadron.Free;
         end
       else
         begin
           MiPadron.Free;
           //no tiene regiustro
           lblMensaje.font.Color:=ClRed;
           lblMensaje.Caption:='Participante NO EXISTE en padron '+DataGlobal.VidAdenda_anterior+'...';
           FrmMensajes.lblmensaje.Caption:='Verificar en el SISPOST ahora SISDAIS si el Participante esta activo o inactivo ...';
           FrmMensajes.lblurl.Caption:='<a href="http://www2.simdev.gob.pe/Post/Devida/mant_participante.aspx" target="_blank">http://www2.simdev.gob.pe/Post/Devida/mant_participante.aspx</a>';
           FrmMensajes.Showmodal;
           //showmessage('Verificar en el Sistema si el Participante ya existe en el SISPOST ahora SISDAIS, si esta activo o inactivo...');

           //persona
            MiPersona:=TPersona.Create;
            // busca datos del conyugue
              MiPersona.ObtenerRegistro('DNI',edtDni_titular.Text );
              self.edtNombreTitular.Text:=MiPersona.Nombre;
              self.edtApPaterno.text:=MiPersona.Appaterno;
              self.edtApMaterno.text:=MiPersona.Apmaterno;
              self.cbsexo.Text:=MiPersona.Sexo;
              self.edtTelefono.Text:=MiPersona.Telefono;
              self.edtFecNac.Text:=MiPersona.Fecnac;
              self.edtetnia.Text:=MiPersona.Etnia;    if MiPersona.Etnia=''  then  edtetnia.Text:='MESTIZO';
              self.edtlengua.Text:=MiPersona.Lengua;  if MiPersona.lengua='' then  edtLengua.Text:='CASTELLANO';
            MiPersona.Free;
         end;
   end
  else
   begin
     Showmessage('El DNI Tiene que ser de 8 digitos...');
   end;

end;

procedure TFrmDatosmovPadron.btnbuscareferenciaClick(Sender: TObject);
var s : string;  j,i : smallint;
begin
  //lIMPIEZA DE LA GRID
  for i:=1 to Rejilla.RowCount do
   begin
      Rejilla.Cells[2,i]:='';
      Rejilla.Cells[4,i]:='';
      Rejilla.Cells[5,i]:='';
      Rejilla.Cells[6,i]:='';
      Rejilla.Cells[7,i]:='';
   end;

   edtNombreReferencia.Text:=recuperanombre(edtDni_referencia.Text,' ');
   lbltest.Caption:=DataGlobal.VidAdenda_anterior;

   s:='';
   ActivaDM1ConsultaSQL('select idpadron,cony_dni from padron '+
   'where dni="'+edtDni_referencia.Text+'" and idadenda="'+DataGlobal.VidAdenda_anterior+'"',true);
     if DM1.ConsultaSQL.RecordCount>0 then
      begin
        s:=DM1.ConsultaSQL.Fields[0].AsString;
        lblDNI_refConyuge.Caption:=DM1.ConsultaSQL.Fields[1].AsString;
        lblIDMovReferencia.Caption:=s;
      end;
   DM1.ConsultaSQL.Close;

   if (vjalar_datos_referencia='SI') and (s<>'') then
     Begin
        //Ahora los detalles para la matriz
        ActivaDM1ConsultaSQL('select a.IDACTIVIDAD,a.IDETAPA, '+
        'a.HAS,a.COORX, a.COORY, a.ALTITUD,a.ANIO_INSTALACION '+
        'from padronactividad a where a.idpadron="'+s+'" '+
        'order by a.IDACTIVIDAD,a.ORDEN ',true);
        if DM1.ConsultaSQL.RecordCount>0 then
         begin
           for j:=1 to DM1.ConsultaSQL.RecordCount do
             begin
                if j>1 then DM1.ConsultaSQL.Next;
                for i:=1 to Rejilla.RowCount do
                 begin
                    if (Rejilla.Cells[0,i]=DM1.ConsultaSQL.Fields[0].AsString) and
                       (Rejilla.Cells[1,i]=DM1.ConsultaSQL.Fields[1].AsString) then
                       begin
                         Rejilla.Cells[2,i]:=DM1.ConsultaSQL.Fields[2].AsString;
                         Rejilla.Cells[4,i]:=DM1.ConsultaSQL.Fields[3].AsString;
                         Rejilla.Cells[5,i]:=DM1.ConsultaSQL.Fields[4].AsString;
                         Rejilla.Cells[6,i]:=DM1.ConsultaSQL.Fields[5].AsString;
                         Rejilla.Cells[7,i]:=DM1.ConsultaSQL.Fields[6].AsString;
                       end
                 end;
             end;
         end;
         DM1.ConsultaSQL.Close;
     End;
end;

procedure TFrmDatosmovPadron.btnEliminarTituloClick(Sender: TObject);
begin
 if LENGTH(EDTdNI_TITULAR.Text)<>8 then
  BEGIN
   exit;
  END;

 MessageDlg('Esta seguro de Eliminar...',
 mtInformation, mbYesNoCancel,
 procedure (Sender: TComponent; Res:Integer)
  begin
      case Res of
         mrYes :
         begin
            imgTituloPDF.Picture.Assign(nil);
            DeleteFile(workdir+'\Titulos\'+lblTituloPath.Caption);
            lblTituloPath.Caption:='';
            cbbTituloTipo.ItemIndex:=-1;
            cbbTituloTipo.Text:='';
            edtTituloDescripcion.Text:='';
         end;
      end;
  end);

end;

procedure TFrmDatosmovPadron.btnGuardarClick(Sender: TObject);
var 
    hacer : boolean;
    dato : real;
    i : smallint;
 begin
  //validaciones

  // REGLAS DE TENER DATOS
  if (edtIdadenda.Text='')then
   begin
     Showmessage('Se requiere un Idadenda');
     exit;
   end;

  if (length(edtdni_Titular.text)<>8) or (edtNombreTitular.Text='') or (edtApPaterno.Text='')  or (edtApMaterno.Text='') then
    begin
      Showmessage('Se requiere el DNI, Nombre del Titular');
      exit;
    end;

  if (length(edtdni_Autoridad.text)<>8) or (edtAutNombre.Text='') or (edtAutApPaterno.Text='')  or (edtAutApMaterno.Text='') then
    begin
      Showmessage('Se requiere el DNI, Nombre de la Autoridad de Caserio');
      exit;
    end;

  if (length(edtdni_tecnico.text)<>8) or (edtNombreTecnico.Text='')  then
    begin
      Showmessage('Se requiere el DNI, Nombre del Tecnico de campo');
      exit;
    end;

  if (edtIdCaserio.Text='') or (edtAmbito.Text='')  or (edtDepartamento.Text='')  or (edtProvincia.Text='')  or (edtDistrito.Text='')  or (edtCaserio.Text='') then
    begin
      Showmessage('Se requiere datos del Caserio ... verifique');
      exit;
    end;

  if (edttipomovimiento.Text='') or (edtsubtipomov.Text='')  then
    begin
      Showmessage('Se requiere Tipo de Movimiento y SubTipo Movimiento ... verifique');
      exit;
    end;

  if (edtDni_Referencia.Visible) and (edtDni_referencia.Text='') then
    begin
      Showmessage('Se requiere DNI de referencia ... verifique');
      exit;
    end;

    //reglas de validacion
  //REGLAS DE LOGICA DE NEGOCIO
  // voperacion, vmayorque, vlimite
  dato:=0;
  for i:=1 to Rejilla.RowCount do
     begin
       dato:=dato+ValR(Rejilla.Cells[3,i]);  //h
     end;
  if dato=0 then
    begin
      Showmessage('No se ha ingresado ningun HAS_MOV ....');
      exit;
    end;

  // no negativos
  dato:=0;
  for i:=1 to Rejilla.RowCount do
     begin
       if ValR(Rejilla.Cells[3,i])<0 then dato:=1;
     end;
  if dato=1 then
    begin
      Showmessage('No se permiten numeros negativos ....');
      exit;
    end;

  // solo HAS en uso
  dato:=0;
  for i:=1 to Rejilla.RowCount do
     begin
       if (ValR(Rejilla.Cells[3,i])<>0) and (ValR(Rejilla.Cells[2,i])=0)
       then dato:=1;
     end;
  if (dato=1) AND (vsolo_has_en_uso='SI') then
    begin
      Showmessage('Solo se permiten ACT en uso ....');
      exit;
    end;

  // OPERACIONES LOGICAS
  dato:=0;
  for i:=1 to Rejilla.RowCount do
     begin
       hacer:=true;
       if vsolo_has_en_uso='SI' then
         if (ValR(Rejilla.Cells[2,i])=0) then hacer:=false;
       if hacer then
         BEGIN
           if Vmayorque='MAYOR' then
             if Not (ValR(Rejilla.Cells[3,i])>ValR(Rejilla.Cells[2,i])) Then dato:=1;

           if Vmayorque='MENOR' then
             if Not (ValR(Rejilla.Cells[3,i])<ValR(Rejilla.Cells[2,i])) Then dato:=1;

           if Vmayorque='IGUAL' then
             if Not (ValR(Rejilla.Cells[3,i])=ValR(Rejilla.Cells[2,i])) Then dato:=1;

           if Vmayorque='MAYOR_IGUAL' then
             if Not (ValR(Rejilla.Cells[3,i])>=ValR(Rejilla.Cells[2,i])) Then dato:=1;

           if Vmayorque='MENOR_IGUAL' then
             if Not (ValR(Rejilla.Cells[3,i])<=ValR(Rejilla.Cells[2,i])) Then dato:=1;
         END;
     end;

  if (dato=1) AND (Vmayorque<>'') then
    begin
      Showmessage('Los Movimientos deben ser '+vmayorque+', verifique  ....');
      exit;
    end;

  // solo limite
  dato:=0;
  for i:=1 to Rejilla.RowCount do
     begin
       if (ValR(Rejilla.Cells[3,i])>ValR(Vlimite))
       then dato:=1;
     end;

  if (dato=1) then
    begin
      Showmessage('Los Movimientos no pueden ser Mayor a '+Vlimite+' ....');
      exit;
    end;

  MessageDlg('Esta seguro de guardar...', mtConfirmation, mbYesNo,DCallBackSave);

 end;

procedure TFrmDatosmovPadron.DCallBackSave(Sender: TComponent; Res: Integer);
VAR
    MimovPadron : TmovPadron;
    MiPersona : TPersona;
    MiAutoridad : TAutoridad;
    MiCaserio : TCaserio;
    MiMovPadronActividad : TMovPadronActividad;
    I : SMALLINT;
begin
 if Res=6 then
  begin
  //if chknroinforme.Checked then
    //edtNroInforme.Text:=CalculaNroInforme(edtNombretecnico.text,splitCadena(DataGlobal.Vidadenda,'-',2),vactividad);

   if edtidmovpadron.Text='' then
     edtidmovpadron.Text:=ActivaDM1ConRegistro('SELECT GEN_ID( GEN_MOVPADRON_ID, 1 ) FROM RDB$DATABASE',1);

   MimovPadron:=TmovPadron.Create;

   MimovPadron.Idadenda:=edtIdadenda.Text;
   MimovPadron.Idmovpadron:=edtIdmovpadron.Text;
   MimovPadron.Nro:=edtNro.Text;
   MimovPadron.Idcaserio:=edtIdcaserio.Text;
   MimovPadron.Dni_titular:=edtDni_titular.Text;
   MimovPadron.Telefono:=edtTelefono.Text;
   MimovPadron.Dni_conyuge:=edtDni_conyuge.Text;
   MimovPadron.Dni_autoridad:=edtDni_Autoridad.text;
   MiMovPadron.Dni_referencia:=edtDNi_Referencia.text;
   MimovPadron.Tipomovimiento:=edtTipomovimiento.Text;
   MimovPadron.SubTipoMov :=edtSubTipoMov .Text;
   MimovPadron.Dni_tecnico:=edtDni_tecnico.Text;
   MiMovPadron.Nro_informe:=edtNroInforme.Text;
   MimovPadron.Observaciones_1:=edtObservaciones_1.Text;
   MimovPadron.Observaciones_2:=edtObservaciones_2.Text;
   MimovPadron.Observaciones_3:=edtObservaciones_3.Text;
   MimovPadron.imagen1:=edtimagen1.Text;
   MimovPadron.imagen2:=edtimagen2.Text;
   MimovPadron.cambioTitularidad:=booleanToString10(chkCambioTitularidad.Checked);
   MimovPadron.DNI_refConyuge:=lblDNI_refConyuge.Caption;
   MimovPadron.IDMovReferencia:=lblIDMovReferencia.Caption;
   MimovPadron.TituloPath := lblTituloPath.Caption;
   MimovPadron.TituloTipo := cbbTituloTipo.Text;
   MimovPadron.TituloDescripcion := edtTituloDescripcion.Text;

  if editar=0 then // nuevos datos INSERT
      MimovPadron.insertar
  else
      begin
        MimovPadron.FECHAACTUALIZACION:=DateToStr(now);
        MimovPadron.HORAACTUALIZACION:=GetTime24;
        MimovPadron.actualizar('Idmovpadron',idtabla);
      end;
   MimovPadron.Free;

   if TRUE then
    begin
    // Guardar datos alternos
    //-------------------------------------------------------------

     MiPersona:=TPersona.Create;
     // ahora data complementaria
     //titular desde persona
        MiPersona.Dni:=edtDni_Titular.Text;
        MiPersona.Nombre:=self.edtNombreTitular.Text;
        MiPersona.Appaterno:=self.edtApPaterno.Text;
        MiPersona.Apmaterno:=self.edtApMaterno.Text;
        MiPersona.Fecnac:=self.edtFecNac.Text;
        MiPersona.Sexo:=self.cbsexo.Text;
        MiPersona.Etnia:=self.edtetnia.Text;
        MiPersona.Lengua:=self.edtlengua.Text;
      MiPersona.insertar_actualizar;
      MiPersona.Free;

     if edtDni_conyuge.Text<>'' then
      begin
       MiPersona:=TPersona.Create;
       //conyuge desde persona
          MiPersona.Dni:=edtDni_conyuge.Text;
          MiPersona.Nombre:=self.edtConyNombre.Text;
          MiPersona.Appaterno:=self.edtConyApPaterno.text;
          MiPersona.Apmaterno:=self.edtConyApMaterno.text;
          MiPersona.Fecnac:=self.edtFecNacCy.Text;
          MiPersona.Sexo:=self.cbConysexo.Text;
          MiPersona.Etnia:=self.edtConyetnia.Text;
          MiPersona.Lengua:=self.edtConylengua.Text;
          MiPersona.insertar_actualizar;
       MiPersona.Free;
      end;

     if edtDni_autoridad.Text<>'' then
      begin
       MiPersona:=TPersona.Create;
       //autoridad
          MiPersona.Dni:=edtDni_autoridad.Text;
          MiPersona.Nombre:=self.edtAutNombre.Text;
          MiPersona.Appaterno:=self.edtAutApPaterno.text;
          MiPersona.Apmaterno:=self.edtAutApMaterno.text;
          MiPersona.Telefono:=Self.edtAutTelefono.Text;
          MiPersona.insertar_actualizar;
       MiPersona.Free;

       MiAutoridad:=TAutoridad.create;
          MiAutoridad.dni:=edtDni_autoridad.Text;
          MiAutoridad.Idcaserio:=edtIdcaserio.Text;
          MiAutoridad.Cargo:=self.edtAutCargo.Text;
          MiAutoridad.Resolucion:=self.edtAutResolucion.Text;
          MiAutoridad.Fecha:=self.edtAutFecha.Text;
          MiAutoridad.telefono:=Self.edtAutTelefono.Text;
          MiAutoridad.insertar_actualizar;
       MiAutoridad.free;
      end;

     //caserio
     MiCaserio := TCaserio.Create;
        MiCaserio.Idcaserio:=edtIdcaserio.text;
        MiCaserio.Ambito:=edtambito.Text;
        MiCaserio.Departamento:=edtdepartamento.Text;
        MiCaserio.Provincia:=edtprovincia.Text;
        MiCaserio.Distrito:=edtdistrito.Text;
        MiCaserio.Caserio:=edtcaserio.Text;
        MiCaserio.insertar_actualizar;
     Micaserio.Free;

     //referencia
     //edtNombreReferencia.Text:=recuperanombre(edtDni_referencia.Text,' ');

     //actividad
     if editar<>0 then
        EjecutaSQL('delete FROM MOVPADRONACTIVIDAD a where a.Idmovpadron="'+edtidmovpadron.Text+'";',true);

     MiMovPadronActividad:=TMovPadronActividad.create;
     for i:=1 to Rejilla.RowCount do
       begin
        if (Rejilla.Cells[2,i]<>'') or
           (Rejilla.Cells[3,i]<>'') then
           begin
             MiMovPadronActividad.Idmovpadron:=edtidmovpadron.Text;
             MiMovPadronActividad.Idactividad:=Rejilla.Cells[0,i];
             MiMovPadronActividad.Idetapa:=Rejilla.Cells[1,i];
             MiMovPadronActividad.Has:=Rejilla.Cells[2,i];
             MiMovPadronActividad.Has_mov:=Rejilla.Cells[3,i];
             MiMovPadronActividad.Coorx:=Rejilla.Cells[4,i];
             MiMovPadronActividad.Coory:=Rejilla.Cells[5,i];
             MiMovPadronActividad.Altitud:=Rejilla.Cells[6,i];
             MiMovPadronActividad.Anio_instalacion:=Rejilla.Cells[7,i];
             MiMovPadronActividad.Orden:=Stri(i);
             MiMovPadronActividad.insertar;
           end;
       end;
     MiMovPadronActividad.Free;

     //imagenes

     ShowMessage('Guardado con exito...');

     btnlimpiarclick(nil);
     close;
     FrmmovPadron.btnActualizarClick(nil);
    end
   Else
     ShowMessage('Errores al guardar, verifique...');
  end;
end;

procedure TFrmDatosmovPadron.btnSalirClick(Sender: TObject);
 begin
   close;
 end;

procedure TFrmDatosmovPadron.btnsubirimagen1Click(Sender: TObject);
begin
  if not DirectoryExists(Workdir+'\images\'+DataGlobal.vIdAdenda+'\') then
    CreateDir(Workdir+'\images\'+DataGlobal.vIdAdenda+'\');
  nroArchivo:=1;
  UniFileUpload1.Execute;
end;

procedure TFrmDatosmovPadron.btnsubirimagen2Click(Sender: TObject);
begin
  if not DirectoryExists(Workdir+'\images\'+DataGlobal.vIdAdenda+'\') then
    CreateDir(Workdir+'\images\'+DataGlobal.vIdAdenda+'\');
  nroArchivo:=2;
  UniFileUpload1.Execute;
end;

procedure TFrmDatosmovPadron.btnSubirTituloClick(Sender: TObject);
begin
  {if not DirectoryExists(Workdir+'\titulos\') then
    CreateDir(Workdir+'\titulos\');
  UniFileUpload2.Execute;}
  if LENGTH(EDTdNI_TITULAR.Text)<>8 then
   BEGIN
     sHOWMESSAGE('Se requiere DNI Titular valido');
     exit;
   END;

  FrmSubirTitulo.ShowModal(
     procedure (Sender: TComponent; Res:Integer)
        begin
          if dataGlobal.Vdato4='ok' then
           begin
            lblTituloPath.Caption:=dataglobal.Vdato1;
            cbbTituloTipo.Text:=dataglobal.Vdato2;
            edtTituloDescripcion.Text:=dataglobal.Vdato3;
            if FileExists(Workdir+'\titulos\'+lblTituloPath.Caption) then
              begin
                 imgTituloPDF.Picture.LoadFromFile(workdir+'\pdf.jpg');
              end
            Else
              imgTituloPDF.Picture.Assign(nil);
           end;
        end
   );
  dataGlobal.Vdato4:='';
  FrmSubirTitulo.es_mov:='SI';
  FrmSubirTitulo.dni_titular:=EDTdNI_TITULAR.Text;
  FrmSubirTitulo.lblTituloPath.Caption:=lblTituloPath.Caption;
  FrmSubirTitulo.cbbTituloTipo.Text:=cbbTituloTipo.Text;
  FrmSubirTitulo.edtTituloDescripcion.Text:=edtTituloDescripcion.Text;
end;

procedure TFrmDatosmovPadron.btnPreparaRejillaClick(Sender: TObject);
var i : smallint;
begin
    edtsubtipomov.Clear;
    if edtTipoMovimiento.Items.Count<=0 then
     begin
       ActivaDM1ConsultaSQL('select distinct TIPOMOVIMIENTO from movimientos order by orden',true);
       for i:=1 To DM1.ConsultaSQL.RecordCount do
         begin
           if i>1 then Dm1.ConsultaSQL.Next;
           edtTipoMovimiento.Items.Add(DM1.ConsultaSQL.Fields[0].AsString);
         end;
       Dm1.ConsultaSQL.Close;
     end;
    edtsubtipomov.ItemIndex:=-1;
    edtTipoMovimiento.Itemindex:=-1;

    //h:=ValI(10);

    if Rejilla.ColCount=8 then
      BEGIN
        for i:=1 to Rejilla.RowCount do
         begin
            Rejilla.Cells[2,i]:='';  //hAS OR
            Rejilla.Cells[3,i]:='';  //h
            Rejilla.Cells[4,i]:='';  //x
            Rejilla.Cells[5,i]:='';  //y
            Rejilla.Cells[6,i]:='';  //z
            Rejilla.Cells[7,i]:='';  //ins
            //Rejilla.RowHeights[i-1]:=h;
         end;
      END
    ELSE
      BEGIN
        Rejilla.ColCount:=8;
        ActivaDM1ConsultaSQL('select a.IDACTIVIDAD,a.IDETAPA '+
        'from ACTIVIDADETAPA a '+
        'order by a.IDACTIVIDAD,a.ORDEN ',true);
        Rejilla.rowCount:=DM1.ConsultaSQL.RecordCount+1;
        for i:=1 to DM1.ConsultaSQL.RecordCount do
         begin
            if i>1 then DM1.ConsultaSQL.Next;
            Rejilla.Cells[0,i]:=DM1.ConsultaSQL.Fields[0].AsString;
            Rejilla.Cells[1,i]:=DM1.ConsultaSQL.Fields[1].AsString;
            Rejilla.Cells[2,i]:='';  //hAS OR
            Rejilla.Cells[3,i]:='';  //h
            Rejilla.Cells[4,i]:='';  //x
            Rejilla.Cells[5,i]:='';  //y
            Rejilla.Cells[6,i]:='';  //z
            Rejilla.Cells[7,i]:='';  //ins
            //Rejilla.RowHeights[i-1]:=h;
         end;
         DM1.ConsultaSQL.Close;
      END;

    Rejilla.Cells[0,0]:='ACTIVIDAD';
    Rejilla.Cells[1,0]:='ETAPA';
    Rejilla.Cells[2,0]:='HAS';
    Rejilla.Cells[3,0]:='HAS_MOV';
    Rejilla.Cells[4,0]:='COOR_X';
    Rejilla.Cells[5,0]:='COOR_Y';
    Rejilla.Cells[6,0]:='ALTURA';
    Rejilla.Cells[7,0]:='AÑO_INST';

    //Rejilla.RowCount:=1;
    Rejilla.ColWidths[0]:=64;
    Rejilla.ColWidths[1]:=70;
    Rejilla.ColWidths[2]:=50;
    Rejilla.ColWidths[3]:=60;
    Rejilla.ColWidths[4]:=70;
    Rejilla.ColWidths[5]:=70;
    Rejilla.ColWidths[6]:=50;
    Rejilla.ColWidths[7]:=60;
end;

procedure TFrmDatosmovPadron.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
var
  DestName : string;
  DestFolder : string;
  n : string;
begin
   randomize;
   n:=dateTostr(now)+'-'+timetostr(now)+'_r'+StrI(random(100)+1);
   n:=strCom(n,'/','_');
   n:=strcom(n,':','_');
   n:=strcom(n,'.','');
   n:=strcom(n,' ','');
   n:=n+'.jpg';
   DestFolder:=Workdir+'\images\'+DataGlobal.vIdAdenda+'\';

   case nroArchivo of
     1 : begin
          UniImage1.Picture.LoadFromFile(AStream.FileName);
          edtimagen1.Text:=n;
          DestName:=DestFolder+edtimagen1.Text;
         end;
     2 : begin
          UniImage2.Picture.LoadFromFile(AStream.FileName);
          edtimagen2.Text:=n;
          DestName:=DestFolder+edtimagen2.Text;
         end;
   end;
   CopyFile(PChar(AStream.FileName), PChar(DestName), False);
   ShowMessage('Imagen cargada con exito...');
end;

procedure TFrmDatosmovPadron.UniFormShow(Sender: TObject);
begin
  color:=ColorFormulario;
  Caption:='Movimientos '+DataGlobal.VidAdenda;
  btnPreparaRejillaClick(NIL);
  if cbbtitulotipo.Items.Count<=0 then
   cbbtitulotipo.Items.LoadFromFile(workdir+'\titulos.ini');

  if lbltipoUsuario.caption='ADMIN' then
   begin
     edtDNI_Tecnico.enabled:=true;
     edtNombreTecnico.Enabled:=true;
   end
  else
   begin
     //edtDNI_Tecnico.enabled:=false;
     //edtNombreTecnico.Enabled:=false;
     edtDNI_Tecnico.enabled:=true;
     edtNombreTecnico.Enabled:=true;
   end;

  if editar=1 then cargardatos;

end;

procedure TFrmDatosmovPadron.cargardatos;
var MimovPadron : TmovPadron;  i,j : smallint;
    MiPersona : TPersona;
    MiAutoridad : TAutoridad;
    MiCaserio : TCaserio;
 begin

   MimovPadron := TmovPadron.create;
   MimovPadron.ObtenerRegistro('Idmovpadron',idtabla);
       edtIdadenda.text:=MimovPadron.Idadenda;
       edtIdmovpadron.text:=MimovPadron.Idmovpadron;
       edtNro.text:=MimovPadron.Nro;
       edtIdcaserio.text:=MimovPadron.Idcaserio;
       edtDni_titular.text:=MimovPadron.Dni_titular;
       edtTelefono.text:=MimovPadron.Telefono;
       edtDni_conyuge.text:=MimovPadron.Dni_conyuge;
       edtDni_autoridad.Text:=MimovPadron.Dni_autoridad;

       edtTipomovimiento.ItemIndex:=edtTipomovimiento.Items.IndexOf( MimovPadron.Tipomovimiento );
       edtTipomovimientoChange(nil);
       edtsubtipomov.ItemIndex:=edtsubtipomov.Items.IndexOf(MimovPadron.subtipomov);
       edtsubtipomovChange(nil);
       chkCambioTitularidad.Checked:=StringToboolean10(MimovPadron.cambioTitularidad);

       edtDni_referencia.Text:=MimovPadron.Dni_referencia;
       lblDNI_refConyuge.Text:=MimovPadron.DNI_refConyuge;
       lblIDMovReferencia.Caption:=MimovPadron.IDMovReferencia;

       edtDni_tecnico.text:=MimovPadron.Dni_tecnico;
       edtNroinforme.text:=Mimovpadron.Nro_informe;
       edtObservaciones_1.text:=MimovPadron.Observaciones_1;
       edtObservaciones_2.text:=MimovPadron.Observaciones_2;
       edtObservaciones_3.text:=MimovPadron.Observaciones_3;

       edtimagen1.text:=MimovPadron.imagen1;
       if fileexists(workdir+'\images\'+edtIdadenda.text+'\'+edtimagen1.text) then
        begin
         if IsJpegFile(workdir+'\images\'+edtIdadenda.text+'\'+edtimagen1.text) then
            UniImage1.Picture.LoadFromFile(workdir+'\images\'+edtIdadenda.text+'\'+edtimagen1.text)
         else
            Showmessage('No se puede cargar '+workdir+'\images\'+edtIdadenda.text+'\'+edtimagen1.text);
        end;

       edtimagen2.text:=MimovPadron.imagen2;
       if fileexists(workdir+'\images\'+edtIdadenda.text+'\'+edtimagen2.text) then
        begin
         if IsJpegFile(workdir+'\images\'+edtIdadenda.text+'\'+edtimagen2.text) then
            UniImage2.Picture.LoadFromFile(workdir+'\images\'+edtIdadenda.text+'\'+edtimagen2.text)
         else
            Showmessage('No se puede cargar '+workdir+'\images\'+edtIdadenda.text+'\'+edtimagen2.text);
        end;

        //2025 titulos
        lblTituloPath.Caption:= MimovPadron.TituloPath;
        cbbTituloTipo.Text := MimovPadron.TituloTipo;
        edtTituloDescripcion.Text := MimovPadron.TituloDescripcion;

        if lblTituloPath.Caption<>'' then
          if fileexists(workdir+'\Titulos\'+lblTituloPath.Caption) then
            imgTituloPDF.Picture.LoadFromFile(workdir+'\pdf.jpg');

   MimovPadron.Free;

   //-------------------------------------------------------------

  MiPersona:=TPersona.Create;
   // ahora data complementaria
   //titular desde persona
     MiPersona.ObtenerRegistro('DNI',edtDni_titular.text);
     self.edtNombreTitular.Text:=MiPersona.Nombre;
     self.edtApPaterno.Text:=MiPersona.Appaterno;
     self.edtApMaterno.Text:=MiPersona.Apmaterno;
     self.edtFecNac.Text:=MiPersona.Fecnac;
     self.cbsexo.Text:=MiPersona.Sexo;
     self.edtetnia.Text:=MiPersona.Etnia;
     self.edtlengua.Text:=MiPersona.Lengua;


   //conyuge desde persona
    MiPersona.ObtenerRegistro('DNI',edtDni_conyuge.Text );
    self.edtConyNombre.Text:=MiPersona.Nombre;
    self.edtConyApPaterno.text:=MiPersona.Appaterno;
    self.edtConyApMaterno.text:=MiPersona.Apmaterno;
    self.edtFecNacCy.Text:=MiPersona.Fecnac;
    self.cbConysexo.Text:=MiPersona.Sexo;
    self.edtConyetnia.Text:=MiPersona.Etnia;
    self.edtConylengua.Text:=MiPersona.Lengua;

   //autoridad
    MiPersona.ObtenerRegistro('DNI',edtDni_autoridad.Text );
    self.edtAutNombre.Text:=MiPersona.Nombre;
    self.edtAutApPaterno.text:=MiPersona.Appaterno;
    self.edtAutApMaterno.text:=MiPersona.Apmaterno;
   MiPersona.Free;

   MiAutoridad:=TAutoridad.create;
      MiAutoridad.ObtenerRegistro('DNI',edtDni_autoridad.Text,'ESTADO','1');
      self.edtAutCargo.Text:=MiAutoridad.Cargo;
      self.edtAutResolucion.Text:=MiAutoridad.Resolucion;
      self.edtAutFecha.Text:=MiAutoridad.Fecha;
      Self.edtAutTelefono.text:=MiAutoridad.telefono;
    MiAutoridad.free;

   //caserio
   MiCaserio := TCaserio.Create;
   MiCaserio.ObtenerRegistro('idcaserio',edtIdcaserio.text);
     edtambito.Text:=MiCaserio.Ambito;
     edtdepartamento.Text:=MiCaserio.Departamento;
     edtprovincia.Text:=MiCaserio.Provincia;
     edtdistrito.Text:=MiCaserio.Distrito;
     edtcaserio.Text:=MiCaserio.Caserio;
   Micaserio.Free;

   //referencia
   edtNombreReferencia.Text:=recuperanombre(edtDni_referencia.Text,' ');

   //actividad
   ActivaDM1ConsultaSQL('select a.IDACTIVIDAD,a.IDETAPA, '+
            'a.HAS, a.HAS_MOV,a.COORX, a.COORY, a.ALTITUD,a.ANIO_INSTALACION '+
            'from MOVPADRONACTIVIDAD a where a.idmovpadron="'+edtIdmovpadron.text+'" '+
            'order by a.IDACTIVIDAD,a.ORDEN ',true);
             for j:=1 to DM1.ConsultaSQL.RecordCount do
             begin
                if j>1 then DM1.ConsultaSQL.Next;
                for i:=0 to Rejilla.RowCount do
                 begin
                    if (Rejilla.Cells[0,i]=DM1.ConsultaSQL.Fields[0].AsString) and
                       (Rejilla.Cells[1,i]=DM1.ConsultaSQL.Fields[1].AsString) then
                       begin
                         Rejilla.Cells[2,i]:=DM1.ConsultaSQL.Fields[2].AsString;
                         Rejilla.Cells[3,i]:=DM1.ConsultaSQL.Fields[3].AsString;
                         Rejilla.Cells[4,i]:=DM1.ConsultaSQL.Fields[4].AsString;
                         Rejilla.Cells[5,i]:=DM1.ConsultaSQL.Fields[5].AsString;
                         Rejilla.Cells[6,i]:=DM1.ConsultaSQL.Fields[6].AsString;
                         Rejilla.Cells[7,i]:=DM1.ConsultaSQL.Fields[7].AsString;
                       end;
                 end;
             end;
             DM1.ConsultaSQL.Close;

   //imagenes


   //nombre tecnico
   edtNombreTecnico.Text:=recuperanombre(edtDni_tecnico.Text,' ');

   edtDni_titular.enabled:=false;
   btnBuscaDNI.Enabled:=false;
   chknroinforme.Enabled:=false;
   chknroinforme.Checked:=false;

   btnBuscaDNI.Enabled:=false;
   caption:='Editar';
   editar:=1;
 end;

procedure TFrmDatosmovPadron.edtDni_AutoridadKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=13 then btnBuscaAutoridadClick(nil);
end;

procedure TFrmDatosmovPadron.edtDni_conyugeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then btnBuscaConyugeClick(nil);
end;

procedure TFrmDatosmovPadron.edtDNI_ReferenciaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then btnbuscareferenciaClick(nil);
end;

procedure TFrmDatosmovPadron.edtDni_tecnicoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if length(edtDni_Tecnico.Text)=8 then
    edtNombreTecnico.Text := recuperanombre(edtDNI_Tecnico.Text,' ');
end;

procedure TFrmDatosmovPadron.edtDni_titularKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
     btnBuscaDNIClick(nil);
end;

procedure TFrmDatosmovPadron.edtIdcaserioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then btnBuscaCaserioClick(nil);

end;

procedure TFrmDatosmovPadron.edtsubtipomovChange(Sender: TObject);
var s : string;
begin                            //0           1         2      3         4                    5
  ActivaDM1ConsultaSQL('select referencia,operacion,mayorque,limite,solo_has_en_uso,jalar_datos_referencia '+
  'from movimientos '+
  'where tipomovimiento="'+edtTipoMovimiento.Text+'" and subtipomov="'+edtSubTipoMov.Text+'"',true);
  voperacion:=Dm1.ConsultaSQL.Fields[1].AsString;
  vmayorque:= Dm1.ConsultaSQL.Fields[2].AsString;
  vlimite:=Dm1.ConsultaSQL.Fields[3].AsString;
  Vsolo_has_en_uso:=Dm1.ConsultaSQL.Fields[4].AsString;
  vjalar_datos_referencia:=Dm1.ConsultaSQL.Fields[4].AsString;

  // HACE VISUAL LA REFERENCIA
  if Dm1.ConsultaSQL.Fields[0].AsString='SI' Then
   begin
    lblBuscaReferencia.Visible:=true;
    btnBuscaReferencia.Visible:=true;
    EdtDNI_referencia.Visible:=true;
    EdtNombrereferencia.Visible:=true;
   end
  else
   begin
    lblBuscaReferencia.Visible:=False;
    btnBuscaReferencia.Visible:=False;
    EdtDNI_referencia.Visible:=False;
    EdtNombrereferencia.Visible:=False;
   end;
  Dm1.ConsultaSQL.Close;

  s:=trim(edtTipomovimiento.text)+'_'+trim(edtSubTipomov.Text)+'.TXT';
  //SHOWMESSAGE(WorkDir+'\Reportes\OBS1_'+S);
  if FileExists(WorkDir+'\Reportes\OBS1_'+S) then
   edtObservaciones_1.Items.LoadFromFile(WorkDir+'\Reportes\OBS1_'+S);

  if FileExists(WorkDir+'\Reportes\OBS2_'+S) then
   edtObservaciones_2.Items.LoadFromFile(WorkDir+'\Reportes\OBS2_'+S);

  if FileExists(WorkDir+'\Reportes\JUS1_'+S) then
   edtObservaciones_3.Items.LoadFromFile(WorkDir+'\Reportes\JUS1_'+S);

end;

procedure TFrmDatosmovPadron.edtTipomovimientoChange(Sender: TObject);
var i : Smallint;
begin
  edtSubTipoMov.Items.Clear;
  if edtTipomovimiento.ItemIndex>-1 then
   begin
       ActivaDM1ConsultaSQL('select subtipomov from movimientos where tipomovimiento="'+edtTipoMovimiento.Text+'" order by orden',true);
       for i:=1 To DM1.ConsultaSQL.RecordCount do
         begin
           if i>1 then Dm1.ConsultaSQL.Next;
           edtSubTipoMov.Items.Add(DM1.ConsultaSQL.Fields[0].AsString);
         end;
       Dm1.ConsultaSQL.Close;
       edtSubTipoMov.ItemIndex:=-1;
       lblBuscaReferencia.Visible:=False;
       btnBuscaReferencia.Visible:=False;
       EdtDNI_referencia.Visible:=False;
       EdtNombrereferencia.Visible:=False;
       voperacion:='';
       vmayorque:='';
       vlimite:='';
       vsolo_has_en_uso:='';
   end;
   edtObservaciones_1.Items.clear;
   edtObservaciones_2.Items.clear;
   edtObservaciones_3.Items.clear;
end;

procedure TFrmDatosmovPadron.nuevosdatos;
 begin
    btnLimpiarClick(nil);
    editar:=0;
    caption:='Nuevo';
 end;

end.

