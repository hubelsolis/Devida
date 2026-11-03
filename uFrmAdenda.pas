unit uFrmadenda;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uniBasicGrid,
  uniDBGrid, uniPanel
;

type
  TFrmadenda = class(TUniForm)
    Panel1: TUniPanel;
    DBrejilla: TUniDBGrid;
    btnActualizar: TUniBitBtn;
    BtnNuevaCompra: TUniBitBtn;
    BtnModificar: TUniBitBtn;
    BtnEliminar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    ztabla: TZQuery;
    ds1: TDataSource;
    Zdetalle: TZQuery;
    procedure btnSalirClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNuevaCompraClick(Sender: TObject);
    procedure BtnModificarClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnBuscarModificarClick(Sender: TObject);
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
   Frmadenda: TFrmadenda;

implementation

{$R *.dfm}

uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,uniguiUSQLutils,
     UDBModulo,uFrmDatosadenda;

 function Frmadenda: TFrmadenda;
  begin
    Result := TFrmadenda(UniMainModule.GetFormInstance(TFrmadenda));
  end;

procedure TFrmadenda.btnSalirClick(Sender: TObject);
begin
 Close;

end;

procedure TFrmadenda.ActivaZ(sql1:string);
begin
  Ztabla.Close;
  Ztabla.SQL.Clear;
  Ztabla.SQL.Add(FormatSQL3(sql1));
  Ztabla.Open;
end;

procedure TFrmadenda.btnActualizarClick(Sender: TObject);
var s : string;
begin
               //0      1      2    3          4             5
  s:='select Idadenda,Nombre,Fecha,estado,Adenda_Anterior ANTERIOR '+
     'from adenda ORDER BY FECHA DESC';

  ActivaZ(s);

  dbrejilla.Columns[0].Width:=70;
  dbrejilla.Columns[1].Width:=180;
  //dbrejilla.Columns[2].Width:=90;
  dbrejilla.Columns[2].Width:=90;
  dbrejilla.Columns[3].Width:=70;
  dbrejilla.Columns[4].Width:=80;

end;

procedure TFrmadenda.FormShow(Sender: TObject);
begin
  // al iniciar
 Color:=ColorFormulario;
 Font.Color:=ColorFuente;

 btnActualizarClick(nil);
end;

procedure TFrmadenda.UniFormShow(Sender: TObject);
begin
  btnActualizarClick(nil);
end;

procedure TFrmadenda.BtnNuevaCompraClick(Sender: TObject);
begin
   FrmDatosadenda.btnLimpiarClick(nil);
   FrmDatosadenda.ShowModal;
   //btnActualizarClick(nil);
end;

procedure TFrmadenda.BtnModificarClick(Sender: TObject);
begin
   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
         FrmDatosadenda.btnLimpiarClick(nil);
         FrmDatosadenda.idtabla:=Ztabla.fields[0].AsString;
         FrmDatosadenda.cargardatos;
         FrmDatosadenda.ShowModal;
         ObtenerAdendaActual;
         //btnActualizarClick(nil);
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

procedure TFrmadenda.BtnEliminarClick(Sender: TObject);
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
                          EjecutaSQL('DELETE FROM adenda WHERE idadenda="'+ZTABLA.fields[0].AsString+'";',true);
                          btnActualizarClick(nil);
                        end;
                mrNo :  begin
                        end;
              end;
            end
          );
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

procedure TFrmadenda.BtnBuscarModificarClick(Sender: TObject);
begin
  // BUSQUEDA
end;

procedure TFrmadenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ztabla.Close;
 Zdetalle.Close;
 //cerrarconexionessql(True);
end;

procedure TFrmadenda.btnReporteClick(Sender: TObject);
begin
 // REPORTE DE adenda
end;

end.
