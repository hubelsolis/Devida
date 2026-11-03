unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleBeforeInit(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function UniServerModule: TUniServerModule;
begin
  Result:=TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleBeforeInit(Sender: TObject);
var
  Lista: TStringList;
  Linea: string;
begin
  Lista := TStringList.Create;
  Linea:='8080';
  try
    Lista.LoadFromFile('port.ini');
    if Lista.Count > 0 then
    begin
      Linea := Trim(Lista[0]); // Primera línea
    end;
  finally
    Lista.Free;
  end;
 self.Port:=strToInt(Linea);
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
