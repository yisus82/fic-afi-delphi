object Editor: TEditor
  Left = 197
  Top = 114
  Width = 696
  Height = 480
  Caption = 'Editor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 24
    Top = 48
    Width = 289
    Height = 337
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Abrir: TButton
    Left = 376
    Top = 136
    Width = 97
    Height = 33
    Caption = 'Abrir'
    TabOrder = 1
    OnClick = AbrirClick
  end
  object Guardar: TButton
    Left = 376
    Top = 200
    Width = 97
    Height = 33
    Caption = 'Guardar'
    TabOrder = 2
    OnClick = GuardarClick
  end
  object Cerrar: TButton
    Left = 376
    Top = 264
    Width = 97
    Height = 33
    Caption = 'Cerrar'
    TabOrder = 3
    OnClick = CerrarClick
  end
  object Salir: TButton
    Left = 376
    Top = 328
    Width = 97
    Height = 33
    Caption = 'Salir'
    TabOrder = 4
    OnClick = SalirClick
  end
  object MainMenu1: TMainMenu
    Left = 144
    Top = 200
    object MenuFichero: TMenuItem
      Caption = 'Archivo'
      object Abrir1: TMenuItem
        Caption = 'Abrir'
        OnClick = AbrirClick
      end
      object Guardar1: TMenuItem
        Caption = 'Guardar'
        OnClick = GuardarClick
      end
      object Cerrar1: TMenuItem
        Caption = 'Cerrar'
        OnClick = CerrarClick
      end
      object Salir1: TMenuItem
        Caption = 'Salir'
        OnClick = SalirClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Archivos texto|*.txt|Todos los archivos|*.*'
    Left = 72
    Top = 200
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Archivos de texto|*.txt|Todos los archivos|*.*'
    Left = 224
    Top = 200
  end
end
