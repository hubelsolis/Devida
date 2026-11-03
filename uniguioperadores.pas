unit uniguioperadores;

interface
 Function StrR(Numero:Double):String;
 Function StrR2(Numero:Double;Digitos,Decimales:Byte):String;
 Function StrI(Numero:int64):String;
 Function ValR(Cadena:String):Extended;
 Function ValI(Cadena:String):Int64;
 Function StrCom(Ntrim:STring;Busca,Pone:String):String;
 Function FormatSQL3(S:WideString):WideString;
 Function FSL3(S:WideString):WideString;
 function VcampoNum(n : double):string; overload;
 function VcampoNum(s : string):string; overload;
 function VcampoInt(s : string):string;
 function VcampoSTR(s : string):string;
 function VcampoSTRFECHA(s : string):string;
 function VcampoSTRsc(s : string):string;
 function comp2(s:string):string;
 function comp4(s:string):string;
 function comp8(s:string):string;
 Function DistanciaF(Fa,Fb:String):Integer;
 Function ValidaFecha(S:String):TDateTime;
 Function CompletarCadena(Base,Cade:String;tama:Byte):String;
 function completar2(s:String):string;
 function completar3(s:String):string;
 function completar4(s:String):string;
 function completar8(s:String):string;
 Function SplitCadena(Sx,separador : String; indice : Byte):String;
 Function booleanToString10(value : boolean):string;
 Function StringToboolean10(value : string):boolean;
 function IsJpegFile(const FileName: string): Boolean;
 function ToTime24(t:string):String;
 function GetTime24:String;
 function fechaLarga(fec : string):string;


 function consultaAPIsSET2022(servicioDato,numero,llave:WideString):WideString;  stdcall external 'servicedniruc.dll';

 const
       FormatoFecha = 'mm-dd-yyyy';

 var
       colorFormulario,ColorFuente,colorboton : integer;
       workdir : string;

implementation

uses SysUtils,DateUtils,System.Classes;

 Function StrR(Numero:Double):String;
 var S:String;
 Begin
   Str(Numero:10:2,S);
   StrR:=StrCOM(S,' ','');
  End; {Convierte un real de doble precision a una cadena}

 Function StrR2(Numero:Double;Digitos,Decimales:Byte):String;
 Var S:String;
  Begin
   Str(Numero:Digitos:Decimales,S);
   StrR2:=Trim(S);
  End; {Permite elegir los digitos y decimales, en la cadena}

 Function StrI(Numero:int64):String;
 Var S:String;
  Begin
   Str(Numero,S);
   StrI:=S;
  End; {Convierte un entero a una cadena}

Function ValR(Cadena:String):Extended;
 Var Rd   : Extended;
     Cod  : Integer;
 Begin
   Val(Cadena,Rd,Cod);
   ValR:=Rd;
  End; // Valida una cadena a Real

 Function ValI(Cadena:String):Int64;
 Var Id : Int64; cod : Integer;
 Begin
   Val(Cadena,Id,Cod);
   ValI:=Id;
  End; {}


 Function StrCom(Ntrim:STring;Busca,Pone:String):String;
 Var i:integer; s:string;
 Begin
    S:='';
    i:=0;
    Repeat
     Inc(i);
     If copy(Ntrim,i,Length(Busca))<>Busca then
      s:=s+copy(Ntrim,i,1)
     Else
      Begin
       s:=s+Pone;
       i:=i+Length(Busca)-1;
      End;
    Until i>=Length(NTrim);
   StrCom:=S;
 End; {Borra de la Cadena el caracte DATO}

Function FormatSQL3(S:WideString):WideString;
 Begin
  FormatSQL3:=StrCom(S,'"',Chr(39));
 End;

Function FSL3(S:WideString):WideString;
 Begin
  FSL3:=StrCom(S,'"',Chr(39));
 End;

function VcampoNum(n : double):string;
 begin
   if n=0 then
    Result:='null'
   else
    Result:=StrR(n);
 end;

function VcampoNum(s : string):string;
 begin
   if ValR(s)=0 then
      Result:='null'
   else
      Result:=StrR(ValR(s));
 end;

 function VcampoInt(s : string):string;
 begin
   if ValR(s)=0 then
      Result:='null'
   else
      Result:=StrI(ValI(s));
 end;

function nocomillas(S:string):string;
 var t : string;
   begin
     t:=StrCom(s,'"','´´');
     t:=StrCom(t,chr(39),'´');
     Result:=Trim(t);
   end;

function VcampoSTR(s : string):string;
 begin
   if s='' then
     Result:='null'
   else
    Result:='"'+nocomillas(s)+'"';
 end;

function VcampoSTRFECHA(s : string):string;
 begin
   if s='' then
     Result:='null'
   else
    Result:='"'+nocomillas( copy(s,4,3)+copy(s,1,3)+copy(s,7,4) )+'"';
 end;

function VcampoSTRsc(s : string):string;
 begin
   if s='' then
     Result:='null'
   else
    Result:=s;
 end;

Function CreaStr(Cade:String;Tama:SmallInt):String;
 Var i:Integer;
     s:String;
  Begin
    s:='';
    if Tama>0 Then
    For i:=1 to Tama do
      S:=S+Cade;
    CreaSTR:=S;
  End;

Function CompletarCadena(Base,Cade:String;tama:Byte):String;
  Begin
   If Tama-Length(Base)>0 Then
    CompletarCadena:=CreaSTR(Cade,Tama-Length(Base))+Base
   Else
    CompletarCadena:=Base;
  End;

function comp2(s:string):string;
 begin
    Result:=CompletarCadena(s,'0',2);
 end;

