unit ureportecoordinador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMemo, uniMultiItem, uniComboBox, uniLabel,
  uniGUIBaseClasses, uniEdit, uniButton, uniBitBtn;

type
  TfrmCambioFenologico = class(TUniForm)
    cbbactividadOR: TUniComboBox;
    UniLabel3: TUniLabel;
    cbbetapaOR: TUniComboBox;
    UniLabel1: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    cbbActividadDEST: TUniComboBox;
    UniLabel2: TUniLabel;
    cbbEtapaDest: TUniComboBox;
    UniLabel4: TUniLabel;
    log: TUniMemo;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCambioFenologico: TfrmCambioFenologico;

implementation
uses  dm1,operadores;
{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmCambioFenologico: TfrmCambioFenologico;
begin
  Result := TfrmCambioFenologico(UniMainModule.GetFormInstance(TfrmCambioFenologico));
end;

procedure TfrmCambioFenologico.UniFormShow(Sender: TObject);
begin
  if cbbactividadOR.Count=0 then
   BEGIN
     ActivaDM1Consql(
   END;
end;

end.
