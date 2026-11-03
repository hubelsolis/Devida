object FrmAutoridad: TFrmAutoridad
  Left = 282
  Top = 60
  ClientHeight = 398
  ClientWidth = 897
  Caption = 'Autoridad'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 749
    Top = 0
    Width = 148
    Height = 398
    Hint = ''
    Align = alRight
    TabOrder = 0
    Caption = ''
    ParentColor = True
    object btnBuscar: TUniBitBtn
      Left = 8
      Top = 40
      Width = 132
      Height = 32
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFBF9E9CBB3E3B287E3B189E9CFBDFEFCFBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E3D3E39851F89B3BFD
        9C37FD982EF48D25DC8F4DF5E9E1FFFFFFFFFFFFFFFFFFFFFFFFF9EEE3F6E7D7
        FFFFFFF5E3D2EA9D4EFFA84FFFA447F99B3BE8913CE39349E48831D68139FAF4
        F0FFFFFFFFFFFFFFFFFFE6A96AEDAA63F2D9BEE9A966FFB365FFAD59F59F48E6
        B88CFAF2ECFFFEFEF9F2EEE1B392D8AA8DFFFFFFFFFFFFFFFFFFE9B47BFFC78F
        E9A761FCBE81FFBD7BFAAE5FE9BD91FFFEFDFFFFFFFFFFFFFFFFFFFFFFFFF4E6
        DDFFFFFFFFFFFFFFFFFFECC191FFCFA0FFCE9CFFC994FFC488E8AB69FEFCFAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D0A7FCD5AB
        FFD3A7FFCE9DFEC58CE3A866F2D8BDFFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF3DCBDF9D6AFFFD9B4FFCF9FFFC891FFC081F0A352F6
        E6D3F3E2D4E5B995E2B18AE0AB81E0A87DDFA273E3BEA7FFFFFFFCF4E9F0BE7D
        F6C992F3C082EEB877EDB679EBBB86FDF8F4E3AD7BFCC286FFCA94FFD1A2FFD5
        ACFFD4ABDEA67EFFFEFDFFFFFFFCF5ECFBF2E4FDF7EFFEFCF9FFFFFFFFFFFFFF
        FFFFF5E5D7E3B389E8A96FFFCC9AFFD1A2FFD1A2E3A879FAF4F1FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1DCCBEFAE6FFFC78FFFCA
        95FFCA95EAAA72F4E8E0FFFFFFFFFFFFFEFCF9FDFAF5FFFFFFFFFFFFFFFFFFFF
        FFFFFCF6F1E5A363FFB973FFC081EDAA6CF7BA7EF1AF6FECD5C5FFFFFFFFFFFF
        FBF2E7E3AD66FCF3E9FFFFFFFFFFFFFAF3EAE6A867FCA751FFAF5DFBB166E1B2
        8ADFA372F4B06AE5C4AEFFFFFFFFFFFFFFFFFFEFC58EEC8E22EEAB5FECAC64ED
        9537FEA242FFA549FDA64EE29F61FEFBF9F8F0EBE4C1A9FBF7F4FFFFFFFFFFFF
        FFFFFFFEFDFBF0C083F59226FF9C36FFA140FFA64AF5A048E4A96EFCF6F1FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEF8E5CDECB97DEB
        AC67E9B379F2D7BCFEFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Buscar'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 0
      OnClick = btnBuscarClick
    end
    object btnNuevaAutoridad: TUniBitBtn
      Left = 8
      Top = 104
      Width = 132
      Height = 32
      Hint = ''
      Caption = 'Nueva Autoridad'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 1
      OnClick = btnNuevaAutoridadClick
    end
    object BtnModificarAutoridad: TUniBitBtn
      Left = 8
      Top = 140
      Width = 132
      Height = 28
      Hint = ''
      Caption = 'Modificar Autoridad'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 2
      OnClick = BtnModificarAutoridadClick
    end
    object BtnEliminarAutoridad: TUniBitBtn
      Left = 8
      Top = 172
      Width = 132
      Height = 32
      Hint = ''
      Caption = 'Eliminar Autoridad'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 3
      OnClick = BtnEliminarAutoridadClick
    end
    object btnSalir: TUniBitBtn
      Left = 8
      Top = 246
      Width = 132
      Height = 32
      Hint = ''
      Caption = 'Salir'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 4
      OnClick = btnSalirClick
    end
    object edtbusca: TUniEdit
      Left = 8
      Top = 16
      Width = 132
      Hint = ''
      Text = ''
      TabOrder = 6
    end
  end
  object DBRejilla: TUniDBGrid
    Left = 0
    Top = 0
    Width = 749
    Height = 398
    Hint = ''
    TitleFont.Name = 'MS Sans Serif'
    DataSource = ds1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTabs, dgCancelOnExit]
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 1
  end
  object ztabla: TZQuery
    Connection = DM1.Base_Datos
    ReadOnly = True
    Params = <>
    Left = 10
    Top = 40
  end
  object ds1: TDataSource
    DataSet = ztabla
    Left = 42
    Top = 40
  end
  object Zdetalle: TZQuery
    Connection = DM1.Base_Datos
    ReadOnly = True
    Params = <>
    Left = 10
    Top = 76
  end
end
