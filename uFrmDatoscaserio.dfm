object FrmDatoscaserio: TFrmDatoscaserio
  Left = 238
  Top = 20
  ClientHeight = 310
  ClientWidth = 405
  Caption = 'caserio'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object lblIdcaserio: TUniLabel
    Left = 10
    Top = 10
    Width = 44
    Height = 13
    Hint = ''
    Caption = 'Idcaserio'
    TabOrder = 0
  end
  object lblAmbito: TUniLabel
    Left = 10
    Top = 34
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Ambito'
    TabOrder = 12
  end
  object lblDepartamento: TUniLabel
    Left = 10
    Top = 58
    Width = 69
    Height = 13
    Hint = ''
    Caption = 'Departamento'
    TabOrder = 13
  end
  object lblProvincia: TUniLabel
    Left = 10
    Top = 82
    Width = 43
    Height = 13
    Hint = ''
    Caption = 'Provincia'
    TabOrder = 14
  end
  object lblDistrito: TUniLabel
    Left = 10
    Top = 106
    Width = 34
    Height = 13
    Hint = ''
    Caption = 'Distrito'
    TabOrder = 15
  end
  object lblCaserio: TUniLabel
    Left = 10
    Top = 130
    Width = 36
    Height = 13
    Hint = ''
    Caption = 'Caserio'
    TabOrder = 16
  end
  object lblRegion_natural: TUniLabel
    Left = 10
    Top = 154
    Width = 73
    Height = 13
    Hint = ''
    Caption = 'Region_natural'
    TabOrder = 17
  end
  object lblCoorx: TUniLabel
    Left = 10
    Top = 178
    Width = 29
    Height = 13
    Hint = ''
    Caption = 'Coorx'
    TabOrder = 18
  end
  object lblCoory: TUniLabel
    Left = 10
    Top = 202
    Width = 29
    Height = 13
    Hint = ''
    Caption = 'Coory'
    TabOrder = 19
  end
  object lblAltitud: TUniLabel
    Left = 10
    Top = 226
    Width = 31
    Height = 13
    Hint = ''
    Caption = 'Altitud'
    TabOrder = 20
  end
  object edtIdcaserio: TUniEdit
    Left = 120
    Top = 10
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 1
  end
  object edtAmbito: TUniEdit
    Left = 120
    Top = 34
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 2
  end
  object edtDepartamento: TUniEdit
    Left = 120
    Top = 58
    Width = 250
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 3
  end
  object edtProvincia: TUniEdit
    Left = 120
    Top = 82
    Width = 250
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 4
  end
  object edtDistrito: TUniEdit
    Left = 120
    Top = 106
    Width = 250
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 5
  end
  object edtCaserio: TUniEdit
    Left = 120
    Top = 130
    Width = 250
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 6
  end
  object edtRegion_natural: TUniEdit
    Left = 120
    Top = 154
    Width = 250
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 7
  end
  object edtCoorx: TUniEdit
    Left = 120
    Top = 178
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 8
  end
  object edtCoory: TUniEdit
    Left = 120
    Top = 202
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 9
  end
  object edtAltitud: TUniEdit
    Left = 120
    Top = 226
    Width = 100
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 10
  end
  object btnLimpiar: TUniBitBtn
    Left = 10
    Top = 264
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Limpiar'
    TabOrder = 21
    OnClick = btnLimpiarClick
  end
  object btnGuardar: TUniBitBtn
    Left = 140
    Top = 264
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Guardar'
    TabOrder = 22
    OnClick = btnGuardarClick
  end
  object btnSalir: TUniBitBtn
    Left = 270
    Top = 264
    Width = 120
    Height = 28
    Hint = ''
    Caption = 'Salir'
    TabOrder = 11
    OnClick = btnSalirClick
  end
end
