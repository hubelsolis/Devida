unit uFrmDatosAdenda;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniEdit, uniLabel, uniMultiItem, uniComboBox
;

type
  TFrmDatosAdenda = class(TUniForm)
    lblIdadenda: TUnilabel;
    lblNombre: TUnilabel;
    lblTipo: TUnilabel;
    lblDocumento: TUnilabel;
    lblFecha: TUnilabel;
    edtIdadenda: TUniEdit;
    edtNombre: TUniEdit;
    edtTipo: TUniEdit;
    edtAdendaAnterior: TUniEdit;
    edtFecha: TUniEdit;
    btnLimpiar: TUniBitBtn;
    btnGuardar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    edtestado: TUniComboBox;
    UniLabel1: TUniLabel;
    edtsellado: TUniComboBox;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    edtNroAdenda: TUniEdit;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    editar : byte;
    idtabla : string;
    procedure nuevosdatos;
    procedure cargardatos;
  end;

function FrmDatosAdenda: TFrmDatosAdenda;

implementation
{$R *.dfm}

 uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,UDBModulo,uModeloAdenda,
  uFrmAdenda,uniguiUsqlUtils;

 function FrmDatosAdenda: TFrmDatosAdenda;
  begin
    Result := TFrmDatosAdenda(UniMainModule.GetFormInstance(TFrmDatosAdenda));
  end;

procedure TFrmDatosAdenda.btnLimpiarClick(Sender: TObject);
 begin
    edtIdadenda.text:='';
    edtNombre.text:='';
    edtTipo.text:='';
    edtAdendaAnterior.text:='';
    edtFecha.text:='';
    edtestado.Text:='';
    editar:=0;
    edtsellado.ItemIndex:=0;
    idtabla:='';
    edtNroAdenda.Text:='';
 end;

procedure TFrmDatosAdenda.btnGuardarClick(Sender: TObject);
var
    guardado : boolean;
    MiAdenda : TAdenda;
 begin
  //validaciones
  edtfecha.Text := DatetoStr(ValidaFecha(edtfecha.Text));

  if edtTipo.text='' then edtTipo.text:='00';

  if (edtIdadenda.Text='') or (edtNombre.Text='')  then
   begin
     Showmessage('Se requiere un Id Adenda');
     exit;
   end;

  if (length(edtNombre.text)=0) or (false) then
    begin
      Showmessage('Se requiere de datos de Adenda');
      exit;
    end;

  MiAdenda:=TAdenda.Create;

  if editar=0 then
   begin
      if MiAdenda.Buscar('Idadenda',edtIdadenda.text) then
       begin
         MiAdenda.free;
         Showmessage('Id Adenda ya existe');
         exit;
       end;
   end;

  if MessageDlg('Esta seguro de guardar...', mtConfirmation, mbYesNo) = mrNo then
    begin
      MiAdenda.free;
      exit;
    end;

   Guardado:=false;
   MiAdenda.Idadenda:=edtIdadenda.Text;
   MiAdenda.Nombre:=edtNombre.Text;
   MiAdenda.Tipo:=edtTipo.Text;
   MiAdenda.Nro:=edtNroAdenda.Text;
   MiAdenda.Adenda_Anterior:=edtAdendaAnterior.Text;
   MiAdenda.Fecha:=edtFecha.Text;
   MiAdenda.estado:=edtEstado.Text;
   MiAdenda.sellado:=StrI( edtsellado.ItemIndex );

    if editar=0 then // nuevos datos INSERT
        Guardado:=MiAdenda.insertar
    else
      begin
        if edtEstado.Text='ACTIVO' then
            EjecutaSQL('UPDATE ADENDA SET ESTADO="INACTIVO"',true);
        Guardado:=MiAdenda.actualizar('idadenda',idtabla);
      end;

    MiAdenda.Free;

     if Guardado then
      begin
       ShowMessage('Guardado con exito...');
       btnlimpiarclick(nil);
       close;
       FrmAdenda.btnActualizarClick(nil);
      end
     Else
       ShowMessage('Errores al guardar, verifique...');
 end;

procedure TFrmDatosAdenda.btnSalirClick(Sender: TObject);
 begin
   close;
 end;

procedure TFrmDatosAdenda.UniFormShow(Sender: TObject);
begin
  color:=ColorFormulario
end;

procedure TFrmDatosAdenda.cargardatos;
var MiAdenda : TAdenda;
 begin
   MiAdenda := TAdenda.create;
   MiAdenda.ObtenerRegistro('Idadenda',idtabla);
       edtIdadenda.text:=MiAdenda.Idadenda;
       edtNombre.text:=MiAdenda.Nombre;
       edtTipo.text:=MiAdenda.Tipo;
       edtAdendaAnterior.text:=MiAdenda.Adenda_Anterior;
       edtFecha.text:=MiAdenda.Fecha;
       edtEstado.text:=MiAdenda.estado;
       edtSellado.ItemIndex:=ValI(MiAdenda.sellado);
       edtNroAdenda.Text:=MiAdenda.Nro;
   MiAdenda.Free;
   caption:='Editar';
   editar:=1;
 end;

procedure TFrmDatosAdenda.nuevosdatos;
 begin
    btnLimpiarClick(nil);
    editar:=0;
    caption:='Nuevo';
 end;

end.


