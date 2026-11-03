unit uFrmDatosActividad;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniEdit, uniLabel, uniMultiItem, uniListBox, uniSpeedButton
;

type
  TFrmDatosActividad = class(TUniForm)
    lblIdactividad: TUnilabel;
    lblNombre: TUnilabel;
    lblTipoactividad: TUnilabel;
    edtIdactividad: TUniEdit;
    edtNombre: TUniEdit;
    edtTipoactividad: TUniEdit;
    btnLimpiar: TUniBitBtn;
    btnGuardar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    lstEtapas: TUniListBox;
    UniLabel1: TUniLabel;
    btnagregaetapa: TUniBitBtn;
    btnquitaetapa: TUniBitBtn;
    UniLabel2: TUniLabel;
    edtdni_coordinador: TUniEdit;
    lblcoordinador: TUniLabel;
    btnBusca: TUniSpeedButton;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnagregaetapaClick(Sender: TObject);
    procedure btnquitaetapaClick(Sender: TObject);
    procedure edtdni_coordinadorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaClick(Sender: TObject);
  private
    { Private declarations }
    procedure EtapaCallBack(Sender: TComponent; AResult:Integer; AText: string);
  public
    { Public declarations }
    editar : byte;
    idtabla : string;
    procedure nuevosdatos;
    procedure cargardatos;
  end;

function FrmDatosActividad: TFrmDatosActividad;

implementation
{$R *.dfm}

 uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,UDBModulo,uModeloActividad,
  uFrmActividad,uniguiusqlutils, uFrmDatospersona;

 function FrmDatosActividad: TFrmDatosActividad;
  begin 
    Result := TFrmDatosActividad(UniMainModule.GetFormInstance(TFrmDatosActividad));
  end;

procedure TFrmDatosActividad.btnLimpiarClick(Sender: TObject);
 begin
    edtIdactividad.text:='';
    edtIDActividad.enabled:=true;
    edtNombre.text:='';
    edtTipoactividad.text:='';
    editar:=0;
    idtabla:='';
    edtdni_coordinador.Text:='';
    lblcoordinador.caption:='';
    lstetapas.Clear;
 end;

procedure TFrmDatosActividad.btnquitaetapaClick(Sender: TObject);
begin
 if lstetapas.Items.Count>0 then
  begin
     if lstEtapas.ItemIndex>=0 then
            MessageDlg('Esta seguro de Eliminar '+lstEtapas.Items[lstEtapas.ItemIndex],
                mtConfirmation, [mbYes, mbNo],
                procedure(Sender: TComponent; Res: Integer)
                begin
                  case Res of
                    mrYes : begin
                                 lstEtapas.Items.Delete(lstEtapas.ItemIndex);
                            end;
                    mrNo :  begin
                            end;
                  end;
                end
                );
  end;
end;

procedure TFrmDatosActividad.btnagregaetapaClick(Sender: TObject);
begin
  Prompt('Ingrese la etapa', '', mtInformation, mbOKCancel, EtapaCallBack);
end;

procedure TFrmDatosActividad.EtapaCallBack(Sender: TComponent; AResult:Integer; AText: string);
begin
  if AResult = mrOK then
  begin
  if AText<>'' then
     lstEtapas.items.Add(AText);
  end;
end;

procedure TFrmDatosActividad.btnBuscaClick(Sender: TObject);
begin
  if length(edtdni_coordinador.text)=8 then
    begin
      lblcoordinador.caption:=trim(recuperanombre(edtdni_coordinador.text,' '));
      if (Sender=btnBusca) and (lblcoordinador.Caption='') then
       begin
         FrmDatospersona.btnLimpiarClick(nil);
         FrmDatospersona.edtdni.text:=edtdni_coordinador.text;
         FrmDatospersona.ShowModal;
       end;
    end
  else
    lblcoordinador.caption:='';
end;

procedure TFrmDatosActividad.btnGuardarClick(Sender: TObject);
var i : Smallint;
var 
    guardado : boolean;
    MiActividad : TActividad;
 begin
  //validaciones
  
  if (edtIdactividad.Text='')then 
   begin
     Showmessage('Se requiere un Idactividad');
     exit;
   end;

  if (length(edtNombre.text)=0) or (false) then
    begin
      Showmessage('Se requiere de datos de Actividad');
      exit;
    end;

  MiActividad:=TActividad.Create;
  
  if editar=0 then
   begin
      if MiActividad.Buscar('Idactividad',edtIdactividad.text) then 
       begin  
         MiActividad.free;  
         Showmessage('Idactividad ya existe'); 
         exit;  
       end;  
   end;

  if MessageDlg('Esta seguro de guardar...', mtConfirmation, mbYesNo) = mrNo then 
    begin
      MiActividad.free;  
      exit;
    end;

   Guardado:=false;   
   MiActividad.Idactividad:=edtIdactividad.Text; 
   MiActividad.Nombre:=edtNombre.Text; 
   MiActividad.Tipoactividad:=edtTipoactividad.Text;
   MiActividad.DNI_coordinador:=edtDNI_coordinador.Text;

    if editar=0 then // nuevos datos INSERT
       begin
          Guardado:=MiActividad.insertar
       end
    else
       begin
          Guardado:=MiActividad.actualizar('Idactividad',idtabla);
       end;

    MiActividad.Free;

    EjecutaSQL('delete from ACTIVIDADETAPA where IDACTIVIDAD="'+edtIdactividad.Text+'"',true);
    for i := 0 to LSTETAPAS.Items.Count-1 do
      EjecutaSQL('INSERT INTO ACTIVIDADETAPA (IDACTIVIDAD, IDETAPA,ORDEN) VALUES ('+
      '"'+edtIdactividad.Text+'","'+LstEtapas.Items[i]+'",'+STRI(I)+');',true);

     if Guardado then
      begin 
       ShowMessage('Guardado con exito...');
       btnlimpiarclick(nil);
       close;
       FrmActividad.btnActualizarClick(nil);
      end
     Else
       ShowMessage('Errores al guardar, verifique...');
 end;

procedure TFrmDatosActividad.btnSalirClick(Sender: TObject);
 begin
   close;
 end;

procedure TFrmDatosActividad.UniFormShow(Sender: TObject);
begin
  color:=ColorFormulario
end;

procedure TFrmDatosActividad.cargardatos;
var MiActividad : TActividad;
  i: Integer;
 begin
   MiActividad := TActividad.create;
   MiActividad.ObtenerRegistro('Idactividad',idtabla);
       edtIdactividad.text:=MiActividad.Idactividad;
       edtNombre.text:=MiActividad.Nombre;
       edtTipoactividad.text:=MiActividad.Tipoactividad;
       edtDNI_coordinador.Text:=MiActividad.DNI_coordinador;
   MiActividad.Free;
   ActivaDM1ConsultaSQL('SELECT a.IDETAPA FROM ACTIVIDADETAPA a where a.IDACTIVIDAD="'+idtabla+'" order by ORDEN',TRUE);
   for i := 1 to DM1.ConsultaSQL.RecordCount do
    begin
      if i>1 then DM1.ConsultaSQL.Next;
      lstEtapas.Items.Add(DM1.ConsultaSQL.Fields[0].AsString);
    end;
   edtIdActividad.enabled:=False;
   caption:='Editar';
   editar:=1;
 end;

procedure TFrmDatosActividad.edtdni_coordinadorKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btnBuscaClick(nil);
end;

procedure TFrmDatosActividad.nuevosdatos;
 begin
    btnLimpiarClick(nil);
    editar:=0;
    caption:='Nuevo';
 end;

end.

