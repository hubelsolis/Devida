object FrmDatosAutoridad: TFrmDatosAutoridad
  Left = 238
  Top = 20
  ClientHeight = 219
  ClientWidth = 556
  Caption = 'Autoridad'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblIdcaserio: TUniLabel
    Left = 10
    Top = 10
    Width = 50
    Height = 13
    Hint = ''
    Caption = 'ID Caserio'
    TabOrder = 0
  end
  object lblDni: TUniLabel
    Left = 10
    Top = 34
    Width = 18
    Height = 13
    Hint = ''
    Caption = 'DNI'
    TabOrder = 7
  end
  object lblFecha: TUniLabel
    Left = 10
    Top = 58
    Width = 29
    Height = 13
    Hint = ''
    Caption = 'Fecha'
    TabOrder = 8
  end
  object lblCargo: TUniLabel
    Left = 10
    Top = 82
    Width = 29
    Height = 13
    Hint = ''
    Caption = 'Cargo'
    TabOrder = 9
  end
  object lblResolucion: TUniLabel
    Left = 10
    Top = 106
    Width = 51
    Height = 13
    Hint = ''
    Caption = 'Resolucion'
    TabOrder = 10
  end
  object lblEstado: TUniLabel
    Left = 10
    Top = 130
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Estado'
    TabOrder = 11
  end
  object edtIdcaserio: TUniEdit
    Left = 120
    Top = 10
    Width = 100
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
    OnKeyUp = edtIdcaserioKeyUp
  end
  object edtDni: TUniEdit
    Left = 120
    Top = 34
    Width = 100
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
    OnKeyUp = edtDniKeyUp
  end
  object edtFecha: TUniEdit
    Left = 120
    Top = 58
    Width = 100
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 3
  end
  object edtCargo: TUniEdit
    Left = 120
    Top = 82
    Width = 419
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 128
    Text = ''
    TabOrder = 4
  end
  object edtResolucion: TUniEdit
    Left = 120
    Top = 106
    Width = 419
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    MaxLength = 128
    Text = ''
    TabOrder = 5
  end
  object btnLimpiar: TUniBitBtn
    Left = 100
    Top = 180
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Limpiar'
    TabOrder = 12
    OnClick = btnLimpiarClick
  end
  object btnGuardar: TUniBitBtn
    Left = 230
    Top = 180
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Guardar'
    TabOrder = 13
    OnClick = btnGuardarClick
  end
  object btnSalir: TUniBitBtn
    Left = 360
    Top = 180
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Salir'
    TabOrder = 6
    OnClick = btnSalirClick
  end
  object edtappaterno: TUniEdit
    Left = 228
    Top = 34
    Width = 101
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = 'EDTAPPATERNO'
    TabOrder = 14
    Color = clBtnFace
  end
  object edtapmaterno: TUniEdit
    Left = 335
    Top = 34
    Width = 103
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = 'UNIEDIT1'
    TabOrder = 15
    Color = clBtnFace
  end
  object edtnombres: TUniEdit
    Left = 447
    Top = 34
    Width = 92
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = 'UNIEDIT1'
    TabOrder = 16
    Color = clBtnFace
  end
  object UniLabel1: TUniLabel
    Left = 440
    Top = 42
    Width = 4
    Height = 13
    Hint = ''
    Caption = ','
    TabOrder = 17
  end
  object UniLabel2: TUniLabel
    Left = 176
    Top = 134
    Width = 119
    Height = 13
    Hint = ''
    Caption = '1 = Activo,  0 = Inactivo'
    TabOrder = 18
  end
  object edtEstado: TUniComboBox
    Left = 120
    Top = 130
    Width = 45
    Hint = ''
    Text = 'edtEstado'
    Items.Strings = (
      '1'
      '0')
    TabOrder = 19
    IconItems = <>
  end
  object lblcaserio: TUniLabel
    Left = 228
    Top = 14
    Width = 44
    Height = 13
    Hint = ''
    Caption = 'lblcaserio'
    TabOrder = 20
  end
end
