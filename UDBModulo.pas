unit UDBModulo;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDM1 = class(TDataModule)
    ConSQL: TZQuery;
    DSConSQL: TDataSource;
    AuxSQL: TZQuery;
    DSAuxSQL: TDataSource;
    UtilSQL: TZQuery;
    DSUtilSQL: TDataSource;
    Base_Datos: TZConnection;
    BaseGenericos: TZConnection;
    dsGenerico: TDataSource;
    Zgen: TZQuery;
    ZEjecuta: TZQuery;
    ConsultaSQL: TZQuery;
    Zgenerador: TZQuery;
    ZDetVen: TZQuery;
    ZRegVen: TZQuery;
    ZGuiaRem: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DM1: TDM1;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function DM1: TDM1;
begin
  Result := TDM1(UniMainModule.GetModuleInstance(TDM1));
end;

initialization
  RegisterModuleClass(TDM1);

end.
