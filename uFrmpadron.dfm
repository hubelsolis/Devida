object Frmpadron: TFrmpadron
  Left = 282
  Top = 60
  ClientHeight = 634
  ClientWidth = 1024
  Caption = 'Padron de Beneficiarios'
  OnShow = UniFormShow
  WindowState = wsMaximized
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbRejilla: TUniDBGrid
    Left = 0
    Top = 0
    Width = 876
    Height = 634
    Hint = ''
    ClientEvents.ExtEvents.Strings = (
      
        'viewready=function viewready(sender, eOpts) {'#13#10'    // sender = v' +
        'ista del grid (Ext.grid.View)'#13#10'    sender.el.on('#39'contextmenu'#39', f' +
        'unction(e){'#13#10'        e.preventDefault();   // bloquea el men'#250' na' +
        'tivo del navegador'#13#10'    });'#13#10'}'#13#10)
    TitleFont.Name = 'MS Sans Serif'
    DataSource = ds1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect, dgTabs, dgCancelOnExit]
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    ParentFont = False
    TabOrder = 2
    OnCellContextClick = dbRejillaCellContextClick
  end
  object Panel1: TUniPanel
    Left = 876
    Top = 0
    Width = 148
    Height = 634
    Hint = ''
    Align = alRight
    TabOrder = 0
    Caption = ''
    ParentColor = True
    object btnActualizar: TUniBitBtn
      Left = 6
      Top = 125
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
    object btngenerarpadron: TUniBitBtn
      Left = 6
      Top = 251
      Width = 132
      Height = 32
      Hint = ''
      Caption = 'Generar Padron'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 1
      OnClick = btngenerarpadronClick
    end
    object BtnExportarCSV: TUniBitBtn
      Left = 6
      Top = 170
      Width = 132
      Height = 28
      Hint = ''
      Caption = 'Exportar CSV'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 2
      OnClick = BtnExportarCSVClick
    end
    object BtnCerrarPadron: TUniBitBtn
      Left = 4
      Top = 362
      Width = 132
      Height = 32
      Hint = ''
      Enabled = False
      Caption = 'Cerrar Padron'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 3
      OnClick = BtnCerrarPadronClick
    end
    object BtnReporte: TUniBitBtn
      Left = 6
      Top = 202
      Width = 132
      Height = 32
      Hint = ''
      Enabled = False
      Caption = 'Reporte'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 4
      OnClick = BtnEliminarClick
    end
    object btnSalir: TUniBitBtn
      Left = 4
      Top = 505
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
    object cbAdendas: TUniComboBox
      Left = 6
      Top = 97
      Width = 132
      Hint = ''
      Style = csOwnerDrawFixed
      Text = ''
      TabOrder = 7
      IconItems = <>
      OnChange = cbAdendasChange
    end
    object btnlimpiarpadron: TUniBitBtn
      Left = 4
      Top = 324
      Width = 132
      Height = 32
      Hint = ''
      Caption = 'Limpiar Padron'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 8
      OnClick = btnlimpiarpadronClick
    end
    object btnAbrirPadron: TUniBitBtn
      Left = 4
      Top = 400
      Width = 132
      Height = 32
      Hint = ''
      Enabled = False
      Caption = 'Abrir Padron'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 9
      OnClick = BtnCerrarPadronClick
    end
    object btnCambioFenologico: TUniBitBtn
      Left = 6
      Top = 287
      Width = 132
      Height = 32
      Hint = ''
      Caption = 'Cambio Fenologico'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 10
      OnClick = btnCambioFenologicoClick
    end
    object edtDNIBeneficiario: TUniEdit
      Left = 6
      Top = 22
      Width = 131
      Hint = ''
      Text = ''
      TabOrder = 11
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 3
      Width = 76
      Height = 13
      Hint = ''
      Caption = 'DNI Beneficiario'
      TabOrder = 12
    end
    object edtCaserio: TUniEdit
      Left = 6
      Top = 61
      Width = 131
      Hint = ''
      Text = ''
      TabOrder = 13
    end
    object UniLabel2: TUniLabel
      Left = 6
      Top = 47
      Width = 36
      Height = 13
      Hint = ''
      Caption = 'Caserio'
      TabOrder = 14
    end
    object UniBitBtn1: TUniBitBtn
      Left = 6
      Top = 438
      Width = 132
      Height = 32
      Hint = ''
      Caption = 'Titulo PDF'
      ParentFont = False
      Font.Name = 'MS Sans Serif'
      TabOrder = 15
      OnClick = UniBitBtn1Click
    end
  end
  object pnlLog: TUniPanel
    Left = 180
    Top = 80
    Width = 531
    Height = 373
    Hint = ''
    Visible = False
    TabOrder = 1
    Caption = 'pnlLog'
    object mmoLog: TUniMemo
      Left = 14
      Top = 36
      Width = 505
      Height = 323
      Hint = ''
      ScrollBars = ssBoth
      TabOrder = 1
    end
    object UniButton1: TUniButton
      Left = 446
      Top = 5
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Cerrar'
      TabOrder = 2
      OnClick = UniButton1Click
    end
  end
  object ztabla: TZQuery
    Connection = DM1.Base_Datos
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
    ReadOnly = True
    Params = <>
    Left = 76
    Top = 36
  end
  object uniExcelExporter1: TUniGridExcelExporter
    FileExtention = 'xlsx'
    MimeType = 
      'application/vnd.openxmlformats-officedocument.spreadsheetml.shee' +
      't'
    CharSet = 'UTF-8'
    Left = 810
    Top = 106
  end
  object pmPadron: TUniPopupMenu
    Left = 56
    Top = 136
    object EditardatosDNIdelTitular1: TUniMenuItem
      Caption = 'Editar datos DNI del Titular y Conyugue'
      OnClick = EditardatosDNIdelTitular1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object N2: TUniMenuItem
      Caption = 'Editar HAS Instalacion'
      Enabled = False
    end
    object EditarHASInstalacion1: TUniMenuItem
      Caption = 'Editar HAS Crecimiento'
      Enabled = False
    end
    object EditarHASInstalacion2: TUniMenuItem
      Caption = 'Editar HAS Produccion'
      Enabled = False
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object N4: TUniMenuItem
      Caption = 'Editar Coordenadas'
      Enabled = False
    end
    object N5: TUniMenuItem
      Caption = '-'
    end
    object VerHistorial1: TUniMenuItem
      Caption = 'Ver Historial'
      Enabled = False
    end
    object N6: TUniMenuItem
      Caption = '-'
    end
    object N7: TUniMenuItem
      Caption = 'Cancelar'
    end
  end
end
