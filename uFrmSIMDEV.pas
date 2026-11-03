unit uFrmSIMDEV;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs 
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uniBasicGrid,
  uniDBGrid, uniPanel
; 

type
  TFrmSIMDEV = class(TUniForm)
    Panel1: TUniPanel;
    dbRejilla: TUniDBGrid;
    btnActualizar: TUniBitBtn;
    BtnModificar: TUniBitBtn;
    BtnBuscarModificar: TUniBitBtn;
    BtnEliminar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    ztabla: TZQuery;
    ds1: TDataSource;
    Zdetalle: TZQuery;
    procedure btnSalirClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNuevoRegistroClick(Sender: TObject);
    procedure BtnModificarClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnBuscarModificarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure ActivaZ(sql1:string);
  end;

function
  FrmSIMDEV: TFrmSIMDEV;

implementation

{$R *.dfm}

uses uniGUIVars, MainModule, uniGUIApplication,uniGuioperadores,uniGuiUSQLutils,
  uFrmDatosSIMDEV, UDBModulo;

 function FrmSIMDEV: TFrmSIMDEV;
  begin 
    Result := TFrmSIMDEV(UniMainModule.GetFormInstance(TFrmSIMDEV));
  end;

procedure TFrmSIMDEV.btnSalirClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmSIMDEV.ActivaZ(sql1:string);
begin
  Ztabla.Close;
  Ztabla.SQL.Clear;
  Ztabla.SQL.Add(FormatSQL3(sql1));
  Ztabla.Open;
end;

procedure TFrmSIMDEV.btnActualizarClick(Sender: TObject);
var s : string;
begin

 s:='select  Idsimdev,Almacen,Ambito,Dnisupervisor,Diacampo,Dniextensionistaambiental,Dniextensionista,Dnitecnico,Idcaserio,Dnititular,Idactividad,Hinst,Hcrec,Hprod,Coordx,Coordy,Altitud '+
      'from SIMDEV';

 ActivaZ(s);

end;

procedure TFrmSIMDEV.FormShow(Sender: TObject);
begin
  // al iniciar
 Color:=ColorFormulario;
 Font.Color:=ColorFuente;

 btnActualizarClick(nil);
end;

procedure TFrmSIMDEV.BtnNuevoRegistroClick(Sender: TObject);
begin
   FrmDatosSIMDEV.btnLimpiarClick(nil);
   FrmDatosSIMDEV.ShowModal;
   //btnActualizarClick(nil);
end;

procedure TFrmSIMDEV.BtnModificarClick(Sender: TObject);
begin
   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
           FrmDatosSIMDEV.btnLimpiarClick(nil);
           FrmDatosSIMDEV.idtabla:=Ztabla.fields[0].AsString;
           FrmDatosSIMDEV.cargardatos;
           FrmDatosSIMDEV.ShowModal;
          // btnActualizarClick(nil);
        end
      else
        begin
           Showmessage('No existen registros a editar...');
        end;
    end
   ELSE
    begin
      Showmessage('Actualice la tabla antes...');
    end;
end;

procedure TFrmSIMDEV.BtnEliminarClick(Sender: TObject);
begin
   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
            MessageDlg('Esta seguro de Eliminar '+ZTABLA.Fields[0].AsString,
                mtConfirmation, [mbYes, mbNo], 
               procedure(Sender: TComponent; Res: Integer)
               begin
                 case Res of
                   mrYes : begin
                             EjecutaSQL('DELETE FROM SIMDEV WHERE idSIMDEV='+ZTABLA.fields[0].AsString,true);
                             btnActualizarClick(nil);
                           end;
                   mrNo :  begin
                           end;
                 end;
               end
             ) ;
        end
      else
        begin
           Showmessage('No existen registros a eliminar...');
        end;
    end
   ELSE
    begin
      Showmessage('Actualice la tabla antes...');
    end;
end;

procedure TFrmSIMDEV.BtnBuscarModificarClick(Sender: TObject);
begin
  // BUSQUEDA
end;

procedure TFrmSIMDEV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ztabla.Close;
 Zdetalle.Close;
 //cerrarconexionessql(True);
end;

procedure TFrmSIMDEV.btnReporteClick(Sender: TObject);
begin
 // REPORTE DE SIMDEV
end;

end.
