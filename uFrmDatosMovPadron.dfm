object FrmDatosmovPadron: TFrmDatosmovPadron
  Left = 238
  Top = 20
  ClientHeight = 632
  ClientWidth = 758
  Caption = 'Movimientos'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblIdadenda: TUniLabel
    Left = 762
    Top = 39
    Width = 37
    Height = 13
    Hint = ''
    Visible = False
    Caption = 'Adenda'
    TabOrder = 0
  end
  object lblIdmovpadron: TUniLabel
    Left = 750
    Top = 8
    Width = 64
    Height = 13
    Hint = ''
    Visible = False
    Caption = 'Idmovpadron'
    TabOrder = 1
  end
  object lblNro: TUniLabel
    Left = 762
    Top = 65
    Width = 17
    Height = 13
    Hint = ''
    Caption = 'Nro'
    TabOrder = 2
  end
  object lblIdcaserio: TUniLabel
    Left = 8
    Top = 131
    Width = 72
    Height = 13
    Hint = ''
    Caption = 'Ubigeo Caserio'
    TabOrder = 3
  end
  object lblDni_titular: TUniLabel
    Left = 8
    Top = 12
    Width = 51
    Height = 13
    Hint = ''
    Caption = 'DNI Titular'
    TabOrder = 4
  end
  object lblTelefono: TUniLabel
    Left = 8
    Top = 37
    Width = 42
    Height = 13
    Hint = ''
    Caption = 'Telefono'
    TabOrder = 5
  end
  object lblDni_conyuge: TUniLabel
    Left = 8
    Top = 63
    Width = 64
    Height = 13
    Hint = ''
    Caption = 'DNI Conyuge'
    TabOrder = 6
  end
  object lblTipomovimiento: TUniLabel
    Left = 8
    Top = 214
    Width = 77
    Height = 13
    Hint = ''
    Caption = 'Tipo Movimiento'
    TabOrder = 7
  end
  object lblDni_tecnico_responsable: TUniLabel
    Left = 8
    Top = 498
    Width = 88
    Height = 13
    Hint = ''
    Caption = 'DNI Tecnico Resp.'
    TabOrder = 55
  end
  object lblObservaciones_1: TUniLabel
    Left = 8
    Top = 526
    Width = 83
    Height = 13
    Hint = ''
    Caption = 'Observaciones_1'
    TabOrder = 57
  end
  object lblObservaciones_2: TUniLabel
    Left = 8
    Top = 550
    Width = 83
    Height = 13
    Hint = ''
    Caption = 'Observaciones_2'
    TabOrder = 58
  end
  object lblObservaciones_3: TUniLabel
    Left = 8
    Top = 574
    Width = 58
    Height = 13
    Hint = ''
    Caption = 'Justificacion'
    TabOrder = 56
  end
  object edtIdadenda: TUniEdit
    Left = 820
    Top = 31
    Width = 68
    Height = 21
    Hint = ''
    Enabled = False
    Visible = False
    CharCase = ecUpperCase
    MaxLength = 10
    Text = ''
    TabOrder = 8
  end
  object edtIdmovpadron: TUniEdit
    Left = 820
    Top = 4
    Width = 68
    Height = 21
    Hint = ''
    Visible = False
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 9
  end
  object edtNro: TUniEdit
    Left = 820
    Top = 58
    Width = 68
    Height = 21
    Hint = ''
    Visible = False
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 10
  end
  object edtIdcaserio: TUniEdit
    Left = 100
    Top = 128
    Width = 75
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 12
    Text = '1001010001'
    TabOrder = 25
    Color = clInfoBk
    ReadOnly = True
    OnKeyUp = edtIdcaserioKeyUp
  end
  object edtDni_titular: TUniEdit
    Left = 100
    Top = 8
    Width = 75
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 8
    Text = ''
    TabOrder = 11
    Color = clInfoBk
    OnKeyUp = edtDni_titularKeyUp
  end
  object edtTelefono: TUniEdit
    Left = 100
    Top = 33
    Width = 75
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 16
    Text = '961021731'
    TabOrder = 16
  end
  object edtDni_conyuge: TUniEdit
    Left = 100
    Top = 60
    Width = 75
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 8
    Text = '40524211'
    TabOrder = 19
    OnKeyUp = edtDni_conyugeKeyUp
  end
  object edtDni_tecnico: TUniEdit
    Left = 100
    Top = 496
    Width = 75
    Height = 21
    Hint = ''
    Enabled = False
    MaxLength = 8
    Text = ''
    TabOrder = 48
    OnKeyUp = edtDni_tecnicoKeyUp
  end
  object btnLimpiar: TUniBitBtn
    Left = 193
    Top = 596
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Limpiar'
    TabOrder = 51
    OnClick = btnLimpiarClick
  end
  object btnGuardar: TUniBitBtn
    Left = 327
    Top = 596
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Guardar'
    TabOrder = 52
    OnClick = btnGuardarClick
  end
  object btnSalir: TUniBitBtn
    Left = 453
    Top = 596
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Salir'
    TabOrder = 53
    OnClick = btnSalirClick
  end
  object edtNombreTitular: TUniEdit
    Left = 276
    Top = 8
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = 'SANTAMARIA DEL'
    TabOrder = 13
  end
  object edtTipomovimiento: TUniComboBox
    Left = 100
    Top = 210
    Width = 102
    Hint = ''
    Style = csDropDownList
    Text = ''
    TabOrder = 41
    CharCase = ecUpperCase
    IconItems = <>
    OnChange = edtTipomovimientoChange
  end
  object edtNombreTecnico: TUniEdit
    Left = 248
    Top = 496
    Width = 271
    Height = 21
    Hint = ''
    Enabled = False
    MaxLength = 180
    Text = ''
    TabOrder = 49
  end
  object btnBuscaDNI: TUniSpeedButton
    Left = 177
    Top = 8
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
    TabOrder = 12
    OnClick = btnBuscaDNIClick
  end
  object edtApPaterno: TUniEdit
    Left = 453
    Top = 8
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = 'APPATERNO'
    TabOrder = 14
  end
  object edtApMaterno: TUniEdit
    Left = 633
    Top = 8
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = 'APMATERNO'
    TabOrder = 15
  end
  object edtConyNombre: TUniEdit
    Left = 276
    Top = 60
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = 'FFFF'
    TabOrder = 21
  end
  object edtConyApPaterno: TUniEdit
    Left = 453
    Top = 60
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = 'FFFF'
    TabOrder = 22
  end
  object edtConyApMaterno: TUniEdit
    Left = 633
    Top = 60
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = 'FFFF'
    TabOrder = 23
  end
  object UniLabel1: TUniLabel
    Left = 181
    Top = 500
    Width = 61
    Height = 13
    Hint = ''
    Caption = 'Nombre Tec.'
    TabOrder = 54
  end
  object UniLabel2: TUniLabel
    Left = 211
    Top = 12
    Width = 56
    Height = 13
    Hint = ''
    Caption = 'Nombre Tit.'
    TabOrder = 59
  end
  object UniLabel3: TUniLabel
    Left = 205
    Top = 64
    Width = 69
    Height = 13
    Hint = ''
    Caption = 'Nombre Cony.'
    TabOrder = 60
  end
  object UniLabel4: TUniLabel
    Left = 394
    Top = 12
    Width = 55
    Height = 13
    Hint = ''
    Caption = 'Ap.Paterno'
    TabOrder = 61
  end
  object UniLabel5: TUniLabel
    Left = 570
    Top = 12
    Width = 57
    Height = 13
    Hint = ''
    Caption = 'Ap.Materno'
    TabOrder = 62
  end
  object cbsexo: TUniComboBox
    Left = 344
    Top = 33
    Width = 42
    Hint = ''
    Text = 'M'
    Items.Strings = (
      'M'
      'F')
    TabOrder = 18
    IconItems = <>
  end
  object cbconysexo: TUniComboBox
    Left = 344
    Top = 84
    Width = 42
    Hint = ''
    Text = 'UniComboBox1'
    Items.Strings = (
      'M'
      'F')
    TabOrder = 24
    IconItems = <>
  end
  object UniLabel6: TUniLabel
    Left = 314
    Top = 37
    Width = 24
    Height = 13
    Hint = ''
    Caption = 'Sexo'
    TabOrder = 63
  end
  object UniLabel7: TUniLabel
    Left = 314
    Top = 88
    Width = 24
    Height = 13
    Hint = ''
    Caption = 'Sexo'
    TabOrder = 64
  end
  object UniLabel8: TUniLabel
    Left = 425
    Top = 37
    Width = 24
    Height = 13
    Hint = ''
    Caption = 'Etnia'
    TabOrder = 65
  end
  object UniLabel9: TUniLabel
    Left = 592
    Top = 37
    Width = 35
    Height = 13
    Hint = ''
    Caption = 'Lengua'
    TabOrder = 66
  end
  object UniLabel10: TUniLabel
    Left = 393
    Top = 64
    Width = 55
    Height = 13
    Hint = ''
    Caption = 'Ap.Paterno'
    TabOrder = 68
  end
  object UniLabel11: TUniLabel
    Left = 393
    Top = 88
    Width = 56
    Height = 13
    Hint = ''
    Caption = 'Etnia Cony.'
    TabOrder = 69
  end
  object UniLabel12: TUniLabel
    Left = 569
    Top = 64
    Width = 57
    Height = 13
    Hint = ''
    Caption = 'Ap.Materno'
    TabOrder = 67
  end
  object UniLabel13: TUniLabel
    Left = 565
    Top = 88
    Width = 67
    Height = 13
    Hint = ''
    Caption = 'Lengua Cony.'
    TabOrder = 70
  end
  object btnBuscaCaserio: TUniSpeedButton
    Left = 178
    Top = 128
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
    TabOrder = 26
    OnClick = btnBuscaCaserioClick
  end
  object UniLabel14: TUniLabel
    Left = 221
    Top = 112
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Ambito'
    TabOrder = 71
  end
  object UniLabel15: TUniLabel
    Left = 292
    Top = 112
    Width = 69
    Height = 13
    Hint = ''
    Caption = 'Departamento'
    TabOrder = 72
  end
  object UniLabel16: TUniLabel
    Left = 402
    Top = 112
    Width = 43
    Height = 13
    Hint = ''
    Caption = 'Provincia'
    TabOrder = 73
  end
  object UniLabel17: TUniLabel
    Left = 505
    Top = 112
    Width = 34
    Height = 13
    Hint = ''
    Caption = 'Distrito'
    TabOrder = 76
  end
  object UniLabel18: TUniLabel
    Left = 638
    Top = 112
    Width = 36
    Height = 13
    Hint = ''
    Caption = 'Caserio'
    TabOrder = 77
  end
  object edtambito: TUniEdit
    Left = 205
    Top = 128
    Width = 69
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = 'FFFF'
    TabOrder = 27
    Color = clInfoBk
    ReadOnly = True
  end
  object edtdepartamento: TUniEdit
    Left = 277
    Top = 128
    Width = 96
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = 'FFFF'
    TabOrder = 28
    Color = clInfoBk
    ReadOnly = True
  end
  object edtprovincia: TUniEdit
    Left = 375
    Top = 128
    Width = 96
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = 'FFFF'
    TabOrder = 29
    Color = clInfoBk
    ReadOnly = True
  end
  object edtdistrito: TUniEdit
    Left = 473
    Top = 128
    Width = 97
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = 'FFFF'
    TabOrder = 30
    Color = clInfoBk
    ReadOnly = True
  end
  object edtcaserio: TUniEdit
    Left = 571
    Top = 128
    Width = 172
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = 'FFFF'
    TabOrder = 31
    Color = clInfoBk
    ReadOnly = True
  end
  object Rejilla: TUniStringGrid
    Left = 8
    Top = 238
    Width = 512
    Height = 251
    Hint = ''
    FixedCols = 3
    RowCount = 4
    ColCount = 4
    Options = [goVertLine, goHorzLine, goEditing]
    Columns = <>
    ClientEvents.ExtEvents.Strings = (
      
        'beforeedit=function beforeedit(editor, context, eOpts)'#13#10'{'#13#10'    v' +
        'ar me=context;'#13#10'    if (me.column.dataIndex == "2" && me.origina' +
        'lValue == "222") {'#13#10'        return false;'#13#10'    }'#13#10'}')
    TabOrder = 46
  end
  object UniLabel19: TUniLabel
    Left = 211
    Top = 214
    Width = 39
    Height = 13
    Hint = ''
    Caption = 'Sub tipo'
    TabOrder = 75
  end
  object edtsubtipomov: TUniComboBox
    Left = 256
    Top = 210
    Width = 131
    Hint = ''
    Style = csDropDownList
    Text = ''
    Items.Strings = (
      'INCORPORACION'
      ''
      'EXCLUSION'
      'INCREMENTO'
      'REDUCCION')
    TabOrder = 42
    CharCase = ecUpperCase
    IconItems = <>
    OnChange = edtsubtipomovChange
  end
  object paginaimagen: TUniPageControl
    Left = 526
    Top = 238
    Width = 213
    Height = 250
    Hint = ''
    ActivePage = UniTabSheet3
    TabOrder = 47
    object UniTabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Imagen 1'
      object UniImage1: TUniImage
        Left = 3
        Top = 2
        Width = 200
        Height = 215
        Hint = ''
        Stretch = True
      end
      object edtImagen1: TUniEdit
        Left = 3
        Top = 2
        Width = 164
        Height = 21
        Hint = ''
        Visible = False
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
      end
      object btnsubirimagen1: TUniSpeedButton
        Left = 168
        Top = 3
        Width = 34
        Height = 22
        Hint = ''
        Caption = 'Subir'
        ParentColor = False
        Color = clWindow
        ScreenMask.Target = UniImage1
        TabOrder = 2
        OnClick = btnsubirimagen1Click
      end
    end
    object UniTabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Imagen 2'
      object UniImage2: TUniImage
        Left = 2
        Top = 2
        Width = 200
        Height = 215
        Hint = ''
        Stretch = True
      end
      object edtImagen2: TUniEdit
        Left = 3
        Top = 2
        Width = 162
        Height = 21
        Hint = ''
        Visible = False
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
      end
      object btnsubirimagen2: TUniSpeedButton
        Left = 168
        Top = 2
        Width = 34
        Height = 22
        Hint = ''
        Caption = 'Subir'
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = btnsubirimagen2Click
      end
    end
    object UniTabSheet3: TUniTabSheet
      Hint = ''
      Caption = 'Titulo'
      object imgTituloPDF: TUniImage
        Left = 36
        Top = 19
        Width = 126
        Height = 102
        Hint = ''
        Stretch = True
      end
      object btnSubirTitulo: TUniBitBtn
        Left = 43
        Top = 194
        Width = 56
        Height = 25
        Hint = ''
        Caption = 'Subir ...'
        TabOrder = 1
        OnClick = btnSubirTituloClick
      end
      object btnEliminarTitulo: TUniBitBtn
        Left = 105
        Top = 194
        Width = 56
        Height = 25
        Hint = ''
        Caption = 'Eliminar'
        TabOrder = 2
        OnClick = btnEliminarTituloClick
      end
      object edtTituloDescripcion: TUniEdit
        Left = 8
        Top = 168
        Width = 190
        Height = 20
        Hint = ''
        CharCase = ecUpperCase
        MaxLength = 254
        Text = ''
        TabOrder = 3
      end
      object cbbTituloTipo: TUniComboBox
        Left = 8
        Top = 140
        Width = 190
        Hint = ''
        MaxLength = 64
        Text = ''
        TabOrder = 4
        IconItems = <>
      end
      object lblTituloPath: TUniLabel
        Left = 12
        Top = 124
        Width = 58
        Height = 13
        Hint = ''
        Caption = 'lblTituloPath'
        TabOrder = 5
      end
    end
  end
  object UniLabel21: TUniLabel
    Left = 182
    Top = 36
    Width = 39
    Height = 13
    Hint = ''
    Caption = 'Fec.Nac'
    TabOrder = 78
  end
  object btnPreparaRejilla: TUniButton
    Left = 813
    Top = 88
    Width = 75
    Height = 25
    Hint = ''
    Visible = False
    Caption = 'Limpia Rejilla'
    TabOrder = 88
    OnClick = btnPreparaRejillaClick
  end
  object UniLabel20: TUniLabel
    Left = 8
    Top = 156
    Width = 68
    Height = 13
    Hint = ''
    Caption = 'DNI Autoridad'
    TabOrder = 74
  end
  object edtDni_Autoridad: TUniEdit
    Left = 100
    Top = 153
    Width = 75
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 8
    Text = '40524211'
    TabOrder = 32
    OnKeyUp = edtDni_AutoridadKeyUp
  end
  object edtAutNombre: TUniEdit
    Left = 276
    Top = 153
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = 'FFFF'
    TabOrder = 34
  end
  object edtAutApPaterno: TUniEdit
    Left = 453
    Top = 153
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = 'FFFF'
    TabOrder = 35
  end
  object edtAutApMaterno: TUniEdit
    Left = 633
    Top = 153
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = 'FFFF'
    TabOrder = 36
  end
  object UniLabel22: TUniLabel
    Left = 210
    Top = 157
    Width = 61
    Height = 13
    Hint = ''
    Caption = 'Nombre Aut.'
    TabOrder = 79
  end
  object edtAutResolucion: TUniEdit
    Left = 453
    Top = 178
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = 'FFFF'
    TabOrder = 39
  end
  object UniLabel24: TUniLabel
    Left = 394
    Top = 157
    Width = 55
    Height = 13
    Hint = ''
    Caption = 'Ap.Paterno'
    TabOrder = 80
  end
  object UniLabel25: TUniLabel
    Left = 398
    Top = 181
    Width = 51
    Height = 13
    Hint = ''
    Caption = 'Resolucion'
    TabOrder = 81
  end
  object UniLabel26: TUniLabel
    Left = 572
    Top = 157
    Width = 57
    Height = 13
    Hint = ''
    Caption = 'Ap.Materno'
    TabOrder = 82
  end
  object UniLabel27: TUniLabel
    Left = 569
    Top = 181
    Width = 61
    Height = 13
    Hint = ''
    Caption = 'Fecha Cargo'
    TabOrder = 83
  end
  object btnBuscaAutoridad: TUniSpeedButton
    Left = 178
    Top = 153
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
    TabOrder = 33
    OnClick = btnBuscaAutoridadClick
  end
  object edtAutCargo: TUniEdit
    Left = 277
    Top = 178
    Width = 110
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = 'FFFF'
    TabOrder = 38
  end
  object UniLabel23: TUniLabel
    Left = 217
    Top = 181
    Width = 53
    Height = 13
    Hint = ''
    Caption = 'Cargo Aut.'
    TabOrder = 84
  end
  object edtNroInforme: TUniEdit
    Left = 622
    Top = 495
    Width = 119
    Height = 21
    Hint = ''
    Visible = False
    CharCase = ecUpperCase
    MaxLength = 24
    Text = 'FFFF'
    TabOrder = 50
  end
  object edtDNI_Referencia: TUniEdit
    Left = 476
    Top = 210
    Width = 61
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 8
    Text = '88880000'
    TabOrder = 43
    OnKeyUp = edtDNI_ReferenciaKeyUp
  end
  object lblbuscareferencia: TUniLabel
    Left = 398
    Top = 214
    Width = 73
    Height = 13
    Hint = ''
    Caption = 'DNI Reemplazo'
    TabOrder = 85
  end
  object edtNombreReferencia: TUniEdit
    Left = 570
    Top = 211
    Width = 171
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 180
    Text = '88880000'
    TabOrder = 45
  end
  object btnbuscareferencia: TUniSpeedButton
    Left = 539
    Top = 210
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
    TabOrder = 44
    OnClick = btnbuscareferenciaClick
  end
  object btnBuscaConyuge: TUniSpeedButton
    Left = 176
    Top = 60
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
    TabOrder = 20
    OnClick = btnBuscaConyugeClick
  end
  object edtAutTelefono: TUniEdit
    Left = 100
    Top = 178
    Width = 75
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 16
    Text = '961021731'
    TabOrder = 37
  end
  object UniLabel29: TUniLabel
    Left = 8
    Top = 182
    Width = 92
    Height = 13
    Hint = ''
    Caption = 'Telefono Autoridad'
    TabOrder = 86
  end
  object lblMensaje: TUniLabel
    Left = 8
    Top = 88
    Width = 171
    Height = 13
    Hint = ''
    AutoSize = False
    Caption = '...'
    ParentFont = False
    Font.Color = clRed
    TabOrder = 87
  end
  object chknroinforme: TUniCheckBox
    Left = 526
    Top = 497
    Width = 93
    Height = 17
    Hint = ''
    Visible = False
    Checked = True
    Caption = 'Nro de Informe'
    TabOrder = 89
  end
  object edtlengua: TUniComboBox
    Left = 633
    Top = 33
    Width = 110
    Hint = ''
    MaxLength = 64
    Text = 'edtlengua'
    Items.Strings = (
      'ACHUAR'
      'ASHANINKA '
      'AWAJUN/AGUARUNA'
      'AIMARA'
      'CASTELLANO'
      'LENGUA DE SE'#209'AS PERUANAS'
      'MATSIGENKA-MACACHIGUENGA'
      'NO ESCUCHA/O NI HABLA/0'
      'OTRA LENGUA EXTRANJERA'
      'OTRA LENGUA INDIGENA ORIGINARIA'
      'PORTUGUES'
      'QUECHUA'
      'SHAWI-CHAYAHUITA'
      'SHIPIBO-KONIBO')
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Arial Narrow'
    TabOrder = 90
    CharCase = ecUpperCase
    FieldLabelFont.Charset = ANSI_CHARSET
    FieldLabelFont.Name = 'Arial Narrow'
    IconItems = <>
  end
  object edtetnia: TUniComboBox
    Left = 453
    Top = 33
    Width = 110
    Hint = ''
    MaxLength = 64
    Text = 'UniComboBox1'
    Items.Strings = (
      'QUECHUA'
      'AIMARA'#10
      'BLANCO'#10
      'INDIGENA U ORIGINARIO DE LA AMAZONIA'#10
      'MESTIZO'#10
      'NEGRO,MORENO,ZAMBO, MULATO O AFRODESCIENTE'
      'PERTENECIENTE O PARTE DE OTRO PUEBLO INDIGENA U ORIGINARIO'
      'OTRO')
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Arial Narrow'
    TabOrder = 91
    CharCase = ecUpperCase
    FieldLabelFont.Charset = ANSI_CHARSET
    FieldLabelFont.Name = 'Arial Narrow'
    IconItems = <>
  end
  object edtconyetnia: TUniComboBox
    Left = 453
    Top = 84
    Width = 110
    Hint = ''
    MaxLength = 64
    Text = 'edtconyetnia'
    Items.Strings = (
      'QUECHUA'
      'AIMARA'#10
      'BLANCO'#10
      'INDIGENA U ORIGINARIO DE LA AMAZONIA'#10
      'MESTIZO'#10
      'NEGRO,MORENO,ZAMBO, MULATO O AFRODESCIENTE'
      'PERTENECIENTE O PARTE DE OTRO PUEBLO INDIGENA U ORIGINARIO'
      'OTRO')
    TabOrder = 92
    CharCase = ecUpperCase
    IconItems = <>
  end
  object edtconylengua: TUniComboBox
    Left = 633
    Top = 84
    Width = 110
    Hint = ''
    MaxLength = 64
    Text = 'edtlengua'
    Items.Strings = (
      'ACHUAR'
      'ASHANINKA '
      'AWAJUN/AGUARUNA'
      'AIMARA'
      'CASTELLANO'
      'LENGUA DE SE'#209'AS PERUANAS'
      'MATSIGENKA-MACACHIGUENGA'
      'NO ESCUCHA/O NI HABLA/0'
      'OTRA LENGUA EXTRANJERA'
      'OTRA LENGUA INDIGENA ORIGINARIA'
      'PORTUGUES'
      'QUECHUA'
      'SHAWI-CHAYAHUITA'
      'SHIPIBO-KONIBO')
    TabOrder = 93
    CharCase = ecUpperCase
    IconItems = <>
  end
  object edtFecNac: TUniDateTimePicker
    Left = 226
    Top = 33
    Width = 82
    Hint = ''
    DateTime = 44892.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 17
  end
  object edtAutFecha: TUniDateTimePicker
    Left = 633
    Top = 178
    Width = 110
    Hint = ''
    DateTime = 44892.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 40
  end
  object chkCambioTitularidad: TUniCheckBox
    Left = 8
    Top = 105
    Width = 171
    Height = 17
    Hint = ''
    Visible = False
    Caption = 'Cambio de Titularidad'
    TabOrder = 94
  end
  object UniPanel1: TUniPanel
    Left = 221
    Top = 272
    Width = 256
    Height = 128
    Hint = ''
    Visible = False
    TabOrder = 95
    Caption = ''
    object lblDNI_refConyuge: TUniLabel
      Left = 27
      Top = 14
      Width = 91
      Height = 13
      Hint = ''
      Caption = 'lblDNI_refConyuge'
      TabOrder = 1
    end
    object lblIDMovReferencia: TUniLabel
      Left = 27
      Top = 40
      Width = 52
      Height = 13
      Hint = ''
      Caption = 'UniLabel28'
      TabOrder = 2
    end
    object lbltest: TUniLabel
      Left = 27
      Top = 72
      Width = 29
      Height = 13
      Hint = ''
      Caption = 'lbltest'
      TabOrder = 3
    end
  end
  object lblTipoUsuario: TUniLabel
    Left = 8
    Top = 608
    Width = 66
    Height = 13
    Hint = ''
    Caption = 'lblTipoUsuario'
    TabOrder = 96
  end
  object UniLabel28: TUniLabel
    Left = 182
    Top = 88
    Width = 39
    Height = 13
    Hint = ''
    Caption = 'Fec.Nac'
    TabOrder = 97
  end
  object edtfecnaccy: TUniDateTimePicker
    Left = 226
    Top = 84
    Width = 82
    Hint = ''
    DateTime = 44892.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 98
  end
  object edtObservaciones_1: TUniComboBox
    Left = 100
    Top = 521
    Width = 641
    Hint = ''
    Text = 'edtObservaciones_1'
    TabOrder = 99
    IconItems = <>
  end
  object edtObservaciones_2: TUniComboBox
    Left = 100
    Top = 544
    Width = 641
    Hint = ''
    Text = 'edtObservaciones_2'
    TabOrder = 100
    IconItems = <>
  end
  object edtObservaciones_3: TUniComboBox
    Left = 100
    Top = 568
    Width = 641
    Hint = ''
    Text = 'edtObservaciones_3'
    TabOrder = 101
    IconItems = <>
  end
  object UniFileUpload1: TUniFileUpload
    MaxAllowedSize = 10485760
    Filter = 'image/*'
    Title = 'Upload'
    Messages.Uploading = 'Subiendo...'
    Messages.PleaseWait = 'Espere...'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Error de Subida'
    Messages.Upload = 'Subir'
    Messages.NoFileError = 'Por favor seleccione un archivo'
    Messages.BrowseText = 'Buscar'
    Messages.UploadTimeout = 'Tiempo de espera agotado'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    OnCompleted = UniFileUpload1Completed
    Left = 700
    Top = 292
  end
end
