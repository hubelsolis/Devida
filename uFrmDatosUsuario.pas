unit uFrmDatosUsuario;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniEdit, uniLabel, uniMultiItem, uniComboBox, uniSpeedButton, uniListBox
;

type
  TFrmDatosUsuario = class(TUniForm)
    lblDni: TUnilabel;
    lblUsuario: TUnilabel;
    lblClave: TUnilabel;
    lblTipousuario: TUnilabel;
    lblPermisos: TUnilabel;
    lblEstado: TUnilabel;
    edtDni: TUniEdit;
    edtUsuario: TUniEdit;
    edtClave: TUniEdit;
    edtPermisos: TUniEdit;
    edtEstado: TUniEdit;
    btnLimpiar: TUniBitBtn;
    btnGuardar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    lblnombre: TUniLabel;
    edtTipousuario: TUniComboBox;
    lista: TUniListBox;
    UniLabel1: TUniLabel;
    btnmas: TUniSpeedButton;
    btnmenos: TUniSpeedButton;
    UniLabel2: TUniLabel;
    edtCargo: TUniEdit;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure edtDniKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnmenosClick(Sender: TObject);
    procedure btnmasClick(Sender: TObject);
    procedure obtenerdato(Sender: TComponent; Res: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    editar : byte;
    idtabla : string;
    procedure nuevosdatos;
    procedure cargardatos;
  end;

function FrmDatosUsuario: TFrmDatosUsuario;

implementation
{$R *.dfm}

 uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,UDBModulo,uModeloUsuario,
  uFrmUsuario,uniguiusqlutils, ufrmbuscador, udataglobal;

 function FrmDatosUsuario: TFrmDatosUsuario;
  begin 
    Result := TFrmDatosUsuario(UniMainModule.GetFormInstance(TFrmDatosUsuario));
  end;

procedure TFrmDatosUsuario.btnLimpiarClick(Sender: TObject);
 begin
    edtDni.text:='';
    edtUsuario.text:='';
    edtClave.text:='';
    edtTipousuario.text:='';
    edtPermisos.text:='';
    edtEstado.text:='';
    editar:=0;
    idtabla:='';
    lblnombre.Caption:='';
    edtcargo.text:='';
    lista.Clear;
 end;

procedure TFrmDatosUsuario.btnGuardarClick(Sender: TObject);
var 
    guardado : boolean;
    MiUsuario : TUsuario;
    i : smallint;
 begin
  //validaciones
  
  if (edtDni.Text='')then 
   begin
     Showmessage('Se requiere un Dni');
     exit;
   end;

  if (length(edtUsuario.text)=0) or (false) then
    begin
      Showmessage('Se requiere de datos de Usuario');
      exit;
    end;
  
  MiUsuario:=TUsuario.Create;
  
  if editar=0 then
   begin
      if MiUsuario.Buscar('Dni',edtDni.text) then 
       begin  
         MiUsuario.free;  
         Showmessage('Dni ya existe'); 
         exit;  
       end;  
   end;

  if MessageDlg('Esta seguro de guardar...', mtConfirmation, mbYesNo) = mrNo then 
    begin
      MiUsuario.free;  
      exit;
    end;

   Guardado:=false;   
   MiUsuario.Dni:=edtDni.Text;
   MiUsuario.Usuario:=edtUsuario.Text; 
   MiUsuario.Clave:=edtClave.Text; 
   MiUsuario.Tipousuario:=edtTipousuario.Text; 
   MiUsuario.Permisos:=edtPermisos.Text; 
   MiUsuario.Estado:=edtEstado.Text;
   MiUsuario.cargo:=edtCargo.Text;

    if editar=0 then // nuevos datos INSERT
        Guardado:=MiUsuario.insertar 
    else 
        Guardado:=MiUsuario.actualizar('Dni',idtabla); 

    MiUsuario.Free; 

    EjecutaSQL('delete from actividadusuario where dni="'+edtDni.Text+'"',true);
    for i:=0 to lista.Items.Count-1 do
      begin
        EjecutaSQL('insert into actividadusuario(dni,idactividad) values("'+edtDni.Text+'","'+lista.Items[i]+'") ',true);
      end;

     if Guardado then
      begin 
       ShowMessage('Guardado con exito...');
       btnlimpiarclick(nil);
       close;
       FrmUsuario.btnActualizarClick(nil);
      end
     Else
       ShowMessage('Errores al guardar, verifique...');
 end;

procedure TFrmDatosUsuario.btnSalirClick(Sender: TObject);
 begin
   close;
 end;

procedure TFrmDatosUsuario.UniFormShow(Sender: TObject);
begin
  color:=ColorFormulario
end;

procedure TFrmDatosUsuario.btnmasClick(Sender: TObject);
begin
  FrmBuscador.tipobusqueda:=2;
  FrmBuscador.Showmodal(obtenerdato);
end;

procedure TFrmDatosUsuario.obtenerdato(Sender: TComponent; Res: Integer);
  begin
     if DataGlobal.Vdato1<>'' then
       Lista.Items.Add(DataGlobal.Vdato1);
  end;

procedure TFrmDatosUsuario.btnmenosClick(Sender: TObject);
begin
  if lista.ItemIndex>-1 then
    lista.Items.Delete(lista.ItemIndex);
end;

procedure TFrmDatosUsuario.cargardatos;
var MiUsuario : TUsuario;  i : smallint;
 begin
   MiUsuario := TUsuario.create;
   MiUsuario.ObtenerRegistro('Dni',idtabla);
       edtDni.text:=MiUsuario.Dni;
       edtUsuario.text:=MiUsuario.Usuario;
       edtClave.text:=MiUsuario.Clave;
       edtTipousuario.text:=MiUsuario.Tipousuario;
       edtPermisos.text:=MiUsuario.Permisos;
       edtEstado.text:=MiUsuario.Estado;
       edtcargo.Text:=MiUsuario.cargo;
   MiUsuario.Free;
   ActivaDM1ConsultaSQL('select idactividad from actividadusuario where dni="'+idtabla+'"',true);
   for i:=1 to DM1.ConsultaSQL.RecordCount do
      begin
        if i>1 then DM1.ConsultaSQL.Next;
        Lista.Items.Add(Dm1.ConsultaSQL.Fields[0].AsString);
      end;
   Dm1.ConsultaSQL.Close;
   caption:='Editar';
   editar:=1;
 end;

procedure TFrmDatosUsuario.edtDniKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if length(edtDni.text)=8 then
    lblnombre.caption:=recuperanombre(edtDni.text,' ')
  else
    lblnombre.caption:='';
end;

procedure TFrmDatosUsuario.nuevosdatos;
 begin
    btnLimpiarClick(nil);
    editar:=0;
    caption:='Nuevo';
 end;

end.

