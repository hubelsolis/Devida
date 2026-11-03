object DM1: TDM1
  OldCreateOrder = False
  Height = 372
  Width = 465
  object ConSQL: TZQuery
    Connection = Base_Datos
    ReadOnly = True
    SQL.Strings = (
      
        'SELECT a.NROCORRELATIVO, a.FECHAEMISION, a.FECHAVENCIMIENTO, a.T' +
        'IPOCOMPROBANTE, a.SERIECO, a.NUMEROCO, a.TIPODOCUMENTO, a.NRODOC' +
        'UMENTO, a.RAZONNOMBRE, a.VEXPORTACION, a.BASEIMPONIBLE, a.IGVIPM' +
        ', a.TOTALEXONERADA, a.OTROSTRIBUTOS, a.IMPORTETOTAL, a.TIPOCAMBI' +
        'O, a.RCPFECHA, a.RCPTIPO, a.RCPSERIE, a.RCPNUMERO, a.DUAL, a.TUR' +
        'NO, a.PUNTOVENTA as ISLA, a.MAQUINAVENTA as MANGUERA FROM REGIST' +
        'ROVENTAS a where a.fechaemision>='#39'01-01-2010'#39' and fechaemision<=' +
        #39'01-31-2010'#39' ')
    Params = <>
    Left = 122
    Top = 15
  end
  object DSConSQL: TDataSource
    DataSet = ConSQL
    Left = 210
    Top = 15
  end
  object AuxSQL: TZQuery
    Connection = Base_Datos
    ReadOnly = True
    Params = <>
    Left = 124
    Top = 76
  end
  object DSAuxSQL: TDataSource
    DataSet = AuxSQL
    Left = 212
    Top = 76
  end
  object UtilSQL: TZQuery
    Connection = Base_Datos
    ReadOnly = True
    Params = <>
    Left = 124
    Top = 136
  end
  object DSUtilSQL: TDataSource
    DataSet = UtilSQL
    Left = 212
    Top = 136
  end
  object Base_Datos: TZConnection
    ControlsCodePage = cCP_UTF16
    ClientCodepage = 'WIN1252'
    Catalog = ''
    Properties.Strings = (
      'codepage=WIN1252')
    TransactIsolationLevel = tiReadCommitted
    HostName = 'localhost'
    Port = 3050
    Database = 'D:\HSWARE\devida\DEVIDA.FDB'
    User = 'sysdba'
    Password = 'baex1623'
    Protocol = 'firebird-2.5'
    LibraryLocation = 'D:\HSWARE\003_PROGRAMAS\validador\fbclient.dll'
    Left = 20
    Top = 12
  end
  object BaseGenericos: TZConnection
    ControlsCodePage = cCP_UTF16
    ClientCodepage = 'WIN1252'
    Catalog = ''
    Properties.Strings = (
      'codepage=WIN1252')
    TransactIsolationLevel = tiReadCommitted
    HostName = 'localhost'
    Port = 3050
    Database = 'D:\HSWARE\LiquidadorV6EXP\DATABASE.FDB'
    User = 'sysdba'
    Password = 'masterkey'
    Protocol = 'firebird-2.5'
    LibraryLocation = 'D:\HSWARE\LiquidadorV6EXP\fbclient.dll'
    Left = 32
    Top = 276
  end
  object dsGenerico: TDataSource
    DataSet = Zgen
    Left = 184
    Top = 280
  end
  object Zgen: TZQuery
    Connection = BaseGenericos
    ReadOnly = True
    Params = <>
    Left = 112
    Top = 276
  end
  object ZEjecuta: TZQuery
    Connection = Base_Datos
    Params = <>
    Left = 356
    Top = 64
  end
  object ConsultaSQL: TZQuery
    Connection = Base_Datos
    ReadOnly = True
    Params = <>
    Left = 124
    Top = 196
  end
  object Zgenerador: TZQuery
    Connection = Base_Datos
    Params = <>
    Left = 356
    Top = 12
  end
  object ZDetVen: TZQuery
    Connection = Base_Datos
    ReadOnly = True
    SQL.Strings = (
      
        'SELECT a.NROCORRELATIVO, a.FECHAEMISION, a.FECHAVENCIMIENTO, a.T' +
        'IPOCOMPROBANTE, a.SERIECO, a.NUMEROCO, a.TIPODOCUMENTO, a.NRODOC' +
        'UMENTO, a.RAZONNOMBRE, a.VEXPORTACION, a.BASEIMPONIBLE, a.IGVIPM' +
        ', a.TOTALEXONERADA, a.OTROSTRIBUTOS, a.IMPORTETOTAL, a.TIPOCAMBI' +
        'O, a.RCPFECHA, a.RCPTIPO, a.RCPSERIE, a.RCPNUMERO, a.DUAL, a.TUR' +
        'NO, a.PUNTOVENTA as ISLA, a.MAQUINAVENTA as MANGUERA FROM REGIST' +
        'ROVENTAS a where a.fechaemision>='#39'01-01-2010'#39' and fechaemision<=' +
        #39'01-31-2010'#39' ')
    Params = <>
    Left = 362
    Top = 199
  end
  object ZRegVen: TZQuery
    Connection = Base_Datos
    ReadOnly = True
    SQL.Strings = (
      
        'SELECT a.NROCORRELATIVO, a.FECHAEMISION, a.FECHAVENCIMIENTO, a.T' +
        'IPOCOMPROBANTE, a.SERIECO, a.NUMEROCO, a.TIPODOCUMENTO, a.NRODOC' +
        'UMENTO, a.RAZONNOMBRE, a.VEXPORTACION, a.BASEIMPONIBLE, a.IGVIPM' +
        ', a.TOTALEXONERADA, a.OTROSTRIBUTOS, a.IMPORTETOTAL, a.TIPOCAMBI' +
        'O, a.RCPFECHA, a.RCPTIPO, a.RCPSERIE, a.RCPNUMERO, a.DUAL, a.TUR' +
        'NO, a.PUNTOVENTA as ISLA, a.MAQUINAVENTA as MANGUERA FROM REGIST' +
        'ROVENTAS a where a.fechaemision>='#39'01-01-2010'#39' and fechaemision<=' +
        #39'01-31-2010'#39' ')
    Params = <>
    Left = 358
    Top = 127
  end
  object ZGuiaRem: TZQuery
    Connection = Base_Datos
    ReadOnly = True
    Params = <>
    Left = 364
    Top = 264
  end
end
