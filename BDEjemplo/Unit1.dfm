object Form1: TForm1
  Left = 199
  Top = 107
  Width = 724
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
    Left = 184
    Top = 32
    Width = 16
    Height = 13
    Caption = 'Dni'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 184
    Top = 72
    Width = 37
    Height = 13
    Caption = 'Nombre'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 184
    Top = 112
    Width = 45
    Height = 13
    Caption = 'Direccion'
    FocusControl = DBMemo1
  end
  object Label4: TLabel
    Left = 184
    Top = 224
    Width = 25
    Height = 13
    Caption = 'Edad'
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 184
    Top = 264
    Width = 42
    Height = 13
    Caption = 'Telefono'
    FocusControl = DBEdit4
  end
  object Label6: TLabel
    Left = 184
    Top = 304
    Width = 101
    Height = 13
    Caption = 'Fecha de Nacimiento'
    FocusControl = DBEdit5
  end
  object LDNI: TLabel
    Left = 430
    Top = 180
    Width = 23
    Height = 13
    Caption = 'DNI'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 184
    Top = 48
    Width = 134
    Height = 21
    DataField = 'Dni'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 184
    Top = 88
    Width = 394
    Height = 21
    DataField = 'Nombre'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 184
    Top = 128
    Width = 185
    Height = 89
    DataField = 'Direccion'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 184
    Top = 240
    Width = 134
    Height = 21
    DataField = 'Edad'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 184
    Top = 280
    Width = 264
    Height = 21
    DataField = 'Telefono'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 184
    Top = 320
    Width = 134
    Height = 21
    DataField = 'FechaNacimiento'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBNavigator1: TDBNavigator
    Left = 176
    Top = 0
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 6
  end
  object BPrincipio: TButton
    Left = 8
    Top = 352
    Width = 60
    Height = 41
    Caption = 'Principio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = BPrincipioClick
  end
  object BAtras: TButton
    Left = 88
    Top = 352
    Width = 60
    Height = 41
    Caption = 'Atras'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = BAtrasClick
  end
  object BCancelar: TButton
    Left = 568
    Top = 352
    Width = 60
    Height = 41
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = BCancelarClick
  end
  object BRefrescar: TButton
    Left = 648
    Top = 352
    Width = 60
    Height = 41
    Caption = 'Refrescar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = BRefrescarClick
  end
  object BAdelante: TButton
    Left = 168
    Top = 352
    Width = 60
    Height = 41
    Caption = 'Adelante'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = BAdelanteClick
  end
  object BFinal: TButton
    Left = 248
    Top = 352
    Width = 60
    Height = 41
    Caption = 'Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = BFinalClick
  end
  object BMas: TButton
    Left = 328
    Top = 352
    Width = 60
    Height = 41
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 25
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = BMasClick
  end
  object BMenos: TButton
    Left = 408
    Top = 352
    Width = 60
    Height = 41
    Caption = '--'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 25
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = BMenosClick
  end
  object BAceptar: TButton
    Left = 488
    Top = 352
    Width = 60
    Height = 41
    Caption = 'Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = BAceptarClick
  end
  object BSuma: TButton
    Left = 24
    Top = 176
    Width = 105
    Height = 81
    Caption = 'Sumar Edades'
    TabOrder = 16
    OnClick = BSumaClick
  end
  object EDNI: TEdit
    Left = 464
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 17
  end
  object BInsertar: TButton
    Left = 608
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Insertar'
    TabOrder = 18
    OnClick = BInsertarClick
  end
  object Table1: TTable
    Active = True
    BeforePost = Table1BeforePost
    OnNewRecord = Table1NewRecord
    DatabaseName = 'Agenda'
    TableName = 'Persona.db'
    Left = 40
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
      DisplayLabel = 'Fecha de Nacimiento'
      FieldName = 'FechaNacimiento'
    end
    object Table1Jubilado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Jubilado'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    OnStateChange = DataSource1StateChange
    OnDataChange = DataSource1DataChange
    Left = 48
    Top = 112
  end
end
