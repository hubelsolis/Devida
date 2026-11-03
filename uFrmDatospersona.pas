unit uFrmDatospersona;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniEdit, uniLabel, uniMultiItem, uniComboBox, uniDateTimePicker, uniCheckBox
;

type
  TFrmDatospersona = class(TUniForm)
    lblDni: TUnilabel;
    lblApellido_paterno: TUnilabel;
    lblApellido_materno: TUnilabel;
    lblNombre: TUnilabel;
    lblFecnac: TUnilabel;
    lblTelefono: TUnilabel;
    lblDireccion: TUnilabel;
    lblSexo: TUnilabel;
    lblEtnia: TUnilabel;
    lblLengua: TUnilabel;
    edtDni: TUniEdit;
    edtAppaterno: TUniEdit;
    edtApmaterno: TUniEdit;
    edtNombre: TUniEdit;
    edtTelefono: TUniEdit;
    edtDireccion: TUniEdit;
    edtEtnia: TUniEdit;
    edtLengua: TUniEdit;
    btnLimpiar: TUniBitBtn;
    btnGuardar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    edtfecnac: TUniDateTimePicker;
    edtSexo: TUniComboBox;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    editar : byte;
    idtabla     : string;
    procedure nuevosdatos;
    procedure cargardatos;
  end;

function FrmDatospersona: TFrmDatospersona;

implementation
{$R *.dfm}

 uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,UDBModulo,uModelopersona,
  uFrmpersona,umodelopadron, udataglobal;

 function FrmDatospersona: TFrmDatospersona;
  begin 
    Result := TFrmDatospersona(UniMainModule.GetFormInstance(TFrmDatospersona));
  end;

procedure TFrmDatospersona.btnLimpiarClick(Sender: TObject);
 begin
    edtDni.text:='';
    edtAppaterno.text:='';
    edtApmaterno.text:='';
    edtNombre.text:='';
    edtFecnac.text:='';
    edtTelefono.text:='';
    edtDireccion.text:='';
    edtSexo.text:='';
    edtEtnia.text:='';
    edtLengua.text:='';
    editar:=0;
    idtabla:='';
 end;

procedure TFrmDatospersona.btnGuardarClick(Sender: TObject);
var 
    guardado : boolean;
    Mipersona : Tpersona;
    MiPadron : TPadron;
 begin
  //validaciones
  
  if (edtDni.Text='')then 
   begin
     Showmessage('Se requiere un DNI');
     exit;
   end;

  if (length(edtAppaterno.text)=0) or (false) then
    begin
      Showmessage('Se requiere los apellidos de persona');
      exit;
    end;
  
  Mipersona:=Tpersona.Create;
  
  if editar=0 then
   begin
      if Mipersona.Buscar('Dni',edtDni.text) then 
       begin  
         Mipersona.free;  
         Showmessage('Dni ya existe'); 
         exit;  
       end;  
   end;


 MessageDlg('Esta seguro de guardar...',
 mtInformation, mbYesNoCancel,
 procedure (Sender: TComponent; Res:Integer)
  begin
      case Res of

         mrNo:
           begin
             Mipersona.free;
           end;

         mrYes :
           begin

              Guardado:=false;
              Mipersona.Dni:=edtDni.Text;
              Mipersona.Appaterno:=edtAppaterno.Text;
              Mipersona.Apmaterno:=edtApmaterno.Text;
              Mipersona.Nombre:=edtNombre.Text;
              Mipersona.Fecnac:=edtFecnac.Text;
              Mipersona.Telefono:=edtTelefono.Text;
              Mipersona.Direccion:=edtDireccion.Text;
              Mipersona.Sexo:=edtSexo.Text;
              Mipersona.Etnia:=edtEtnia.Text;
              Mipersona.Lengua:=edtLengua.Text;

              if editar=0 then // nuevos datos INSERT
                  Guardado:=Mipersona.insertar
              else
                  Guardado:=Mipersona.actualizar('Dni',idtabla);
              Mipersona.Free;

               if Guardado then
                begin
                 //ShowMessage('Guardado con exito...');
                 //btnlimpiarclick(nil);
                 close;
                end
               Else
                 ShowMessage('Errores al guardar, verifique...');

           end;
      end;
  end);

 end;




procedure TFrmDatospersona.btnSalirClick(Sender: TObject);
 begin
   close;
 end;

procedure TFrmDatospersona.UniFormShow(Sender: TObject);
begin
  color:=ColorFormulario
end;

procedure TFrmDatospersona.cargardatos;
var Mipersona : Tpersona;
 begin
   Mipersona := Tpersona.create;
   Mipersona.ObtenerRegistro('Dni',idtabla);
       edtDni.text:=Mipersona.Dni;
       edtAppaterno.text:=Mipersona.Appaterno;
       edtApmaterno.text:=Mipersona.Apmaterno;
       edtNombre.text:=Mipersona.Nombre;
       edtFecnac.text:=Mipersona.Fecnac;
       edtTelefono.text:=Mipersona.Telefono;
       edtDireccion.text:=Mipersona.Direccion;
       edtSexo.text:=Mipersona.Sexo;
       edtEtnia.text:=Mipersona.Etnia;
       edtLengua.text:=Mipersona.Lengua;
   Mipersona.Free;
   caption:='Editar';
   editar:=1;
 end;

procedure TFrmDatospersona.nuevosdatos;
 begin
    btnLimpiarClick(nil);
    editar:=0;
    caption:='Nuevo';
 end;

end.

