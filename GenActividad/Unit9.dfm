object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Form9'
  ClientHeight = 686
  ClientWidth = 1002
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblCampos: TLabel
    Left = 16
    Top = 361
    Width = 38
    Height = 13
    Caption = 'Campos'
  end
  object laaasfsd: TLabel
    Left = 173
    Top = 361
    Width = 33
    Height = 13
    Caption = 'Etapas'
  end
  object Label1: TLabel
    Left = 128
    Top = 361
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 84
    Width = 477
    Height = 237
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnconect: TButton
    Left = 413
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btnconect'
    TabOrder = 1
    OnClick = btnconectClick
  end
  object btnconsult: TButton
    Left = 413
    Top = 44
    Width = 75
    Height = 25
    Caption = 'btnconsult'
    Enabled = False
    TabOrder = 2
    OnClick = btnconsultClick
  end
  object Edit1: TEdit
    Left = 16
    Top = 8
    Width = 400
    Height = 21
    TabOrder = 3
    Text = 'D:\HSWARE\Devida\Win32\Debug\DEVIDA.FDB'
  end
  object Edit2: TEdit
    Left = 16
    Top = 46
    Width = 400
    Height = 21
    TabOrder = 4
    Text = 'SELECT * FROM ACTIVIDAD'
  end
  object mmo1: TMemo
    Left = 504
    Top = 44
    Width = 485
    Height = 381
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object btngenmv: TButton
    Left = 504
    Top = 8
    Width = 110
    Height = 25
    Caption = 'Gen VMovPadron'
    TabOrder = 6
    OnClick = btngenmvClick
  end
  object btnpasa: TButton
    Left = 16
    Top = 331
    Width = 121
    Height = 25
    Caption = 'btnpasa'
    Enabled = False
    TabOrder = 7
    OnClick = btnpasaClick
  end
  object ListaActividad: TCheckListBox
    Left = 16
    Top = 380
    Width = 101
    Height = 285
    ItemHeight = 13
    TabOrder = 8
  end
  object Button5: TButton
    Left = 620
    Top = 8
    Width = 110
    Height = 25
    Caption = 'Gen VMovPadronVoid'
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 736
    Top = 8
    Width = 110
    Height = 25
    Caption = 'Gen VPadron'
    TabOrder = 10
    OnClick = Button6Click
  end
  object chktotal: TCheckListBox
    Left = 123
    Top = 380
    Width = 42
    Height = 285
    ItemHeight = 13
    TabOrder = 11
  end
  object mmoetapas: TMemo
    Left = 171
    Top = 380
    Width = 262
    Height = 285
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 12
  end
  object mmoBy: TMemo
    Left = 439
    Top = 380
    Width = 54
    Height = 285
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 13
  end
  object mmoField: TMemo
    Left = 503
    Top = 431
    Width = 485
    Height = 114
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 14
  end
  object Edit3: TEdit
    Left = 868
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 15
    Text = 'CREATE'
  end
  object mmoSQL: TMemo
    Left = 499
    Top = 551
    Width = 485
    Height = 114
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 16
  end
  object Base_datos: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = 'localhost'
    Port = 0
    Database = 'DEVIDA.FDB'
    User = ''
    Password = ''
    Protocol = 'firebird-2.5'
    Left = 52
    Top = 116
  end
  object ZQuery1: TZQuery
    Connection = Base_datos
    Params = <>
    Left = 52
    Top = 172
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 52
    Top = 244
  end
  object ZQuery2: TZQuery
    Connection = Base_datos
    Params = <>
    Left = 124
    Top = 172
  end
end
