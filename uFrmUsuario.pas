unit uFrmUsuario;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs 
,uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uniBasicGrid,
  uniDBGrid, uniPanel, uniMemo
; 

type
  TFrmUsuario = class(TUniForm)
    Panel1: TUniPanel;
    dbRejilla: TUniDBGrid;
    btnActualizar: TUniBitBtn;
    BtnModificar: TUniBitBtn;
    BtnEliminar: TUniBitBtn;
    btnSalir: TUniBitBtn;
    ztabla: TZQuery;
    ds1: TDataSource;
    Zdetalle: TZQuery;
    UniButton1: TUniButton;
    UniMemo1: TUniMemo;
    procedure btnSalirClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNuevoRegistroClick(Sender: TObject);
    procedure BtnModificarClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReporteClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure ActivaZ(sql1:string);
  end;

function
  FrmUsuario: TFrmUsuario;

implementation

{$R *.dfm}

uses uniGUIVars, MainModule, uniGUIApplication,uniGuioperadores,uniGuiUSQLutils,
  uFrmDatosUsuario, UDBModulo, udataglobal;

 function FrmUsuario: TFrmUsuario;
  begin 
    Result := TFrmUsuario(UniMainModule.GetFormInstance(TFrmUsuario));
  end;

procedure TFrmUsuario.btnSalirClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmUsuario.ActivaZ(sql1:string);
begin
  Ztabla.Close;
  Ztabla.SQL.Clear;
  Ztabla.SQL.Add(FormatSQL3(sql1));
  Ztabla.Open;
end;

procedure TFrmUsuario.btnActualizarClick(Sender: TObject);
var s : string;
begin

 s:='select  Dni,Usuario,Clave,Tipousuario,Permisos,Estado '+
    'from Usuario ORDER BY 1';

 ActivaZ(s);

  dbrejilla.Columns[0].Width:=60;
  dbrejilla.Columns[1].Width:=70;
  dbrejilla.Columns[2].Width:=70;
  dbrejilla.Columns[3].Width:=70;
  dbrejilla.Columns[4].Width:=70;
  dbrejilla.Columns[5].Width:=70;
end;

procedure TFrmUsuario.FormShow(Sender: TObject);
begin
  // al iniciar
 Color:=ColorFormulario;
 Font.Color:=ColorFuente;

 btnActualizarClick(nil);
end;

procedure TFrmUsuario.UniButton1Click(Sender: TObject);
var i,j : integer;   s : string;
begin
  ActivaDM1ConsultaSQL('select p.dni,p.nombre,p.appaterno,p.apmaterno, '+
  '(SELECT FIRST 1 a.IDACTIVIDAD FROM ACTIVIDADUSUARIO a where a.DNI=p.DNI) '+
  'from persona p where p.dni in '+
  '(select distinct DNI_tecnico from movpadron m where m.IDADENDA="'+dataGlobal.VidAdenda+'") '+
  'order by 1',true);
  unimemo1.Lines.Clear;
  unimemo1.Visible:=true;
  for i:=1 to DM1.ConsultaSQL.RecordCount do
   begin
     if i>1 then DM1.ConsultaSQL.Next;
     ActivaDM1UtilSQL('select m.IDMOVPADRON from MOVPADRON m where m.DNI_TECNICO="'+DM1.ConsultaSQL.Fields[0].AsString+'" order by 1;',true);
     for j := 1 to DM1.UtilSQL.RecordCount do
       begin
         if j>1 then DM1.UtilSQL.Next;
         s:=completar3(stri(j))+'-'+
            copy(dataGlobal.VidAdenda,length(dataGlobal.VidAdenda)-3,4)+'-'+
            DM1.ConsultaSQL.Fields[4].AsString+'-'+
            Copy(DM1.ConsultaSQL.Fields[1].AsString,1,1)+
            Copy(DM1.ConsultaSQL.Fields[2].AsString,1,1)+
            Copy(DM1.ConsultaSQL.Fields[3].AsString,1,1);
         uniMemo1.lines.add(FSL3('update movpadron set nro_informe="'+s+'" where idmovpadron="'+DM1.utilSQL.Fields[0].AsString+'";'));
       end;


   end;
end;

procedure TFrmUsuario.UniFormShow(Sender: TObject);
begin
 btnActualizarClick(nil);
end;

procedure TFrmUsuario.BtnNuevoRegistroClick(Sender: TObject);
begin
   FrmDatosUsuario.btnLimpiarClick(nil);
   FrmDatosUsuario.ShowModal;
   //btnActualizarClick(nil);
end;

procedure TFrmUsuario.BtnModificarClick(Sender: TObject);
begin
   IF ztabla.active then
    BEGIN
      if ztabla.recordcount>0 then
        begin
           FrmDatosUsuario.btnLimpiarClick(nil);
           FrmDatosUsuario.idtabla:=Ztabla.fields[0].AsString;
           FrmDatosUsuario.cargardatos;
           FrmDatosUsuario.ShowModal;
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

procedure TFrmUsuario.BtnEliminarClick(Sender: TObject);
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
                             EjecutaSQL('DELETE FROM Usuario WHERE idUsuario='+ZTABLA.fields[0].AsString,true);
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

procedure TFrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ztabla.Close;
 Zdetalle.Close;
 //cerrarconexionessql(True);
end;

procedure TFrmUsuario.btnReporteClick(Sender: TObject);
begin
 // REPORTE DE Usuario
end;

end.
