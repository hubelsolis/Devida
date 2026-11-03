unit uFrmActividad;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs 
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uniBasicGrid,
  uniDBGrid, uniPanel
; 

type
  TFrmActividad = class(TUniForm)
    Panel1: TUniPanel;
    dbRejilla: TUniDBGrid;
    btnActualizar: TUniBitBtn;
    BtnModificar: TUniBitBtn;
    BtnEliminar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    ztabla: TZQuery;
    ds1: TDataSource;
    Zdetalle: TZQuery;
    procedure btnSalirClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure BtnNuevoRegistroClick(Sender: TObject);
    procedure BtnModificarClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReporteClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure ActivaZ(sql1:string);
  end;

function
  FrmActividad: TFrmActividad;

implementation

{$R *.dfm}

uses uniGUIVars, MainModule, uniGUIApplication,uniGuioperadores,uniGuiUSQLutils,
  uFrmDatosActividad, UDBModulo;

 function FrmActividad: TFrmActividad;
  begin 
    Result := TFrmActividad(UniMainModule.GetFormInstance(TFrmActividad));
  end;

procedure TFrmActividad.btnSalirClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmActividad.ActivaZ(sql1:string);
begin
  Ztabla.Close;
  Ztabla.SQL.Clear;
  Ztabla.SQL.Add(FormatSQL3(sql1));
  Ztabla.Open;
end;

procedure TFrmActividad.btnActualizarClick(Sender: TObject);
var s : string;
begin

 s:='select Idactividad,Nombre,dni_coordinador from Actividad order by 1';

 ActivaZ(s);

 DBRejilla.Columns[0].Width:=80;
 DBRejilla.Columns[1].Width:=170;
 DBRejilla.Columns[2].Width:=120;
end;

procedure TFrmActividad.BtnNuevoRegistroClick(Sender: TObject);
begin
   FrmDatosActividad.btnLimpiarClick(nil);
   FrmDatosActividad.ShowModal;
   //btnActualizarClick(nil);
end;

procedure TFrmActividad.BtnModificarClick(Sender: TObject);
begin
   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
           FrmDatosActividad.btnLimpiarClick(nil);
           FrmDatosActividad.idtabla:=Ztabla.fields[0].AsString;
           FrmDatosActividad.cargardatos;
           FrmDatosActividad.ShowModal;
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

procedure TFrmActividad.BtnEliminarClick(Sender: TObject);
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
                             EjecutaSQL('DELETE FROM Actividad WHERE idActividad='+ZTABLA.fields[0].AsString,true);
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

procedure TFrmActividad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ztabla.Close;
 Zdetalle.Close;
 //cerrarconexionessql(True);
end;

procedure TFrmActividad.UniFormShow(Sender: TObject);
begin
 Color:=ColorFormulario;
 Font.Color:=ColorFuente;

 btnActualizarClick(nil);
end;

procedure TFrmActividad.btnReporteClick(Sender: TObject);
begin
 // REPORTE DE Actividad
end;

end.
