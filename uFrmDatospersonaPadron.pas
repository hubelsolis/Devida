unit uFrmDatospersonaPadron;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniEdit, uniLabel, uniMultiItem, uniComboBox, uniDateTimePicker, uniCheckBox
;

type
  TFrmDatospersonaPadron = class(TUniForm)
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
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    edtDNI_CONY: TUniEdit;
    edtAppaterno_CONY: TUniEdit;
    edtApMaterno_CONY: TUniEdit;
    edtNombre_CONY: TUniEdit;
    edtTelefono_CONY: TUniEdit;
    edtDireccion_CONY: TUniEdit;
    edtEtnia_CONY: TUniEdit;
    edtLengua_CONY: TUniEdit;
    edtFecNac_CONY: TUniDateTimePicker;
    edtSexo_CONY: TUniComboBox;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    HayConyuge: Boolean;
  public
    { Public declarations }
    editar : byte;
    idtablaTITULAR : string;
    idtablaCONY    : string;
    SidAdenda : string;
    procedure nuevosdatos;
    procedure cargardatos;
  end;

function FrmDatospersonaPadron: TFrmDatospersonaPadron;

implementation
{$R *.dfm}

 uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,UDBModulo,uModelopersona,
  uFrmpersona,umodelopadron, udataglobal, UniguiUSQLutils;

 function FrmDatospersonaPadron: TFrmDatospersonaPadron;
  begin 
    Result := TFrmDatospersonaPadron(UniMainModule.GetFormInstance(TFrmDatospersonaPadron));
  end;

procedure TFrmDatospersonaPadron.btnLimpiarClick(Sender: TObject);
 begin
    editar:=0;
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
    idtablatitular:='';

    HayConyuge:=False;
    edtDni_CONY.text:='';
    edtAppaterno_CONY.text:='';
    edtApmaterno_CONY.text:='';
    edtNombre_CONY.text:='';
    edtFecnac_CONY.text:='';
    edtTelefono_CONY.text:='';
    edtDireccion_CONY.text:='';
    edtSexo_CONY.text:='';
    edtEtnia_CONY.text:='';
    edtLengua_CONY.text:='';
    idtablaCONY:='';
 end;

