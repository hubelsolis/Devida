
unit uniguiusqlutils;

interface
Uses ZAbstractRODataset, ZAbstractDataset, ZDataset,SysUtils,Dialogs,DB,Classes,math;
Type TipoQuery = TZQuery;
type str_two = string[2];
type str_four = string[4];
type str_eigth = string[8];
type str_sixteen = string[16];
type str_cuentas = string[32];


Procedure ActivaDM1ConSQL(Orden:String);
Procedure ActivaDM1AuxSQL(Orden:String);
Procedure ActivaDM1UtilSQL(Orden:String;Recuperar:Boolean);
Procedure ActivaDM1ConsultaSQL(Orden:WideString;Recuperar:Boolean);
function ActivaDM1ConRegistro(Orden:WideString;col:smallint):string;
Function EjecutaSQL(Linea:wideString;ConTransaccion:Boolean):Boolean;
procedure ObtenerAdendaActual;
function recuperanombre(dni,sep:string):string;

implementation

uses UDBModulo,uniguiOPERADORES,udataglobal;

Procedure ActivaDM1ConSQL(Orden:String);
 Begin
    DM1.ConSQL.Close;
    DM1.ConSQL.SQL.Clear;
    DM1.ConSQL.SQL.add(FormatSQL3(Orden));
    DM1.ConSQL.Open;
    DM1.ConSQL.FetchAll;
 End;

 Procedure ActivaDM1AuxSQL(Orden:String);
 Begin
    DM1.AuxSQL.Close;
    DM1.AuxSQL.SQL.Clear;
    DM1.AuxSQL.SQL.add(FormatSQL3(Orden));
    DM1.AuxSQL.Open;
    DM1.AuxSQL.FetchAll;
 End;

 Procedure ActivaDM1UtilSQL(Orden:String;Recuperar:Boolean);
 Begin
    DM1.UtilSQL.Close;
    DM1.UtilSQL.SQL.Clear;
    DM1.UtilSQL.SQL.add(FormatSQL3(Orden));
    DM1.UtilSQL.Open;
    If Recuperar Then DM1.UtilSQL.FetchAll;
 End;

Procedure ActivaDM1ConsultaSQL(Orden:WideString;Recuperar:Boolean);
 Begin
    DM1.ConsultaSQL.Close;
    DM1.ConsultaSQL.SQL.Clear;
    DM1.ConsultaSQL.SQL.add(FormatSQL3(Orden));
    DM1.ConsultaSQL.Open;
    If Recuperar Then DM1.ConsultaSQL.FetchAll;
 End;

function ActivaDM1ConRegistro(Orden:WideString;col:smallint):string;
var i : smallint;
 Begin
    DM1.ConsultaSQL.Close;
    DM1.ConsultaSQL.SQL.Clear;
    DM1.ConsultaSQL.SQL.add(FormatSQL3(Orden));
    DM1.ConsultaSQL.Open;
      if col>1 then
        begin
          Result:='';
          for i := 0 to col-1 do
            Result:=Result+DM1.ConsultaSQL.Fields[i].AsString+'|';
        end
      else
        begin
            Result:=DM1.ConsultaSQL.Fields[0].AsString;
        end;
    DM1.ConsultaSQL.Close;
 End;

Function EjecutaSQL(Linea:wideString;ConTransaccion:Boolean):Boolean;
Var Retorno : Boolean;
    Depuracion : TStringList;
    fn : string;
 Begin
  Retorno:=False;
  If Linea<>'' then
   Begin
    DM1.ZEjecuta.SQL.Clear;
    DM1.ZEjecuta.SQL.add(FormatSQL3(Linea));

    IF ConTransaccion then DM1.Base_Datos.StartTransaction;

    DataGlobal.ERRORSQL:='';
        Try
          DM1.ZEjecuta.ExecSQL;
        Except
          ON Error: EInOutError DO
            DataGlobal.ERRORSQL:=DataGlobal.ERRORSQL+'EInOutError: '+Error.Message;
          ON Error: Exception DO
            DataGlobal.ERRORSQL:=DataGlobal.ERRORSQL+'Exception: '+Error.Message;
        End;

        if DataGlobal.ERRORSQL='' then  Retorno:=True
        else
          begin
            Retorno:=false;
            if true then
              begin
                Depuracion := TStringList.Create;
                 Depuracion.Add(FormatSQL3(Linea));
                 Depuracion.Add('--'+DataGlobal.ERRORSQL);
                 Randomize;
                 fn:=Stri(Random(100))+Stri(Random(100))+Stri(Random(100));
                 Depuracion.SaveToFile(WORKDIR+'\error\'+fn+'.LOG');
                Depuracion.Free;
              end;
          end;

    IF ConTransaccion then
      Begin
        //ERRORSQL:='';
        try
          DM1.Base_Datos.Commit;
        except
          ON Error: EInOutError DO
           BEGIN
             DM1.Base_Datos.Rollback;
             Retorno:=False;
             DataGlobal.ERRORSQL:=DataGlobal.ERRORSQL+'tr_EInOutError_C: '+Error.Message;
           end;
          ON Error: Exception DO
           BEGIN
             DM1.Base_Datos.Rollback;
             Retorno:=False;
             DataGlobal.ERRORSQL:=DataGlobal.ERRORSQL+'tr_Exception_C: '+Error.Message;
           end;
        end;
      end;
   End;
  EjecutaSQL:=Retorno;
 End;

 procedure ObtenerAdendaActual;
  begin
   ActivaDM1ConsultaSQL('select idadenda,adenda_anterior,tipo,nro from adenda where estado="ACTIVO"',true);
     DataGlobal.VidAdenda:=DM1.ConsultaSQL.Fields[0].AsString;
     DataGlobal.VidAdenda_anterior:=DM1.ConsultaSQL.Fields[1].AsString;
     DataGlobal.VTipoAdenda:=DM1.ConsultaSQL.Fields[2].AsString;
     if DataGlobal.VTipoAdenda='' then DataGlobal.VTipoAdenda:='00';
     DataGlobal.VNroAdenda:=DM1.ConsultaSQL.Fields[3].AsString;
   DM1.ConsultaSQL.close;
  end;

 function recuperanombre(dni,sep:string):string;
  begin
   ActivaDM1ConsultaSQL('SELECT a.NOMBRE, a.APPATERNO, a.APMATERNO FROM PERSONA a where a.DNI="'+dni+'"',true);
     result:=DM1.ConsultaSQL.Fields[0].AsString+sep+
             DM1.ConsultaSQL.Fields[1].AsString+sep+
             DM1.ConsultaSQL.Fields[2].AsString;
   DM1.ConsultaSQL.close;
  end;


end.
