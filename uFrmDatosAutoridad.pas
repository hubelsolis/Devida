unit uFrmDatosAutoridad;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniEdit, uniLabel, uniMultiItem, uniComboBox
;

type
  TFrmDatosAutoridad = class(TUniForm)
    lblIdcaserio: TUnilabel;
    lblDni: TUnilabel;
    lblFecha: TUnilabel;
    lblCargo: TUnilabel;
    lblResolucion: TUnilabel;
    lblEstado: TUnilabel;
    edtIdcaserio: TUniEdit;
    edtDni: TUniEdit;
    edtFecha: TUniEdit;
    edtCargo: TUniEdit;
    edtResolucion: TUniEdit;
    btnLimpiar: TUniBitBtn;
    btnGuardar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    edtappaterno: TUniEdit;
    edtapmaterno: TUniEdit;
    edtnombres: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edtEstado: TUniComboBox;
    lblcaserio: TUniLabel;
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure edtDniKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtIdcaserioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    editar : byte;
    idtabla : string;
    idtabla2 : string;
    procedure nuevosdatos;
    procedure cargardatos;
  end;

function FrmDatosAutoridad: TFrmDatosAutoridad;

implementation
{$R *.dfm}

 uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,UDBModulo,uModeloAutoridad,
  uFrmAutoridad,uniguiusqlutils;

 function FrmDatosAutoridad: TFrmDatosAutoridad;
  begin 
    Result := TFrmDatosAutoridad(UniMainModule.GetFormInstance(TFrmDatosAutoridad));
  end;

procedure TFrmDatosAutoridad.btnLimpiarClick(Sender: TObject);
 begin
    edtIdcaserio.text:='';
    edtDni.text:='';
    edtFecha.text:='';
    edtCargo.text:='';
    edtResolucion.text:='';
    edtEstado.text:='';
    editar:=0;
    edtnombres.Text:='';
    edtappaterno.Text:='';
    edtapmaterno.Text:='';
    lblcaserio.Text:='';
    idtabla:='';
    idtabla2:='';
 end;

procedure TFrmDatosAutoridad.btnGuardarClick(Sender: TObject);
var 
    guardado : boolean;
    MiAutoridad : TAutoridad;
 begin
  //validaciones
  
  if (edtIdcaserio.Text='')then 
   begin
     Showmessage('Se requiere un Idcaserio');
     exit;
   end;

  if (length(edtDni.text)=0) or (false) then
    begin
      Showmessage('Se requiere de datos de Autoridad');
      exit;
    end;

  if edtestado.Text='' then
   begin
      Showmessage('Selecione un estado...');
      exit;
   end;
  
  MiAutoridad:=TAutoridad.Create;
  if (editar=0) then
   begin
     ActivaDM1ConsultaSQl('select dni from autoridad where idcaserio="'+edtIdcaserio.Text+'" and dni="'+edtdni.Text+'"',false);
      if DM1.ConsultaSQL.RecordCount>0 then
       begin
         MiAutoridad.free;
         DM1.ConsultaSQL.Close;
         Showmessage('Idcaserio ya existe');
         exit;
       end
      else
       DM1.ConsultaSQL.Close;
   end;

  if MessageDlg('Esta seguro de guardar...', mtConfirmation, mbYesNo) = mrNo then 
    begin
      MiAutoridad.free;  
      exit;
    end;


   activadm1consultasql('select dni from persona where dni="'+edtdni.Text+'";',false);
   if DM1.ConsultaSQL.RecordCount>0 then
    begin
      EjecutaSQL('update persona set APPATERNO="'+edtappaterno.Text+'", APMATERNO="'+edtapmaterno.Text+'", NOMBRE="'+edtnombres.Text+'" where dni="'+edtdni.Text+'"',true);
    end
   else
    begin
      EjecutaSQL('INSERT INTO PERSONA (DNI, APPATERNO, APMATERNO, NOMBRE) values ("'+edtdni.text+'","'+edtappaterno.Text+'","'+edtapmaterno.Text+'","'+edtnombres.Text+'");',true);
    end;
   DM1.ConsultaSQL.Close;

   if edtestado.Text='1' then
    begin
      EjecutaSQL('update autoridad set estado=0 where idcaserio="'+edtIdcaserio.Text+'";',true);
    end;

   Guardado:=false;
   MiAutoridad.Idcaserio:=edtIdcaserio.Text;
   MiAutoridad.Dni:=edtDni.Text;
   MiAutoridad.Fecha:=edtFecha.Text; 
   MiAutoridad.Cargo:=edtCargo.Text; 
   MiAutoridad.Resolucion:=edtResolucion.Text; 
   MiAutoridad.Estado:=edtEstado.Text; 

    if editar=0 then // nuevos datos INSERT
        Guardado:=MiAutoridad.insertar
    else 
        Guardado:=MiAutoridad.actualizar2('Idcaserio',idtabla,'DNI',idtabla2);

    MiAutoridad.Free; 

     if Guardado then
      begin
       ShowMessage('Guardado con exito...');
       btnlimpiarclick(nil);
       close;
       FrmAutoridad.btnBuscarClick(nil);
      end
     Else
       ShowMessage('Errores al guardar, verifique...');
 end;

