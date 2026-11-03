unit uFrmmovimientos;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uniBasicGrid,
  uniDBGrid, uniPanel
;

type
  TFrmmovimientos = class(TUniForm)
    Panel1: TUniPanel;
    dbRejilla: TUniDBGrid;
    btnActualizar: TUniBitBtn;
    BtnModificarMovimiento: TUniBitBtn;
    BtnEliminarMovimiento: TUniBitBtn;
    btnSalir: TUniBitBtn;
    ztabla: TZQuery;
    ds1: TDataSource;
    Zdetalle: TZQuery;
    procedure btnSalirClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNuevoMovimientoClick(Sender: TObject);
    procedure BtnModificarMovimientoClick(Sender: TObject);
    procedure BtnEliminarMovimientoClick(Sender: TObject);
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
  Frmmovimientos: TFrmmovimientos;

implementation

{$R *.dfm}

uses uniGUIVars, MainModule, uniGUIApplication,uniGuioperadores,uniGuiUSQLutils,
  uFrmDatosmovimientos, UDBModulo, Main;

 function Frmmovimientos: TFrmmovimientos;
  begin 
    Result := TFrmmovimientos(UniMainModule.GetFormInstance(TFrmmovimientos));
  end;

procedure TFrmmovimientos.btnSalirClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmmovimientos.ActivaZ(sql1:string);
begin
  Ztabla.Close;
  Ztabla.SQL.Clear;
  Ztabla.SQL.Add(FormatSQL3(sql1));
  Ztabla.Open;
end;

procedure TFrmmovimientos.btnActualizarClick(Sender: TObject);
var s : string;
begin

 s:='select  Tipomovimiento,Subtipomov,Operacion,Referencia,Orden '+
      'from movimientos';

 ActivaZ(s);

  dbrejilla.Columns[0].Width:=110;
  dbrejilla.Columns[1].Width:=140;
  dbrejilla.Columns[2].Width:=80;
  dbrejilla.Columns[3].Width:=85;
  dbrejilla.Columns[4].Width:=56;

end;

procedure TFrmmovimientos.FormShow(Sender: TObject);
begin
  // al iniciar
 Color:=ColorFormulario;
 Font.Color:=ColorFuente;

 btnActualizarClick(nil);
end;

procedure TFrmmovimientos.UniFormShow(Sender: TObject);
var i : shortint; P : String;
begin
  btnactualizarclick(nil);

  //procesa permisos personalizado desde un memo llamado mmopermisos    var i : shortint; P : String;
  // que tiene la estructura TipoUser.Formulario.Componente.Propiedad.Valor
  for i:=0 to MainForm.mmopermisos.Lines.Count-1 do
   begin
     //1            2          3           4       5
     //TipoUser.Formulario.Componente.Propiedad.Valor
     P:=MainForm.mmopermisos.Lines[i];
      if uppercase(MainForm.lbltipoUsuario.caption)=SplitCadena(P,'.',1) then
       if UpperCase(Self.Name)=SplitCadena(P,'.',2) then
        begin
         if Assigned( Self.FindComponent( SplitCadena(P,'.',3) ) ) then
            begin
              if SplitCadena(P,'.',4)='ENABLED' Then TUniControl(Self.FindComponent( SplitCadena(P,'.',3) )).Enabled:=StrToBool(SplitCadena(P,'.',5));
              if SplitCadena(P,'.',4)='VISIBLE' Then TUniControl(Self.FindComponent( SplitCadena(P,'.',3) )).Visible:=StrToBool(SplitCadena(P,'.',5));
            end
         else
           ShowMessage(Self.Name+' Error en Permiso, no se puede ubicar : '+SplitCadena(P,'.',2) );
        end;
   end;
end;

procedure TFrmmovimientos.BtnNuevoMovimientoClick(Sender: TObject);
begin
   FrmDatosmovimientos.btnLimpiarClick(nil);
   FrmDatosmovimientos.ShowModal;
   //btnActualizarClick(nil);
end;

procedure TFrmmovimientos.BtnModificarMovimientoClick(Sender: TObject);
begin
   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
           FrmDatosmovimientos.btnLimpiarClick(nil);
           FrmDatosmovimientos.idtabla:=Ztabla.fields[0].AsString;
           FrmDatosmovimientos.idtabla2:=Ztabla.fields[1].AsString;
           FrmDatosmovimientos.cargardatos;
           FrmDatosmovimientos.ShowModal;
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

procedure TFrmmovimientos.BtnEliminarMovimientoClick(Sender: TObject);
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
                             EjecutaSQL('DELETE FROM movimientos '+
                             'WHERE TIPOMOVIMIENTO="'+ZTABLA.fields[0].AsString+'" AND SUBTIPOMOV="'+ZTABLA.fields[1].AsString+'"',true);
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

procedure TFrmmovimientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ztabla.Close;
 Zdetalle.Close;
 //cerrarconexionessql(True);
end;

procedure TFrmmovimientos.btnReporteClick(Sender: TObject);
begin
 // REPORTE DE movimientos
end;

end.
