unit uFrmcaserio;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs 
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uniBasicGrid,
  uniDBGrid, uniPanel, uniMemo, uniEdit
; 

type
  TFrmcaserio = class(TUniForm)
    Panel1: TUniPanel;
    dbRejilla: TUniDBGrid;
    btnActualizar: TUniBitBtn;
    BtnModificarCaserio: TUniBitBtn;
    BtnBuscadorCaserio: TUniBitBtn;
    BtnEliminarCaserio: TUniBitBtn;
    btnSalir: TUniBitBtn;
    ztabla: TZQuery;
    ds1: TDataSource;
    Zdetalle: TZQuery;
    UniMemo1: TUniMemo;
    edtbusca: TUniEdit;
    procedure btnSalirClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNuevoCaserioClick(Sender: TObject);
    procedure BtnModificarCaserioClick(Sender: TObject);
    procedure BtnEliminarCaserioClick(Sender: TObject);
    procedure BtnBuscadorCaserioClick(Sender: TObject);
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
  Frmcaserio: TFrmcaserio;

implementation

{$R *.dfm}

uses uniGUIVars, MainModule, uniGUIApplication,uniGuioperadores,uniGuiUSQLutils,
  UDBModulo, uFrmDatoscaserio, ufrmbuscador, Main;

 function Frmcaserio: TFrmcaserio;
  begin 
    Result := TFrmcaserio(UniMainModule.GetFormInstance(TFrmcaserio));
  end;

procedure TFrmcaserio.btnSalirClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmcaserio.ActivaZ(sql1:string);
begin
  Ztabla.Close;
  Ztabla.SQL.Clear;
  Ztabla.SQL.Add(FormatSQL3(sql1));
  Ztabla.Open;
end;

procedure TFrmcaserio.btnActualizarClick(Sender: TObject);
var s : string;
begin

 s:='select  Idcaserio,Ambito,Departamento,Provincia,Distrito,Caserio,Region_natural,Coorx,Coory,Altitud '+
    'from caserio '+
    'where caserio like "%'+edtbusca.text+'%" '+
    'order by departamento,provincia,distrito,idcaserio;';

 ActivaZ(s);

  dbrejilla.Columns[0].Width:=82;
  dbrejilla.Columns[1].Width:=54;
  dbrejilla.Columns[2].Width:=105;
  dbrejilla.Columns[3].Width:=84;
  dbrejilla.Columns[4].Width:=80;
  dbrejilla.Columns[5].Width:=182;
  dbrejilla.Columns[6].Width:=115;
  dbrejilla.Columns[7].Width:=60;
  dbrejilla.Columns[8].Width:=60;
  dbrejilla.Columns[9].Width:=60;

end;

procedure TFrmcaserio.FormShow(Sender: TObject);
begin
  // al iniciar
 Color:=ColorFormulario;
 Font.Color:=ColorFuente;

 btnActualizarClick(nil);
end;

procedure TFrmcaserio.UniFormShow(Sender: TObject);
var i : shortint; P : String;
begin
  btnActualizarClick(NIL);

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

procedure TFrmcaserio.BtnNuevoCaserioClick(Sender: TObject);
begin
   FrmDatoscaserio.btnLimpiarClick(nil);
   FrmDatoscaserio.ShowModal;
   //btnActualizarClick(nil);
end;

procedure TFrmcaserio.BtnModificarCaserioClick(Sender: TObject);
begin
   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
           FrmDatoscaserio.btnLimpiarClick(nil);
           FrmDatoscaserio.idtabla:=Ztabla.fields[0].AsString;
           FrmDatoscaserio.cargardatos;
           FrmDatoscaserio.ShowModal;
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

procedure TFrmcaserio.BtnEliminarCaserioClick(Sender: TObject);
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
                              EjecutaSQL('DELETE FROM caserio WHERE idcaserio='+ZTABLA.fields[0].AsString,true);
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

procedure TFrmcaserio.BtnBuscadorCaserioClick(Sender: TObject);
var i : integer;
begin
  // BUSQUEDA
  {
  for i := 0 to dbrejilla.Columns.Count-1 do
   begin
     unimemo1.lines.add('dbrejilla.Columns['+stri(i)+'].Width:='+StrI(dbrejilla.Columns[i].Width)+';');
   end;
  }
  FrmBuscador.tipobusqueda:=1;
  FrmBuscador.ShowModal;
end;

procedure TFrmcaserio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ztabla.Close;
 Zdetalle.Close;
 //cerrarconexionessql(True);
end;

procedure TFrmcaserio.btnReporteClick(Sender: TObject);
begin
 // REPORTE DE caserio
end;

end.
