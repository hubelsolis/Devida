object UniForm1: TUniForm1
  Left = 0
  Top = 0
  ClientHeight = 484
  ClientWidth = 747
  Caption = 'Documentos'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 31
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    object lblDescripcion: TUniLabel
      Left = 15
      Top = 7
      Width = 64
      Height = 13
      Hint = ''
      Caption = 'lblDescripcion'
      TabOrder = 1
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 436
    Width = 747
    Height = 48
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    object UniPanel4: TUniPanel
      Left = 1
      Top = 1
      Width = 429
      Height = 46
      Hint = ''
      Align = alClient
      TabOrder = 1
      Caption = ''
      object edtImgPath: TUniEdit
        Left = 1
        Top = 11
        Width = 427
        Hint = ''
        Text = 'edtImgPath'
        Align = alTop
        TabOrder = 1
      end
      object UniPanel6: TUniPanel
        Left = 1
        Top = 1
        Width = 427
        Height = 10
        Hint = ''
        Align = alTop
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
      end
    end
    object UniPanel5: TUniPanel
      Left = 430
      Top = 1
      Width = 316
      Height = 46
      Hint = ''
      Align = alRight
      TabOrder = 2
      Caption = ''
      object btnSubirTitulo: TUniBitBtn
        Left = 4
        Top = 6
        Width = 74
        Height = 32
        Hint = ''
        Caption = 'Subir'
        TabOrder = 1
      end
      object btnGuardarTitulo: TUniBitBtn
        Left = 82
        Top = 6
        Width = 74
        Height = 32
        Hint = ''
        Caption = 'Guardar'
        TabOrder = 2
      end
      object btnEliminarTitulo: TUniBitBtn
        Left = 160
        Top = 6
        Width = 74
        Height = 32
        Hint = ''
        Caption = 'Eliminar'
        TabOrder = 3
      end
      object btnSalir: TUniBitBtn
        Left = 237
        Top = 6
        Width = 74
        Height = 32
        Hint = ''
        Caption = 'Salir'
        TabOrder = 4
        OnClick = btnSalirClick
      end
    end
  end
  object UniPanel3: TUniPanel
    Left = 0
    Top = 31
    Width = 747
    Height = 405
    Hint = ''
    Align = alClient
    TabOrder = 2
    Caption = ''
    object imgTitulo: TUniImage
      Left = 1
      Top = 1
      Width = 745
      Height = 403
      Hint = ''
      Stretch = True
      Align = alClient
    end
  end
end
