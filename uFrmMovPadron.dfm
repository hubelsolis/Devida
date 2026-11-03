object FrmmovPadron: TFrmmovPadron
  Left = 282
  Top = 60
  ClientHeight = 631
  ClientWidth = 1008
  Caption = 'movPadron'
  OnShow = UniFormShow
  WindowState = wsMaximized
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 860
    Top = 0
    Width = 148
    Height = 631
    Hint = ''
    Align = alRight
    TabOrder = 0
    Caption = ''
    ParentColor = True
    object btnActualizar: TUniBitBtn
      Left = 6
      Top = 153
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
      Caption = 'Actualizar'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 0
      OnClick = btnActualizarClick
    end
    object BtnNuevoMovimiento: TUniBitBtn
      Left = 6
      Top = 218
      Width = 132
      Height = 32
      Hint = ''
      Caption = 'Nuevo Movimiento'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 1
      OnClick = BtnNuevoMovimientoClick
    end
    object BtnModificarMovimiento: TUniBitBtn
      Left = 6
      Top = 254
      Width = 132
      Height = 28
      Hint = ''
      Caption = 'Modificar Movimiento'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 2
      OnClick = BtnModificarMovimientoClick
    end
    object BtnExportarCSV: TUniBitBtn
      Left = 6
      Top = 324
      Width = 132
      Height = 32
      Hint = ''
      Caption = 'Exportar a CSV'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 3
      OnClick = BtnExportarCSVClick
    end
    object BtnEliminarMovimiento: TUniBitBtn
      Left = 6
      Top = 286
      Width = 132
      Height = 32
      Hint = ''
      Caption = 'Eliminar Movimiento'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 4
      OnClick = BtnEliminarMovimientoClick
    end
    object btnSalir: TUniBitBtn
      Left = 6
      Top = 362
      Width = 132
      Height = 32
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFEFE40ADD2179CCA5CB4D5BDDEECF5FAFCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDB999999A8A9A9B5B6B633A7CA07
        A3D4009FD20399CC2B9FCA83C1DAD9EBF3FDFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        B1B1B17473747CA78B99C3A733ADCB08A6D700A3D600A2D500A2D5009ED10B94
        C4A6B8C0FFFFFFFFFFFFFFFFFFFFFFFFB0B0B075737454CC7C4FE98329B9C90A
        A9DA00A6D900A5D800A4D700A3D6009FD27D959FFFFFFFFFFFFFFFFFFFFFFFFF
        B1B1B17674754AC67444DD792EBBCB0CADDE00A9DC00A6D900A7DA00A6D900A2
        D57B97A1FFFFFFFFFFFFFFFFFFFEFEFEB1B1B178767741C16B39D26F32BFCE0C
        B1E116A5D0159BC300A6D800A9DC00A5D97898A4FFFFFFFFFFFFFFFFFFFEFEFE
        B1B1B178767773D9B76FE7BE40C6DD2AB7E1BFC2C289ABB502ABDC00ACDF00A8
        DC7599A6FFFFFFFFFFFFFFFFFFFEFEFEB2B2B2787777BFEEEEC1FBFE52CEE91A
        B9E794CEDE5FB9D300B1E300AFE200ACDF729BA9FFFFFFFFFFFFFFFFFFFEFEFE
        B2B2B2797979EBF0F0ECF9FB5ED3EC0BB9EA00B5E900B4E800B3E600B1E400AE
        E16F9CACFFFFFFFFFFFFFFFFFFFEFEFEB2B2B27D7D7DF2EDE7F0F4EF65D7ED08
        BBED00B8EB00B7EA00B5E800B4E700B1E46B9EAFFFFFFFFFFFFFFFFFFFFEFEFE
        B3B3B3828281F3E7DAEEECE26BDBEE08BEF005B9EC01BAED00B8EB00B6E900B3
        E6679FB1FFFFFFFFFFFFFFFFFFFEFEFEB3B3B3878786F4E1CCEBE5D472E0F00B
        C1F3C4DBE5E2DFE5B5D3E292C9E017B8E661A0B4FFFFFFFFFFFFFFFFFFFEFEFE
        B4B4B48D8B89F5DABEE9DDC677E3F209C4F5BED9E5FEECEBFFE4E4FFDCDB35B9
        E25EA1B5FFFFFFFFFFFFFFFFFFFEFEFEB5B5B5908D8AE3C5A3D9CCAE7CE7F404
        C6F810BFEF1BBAE930BBE54DBCE016B5E459A2B7FFFFFFFFFFFFFFFFFFFDFDFD
        B5B5B5949494928F8C88919064C7DA49C7E53CC7E831C4E829C2E920BFE915BC
        E859A1B6FFFFFFFFFFFFFFFFFFFEFEFEBFBFBFBABABAB8B8B8B4B4B4AFADADAC
        AAA9A5A6A69AA1A3939FA3899BA1849BA2A5ACAEFFFFFFFFFFFF}
      Caption = 'Salir'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 5
      OnClick = btnSalirClick
    end
    object edtDniUsuario: TUniEdit
      Left = 8
      Top = 121
      Width = 129
      Hint = ''
      Text = ''
      TabOrder = 7
    end
    object edtCaserio: TUniEdit
      Left = 8
      Top = 26
      Width = 129
      Hint = ''
      Text = ''
      TabOrder = 8
    end
    object lblnomcaserio: TUniLabel
      Left = 8
      Top = 9
      Width = 72
      Height = 13
      Hint = ''
      Caption = 'Ubigeo Caserio'
      TabOrder = 9
    end
    object lblTipoUsuario: TUniLabel
      Left = 10
      Top = 191
      Width = 56
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'DNI usuario'
      TabOrder = 10
    end
    object chkDNIUsuario: TUniCheckBox
      Left = 10
      Top = 100
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'DNI usuario'
      TabOrder = 11
    end
    object UniLabel1: TUniLabel
      Left = 8
      Top = 55
      Width = 51
      Height = 13
      Hint = ''
      Caption = 'DNI Titular'
      TabOrder = 12
    end
    object edtDNITitular: TUniEdit
      Left = 8
      Top = 72
      Width = 129
      Hint = ''
      Text = ''
      TabOrder = 13
    end
  end
  object dbrejilla: TUniDBGrid
    Left = 0
    Top = 0
    Width = 860
    Height = 631
    Hint = ''
    DataSource = ds1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 1
    OnDblClick = dbrejillaDblClick
  end
  object UniMemo1: TUniMemo
    Left = 304
    Top = 19
    Width = 471
    Height = 300
    Hint = ''
    Visible = False
    ScrollBars = ssVertical
    Lines.Strings = (
      'UniMemo1')
    TabOrder = 2
  end
  object ztabla: TZQuery
    Connection = DM1.Base_Datos
    AfterOpen = ztablaAfterOpen
    ReadOnly = True
    Params = <>
    Left = 4
    Top = 40
  end
  object ds1: TDataSource
    DataSet = ztabla
    Left = 36
    Top = 40
  end
  object Zdetalle: TZQuery
    Connection = DM1.Base_Datos
    ReadOnly = True
    Params = <>
    Left = 4
    Top = 76
  end
end
