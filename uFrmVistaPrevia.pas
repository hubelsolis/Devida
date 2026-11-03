unit uFrmVistaPrevia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniURLFrame, uniButton,
  uniBitBtn, uniPanel;

type
  TFrmVistaPrevia = class(TUniForm)
    UniURLFrame1: TUniURLFrame;
    UniPanel1: TUniPanel;
    UniBitBtn1: TUniBitBtn;
    UniBitBtn2: TUniBitBtn;
    procedure UniFormCreate(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmVistaPrevia: TFrmVistaPrevia;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uniguioperadores, ureportes;

function FrmVistaPrevia: TFrmVistaPrevia;
begin
  Result := TFrmVistaPrevia(UniMainModule.GetFormInstance(TFrmVistaPrevia));
end;

procedure TFrmVistaPrevia.UniBitBtn1Click(Sender: TObject);
begin
// if frmReportes.showNormal=0 then
//  frmReportes.Close;
 close;
end;

procedure TFrmVistaPrevia.UniBitBtn2Click(Sender: TObject);
begin
// if frmReportes.showNormal=0 then
//    frmReportes.Close;
 close;
end;

procedure TFrmVistaPrevia.UniFormCreate(Sender: TObject);
begin
 color := ColorFormulario
end;

end.
