object Form4: TForm4
  Left = 199
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Form4'
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
    Left = 152
    Top = 24
    Width = 37
    Height = 13
    Caption = 'Numero'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 152
    Top = 64
    Width = 30
    Height = 13
    Caption = 'Fecha'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 152
    Top = 112
    Width = 60
    Height = 13
    Caption = 'TotalFactura'
  end
  object DBText1: TDBText
    Left = 152
    Top = 128
    Width = 65
    Height = 17
    DataField = 'TotalFactura'
    DataSource = DataSource1
  end
  object DBEdit1: TDBEdit
    Left = 152
    Top = 40
    Width = 134
    Height = 21
    DataField = 'Numero'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 152
    Top = 80
    Width = 134
    Height = 21
    DataField = 'Fecha'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 136
    Top = 168
    Width = 497
    Height = 265
    DataSource = DataSource2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 328
    Top = 64
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 3
  end
  object Table1: TTable
    Active = True
    OnCalcFields = Table1CalcFields
    DatabaseName = 'Agenda'
    TableName = 'Factura'
    Left = 8
    Top = 16
    object Table1Numero: TSmallintField
      FieldName = 'Numero'
    end
    object Table1Fecha: TDateField
      FieldName = 'Fecha'
    end
    object Table1TotalFactura: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalFactura'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 48
    Top = 16
  end
  object Table2: TTable
    Active = True
    AfterPost = Table2AfterPost
    AfterDelete = Table2AfterDelete
    OnCalcFields = Table2CalcFields
    DatabaseName = 'Agenda'
    IndexFieldNames = 'NumFac'
    MasterFields = 'Numero'
    MasterSource = DataSource1
    TableName = 'Linea'
    Left = 8
    Top = 64
    object Table2NumFac: TSmallintField
      FieldName = 'NumFac'
    end
    object Table2Linea: TSmallintField
      FieldName = 'Linea'
    end
    object Table2Cantidad: TSmallintField
      FieldName = 'Cantidad'
    end
    object Table2Producto: TStringField
      FieldName = 'Producto'
    end
    object Table2Precio: TCurrencyField
      FieldName = 'Precio'
    end
    object Table2TotalLinea: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalLinea'
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 48
    Top = 64
  end
end
