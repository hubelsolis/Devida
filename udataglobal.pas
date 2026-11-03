unit udataglobal;

interface

uses
  SysUtils, Classes;

type
  TDataGlobal = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    VidAdenda,VidAdenda_Anterior,VNroAdenda,VTipoAdenda : string;
    Vdato1,Vdato2,Vdato3,Vdato4,Vdato5,Vdato6 : string;
    ERRORSQL : string;
  end;

function DataGlobal: TDataGlobal;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function DataGlobal: TDataGlobal;
begin
  Result := TDataGlobal(UniMainModule.GetModuleInstance(TDataGlobal));
end;

initialization
  RegisterModuleClass(TDataGlobal);

end.
