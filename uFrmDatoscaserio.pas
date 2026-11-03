unit uFrmDatoscaserio;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniEdit, uniLabel
;

type
  TFrmDatoscaserio = class(TUniForm)
    lblIdcaserio: TUnilabel;
    lblAmbito: TUnilabel;
    lblDepartamento: TUnilabel;
    lblProvincia: TUnilabel;
    lblDistrito: TUnilabel;
    lblCaserio: TUnilabel;
    lblRegion_natural: TUnilabel;
    lblCoorx: TUnilabel;
    lblCoory: TUnilabel;
    lblAltitud: TUnilabel;
    edtIdcaserio: TUniEdit;
    edtAmbito: TUniEdit;
    edtDepartamento: TUniEdit;
    edtProvincia: TUniEdit;
    edtDistrito: TUniEdit;
    edtCaserio: TUniEdit;
    edtRegion_natural: TUniEdit;
    edtCoorx: TUniEdit;
    edtCoory: TUniEdit;
    edtAltitud: TUniEdit;
    btnLimpiar: TUniBitBtn;
    btnGuardar: TUniBitBtn;
    btnSalir: TUniBitBtn;
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

function FrmDatoscaserio: TFrmDatoscaserio;

implementation
{$R *.dfm}

 uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,UDBModulo,uModelocaserio,
  uFrmcaserio;

 function FrmDatoscaserio: TFrmDatoscaserio;
  begin 
    Result := TFrmDatoscaserio(UniMainModule.GetFormInstance(TFrmDatoscaserio));
  end;

procedure TFrmDatoscaserio.btnLimpiarClick(Sender: TObject);
 begin
    edtIdcaserio.text:='';
    edtAmbito.text:='';
    edtDepartamento.text:='';
    edtProvincia.text:='';
    edtDistrito.text:='';
    edtCaserio.text:='';
    edtRegion_natural.text:='';
    edtCoorx.text:='';
    edtCoory.text:='';
    edtAltitud.text:='';
    editar:=0;
    idtabla:='';
 end;

procedure TFrmDatoscaserio.btnGuardarClick(Sender: TObject);
var 
    guardado : boolean;
    Micaserio : Tcaserio;
 begin
  //validaciones
  
  if (edtIdcaserio.Text='')then 
   begin
     Showmessage('Se requiere un Idcaserio');
     exit;
   end;

  if (length(edtAmbito.text)=0) or (false) then
    begin
      Showmessage('Se requiere de datos de caserio');
      exit;
    end;
  
  Micaserio:=Tcaserio.Create;
  
  if editar=0 then
   begin
      if Micaserio.Buscar('Idcaserio',edtIdcaserio.text) then 
       begin  
         Micaserio.free;  
         Showmessage('Idcaserio ya existe'); 
         exit;  
       end;  
   end;

  if MessageDlg('Esta seguro de guardar...', mtConfirmation, mbYesNo) = mrNo then 
    begin
      Micaserio.free;  
      exit;
    end;

   Guardado:=false;   
   Micaserio.Idcaserio:=edtIdcaserio.Text; 
   Micaserio.Ambito:=edtAmbito.Text; 
   Micaserio.Departamento:=edtDepartamento.Text; 
   Micaserio.Provincia:=edtProvincia.Text; 
   Micaserio.Distrito:=edtDistrito.Text; 
   Micaserio.Caserio:=edtCaserio.Text; 
   Micaserio.Region_natural:=edtRegion_natural.Text; 
   Micaserio.Coorx:=edtCoorx.Text; 
   Micaserio.Coory:=edtCoory.Text; 
   Micaserio.Altitud:=edtAltitud.Text; 

    if editar=0 then // nuevos datos INSERT
        Guardado:=Micaserio.insertar 
    else 
        Guardado:=Micaserio.actualizar('Idcaserio',idtabla); 

    Micaserio.Free; 

     if Guardado then
      begin 
       ShowMessage('Guardado con exito...');
       btnlimpiarclick(nil);
       close;
       Frmcaserio.btnActualizarClick(nil);
      end
     Else
       ShowMessage('Errores al guardar, verifique...');
 end;

procedure TFrmDatoscaserio.btnSalirClick(Sender: TObject);
 begin
   close;
 end;

procedure TFrmDatoscaserio.UniFormShow(Sender: TObject);
begin
  color:=ColorFormulario
end;

procedure TFrmDatoscaserio.cargardatos;
var Micaserio : Tcaserio;
 begin
   Micaserio := Tcaserio.create;
   Micaserio.ObtenerRegistro('Idcaserio',idtabla);
       edtIdcaserio.text:=Micaserio.Idcaserio;
       edtAmbito.text:=Micaserio.Ambito;
       edtDepartamento.text:=Micaserio.Departamento;
       edtProvincia.text:=Micaserio.Provincia;
       edtDistrito.text:=Micaserio.Distrito;
       edtCaserio.text:=Micaserio.Caserio;
       edtRegion_natural.text:=Micaserio.Region_natural;
       edtCoorx.text:=Micaserio.Coorx;
       edtCoory.text:=Micaserio.Coory;
       edtAltitud.text:=Micaserio.Altitud;
   Micaserio.Free;
   caption:='Editar';
   editar:=1;
 end;

procedure TFrmDatoscaserio.nuevosdatos;
 begin
    btnLimpiarClick(nil);
    editar:=0;
    caption:='Nuevo';
 end;

end.

