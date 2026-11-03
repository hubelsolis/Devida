object frmMensajes: TfrmMensajes
  Left = 0
  Top = 0
  ClientHeight = 103
  ClientWidth = 481
  Caption = 'DEVIDA adendas'
  Color = clGradientActiveCaption
  BorderStyle = bsDialog
  Position = poDesktopCenter
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniButton1: TUniButton
    Left = 192
    Top = 68
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Aceptar'
    TabOrder = 0
    OnClick = UniButton1Click
  end
  object lblMensaje: TUniLabel
    Left = 14
    Top = 12
    Width = 455
    Height = 13
    Hint = ''
    Alignment = taCenter
    AutoSize = False
    Caption = 'lblMensaje'
    ParentFont = False
    Font.Height = -12
    TabOrder = 1
  end
  object lblUrl: TUniLabel
    Left = 16
    Top = 36
    Width = 453
    Height = 16
    Cursor = crHandPoint
    Hint = ''
    Alignment = taCenter
    TextConversion = txtHTML
    AutoSize = False
    Caption = 
      '<a href="http://www2.simdev.gob.pe/Post/Devida/s_login.aspx" tar' +
      'get="_blank">http://www2.simdev.gob.pe/Post/Devida/s_login.aspx<' +
      '/a>'
    ParentFont = False
    Font.Height = -12
    TabOrder = 2
  end
end
