object Form1: TForm1
  Left = 199
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 248
    Top = 32
    Width = 16
    Height = 13
    Caption = 'Dni'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 248
    Top = 72
    Width = 37
    Height = 13
    Caption = 'Nombre'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 248
    Top = 112
    Width = 45
    Height = 13
    Caption = 'Direccion'
    FocusControl = DBMemo1
  end
  object Label4: TLabel
    Left = 248
    Top = 224
    Width = 25
    Height = 13
    Caption = 'Edad'
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 248
    Top = 264
    Width = 42
    Height = 13
    Caption = 'Telefono'
    FocusControl = DBEdit4
  end
  object Label6: TLabel
    Left = 248
    Top = 304
    Width = 83
    Height = 13
    Caption = 'FechaNacimiento'
    FocusControl = DBEdit5
  end
  object DBEdit1: TDBEdit
    Left = 248
    Top = 48
    Width = 134
    Height = 21
    DataField = 'Dni'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 248
    Top = 88
    Width = 394
    Height = 21
    DataField = 'Nombre'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 248
    Top = 128
    Width = 185
    Height = 89
    DataField = 'Direccion'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 248
    Top = 240
    Width = 134
    Height = 21
    DataField = 'Edad'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 248
    Top = 280
    Width = 264
    Height = 21
    DataField = 'Telefono'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 248
    Top = 320
    Width = 134
    Height = 21
    DataField = 'FechaNacimiento'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBNavigator1: TDBNavigator
    Left = 248
    Top = 376
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 6
  end
  object Button1: TButton
    Left = 88
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Insertar'
    TabOrder = 7
    OnClick = Button1Click
  end
  object BInforme: TButton
    Left = 88
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Informe'
    TabOrder = 8
    OnClick = BInformeClick
  end
  object Query1: TQuery
    DatabaseName = 'Agenda'
    RequestLive = True
    SQL.Strings = (
      
        'INSERT INTO PERSONA VALUES ('#39'123465497'#39','#39'Pepe'#39',null,21,'#39'98154647' +
        '54'#39','#39'01/01/1984'#39')')
    Left = 56
    Top = 32
    object Query1Dni: TStringField
      FieldName = 'Dni'
      Size = 10
    end
    object Query1Nombre: TStringField
      FieldName = 'Nombre'
      Size = 30
    end
    object Query1Direccion: TMemoField
      FieldName = 'Direccion'
      BlobType = ftMemo
      Size = 100
    end
    object Query1Edad: TSmallintField
      FieldName = 'Edad'
    end
    object Query1Telefono: TStringField
      FieldName = 'Telefono'
    end
    object Query1FechaNacimiento: TDateField
      FieldName = 'FechaNacimiento'
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 72
    Top = 88
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'Agenda'
    TableName = 'Persona'
    Left = 112
    Top = 48
    object Table1Dni: TStringField
      FieldName = 'Dni'
      Size = 10
    end
    object Table1Nombre: TStringField
      FieldName = 'Nombre'
      Size = 30
    end
    object Table1Direccion: TMemoField
      FieldName = 'Direccion'
      BlobType = ftMemo
      Size = 100
    end
    object Table1Edad: TSmallintField
      FieldName = 'Edad'
    end
    object Table1Telefono: TStringField
      FieldName = 'Telefono'
    end
    object Table1FechaNacimiento: TDateField
      FieldName = 'FechaNacimiento'
    end
  end
end
