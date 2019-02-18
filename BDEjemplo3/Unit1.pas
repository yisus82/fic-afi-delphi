unit Unit1;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables;

type
  TDataModule1 = class(TDataModule)
    Query1Numero: TSmallintField;
    Query1Fecha: TDateField;
    Query2NumFac: TSmallintField;
    Query2Linea: TSmallintField;
    Query2Cantidad: TSmallintField;
    Query2Producto: TStringField;
    Query2Precio: TCurrencyField;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query2: TQuery;
    DataSource2: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.DFM}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  Query1.Open;
  Query2.Open;
end;

end. 