function comp4(s:string):string;
 begin
    Result:=CompletarCadena(s,'0',4);
 end;


function comp8(s:string):string;
 begin
    Result:=CompletarCadena(s,'0',8);
 end;

Function DistanciaF(Fa,Fb:String):Integer;
 Begin
   result:=DaysBetween ( validaFecha(Fb), validaFecha(Fa) );
 End;

function IntToFecha(x:Integer):String;
 Begin
   if x<10 then intToFecha:='0'+intToSTR(x)
   else intToFecha:=intToSTR(x);
 End;

Function ValidaFecha(S:String):TDateTime;
var dia,mes,anno:SmallInt;
 Begin
   dia:=ValI(Copy(s,1,2));
   mes:=ValI(Copy(s,4,2));
   anno:=ValI(Copy(s,7,4));
   If dia=0 Then dia:=ValI(Copy(DateToStr(Date),1,2));
   If mes=0 then mes:=ValI(Copy(DateToStr(Date),4,2));
   if anno=0 then anno:=ValI(Copy(DateToStr(Date),7,4));
   ValidaFecha:=StrToDate(intToFecha(Dia)+'/'+intToFecha(Mes)+'/'+IntToSTR(anno));
 End;

Function FechaToSQL(D:TdateTime):string; overload;
 begin
  //12/12/2012
  //1234567890
  result:=DateToStr(D);
  result:=copy(result,4,3)+copy(result,1,3)+copy(result,7,4);
 end;


function completar2(s:String):string;
   begin
     Result:=CompletarCadena(s,'0',2);
   end;

function completar3(s:String):string;
   begin
     Result:=CompletarCadena(s,'0',3);
   end;

function completar4(s:String):string;
   begin
     Result:=CompletarCadena(s,'0',4);
   end;

function completar8(s:String):string;
   begin
     Result:=CompletarCadena(s,'0',8);
   end;

Function SplitCadena(Sx,separador : String; indice : Byte):String;
var avanzar : boolean;
    i,j,p : integer;
    S:String;
 Begin
  S:=Sx+Separador;
  p:=1;
  i:=0;
  j:=0;
  Avanzar:=true;
  While (i<Length(S)+1) and (Avanzar) do
   Begin
    inc(i);
    if (copy(S,i,length(separador))=separador) then inc(j);
    if (j>=indice) then avanzar:=false;
    if (copy(S,i,length(separador))=separador) and (avanzar)
     then p:=i+length(separador);
   End;
  Result:=Copy(S,p,i-p);
 end;

Function booleanToString10(value : boolean):string;
 begin
   if value then result:='1'
   else result:='0';
 end;

Function StringToboolean10(value : string):boolean;
 begin
   if value='1' then result:=true
   else result:=false;
 end;

function IsJpegFile(const FileName: string): Boolean;
const
 RightBuf: array[0..3] of Byte = ($FF, $D8, $FF, $D9);
var
 Buf: array[0..3] of Byte;
begin
 FillChar(Buf, 4, 0);
 with TFileStream.Create(FileName, 0) do
 begin
   Position := 0;
   ReadBuffer(Buf[0], 2);
   Position := Size - 2;
   ReadBuffer(Buf[2], 2);
   Free;
 end;
 Result := CompareMem(@RightBuf[0], @Buf[0], 4);
end;

function IsBmpFile(const FileName: string): Boolean;
const
 RightBuf: array[0..1] of Byte = ($42, $4D);
var
 Buf: array[0..1] of Byte;
begin
 FillChar(Buf, 2, 0);
 with TFileStream.Create(FileName, 0) do
 begin
   Position := 0;
   ReadBuffer(Buf[0], 2);
   Free;
 end;
 Result := CompareMem(@RightBuf[0], @Buf[0], 2);
end;

function IsPngFile(const FileName: string): Boolean;
const
 RightBuf: array[0..7] of Byte = ($89, $50 ,$4e, $47, $0d, $0a, $1a ,$0a);
var
 Buf: array[0..7] of Byte;
begin
 FillChar(Buf, 8, 0);
 with TFileStream.Create(FileName, 0) do
 begin
   Position := 0;
   ReadBuffer(Buf[0], 7);
   Free;
 end;
 Result := CompareMem(@RightBuf[0], @Buf[0], 7);
end;

function ToTime24(t:string):String;
 begin
   //T:=TimeToSTR(FBN0W);
   //  12:30:27 a.m.
   //  1234567890123

   if copy(T,2,1)=':' then
    T:='0'+T;

   if (copy(T,1,2)='12') then
      T :=  '00'+Copy(T,3,13);

   if UpperCase(Copy(T,10,1))='P' then
    begin
      T := CompletarCadena( StrI(VALI(Copy(T,1,2))+12),'0',2) + Copy(T,3,6);
    end
   else
      T :=  Copy(T,1,8);
   Result:=T;
 end;

 function GetTime24:String;
//var t,h,m,s,amp : string;
 begin
   RESULT:=formatDateTime ('hh:mm:ss', NOW);
 END;

 function intToMes(m : string):String;
  begin
    case vali(m) of
      1 : result:='enero';
      2 : result:='febrero';
      3 : result:='marzo';
      4 : result:='abril';
      5 : result:='mayo';
      6 : result:='junio';
      7 : result:='julio';
      8 : result:='agosto';
      9 : result:='setiembre';
      10 : result:='octubre';
      11 : result:='noviembre';
      12 : result:='diciembre';
    end;
  end;

 function fechaLarga(fec : string):string;
  begin
    //1234567890
    //12/05/2023
    result:=copy(fec,1,2)+' de '+intToMes(copy(fec,4,2))+' del '+copy(fec,7,4);
  end;

end.
