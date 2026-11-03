object FrmDatosadenda: TFrmDatosadenda
  Left = 238
  Top = 20
  ClientHeight = 265
  ClientWidth = 409
  Caption = 'Adendas y Actas'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblIdadenda: TUniLabel
    Left = 10
    Top = 10
    Width = 51
    Height = 13
    Hint = ''
    Caption = 'ID Adenda'
    TabOrder = 11
  end
  object lblNombre: TUniLabel
    Left = 10
    Top = 34
    Width = 37
    Height = 13
    Hint = ''
    Caption = 'Nombre'
    TabOrder = 12
  end
  object lblTipo: TUniLabel
    Left = 8
    Top = 58
    Width = 75
    Height = 13
    Hint = ''
    Caption = 'Tipo de Adenda'
    TabOrder = 13
  end
  object lblDocumento: TUniLabel
    Left = 10
    Top = 161
    Width = 79
    Height = 13
    Hint = ''
    Caption = 'Adenda Anterior'
    TabOrder = 14
  end
  object lblFecha: TUniLabel
    Left = 10
    Top = 110
    Width = 29
    Height = 13
    Hint = ''
    Caption = 'Fecha'
    TabOrder = 15
  end
  object edtIdadenda: TUniEdit
    Left = 92
    Top = 7
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 10
    Text = ''
    TabOrder = 0
  end
  object edtNombre: TUniEdit
    Left = 92
    Top = 31
    Width = 298
    Height = 21
    Hint = ''
    MaxLength = 64
    Text = ''
    TabOrder = 1
  end
  object edtTipo: TUniEdit
    Left = 92
    Top = 55
    Width = 60
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 32
    Text = ''
    TabOrder = 2
  end
  object edtAdendaAnterior: TUniEdit
    Left = 92
    Top = 155
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 32
    Text = ''
    TabOrder = 6
  end
  object edtFecha: TUniEdit
    Left = 92
    Top = 107
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 10
    Text = ''
    TabOrder = 4
  end
  object btnLimpiar: TUniBitBtn
    Left = 10
    Top = 216
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Limpiar'
    TabOrder = 8
    OnClick = btnLimpiarClick
  end
  object btnGuardar: TUniBitBtn
    Left = 140
    Top = 216
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Guardar'
    TabOrder = 9
    OnClick = btnGuardarClick
  end
  object btnSalir: TUniBitBtn
    Left = 270
    Top = 216
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Salir'
    TabOrder = 10
    OnClick = btnSalirClick
  end
  object edtestado: TUniComboBox
    Left = 92
    Top = 131
    Width = 100
    Hint = ''
    Style = csOwnerDrawFixed
    Text = ''
    Items.Strings = (
      'INACTIVO'
      'ACTIVO')
    TabOrder = 5
    CharCase = ecUpperCase
    IconItems = <>
  end
  object UniLabel1: TUniLabel
    Left = 10
    Top = 138
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Estado'
    TabOrder = 16
  end
  object edtsellado: TUniComboBox
    Left = 92
    Top = 180
    Width = 100
    Hint = ''
    Style = csOwnerDrawFixed
    Text = ''
    Items.Strings = (
      'NO'
      'SI')
    TabOrder = 7
    CharCase = ecUpperCase
    IconItems = <>
  end
  object UniLabel2: TUniLabel
    Left = 10
    Top = 187
    Width = 34
    Height = 13
    Hint = ''
    Caption = 'Sellado'
    TabOrder = 17
  end
  object UniLabel3: TUniLabel
    Left = 11
    Top = 83
    Width = 72
    Height = 13
    Hint = ''
    Caption = 'Nro de Adenda'
    TabOrder = 18
  end
  object edtNroAdenda: TUniEdit
    Left = 92
    Top = 80
    Width = 60
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 32
    Text = ''
    TabOrder = 3
  end
end
