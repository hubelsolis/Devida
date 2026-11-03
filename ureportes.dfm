object frmReportes: TfrmReportes
  Left = 0
  Top = 0
  ClientHeight = 645
  ClientWidth = 1437
  Caption = 'Reportes'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = UniFormClose
  Visible = True
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 720
    Height = 472
    Hint = ''
    ActivePage = tabCartaAutoridad
    TabOrder = 0
    OnChange = UniPageControl1Change
    object UniTabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Informe Tecnico Campo'
      object lblDni_tecnico_responsable: TUniLabel
        Left = 11
        Top = 14
        Width = 88
        Height = 13
        Hint = ''
        Caption = 'DNI Tecnico Resp.'
        TabOrder = 0
      end
      object edtDni_tecnico: TUniEdit
        Left = 104
        Top = 10
        Width = 76
        Height = 21
        Hint = ''
        Enabled = False
        MaxLength = 8
        Text = ''
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        Left = 216
        Top = 14
        Width = 76
        Height = 13
        Hint = ''
        Caption = 'Nombre Tecnico'
        TabOrder = 2
      end
      object edtNombreTecnico: TUniEdit
        Left = 334
        Top = 10
        Width = 367
        Height = 21
        Hint = ''
        MaxLength = 180
        Text = ''
        TabOrder = 3
      end
      object btnBuscaDNI: TUniSpeedButton
        Left = 183
        Top = 10
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
        TabOrder = 4
        OnClick = btnBuscaDNIClick
      end
      object btnGenerarInformeTecnico: TUniBitBtn
        Left = 194
        Top = 366
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Generar Informe'
        TabOrder = 5
        OnClick = btnGenerarInformeTecnicoClick
      end
      object UniBitBtn2: TUniBitBtn
        Left = 372
        Top = 366
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Cerrar'
        TabOrder = 6
        OnClick = UniBitBtn2Click
      end
      object dbgCaseriosTecnico: TUniDBGrid
        Left = 11
        Top = 90
        Width = 690
        Height = 153
        Hint = ''
        DataSource = DsCaserio
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        TabOrder = 7
        OnCellClick = dbgCaseriosTecnicoCellClick
      end
      object cbbactividad: TUniComboBox
        Left = 104
        Top = 42
        Width = 101
        Hint = ''
        Style = csDropDownList
        Text = ''
        TabOrder = 8
        IconItems = <>
        OnChange = cbbactividadChange
      end
      object UniLabel2: TUniLabel
        Left = 216
        Top = 46
        Width = 108
        Height = 13
        Hint = ''
        Caption = 'Responsable Actividad'
        TabOrder = 9
      end
      object edtcoordinador: TUniEdit
        Left = 336
        Top = 42
        Width = 365
        Height = 21
        Hint = ''
        MaxLength = 180
        Text = ''
        TabOrder = 10
      end
      object UniLabel3: TUniLabel
        Left = 11
        Top = 46
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'Actividad'
        TabOrder = 11
      end
      object UniLabel4: TUniLabel
        Left = 11
        Top = 73
        Width = 41
        Height = 13
        Hint = ''
        Caption = 'Caserios'
        TabOrder = 12
      end
      object UniLabel5: TUniLabel
        Left = 11
        Top = 253
        Width = 73
        Height = 13
        Hint = ''
        Caption = 'Nro de Informe'
        TabOrder = 13
      end
      object UniMemo1: TUniMemo
        Left = 322
        Top = 90
        Width = 379
        Height = 125
        Hint = ''
        Visible = False
        Lines.Strings = (
          'UniMemo1')
        TabOrder = 14
      end
      object chkfotostecnico: TUniCheckBox
        Left = 16
        Top = 272
        Width = 337
        Height = 17
        Hint = ''
        Caption = '1.-Panel fotografico'
        TabOrder = 15
      end
      object UniCheckBox2: TUniCheckBox
        Left = 16
        Top = 288
        Width = 337
        Height = 17
        Hint = ''
        Caption = '2.-DNI de Participantes'
        TabOrder = 16
      end
      object UniCheckBox3: TUniCheckBox
        Left = 16
        Top = 304
        Width = 337
        Height = 17
        Hint = ''
        Caption = '3.-Ficha de Prospeccion.'
        TabOrder = 17
      end
      object UniCheckBox4: TUniCheckBox
        Left = 16
        Top = 321
        Width = 337
        Height = 17
        Hint = ''
        Caption = '4.-Ficha Resumen de Prospeccion'
        TabOrder = 18
      end
      object UniCheckBox5: TUniCheckBox
        Left = 16
        Top = 338
        Width = 337
        Height = 17
        Hint = ''
        Caption = '5.-Documento acredite propietario del Terreno.'
        TabOrder = 19
      end
      object lblTipoUsuario: TUniLabel
        Left = 588
        Top = 372
        Width = 66
        Height = 13
        Hint = ''
        Caption = 'lblTipoUsuario'
        TabOrder = 20
      end
      object edtNroInforme: TUniEdit
        Left = 90
        Top = 249
        Width = 611
        Hint = ''
        CharCase = ecUpperCase
        MaxLength = 48
        Text = ''
        TabOrder = 21
      end
    end
    object UniTabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Informe Coordinador'
      object UniLabel6: TUniLabel
        Left = 12
        Top = 18
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'Actividad'
        TabOrder = 0
      end
      object cbbactividadcoord: TUniComboBox
        Left = 134
        Top = 14
        Width = 101
        Hint = ''
        Style = csDropDownList
        Text = ''
        TabOrder = 1
        IconItems = <>
        OnChange = cbbactividadcoordChange
      end
      object UniLabel7: TUniLabel
        Left = 12
        Top = 48
        Width = 108
        Height = 13
        Hint = ''
        Caption = 'Responsable Actividad'
        TabOrder = 2
      end
      object edtnombrecoord: TUniEdit
        Left = 241
        Top = 44
        Width = 454
        Height = 21
        Hint = ''
        MaxLength = 180
        Text = ''
        TabOrder = 3
      end
      object edtdnicoord: TUniEdit
        Left = 134
        Top = 44
        Width = 101
        Height = 21
        Hint = ''
        MaxLength = 180
        Text = ''
        TabOrder = 4
      end
      object edtnroinformecoord: TUniEdit
        Left = 241
        Top = 73
        Width = 454
        Height = 21
        Hint = ''
        MaxLength = 48
        Text = ''
        TabOrder = 5
      end
      object UniLabel8: TUniLabel
        Left = 12
        Top = 75
        Width = 112
        Height = 13
        Hint = ''
        Caption = 'Fecha / Nro de Informe'
        TabOrder = 6
      end
      object UniLabel9: TUniLabel
        Left = 12
        Top = 107
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Para '
        TabOrder = 7
      end
      object edtpara: TUniEdit
        Left = 134
        Top = 103
        Width = 475
        Height = 21
        Hint = ''
        MaxLength = 180
        Text = 'Ing. Jordan Bertoni Herrera Aranda'
        TabOrder = 8
      end
      object UniLabel10: TUniLabel
        Left = 12
        Top = 137
        Width = 37
        Height = 13
        Hint = ''
        Caption = 'Asunto '
        TabOrder = 9
      end
      object UniLabel11: TUniLabel
        Left = 12
        Top = 194
        Width = 52
        Height = 13
        Hint = ''
        Caption = 'Referencia'
        TabOrder = 10
      end
      object edtreferencia: TUniEdit
        Left = 134
        Top = 190
        Width = 561
        Height = 21
        Hint = ''
        MaxLength = 180
        Text = 'Directiva 006-2022-DV-PE-DATE'
        TabOrder = 11
      end
      object edtasunto: TUniMemo
        Left = 134
        Top = 133
        Width = 561
        Height = 48
        Hint = ''
        ScrollBars = ssVertical
        Lines.Strings = (
          
            'Consolidado de Incorporacion ,Exclusi'#243'n, Reducci'#243'n,  Incremento ' +
            'de Areas y Cambio de Titularidad para el Proceso de Adendamiento' +
            ' (ADENDA TIPO 1-2023) del Padron de Familias de la Actividad Cac' +
            'ao '#8211' OZTM.')
        TabOrder = 12
      end
      object edtrecomendaciones: TUniMemo
        Left = 134
        Top = 221
        Width = 561
        Height = 98
        Hint = ''
        ScrollBars = ssVertical
        Lines.Strings = (
          
            '4.1. Se recomienda, continuar con los procedimientos administrat' +
            'ivos correspondientes, para le elaboraci'#243'n de la adenda al acta ' +
            'de entendimiento en el marco de la Directiva N'#176'006-2022-DV-PE-DA' +
            'TE. '
          
            'Es cuanto tengo que informar para los fines que estime convenien' +
            'te. '
          ''
          'Atentamente,'
          ''
          'Adjunto '
          'INFORME DE LOS TECNICOS')
        TabOrder = 13
      end
      object UniLabel12: TUniLabel
        Left = 12
        Top = 225
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'Recomendaciones'
        TabOrder = 14
      end
      object UniBitBtn1: TUniBitBtn
        Left = 194
        Top = 366
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Generar Informe'
        TabOrder = 15
        OnClick = UniBitBtn1Click
      end
      object UniBitBtn3: TUniBitBtn
        Left = 372
        Top = 366
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Cerrar'
        TabOrder = 16
        OnClick = UniBitBtn2Click
      end
      object edtfechacoord: TUniEdit
        Left = 134
        Top = 73
        Width = 101
        Height = 21
        Hint = ''
        MaxLength = 180
        Text = ''
        TabOrder = 17
      end
      object chkcoordinadorcuadrosblancos: TUniCheckBox
        Left = 8
        Top = 373
        Width = 137
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Incluir cuadros en blanco'
        TabOrder = 18
      end
    end
    object tabCartaAutoridad: TUniTabSheet
      Hint = ''
      Caption = 'Carta Autoridad'
      ScreenMask.Target = tabCartaAutoridad
      object dbgCaseriosCarta: TUniDBGrid
        Left = 9
        Top = 34
        Width = 686
        Height = 153
        Hint = ''
        DataSource = DsCaserio
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        TabOrder = 0
        OnCellClick = dbgCaseriosCartaCellClick
      end
      object UniLabel14: TUniLabel
        Left = 12
        Top = 224
        Width = 141
        Height = 13
        Hint = ''
        Caption = 'DNI / Nombre de la Autoridad'
        TabOrder = 1
      end
      object UniLabel15: TUniLabel
        Left = 12
        Top = 249
        Width = 105
        Height = 13
        Hint = ''
        Caption = 'Cargo de la Autoridad'
        TabOrder = 2
      end
      object UniLabel16: TUniLabel
        Left = 14
        Top = 282
        Width = 37
        Height = 13
        Hint = ''
        Caption = 'Asunto '
        TabOrder = 3
      end
      object edtasuntocarta: TUniMemo
        Left = 159
        Top = 278
        Width = 536
        Height = 48
        Hint = ''
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object UniLabel17: TUniLabel
        Left = 14
        Top = 338
        Width = 73
        Height = 13
        Hint = ''
        Caption = 'Ejecutivo Zonal'
        TabOrder = 5
      end
      object edtjefecarta: TUniEdit
        Left = 159
        Top = 334
        Width = 536
        Height = 21
        Hint = ''
        MaxLength = 180
        Text = ''
        TabOrder = 6
      end
      object btnGeneraCarta: TUniBitBtn
        Left = 199
        Top = 368
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Generar Informe'
        TabOrder = 7
        OnClick = btnGeneraCartaClick
      end
      object UniBitBtn5: TUniBitBtn
        Left = 282
        Top = 401
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Cerrar'
        TabOrder = 8
        OnClick = UniBitBtn2Click
      end
      object btnlistacaserioscarta: TUniBitBtn
        Left = 9
        Top = 5
        Width = 115
        Height = 22
        Hint = ''
        Caption = 'Buscar Caserios'
        TabOrder = 9
        OnClick = btnlistacaserioscartaClick
      end
      object UniLabel13: TUniLabel
        Left = 12
        Top = 197
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'Fecha / Carta Nro'
        TabOrder = 10
      end
      object edtfechacarta: TUniEdit
        Left = 159
        Top = 195
        Width = 80
        Height = 21
        Hint = ''
        MaxLength = 180
        Text = ''
        TabOrder = 11
      end
      object edtnrocarta: TUniEdit
        Left = 241
        Top = 195
        Width = 454
        Height = 21
        Hint = ''
        MaxLength = 180
        Text = ''
        TabOrder = 12
      end
      object edtbuscacaserio: TUniEdit
        Left = 128
        Top = 5
        Width = 567
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 13
      end
      object cbbdniautoridad: TUniComboBox
        Left = 159
        Top = 222
        Width = 80
        Hint = ''
        Text = ''
        TabOrder = 14
        IconItems = <>
      end
      object cbbnombreautoridad: TUniComboBox
        Left = 241
        Top = 221
        Width = 454
        Hint = ''
        Text = ''
        TabOrder = 15
        IconItems = <>
      end
      object cbbcargoautoridad: TUniComboBox
        Left = 159
        Top = 249
        Width = 536
        Hint = ''
        Text = ''
        TabOrder = 16
        IconItems = <>
      end
      object chkcartacuadrosblancos: TUniCheckBox
        Left = 16
        Top = 383
        Width = 137
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Incluir cuadros en blanco'
        TabOrder = 17
      end
      object chkIMPcartaautoridad: TUniCheckBox
        Left = 16
        Top = 364
        Width = 177
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Importar datos desde autoridad'
        TabOrder = 18
      end
      object UniButton1: TUniButton
        Left = 371
        Top = 368
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Generar Todos'
        TabOrder = 19
        OnClick = UniButton1Click
      end
      object lblError: TUniLabel
        Left = 546
        Top = 377
        Width = 5
        Height = 13
        Hint = ''
        Caption = '-'
        ParentFont = False
        Font.Color = clRed
        Font.Style = [fsBold]
        TabOrder = 20
      end
    end
    object UniTabSheet4: TUniTabSheet
      Hint = ''
      Caption = 'Acta Entendimiento'
      object btnBuscaCaserioActa: TUniBitBtn
        Left = 11
        Top = 8
        Width = 115
        Height = 22
        Hint = ''
        Caption = 'Buscar Caserios'
        TabOrder = 0
        OnClick = btnBuscaCaserioActaClick
      end
      object edtbuscacaserioacta: TUniEdit
        Left = 130
        Top = 7
        Width = 571
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
      end
      object dbgCaseriosActa: TUniDBGrid
        Left = 11
        Top = 37
        Width = 688
        Height = 153
        Hint = ''
        DataSource = DsCaserio
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        TabOrder = 2
        OnCellClick = dbgCaseriosActaCellClick
      end
      object UniLabel18: TUniLabel
        Left = 11
        Top = 201
        Width = 115
        Height = 13
        Hint = ''
        Caption = 'DNI / Nombre Autoridad'
        TabOrder = 3
      end
      object edtactaDniAutoridad: TUniComboBox
        Left = 167
        Top = 198
        Width = 90
        Hint = ''
        Text = ''
        TabOrder = 4
        IconItems = <>
        OnChange = edtactaDniAutoridadChange
      end
      object edtactanombreautoridad: TUniComboBox
        Left = 263
        Top = 198
        Width = 436
        Hint = ''
        Text = ''
        TabOrder = 5
        IconItems = <>
        OnChange = edtactanombreautoridadChange
      end
      object edtactaresolucionautoridad: TUniComboBox
        Left = 263
        Top = 226
        Width = 144
        Hint = ''
        Text = ''
        TabOrder = 6
        IconItems = <>
        OnChange = edtactaresolucionautoridadChange
      end
      object UniLabel19: TUniLabel
        Left = 11
        Top = 229
        Width = 153
        Height = 13
        Hint = ''
        Caption = 'Fecha / Res. /  Cargo Autoridad'
        TabOrder = 7
      end
      object edtactacargoautoridad: TUniComboBox
        Left = 410
        Top = 226
        Width = 289
        Hint = ''
        Text = ''
        TabOrder = 8
        IconItems = <>
        OnChange = edtactacargoautoridadChange
      end
      object UniLabel20: TUniLabel
        Left = 11
        Top = 258
        Width = 81
        Height = 13
        Hint = ''
        Caption = 'Fecha / Nro Acta'
        TabOrder = 9
      end
      object UniLabel21: TUniLabel
        Left = 11
        Top = 292
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'Jefe Oficina Zonal'
        TabOrder = 10
      end
      object edtActaFecha: TUniEdit
        Left = 167
        Top = 256
        Width = 91
        Hint = ''
        Text = ''
        TabOrder = 11
      end
      object edtActaNumero: TUniEdit
        Left = 263
        Top = 255
        Width = 436
        Hint = ''
        Text = ''
        TabOrder = 12
      end
      object edtactajefe: TUniEdit
        Left = 167
        Top = 287
        Width = 532
        Hint = ''
        Text = ''
        TabOrder = 13
      end
      object edtactafechares: TUniComboBox
        Left = 167
        Top = 226
        Width = 90
        Hint = ''
        Text = ''
        TabOrder = 14
        IconItems = <>
        OnChange = edtactafecharesChange
      end
      object chkactacuadrosblanco: TUniCheckBox
        Left = 16
        Top = 367
        Width = 172
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Incluir cuadros en blanco'
        TabOrder = 15
      end
      object btngeneraacta: TUniBitBtn
        Left = 206
        Top = 361
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Generar Informe'
        TabOrder = 16
        OnClick = btngeneraactaClick
      end
      object UniBitBtn6: TUniBitBtn
        Left = 380
        Top = 361
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Cerrar'
        TabOrder = 17
        OnClick = UniBitBtn2Click
      end
      object chkactaword: TUniCheckBox
        Left = 18
        Top = 411
        Width = 110
        Height = 13
        Hint = ''
        Enabled = False
        Visible = False
        Caption = 'Generar Ms Word'
        TabOrder = 18
      end
      object edtubigeosacta: TUniComboBox
        Left = 128
        Top = 198
        Width = 36
        Hint = ''
        Visible = False
        Text = 'edtubigeosacta'
        TabOrder = 19
        IconItems = <>
      end
      object chkJalaActaAutoridad: TUniCheckBox
        Left = 16
        Top = 347
        Width = 177
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Importar datos desde autoridad'
        TabOrder = 20
      end
      object UniLabel32: TUniLabel
        Left = 201
        Top = 394
        Width = 166
        Height = 13
        Hint = ''
        Caption = '(*) Informacion a partir del padron'
        TabOrder = 21
      end
      object chkGenPDFsActa: TUniCheckBox
        Left = 16
        Top = 388
        Width = 118
        Height = 17
        Hint = ''
        Caption = 'Generar Lote PDFs'
        TabOrder = 22
        OnChange = chkGenPDFsActaChange
      end
      object BtnGenLoteActas: TUniButton
        Left = 127
        Top = 385
        Width = 61
        Height = 25
        Hint = ''
        Visible = False
        Caption = 'Gen PDFs'
        TabOrder = 23
        OnClick = BtnGenLoteActasClick
      end
    end
    object UniTabSheet5: TUniTabSheet
      Hint = ''
      Caption = 'Carta Entrega'
      object UniBitBtn4: TUniBitBtn
        Left = 13
        Top = 9
        Width = 115
        Height = 22
        Hint = ''
        Caption = 'Buscar Caserios'
        TabOrder = 0
        OnClick = UniBitBtn4Click
      end
      object edtbuscacarta: TUniEdit
        Left = 132
        Top = 9
        Width = 563
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
      end
      object dbgcartas: TUniDBGrid
        Left = 11
        Top = 36
        Width = 684
        Height = 153
        Hint = ''
        DataSource = DsCaserio
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        TabOrder = 2
        OnCellClick = dbgCaseriosCartaCellClick
      end
      object UniBitBtn8: TUniBitBtn
        Left = 282
        Top = 311
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Cerrar'
        TabOrder = 3
        OnClick = UniBitBtn2Click
      end
      object edtnrocorrelativo: TUniEdit
        Left = 150
        Top = 221
        Width = 66
        Hint = ''
        Text = '001'
        TabOrder = 4
      end
      object UniLabel22: TUniLabel
        Left = 15
        Top = 225
        Width = 93
        Height = 13
        Hint = ''
        Caption = 'Numero Correlativo'
        TabOrder = 5
      end
      object lblcantidad: TUniLabel
        Left = 15
        Top = 244
        Width = 12
        Height = 13
        Hint = ''
        Caption = '---'
        TabOrder = 6
      end
      object UniLabel23: TUniLabel
        Left = 15
        Top = 197
        Width = 59
        Height = 13
        Hint = ''
        Caption = 'Fecha Carta'
        TabOrder = 7
      end
      object edtfechaact: TUniEdit
        Left = 150
        Top = 193
        Width = 66
        Hint = ''
        Text = '001'
        TabOrder = 8
      end
      object UniBitBtn9: TUniBitBtn
        Left = 372
        Top = 266
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Generar Todas las Cartas'
        TabOrder = 9
        OnClick = UniBitBtn9Click
      end
      object UniBitBtn10: TUniBitBtn
        Left = 194
        Top = 266
        Width = 160
        Height = 29
        Hint = ''
        Caption = 'Generar Una Carta'
        TabOrder = 10
        OnClick = UniBitBtn10Click
      end
      object lblerrorcarta: TUniLabel
        Left = 538
        Top = 277
        Width = 4
        Height = 13
        Hint = ''
        Caption = '-'
        TabOrder = 11
      end
    end
    object UniTabSheet6: TUniTabSheet
      Hint = ''
      Caption = 'Adendas'
      object edtBuscaCaserioAdenda: TUniEdit
        Left = 134
        Top = 11
        Width = 561
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 0
      end
      object btnBuscaCaserioAdendas: TUniBitBtn
        Left = 15
        Top = 11
        Width = 115
        Height = 22
        Hint = ''
        Caption = 'Buscar Caserios'
        TabOrder = 1
        OnClick = btnBuscaCaserioAdendasClick
      end
      object dbgCaseriosAdenda: TUniDBGrid
        Left = 13
        Top = 39
        Width = 682
        Height = 153
        Hint = ''
        DataSource = DsCaserio
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        TabOrder = 2
        OnCellClick = dbgCaseriosAdendaCellClick
      end
      object edtAdendanombreautoridad: TUniComboBox
        Left = 265
        Top = 200
        Width = 430
        Hint = ''
        Text = ''
        TabOrder = 3
        IconItems = <>
        OnChange = edtAdendanombreautoridadChange
      end
      object edtAdendacargoautoridad: TUniComboBox
        Left = 412
        Top = 228
        Width = 283
        Hint = ''
        Text = ''
        TabOrder = 4
        IconItems = <>
        OnChange = edtAdendacargoautoridadChange
      end
      object edtAdendaresolucionautoridad: TUniComboBox
        Left = 265
        Top = 228
        Width = 144
        Hint = ''
        Text = ''
        TabOrder = 5
        IconItems = <>
        OnChange = edtAdendaresolucionautoridadChange
      end
      object edtAdendaNumero: TUniEdit
        Left = 265
        Top = 257
        Width = 430
        Hint = ''
        Text = ''
        TabOrder = 6
      end
      object edtAdendajefe: TUniEdit
        Left = 169
        Top = 289
        Width = 526
        Hint = ''
        Text = ''
        TabOrder = 7
      end
      object edtAdendafecha: TUniEdit
        Left = 169
        Top = 258
        Width = 91
        Hint = ''
        Text = ''
        TabOrder = 8
      end
      object edtAdendafechares: TUniComboBox
        Left = 169
        Top = 228
        Width = 90
        Hint = ''
        Text = ''
        TabOrder = 9
        IconItems = <>
        OnChange = edtAdendafecharesChange
      end
      object edtAdendadniautoridad: TUniComboBox
        Left = 169
        Top = 200
        Width = 90
        Hint = ''
        Text = ''
        TabOrder = 10
        IconItems = <>
        OnChange = edtactaDniAutoridadChange
      end
      object edtubigeosadenda: TUniComboBox
        Left = 130
        Top = 200
        Width = 36
        Hint = ''
        Visible = False
        Text = 'edtubigeos'
        TabOrder = 11
        IconItems = <>
      end
      object UniLabel24: TUniLabel
        Left = 13
        Top = 203
        Width = 115
        Height = 13
        Hint = ''
        Caption = 'DNI / Nombre Autoridad'
        TabOrder = 12
      end
      object UniLabel25: TUniLabel
        Left = 13
        Top = 231
        Width = 153
        Height = 13
        Hint = ''
        Caption = 'Fecha / Res. /  Cargo Autoridad'
        TabOrder = 13
      end
      object UniLabel26: TUniLabel
        Left = 13
        Top = 260
        Width = 96
        Height = 13
        Hint = ''
        Caption = 'Fecha / Nro Adenda'
        TabOrder = 14
      end
      object UniLabel27: TUniLabel
        Left = 13
        Top = 294
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'Jefe Oficina Zonal'
        TabOrder = 15
      end
      object chkadendaword: TUniCheckBox
        Left = 11
        Top = 416
        Width = 110
        Height = 17
        Hint = ''
        Visible = False
        Caption = 'Generar Ms Word'
        TabOrder = 16
      end
      object chkAdendacuadrosblanco: TUniCheckBox
        Left = 11
        Top = 373
        Width = 169
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Incluir cuadros en blanco'
        TabOrder = 17
      end
      object btnInformeAdenda: TUniBitBtn
        Left = 206
        Top = 371
        Width = 159
        Height = 29
        Hint = ''
        Caption = 'Generar Informe'
        TabOrder = 18
        OnClick = btnInformeAdendaClick
      end
      object UniBitBtn12: TUniBitBtn
        Left = 381
        Top = 371
        Width = 159
        Height = 29
        Hint = ''
        Caption = 'Cerrar'
        TabOrder = 19
        OnClick = UniBitBtn2Click
      end
      object cbbTipoAdenda: TUniComboBox
        Left = 169
        Top = 320
        Width = 98
        Hint = ''
        Text = ''
        Items.Strings = (
          '01'
          '02'
          '03'
          '04'
          '05'
          '06')
        TabOrder = 20
        IconItems = <>
      end
      object edtFechaFirma: TUniEdit
        Left = 600
        Top = 320
        Width = 95
        Hint = ''
        Text = ''
        TabOrder = 21
      end
      object UniLabel28: TUniLabel
        Left = 13
        Top = 323
        Width = 60
        Height = 13
        Hint = ''
        Caption = 'Tipo Adenda'
        TabOrder = 22
      end
      object UniLabel29: TUniLabel
        Left = 533
        Top = 323
        Width = 58
        Height = 13
        Hint = ''
        Caption = 'Fecha Firma'
        TabOrder = 23
      end
      object UniLabel30: TUniLabel
        Left = 278
        Top = 323
        Width = 57
        Height = 13
        Hint = ''
        Caption = 'Nro Adenda'
        TabOrder = 24
      end
      object edtNroAdenda: TUniEdit
        Left = 341
        Top = 320
        Width = 38
        Hint = ''
        Text = ''
        TabOrder = 25
      end
      object chkImpAutoridadAdendad: TUniCheckBox
        Left = 11
        Top = 353
        Width = 177
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Importar datos desde autoridad'
        TabOrder = 26
      end
      object UniLabel31: TUniLabel
        Left = 202
        Top = 402
        Width = 166
        Height = 13
        Hint = ''
        Caption = '(*) Informacion a partir del padron'
        TabOrder = 27
      end
      object chkGenLote: TUniCheckBox
        Left = 11
        Top = 393
        Width = 118
        Height = 17
        Hint = ''
        Caption = 'Generar Lote PDFs'
        TabOrder = 28
        OnChange = chkGenLoteChange
      end
      object btnGenLoteAdenda: TUniButton
        Left = 121
        Top = 389
        Width = 61
        Height = 25
        Hint = ''
        Visible = False
        Caption = 'Gen PDFs'
        TabOrder = 29
        OnClick = btnGenLoteAdendaClick
      end
    end
  end
  object pnlProcesamiento: TUniPanel
    Left = 736
    Top = 8
    Width = 681
    Height = 352
    Hint = ''
    Visible = False
    TabOrder = 1
    Caption = ''
    object pbProcesamiento: TUniProgressBar
      Left = 40
      Top = 11
      Width = 489
      Hint = ''
      Text = 'Procesando ...'
      TabOrder = 1
    end
    object lblProcesamiento: TUniLabel
      Left = 248
      Top = 39
      Width = 80
      Height = 13
      Hint = ''
      Caption = 'lblProcesamiento'
      TabOrder = 2
    end
    object btnCerrarPnlProcesamiento: TUniBitBtn
      Left = 152
      Top = 249
      Width = 233
      Height = 25
      Hint = ''
      Enabled = False
      Caption = '[ X ]  Cerrar '
      TabOrder = 3
      OnClick = btnCerrarPnlProcesamientoClick
    end
    object mmoLogPDF: TUniMemo
      Left = 56
      Top = 79
      Width = 601
      Height = 150
      Hint = ''
      Lines.Strings = (
        'mmoLogPDF')
      TabOrder = 4
    end
  end
  object btnStart: TUniButton
    Left = 808
    Top = 386
    Width = 137
    Height = 45
    Hint = ''
    Caption = 'Generar Todos'
    TabOrder = 2
    OnClick = btnStartClick
  end
  object frxDBDatos1: TfrxDBDataset
    UserName = 'frxDBDatos1'
    CloseDataSource = False
    DataSet = ZQuery1
    BCDToCurrency = False
    Left = 216
    Top = 86
  end
  object frxDBDatosPadron: TfrxDBDataset
    UserName = 'frxDBDatosPadron'
    CloseDataSource = False
    DataSource = DM1.DSAuxSQL
    BCDToCurrency = False
    Left = 618
    Top = 88
  end
  object frxDBDatosMovPadron: TfrxDBDataset
    UserName = 'frxDBDatosMovPadron'
    CloseDataSource = False
    DataSource = DM1.DSUtilSQL
    BCDToCurrency = False
    Left = 540
    Top = 194
  end
  object zcaserio: TZQuery
    Connection = DM1.Base_Datos
    SQL.Strings = (
      'select '
      
        '(select p.appaterno from persona p where p.DNI=m.DNI_TITULAR) AP' +
        '_PATERNO,'
      
        '(select p.apmaterno from persona p where p.DNI=m.DNI_TITULAR) AP' +
        '_MATERNO,'
      
        '(select p.NOMBRE from persona p where p.DNI=m.DNI_TITULAR) NOMBR' +
        'ES,'
      
        '(select p.FECNAC from persona p where p.DNI=m.DNI_TITULAR) fecna' +
        'c'
      'from movpadron m'
      'where m.SUBTIPOMOV='#39'NUEVA FAMILIA'#39
      'and m.IDADENDA='#39'AD02-2022'#39)
    Params = <>
    Left = 74
    Top = 88
  end
  object ZQuery1: TZQuery
    Connection = DM1.Base_Datos
    Params = <>
    Left = 156
    Top = 86
  end
  object DsCaserio: TDataSource
    DataSet = zcaserio
    Left = 74
    Top = 188
  end
  object frxPDFExp: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 616
    Top = 142
  end
  object ZQuery2: TZQuery
    Connection = DM1.Base_Datos
    Params = <>
    Left = 154
    Top = 138
  end
  object frxDBDatos2: TfrxDBDataset
    UserName = 'frxDBDatos2'
    CloseDataSource = False
    DataSet = ZQuery2
    BCDToCurrency = False
    Left = 218
    Top = 138
  end
  object ZQuery3: TZQuery
    Connection = DM1.Base_Datos
    Params = <>
    Left = 154
    Top = 190
  end
  object frxDBDatos3: TfrxDBDataset
    UserName = 'frxDBDatos3'
    CloseDataSource = False
    DataSet = ZQuery3
    BCDToCurrency = False
    Left = 218
    Top = 190
  end
  object ZQuery4: TZQuery
    Connection = DM1.Base_Datos
    Params = <>
    Left = 318
    Top = 88
  end
  object ZQuery5: TZQuery
    Connection = DM1.Base_Datos
    Params = <>
    Left = 314
    Top = 138
  end
  object frxDBDatos4: TfrxDBDataset
    UserName = 'frxDBDatos4'
    CloseDataSource = False
    DataSet = ZQuery4
    BCDToCurrency = False
    Left = 378
    Top = 88
  end
  object frxDBDatos5: TfrxDBDataset
    UserName = 'frxDBDatos5'
    CloseDataSource = False
    DataSet = ZQuery5
    BCDToCurrency = False
    Left = 374
    Top = 138
  end
  object ZQuery6: TZQuery
    Connection = DM1.Base_Datos
    Params = <>
    Left = 318
    Top = 192
  end
  object frxDBDatos6: TfrxDBDataset
    UserName = 'frxDBDatos6'
    CloseDataSource = False
    DataSet = ZQuery6
    BCDToCurrency = False
    Left = 380
    Top = 194
  end
  object ZQuery7: TZQuery
    Connection = DM1.Base_Datos
    Params = <>
    Left = 456
    Top = 88
  end
  object frxDBDatos7: TfrxDBDataset
    UserName = 'frxDBDatos7'
    CloseDataSource = False
    DataSet = ZQuery7
    BCDToCurrency = False
    Left = 526
    Top = 88
  end
  object frxDBCaserios: TfrxDBDataset
    UserName = 'frxDBCaserios'
    CloseDataSource = False
    DataSet = ZQuery1
    BCDToCurrency = False
    Left = 74
    Top = 140
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    OpenAfterExport = False
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 632
    Top = 198
  end
  object zQueryFotos: TZQuery
    Connection = DM1.Base_Datos
    Params = <>
    Left = 458
    Top = 196
  end
  object ZQuery8: TZQuery
    Connection = DM1.Base_Datos
    Params = <>
    Left = 456
    Top = 144
  end
  object frxDBDatos8: TfrxDBDataset
    UserName = 'frxDBDatos8'
    CloseDataSource = False
    DataSet = ZQuery8
    BCDToCurrency = False
    Left = 526
    Top = 144
  end
  object TimerCartaAutoridad: TTimer
    Enabled = False
    Interval = 2000
    Left = 628
    Top = 536
  end
  object tmrProcesamiento: TUniTimer
    Interval = 200
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = tmrProcesamientoTimer
    Left = 944
    Top = 104
  end
  object UniThreadTimer1: TUniThreadTimer
    Interval = 500
    Left = 504
    Top = 536
  end
end
