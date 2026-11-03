object frmCambioFenologico: TfrmCambioFenologico
  Left = 0
  Top = 0
  ClientHeight = 298
  ClientWidth = 454
  Caption = 'frmCambioFenologico'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object cbbactividadOR: TUniComboBox
    Left = 58
    Top = 12
    Width = 101
    Hint = ''
    Style = csDropDownList
    Text = ''
    TabOrder = 0
    IconItems = <>
  end
  object UniLabel3: TUniLabel
    Left = 8
    Top = 16
    Width = 44
    Height = 13
    Hint = ''
    Caption = 'Actividad'
    TabOrder = 1
  end
  object cbbetapaOR: TUniComboBox
    Left = 58
    Top = 40
    Width = 101
    Hint = ''
    Style = csDropDownList
    Text = ''
    TabOrder = 2
    IconItems = <>
  end
  object UniLabel1: TUniLabel
    Left = 8
    Top = 44
    Width = 28
    Height = 13
    Hint = ''
    Caption = 'Etapa'
    TabOrder = 3
  end
  object UniBitBtn1: TUniBitBtn
    Left = 182
    Top = 22
    Width = 75
    Height = 25
    Hint = ''
    Caption = '> Migrar >'
    TabOrder = 4
  end
  object cbbActividadDEST: TUniComboBox
    Left = 334
    Top = 12
    Width = 101
    Hint = ''
    Style = csDropDownList
    Text = ''
    TabOrder = 5
    IconItems = <>
  end
  object UniLabel2: TUniLabel
    Left = 284
    Top = 16
    Width = 44
    Height = 13
    Hint = ''
    Caption = 'Actividad'
    TabOrder = 6
  end
  object cbbEtapaDest: TUniComboBox
    Left = 334
    Top = 40
    Width = 101
    Hint = ''
    Style = csDropDownList
    Text = ''
    TabOrder = 7
    IconItems = <>
  end
  object UniLabel4: TUniLabel
    Left = 284
    Top = 44
    Width = 28
    Height = 13
    Hint = ''
    Caption = 'Etapa'
    TabOrder = 8
  end
  object log: TUniMemo
    Left = 8
    Top = 76
    Width = 427
    Height = 201
    Hint = ''
    Lines.Strings = (
      'log')
    TabOrder = 9
  end
end
