unit uFrmDatosmovimientos;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uniBasicGrid,
  uniDBGrid, uniPanel, uniEdit, uniLabel, uniMultiItem, uniComboBox
;

type
  TFrmDatosmovimientos = class(TUniForm)
    lblTipomovimiento: TUnilabel;
    lblSubtipomov: TUnilabel;
    lblOperacion: TUnilabel;
    lblReferencia: TUnilabel;
    lblOrden: TUnilabel;
    edtTipomovimiento: TUniEdit;
    edtSubtipomov: TUniEdit;
    edtOrden: TUniEdit;
    btnLimpiar: TUniBitBtn;
    btnGuardar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    edtOperacion: TUniComboBox;
    edtReferencia: TUniComboBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    edtSolo_has_en_uso: TUniComboBox;
    UniLabel4: TUniLabel;
    edtMayorque: TUniComboBox;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    edtLimite: TUniEdit;
    edtJalar_Datos_referencia: TUniComboBox;
    UniLabel7: TUniLabel;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    editar : byte;
    idtabla,idtabla2 : string;
    procedure nuevosdatos;
    procedure cargardatos;
  end;

function FrmDatosmovimientos: TFrmDatosmovimientos;

implementation
{$R *.dfm}

 uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,UDBModulo,uModelomovimientos,
  uFrmmovimientos;

 function FrmDatosmovimientos: TFrmDatosmovimientos;
  begin 
    Result := TFrmDatosmovimientos(UniMainModule.GetFormInstance(TFrmDatosmovimientos));
  end;

procedure TFrmDatosmovimientos.btnLimpiarClick(Sender: TObject);
 begin
    edtTipomovimiento.text:='';
    edtSubtipomov.text:='';
    edtOperacion.text:='';
    edtSolo_has_en_uso.Text:='';
    edtMayorque.Text:='';
    edtLimite.Text:='';
    edtReferencia.text:='';
    edtOrden.text:='';
    edtJalar_Datos_referencia.Text:='';
    editar:=0;
    idtabla:='';
 end;

procedure TFrmDatosmovimientos.btnGuardarClick(Sender: TObject);
var 
    guardado : boolean;
    Mimovimientos : Tmovimientos;
 begin
  //validaciones
  
  if (edtTipomovimiento.Text='')then 
   begin
     Showmessage('Se requiere un Tipomovimiento');
     exit;
   end;

  if (edtOperacion.Text='')then
   begin
     Showmessage('Se requiere una Operacion');
     exit;
   end;

  if (length(edtSubtipomov.text)=0) or (false) then
    begin
      Showmessage('Se requiere de datos de movimientos');
      exit;
    end;
  
  Mimovimientos:=Tmovimientos.Create;
  
  if editar=0 then
   begin
      if Mimovimientos.Buscar('Tipomovimiento',edtTipomovimiento.text,'subtipomov',edtSubtipoMov.Text) then
       begin
         Mimovimientos.free;  
         Showmessage('Tipomovimiento ya existe'); 
         exit;  
       end;  
   end;

  if MessageDlg('Esta seguro de guardar...', mtConfirmation, mbYesNo) = mrNo then 
    begin
      Mimovimientos.free;  
      exit;
    end;

   Guardado:=false;   
   Mimovimientos.Tipomovimiento:=edtTipomovimiento.Text; 
   Mimovimientos.Subtipomov:=edtSubtipomov.Text; 
   Mimovimientos.Operacion:=edtOperacion.Text;
   Mimovimientos.Solo_has_en_uso:=edtSolo_has_en_uso.Text;
   Mimovimientos.Mayorque:=edtMayorque.Text;
   Mimovimientos.Limite:=edtLimite.Text;
   Mimovimientos.Referencia:=edtReferencia.Text;
   Mimovimientos.Jalar_Datos_referencia:=edtJalar_Datos_referencia.Text;
   Mimovimientos.Orden:=edtOrden.Text;

    if editar=0 then // nuevos datos INSERT
        Guardado:=Mimovimientos.insertar 
    else
        Guardado:=Mimovimientos.actualizar('Tipomovimiento',idtabla,'subtipomov',Idtabla2);

    Mimovimientos.Free;

     if Guardado then
      begin 
       ShowMessage('Guardado con exito...');
       btnlimpiarclick(nil);
       close;
       Frmmovimientos.btnActualizarClick(nil);
      end
     Else
       ShowMessage('Errores al guardar, verifique...');
 end;

procedure TFrmDatosmovimientos.btnSalirClick(Sender: TObject);
 begin
   close;
 end;

procedure TFrmDatosmovimientos.UniFormShow(Sender: TObject);
begin
  color:=ColorFormulario
end;

procedure TFrmDatosmovimientos.cargardatos;
var Mimovimientos : Tmovimientos;
 begin
   Mimovimientos := Tmovimientos.create;
   Mimovimientos.ObtenerRegistro('Tipomovimiento',idtabla,'subtipomov',idtabla2);
       edtTipomovimiento.text:=Mimovimientos.Tipomovimiento;
       edtSubtipomov.text:=Mimovimientos.Subtipomov;
       edtOperacion.text:=Mimovimientos.Operacion;
       edtSolo_has_en_uso.Text:=mimovimientos.Solo_has_en_uso;
       edtMayorque.Text:=mimovimientos.mayorque;
       edtLimite.Text:=mimovimientos.limite;
       edtReferencia.text:=Mimovimientos.Referencia;
       edtJalar_Datos_referencia.Text:=Mimovimientos.Jalar_Datos_referencia;
       edtOrden.text:=Mimovimientos.Orden;
   Mimovimientos.Free;
   caption:='Editar';
   editar:=1;
 end;

procedure TFrmDatosmovimientos.nuevosdatos;
 begin
    btnLimpiarClick(nil);
    editar:=0;
    caption:='Nuevo';
 end;

end.

