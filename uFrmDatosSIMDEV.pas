unit uFrmDatosSIMDEV;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  uniEdit, uniLabel
;

type
  TFrmDatosSIMDEV = class(TUniForm)
    lblIdsimdev: TUnilabel;
    lblAlmacen: TUnilabel;
    lblAmbito: TUnilabel;
    lblDnisupervisor: TUnilabel;
    lblDiacampo: TUnilabel;
    lblDniextensionistaambiental: TUnilabel;
    lblDniextensionista: TUnilabel;
    lblDnitecnico: TUnilabel;
    lblIdcaserio: TUnilabel;
    lblDnititular: TUnilabel;
    lblIdactividad: TUnilabel;
    lblHinst: TUnilabel;
    lblHcrec: TUnilabel;
    lblHprod: TUnilabel;
    lblCoordx: TUnilabel;
    lblCoordy: TUnilabel;
    lblAltitud: TUnilabel;
    edtIdsimdev: TUniEdit;
    edtAlmacen: TUniEdit;
    edtAmbito: TUniEdit;
    edtDnisupervisor: TUniEdit;
    edtDiacampo: TUniEdit;
    edtDniextensionistaambiental: TUniEdit;
    edtDniextensionista: TUniEdit;
    edtDnitecnico: TUniEdit;
    edtIdcaserio: TUniEdit;
    edtDnititular: TUniEdit;
    edtIdactividad: TUniEdit;
    edtHinst: TUniEdit;
    edtHcrec: TUniEdit;
    edtHprod: TUniEdit;
    edtCoordx: TUniEdit;
    edtCoordy: TUniEdit;
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

function FrmDatosSIMDEV: TFrmDatosSIMDEV;

implementation
{$R *.dfm}

 uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,UDBModulo,uModeloSIMDEV,
  uFrmSIMDEV;

 function FrmDatosSIMDEV: TFrmDatosSIMDEV;
  begin 
    Result := TFrmDatosSIMDEV(UniMainModule.GetFormInstance(TFrmDatosSIMDEV));
  end;

procedure TFrmDatosSIMDEV.btnLimpiarClick(Sender: TObject);
 begin
    edtIdsimdev.text:='';
    edtAlmacen.text:='';
    edtAmbito.text:='';
    edtDnisupervisor.text:='';
    edtDiacampo.text:='';
    edtDniextensionistaambiental.text:='';
    edtDniextensionista.text:='';
    edtDnitecnico.text:='';
    edtIdcaserio.text:='';
    edtDnititular.text:='';
    edtIdactividad.text:='';
    edtHinst.text:='';
    edtHcrec.text:='';
    edtHprod.text:='';
    edtCoordx.text:='';
    edtCoordy.text:='';
    edtAltitud.text:='';
    editar:=0;
    idtabla:='';
 end;

procedure TFrmDatosSIMDEV.btnGuardarClick(Sender: TObject);
var 
    guardado : boolean;
    MiSIMDEV : TSIMDEV;
 begin
  //validaciones
  
  if (edtIdsimdev.Text='')then 
   begin
     Showmessage('Se requiere un Idsimdev');
     exit;
   end;

  if (length(edtAlmacen.text)=0) or (false) then
    begin
      Showmessage('Se requiere de datos de SIMDEV');
      exit;
    end;
  
  MiSIMDEV:=TSIMDEV.Create;
  
  if editar=0 then
   begin
      if MiSIMDEV.Buscar('Idsimdev',edtIdsimdev.text) then 
       begin  
         MiSIMDEV.free;  
         Showmessage('Idsimdev ya existe'); 
         exit;  
       end;  
   end;

  if MessageDlg('Esta seguro de guardar...', mtConfirmation, mbYesNo) = mrNo then 
    begin
      MiSIMDEV.free;  
      exit;
    end;

   Guardado:=false;   
   MiSIMDEV.Idsimdev:=edtIdsimdev.Text; 
   MiSIMDEV.Almacen:=edtAlmacen.Text; 
   MiSIMDEV.Ambito:=edtAmbito.Text; 
   MiSIMDEV.Dnisupervisor:=edtDnisupervisor.Text; 
   MiSIMDEV.Diacampo:=edtDiacampo.Text; 
   MiSIMDEV.Dniextensionistaambiental:=edtDniextensionistaambiental.Text; 
   MiSIMDEV.Dniextensionista:=edtDniextensionista.Text; 
   MiSIMDEV.Dnitecnico:=edtDnitecnico.Text; 
   MiSIMDEV.Idcaserio:=edtIdcaserio.Text; 
   MiSIMDEV.Dnititular:=edtDnititular.Text; 
   MiSIMDEV.Idactividad:=edtIdactividad.Text; 
   MiSIMDEV.Hinst:=edtHinst.Text; 
   MiSIMDEV.Hcrec:=edtHcrec.Text; 
   MiSIMDEV.Hprod:=edtHprod.Text; 
   MiSIMDEV.Coordx:=edtCoordx.Text; 
   MiSIMDEV.Coordy:=edtCoordy.Text; 
   MiSIMDEV.Altitud:=edtAltitud.Text; 

    if editar=0 then // nuevos datos INSERT
        Guardado:=MiSIMDEV.insertar 
    else 
        Guardado:=MiSIMDEV.actualizar('Idsimdev',idtabla); 

    MiSIMDEV.Free; 

     if Guardado then
      begin 
       ShowMessage('Guardado con exito...');
       btnlimpiarclick(nil);
       close;
       FrmSIMDEV.btnActualizarClick(nil);
      end
     Else
       ShowMessage('Errores al guardar, verifique...');
 end;

procedure TFrmDatosSIMDEV.btnSalirClick(Sender: TObject);
 begin
   close;
 end;

procedure TFrmDatosSIMDEV.UniFormShow(Sender: TObject);
begin
  color:=ColorFormulario
end;

procedure TFrmDatosSIMDEV.cargardatos;
var MiSIMDEV : TSIMDEV;
 begin
   MiSIMDEV := TSIMDEV.create;
   MiSIMDEV.ObtenerRegistro('Idsimdev',idtabla);
       edtIdsimdev.text:=MiSIMDEV.Idsimdev;
       edtAlmacen.text:=MiSIMDEV.Almacen;
       edtAmbito.text:=MiSIMDEV.Ambito;
       edtDnisupervisor.text:=MiSIMDEV.Dnisupervisor;
       edtDiacampo.text:=MiSIMDEV.Diacampo;
       edtDniextensionistaambiental.text:=MiSIMDEV.Dniextensionistaambiental;
       edtDniextensionista.text:=MiSIMDEV.Dniextensionista;
       edtDnitecnico.text:=MiSIMDEV.Dnitecnico;
       edtIdcaserio.text:=MiSIMDEV.Idcaserio;
       edtDnititular.text:=MiSIMDEV.Dnititular;
       edtIdactividad.text:=MiSIMDEV.Idactividad;
       edtHinst.text:=MiSIMDEV.Hinst;
       edtHcrec.text:=MiSIMDEV.Hcrec;
       edtHprod.text:=MiSIMDEV.Hprod;
       edtCoordx.text:=MiSIMDEV.Coordx;
       edtCoordy.text:=MiSIMDEV.Coordy;
       edtAltitud.text:=MiSIMDEV.Altitud;
   MiSIMDEV.Free;
   caption:='Editar';
   editar:=1;
 end;

procedure TFrmDatosSIMDEV.nuevosdatos;
 begin
    btnLimpiarClick(nil);
    editar:=0;
    caption:='Nuevo';
 end;

end.

