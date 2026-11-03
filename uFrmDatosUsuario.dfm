object FrmDatosUsuario: TFrmDatosUsuario
  Left = 238
  Top = 20
  ClientHeight = 258
  ClientWidth = 406
  Caption = 'Usuario'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblDni: TUniLabel
    Left = 10
    Top = 10
    Width = 18
    Height = 13
    Hint = ''
    Caption = 'DNI'
    TabOrder = 0
  end
  object lblUsuario: TUniLabel
    Left = 10
    Top = 62
    Width = 36
    Height = 13
    Hint = ''
    Caption = 'Usuario'
    TabOrder = 7
  end
  object lblClave: TUniLabel
    Left = 10
    Top = 86
    Width = 27
    Height = 13
    Hint = ''
    Caption = 'Clave'
    TabOrder = 8
  end
  object lblTipousuario: TUniLabel
    Left = 10
    Top = 110
    Width = 55
    Height = 13
    Hint = ''
    Caption = 'Tipousuario'
    TabOrder = 9
  end
  object lblPermisos: TUniLabel
    Left = 10
    Top = 134
    Width = 42
    Height = 13
    Hint = ''
    Caption = 'Permisos'
    TabOrder = 10
  end
  object lblEstado: TUniLabel
    Left = 10
    Top = 158
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Estado'
    TabOrder = 11
  end
  object edtDni: TUniEdit
    Left = 74
    Top = 8
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 8
    Text = ''
    TabOrder = 1
    OnKeyUp = edtDniKeyUp
  end
  object edtUsuario: TUniEdit
    Left = 74
    Top = 60
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 32
    Text = ''
    TabOrder = 2
  end
  object edtClave: TUniEdit
    Left = 74
    Top = 84
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 32
    Text = ''
    TabOrder = 3
  end
  object edtPermisos: TUniEdit
    Left = 74
    Top = 133
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 32
    Text = ''
    TabOrder = 4
  end
  object edtEstado: TUniEdit
    Left = 74
    Top = 158
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 32
    Text = ''
    TabOrder = 5
  end
  object btnLimpiar: TUniBitBtn
    Left = 7
    Top = 196
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Limpiar'
    TabOrder = 12
    OnClick = btnLimpiarClick
  end
  object btnGuardar: TUniBitBtn
    Left = 137
    Top = 196
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Guardar'
    TabOrder = 13
    OnClick = btnGuardarClick
  end
  object btnSalir: TUniBitBtn
    Left = 267
    Top = 196
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Salir'
    TabOrder = 6
    OnClick = btnSalirClick
  end
  object lblnombre: TUniLabel
    Left = 184
    Top = 13
    Width = 206
    Height = 13
    Hint = ''
    AutoSize = False
    Caption = '...'
    TabOrder = 14
  end
  object edtTipousuario: TUniComboBox
    Left = 74
    Top = 108
    Width = 100
    Hint = ''
    MaxLength = 64
    Text = 'edtTipousuario'
    Items.Strings = (
      'ADMIN'
      'TECNICO'
      'COORDINADOR')
    TabOrder = 15
    IconItems = <>
  end
  object lista: TUniListBox
    Left = 189
    Top = 86
    Width = 198
    Height = 93
    Hint = ''
    TabOrder = 16
  end
  object UniLabel1: TUniLabel
    Left = 192
    Top = 64
    Width = 83
    Height = 13
    Hint = ''
    Caption = 'Actividad Usuario'
    TabOrder = 17
  end
  object btnmas: TUniSpeedButton
    Left = 335
    Top = 60
    Width = 23
    Height = 22
    Hint = ''
    Caption = '+'
    ParentColor = False
    Color = clWindow
    TabOrder = 18
    OnClick = btnmasClick
  end
  object btnmenos: TUniSpeedButton
    Left = 364
    Top = 60
    Width = 23
    Height = 22
    Hint = ''
    Caption = '-'
    ParentColor = False
    Color = clWindow
    TabOrder = 19
    OnClick = btnmenosClick
  end
  object UniLabel2: TUniLabel
    Left = 10
    Top = 35
    Width = 29
    Height = 13
    Hint = ''
    Caption = 'Cargo'
    TabOrder = 20
  end
  object edtCargo: TUniEdit
    Left = 74
    Top = 33
    Width = 316
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 32
    Text = ''
    TabOrder = 21
  end
end
