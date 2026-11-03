object FrmSubirTitulo: TFrmSubirTitulo
  Left = 0
  Top = 0
  ClientHeight = 484
  ClientWidth = 747
  Caption = 'Documentos'
  OnShow = UniFormShow
  OnResize = UniFormResize
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel2: TUniPanel
    Left = 0
    Top = 384
    Width = 747
    Height = 100
    Hint = ''
    Align = alBottom
    TabOrder = 0
    Caption = ''
    object UniPanel5: TUniPanel
      Left = 169
      Top = -1
      Width = 384
      Height = 98
      Hint = ''
      TabOrder = 1
      Caption = ''
      object btnSalir: TUniBitBtn
        Left = 271
        Top = 61
        Width = 70
        Height = 32
        Hint = ''
        Caption = 'Salir'
        TabOrder = 1
        OnClick = btnSalirClick
      end
      object cbbTituloTipo: TUniComboBox
        Left = 16
        Top = 7
        Width = 361
        Hint = ''
        MaxLength = 64
        Text = ''
        TabOrder = 2
        IconItems = <>
      end
      object edtTituloDescripcion: TUniEdit
        Left = 16
        Top = 35
        Width = 361
        Height = 20
        Hint = ''
        CharCase = ecUpperCase
        MaxLength = 254
        Text = ''
        TabOrder = 3
      end
      object btnSubirTitulo: TUniBitBtn
        Left = 43
        Top = 61
        Width = 70
        Height = 32
        Hint = ''
        Caption = 'Subir'
        TabOrder = 4
        OnClick = btnSubirTituloClick
      end
      object btnGuardar: TUniBitBtn
        Left = 119
        Top = 61
        Width = 70
        Height = 32
        Hint = ''
        Caption = 'Guardar'
        TabOrder = 5
        OnClick = btnGuardarClick
      end
      object btnEliminarTitulo: TUniBitBtn
        Left = 195
        Top = 61
        Width = 70
        Height = 32
        Hint = ''
        Caption = 'Eliminar'
        TabOrder = 6
        OnClick = btnEliminarTituloClick
      end
    end
    object lblTituloPath: TUniLabel
      Left = 6
      Top = 5
      Width = 3
      Height = 13
      Hint = ''
      Caption = ''
      TabOrder = 2
    end
  end
  object UniPanel3: TUniPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 384
    Hint = ''
    Align = alClient
    TabOrder = 1
    Caption = ''
    object UniURLFrame1: TUniURLFrame
      Left = 1
      Top = 1
      Width = 745
      Height = 382
      Hint = ''
      Align = alClient
      TabOrder = 1
      ParentColor = False
      Color = clBtnFace
    end
  end
  object UniFileUpload2: TUniFileUpload
    MaxAllowedSize = 10485760
    Filter = 'titulos/*'
    Title = 'Upload'
    Messages.Uploading = 'Subiendo...'
    Messages.PleaseWait = 'Espere...'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Error de Subida'
    Messages.Upload = 'Subir'
    Messages.NoFileError = 'Por favor seleccione un archivo'
    Messages.BrowseText = 'Buscar'
    Messages.UploadTimeout = 'Tiempo de espera agotado'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    OnCompleted = UniFileUpload2Completed
    Left = 668
    Top = 300
  end
end
