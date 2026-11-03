object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 481
  ClientWidth = 695
  Caption = 'Adendas V0.98'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  Position = poDesktopCenter
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblIdMain: TUniLabel
    Left = 8
    Top = 4
    Width = 12
    Height = 13
    Hint = ''
    Caption = '---'
    TabOrder = 1
  end
  object UniGroupBox1: TUniGroupBox
    Left = 354
    Top = 46
    Width = 220
    Height = 145
    Hint = ''
    Caption = 'Caserios'
    TabOrder = 2
    object btncaserios: TUniBitBtn
      Left = 40
      Top = 16
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Caserios'
      TabOrder = 1
      OnClick = btncaseriosClick
    end
    object btnAutoridades: TUniBitBtn
      Left = 40
      Top = 58
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Autoridades'
      TabOrder = 2
      OnClick = btnAutoridadesClick
    end
    object btnPosicionGPS: TUniBitBtn
      Left = 40
      Top = 100
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Posicionamiento GPS'
      TabOrder = 3
      OnClick = btnAutoridadesClick
    end
  end
  object UniGroupBox2: TUniGroupBox
    Left = 354
    Top = 311
    Width = 220
    Height = 105
    Hint = ''
    Caption = 'Recursos Humanos'
    TabOrder = 3
    object btnPersonas: TUniBitBtn
      Left = 40
      Top = 59
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Personas'
      TabOrder = 1
      OnClick = btnPersonasClick
    end
    object btnUsuarios: TUniBitBtn
      Left = 40
      Top = 17
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Usuarios'
      TabOrder = 2
      OnClick = btnUsuariosClick
    end
  end
  object UniGroupBox3: TUniGroupBox
    Left = 92
    Top = 46
    Width = 220
    Height = 145
    Hint = ''
    Caption = 'Padron'
    TabOrder = 4
    object btnPadronBeneficiarios: TUniBitBtn
      Left = 40
      Top = 58
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Padron Beneficiarios'
      TabOrder = 1
      OnClick = btnPadronBeneficiariosClick
    end
    object btnPadronCambios: TUniBitBtn
      Left = 40
      Top = 16
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Padron Cambios'
      TabOrder = 2
      OnClick = btnPadronCambiosClick
    end
    object btnReportes: TUniBitBtn
      Left = 40
      Top = 100
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Reportes'
      TabOrder = 3
      OnClick = btnReportesClick
    end
  end
  object UniGroupBox4: TUniGroupBox
    Left = 92
    Top = 200
    Width = 220
    Height = 216
    Hint = ''
    Caption = 'Tablas'
    TabOrder = 5
    object btnMovimientos: TUniBitBtn
      Left = 40
      Top = 115
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Movimientos'
      TabOrder = 1
      OnClick = btnMovimientosClick
    end
    object btnActividades: TUniBitBtn
      Left = 40
      Top = 68
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Actividades'
      TabOrder = 2
      OnClick = btnActividadesClick
    end
    object btnAdendas: TUniBitBtn
      Left = 40
      Top = 23
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Adendas'
      TabOrder = 3
      OnClick = btnAdendasClick
    end
    object btnubigeos: TUniBitBtn
      Left = 40
      Top = 161
      Width = 136
      Height = 36
      Hint = ''
      Enabled = False
      Caption = 'Ubigeos'
      TabOrder = 4
      OnClick = btnMovimientosClick
    end
  end
  object btnSalir: TUniBitBtn
    Left = 266
    Top = 426
    Width = 136
    Height = 36
    Hint = ''
    Caption = 'Salir'
    TabOrder = 6
    OnClick = btnSalirClick
  end
  object lbldniusuario: TUniLabel
    Left = 8
    Top = 22
    Width = 12
    Height = 13
    Hint = ''
    Caption = '---'
    TabOrder = 7
  end
  object lbltipousuario: TUniLabel
    Left = 8
    Top = 58
    Width = 12
    Height = 13
    Hint = ''
    Caption = '---'
    TabOrder = 8
  end
  object lblusuario: TUniLabel
    Left = 8
    Top = 40
    Width = 12
    Height = 13
    Hint = ''
    Caption = '---'
    TabOrder = 9
  end
  object UniGroupBox6: TUniGroupBox
    Left = 354
    Top = 200
    Width = 220
    Height = 105
    Hint = ''
    Caption = 'SimDev'
    TabOrder = 10
    object btnsimdevdata: TUniBitBtn
      Left = 40
      Top = 59
      Width = 136
      Height = 36
      Hint = ''
      Caption = 'Recoleccion de Datos'
      TabOrder = 1
    end
    object btnsimdevplan: TUniBitBtn
      Left = 40
      Top = 17
      Width = 136
      Height = 36
      Hint = ''
      Caption = 'Planificacion'
      TabOrder = 2
      OnClick = btnsimdevplanClick
    end
  end
  object pnlIngreso: TUniPanel
    Left = 8
    Top = 3
    Width = 675
    Height = 473
    Hint = ''
    TabOrder = 0
    Caption = ''
    object UniGroupBox5: TUniGroupBox
      Left = 224
      Top = 152
      Width = 221
      Height = 129
      Hint = ''
      Caption = 'Login'
      ParentColor = False
      Color = clGradientInactiveCaption
      TabOrder = 1
      object edtusuario: TUniEdit
        Left = 80
        Top = 32
        Width = 121
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object edtclave: TUniEdit
        Left = 80
        Top = 61
        Width = 121
        Hint = ''
        PasswordChar = '*'
        Text = ''
        TabOrder = 2
        OnKeyUp = edtclaveKeyUp
      end
      object UniLabel1: TUniLabel
        Left = 14
        Top = 32
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'Usuario'
        TabOrder = 3
      end
      object UniLabel2: TUniLabel
        Left = 14
        Top = 64
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'Contrase'#241'a'
        TabOrder = 4
      end
      object btnIngresar: TUniBitBtn
        Left = 30
        Top = 94
        Width = 74
        Height = 25
        Hint = ''
        Caption = 'Ingresar'
        TabOrder = 5
        OnClick = btnIngresarClick
      end
      object UniBitBtn12: TUniBitBtn
        Left = 116
        Top = 94
        Width = 74
        Height = 25
        Hint = ''
        Caption = 'Cerrar'
        TabOrder = 6
        OnClick = UniBitBtn12Click
      end
    end
    object mmopermisos: TUniMemo
      Left = 56
      Top = 323
      Width = 553
      Height = 126
      Hint = ''
      Visible = False
      ScrollBars = ssBoth
      Lines.Strings = (
        'mmopermisos')
      TabOrder = 2
    end
  end
end
