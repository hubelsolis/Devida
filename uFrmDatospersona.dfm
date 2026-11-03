object FrmDatospersona: TFrmDatospersona
  Left = 238
  Top = 20
  ClientHeight = 344
  ClientWidth = 443
  Caption = 'Persona'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblDni: TUniLabel
    Left = 16
    Top = 11
    Width = 18
    Height = 13
    Hint = ''
    Caption = 'DNI'
    TabOrder = 0
  end
  object lblApellido_paterno: TUniLabel
    Left = 16
    Top = 35
    Width = 81
    Height = 13
    Hint = ''
    Caption = 'Apellido_paterno'
    TabOrder = 10
  end
  object lblApellido_materno: TUniLabel
    Left = 16
    Top = 59
    Width = 83
    Height = 13
    Hint = ''
    Caption = 'Apellido_materno'
    TabOrder = 11
  end
  object lblNombre: TUniLabel
    Left = 16
    Top = 83
    Width = 37
    Height = 13
    Hint = ''
    Caption = 'Nombre'
    TabOrder = 12
  end
  object lblFecnac: TUniLabel
    Left = 16
    Top = 107
    Width = 84
    Height = 13
    Hint = ''
    Caption = 'Fecha Nacimiento'
    TabOrder = 13
  end
  object lblTelefono: TUniLabel
    Left = 16
    Top = 131
    Width = 42
    Height = 13
    Hint = ''
    Caption = 'Telefono'
    TabOrder = 14
  end
  object lblDireccion: TUniLabel
    Left = 16
    Top = 155
    Width = 43
    Height = 13
    Hint = ''
    Caption = 'Direccion'
    TabOrder = 15
  end
  object lblSexo: TUniLabel
    Left = 16
    Top = 179
    Width = 24
    Height = 13
    Hint = ''
    Caption = 'Sexo'
    TabOrder = 16
  end
  object lblEtnia: TUniLabel
    Left = 16
    Top = 203
    Width = 24
    Height = 13
    Hint = ''
    Caption = 'Etnia'
    TabOrder = 17
  end
  object lblLengua: TUniLabel
    Left = 16
    Top = 227
    Width = 35
    Height = 13
    Hint = ''
    Caption = 'Lengua'
    TabOrder = 18
  end
  object edtDni: TUniEdit
    Left = 123
    Top = 11
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 8
    Text = ''
    TabOrder = 1
  end
  object edtAppaterno: TUniEdit
    Left = 123
    Top = 35
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 65
    Text = ''
    TabOrder = 2
  end
  object edtApmaterno: TUniEdit
    Left = 123
    Top = 59
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = ''
    TabOrder = 3
  end
  object edtNombre: TUniEdit
    Left = 123
    Top = 83
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = ''
    TabOrder = 4
  end
  object edtTelefono: TUniEdit
    Left = 123
    Top = 133
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 16
    Text = ''
    TabOrder = 5
  end
  object edtDireccion: TUniEdit
    Left = 123
    Top = 157
    Width = 293
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 64
    Text = ''
    TabOrder = 6
  end
  object edtEtnia: TUniEdit
    Left = 123
    Top = 205
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 7
  end
  object edtLengua: TUniEdit
    Left = 123
    Top = 230
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 8
  end
  object btnLimpiar: TUniBitBtn
    Left = 24
    Top = 281
    Width = 120
    Height = 32
    Hint = ''
    Caption = 'Limpiar'
    TabOrder = 19
    OnClick = btnLimpiarClick
  end
  object btnGuardar: TUniBitBtn
    Left = 154
    Top = 281
    Width = 120
    Height = 32
    Hint = ''
    Caption = 'Guardar'
    TabOrder = 20
    OnClick = btnGuardarClick
  end
  object btnSalir: TUniBitBtn
    Left = 284
    Top = 281
    Width = 120
    Height = 32
    Hint = ''
    Caption = 'Salir'
    TabOrder = 9
    OnClick = btnSalirClick
  end
  object edtfecnac: TUniDateTimePicker
    Left = 123
    Top = 107
    Width = 100
    Hint = ''
    DateTime = 44910.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 21
  end
  object edtSexo: TUniComboBox
    Left = 123
    Top = 180
    Width = 45
    Hint = ''
    Text = ''
    Items.Strings = (
      'M'
      'F')
    TabOrder = 22
    IconItems = <>
  end
end