procedure TFrmDatosAutoridad.btnSalirClick(Sender: TObject);
 begin
   close;
 end;

procedure TFrmDatosAutoridad.UniFormShow(Sender: TObject);
begin
  color:=ColorFormulario
end;

procedure TFrmDatosAutoridad.cargardatos;
var MiAutoridad : TAutoridad;
 begin
   MiAutoridad := TAutoridad.create;
   MiAutoridad.ObtenerRegistro('Idcaserio',idtabla,'DNI',idtabla2);
       edtIdcaserio.text:=MiAutoridad.Idcaserio;
       edtDni.text:=MiAutoridad.Dni;
       edtFecha.text:=MiAutoridad.Fecha;
       edtCargo.text:=MiAutoridad.Cargo;
       edtResolucion.text:=MiAutoridad.Resolucion;
       edtEstado.text:=MiAutoridad.Estado;
   MiAutoridad.Free;

   ActivaDM1ConsultaSQL('SELECT a.APPATERNO, a.APMATERNO, a.NOMBRE FROM PERSONA a where a.DNI="'+edtDni.Text+'"',false);
   edtappaterno.Text:=DM1.ConsultaSQL.Fields[0].AsString;
   edtapmaterno.Text:=DM1.ConsultaSQL.Fields[1].AsString;
   edtnombres.Text:=DM1.ConsultaSQL.Fields[2].AsString;
   DM1.ConsultaSQL.Close;

   ActivaDM1ConsultaSQL('SELECT CASERIO FROM CASERIO a where a.IDCASERIO="'+edtidcaserio.Text+'"',false);
    lblcaserio.caption:=DM1.ConsultaSQL.Fields[0].AsString;
   DM1.ConsultaSQL.Close;

   caption:='Editar';
   editar:=1;
 end;

procedure TFrmDatosAutoridad.edtDniKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if length(edtdni.Text)>=8 then
   begin
     ActivaDM1ConsultaSQL('SELECT a.APPATERNO, a.APMATERNO, a.NOMBRE FROM PERSONA a where a.DNI="'+edtDni.Text+'"',false);
     edtappaterno.Text:=DM1.ConsultaSQL.Fields[0].AsString;
     edtapmaterno.Text:=DM1.ConsultaSQL.Fields[1].AsString;
     edtnombres.Text:=DM1.ConsultaSQL.Fields[2].AsString;
     DM1.ConsultaSQL.Close;
   end
  else
     edtnombres.Text:='';
end;

procedure TFrmDatosAutoridad.edtIdcaserioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if length(edtidcaserio.Text)>=10 then
   begin
     ActivaDM1ConsultaSQL('SELECT CASERIO FROM CASERIO a where a.IDCASERIO="'+edtidcaserio.Text+'"',false);
      lblcaserio.caption:=DM1.ConsultaSQL.Fields[0].AsString;
     DM1.ConsultaSQL.Close;
   end
  else
     lblcaserio.Text:='';
end;

procedure TFrmDatosAutoridad.nuevosdatos;
 begin
    btnLimpiarClick(nil);
    editar:=0;
    caption:='Nuevo';
 end;

end.