procedure TFrmDatospersonaPadron.btnGuardarClick(Sender: TObject);
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
 var SidAdendaAnterior : String;
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
                  Guardado:=Mipersona.actualizar('Dni',idtablaTitular);

              Mipersona.Dni:=Trim(edtDni_CONY.Text);
              Mipersona.Appaterno:=edtAppaterno_CONY.Text;
              Mipersona.Apmaterno:=edtApmaterno_CONY.Text;
              Mipersona.Nombre:=edtNombre_CONY.Text;
              Mipersona.Fecnac:=edtFecnac_CONY.Text;
              Mipersona.Telefono:=edtTelefono_CONY.Text;
              Mipersona.Direccion:=edtDireccion_CONY.Text;
              Mipersona.Sexo:=edtSexo_CONY.Text;
              Mipersona.Etnia:=edtEtnia_CONY.Text;
              Mipersona.Lengua:=edtLengua_CONY.Text;

              if MiPersona.DNI<>'' then
                begin
                  if Not HayConyuge then
                    MiPersona.insertar
                  else
                    MiPersona.actualizar('Dni',idtablaCONY);
                end;

              Mipersona.Free;

              if True then
               begin
                 Mipadron:=TPadron.Create;

                 if MiPadron.Buscar2('DNI',idtablatITULAR,'idadenda',SidAdenda) then
                  begin
                   //  debo ir a la anterior tb
                   Mipadron.ObtenerRegistro('DNI',idtablatITULAR,'idadenda',SidAdenda);

                       Mipadron.Dni:=edtDni.Text;
                       Mipadron.Appaterno:=edtAppaterno.Text;
                       Mipadron.Apmaterno:=edtApmaterno.Text;
                       Mipadron.Nombre:=edtNombre.Text;
                       Mipadron.fecnac:=edtFecnac.Text;
                       Mipadron.Telefono:=edtTelefono.Text;
                       Mipadron.Sexo:=edtSexo.Text;
                       Mipadron.Etnia:=edtEtnia.Text;
                       Mipadron.Lengua:=edtLengua.Text;

                       Mipadron.Cony_dni:=edtDni_CONY.Text;
                       Mipadron.Cony_Appaterno:=edtAppaterno_CONY.Text;
                       Mipadron.Cony_Apmaterno:=edtApmaterno_CONY.Text;
                       Mipadron.Cony_nombre:=edtNombre_CONY.Text;
                       Mipadron.Cony_sexo:=edtSexo_CONY.Text;
                       Mipadron.Cony_etnia:=edtEtnia_CONY.Text;
                       Mipadron.Cony_lengua:=edtLengua_CONY.Text;
                       MiPadron.cony_fecNac:=edtFecnac_CONY.Text;

                       Mipadron.actualizar2('DNI',idtablatITULAR,'idadenda',SidAdenda);

                  end;

                 //ahora irradio hacia lo anterior
                 ActivaDM1ConsultaSQL('SELECT a.ADENDA_ANTERIOR FROM ADENDA a where a.IDADENDA="'+SidAdenda+'"',false);
                 SidAdendaAnterior:=DM1.ConsultaSQL.Fields[0].AsString;
                 if SidAdendaAnterior<>'' then
                 if MiPadron.Buscar2('DNI',idtablatITULAR,'idadenda',SidAdendaAnterior) then
                  begin
                   //  debo ir a la anterior tb
                    Mipadron.ObtenerRegistro('DNI',idtablatITULAR,'idadenda',SidAdendaAnterior);

                       Mipadron.Dni:=edtDni.Text;
                       Mipadron.Appaterno:=edtAppaterno.Text;
                       Mipadron.Apmaterno:=edtApmaterno.Text;
                       Mipadron.Nombre:=edtNombre.Text;
                       Mipadron.fecnac:=edtFecnac.Text;
                       Mipadron.Telefono:=edtTelefono.Text;
                       Mipadron.Sexo:=edtSexo.Text;
                       Mipadron.Etnia:=edtEtnia.Text;
                       Mipadron.Lengua:=edtLengua.Text;

                       Mipadron.Cony_dni:=edtDni_CONY.Text;
                       Mipadron.Cony_Appaterno:=edtAppaterno_CONY.Text;
                       Mipadron.Cony_Apmaterno:=edtApmaterno_CONY.Text;
                       Mipadron.Cony_nombre:=edtNombre_CONY.Text;
                       Mipadron.Cony_sexo:=edtSexo_CONY.Text;
                       Mipadron.Cony_etnia:=edtEtnia_CONY.Text;
                       Mipadron.Cony_lengua:=edtLengua_CONY.Text;

                    Mipadron.actualizar2('DNI',idtablatITULAR,'idadenda',SidAdendaAnterior);
                  end;

                 MiPadron.Free;
               end;


               if Guardado then
                begin
                 ShowMessage('Guardado con exito...');
                 //btnlimpiarclick(nil);
                 close;
                end
               Else
                 ShowMessage('Errores al guardar, verifique...');

           end;
      end;
  end);

 end;


procedure TFrmDatospersonaPadron.btnSalirClick(Sender: TObject);
 begin
   close;
 end;

procedure TFrmDatospersonaPadron.UniFormShow(Sender: TObject);
begin
  color:=ColorFormulario
end;

procedure TFrmDatospersonaPadron.cargardatos;
var Mipersona : Tpersona;
 begin
   Mipersona := Tpersona.create;

   Mipersona.ObtenerRegistro('Dni',idtablaTitular);
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

    HayConyuge:=False;
    if Mipersona.Buscar('Dni',idtablaCONY) then
     begin
         Mipersona.ObtenerRegistro('Dni',idtablaCONY);
         edtDni_CONY.text:=Mipersona.Dni;
         edtAppaterno_CONY.text:=Mipersona.Appaterno;
         edtApmaterno_CONY.text:=Mipersona.Apmaterno;
         edtNombre_CONY.text:=Mipersona.Nombre;
         edtFecnac_CONY.text:=Mipersona.Fecnac;
         edtTelefono_CONY.text:=Mipersona.Telefono;
         edtDireccion_CONY.text:=Mipersona.Direccion;
         edtSexo_CONY.text:=Mipersona.Sexo;
         edtEtnia_CONY.text:=Mipersona.Etnia;
         edtLengua_CONY.text:=Mipersona.Lengua;
         HayConyuge:=True;
     end;

   Mipersona.Free;
   caption:='Editar';
   editar:=1;
 end;

procedure TFrmDatospersonaPadron.nuevosdatos;
 begin
    btnLimpiarClick(nil);
    editar:=0;
    caption:='Nuevo';
 end;

end.

