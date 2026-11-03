unit uFrmpersona;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs 
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uniBasicGrid,
  uniDBGrid, uniPanel, uniEdit
; 

type
  TFrmpersona = class(TUniForm)
    Panel1: TUniPanel;
    DbRejilla: TUniDBGrid;
    btnActualizar: TUniBitBtn;
    BtnNuevaCompra: TUniBitBtn;
    BtnModificar: TUniBitBtn;
    BtnBuscarModificar: TUniBitBtn;
    BtnEliminar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    ztabla: TZQuery;
    ds1: TDataSource;
    Zdetalle: TZQuery;
    EDTBUSCA: TUniEdit;
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
  Frmpersona: TFrmpersona;

implementation

{$R *.dfm}

uses uniGUIVars, MainModule, uniGUIApplication,uniguioperadores,uniguiUSQLutils,UDBModulo,
  uFrmDatospersona;


 function Frmpersona: TFrmpersona;
  begin 
    Result := TFrmpersona(UniMainModule.GetFormInstance(TFrmpersona));
  end;

procedure TFrmpersona.btnSalirClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmpersona.ActivaZ(sql1:string);
begin
  Ztabla.Close;
  Ztabla.SQL.Clear;
  Ztabla.SQL.Add(FormatSQL3(sql1));
  Ztabla.Open;
end;

procedure TFrmpersona.btnActualizarClick(Sender: TObject);
var s : string;
begin
             //0    1              2              3       4     5         6     7       8
 s:='select Dni,Appaterno,Apmaterno,Nombre,Fecnac,Telefono,Direccion '+
    'from persona where dni like "%'+edtbusca.Text+'%" order by 1,2,3';

 ActivaZ(s);

 DBrejilla.Columns[0].width:=50;
 DBrejilla.Columns[1].width:=100;
 DBrejilla.Columns[2].width:=100;
 DBrejilla.Columns[3].width:=100;
 DBrejilla.Columns[4].width:=50;
 DBrejilla.Columns[5].width:=50;
 DBrejilla.Columns[6].width:=100;

end;

procedure TFrmpersona.FormShow(Sender: TObject);
begin
  // al iniciar
 Color:=ColorFormulario;
 Font.Color:=ColorFuente;

 btnActualizarClick(nil);
end;

procedure TFrmpersona.UniFormShow(Sender: TObject);
begin
  btnActualizarClick(nil);
end;

procedure TFrmpersona.BtnNuevaCompraClick(Sender: TObject);
begin
   FrmDatospersona.btnLimpiarClick(nil);
   FrmDatospersona.ShowModal;
   //btnActualizarClick(nil);
end;

procedure TFrmpersona.BtnModificarClick(Sender: TObject);
begin
   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
           FrmDatospersona.ShowModal(
             procedure (Sender: TComponent; Res:Integer)
                begin
                   btnActualizarClick(nil);
                end
           );
           FrmDatospersona.btnLimpiarClick(nil);
           FrmDatospersona.idtabla:=Ztabla.fields[0].AsString;
           FrmDatospersona.cargardatos;
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

procedure TFrmpersona.BtnEliminarClick(Sender: TObject);
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
                          EjecutaSQL('DELETE FROM persona WHERE dni='+ZTABLA.fields[0].AsString,true);
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

procedure TFrmpersona.BtnBuscarModificarClick(Sender: TObject);
begin
  // BUSQUEDA
end;

procedure TFrmpersona.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ztabla.Close;
 Zdetalle.Close;
 //cerrarconexionessql(True);
end;

procedure TFrmpersona.btnReporteClick(Sender: TObject);
begin
 // REPORTE DE persona
end;

end.
