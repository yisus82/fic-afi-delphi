object Calculadora: TCalculadora
  Left = 283
  Top = 168
  Width = 696
  Height = 480
  ActiveControl = Numero1
  Caption = 'Calculadora'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Suma: TLabel
    Left = 312
    Top = 173
    Width = 3
    Height = 16
    Alignment = taCenter
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 0
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Numero1: TEdit
    Left = 72
    Top = 40
    Width = 185
    Height = 21
    TabOrder = 0
    OnExit = Numero1Exit
  end
  object Numero2: TEdit
    Left = 368
    Top = 40
    Width = 185
    Height = 21
    TabOrder = 1
    OnExit = Numero2Exit
  end
  object Sumar: TButton
    Left = 256
    Top = 104
    Width = 113
    Height = 41
    Caption = 'Sumar'
    TabOrder = 2
    OnClick = SumarClick
  end
end
