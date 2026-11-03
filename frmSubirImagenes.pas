unit frmSubirImagenes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniEdit,
  uniPanel, uniImage, uniLabel;

type
  TUniForm1 = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    imgTitulo: TUniImage;
    UniPanel4: TUniPanel;
    edtImgPath: TUniEdit;
    UniPanel5: TUniPanel;
    btnSubirTitulo: TUniBitBtn;
    btnGuardarTitulo: TUniBitBtn;
    btnEliminarTitulo: TUniBitBtn;
    lblDescripcion: TUniLabel;
    btnSalir: TUniBitBtn;
    UniPanel6: TUniPanel;
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniForm1: TUniForm1;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniForm1: TUniForm1;
begin
  Result := TUniForm1(UniMainModule.GetFormInstance(TUniForm1));
end;

procedure TUniForm1.btnSalirClick(Sender: TObject);
begin
  close;
end;

end.
