unit ufrmbuscador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniEdit, uniBasicGrid,
  uniDBGrid, uniGUIBaseClasses, uniPanel, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFrmBuscador = class(TUniForm)
    UniPanel1: TUniPanel;
    Rejilla: TUniDBGrid;
    btnBuscar: TUniBitBtn;
    btnSeleccionar: TUniBitBtn;
    Zcon: TZQuery;
    DataSource1: TDataSource;
    edtbusca: TUniEdit;
    procedure btnBuscarClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnSeleccionarClick(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtbuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    tipobusqueda : smallint;
  end;

function FrmBuscador: TFrmBuscador;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UDBModulo, uniguiOperadores, udataglobal;

function FrmBuscador: TFrmBuscador;
begin
  Result := TFrmBuscador(UniMainModule.GetFormInstance(TFrmBuscador));
end;

procedure TFrmBuscador.btnBuscarClick(Sender: TObject);
begin
   if tipobusqueda=1 then
    begin
     Zcon.Close;
     Zcon.SQL.Clear;                      //0                1            2              3
     Zcon.SQL.Add(FormatSQL3('SELECT a.IDCASERIO UBIGEO, a.AMBITO, a.DEPARTAMENTO, a.PROVINCIA, '+
                  'a.DISTRITO, a.CASERIO '+
                  'FROM CASERIO a '+
                  'WHERE a.caserio like "%'+edtbusca.text+'%" or a.IDCASERIO="'+StrI(ValI(edtbusca.text))+'";'));
     Zcon.Open;

     Rejilla.Columns[0].Width:=75;
     Rejilla.Columns[1].Width:=50;
     Rejilla.Columns[2].Width:=90;
     Rejilla.Columns[3].Width:=90;
     Rejilla.Columns[4].Width:=90;
     Rejilla.Columns[5].Width:=150;
    end;
   if tipobusqueda=2 then
    begin
     Zcon.Close;
     Zcon.SQL.Clear;                      //0                1            2              3
     Zcon.SQL.Add(FormatSQL3('SELECT a.IDACTIVIDAD FROM ACTIVIDAD a'));
     Zcon.Open;

     Rejilla.Columns[0].Width:=250;
    end;
end;

procedure TFrmBuscador.btnSeleccionarClick(Sender: TObject);
begin
 if zcon.active then
   if zcon.RecordCount>0 then
     begin
      if TipoBusqueda=1 then
        begin
          DataGlobal.Vdato1:=Zcon.Fields[0].AsString;
          DataGlobal.Vdato2:=Zcon.Fields[1].AsString;
          DataGlobal.Vdato3:=Zcon.Fields[2].AsString;
          DataGlobal.Vdato4:=Zcon.Fields[3].AsString;
          DataGlobal.Vdato5:=Zcon.Fields[4].AsString;
          DataGlobal.Vdato6:=Zcon.Fields[5].AsString;
          close;
        end;
      if TipoBusqueda=2 then
        begin
          DataGlobal.Vdato1:=Zcon.Fields[0].AsString;
          close;
        end;
     end;
end;

procedure TFrmBuscador.edtbuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if KEY=13 then
    BEGIN
      btnBuscarClick(NIL);
    END;
end;

procedure TFrmBuscador.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
 zcon.Close;
end;

procedure TFrmBuscador.UniFormShow(Sender: TObject);
begin
  DataGlobal.Vdato1:='';
  DataGlobal.Vdato2:='';
  DataGlobal.Vdato3:='';
  DataGlobal.Vdato4:='';
  DataGlobal.Vdato5:='';
  DataGlobal.Vdato6:='';
end;

end.
