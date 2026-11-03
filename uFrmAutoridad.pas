unit uFrmAutoridad;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs 
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uniBasicGrid,
  uniDBGrid, uniPanel, uniEdit
; 

type
  TFrmAutoridad = class(TUniForm)
    Panel1: TUniPanel;
    dbRejilla: TUniDBGrid;
    btnBuscar: TUniBitBtn;
    BtnModificarAutoridad: TUniBitBtn;
    BtnEliminarAutoridad: TUniBitBtn;
    btnSalir: TUniBitBtn;
    ztabla: TZQuery;
    ds1: TDataSource;
    Zdetalle: TZQuery;
    edtbusca: TUniEdit;
    procedure btnSalirClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNuevaAutoridadClick(Sender: TObject);
    procedure BtnModificarAutoridadClick(Sender: TObject);
    procedure BtnEliminarAutoridadClick(Sender: TObject);
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
  FrmAutoridad: TFrmAutoridad;

implementation

{$R *.dfm}

uses uniGUIVars, MainModule, uniGUIApplication,uniGuioperadores,uniGuiUSQLutils,
  uFrmDatosAutoridad, UDBModulo, Main;

 function FrmAutoridad: TFrmAutoridad;
  begin 
    Result := TFrmAutoridad(UniMainModule.GetFormInstance(TFrmAutoridad));
  end;

procedure TFrmAutoridad.btnSalirClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmAutoridad.ActivaZ(sql1:string);
begin
  Ztabla.Close;
  Ztabla.SQL.Clear;
  Ztabla.SQL.Add(FormatSQL3(sql1));
  Ztabla.Open;
end;

procedure TFrmAutoridad.btnBuscarClick(Sender: TObject);
var s : string;
begin

 s:='select a.Idcaserio, c.distrito,c.caserio, a.Dni,a.Fecha,a.Cargo,a.Resolucion, '+
    'case a.Estado when 0 then "INACTIVO" when 1 then "ACTIVO" else a.Estado end ESTADO '+
    'from Autoridad a inner join caserio c using(idcaserio) '+
    'where c.caserio like "%'+edtbusca.text+'%" '+
    'order by idcaserio';

 ActivaZ(s);

 DBrejilla.Columns[0].width:=75;

 DBrejilla.Columns[1].width:=100;
 DBrejilla.Columns[2].width:=150;

 DBrejilla.Columns[3].width:=60;
 DBrejilla.Columns[4].width:=70;
 DBrejilla.Columns[5].width:=90;
 DBrejilla.Columns[6].width:=90;
 DBrejilla.Columns[7].width:=80;

end;

procedure TFrmAutoridad.FormShow(Sender: TObject);
begin
  // al iniciar
 Color:=ColorFormulario;
 Font.Color:=ColorFuente;

 btnBuscarClick(nil);
end;

procedure TFrmAutoridad.UniFormShow(Sender: TObject);
var i : shortint; P : String;
begin
  btnBuscarClick(nil);
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

procedure TFrmAutoridad.btnNuevaAutoridadClick(Sender: TObject);
begin
   FrmDatosAutoridad.btnLimpiarClick(nil);
   FrmDatosAutoridad.edtIdcaserio.Text:=ztabla.Fields[0].AsString;
   FrmDatosAutoridad.lblcaserio.Caption:=ztabla.Fields[2].AsString;
   FrmDatosAutoridad.ShowModal;
   //btnActualizarClick(nil);
end;

procedure TFrmAutoridad.BtnModificarAutoridadClick(Sender: TObject);
begin
   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
           FrmDatosAutoridad.btnLimpiarClick(nil);
           FrmDatosAutoridad.idtabla:=Ztabla.fields[0].AsString;
           FrmDatosAutoridad.idtabla2:=Ztabla.fields[3].AsString;
           FrmDatosAutoridad.cargardatos;
           FrmDatosAutoridad.ShowModal;
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

procedure TFrmAutoridad.BtnEliminarAutoridadClick(Sender: TObject);
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
                             EjecutaSQL('DELETE FROM Autoridad '+
                             'WHERE IdCaserio="'+ZTABLA.fieldbyName('IdCaserio').AsString+
                             '" and DNI="'+ZTABLA.fieldbyName('DNI').AsString+'"',true);
                             btnBuscarClick(nil);
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

procedure TFrmAutoridad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ztabla.Close;
 Zdetalle.Close;
 //cerrarconexionessql(True);
end;

procedure TFrmAutoridad.btnReporteClick(Sender: TObject);
begin
 // REPORTE DE Autoridad
end;

end.
