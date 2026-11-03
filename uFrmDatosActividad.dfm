object FrmDatosActividad: TFrmDatosActividad
  Left = 238
  Top = 20
  ClientHeight = 291
  ClientWidth = 339
  Caption = 'Actividad'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblIdactividad: TUniLabel
    Left = 10
    Top = 16
    Width = 57
    Height = 13
    Hint = ''
    Caption = 'Id Actividad'
    TabOrder = 0
  end
  object lblNombre: TUniLabel
    Left = 10
    Top = 40
    Width = 84
    Height = 13
    Hint = ''
    Caption = 'Nombre Actividad'
    TabOrder = 5
  end
  object lblTipoactividad: TUniLabel
    Left = 10
    Top = 64
    Width = 63
    Height = 13
    Hint = ''
    Caption = 'Tipoactividad'
    TabOrder = 6
  end
  object edtIdactividad: TUniEdit
    Left = 100
    Top = 11
    Width = 100
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object edtNombre: TUniEdit
    Left = 100
    Top = 35
    Width = 226
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object edtTipoactividad: TUniEdit
    Left = 100
    Top = 59
    Width = 63
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 3
  end
  object btnLimpiar: TUniBitBtn
    Left = 16
    Top = 250
    Width = 100
    Height = 28
    Hint = ''
    Caption = 'Limpiar'
    TabOrder = 7
    OnClick = btnLimpiarClick
  end
  object btnGuardar: TUniBitBtn
    Left = 124
    Top = 250
    Width = 100
    Height = 28
    Hint = ''
    Caption = 'Guardar'
    TabOrder = 8
    OnClick = btnGuardarClick
  end
  object btnSalir: TUniBitBtn
    Left = 230
    Top = 250
    Width = 100
    Height = 28
    Hint = ''
    Caption = 'Salir'
    TabOrder = 4
    OnClick = btnSalirClick
  end
  object lstEtapas: TUniListBox
    Left = 10
    Top = 131
    Width = 230
    Height = 97
    Hint = ''
    TabOrder = 9
  end
  object UniLabel1: TUniLabel
    Left = 10
    Top = 112
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Etapas'
    TabOrder = 10
  end
  object btnagregaetapa: TUniBitBtn
    Left = 246
    Top = 147
    Width = 75
    Height = 25
    Hint = ''
    Caption = '(+) Etapa'
    TabOrder = 11
    OnClick = btnagregaetapaClick
  end
  object btnquitaetapa: TUniBitBtn
    Left = 246
    Top = 178
    Width = 75
    Height = 25
    Hint = ''
    Caption = '(-) Etapa'
    TabOrder = 12
    OnClick = btnquitaetapaClick
  end
  object UniLabel2: TUniLabel
    Left = 10
    Top = 89
    Width = 80
    Height = 13
    Hint = ''
    Caption = 'DNI Coordinador'
    TabOrder = 13
  end
  object edtdni_coordinador: TUniEdit
    Left = 100
    Top = 84
    Width = 63
    Height = 21
    Hint = ''
    Text = '88880000'
    TabOrder = 14
    OnKeyUp = edtdni_coordinadorKeyUp
  end
  object lblcoordinador: TUniLabel
    Left = 197
    Top = 89
    Width = 124
    Height = 13
    Hint = ''
    AutoSize = False
    Caption = ''
    TabOrder = 15
  end
  object btnBusca: TUniSpeedButton
    Left = 167
    Top = 84
    Width = 23
    Height = 22
    Hint = ''
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACAAAB1D1D
      214F50583A3B42F4F4F4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFCFCFC13131454555E6768714B4B4DFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDDCDD111214696B
      744B4D55C1C1C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFD8D7D834333443444C46474F1D1D21FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7474754F4F5650515A8C8C
      8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFDFDFDC5C4C5A4A4A59A
      999A9796969D9DA0CACACCCACACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFDDDCDD8B8A8BE8DBCFF0E1D3F4E6DAEFE5DCABA9A797979AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFE1E1E17E7D7FE5D9CDF2E2D3F2E3D5F4
      E7DCF5EAE0F0E7E0C2BEBAF6F6F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      909091DED4CBF2E1D1F1E0CFF2E3D4F5E7DBF6EBE2F5E9DEF5EBE1BBB9B9FF00
      FFFF00FFFF00FFFF00FFFF00FFEBEBEBDCD4CDF3E5D8EEDAC4EFDDCAF0DFCDF3
      E4D5F4E7DAF3E5D7F2E3D4DDD2C7FCFCFCFF00FFFF00FFFF00FFFF00FFDBDADA
      ECE3DAF5E9DFEDD8BEEDD8C0EED9C3EFDDCAF1E0CEF1DFCDF0DECBE6D7CAF3F3
      F3FF00FFFF00FFFF00FFFF00FFE2E2E2EAE1DAF6EBE1F1E1D0EDD8BFEDD8C2EF
      DCC7F0DECBF0DDCBEFDCC9E3D4C7F7F7F7FF00FFFF00FFFF00FFFF00FFFCFCFC
      DEDAD7F6EBE2F4E7DAF3E4D6F0DDC9EFDCC9F0DECBF0DECCF0DECCD0C6BEFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFC5C4C5CDCAC9F6ECE3F5E9DEF5E9DFF2
      E3D4F2E3D4F2E4D5ECDED1DBDADBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFF3F3F3B7B5B4F3EAE3F6EDE4F7EEE6F1E6DDB9B4B0C2C2C2FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBE0E1C2C7C8BE
      C3C4D6DADCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Caption = ''
    ParentColor = False
    Color = clWindow
    TabOrder = 16
    OnClick = btnBuscaClick
  end
end
