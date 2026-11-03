object FrmDatospersonaPadron: TFrmDatospersonaPadron
  Left = 238
  Top = 20
  ClientHeight = 385
  ClientWidth = 931
  Caption = 'Persona Padron'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblDni: TUniLabel
    Left = 32
    Top = 35
    Width = 18
    Height = 13
    Hint = ''
    Caption = 'DNI'
    TabOrder = 0
  end
  object lblApellido_paterno: TUniLabel
    Left = 32
    Top = 59
    Width = 81
    Height = 13
    Hint = ''
    Caption = 'Apellido_paterno'
    TabOrder = 10
  end
  object lblApellido_materno: TUniLabel
    Left = 32
    Top = 83
    Width = 83
    Height = 13
    Hint = ''
    Caption = 'Apellido_materno'
    TabOrder = 11
  end
  object lblNombre: TUniLabel
    Left = 32
    Top = 107
    Width = 37
    Height = 13
    Hint = ''
    Caption = 'Nombre'
    TabOrder = 12
  end
  object lblFecnac: TUniLabel
    Left = 32
    Top = 131
    Width = 84
    Height = 13
    Hint = ''
    Caption = 'Fecha Nacimiento'
    TabOrder = 13
  end
  object lblTelefono: TUniLabel
    Left = 32
    Top = 155
    Width = 42
    Height = 13
    Hint = ''
    Caption = 'Telefono'
    TabOrder = 14
  end
  object lblDireccion: TUniLabel
    Left = 32
    Top = 179
    Width = 43
    Height = 13
    Hint = ''
    Caption = 'Direccion'
    TabOrder = 15
  end
  object lblSexo: TUniLabel
    Left = 32
    Top = 203
    Width = 24
    Height = 13
    Hint = ''
    Caption = 'Sexo'
    TabOrder = 16
  end
  object lblEtnia: TUniLabel
    Left = 32
    Top = 227
    Width = 24
    Height = 13
    Hint = ''
    Caption = 'Etnia'
    TabOrder = 17
  end
  object lblLengua: TUniLabel
    Left = 32
    Top = 251
    Width = 35
    Height = 13
    Hint = ''
    Caption = 'Lengua'
    TabOrder = 18
  end
  object edtDni: TUniEdit
    Left = 139
    Top = 35
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 8
    Text = ''
    TabOrder = 1
  end
  object edtAppaterno: TUniEdit
    Left = 139
    Top = 59
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 65
    Text = ''
    TabOrder = 2
  end
  object edtApmaterno: TUniEdit
    Left = 139
    Top = 83
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = ''
    TabOrder = 3
  end
  object edtNombre: TUniEdit
    Left = 139
    Top = 107
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = ''
    TabOrder = 4
  end
  object edtTelefono: TUniEdit
    Left = 139
    Top = 157
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 16
    Text = ''
    TabOrder = 5
  end
  object edtDireccion: TUniEdit
    Left = 139
    Top = 181
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = ''
    TabOrder = 6
  end
  object edtEtnia: TUniEdit
    Left = 139
    Top = 229
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 7
  end
  object edtLengua: TUniEdit
    Left = 139
    Top = 254
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 8
  end
  object btnLimpiar: TUniBitBtn
    Left = 260
    Top = 321
    Width = 120
    Height = 32
    Hint = ''
    Caption = 'Limpiar'
    TabOrder = 19
    OnClick = btnLimpiarClick
  end
  object btnGuardar: TUniBitBtn
    Left = 390
    Top = 321
    Width = 120
    Height = 32
    Hint = ''
    Caption = 'Guardar'
    TabOrder = 20
    OnClick = btnGuardarClick
  end
  object btnSalir: TUniBitBtn
    Left = 520
    Top = 321
    Width = 120
    Height = 32
    Hint = ''
    Caption = 'Salir'
    TabOrder = 9
    OnClick = btnSalirClick
  end
  object edtfecnac: TUniDateTimePicker
    Left = 139
    Top = 131
    Width = 100
    Hint = ''
    DateTime = 44910.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 21
  end
  object edtSexo: TUniComboBox
    Left = 139
    Top = 204
    Width = 45
    Hint = ''
    Text = 'edtSexo'
    Items.Strings = (
      'M'
      'F')
    TabOrder = 22
    IconItems = <>
  end
  object UniLabel1: TUniLabel
    Left = 488
    Top = 35
    Width = 18
    Height = 13
    Hint = ''
    Caption = 'DNI'
    TabOrder = 23
  end
  object UniLabel2: TUniLabel
    Left = 488
    Top = 59
    Width = 81
    Height = 13
    Hint = ''
    Caption = 'Apellido_paterno'
    TabOrder = 24
  end
  object UniLabel3: TUniLabel
    Left = 488
    Top = 83
    Width = 83
    Height = 13
    Hint = ''
    Caption = 'Apellido_materno'
    TabOrder = 25
  end
  object UniLabel4: TUniLabel
    Left = 488
    Top = 107
    Width = 37
    Height = 13
    Hint = ''
    Caption = 'Nombre'
    TabOrder = 26
  end
  object UniLabel5: TUniLabel
    Left = 488
    Top = 131
    Width = 84
    Height = 13
    Hint = ''
    Caption = 'Fecha Nacimiento'
    TabOrder = 27
  end
  object UniLabel6: TUniLabel
    Left = 488
    Top = 155
    Width = 42
    Height = 13
    Hint = ''
    Caption = 'Telefono'
    TabOrder = 28
  end
  object UniLabel7: TUniLabel
    Left = 488
    Top = 179
    Width = 43
    Height = 13
    Hint = ''
    Caption = 'Direccion'
    TabOrder = 29
  end
  object UniLabel8: TUniLabel
    Left = 488
    Top = 203
    Width = 24
    Height = 13
    Hint = ''
    Caption = 'Sexo'
    TabOrder = 30
  end
  object UniLabel9: TUniLabel
    Left = 488
    Top = 227
    Width = 24
    Height = 13
    Hint = ''
    Caption = 'Etnia'
    TabOrder = 31
  end
  object UniLabel10: TUniLabel
    Left = 488
    Top = 251
    Width = 35
    Height = 13
    Hint = ''
    Caption = 'Lengua'
    TabOrder = 32
  end
  object edtDNI_CONY: TUniEdit
    Left = 595
    Top = 35
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 8
    Text = ''
    TabOrder = 33
  end
  object edtAppaterno_CONY: TUniEdit
    Left = 595
    Top = 59
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 65
    Text = ''
    TabOrder = 34
  end
  object edtApMaterno_CONY: TUniEdit
    Left = 595
    Top = 83
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = ''
    TabOrder = 35
  end
  object edtNombre_CONY: TUniEdit
    Left = 595
    Top = 107
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = ''
    TabOrder = 36
  end
  object edtTelefono_CONY: TUniEdit
    Left = 595
    Top = 156
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 16
    Text = ''
    TabOrder = 37
  end
  object edtDireccion_CONY: TUniEdit
    Left = 595
    Top = 181
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = ''
    TabOrder = 38
  end
  object edtEtnia_CONY: TUniEdit
    Left = 595
    Top = 229
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 39
  end
  object edtLengua_CONY: TUniEdit
    Left = 595
    Top = 254
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 40
  end
  object edtFecNac_CONY: TUniDateTimePicker
    Left = 595
    Top = 131
    Width = 100
    Hint = ''
    DateTime = 44910.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 41
  end
  object edtSexo_CONY: TUniComboBox
    Left = 595
    Top = 204
    Width = 45
    Hint = ''
    Text = 'edtSexo'
    Items.Strings = (
      'M'
      'F')
    TabOrder = 42
    IconItems = <>
  end
  object UniLabel11: TUniLabel
    Left = 32
    Top = 8
    Width = 53
    Height = 16
    Hint = ''
    Caption = 'TITULAR'
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 43
  end
  object UniLabel12: TUniLabel
    Left = 488
    Top = 8
    Width = 65
    Height = 16
    Hint = ''
    Caption = 'CONYUGUE'
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 44
  end
end
