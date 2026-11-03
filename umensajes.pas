unit umensajes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses, uniButton;

type
  TfrmMensajes = class(TUniForm)
    UniButton1: TUniButton;
    lblMensaje: TUniLabel;
    lblUrl: TUniLabel;
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmMensajes: TfrmMensajes;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmMensajes: TfrmMensajes;
begin
  Result := TfrmMensajes(UniMainModule.GetFormInstance(TfrmMensajes));
end;

procedure TfrmMensajes.UniButton1Click(Sender: TObject);
begin
 close;
end;

end.
