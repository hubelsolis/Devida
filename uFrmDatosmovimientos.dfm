object FrmDatosmovimientos: TFrmDatosmovimientos
  Left = 238
  Top = 20
  ClientHeight = 316
  ClientWidth = 439
  Caption = 'Tipo de Movimiento'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblTipomovimiento: TUniLabel
    Left = 18
    Top = 12
    Width = 74
    Height = 13
    Hint = ''
    Caption = 'Tipomovimiento'
    TabOrder = 0
  end
  object lblSubtipomov: TUniLabel
    Left = 18
    Top = 38
    Width = 56
    Height = 13
    Hint = ''
    Caption = 'Subtipomov'
    TabOrder = 1
  end
  object lblOperacion: TUniLabel
    Left = 18
    Top = 65
    Width = 49
    Height = 13
    Hint = ''
    Caption = 'Operacion'
    TabOrder = 2
  end
  object lblReferencia: TUniLabel
    Left = 18
    Top = 175
    Width = 52
    Height = 13
    Hint = ''
    Caption = 'Referencia'
    TabOrder = 3
  end
  object lblOrden: TUniLabel
    Left = 19
    Top = 227
    Width = 30
    Height = 13
    Hint = ''
    Caption = 'Orden'
    TabOrder = 4
  end
  object edtTipomovimiento: TUniEdit
    Left = 108
    Top = 8
    Width = 320
    Height = 21
    Hint = ''
    MaxLength = 32
    Text = ''
    TabOrder = 11
  end
  object edtSubtipomov: TUniEdit
    Left = 108
    Top = 34
    Width = 320
    Height = 21
    Hint = ''
    MaxLength = 62
    Text = ''
    TabOrder = 12
  end
  object edtOrden: TUniEdit
    Left = 108
    Top = 226
    Width = 47
    Height = 21
    Hint = ''
    MaxLength = 6
    Text = ''
    TabOrder = 18
  end
  object btnLimpiar: TUniBitBtn
    Left = 28
    Top = 264
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Limpiar'
    TabOrder = 19
    OnClick = btnLimpiarClick
  end
  object btnGuardar: TUniBitBtn
    Left = 158
    Top = 264
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Guardar'
    TabOrder = 20
    OnClick = btnGuardarClick
  end
  object btnSalir: TUniBitBtn
    Left = 288
    Top = 264
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Salir'
    TabOrder = 21
    OnClick = btnSalirClick
  end
  object edtOperacion: TUniComboBox
    Left = 108
    Top = 61
    Width = 47
    Hint = ''
    MaxLength = 2
    Text = 'edtOperacion'
    Items.Strings = (
      '1'
      '0'
      '-1')
    TabOrder = 13
    IconItems = <>
  end
  object edtReferencia: TUniComboBox
    Left = 108
    Top = 171
    Width = 47
    Hint = ''
    MaxLength = 2
    Text = 'UniComboBox1'
    Items.Strings = (
      'SI'
      'NO')
    TabOrder = 17
    IconItems = <>
  end
  object UniLabel1: TUniLabel
    Left = 169
    Top = 64
    Width = 138
    Height = 13
    Hint = ''
    Caption = '1 sumar,  0 neutro, -1 restar'
    TabOrder = 5
  end
  object UniLabel2: TUniLabel
    Left = 161
    Top = 176
    Width = 254
    Height = 13
    Hint = ''
    Caption = 'Con referencia a otro DNI, por ejemplo en reemplazo'
    TabOrder = 6
  end
  object UniLabel3: TUniLabel
    Left = 18
    Top = 93
    Width = 78
    Height = 13
    Hint = ''
    Caption = 'Solo Act. en uso'
    TabOrder = 7
  end
  object edtSolo_has_en_uso: TUniComboBox
    Left = 108
    Top = 89
    Width = 47
    Hint = ''
    MaxLength = 2
    Text = 'edtOperacion'
    Items.Strings = (
      'SI'
      'NO')
    TabOrder = 14
    IconItems = <>
  end
  object UniLabel4: TUniLabel
    Left = 18
    Top = 121
    Width = 64
    Height = 13
    Hint = ''
    Caption = 'Comp. Logica'
    TabOrder = 8
  end
  object edtMayorque: TUniComboBox
    Left = 108
    Top = 117
    Width = 91
    Hint = ''
    MaxLength = 6
    Text = 'edtOperacion'
    Items.Strings = (
      'MAYOR'
      'MENOR'
      'IGUAL'
      'MAYOR_IGUAL'
      'MENOR_IGUAL'
      'SIN_REGLA')
    TabOrder = 15
    IconItems = <>
  end
  object UniLabel5: TUniLabel
    Left = 205
    Top = 121
    Width = 183
    Height = 13
    Hint = ''
    Caption = 'Operacion logica Mayor, Menor, Igual '
    TabOrder = 9
  end
  object UniLabel6: TUniLabel
    Left = 18
    Top = 148
    Width = 75
    Height = 13
    Hint = ''
    Caption = 'Limite para Act.'
    TabOrder = 10
  end
  object edtLimite: TUniEdit
    Left = 108
    Top = 145
    Width = 47
    Height = 21
    Hint = ''
    MaxLength = 6
    Text = ''
    TabOrder = 16
  end
  object edtJalar_Datos_referencia: TUniComboBox
    Left = 108
    Top = 199
    Width = 47
    Hint = ''
    MaxLength = 2
    Text = 'edtJalar_Datos_referencia'
    Items.Strings = (
      'SI'
      'NO')
    TabOrder = 22
    IconItems = <>
  end
  object UniLabel7: TUniLabel
    Left = 18
    Top = 199
    Width = 83
    Height = 13
    Hint = ''
    Caption = 'Datos Referencia'
    TabOrder = 23
  end
end
